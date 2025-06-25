Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D762AC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 19:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCwVhyi7LrS0Mr9IkZPeUKS3dkG/nZ+Hto/3dQfFA64=; b=jvpug666XvptQ6Bk+clisYpC2O
	QVFSJ2G1naJMS8vSFjHzQyuZxHKi/q014lym6/GVRoMG/D2TdPfreJAIgWGDB1wegKXbN41oAff5U
	IQJFMboN7RMORv6ZHstq4s3JxpeNRqkAcBhGtx4TidHhKF+/bumBtzOeSclC80Si9Y1PT+hjHuF2m
	4NyBzgzMO/4YZsEEvU6NjjCc4kRU7+ZPcIvXHQ31lJvfhHYO/o0RPrapncNTfTSL5PA+Q68OdRYYD
	ZuLo2sTW6aIqY2xGb3FMSbpEPOzjg7dLXYnKYh6Kk+ftnESvrN2/EEG3iSM+baBEcVt6U0fHK6EuY
	1wB1EcYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWBY-00000009n2l-0Pkv;
	Wed, 25 Jun 2025 19:53:32 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUSHz-000000099dT-0nL5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 15:43:56 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2363616a1a6so100255ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 08:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750866234; x=1751471034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCwVhyi7LrS0Mr9IkZPeUKS3dkG/nZ+Hto/3dQfFA64=;
        b=A68TAsLWOv/B5Xikiz/qFka8ADYmmFcuOn5Je6iFgaD/aYzorbf87tnDgb2XOyHg4d
         W82EEjLZSucefxgjR7n4GgBcQMI2wdnmDyLS55+HB9LFod4XHa3W1EtZXeYEYhBe5fLR
         0v0y3GwJNUnUbcF1lmS8AVRlAffxGg6Uj+MeQadXXbP8QWGcg5DhNuXFHtm5H3anETjs
         6VZhrtcl2xOFAh05VCRtkqiR817c+R187tDMBvijM11rC+tBXL/ne8rN79ufC4qlYgbn
         GA756WMWQSuSAfjkGwkfhj8ps333+zf8mRLom/n1ivOmEnSGrTx0d9gX9oGxhu4Rqpeu
         quyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750866234; x=1751471034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCwVhyi7LrS0Mr9IkZPeUKS3dkG/nZ+Hto/3dQfFA64=;
        b=jcJrD4UADai9w6LDY07cQeRslc5sECdUoBv3ib7ko/ag2tgQkA1qaS+UwX/KApyGcz
         fI5DSAeDa8dy5LmqFR4+A5KpKcflYZYnxUAUs+88X5kHUj2j4glj5IngY44rsrqWCX7E
         +hZXQEfk9iqS+ljzkKJM9SusQxMuxXrswrVtOujj5WP2xO5s70BOUpUNh5e4GHME4NA4
         zBhhhuaM+PXSVEIwYPm0J55Ys/LVK0kYr+t4hRz+jZuvw/m1S+JQ+iAqDdCjad71/QUm
         0EeHcGi9BvKNe44xp1aaMfCIdKy4qrZVygaHC2lWA5GHzIrP/m2ccDIPYvYAdPC4ofqD
         R2mg==
X-Gm-Message-State: AOJu0YzDaXgzVsbeWobVQY2Cc9ZZI//ofWXhSzJNpmimnlEkZ7sNPuH4
	EvDW9vpFor0Y/QeqBUVUeNHm6/gFR+7cBHb3hZcepStprTbdi30ET8uK
X-Gm-Gg: ASbGncuPg8n8eLx2yQ1dkDXsnZ+hu7s+Po7ehBgtXJmNt5IrunAG3e48zLkGmWKZNgt
	18u82+mFH5SuwlTCXZkVXfae9zfNrJa1hdkV1pcbCDT1ekRWvAHuyNx3t/ObZ+QuZKH8vJ5XF++
	I19jItp57YRF2+0gPCyfOm83syhs9RDNER6u/JNnJ7pUHTSmuNOKgTXHJ+7Rh/0I0Ht9iS0tXan
	amIXL1mpx9UNNXWpGqgVzOUWUQCM1h7UFGOFqHzOWlpBpCY5yf4Cod+VsMku8KDALJ02ieA3KVS
	5rwmQ3yQxm7nTNgCyFMpfyABYDu4vsV36BtoMliSdTcBGD27q/zx9RohQnSvXNHRAQ==
X-Google-Smtp-Source: AGHT+IHN92Qo+dvAQ+28gXK4ziIoW7+YAMLhjXmIJg8gQMeMAzSdi5uWrQ0PalJRetFQ24Rbp1Pf8A==
X-Received: by 2002:a17:902:e881:b0:234:909b:3dba with SMTP id d9443c01a7336-23823fe1503mr62865065ad.20.1750866234331;
        Wed, 25 Jun 2025 08:43:54 -0700 (PDT)
