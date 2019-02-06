#!/bin/bash

supported_ext=(wav wma mp3)


path=$(pwd)
converted_path="$(pwd)/converted"

echo "Path $(pwd)"
echo "Converted path $converted_path"
echo ""

# rename files to exclude spaces in names
for file in *
  do 
    mv "$file" ${file// /_}
  done

file_list=$(ls $path/)

# make output dir
mkdir -p $converted_path

echo ""
echo "Files in directory:"
echo "$file_list"

for file_name in ${file_list[*]}
  do
    #echo "File $file_name"
    file_only_name=${file_name%.*}
    file_ext=${file_name##*.}
    for ext in ${supported_ext[*]}
      do
        if [[ "$ext" == "$file_ext" ]]
          then
            echo ""
            echo ""
            echo "File $file_name is supported"
            echo "Filemname $file_only_name"
            echo "Format $file_ext"
            echo ""
            echo "Convert $file_name"
            echo ""
            ffmpeg -hide_banner -loglevel info -i $path/$file_name $converted_path/$file_only_name".mp3"
            echo ""
            echo ""
            echo "Done converting"
            
        fi
      done
  done


