Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F32C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 07:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5F1ZO24wNNY+5sou67j5rv4c9r5fzLMbsPh7vrdpai0=; b=W21mK+Y+79oNauTKwHm/Hj5ZYG
	B3BL9EqYepWkxlUqhQMJbb1A2L+gokU3S7XhNCrBR9XVFWcOEaYDOY77XgjuYVJZY02VH3c/ZYfEz
	8td+IGq0jDWPtoS41BLmYgMKRv+0vlzPsHWfvQZifHCClTY5yNep++xwOQY1fmant1lQvRX9Zttft
	WspIv1w38M15G0jquI07S7jq/ZDK+PCs/vg6/U3wFQ/JItuR9z0B8wyk+GtRoioRLTfgcB9p58EtN
	SPqzVowIpp+UKb9hdODD+xio60WLfMIf6UKXjbHHdHNEgy3rQj1frN6vDzje8cXjjczxeiKPIA8Dj
	pS8dbmjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uar7n-0000000HSJT-13Bz;
	Sun, 13 Jul 2025 07:27:51 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaqzE-0000000HRdK-3sAY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 07:19:02 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-23508d30142so34674365ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 00:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752391140; x=1752995940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5F1ZO24wNNY+5sou67j5rv4c9r5fzLMbsPh7vrdpai0=;
        b=ja6efgSn8PsbuancioCJ4cVoS/Dnt5yrJ0VGmy1K7R43ujomOFFN+o4LneQ6yN10BA
         Ces8aq86j76Ltsqv5xx1+5QkKdLfQDaR2sdhWQYFcF73sXBOAP7vj7FeP5eaC93BJ8D6
         jlk0OzCZn0O5UV9W9nc4/8Qi6qpejqnMDFTLfwAAH7/9dQ3b5/f+Bk0dbcCiUDuIZYmC
         M2KobUIYn32HWZvl47k/J3L/eSzrNT+ivpIt3JYyND8J0ShWRx7oWNp4eWg8WOs3+5tr
         11jHFG/RV1mnk99XDFLt40ZiwR0+5K3ZjNHtVoMGJLE8SHEhBQ8t5wcXAoSCRrnNLBu8
         xvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752391140; x=1752995940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5F1ZO24wNNY+5sou67j5rv4c9r5fzLMbsPh7vrdpai0=;
        b=l1jHKcsAPMk0bLYX0Zy/FTM9Qwj1jZ4IWaJheoWEu5DENwh+zka7aCELCOXLd6gigp
         z6FLrGvGJcuW3QdJ+0oszhADTm02vc/pDk3pBa+CETUC3FPp1vckBsv0eSRHjjs7Y+uJ
         YSdwWT2NmIp9qxidz2I00QPEZZ0K+eFXldUJBmMnAjjHr7hdEWCXawkIG7fetE3MJVwd
         AAYO+3PpCMt7R2XQl4E+Z28wIQ9xxN7BGeoJ7w+dc9NZTM7QMu5FePKK+Z69m1Vl5JAd
         vdYuSWNier721KnORYVau3VUyVS6qz5T2VUNLiv9I2h0XIFJm7+wDTny4nYAn4cTr65w
         yaow==
X-Gm-Message-State: AOJu0YzisE2xnJV5sq6DY+E0DneWIKTYj3daKVESquQ6WLsVy7zeo7do
	BR5Swojs3QLCGds8QW4zZbO/q0aJW9LhwB4Hy5Lz5gkVZd5JVGMMmH5g
X-Gm-Gg: ASbGnctLUzRDHC+D6OnYxYJl2UlGvxEozUW2V8hTUgtWpZ7YBFWL5nm3YAEaL70rXpm
	DsoJY3Krr/ypoG08saWuZq4O0kq5/99wPXi1BosRxUiz227bw4wdN7PSdFk8uAdy2ZWTRzI5CMz
	+jRQdNGx8Na+F4Pwcvu8DAgXeAmpNRBsSeK5BOSxcOzC2DseUVf0kgn6wkyQgIGiVpzaoUGEJrl
	OwXpdI7UBpjVz2R1oxtmFSt7+fsYjApO4LTeTpalpyDkS7LPref6TIYL77pB1Ke1MHtwTvsJR7R
	3hHBb7t37LezfSGtn2Me86mIpq2QA3o6XSb6gjPRR5N0E6kibT3qfnCaIoZkRzF47FlVZsCicFU
	OC9z7QsZse4w0avlM8008VCvZgQ==