Received: from ubu24.. ([2400:2410:dfca:c200:951d:3a1e:f612:1525])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86628ffsm134229795ad.156.2025.06.25.08.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:43:51 -0700 (PDT)
From: Taishi Shimizu <s.taishi14142@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Rafal Milecki <zajec5@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Taishi Shimizu <s.taishi14142@gmail.com>
Subject: [PATCH 2/2] ARM: dts: BCM5301X: Add support for Buffalo WXR-1750DHP
Date: Thu, 26 Jun 2025 00:43:15 +0900
Message-ID: <20250625154315.114139-2-s.taishi14142@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250625154315.114139-1-s.taishi14142@gmail.com>
References: <20250625154315.114139-1-s.taishi14142@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_084355_229580_FEF051AE 
X-CRM114-Status: GOOD (  16.10  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add initial device tree support for the Buffalo WXR-1750DHP, a consumer Wi-Fi
router based on the Broadcom BCM4708A0 SoC.

Hardware specifications:
* Processor: Broadcom BCM4708A0 dual-core @ 800 MHz
* RAM: DDR3 256 MB
* Ethernet Switch: Broadcom BCM53011 integrated via SRAB
* NAND Flash: 128 MB (8-bit ECC)
* SPI Flash: None
* Ports: 4 LAN Ports, 1 WAN Port
* USB: 1x USB 3.0 Type-A port

Signed-off-by: Taishi Shimizu <s.taishi14142@gmail.com>
---
 arch/arm/boot/dts/broadcom/Makefile           |   1 +
 .../broadcom/bcm4708-buffalo-wxr-1750dhp.dts  | 134 ++++++++++++++++++
 2 files changed, 135 insertions(+)
 create mode 100644 arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts

diff --git a/arch/arm/boot/dts/broadcom/Makefile b/arch/arm/boot/dts/broadcom/Makefile
index 71062ff9adbe..2552e11b5e31 100644
--- a/arch/arm/boot/dts/broadcom/Makefile
+++ b/arch/arm/boot/dts/broadcom/Makefile
@@ -51,6 +51,7 @@ dtb-$(CONFIG_ARCH_BCMBCA) += \
 dtb-$(CONFIG_ARCH_BCM_5301X) += \
 	bcm4708-asus-rt-ac56u.dtb \
 	bcm4708-asus-rt-ac68u.dtb \
+	bcm4708-buffalo-wxr-1750dhp.dtb \
 	bcm4708-buffalo-wzr-1750dhp.dtb \
 	bcm4708-buffalo-wzr-1166dhp.dtb \
 	bcm4708-buffalo-wzr-1166dhp2.dtb \
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
new file mode 100644
index 000000000000..43a4a8e58b40
--- /dev/null
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Author: Taishi Shimizu <s.taishi14142@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm4708.dtsi"
+#include "bcm5301x-nand-cs0-bch8.dtsi"
+
+/ {
+	compatible = "buffalo,wxr-1750dhp", "brcm,bcm4708";
+	model = "Buffalo WXR-1750DHP";
+
+	chosen {
+		bootargs = "console=ttyS0,115200";
+	};
+
+	memory@0 {
+		reg = <0x00000000 0x08000000>,
+		      <0x88000000 0x08000000>;
+		device_type = "memory";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-aoss {
+			label = "AOSS";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&chipcommon 2 GPIO_ACTIVE_LOW>;
+		};
+
+		/* GPIO 8 and 9 are a tri-state switch button with
+		 * ROUTER / AP / WB.
+		 */
+		button-bridge {
+			label = "WB";
+			linux,code = <BTN_2>;
+			linux,input-type = <EV_SW>;
+			gpios = <&chipcommon 8 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* GPIO 3 is a switch button with AUTO / MANUAL. */
+		button-manual {
+			label = "MANUAL";
+			linux,code = <BTN_0>;
+			linux,input-type = <EV_SW>;
+			gpios = <&chipcommon 3 GPIO_ACTIVE_HIGH>;
+		};
+
+		button-restart {
+			label = "Reset";
+			linux,code = <KEY_RESTART>;
+			gpios = <&chipcommon 11 GPIO_ACTIVE_LOW>;
+		};
+
+		button-router {
+			label = "ROUTER";
+			linux,code = <BTN_1>;
+			linux,input-type = <EV_SW>;
+			gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-power0 {
+			label = "bcm53xx:white:power";
+			linux,default-trigger = "default-on";
+			gpios = <&chipcommon 5 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-power1 {
+			label = "bcm53xx:amber:power";
+			gpios = <&chipcommon 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-router0 {
+			label = "bcm53xx:amber:router";
+			gpios = <&chipcommon 14 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-router1 {
+			label = "bcm53xx:white:router";
+			gpios = <&chipcommon 15 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-usb {
+			label = "bcm53xx:green:usb";
+			gpios = <&chipcommon 4 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-wan {
+			label = "bcm53xx:white:wan";
+			gpios = <&chipcommon 7 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+		};
+
+		port@1 {
+			label = "lan4";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "lan2";
+		};
+
+		port@4 {
+			label = "lan1";
+		};
+	};
+};
+
+&usb3 {
+	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+};
+
+&usb3_phy {
+	status = "okay";
+};
-- 
2.43.0


