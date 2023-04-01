import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: win
    visible: true
    width: 800
    height: 600

    property int sizeUnit: sizeSlider.value

    Slider {
        id: sizeSlider
        orientation: Qt.Vertical
        height: 200
        anchors.right: parent.right
        anchors.margins: 30
        from: 50
        to: 200
        value: 100
    }

    Block {
        id: head
        h: 1
        w: 1
        color: "brown"
        anchors.bottom: body.top // присоединяем низ головы к верху туловища
        anchors.horizontalCenter: body.horizontalCenter // и центрируем
        anchors.bottomMargin: -border.width

        Block {
            id: leftEye
            round: true
            w: 0.2
            h: 0.2
            color: "green"
            anchors.verticalCenter: head.top
            anchors.horizontalCenter: head.left
            anchors.verticalCenterOffset: head.height/4
            anchors.horizontalCenterOffset: head.width/4
        }
        Block {
            id: rightEye
            round: true
            w: 0.2
            h: 0.2
            color: "green"
            anchors.verticalCenter: head.top
            anchors.horizontalCenter: head.right
            anchors.verticalCenterOffset: head.height/4
            anchors.horizontalCenterOffset: -head.width/4
        }

        Block {
            id: nose
            h: 0.2
            w: h
            color: "red"
            anchors.centerIn: head // центрируем по центру головы
        }

        Block {
            id: mouth
            w: 0.8
            h: 0.2
            color: "white"
            anchors.verticalCenter: head.bottom
            anchors.horizontalCenter: head.horizontalCenter
            anchors.verticalCenterOffset: -head.height/4
        }

    }

    Block {
        id: body
        x: 300
        y: 300
        w: 1.4
        h: 1.8
        color: "grey"

        DragHandler {
        }

        Block {
            id: leftHand
            w: 0.8
            h: 0.4
            color: "lightblue"
            anchors.top: body.top
            anchors.right: body.left
            anchors.rightMargin: -border.width
        }

        Block {
            id: rightHand
            w: 0.8
            h: 0.4
            color: "lightblue"
            anchors.top: body.top
            anchors.left: body.right
            anchors.leftMargin: -border.width
        }

        Block {
            id: leftLeg
            w: 0.5
            h: 1
            color: "lightblue"
            anchors.left: body.left
            anchors.top: body.bottom
            anchors.topMargin: -border.width

            Block {
                id: leftFoot
                w: parent.w
                h: w
                z: -1
                color: parent.color
                round: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.bottom
                anchors.topMargin: -height/4
            }
        }
        Block {
            id: rightLeg
            w: 0.5
            h: 1
            color: "lightblue"
            anchors.right: body.right
            anchors.top: body.bottom
            anchors.topMargin: -border.width

            Block {
                id: rightFoot
                w: parent.w
                h: w
                z: -1
                color: parent.color
                round: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.bottom
                anchors.topMargin: -height/4
            }
        }
    }

}