X-Google-Smtp-Source: AGHT+IGtfwjhV2H9OBfrlIM3+l+YVqFoInY2+1bUWH5A+M0gen9iQq7FCd1GpdQVaexjxABbsRCv0g==
X-Received: by 2002:a17:902:ce10:b0:21f:1202:f2f5 with SMTP id d9443c01a7336-23dede2dff2mr131512825ad.8.1752391140178;
        Sun, 13 Jul 2025 00:19:00 -0700 (PDT)
Received: from ubu24.. ([2400:2410:dfca:c200:3d5e:f962:c950:134e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4322db2sm75239065ad.100.2025.07.13.00.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 00:18:59 -0700 (PDT)
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
Subject: [PATCH v2 2/2] ARM: dts: BCM5301X: Add support for Buffalo WXR-1750DHP
Date: Sun, 13 Jul 2025 16:18:25 +0900
Message-ID: <20250713071826.726682-3-s.taishi14142@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250713071826.726682-1-s.taishi14142@gmail.com>
References: <20250713071826.726682-1-s.taishi14142@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_001901_409997_B0684A09 
X-CRM114-Status: GOOD (  15.93  )
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
 .../broadcom/bcm4708-buffalo-wxr-1750dhp.dts  | 138 ++++++++++++++++++
 2 files changed, 139 insertions(+)
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
index 000000000000..f5c95c9a712e
--- /dev/null
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Author: Taishi Shimizu <s.taishi14142@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm4708.dtsi"
+#include "bcm5301x-nand-cs0-bch8.dtsi"
+#include <dt-bindings/leds/common.h>
+
+/ {
+	compatible = "buffalo,wxr-1750dhp", "brcm,bcm4708";
+	model = "Buffalo WXR-1750DHP";
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
+			gpios = <&chipcommon 2 GPIO_ACTIVE_LOW>;
+			label = "AOSS";
+			linux,code = <KEY_WPS_BUTTON>;
+		};
+
+		/* GPIO 3 is a switch button with AUTO / MANUAL. */
+		button-manual {
+			gpios = <&chipcommon 3 GPIO_ACTIVE_HIGH>;
+			label = "MANUAL";
+			linux,code = <BTN_0>;
+			linux,input-type = <EV_SW>;
+		};
+
+		button-restart {
+			gpios = <&chipcommon 11 GPIO_ACTIVE_LOW>;
+			label = "Reset";
+			linux,code = <KEY_RESTART>;
+		};
+
+		/* GPIO 8 and 9 are a tri-state switch button with
+		 * ROUTER / AP / WB.
+		 */
+		button-router {
+			gpios = <&chipcommon 8 GPIO_ACTIVE_LOW>;
+			label = "ROUTER";
+			linux,code = <BTN_1>;
+			linux,input-type = <EV_SW>;
+		};
+
+		button-wb {
+			gpios = <&chipcommon 9 GPIO_ACTIVE_LOW>;
+			label = "WB";
+			linux,code = <BTN_2>;
+			linux,input-type = <EV_SW>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-internet {
+			color = <LED_COLOR_ID_WHITE>;
+			function = "internet";
+			gpios = <&chipcommon 7 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-power0 {
+			color = <LED_COLOR_ID_AMBER>;
+			function = LED_FUNCTION_POWER;
+			gpios = <&chipcommon 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-power1 {
+			color = <LED_COLOR_ID_WHITE>;
+			function = LED_FUNCTION_POWER;
+			gpios = <&chipcommon 5 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-router0 {
+			color = <LED_COLOR_ID_AMBER>;
+			function = "router";
+			gpios = <&chipcommon 14 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-router1 {
+			color = <LED_COLOR_ID_WHITE>;
+			function = "router";
+			gpios = <&chipcommon 15 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-usb {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_USB;
+			gpios = <&chipcommon 4 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "usbport";
+			trigger-sources = <&xhci_port1 &ehci_port1 &ohci_port1>;
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


