Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83B5C4450F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 19:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjAnVEczb1dT45u4oUDFTYlC1rS6doUYIZ2QYiF/3pg=; b=UtCstWiOo8f/wnJp7sU8kiJJpH
	BHzWfHH0W9QSWbcpp5vsDWoPhEZVBP9JhChaIC+cOok7hTqs5OzUg0n2JrzD4KjQ+J/OVI4cTTeV4
	wi9SOPhaO6JcL+nNuGtYSXlscCbVPhqkDe5ARPzUirxM6U+hslR0a4AvU90kjTjVOnbv/cpNwn4Vv
	ORaVyzuXvo4v55BhC72/x5ZGtWDDgLn/C1jN1xdLDigXEk5wTXAvXRi3gZfQm2ZwfRG0qe5nYFQw9
	o0d/8/40ndJzr2QbIRAR5FX28JoNBF4NsPL0JWHV+R8Wzf2jtcFb16YOJZthL//aOf8RUrpEkd++v
	zh8ZxJVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4yx-0000000Fl91-2YAj;
	Wed, 15 Jul 2026 19:09:23 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4yu-0000000Fl6Q-1BxD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 19:09:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493e4ccccc2so36607855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784142557; x=1784747357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gjAnVEczb1dT45u4oUDFTYlC1rS6doUYIZ2QYiF/3pg=;
        b=jEQ+qwxv3PC60kvdX3TXHDdEz80fy/1LsF+RxlKOnuI32785jWRFpCbr9ZmyGVR7sU
         fCH7wPdAcYFY3zuccny+6P3yTzv7S3srzLyWtozLJQSxbiY5MAcN3O9ptz+uyPQN9yBd
         1HCic3NmojbN2h2WS9SHSV+Q0nMAUA61zBsKv6aqPo93e0f/eV6wA1ibpwZPo8AMSs2+
         j6g4B9VbGSe2WcWb8JEhCQV1MpuA5FU6GaIGQ5bYEpZdKeo2Du5IHuxUeBLok3r6B/kw
         3LTKAALus/1faj7/vStrygmRxeIfXND+EEAg3/xEDN7Jidd8NsUXdQ48xpm+EdGknn4U
         jvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784142557; x=1784747357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gjAnVEczb1dT45u4oUDFTYlC1rS6doUYIZ2QYiF/3pg=;
        b=AY8q2mCNIXF4XQS6NG4EUZnyMljRFgO+Htu1XHBmakg/hTBVsOQuxZoSxOVYtP1xE+
         NHjggLCy8R15Dyx7b8ksYCeJ4OKUMOEVBEYlLlS/sv83/CRD5cNROKK0YgQLesG6Q+de
         21KWdBl3PoT0ELRE3txTUVAtidRKIAnDIF78Cpsvu0Z1LUNc3+Tu4gpf04BEOxEPXve/
         F1/6koOEHgZbtdlcfUxXZv0h12RiES5OZ7Ph3uLLqIZEa9VSUT5WRg31BcBAg3k2tF/e
         Dv6CmIIQjQMbBFMSyj/e3yDVx0h0+tQr/Hr8RfrAOwA5Zhp4Pf74TE07CSaStJSMzJfM
         e4dg==
X-Forwarded-Encrypted: i=1; AHgh+RpiRmVlHD/XKo9LX2hVh2wWTidXc4SBIj6HZ2UuvAsOn88iU8n/m1EVEpdu2upIcEOSEzW+rTMFSOnSG6GKHn84@lists.infradead.org
X-Gm-Message-State: AOJu0YwQdZEcdRBgh9LhEYLWvSjVVIOyf1Hj3SryUhrSH+wyWydnTcMG
	rr5U0n9lU1rBuR4ItHLdJOgpgxuCi2jzVvPSvOoP1m0VAr0KAYIQVHhu
X-Gm-Gg: AfdE7clMBNtrXuRbE0flYt4lEbqdgBbJFvD56jFkN/tNcS3ctcemvojZ6R2BoQhIcTN
	fRrBBiQxSnqzT1/muT+T3zSu1xH9Aq8DtuyYXL+uOk8xRBnR+GBjAT6Scly8aJmyAzRp3wRquz3
	v+YM0UGhgW2+o/OvLa32RVs5cQNfuBZyRTX9KHi9bi3Y0IifmJ6ng/7KSKNARpyuETorbMSIQwq
	QPzqafoI1yfeLKA5piPPBrIUt8bfj2mXZAOtrKO0p16udMVp3tcqZ3Grxg6b/AzHzLcQ2Z9JAul
	QV62mI5oB9Yv4VetyOd8zKyPbBvFrJcEPx6h+C8PkB7HV3PjKIIuUDXLRC7gtZPgr1CbPPx07o/
	73MiFIJcsRTkw5TxMFjYEVOacmajCU6x8GzUUdWDeKpWNI9Ud0PhbrPO0AW2wHa60tAeFfXIywn
	p7HOVMSPSFHnMvPKPafR5AiVQ/E2Y7Ujbn+3SFqGWx2LqyfXZjjSxAR4YCnUGcp+ApKux+zKm+e
	Lq4BZirnmsDDfDG99Sr1Yn3GQ==
