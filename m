Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A384C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 09:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWHmRwxHIl7SqIOMEN3OX1Ie9AcQJY6iSkcNImx/CKU=; b=zpSFpgJDUO6m6t4pNIYBe/jare
	o8b0hynEfWUxO85IsrNjbeX2UXnskS56GPBLF9fJYm9598e9x1N9fU3dnOYXf5VRfV37cbMpqS8sh
	QaktTP2mJizI9ANcWUhysSZ7umLOjhAdz7E4azszS/cA0/07gnXS9HrmOj7zb3L5PLQyWH9DH70pc
	JEya7Bk8gaK4iBTqGy9qRic3vrWh6nNCGt/Zb9tNsYc/m7e+qN7i43TEW3YEIjTPqqaAW6BzeLBMJ
	5QZGQgUtsHq+NvH5jSYGaF9MeOiVW6b6S7w/ImltCVsdnb4jwvA6lCOSX4smU9i6SHO4IadM3wn5S
	kZdGEIzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNq91-00000001Vc6-1znE;
	Sat, 07 Jun 2025 09:47:19 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNpw7-00000001UFh-2E4d
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 09:34:00 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so2567816a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 02:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749288838; x=1749893638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWHmRwxHIl7SqIOMEN3OX1Ie9AcQJY6iSkcNImx/CKU=;
        b=BSpVSQpl9ZegsW9q+BHWavZybHCfQLHN/7m8p6N6ZTyFN68fVLyKOKUPFLbfpOwngO
         BZYB7qFNwpjjGBCItZpdZdBmFd1e97Dlr5ddRcvQ0wyZ4w/LGRKbcSKqWuRhl1lB5tZr
         rwwHDTAmCZiFiQV/141EDw4aHN815NjU0dKjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288838; x=1749893638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWHmRwxHIl7SqIOMEN3OX1Ie9AcQJY6iSkcNImx/CKU=;
        b=WNQ//miXNgTt4r8AMoEMpcrN1oZPFGhjoRjAaFtTvKGfX14I0giaxMDbb/k/Hy7AOS
         qHxSy/FXKLxZYKnAZIVNtySYNKaxDexZ/xATVJlg0sygPhXir/eV/m+U6l1e/CWSCR5r
         Ed37ULomz1LDd9ZaKpELXtreRQtHgSf/5pZUd6DKlHUeh+godklJ/DObj8Moo/ttNuub
         OOVhctkwf7crpAWP/twC5/TFfLPJ32+RCY4mHdO/H/PbrWx2ibBmxuRXTbgrV4bP70bf
         /+2A42CrSQrtMQXQijMhHq3CW/Z5iB4GrrTlgLR+FTDP5HKT6eoO63WZckN2V5hhNXvL
         FzUA==
X-Forwarded-Encrypted: i=1; AJvYcCWm3L101xRlPEZ4Vxx85oz4xIT7GliGp8e3oCXcoFATADKUIotV8F/MgJj4uUleS/sOOmR+xEeZVW6VPRM8rjuA@lists.infradead.org
X-Gm-Message-State: AOJu0YyWK5IXUkQHXYF5KTSQ0OjPxp4i7VNliN6eRF0qNjGZs7juvJTa
	fwR7ywu+l/ykclgT6OpkIMfow4ptI7wL25gRCX15eti9SKp2epTNIwGPTfgGA2YKj18=
X-Gm-Gg: ASbGncuJqp0GNiTvxdy7uxNIUK1HdyyoLJxYkk7gPscDb1lklfOFXz7KrvbRTjPx/GH
	dJ/QaABtIOhnMmMSYKctVPDhT86YqDRzq37N+5Cb6e3mA6vHHd7GTxxrSR5g2rH5FEL3Y2YmAl+
	wx+7VvCc+NAYQF/PWjvAkMjUqhONSN9GfPxTB07u4CLytyWjebgA/Atnvb0A2uS6roAxesI2wTE
	3amLwWUNrNeK15bh+LCcdijob1GRUrAtji8MQpAjUpi0q07BSWx9gibalZaaBzXg2I5lh7keNhh
	N4f1BwgSdROFfDQBSqPqK6Pe3cOvibCEgOKLvxudMdGtvrnPHzyIZYUH6xeonjoaVQuq4WHSAXb
	UNeO1A8/b3eH77wBxw9GoZ55U1EaSMtmk7IujaFVphEySroG2yuc+E+EeVTxQ+1UHdMLTRy0q2/
	uGyeYjjB2d3zAp8kuMjkS6OZ4=
