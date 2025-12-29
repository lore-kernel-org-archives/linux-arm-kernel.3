Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2CDE8FDBE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 15:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjlykm9S0zX68BzphJ+I042wVupIRQF5TQAMaP+mEhs=; b=yOrd9Fe/XpekVycS/aM3/0OCSD
	m3bPfr/f7qV39eNvtXFT6LiP3ypSSMmr7nrbeAR+h+tK3TJDctQkjg50eWLbJ9rNByqfPHWr5lpXD
	KroDUdBFu0o734fpmYh8cXIVeTawYxiYYo2LlpJgC1nYRZCJbToTkn5oI8c3guEGkYClMifNqwNxY
	PqZMQ8TvzsJ9laAUeg650k6oEBjQoX8SF6h93RCyO2Ia2twgOreuv5AiOd+rvqbV9OZvwufaJFt2U
	YL1RHgwJDdf9uS2oqtcYru+URQ5FDhKTsjRIEbCp+WuywI76OwrEEr9m1r5Kg470siyEsH2YP64KJ
	MUUR198g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEo0-00000003omZ-2YDd;
	Mon, 29 Dec 2025 15:05:08 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEnv-00000003oj6-1ZYd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 15:05:04 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4327790c4e9so1422825f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 07:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767020701; x=1767625501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjlykm9S0zX68BzphJ+I042wVupIRQF5TQAMaP+mEhs=;
        b=XzcnntDGDGTTY9hxuUxd00d7uSIRyWqbCDHS8Uj0bONqwYDM99pmh0PCSuvEdNfR75
         3AXRH/KMuXRMDFMIOdZWV7Vdz7CN0i0KtzOqJsRcPiUEYCdkVLY3wd8l1cJuGwuj1o/Y
         zDOvEWXgRXLYBn15yRiCrYpqbDItIZa6GLJovrvo/Sk82Zn38lN2jPTpia8sEqxBJpG2
         HJGSnypqOBkOhrC0QfmBqZanIljUBDBhz0QyNES7Lgg9hKduueiGrDlgCPpX35FOs0RJ
         ryPotru1sazKNj+22aG6qbZJQdV1kS8PwiOiuIZZ3m1lPjdIEaLc08ZEZc8pJddLgQAh
         lrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767020701; x=1767625501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cjlykm9S0zX68BzphJ+I042wVupIRQF5TQAMaP+mEhs=;
        b=bK6AfoFQwvOvNIaa/QDFQ9dg2U/9OQfXfztzrc9cbVlnDtNgBh+CtaVH/EGkGIEQXL
         Ao94ofu7m6sTxR/jHVxE2zGmKgodcTRCoyvx+yKN9Fif2w2jH8bhsN613GvNlTfUe5uc
         Obe+L8NZ4Rylp5a49DzARryzpvQJwWqk7I07Pabhf+sop3Ga0cK3zde3ARf5MBqkWprR
         sbS5uAQAsFn7c705dzFDCejeOLTX+s52bKj1IeoFJWoCM4q+HZbhsUaRW/Luf99E2Lqg
         69wcJzvSjB58xq6ZCIWYhgu8vyF85m8oHZuliu51s4I9AdGGqzWm5QJuPF4NN/DEVKpj
         jApQ==
X-Forwarded-Encrypted: i=1; AJvYcCURoFLD79A1GLv2uMEZNMEwBeA6GRWRp7hFUXlVEWwTjuPikwQ5k5uIsX47clIRHaYBCc2HTZ59PBW90Yal6d/Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwX1k7mYD30Vjxc6ztLxi6YI1Z3yI2TYaf9SDMNwrospTEHCcPT
	SsCp7PalKt/G5U9TdlcsyF/QZ4Ix/jYKGGEAOF+CbBESxBmYxuMZQbtD
X-Gm-Gg: AY/fxX4VKJUG09qfSUWF3bmlxZN7/UtE78/Dz3weBFWxGzKYPRkW9qn/JK5NKJr/nZc
	vfrQ+OrOpD/kml2DuHyvLzcKezb/jzM6enIFOavC6yB4Sq5CIbgIL8h03Qkcm6DgZ7s1GmE5eG/
	OIMhAHeaBn3curdL9sRJl5IbsUdUZYcX3o5sBsRlUtwIQ3ekf8rxTC7AbmImfPwiIVlv3kW2c6O
	yeGVv5rFIawdKqcwXhRzEgd2rn54WDZz7PnDqV70AzH0FPahOh2vzHcDa0x8+LA5JV51ldUXE4a
	6vcBFFklrUwR51bQMBgENaPZYbrXolCjoQn1/KHlWRD+xitKKG+VtZRrI8gn+hv/+OuwOLOUDCm
	85Nq/gzkHTt5NW0RqKGjdUujA024aQIrqPL6V0z34+GlA4vfKA+TvI1N0T4D5oao7wED++6sco7
	RTFrwZjQyD/IML9qi/vbf92NvHQJvzxgV32mjxddMJofpL8anLZU9+DjLPqIGLvEODD3Ed2DPx/
	w6ffO58aGcC58IwWbiK