X-Received: by 2002:a05:600c:5292:b0:495:40aa:d982 with SMTP id 5b1f17b1804b1-49540aad9a1mr9123375e9.6.1784142557323;
        Wed, 15 Jul 2026 12:09:17 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541eb7372sm3786325e9.13.2026.07.15.12.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 12:09:16 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v5 3/3] arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board
Date: Wed, 15 Jul 2026 21:09:09 +0200
Message-ID: <354dc61e75c935f6a7adea7b8c64fc324651d63b.1784142385.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784142385.git.stefano.r@variscite.com>
References: <cover.1784142385.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_120920_588047_531E4841 
X-CRM114-Status: GOOD (  18.70  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite Symphony carrier board with
the VAR-SOM-MX8 QuadMax system on module.

The Symphony board includes
- uSD Card support
- USB ports and OTG
- Additional Gigabit Ethernet interface
- Uart, SPI and I2C interfaces
- GPIO Expanders
- RTC module
- TPM module
- CAN peripherals
- PCIE support

Link: https://variscite.com/carrier-boards/symphony-board/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - Fix led typo
 - Moved reset-gpios in pciea_port0
 - Removed wrong captouch pinctrl gpio

v1->v2:
 - Fix ptn5150 interrupt
 - Fix ecspi1 cs gpio

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8qm-var-som-symphony.dts | 490 ++++++++++++++++++
 2 files changed, 491 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 430085123b4e..ceb31556a8c0 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -540,6 +540,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-tqma8qm-mba8x.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8qm-var-som-symphony.dtb
 
 imx8qm-mek-ov5640-csi0-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi0.dtbo
 dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-csi0.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
new file mode 100644
index 000000000000..7c7fc8958efc
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
@@ -0,0 +1,490 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Variscite Symphony carrier board for VAR-SOM-MX8 QuadMax
+ *
+ * Link: https://variscite.com/carrier-boards/symphony-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include "imx8qm-var-som.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX8 on Symphony evaluation board";
+	compatible = "variscite,var-som-imx8qm-symphony",
+		     "variscite,var-som-imx8qm", "fsl,imx8qm";
+	chosen {
+		stdout-path = &lpuart0;
+	};
+
+	 gpio-keys {
+		compatible = "gpio-keys";
+
+		button-back {
+			label = "Back";
+			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_BACK>;
+		};
+
+		button-home {
+			label = "Home";
+			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOME>;
+		};
+
+		button-menu {
+			label = "Menu";
+			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_MENU>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led-heartbeat {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&pca9534 0 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	reg_fec_phy: regulator-fec-phy {
+		compatible = "regulator-fixed";
+		regulator-name = "fec-phy";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-enable-ramp-delay = <20000>;
+		vin-supply = <&reg_vselect>;
+		gpio = <&pca9534 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb_otg1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&lsio_gpio0 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "sw-3p3-sd1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_vselect: regulator-vselect {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_vselect";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		gpio = <&pca9534 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&ethphy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
+};
+
+&fec1 {
+	mdio {
+		ethphy1: ethernet-phy@5 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <5>;
+			vddio-supply = <&reg_phy_vddio>;
+			reset-gpios = <&pca9534 5 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@0 {
+					reg = <0>;
+					color = <LED_COLOR_ID_YELLOW>;
+					function = LED_FUNCTION_LAN;
+					linux,default-trigger = "netdev";
+				};
+
+				led@1 {
+					reg = <1>;
+					color = <LED_COLOR_ID_GREEN>;
+					function = LED_FUNCTION_LAN;
+					linux,default-trigger = "netdev";
+				};
+			};
+		};
+	};
+};
+
+&fec2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec2>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy1>;
+	phy-supply = <&reg_fec_phy>;
+	status = "okay";
+};
+
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	status = "okay";
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	status = "okay";
+};
+
+&hsio_phy {
+	fsl,hsio-cfg = "pciea-pcieb-sata";
+	fsl,refclk-pad-mode = "input";
+	status = "okay";
+};
+
+&i2c1 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	status = "okay";
+
+	pca9534: gpio@20 {
+		compatible = "nxp,pca9534";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pca9534>;
+		interrupt-parent = <&lsio_gpio1>;
+		interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	/* USB Type-C Controller */
+	typec_ptn5150: typec@3d {
+		compatible = "nxp,ptn5150";
+		reg = <0x3d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ptn5150>;
+		interrupt-parent = <&lsio_gpio3>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+
+		port {
+			typec_dr_sw: endpoint {
+				remote-endpoint = <&usb3_drd_sw>;
+			};
+		};
+	};
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	status = "okay";
+
+	pca6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "lvds_brg_en";
+		};
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pca6408 4 GPIO_ACTIVE_LOW>;
+	};
+
+	/* Capacitive touch */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5406";
+		pinctrl-names = "default";
+		reg = <0x38>;
+		pinctrl-0 = <&pinctrl_captouch>;
+		interrupt-parent = <&lsio_gpio0>;
+		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
+};
+
+&lpspi1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi1>;
+	cs-gpios = <&lsio_gpio3 24 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+/* console */
+&lpuart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart0>;
+	status = "okay";
+};
+
+/* header */
+&lpuart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart2>;
+	status = "okay";
+};
+
+&pca9534 {
+	usb3-signal-route-hog {
+		gpio-hog;
+		gpios = <4 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "usb3_signal_route";
+	};
+};
+
+&pciea{
+	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
+	phy-names = "pcie-phy";
+	status = "okay";
+};
+
+&pciea_port0 {
+	reset-gpios = <&pca6408 1 GPIO_ACTIVE_LOW>;
+};
+
+&usb3_phy {
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "host";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usbotg1>;
+	vbus-supply = <&reg_usb_otg1_vbus>;
+	srp-disable;
+	hnp-disable;
+	adp-disable;
+	disable-over-current;
+	status = "okay";
+};
+
+&usbotg3 {
+	status = "okay";
+};
+
+&usbotg3_cdns3 {
+	dr_mode = "otg";
+	usb-role-switch;
+	status = "okay";
+
+	port {
+		usb3_drd_sw: endpoint {
+			remote-endpoint = <&typec_dr_sw>;
+		};
+	};
+};
+
+&usbphy1 {
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	bus-width = <4>;
+	cd-gpios = <&lsio_gpio0 14 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			IMX8QM_GPT1_COMPARE_LSIO_GPIO0_IO19			0x06000021
+		>;
+	};
+
+	pinctrl_fec2: fec2grp {
+		fsl,pins = <
+			IMX8QM_ENET1_RGMII_TX_CTL_CONN_ENET1_RGMII_TX_CTL	0x06000048
+			IMX8QM_ENET1_RGMII_TXC_CONN_ENET1_RGMII_TXC		0x06000048
+			IMX8QM_ENET1_RGMII_TXD0_CONN_ENET1_RGMII_TXD0		0x06000048
+			IMX8QM_ENET1_RGMII_TXD1_CONN_ENET1_RGMII_TXD1		0x06000048
+			IMX8QM_ENET1_RGMII_TXD2_CONN_ENET1_RGMII_TXD2		0x06000048
+			IMX8QM_ENET1_RGMII_TXD3_CONN_ENET1_RGMII_TXD3		0x06000048
+			IMX8QM_ENET1_RGMII_RXC_CONN_ENET1_RGMII_RXC		0x06000048
+			IMX8QM_ENET1_RGMII_RX_CTL_CONN_ENET1_RGMII_RX_CTL	0x06000048
+			IMX8QM_ENET1_RGMII_RXD0_CONN_ENET1_RGMII_RXD0		0x06000048
+			IMX8QM_ENET1_RGMII_RXD1_CONN_ENET1_RGMII_RXD1		0x06000048
+			IMX8QM_ENET1_RGMII_RXD2_CONN_ENET1_RGMII_RXD2		0x06000048
+			IMX8QM_ENET1_RGMII_RXD3_CONN_ENET1_RGMII_RXD3		0x06000048
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan0grp {
+		fsl,pins = <
+			IMX8QM_FLEXCAN0_TX_DMA_FLEXCAN0_TX			0x00000021
+			IMX8QM_FLEXCAN0_RX_DMA_FLEXCAN0_RX			0x00000021
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan1grp {
+		fsl,pins = <
+			IMX8QM_FLEXCAN1_TX_DMA_FLEXCAN1_TX			0x00000021
+			IMX8QM_FLEXCAN1_RX_DMA_FLEXCAN1_RX			0x00000021
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			IMX8QM_USB_SS3_TC3_DMA_I2C1_SDA				0xc6000020
+			IMX8QM_USB_SS3_TC1_DMA_I2C1_SCL				0xc6000020
+		>;
+	};
+
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			IMX8QM_ENET1_MDC_DMA_I2C4_SCL				0xc6000020
+			IMX8QM_ENET1_MDIO_DMA_I2C4_SDA				0xc6000020
+		>;
+	};
+
+	pinctrl_lpspi1: lpspi1grp {
+		fsl,pins = <
+			IMX8QM_ADC_IN3_DMA_SPI1_SCK				0x0600004c
+			IMX8QM_ADC_IN4_DMA_SPI1_SDO				0x0600004c
+			IMX8QM_ADC_IN5_DMA_SPI1_SDI				0x0600004c
+			IMX8QM_ADC_IN6_LSIO_GPIO3_IO24				0x00000021
+		>;
+	};
+
+	pinctrl_lpuart0: lpuart0grp {
+		fsl,pins = <
+			IMX8QM_UART0_RX_DMA_UART0_RX				0x06000020
+			IMX8QM_UART0_TX_DMA_UART0_TX				0x06000020
+		>;
+	};
+
+	pinctrl_lpuart2: lpuart2grp {
+		fsl,pins = <
+			IMX8QM_LVDS0_I2C1_SCL_DMA_UART2_TX			0x06000020
+			IMX8QM_LVDS0_I2C1_SDA_DMA_UART2_RX			0x06000020
+		>;
+	};
+
+	pinctrl_pca9534: pca9534grp {
+		fsl,pins = <
+			IMX8QM_MIPI_CSI0_MCLK_OUT_LSIO_GPIO1_IO24		0x00000021
+		>;
+	};
+
+	pinctrl_ptn5150: ptn5150grp {
+		fsl,pins = <
+			IMX8QM_SPI2_CS1_LSIO_GPIO3_IO11				0x00000021
+		>;
+	};
+
+	pinctrl_usbotg1: otg1grp {
+		fsl,pins = <
+			IMX8QM_GPT1_CAPTURE_LSIO_GPIO0_IO18			0x06000048
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			IMX8QM_USDHC1_CLK_CONN_USDHC1_CLK			0x06000041
+			IMX8QM_USDHC1_CMD_CONN_USDHC1_CMD			0x00000021
+			IMX8QM_USDHC1_DATA0_CONN_USDHC1_DATA0			0x00000021
+			IMX8QM_USDHC1_DATA1_CONN_USDHC1_DATA1			0x00000021
+			IMX8QM_USDHC1_DATA2_CONN_USDHC1_DATA2			0x00000021
+			IMX8QM_USDHC1_DATA3_CONN_USDHC1_DATA3			0x00000021
+			IMX8QM_USDHC1_VSELECT_CONN_USDHC1_VSELECT		0x00000021
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			IMX8QM_USDHC1_CLK_CONN_USDHC1_CLK			0x06000040
+			IMX8QM_USDHC1_CMD_CONN_USDHC1_CMD			0x00000020
+			IMX8QM_USDHC1_DATA0_CONN_USDHC1_DATA0			0x00000020
+			IMX8QM_USDHC1_DATA1_CONN_USDHC1_DATA1			0x00000020
+			IMX8QM_USDHC1_DATA2_CONN_USDHC1_DATA2			0x00000020
+			IMX8QM_USDHC1_DATA3_CONN_USDHC1_DATA3			0x00000020
+			IMX8QM_USDHC1_VSELECT_CONN_USDHC1_VSELECT		0x00000020
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			IMX8QM_USDHC1_CLK_CONN_USDHC1_CLK			0x06000040
+			IMX8QM_USDHC1_CMD_CONN_USDHC1_CMD			0x00000020
+			IMX8QM_USDHC1_DATA0_CONN_USDHC1_DATA0			0x00000020
+			IMX8QM_USDHC1_DATA1_CONN_USDHC1_DATA1			0x00000020
+			IMX8QM_USDHC1_DATA2_CONN_USDHC1_DATA2			0x00000020
+			IMX8QM_USDHC1_DATA3_CONN_USDHC1_DATA3			0x00000020
+			IMX8QM_USDHC1_VSELECT_CONN_USDHC1_VSELECT		0x00000020
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
+		fsl,pins = <
+			IMX8QM_GPT0_CLK_LSIO_GPIO0_IO14				0x00000021
+		>;
+	};
+};
-- 
2.47.3


