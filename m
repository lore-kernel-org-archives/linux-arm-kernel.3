Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8181C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 15:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtODmpI9mZe6/h8ZDFYVWDkrLyo2Syh7ZlJrPbuTBz8=; b=Wb9dZUcIWXhkWNYUgvxWDASNfz
	Y0QExhWMx+4cVzYBNo69yygQJIU+9N3VKM51so0kP7L202cxu4sVmZVl4IY7S0IE/L76TMqFK47mD
	HatWp+fvfgdajx5kr5HFjJoY660/hMJ+iQPcu1uBfOyxoYfOlA/l/B7M5IJZY7E9WhxtQEwaGJ5rk
	nKXuG5yf7A9o09lUPmYKA//pxvYvcl2uj+vs19ijhAFnzrDbT/FKXeOTfAne630R8BrYASbTLSpCI
	kdhg61OfHKsv6u0oFQJ613DeAMkaC+4fnaf4SlCK7IeuvuARsBkT2wMU8Z0gZANYNF73Vz4udiH2o
	NTYBvYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKfC6-0000000G4ej-2giV;
	Thu, 29 May 2025 15:29:22 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKeMT-0000000Fz18-1Ryv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 14:36:02 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-acbb85ce788so183441066b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 07:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748529360; x=1749134160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtODmpI9mZe6/h8ZDFYVWDkrLyo2Syh7ZlJrPbuTBz8=;
        b=Xa3x74Gefu543JVbEEkV6wV1+buUkq1lq32fcnIiZQ/GcUIqxbzhxVS1sqR03/USu5
         aM4WxE3NI/JoZ2C1m9sG6FE9CIAfH6LXC6Fc7sni4VxgOP09baX/fgbTRFa+i6nbFK6E
         tDE/Pq9iCGKCcvZ7awAl+NszIwlqTqzzN5M5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748529360; x=1749134160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtODmpI9mZe6/h8ZDFYVWDkrLyo2Syh7ZlJrPbuTBz8=;
        b=m0NwjNZmHb6tTLqimziNcRHAZaNVyYIZyDnfH/Sqf8UXtrAyWYIo61avh1kgOkFMgj
         XYzJlgLvDkht1koeEAtgY6/tWj3S0I/330Wb871Kf3/5MHVfzJ85eawUDgHdM8z1HVA8
         BSQbcxSHx3CL0JbZhsKzPxleZ54bW8kzTlcPsvrDi5pGuuQ+atis9iACUh5G6sDz/EtA
         kHQhCGtnjsx/KWei7TS+jCN5NUA/DhoQaXEbJ9fs1nEPL9/d3n9W/k630c5WKla04PkD
         Ive+U2A96POv2OV91D+nrx3byuinZNVXY0o2nqp9XZoNklDBqofU7WqKViJQ+VZ3SAyL
         oxCw==
X-Forwarded-Encrypted: i=1; AJvYcCU1ajPNABUQ0kPXaMSaOXOZiXLtVBF2uJlQPqt84YoiZC5+qWXGM+d6MSvim1XYy3+mthmB9jN+N/M8AcRkypma@lists.infradead.org
X-Gm-Message-State: AOJu0YxbnAeD2aqcjPFDBhc+Djp3+5LUppNszXBaxa4FsydDZLmBSCfx
	tzFEmSKq5FPXpv8EkHFGdBkZMriVYsdIUNYMG9xg1DNPES1GJ+bNK7e475wCiRyOEwI=
X-Gm-Gg: ASbGncvp2eIHXfPc3MpbtemiPQEtnXMnwWYnOf1b0vrXFoFM96hXEselmeiOeOKkCfv
	hd2CpkHmP5fwb0dLy4VCCjSa2dwkeOpYxQ2ixj+zEBPdiqFAwkMUu4u/Ej0DlKPt/PWm544CA13
	IpBJWjp+GKzSZ4wPT8QL1hJKcNvc0n6udlfI0Lj2cfXOK3ezoClSKJny0zk6T8MLz9jveCbXd4E
	f41aOngZKzNhi1Y6J4C3Ey4S22/heC6qOUReriYGg3pt/TZYX/Q2+BGDReHtF7Hs5Fok+3A8FI9
	ni7QAw+QpDXAj3GbzL0Y9mlXTDhyFRfOO0x2VM3szvm4PGQCJazUq2AazMJhmvYGmzoeDxzc5Ld
	chndlfpAhyeRjO1+m
X-Google-Smtp-Source: AGHT+IFRMTN6w9HT262cGas0T+3Am3Bnp5bwLN3kMeXq9miMxLucFe2bT/kt/djeYtJrFfZOAPnR6w==
X-Received: by 2002:a17:907:2d23:b0:ad8:9428:6a35 with SMTP id a640c23a62f3a-adacda5d046mr216911566b.7.1748529359490;
        Thu, 29 May 2025 07:35:59 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff075sm154305866b.37.2025.05.29.07.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 07:35:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
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
Subject: [PATCH v4 4/6] ARM: dts: mxs: support i.MX28 Amarula rmm board
Date: Thu, 29 May 2025 16:35:11 +0200
Message-ID: <20250529143544.2381031-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
References: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_073601_385862_26AF1608 
X-CRM114-Status: GOOD (  16.74  )
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

The board includes the following resources:
 - 256 Mbytes NAND Flash
 - 128 Mbytes DRAM DDR2
 - CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v4:
- Drop label property (deprecated) under the leds sub-nodes.
- Add microSD comment above the ssp0 node.

Changes in v3:
- Drop xceiver-supply property from can0 node.
- Rearrange the order of specific nodes and properties
  alphabetically.

