Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C28CC02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 17:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MfnXh4xNEl2veLLUMoW2fFOfVxeDxb438BEqj2RkATs=; b=Nkb1E6+NX2br8gF3E4n1ta7rFo
	F5KDg284G35Pa6pZjdb56BmvfuwR44nwNV6BXkQnsiHPR5XCyrhj6To2CJPrbfCjqBfixjr8J4E3e
	vTwQYBZEjGi8iQLpKFf05ZNFfxwht2eMxraUBjnOBg8fZcZS+nNUbeSOp8IbGtswStSuUnm17+JwH
	rTZUBl85RgwVAF+j8dciXiQZdaL2WKXcSY98zBY1nOUVaPHTLlFt/c4cKhT9FLArvqKO3xegMAOii
	sBQJvw4vzzJfreUC4gpLFhi/wVyeUFK0pmk5KY2KFFzubln3xgFxXqJKocFSaqAunDVdCXOJe85g6
	GhnrgC+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpz2-00000000wSk-15AB;
	Fri, 17 Jan 2025 17:18:12 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYprD-00000000uYJ-2sRz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 17:10:08 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aa68b513abcso434511666b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 09:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737133806; x=1737738606; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfnXh4xNEl2veLLUMoW2fFOfVxeDxb438BEqj2RkATs=;
        b=hPzrlFQKzAGnryyNP3v9rAHcAX/IR5D8LMOxYl9zBhPtusGEouxYLGJtZjmtNZTyqE
         D7SkEJo+//uB0N20QJpH6WoEDRYFQsZHeh/PITIN+N7U1yeVrq5W3QXOE0xiVyLuYXu6
         E5Pw9g7GITyQ7Q7GWmCHMx9B0aYF7nHWjSgvN/nafsD2cKohvnmrVa09W/caUqFr1f+a
         66TW5WtqjxIoeqNytyz/YdWPMKbp2xGSHnFGOgzHK1xOkDdLXLNemZ8aIXgQNsCEfQrD
         7Y5PjBXO10ZT4sLo8BBs3KX7/MZZQbQuWzzG7xn26qOTk+vBKy4raZaQi5HSmARahwa4
         E0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737133806; x=1737738606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfnXh4xNEl2veLLUMoW2fFOfVxeDxb438BEqj2RkATs=;
        b=WCdlr6aay+DmemvD9puSF/oVrGizLKMQLrwNRikfEViWnbOjWlFfvfmYi2GEekylqh
         hKjlC300fPzHgyLetOnF+uFCymlEp/HfNEsNa01nXcWbx2x7yhQyfCbvMqkuOK9mgeww
         j7125P9M/0s/7Lkv2aRr4n2R8XFJaLOeQaeQsdo3SGLK+KDzIEp6DAVpEqixH9iXRUyA
         PhLYngQxV4bqH1GUCmwpFz2iaPibWY7JPEgO/VJFk0kpFwuKMzYfR9/NtKQDpU7ZeiTn
         cPn+B/QtRnVZPwOIpOy/9/y1ooH9nltFfPjom7sASfiShKSiyKDq889fFw9WCMFJaXMo
         64FA==
X-Forwarded-Encrypted: i=1; AJvYcCXYzTzIZUwymGf6+1LcqOIDzHYBvfd4TLCVsyyFC0p1S0d2ptwYpIT+3B29A1MnGvmc/OEDL7cd7n0kqwE8GzL9@lists.infradead.org
X-Gm-Message-State: AOJu0YwsuZymD9hrGc9MrAojecvEqNjInWfukU+hVjrlME/fSJHfUj6M
	Aw8C469tZxYx4x0pNI5nxb/bU99seF6ssTV3aRNgZJF+7xzAOoIAUFGnua6GHrQ=
X-Gm-Gg: ASbGnctB2n4dIsRF1jGEqibvfVcrdq2RdtorfwBEiH3quo0wnerY7j9ZkiiIEkmpm4U
	mkmFaGcFOlWXrcod3iVmRH7ItPWV6z9a+hQaQ2qBGMDA3iorXwGvsyAKrPjo1udLVCcBtlgVO+c
	0TXIb5iYka28+JEQILmHPkC7cLtwjZIhKMWa9BTyT8TU2InuXa1J3f+ywKZr2Clq1jIPuG1snk6
	qsxjAaz0HggaoTbWBL57AksOQgfXuwBa/U1nVSpRH2crWVM9vQB1XHguaI3LztbJ6naFcEeSj61
	jUKouuIxkdFN+OP9nFCas9ZOLm7/ZVKdzGOr+tKB
