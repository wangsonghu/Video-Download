#!/bin/bash
#

ls -l | grep -E "^d" | awk '{print $NF}'| while read Dir; do
    cd ${Dir}
    find . -name *.ts -exec mv {} . \;
    >filelist.txt
    ls -1 [0-9].ts | while read File; do
        echo "file '${File}'" >>filelist.txt
    done
    cd ..

    cd ${Dir}
    ls -1 [1-9][0-9].ts | while read File; do
        echo "file '${File}'" >>filelist.txt
    done
    cd ..

    cd ${Dir}
    ls -1 [1-9][0-9][0-9].ts | while read File; do
        echo "file '${File}'" >>filelist.txt
    done
    cd ..
done

ls -l | grep -E "^d" | awk '{print $NF}'| while read Dir; do
    echo "cd ${Dir}; ffmpeg -f concat -i filelist.txt -acodec copy -vcodec copy out.mp4; pwd; cd .."
done
#find . -name out.mp4 | while read line; do echo "mv $line `echo $line | sed -r 's#.*/([0-9]+)/.*#\1.[狐妖小红娘][2015][tencent][国漫][TV].mp4#g'`"; done
