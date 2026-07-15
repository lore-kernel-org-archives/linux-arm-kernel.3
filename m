Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57F2C4450C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FpUoYc4V7vpCkT3r8UNBOo7HZjbCJxSs7DsNDYI3efE=; b=2baAMU9Y2hNavNFX/s9jzB5l6L
	fc8xw7bzi0Zgci75Q0LmoNj7El/T5+bwr9mq9v2r2aLR4uN1Chf/F5+DOB1JlkPTteq1TB8fAp5b1
	E6JcLnazDwdoTq/CDCcfT/YG4ugKz8ODKuCsZHloRiD+w94O/gyfNP1JveJPFcLWl698jwddMYcVp
	1md6MUnLGJeuCGtm7MMqymeIqjhYavMpzdA8p4b+ZBVzpgSYOgrR/Ebyhk4oVWyaRfMCz0P1ChV7a
	d3QE2mOmDJnvHfuVt37hqr7uDlgXSBdZdYcAsS3svpGmLuFxI5THDnVfHKbSm0eEeCkVupyBE8OgS
	fMbw3DBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxTU-0000000EXGf-350t;
	Wed, 15 Jul 2026 11:08:24 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxTS-0000000EXEe-1v2K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:08:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso45628245e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784113701; x=1784718501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FpUoYc4V7vpCkT3r8UNBOo7HZjbCJxSs7DsNDYI3efE=;
        b=nfoukz3la7t6aEDS3+qikopmPnZxfza255eYLvi4JCgVxs/vK3Uwmoqne8bHRHiIsx
         veK+0mZGQ+2ca2pqIcMgfn3M8RNWDhZY5glBzrHgfVJuxvASSd4z1Hp2b4f2xvcGjkkY
         WfL4oEQBL8OVTzglko/raXwtCmc8769d/fqB7ULeOUEcue+5GEY1SUD6y0Wg1//hoqiN
         aaoXiYspfDnvthbm/ykg+kU0qySf0/zEr7jjfxJqrnrRUHltgCUWm2Vr2o8fGaVFQPZl
         7dbKLbaEHUUDXOqL/dDKOwePLk7qJBMjn/an1K5vMbqhKrnZpPjVJC6rgWYnbPVL+KMS
         oVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784113701; x=1784718501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FpUoYc4V7vpCkT3r8UNBOo7HZjbCJxSs7DsNDYI3efE=;
        b=WF/ckNPwC4WrtiF2G7UoCh3iZNhWQvnRwpP+79h6+LflbHggjb9yPFS0sl0ez46mcX
         xFGVUSVgsEL/Rbr5VKjkfd4MAEqdjfq6LyB2iclsHViMyzUqN4N7Q6NNDaU3aSd2ITQ3
         hFXXmIb6camKqhSpSdKLIG58RupSK3+j7gZ+VQTkR2FJkMl3Y3dQr9tZA4anhrQakyct
         OKjxXuzo91n0jG4/+7XssdRPjDx+6vEqabUU/TTNOGd986N3+zbuF3/IgmPK9EiLpB0d
         IIJXtn0TPiuCz2Qjomws8DaJM6eP83WakHxWt4TNYLfM42XnHBehcN4HUi8lMgnGhoMa
         B1hQ==
X-Forwarded-Encrypted: i=1; AHgh+RprKijhmBMuJI5vK3G1Mp5HrXyjC/KnL0HjPYnXCBtoxps8V9ptnhztGP2md/TABSJFYfdKseMhwHnkRFTBrKrK@lists.infradead.org
X-Gm-Message-State: AOJu0YxYmZeuIvIzmwzYEJ9IcxkTl8ShhH8H/b6jEU+vEmtrKhHyxfc3
	yzEIPvsij+pLsNP4+Z454SRLTkWf1CoKYDuLK6iE4BpM5RtB9Lhs7P0u
X-Gm-Gg: AfdE7clRFbKVY6jS3zyFevUiA0+GmyLfFlYDjEtNoocHW9D5ilhBVqEGayHhZ8FC6tR
	1sHMD/8Aj3SjB/zy5QZPT9RqzkfqHD1a3GDMLDdytEODotfs0CTk3QDmRMz1g/tqbwZKSHhthtt
	CMEy4oIEG7t4NwXcEXjVJVhazQrIW68RN9tDOw4sop0Z0bQrMj7WPmoUBH/olC78M0bC/KS6Rne
	zcy0+ZMa+XdgyqWdUWb+j7dt0gH2x0Qv59OxzY5jEJ/M7Rbisw+YAlfSjfzywC0Gh4hcpqL4L0l
	f6zTJwtpXkmoQBDNz20Ss9Y835oVHYcWCh1J9cv8MPz57P5VEC7bUT2T7WvPsHhjVRHkOJzUMwC
	yJOYUH/YXC8XXHKyYUqjYYWfiTV+hKhiOj3QobTcIUdMpIV+KEyitiBUrh4mxtiwfoe8jurUGgi
	+VfvH01iG0abtiMrX0sn9lK79Npyh1GUKG8jXfCt4xaNdywvhMq0Q/zVKCV3n+0tX0mItO
X-Received: by 2002:a05:600d:844e:10b0:495:69c:a262 with SMTP id 5b1f17b1804b1-495389d2bbbmr49414525e9.13.1784113700132;
        Wed, 15 Jul 2026 04:08:20 -0700 (PDT)
Received: from Lord-Beerus.station ([93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f951asm151389875e9.14.2026.07.15.04.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:08:19 -0700 (PDT)
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
Subject: [PATCH v3 3/3] arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board
Date: Wed, 15 Jul 2026 13:08:12 +0200
Message-ID: <2480c0b11fff83d57826d6519410c1ecc1d89bb8.1784113547.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784113547.git.stefano.r@variscite.com>
References: <cover.1784113547.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_040822_661780_9B5F2A6B 
X-CRM114-Status: GOOD (  18.76  )
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