X-Google-Smtp-Source: AGHT+IGO2k9zmqpedfG17qLS9EqiIeFYPlFsb7tvN+iv0GH4peIlK9YZK62ZtqRxsVP1aji62RVIHQ==
X-Received: by 2002:a17:907:706:b0:ab3:2b9a:4a5a with SMTP id a640c23a62f3a-ab38b3c6a1emr357999966b.51.1737133799124;
        Fri, 17 Jan 2025 09:09:59 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f87065sm199197966b.133.2025.01.17.09.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 09:09:58 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 17 Jan 2025 17:09:56 +0000
Subject: [PATCH v4 3/4] arm64: dts: exynos: gs101-oriole: move common
 Pixel6 & 6Pro parts into a .dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250117-gs101-simplefb-v4-3-a5b90ca2f917@linaro.org>
References: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
In-Reply-To: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_091007_733907_9702DA78 
X-CRM114-Status: GOOD (  19.39  )
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

In order to support Pixel 6 (Oriole), Pixel 6 Pro (Raven), Pixel 6a
(Bluejay), and all other versions correctly, we have to be able to
distinguish them properly as we add support for more features.

For example, Raven has a larger display. There are other differences,
like battery design capacity, etc.

Move all the parts that are common for now into a
gs101-pixel-common.dtsi, and just leave the display related things in
gs101-oriole.dts.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: MAINTAINERS doesn't need updating, it covers this whole directory

v3:
- separate DTBs for Pixel 6 and Pixel 6 Pro like in v1 (Krzysztof)
- override/extend nodes ordered by label name (Krzysztof)
- name common include gs101-pixel-common.dtsi instead of
  gs101-raviole.dtsi

v2:
- use a generic gs101-based Pixel base board DTB with different
  additions to it that make up the different versions 6, 6Pro, 6a,
  etc.) using overlays, rather than one DTB per version to avoid
  needless increase of binary sizes and reflect reality