X-Google-Smtp-Source: AGHT+IEsH1Kl22tPhtwzG7HkfnTFNS+oMLzWtDgyaACuU5/+7YMIk5MX2Wf+5WXvIA03DMlieIVoCw==
X-Received: by 2002:a5d:5451:0:b0:432:5bac:3914 with SMTP id ffacd0b85a97d-4325bac39a8mr23668866f8f.40.1767020701161;
        Mon, 29 Dec 2025 07:05:01 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-220.cust.vodafonedsl.it. [5.94.28.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4325d10cc48sm52899902f8f.16.2025.12.29.07.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 07:05:00 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Yannic Moog <y.moog@phytec.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 3/3] arm64: dts: imx95-var-dart: Add support for Variscite Sonata board
Date: Mon, 29 Dec 2025 16:04:11 +0100
Message-ID: <20251229150421.57616-4-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229150421.57616-1-stefano.r@variscite.com>
References: <20251229150421.57616-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_070503_570620_205784B3 
X-CRM114-Status: GOOD (  18.14  )
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

Add device tree support for the Variscite Sonata carrier board with
the DART-MX95 system on module.

The Sonata board includes
- uSD Card support
- USB ports and OTG
- Additional Gigabit Ethernet interface
- 10Gb Ethernet SFP+ connector
- Uart interfaces
- OV5640 Camera support
- GPIO Expanders
- RTC module
- TPM module
- PCIE support

Link: https://variscite.com/carrier-boards/sonata-board/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-var-dart-sonata.dts   | 588 ++++++++++++++++++
 2 files changed, 589 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f30d3fd724d0..411f86013ec6 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -404,6 +404,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata.dtb
 
 imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
