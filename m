Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88E5C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 09:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88zSqdF1oery5Ifyy1daaJl4Nvz7hA233uJOXHAMsbU=; b=N0yCrhyPYOZCpJBSXCmA0f8hsI
	1Slv9sSfoIe3KhNXb7aMpyGpgBapZYX7/MKtTkz6wzoVoN5m9R8NI7N4+lSmaiV5dYBMVcyYoxde/
	/TQDoBUfGEc/aCf4Qv8yLqtHpwzXenR/wIv44tYIyRIMYDpME/9JCkJZKuQ2YjeDP7dlV0yqIGSdf
	OT/7Xt6gIr7/26v+L2TwbuP1aUlRRWlmV+0PVL6NouBI5jLtdgDGlTO7tAk7zd7GYAoDXWheraB7s
	NTQvy9bxOBPwWbG+5KqD3JYWoUedyTUYXZBbbEZHV8J82QhAm5jmjKsgtolmBwYwPGXwo2H4VkEUv
	N3lFCd8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfwk-0000000FLu4-1j74;
	Wed, 21 May 2025 09:41:10 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfkZ-0000000FJWk-2SGA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 09:28:36 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5fbfdf7d353so8671638a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 02:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747819714; x=1748424514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88zSqdF1oery5Ifyy1daaJl4Nvz7hA233uJOXHAMsbU=;
        b=IPHaLszFakoW+rKH4yhwPsw6MfEaisoClzxMk/NXIeHY2Vh/nransApgRxU5vpdWWK
         SQceb3I8YP+E1c+8Nqw0KgghcZvJ9vg4O76uyU7KmnE6OHwROXu/eJ5mAupOif7xXg2f
         Pc0gRR3Zgi8zYuj52YUn8wtxjeI+cWH6cLllw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747819714; x=1748424514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88zSqdF1oery5Ifyy1daaJl4Nvz7hA233uJOXHAMsbU=;
        b=LN0WVe7ck+mreAkLyPUVmUUoWRn+bh41yIgEDR/4T3FHC7V/oJ02H02bLO5xP4pbH3
         h3sg//HyG4c6nRtyCxUVMSLtPbQMocKPLB9X94Ix523orXgk/m3JSMgEIdEWOwA3zrZt
         erzOe/WBhwbiAugz9IKs4D4BKJJ6SUeVPfKt4gW9ThludUj7Lgytxudn9qBSaIXuyXhs
         vCZ6rWfdsEOe6Cmh/MR7fkmIdV7FJ2KK/MLO3UFe5DpfxT4lvRlOLtucZGK4bizE/1UZ
         nTlsz3RD7zSUXxCPN5Un0VQDNC3vcm9sFcC8j+fmg3RVMqIlhUEOVf3GHU6G9YWBCu+I
         E5hg==
X-Forwarded-Encrypted: i=1; AJvYcCUIVF2jcYSx5LzuvRn6mp/ODm/dXxaN1dA+9WQ3/Gp8opYYRAAkaGopBkBhKvjWS3WLsB/R9plsrDNtQKy+GRfO@lists.infradead.org
X-Gm-Message-State: AOJu0YzQEQzFH7uxNiV8uYS1oM4vl5U5QtNoZn6BGSQIUqHIeSYANjut
	KaIFLXv12EUtnAL6kx6KdL8xEs3LhwpstDvJw6s928jx8/YUH0BtYmXV+WEvYm65wVc=
X-Gm-Gg: ASbGncsnlEqaXSNGK3tMmwPsKnkQi/o5WFYHc1Y8xJ1QBqYtYWsdqBwaSFqd0MsB0B/
	QajBTdq3xhVIF70fT9Wx/RCEOO1QfhGRmbGrXKwhBeiHhKYueD8o2R2uSw6OfiGXnn95gm6ABK1
	DtMngobNaFjf9mWbf7X3RbzCvi3vprO6Bp29jFCrEYl6dHlanaJj+QqG7CGMwHkxAq3M/SIsLqv
	jjxPcGHiPfg7CLEcSIIf4/bJjxMS4koyDlClhv8T5rCQ/OaYrtoM+TTzh3AqD4SnAq7vWQLdKye
	miopztKFCYjC50/rncvXCbydQsOlPoo/SKueokY+50xAL5IV1ZX/FxRz8+rVP6L168oUj5iW232
	vuPlqYiFml+8T