X-Google-Smtp-Source: AGHT+IGfxdzySMdHC+jUgayg+tKS4+MR6GwFQlW3UpxyXKi0fTllbYekQhz3SIQEHKF/UUjDGAxeGw==
X-Received: by 2002:a17:907:84c:b0:adb:2a81:46ba with SMTP id a640c23a62f3a-ade1a978c48mr510832266b.34.1749288837910;
        Sat, 07 Jun 2025 02:33:57 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c316sm251541066b.98.2025.06.07.02.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 02:33:57 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 07/10] ARM: dts: imx6ul: support Engicam MicroGEA RMM board
Date: Sat,  7 Jun 2025 11:33:19 +0200
Message-ID: <20250607093342.2248695-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
References: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_023359_572517_7DE4E6AC 
X-CRM114-Status: GOOD (  14.97  )
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

Support Engicam MicroGEA RMM board with:

- 256 Mbytes NAND Flash
- 512 Mbytes DRAM DDR2
- CAN
- LEDs
- Micro SD card connector
- USB 2.0 high-speed/full-speed
- Ethernet MAC

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/nxp/imx/Makefile            |   1 +
 .../nxp/imx/imx6ull-engicam-microgea-rmm.dts  | 362 ++++++++++++++++++
 2 files changed, 363 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 57f185198217..32dfd69b8d8b 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -357,6 +357,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-dhcom-picoitx.dtb \
 	imx6ull-dhcor-maveo-box.dtb \
 	imx6ull-engicam-microgea-bmm.dtb \
+	imx6ull-engicam-microgea-rmm.dtb \
 	imx6ull-jozacp.dtb \
 	imx6ull-kontron-bl.dtb \
 	imx6ull-myir-mys-6ulx-eval.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