new file mode 100644
index 000000000000..ac7544831b24
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -0,0 +1,588 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Variscite Sonata carrier board for DART-MX95
+ *
+ * Link: https://variscite.com/carrier-boards/sonata-board/
+ *
+ * Copyright (C) 2025 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include "imx95-var-dart.dtsi"
+
+/ {
+	model = "Variscite DART-MX95 on Sonata-Board";
+	compatible = "variscite,var-dart-mx95-sonata",
+		     "variscite,var-dart-mx95",
+		     "fsl,imx95";
+
+	aliases {
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		serial0 = &lpuart1;
+		ethernet0 = &enetc_port0;
+		ethernet1 = &enetc_port1;
+		ethernet2 = &enetc_port2;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	typec_con: connector {
+		compatible = "usb-c-connector";
+		data-role = "dual";
+		label = "USB-C";
+		op-sink-microwatt = <0>;
+		power-role = "dual";
+		self-powered;
+		sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+		source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+		try-power-role = "sink";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				typec_con_hs: endpoint {
+					remote-endpoint = <&usb3_data_hs>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				typec_con_ss: endpoint {
+					remote-endpoint = <&usb3_data_ss>;
+				};
+			};
+		};
+	};
+
+	clk_osc_can0: clock-osc-40m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_leds>;
+
+		led-heartbeat {
+			label = "Heartbeat";
+			gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-back {
+			label = "Back";
+			linux,code = <KEY_BACK>;
+			gpios = <&pca6408_1 7 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-up {
+			label = "Up";
+			linux,code = <KEY_UP>;
+			gpios = <&pca6408_1 5 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&pca6408_1 4 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-down {
+			label = "Down";
+			linux,code = <KEY_DOWN>;
+			gpios = <&pca6408_1 6 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
+	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		regulator-name = "VDD_SD2_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		off-on-delay-us = <12000>;
+		enable-active-high;
+	};
+
+	reg_phy1_supply: regulator-phy1 {
+		compatible = "regulator-fixed";
+		regulator-name = "SUPPLY_PHY1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
+		startup-delay-us = <10000>;
+		enable-active-high;
+		regulator-always-on;
+	};
+};
+
+&enetc_port1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enetc1>;
+	phy-handle = <&ethphy1>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	status = "okay";
+};
+
+&enetc_port2 {
+	phy-mode = "10gbase-r";
+	status = "okay";
+
+	fixed-link {
+		speed = <10000>;
+		full-duplex;
+		link-gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	status = "okay";
+};
+
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio", "sleep";
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
+	pinctrl-2 = <&pinctrl_lpi2c3_gpio>;
+	scl-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
+	sda-gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+
+	/* DS1337 RTC module */
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+		wakeup-source;
+	};
+
+	/* Capacitive touch controller */
+	ft5x06_ts: ft5x06_ts@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch>;
+		reset-gpios = <&pca6408_2 4 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
+	pca9534: gpio@22 {
+		compatible = "nxp,pca9534";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+
+		pcie2-sel-hog {
+			gpio-hog;
+			gpios = <6 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "pcie-clk-sw";
+		};
+
+		sfp-sel-hog {
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "sfp-sw";
+		};
+	};
+
+	typec@3d {
+		compatible = "nxp,ptn5150";
+		reg = <0x3d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ptn5150>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <14 IRQ_TYPE_LEVEL_HIGH>;
+
+		port {
+			typec_dr_sw: endpoint {
+				remote-endpoint = <&usb3_drd_sw>;
+			};
+		};
+	};
+};
+
+&lpi2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_lpi2c4>;
+	pinctrl-1 = <&pinctrl_lpi2c4>;
+	status = "okay";
+};
+
+&lpi2c8 {
+	pca6408_1: gpio@20 {
+		compatible = "nxp,pcal6408";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	pca6408_2: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+	};
+};
+
+&lpspi7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi7>;
+	cs-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	/* Resistive touch controller */
+	ads7846@0 {
+		compatible = "ti,ads7846";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_restouch>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
+		pendown-gpio = <&gpio2 24 GPIO_ACTIVE_LOW>;
+		spi-max-frequency = <1500000>;
+		ti,x-min = /bits/ 16 <125>;
+		ti,x-max = /bits/ 16 <4008>;
+		ti,y-min = /bits/ 16 <282>;
+		ti,y-max = /bits/ 16 <3864>;
+		ti,x-plate-ohms = /bits/ 16 <180>;
+		ti,pressure-max = /bits/ 16 <255>;
+		ti,debounce-max = /bits/ 16 <10>;
+		ti,debounce-tol = /bits/ 16 <3>;
+		ti,debounce-rep = /bits/ 16 <1>;
+		ti,settle-delay-usec = /bits/ 16 <150>;
+		ti,keep-vref-on;
+		wakeup-source;
+	};
+};
+
+/* Console */
+&lpuart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+/* Header (J12.4, J12.6) */
+&lpuart8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart8>;
+	status = "okay";
+};
+
+&netc_emdio {
+
+	ethphy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+		reset-gpios = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <100000>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_YELLOW>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+			};
+		};
+	};
+};
+
+&pcie0 {
+	reset-gpio = <&pca6408_2 3 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie1 {
+	reset-gpio = <&pca6408_2 2 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&scmi_iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			/* GPIO Expanders shared IRQ */
+			IMX95_PAD_GPIO_IO37__GPIO5_IO_BIT17				0x31e
+		>;
+	};
+
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO33__GPIO5_IO_BIT13				0x31e
+		>;
+	};
+
+	pinctrl_enetc1: enetc1grp {
+		fsl,pins = <
+			IMX95_PAD_ENET2_TXC__NETCMIX_TOP_ETH1_RGMII_TX_CLK		0x57e
+			IMX95_PAD_ENET2_TX_CTL__NETCMIX_TOP_ETH1_RGMII_TX_CTL		0x57e
+			IMX95_PAD_ENET2_TD3__NETCMIX_TOP_ETH1_RGMII_TD3			0x57e
+			IMX95_PAD_ENET2_TD2__NETCMIX_TOP_ETH1_RGMII_TD2			0x57e
+			IMX95_PAD_ENET2_TD1__NETCMIX_TOP_ETH1_RGMII_TD1			0x57e
+			IMX95_PAD_ENET2_TD0__NETCMIX_TOP_ETH1_RGMII_TD0			0x57e
+			IMX95_PAD_ENET2_RXC__NETCMIX_TOP_ETH1_RGMII_RX_CLK		0x57e
+			IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_ETH1_RGMII_RX_CTL		0x57e
+			IMX95_PAD_ENET2_RD0__NETCMIX_TOP_ETH1_RGMII_RD0			0x57e
+			IMX95_PAD_ENET2_RD1__NETCMIX_TOP_ETH1_RGMII_RD1			0x57e
+			IMX95_PAD_ENET2_RD2__NETCMIX_TOP_ETH1_RGMII_RD2			0x57e
+			IMX95_PAD_ENET2_RD3__NETCMIX_TOP_ETH1_RGMII_RD3			0x37e /* Enable pull-up to strap MXL86110 MDIO address */
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			IMX95_PAD_PDM_CLK__AONMIX_TOP_CAN1_TX				0x39e
+			IMX95_PAD_PDM_BIT_STREAM0__AONMIX_TOP_CAN1_RX			0x39e
+		>;
+	};
+
+	pinctrl_gpio_leds: ledgrp {
+		fsl,pins = <
+			IMX95_PAD_CCM_CLKO2__GPIO3_IO_BIT27				0x31e
+		>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO28__LPI2C3_SDA					0x40000b9e
+			IMX95_PAD_GPIO_IO29__LPI2C3_SCL					0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c3_gpio: lpi2c3gpiogrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO28__GPIO2_IO_BIT28				0x31e
+			IMX95_PAD_GPIO_IO29__GPIO2_IO_BIT29				0x31e
+		>;
+	};
+
+	pinctrl_lpi2c4: lpi2c4grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO30__LPI2C4_SDA					0x40000b9e
+			IMX95_PAD_GPIO_IO31__LPI2C4_SCL					0x40000b9e
+		>;
+	};
+
+	pinctrl_lpspi7: lpspi7grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO04__GPIO2_IO_BIT4				0x3fe		/* j16.4 ADS7846 */
+			IMX95_PAD_UART2_TXD__AONMIX_TOP_GPIO1_IO_BIT7			0x3fe		/* j14.4 MCP2518FDT */
+			IMX95_PAD_XSPI1_DATA4__GPIO5_IO_BIT4				0x3fe		/* j25.2 spidev */
+			IMX95_PAD_GPIO_IO05__LPSPI7_SIN					0x3fe
+			IMX95_PAD_GPIO_IO06__LPSPI7_SOUT				0x3fe
+			IMX95_PAD_GPIO_IO07__LPSPI7_SCK					0x3fe
+		>;
+	};
+
+	pinctrl_ptn5150: ptn5150grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14				0x31e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7				0x31e
+		>;
+	};
+
+	pinctrl_restouch: restouchgrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO24__GPIO2_IO_BIT24				0x31e
+		>;
+	};
+
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO32__GPIO5_IO_BIT12				0x31e
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX			0x31e
+			IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX			0x31e
+		>;
+	};
+
+	pinctrl_uart8: uart8grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO13__LPUART8_RX					0x31e
+			IMX95_PAD_GPIO_IO12__LPUART8_TX					0x31e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0				0x31e
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CLK__USDHC2_CLK					0x158e
+			IMX95_PAD_SD2_CMD__USDHC2_CMD					0x138e
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0				0x138e
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1				0x138e
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2				0x138e
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3				0x138e
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT				0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CLK__USDHC2_CLK					0x158e
+			IMX95_PAD_SD2_CMD__USDHC2_CMD					0x138e
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0				0x138e
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1				0x138e
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2				0x138e
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3				0x138e
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT				0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CLK__USDHC2_CLK					0x15fe
+			IMX95_PAD_SD2_CMD__USDHC2_CMD					0x13fe
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0				0x13fe
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1				0x13fe
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2				0x13fe
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3				0x13fe
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT				0x51e
+		>;
+	};
+};
+
+&usb2 {
+	dr_mode = "host";
+	adp-disable;
+	hnp-disable;
+	srp-disable;
+	disable-over-current;
+	status = "okay";
+};
+
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	status = "okay";
+
+	port {
+		usb3_drd_sw: endpoint {
+			remote-endpoint = <&typec_dr_sw>;
+		};
+	};
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			usb3_data_hs: endpoint {
+				remote-endpoint = <&typec_con_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			usb3_data_ss: endpoint {
+				remote-endpoint = <&typec_con_ss>;
+			};
+		};
+	};
+};
+
+&usb3_phy {
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
+	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-names = "default","state_100mhz","state_200mhz","sleep";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
-- 
2.47.3