- switch to memory-region instead of reg for framebuffer memory
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 284 +--------------------
 .../{gs101-oriole.dts => gs101-pixel-common.dtsi}  |  15 +-
 2 files changed, 14 insertions(+), 285 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index d3dd411c9bd0..8df42bedbc03 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -8,290 +8,22 @@
 
 /dts-v1/;
 
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/usb/pd.h>
-#include "gs101-pinctrl.h"
-#include "gs101.dtsi"
+#include "gs101-pixel-common.dtsi"
 
 / {
 	model = "Oriole";
 	compatible = "google,gs101-oriole", "google,gs101";
-
-	aliases {
-		serial0 = &serial_0;
-	};
-
-	chosen {
-		/* Bootloader expects bootargs specified otherwise it crashes */
-		bootargs = "";
-		stdout-path = &serial_0;
-
-		/* Use display framebuffer as setup by bootloader */
-		framebuffer0: framebuffer-0 {
-			compatible = "simple-framebuffer";
-			memory-region = <&cont_splash_mem>;
-			width = <1080>;
-			height = <2400>;
-			stride = <(1080 * 4)>;
-			format = "a8r8g8b8";
-		};
-	};
-
-	gpio-keys {
-		compatible = "gpio-keys";
-		pinctrl-0 = <&key_voldown>, <&key_volup>, <&key_power>;
-		pinctrl-names = "default";
-
-		button-vol-down {
-			label = "KEY_VOLUMEDOWN";
-			linux,code = <KEY_VOLUMEDOWN>;
-			gpios = <&gpa7 3 GPIO_ACTIVE_LOW>;
-			wakeup-source;
-		};
-
-		button-vol-up {
-			label = "KEY_VOLUMEUP";
-			linux,code = <KEY_VOLUMEUP>;
-			gpios = <&gpa8 1 GPIO_ACTIVE_LOW>;
-			wakeup-source;
-		};
-
-		button-power {
-			label = "KEY_POWER";
-			linux,code = <KEY_POWER>;
-			gpios = <&gpa10 1 GPIO_ACTIVE_LOW>;
-			wakeup-source;
-		};
-	};
-
-	/* TODO: Remove this once PMIC is implemented  */
-	reg_placeholder: regulator-0 {
-		compatible = "regulator-fixed";
-		regulator-name = "placeholder_reg";
-	};
-
-	/* TODO: Remove this once S2MPG11 slave PMIC is implemented  */
-	ufs_0_fixed_vcc_reg: regulator-1 {
-		compatible = "regulator-fixed";
-		regulator-name = "ufs-vcc";
-		gpio = <&gpp0 1 GPIO_ACTIVE_HIGH>;
-		regulator-boot-on;
-		enable-active-high;
-	};
-
-	reserved-memory {
-		cont_splash_mem: splash@fac00000 {
-			reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
-			no-map;
-		};
-	};
-};
-
-&ext_24_5m {
-	clock-frequency = <24576000>;
-};
-
-&ext_200m {
-	clock-frequency = <200000000>;
-};
-
-&hsi2c_8 {
-	status = "okay";
-
-	eeprom: eeprom@50 {
-		compatible = "atmel,24c08";
-		reg = <0x50>;
-	};
-};
-
-&hsi2c_12 {
-	status = "okay";
-	/* TODO: add the devices once drivers exist */
-
-	usb-typec@25 {
-		compatible = "maxim,max77759-tcpci", "maxim,max33359";
-		reg = <0x25>;
-		interrupts-extended = <&gpa8 2 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-0 = <&typec_int>;
-		pinctrl-names = "default";
-
-		connector {
-			compatible = "usb-c-connector";
-			label = "USB-C";
-			data-role = "dual";
-			power-role = "dual";
-			self-powered;
-			try-power-role = "sink";
-			op-sink-microwatt = <2600000>;
-			slow-charger-loop;
-			/*
-			 * max77759 operating in reverse boost mode (0xA) can
-			 * source up to 1.5A while extboost can only do ~1A.
-			 * Since extboost is the primary path, advertise 900mA.
-			 */
-			source-pdos = <PDO_FIXED(5000, 900,
-						 (PDO_FIXED_SUSPEND
-						  | PDO_FIXED_USB_COMM
-						  | PDO_FIXED_DATA_SWAP
-						  | PDO_FIXED_DUAL_ROLE))>;
-			sink-pdos = <PDO_FIXED(5000, 3000,
-					       (PDO_FIXED_DATA_SWAP
-						| PDO_FIXED_USB_COMM
-						| PDO_FIXED_HIGHER_CAP
-						| PDO_FIXED_DUAL_ROLE))
-				     PDO_FIXED(9000, 2200, 0)
-				     PDO_PPS_APDO(5000, 11000, 3000)>;
-			sink-vdos = <VDO_IDH(1, 1, IDH_PTYPE_PERIPH, 0,
-					     IDH_PTYPE_DFP_HOST, 2, 0x18d1)
-				     VDO_CERT(0x0)
-				     VDO_PRODUCT(0x4ee1, 0x0)
-				     VDO_UFP(UFP_VDO_VER1_2,
-					     (DEV_USB2_CAPABLE
-					      | DEV_USB3_CAPABLE),
-					     UFP_RECEPTACLE, 0,
-					     AMA_VCONN_NOT_REQ, 0,
-					     UFP_ALTMODE_NOT_SUPP,
-					     UFP_USB32_GEN1)
-				     /* padding */ 0
-				     VDO_DFP(DFP_VDO_VER1_1,
-					     (HOST_USB2_CAPABLE
-					      | HOST_USB3_CAPABLE),
-					     DFP_RECEPTACLE, 0)>;
-			sink-vdos-v1 = <VDO_IDH(1, 1, IDH_PTYPE_PERIPH, 0,
-						0, 0, 0x18d1)
-					VDO_CERT(0x0)
-					VDO_PRODUCT(0x4ee1, 0x0)>;
-			/*
-			 * Until bootloader is updated to set those two when
-			 * console is enabled, we disable PD here.
-			 */
-			pd-disable;
-			typec-power-opmode = "default";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					usbc0_orien_sw: endpoint {
-						remote-endpoint = <&usbdrd31_phy_orien_switch>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					usbc0_role_sw: endpoint {
-						remote-endpoint = <&usbdrd31_dwc3_role_switch>;
-					};
-				};
-			};
-		};
-	};
-};
-
-&pinctrl_far_alive {
-	key_voldown: key-voldown-pins {
-		samsung,pins = "gpa7-3";
-		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
-		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
-		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
-	};
-
-	key_volup: key-volup-pins {
-		samsung,pins = "gpa8-1";
-		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
-		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
-		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
-	};
-
-	typec_int: typec-int-pins {
-		samsung,pins = "gpa8-2";
-		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
-		samsung,pin-pud = <GS101_PIN_PULL_UP>;
-		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
-	};
-};
-
-&pinctrl_gpio_alive {
-	key_power: key-power-pins {
-		samsung,pins = "gpa10-1";
-		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
-		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
-		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
-	};
-};
-
-&serial_0 {
-	status = "okay";
-};
-
-&ufs_0 {
-	status = "okay";
-	vcc-supply = <&ufs_0_fixed_vcc_reg>;
-};
-
-&ufs_0_phy {
-	status = "okay";
-};
-
-&usbdrd31 {
-	vdd10-supply = <&reg_placeholder>;
-	vdd33-supply = <&reg_placeholder>;
-	status = "okay";
-};
-
-&usbdrd31_dwc3 {
-	dr_mode = "otg";
-	usb-role-switch;
-	role-switch-default-mode = "peripheral";
-	maximum-speed = "super-speed-plus";
-	status = "okay";
-
-	port {
-		usbdrd31_dwc3_role_switch: endpoint {
-			remote-endpoint = <&usbc0_role_sw>;
-		};
-	};
-};
-
-&usbdrd31_phy {
-	orientation-switch;
-	/* TODO: Update these once PMIC is implemented */
-	pll-supply = <&reg_placeholder>;
-	dvdd-usb20-supply = <&reg_placeholder>;
-	vddh-usb20-supply = <&reg_placeholder>;
-	vdd33-usb20-supply = <&reg_placeholder>;
-	vdda-usbdp-supply = <&reg_placeholder>;
-	vddh-usbdp-supply = <&reg_placeholder>;
-	status = "okay";
-
-	port {
-		usbdrd31_phy_orien_switch: endpoint {
-			remote-endpoint = <&usbc0_orien_sw>;
-		};
-	};
-};
-
-&usi_uart {
-	samsung,clkreq-on; /* needed for UART mode */
-	status = "okay";
-};
-
-&usi8 {
-	samsung,mode = <USI_V2_I2C>;
-	status = "okay";
 };
 