new file mode 100644
index 000000000000..ebde581b090f
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2025 Engicam srl
+ */
+
+/dts-v1/;
+
+#include "imx6ull-engicam-microgea.dtsi"
+
+/ {
+	compatible = "engicam,microgea-imx6ull-rmm",
+		     "engicam,microgea-imx6ull", "fsl,imx6ull";
+	model = "Engicam MicroGEA i.MX6ULL BMM Board";
+
+	backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 100>;
+		num-interpolated-steps = <100>;
+		default-brightness-level = <85>;
+		pwms = <&pwm8 0 100000 0>;
+	};
+
+	buzzer {
+		compatible = "pwm-beeper";
+		pwms = <&pwm4 0 1000000 0>;
+	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_usb1_vbus: regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usb1>;
+		regulator-name = "usb1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio5 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usb2_vbus: regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usb2>;
+		regulator-name = "usbotg_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio5 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_ext_pwr: regulator-ext-pwr {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_ext_pwr>;
+		regulator-name = "ext-pwr";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio5 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "imx6ull-microgea-rmm-sgtl5000";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,widgets =
+			"Microphone", "Mic Jack",
+			"Headphone", "Headphone Jack";
+		simple-audio-card,routing =
+			"MIC_IN", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"Headphone Jack", "HP_OUT";
+
+		cpu_dai: simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&codec>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_leds>;
+
+		led-0 {
+			gpios = <&gpio2 10 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+			status = "okay";
+		};
+
+		led-1 {
+			gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+			status = "okay";
+		};
+	};
+};
+
+&can1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can>;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	clock-frequency = <100000>;
+	status = "okay";
+
+	touchscreen: touchscreen@38 {
+		compatible ="edt,edt-ft5306";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touchscreen>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio2 14 GPIO_ACTIVE_LOW>;
+		report-rate-hz = <6>;
+		/* settings valid only for Hycon touchscreen */
+		touchscreen-size-x = <1280>;
+		touchscreen-size-y = <800>;
+	};
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	clock-frequency = <100000>;
+	status = "okay";
+
+	codec: sgtl5000@a {
+		compatible = "fsl,sgtl5000";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_mclk>;
+		reg = <0x0a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clks IMX6UL_CLK_CKO>;
+		assigned-clocks = <&clks IMX6UL_CLK_CKO2_SEL>,
+				  <&clks IMX6UL_CLK_CKO2_PODF>,
+				  <&clks IMX6UL_CLK_CKO2>,
+				  <&clks IMX6UL_CLK_CKO>;
+		assigned-clock-parents = <&clks IMX6UL_CLK_OSC>,
+					 <&clks IMX6UL_CLK_CKO2_SEL>,
+					 <&clks IMX6UL_CLK_CKO2_PODF>,
+					 <&clks IMX6UL_CLK_CKO2>;
+		VDDA-supply = <&reg_3v3>;
+		VDDIO-supply = <&reg_3v3>;
+		VDDD-supply = <&reg_1v8>;
+	};
+};
+
+&iomuxc {
+
+	pinctrl_can: can-grp {
+		fsl,pins = <
+			MX6UL_PAD_UART3_RTS_B__FLEXCAN1_RX	0x1b020
+			MX6UL_PAD_UART3_CTS_B__FLEXCAN1_TX	0x1b020
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6UL_PAD_CSI_PIXCLK__I2C1_SCL		0x4001b8b0
+			MX6UL_PAD_CSI_MCLK__I2C1_SDA		0x4001b8b0
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO00__I2C2_SCL		0x4001b8b0
+			MX6UL_PAD_GPIO1_IO01__I2C2_SDA		0x4001b8b0
+		>;
+	};
+
+	pinctrl_leds: ledsgrp {
+		fsl,pins = <
+			MX6UL_PAD_ENET2_RX_EN__GPIO2_IO10	0x130b0
+			MX6UL_PAD_ENET2_TX_DATA0__GPIO2_IO11	0x130b0
+		>;
+	};
+
+	pinctrl_mclk: mclkgrp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TMS__CCM_CLKO1		0x13009
+		>;
+	};
+
+	pinctrl_pwm4: pwm4grp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO05__PWM4_OUT		0x110b0
+		>;
+	};
+
+	pinctrl_pwm8: pwm8grp {
+		fsl,pins = <
+			MX6UL_PAD_ENET1_RX_ER__PWM8_OUT		0x110b0
+		>;
+	};
+
+	pinctrl_sai2: sai2grp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x130b0
+			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
+			MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x17088
+			MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x120b0
+		>;
+	};
+
+	pinctrl_touchscreen: touchgrp {
+		fsl,pins = <
+			MX6UL_PAD_ENET2_TX_CLK__GPIO2_IO14	0x17059
+			MX6UL_PAD_ENET2_RX_DATA0__GPIO2_IO08	0x17059
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX	0x1b0b1
+			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX	0x1b0b1
+		>;
+	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x0b0b0
+			MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x0b0b0
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x10059
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170b9
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100b9
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170b9
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170b9
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170b9
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170b9
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170f9
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100f9
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170f9
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170f9
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
+		>;
+	};
+};
+
+&iomuxc_snvs {
+
+	pinctrl_reg_usb1: regusb1grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x17059
+		>;
+	};
+
+	pinctrl_reg_usb2: regusb2grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER3__GPIO5_IO03	0x17059
+		>;
+	};
+
+	pinctrl_reg_ext_pwr: reg-ext-pwrgrp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x17059
+		>;
+	};
+};
+
+&pwm4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm4>;
+	status = "okay";
+};
+
+&pwm8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm8>;
+	status = "okay";
+};
+
+&sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "host";
+	vbus-supply = <&reg_usb1_vbus>;
+	disable-over-current;
+	status = "okay";
+};
+
+&usbotg2 {
+	dr_mode = "host";
+	vbus-supply = <&reg_usb2_vbus>;
+	disable-over-current;
+	status = "okay";
+};
+
+/* MicroSD */
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	vmmc-supply = <&reg_3v3>;
+	bus-width = <4>;
+	keep-power-in-suspend;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
-- 
2.43.0