Changes in v2:
- Replace '-' with '@' for the pinctrl sub-nodes.
- Replace edt,edt-ft5x06 with edt,edt-ft5306.
- Drop LCD reset hog pin.
- Add correct #address-cells and #size-cells to gpmi node.
- Replace edt-ft5x06@38 with touchscreen@38.

 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 301 ++++++++++++++++++
 2 files changed, 302 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

diff --git a/arch/arm/boot/dts/nxp/mxs/Makefile b/arch/arm/boot/dts/nxp/mxs/Makefile
index 96dd31ea19ba..d72ba702b6fa 100644
--- a/arch/arm/boot/dts/nxp/mxs/Makefile
+++ b/arch/arm/boot/dts/nxp/mxs/Makefile
@@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_MXS) += \
 	imx23-sansa.dtb \
 	imx23-stmp378x_devb.dtb \
 	imx23-xfi3.dtb \
+	imx28-amarula-rmm.dtb \
 	imx28-apf28.dtb \
 	imx28-apf28dev.dtb \
 	imx28-apx4devkit.dtb \
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
new file mode 100644
index 000000000000..5ef9b79cda1c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
@@ -0,0 +1,301 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+/dts-v1/;
+
+#include "imx28.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible = "amarula,imx28-rmm", "fsl,imx28";
+	model = "Amarula i.MX28 rmm";
+
+	memory@40000000 {
+		reg = <0x40000000 0x08000000>;
+		device_type = "memory";
+	};
+
+	backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 4 5000000 0>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <255>;
+		power-supply = <&reg_5v>;
+	};
+
+	beeper {
+		compatible = "pwm-beeper";
+		pwms = <&pwm 7 100000 0>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&leds_pins>;
+
+		led-0 {
+			gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-1 {
+			gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-2 {
+			gpios = <&gpio3 17 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
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
+		regulator-always-on;
+	};
+
+	reg_5v: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	reg_fec_3v3: regulator-fec-3v3 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&fec_3v3_enable_pin>;
+		regulator-name = "fec-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <300000>;
+		vin-supply = <&reg_5v>;
+	};
+
+	reg_usb0_vbus: regulator-usb0-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb0_vbus_enable_pin>;
+		regulator-name = "usb0_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	reg_usb1_vbus: regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb1_vbus_enable_pin>;
+		regulator-name = "usb1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+};
+
+&auart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&auart0_2pins_a>;
+	status = "okay";
+};
+
+&auart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&auart1_pins_a>;
+	status = "okay";
+};
+
+&can0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can0_pins_a>;
+	status = "okay";
+};
+
+&duart {
+	pinctrl-names = "default";
+	pinctrl-0 = <&duart_pins_b>;
+	status = "okay";
+};
+
+&duart_pins_b {
+	fsl,voltage = <MXS_VOLTAGE_LOW>;
+};
+
+&gpmi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpmi_pins_a &gpmi_status_cfg>;
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins_a>;
+	status = "okay";
+
+	touchscreen: touchscreen@38 {
+		compatible = "edt,edt-ft5306";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&edt_ft5x06_pins &edt_ft5x06_wake_pin>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <19 IRQ_TYPE_EDGE_RISING>;
+		reset-gpios = <&gpio0 21 GPIO_ACTIVE_LOW>;
+		wake-gpios = <&gpio0 18 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&lradc {
+	status = "okay";
+};
+
+&mac0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mac0_pins_a>;
+	phy-mode = "rmii";
+	phy-supply = <&reg_fec_3v3>;
+	phy-handle = <&ethphy>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			max-speed = <100>;
+			reset-gpios = <&gpio3 28 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <4000>;
+			reset-deassert-us = <4000>;
+		};
+	};
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hog_pins_a>;
+
+	edt_ft5x06_pins: edt-ft5x06@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <
+			MX28_PAD_GPMI_RDY1__GPIO_0_21 /* Reset */
+			MX28_PAD_GPMI_CE3N__GPIO_0_19 /* Interrupt */
+		>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,pull-up = <MXS_PULL_ENABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+
+	edt_ft5x06_wake_pin: edt-ft5x06-wake@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <MX28_PAD_GPMI_CE2N__GPIO_0_18>;
+		fsl,drive-strength = <MXS_DRIVE_16mA>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+
+	fec_3v3_enable_pin: fec-3v3-enable@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <MX28_PAD_SPDIF__GPIO_3_27>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+
+	hog_pins_a: hog@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <
+			MX28_PAD_SSP2_SS1__GPIO_2_20  /* External power */
+		>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+
+	leds_pins: leds@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <
+			MX28_PAD_SSP0_DATA7__GPIO_2_7
+			MX28_PAD_PWM0__GPIO_3_16
+			MX28_PAD_PWM1__GPIO_3_17
+		>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+
+	usb0_vbus_enable_pin: usb0-vbus-enable@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA5__GPIO_2_5>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+
+	usb1_vbus_enable_pin: usb1-vbus-enable@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA6__GPIO_2_6>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+};
+
+&pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm4_pins_a &pwm7_pins_a>;
+	status = "okay";
+};
+
+/* microSD */
+&ssp0 {
+	compatible = "fsl,imx28-mmc";
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_4bit_pins_a &mmc0_sck_cfg>;
+	broken-cd;
+	bus-width = <4>;
+	status = "okay";
+};
+
+&usb0 {
+	dr_mode = "host";
+	vbus-supply = <&reg_usb0_vbus>;
+	status = "okay";
+};
+
+&usb1 {
+	dr_mode = "host";
+	vbus-supply = <&reg_usb1_vbus>;
+	status = "okay";
+};
+
+&usbphy0 {
+	status = "okay";
+};
+
+&usbphy1 {
+	status = "okay";
+};
-- 
2.43.0