X-Google-Smtp-Source: AGHT+IHbZ8J/wRZ5lk7VnfS42O+2zQL+znLKT7ZMo3IHYU7HZnK0RacmYNlNgAkU20/pUPem8p2E7Q==
X-Received: by 2002:a17:906:4794:b0:ad5:54e0:4c97 with SMTP id a640c23a62f3a-ad554e04df2mr1260109466b.50.1747819713811;
        Wed, 21 May 2025 02:28:33 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:cfc5:5070:d6f4:1d86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d275d9fsm867442466b.74.2025.05.21.02.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 02:28:33 -0700 (PDT)
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
Subject: [PATCH 3/3] ARM: dts: mxs: support i.MX28 Amarula rmm board
Date: Wed, 21 May 2025 11:28:22 +0200
Message-ID: <20250521092826.1035448-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
References: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_022835_626920_949B1298 
X-CRM114-Status: GOOD (  16.14  )
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
 - 256 Mbytes SRAM
 - LCD-TFT controller
 - CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 302 ++++++++++++++++++
 2 files changed, 303 insertions(+)
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
index 000000000000..ce6b34e35e1c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
@@ -0,0 +1,302 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+/dts-v1/;
+#include "imx28.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "Amarula i.MX28 rmm";
+	compatible = "amarula,imx28-rmm", "fsl,imx28";
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x08000000>;
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
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
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
+			label = "status";
+			gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-1 {
+			label = "x22_5";
+			gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-2 {
+			label = "x22_4";
+			gpios = <&gpio3 17 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
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
+	xceiver-supply = <&reg_3v3>;
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
+	polytouch: edt-ft5x06@38 {
+		compatible = "edt,edt-ft5x06";
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
+	phy-mode = "rmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&mac0_pins_a>;
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
+	hog_pins_a: hog-0 {
+		reg = <0>;
+		fsl,pinmux-ids = <
+			MX28_PAD_LCD_RESET__GPIO_3_30 /* LCD reset */
+			MX28_PAD_SSP2_SS1__GPIO_2_20  /* External power */
+		>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+	};
+
+	edt_ft5x06_pins: edt-ft5x06-0 {
+		reg = <0>;
+		fsl,pinmux-ids = <
+			MX28_PAD_GPMI_RDY1__GPIO_0_21 /* Reset */
+			MX28_PAD_GPMI_CE3N__GPIO_0_19 /* Interrupt */
+		>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up = <MXS_PULL_ENABLE>;
+	};
+
+	edt_ft5x06_wake_pin: edt-ft5x06-wake-0 {
+		reg = <0>;
+		fsl,pinmux-ids = <MX28_PAD_GPMI_CE2N__GPIO_0_18>;
+		fsl,drive-strength = <MXS_DRIVE_16mA>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+	};
+
+	fec_3v3_enable_pin: fec-3v3-enable-0 {
+		reg = <0>;
+		fsl,pinmux-ids = <MX28_PAD_SPDIF__GPIO_3_27>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+	};
+
+	leds_pins: leds-0 {
+		reg = <0>;
+		fsl,pinmux-ids = <
+			MX28_PAD_SSP0_DATA7__GPIO_2_7
+			MX28_PAD_PWM0__GPIO_3_16
+			MX28_PAD_PWM1__GPIO_3_17
+		>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+	};
+
+	usb0_vbus_enable_pin: usb0-vbus-enable-0 {
+		reg = <0>;
+		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA5__GPIO_2_5>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+	};
+
+	usb1_vbus_enable_pin: usb1-vbus-enable-0 {
+		reg = <0>;
+		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA6__GPIO_2_6>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+	};
+};
+
+&pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm4_pins_a &pwm7_pins_a>;
+	status = "okay";
+};
+
+&ssp0 {
+	compatible = "fsl,imx28-mmc";
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_4bit_pins_a &mmc0_sck_cfg>;
+	status = "okay";
+	bus-width = <4>;
+	broken-cd;
+};
+
+&usb0 {
+	status = "okay";
+	vbus-supply = <&reg_usb0_vbus>;
+	dr_mode = "host";
+};
+
+&usb1 {
+	status = "okay";
+	vbus-supply = <&reg_usb1_vbus>;
+	dr_mode = "host";
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