-&usi12 {
-	samsung,mode = <USI_V2_I2C>;
+&cont_splash_mem {
+	reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
 	status = "okay";
 };
 
-&watchdog_cl0 {
-	timeout-sec = <30>;
+&framebuffer0 {
+	width = <1080>;
+	height = <2400>;
+	stride = <(1080 * 4)>;
+	format = "a8r8g8b8";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
similarity index 96%
copy from arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
copy to arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index d3dd411c9bd0..b25230495c64 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Oriole Device Tree
+ * Device Tree nodes common for all GS101-based Pixel
  *
  * Copyright 2021-2023 Google LLC
  * Copyright 2023 Linaro Ltd - <peter.griffin@linaro.org>
@@ -15,9 +15,6 @@
 #include "gs101.dtsi"
 
 / {
-	model = "Oriole";
-	compatible = "google,gs101-oriole", "google,gs101";
-
 	aliases {
 		serial0 = &serial_0;
 	};
@@ -31,10 +28,8 @@ chosen {
 		framebuffer0: framebuffer-0 {
 			compatible = "simple-framebuffer";
 			memory-region = <&cont_splash_mem>;
-			width = <1080>;
-			height = <2400>;
-			stride = <(1080 * 4)>;
-			format = "a8r8g8b8";
+			/* format properties to be added by actual board */
+			status = "disabled";
 		};
 	};
 
@@ -82,8 +77,10 @@ ufs_0_fixed_vcc_reg: regulator-1 {
 
 	reserved-memory {
 		cont_splash_mem: splash@fac00000 {
-			reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
+			/* size to be updated by actual board */
+			reg = <0x0 0xfac00000 0x0>;
 			no-map;
+			status = "disabled";
 		};
 	};
 };

-- 
2.48.0.rc2.279.g1de40edade-goog


