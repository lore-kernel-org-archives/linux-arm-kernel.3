Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7CBE9B36C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thg/hbiihCY04+UIp7gvux8UYhsB5SO5bPjGIUDMt48=; b=okencBfNVZM8zwLVGYWQPR2PFp
	b0TuU5Gsep+EJRRD4ZOQdmGcIsjlQc9kDj5BsU+nTCZaujstAqc34nh0pwrYhIlUWjE49igzoQuIx
	mteExXw7aIY4p6FmXbBHaReJNlp/FJI/x7a5T+m7kJWu2fMp4GKyWzUJ75K0vKT82hoQgBlpqQPBk
	nh9v+YZeLoSbnPUhCrZJRui4TjETMQV+52Oba3PEAVfi2t2MpyrIUFlf5cNf7iipqyy25uT5szaGk
	rM7EfsMaZNyndQeYtFQAwuryCG5UESY+HueSo+y6aZZj5hMbM3fbIP7KFVEVDH0XzDz2cPg3Do1xu
	pRb7ZtvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Ls-0000000CoD5-0Sln;
	Mon, 02 Mar 2026 11:22:16 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Lq-0000000Co9m-0Ssy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:22:15 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48374014a77so51629375e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 03:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1772450532; x=1773055332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thg/hbiihCY04+UIp7gvux8UYhsB5SO5bPjGIUDMt48=;
        b=NO1sLgX9wSWiKxiIH8Lnn4twBl/UT+zY7j+Gc7kL/k5SOiAsaDFYsp8daYt6PetB+t
         J3Jx0gOnicPlPKy2XniM+cpDdL1gCHxPreA9cZ+UwEQ9V8UqOYCOroFzJ5g5YWUiJ6YN
         crxHy+5HlDVaMLJiwavBtdAHtjvafr7I0hXsNhpARkJAxvSWeQU2T0OMjl8lfPxZyR/7
         ZGnz3XUhiZRc3/kFGd4LCLKYgLFrI8pQ6FVcvw/2rI6S6wenzc0D/3YScHtO6744RhwD
         3IRhzxnjZK3qQEtPaKI+UDv1q7sSRnB0SBFuPUZvBlR7Nd1AJdw//PEM01kZ08hmxP8a
         v8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772450532; x=1773055332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=thg/hbiihCY04+UIp7gvux8UYhsB5SO5bPjGIUDMt48=;
        b=IQamEOXoM41Fv2KLAkDDxSkcka56dG7qmkJE0ZtrIcjJl9M2aUx1Qpd5IS6YMzl4Nl
         6ipPho4PCd1NJagh1kGhWOokWn9HXuB16DCbh3rVjDbcaUiC33PSe1BSz584JCziLmwj
         SmQ1dxKB9HBz3QEWXA7rl9V5MN4oZAEV/FoQJxGSRddY8fwp77y7MftSldxs81uXCAg+
         fEFzTleGeoRSk3OaB98xg55LizFdoBPU65gwfSvLhvgtSeRjVU1IVYeWgZ7qAVIWzmSc
         mPmsi8DXEn/OEyYgzA3xzZixj97XXvndS93QCisssVInrine/angYFQnxkZi7fAZ3zzH
         mjgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMIdpZpkonXCdS4n3ZPDvEC29DgnpqtZWpQP7dP/wnAAmybpBv24GZOq+9zTgJtAqXAWdt5TDqFmV0IxQ9QYMC@lists.infradead.org
X-Gm-Message-State: AOJu0YxQeMkRRUKUWJqpbb/lFXfj+jpUr/BzgGRma7nLb9k3Gfgjp0E9
	oGrr+JLpzUKUB8dWF0vfhpbvuxHcVHDaDiCJd1acxVGtrproFQA5c9UlZV9Wc+f4rck=
X-Gm-Gg: ATEYQzxuJ4+vA2DnzFcHMIYGF35y9HdkjLF5eu26SB3bCbncNVTyDHfCNXavOMFJpSw
	Mcnd4JndVmsSEP3xiqWe/NZ73BICiAaZC4JpRReBTEzORsISmLPOmbok40jRg/BHmL0Yw7M5nnM
	GxdDy54QRIgOk5CJPY+0bGUxfZDKGw2N5wBQjnzmud2b1KOPsKH4iPoPaS3DeNHcRSJb0xikj7n
	jvZGls2XeQDWPNSUeylsQbCnYALGQT84fehGPw5jCC7/WOIQPjmW2ximpMEG47zKW0T6iGXGbAi
	pjJXmhTho8bQbn/ac2gM53WAu3PEbwObXa/7voEJXldOHPain0Qae2GudJ9ArbKNQZdoIlibylk
	M3al5V8uInQiVNTksjQvnBIomslfI0BQtg0UehaYZoq6TYCM64pllR2Y5V/5qJm3UjWycazgXiO
	/dDM3mWnXIfH/Q2+4Yyr2fFcy2gpb5Vb3DCaTTCkgMX1bZWiL2J/hIhCSs9EzzcQnjujuL7Uoxl
	Va/Cqnx407DARbfp5gB+h9ejwKxWVXAtlkncEzGrME=
X-Received: by 2002:a05:600c:468f:b0:477:7bca:8b2b with SMTP id 5b1f17b1804b1-483c9bca601mr213676955e9.15.1772450532402;
        Mon, 02 Mar 2026 03:22:12 -0800 (PST)
Received: from fedora (cpe-109-60-83-135.zg3.cable.xnet.hr. [109.60.83.135])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483bfbb465bsm292493035e9.3.2026.03.02.03.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 03:22:12 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	horatiu.vultur@microchip.com,
	Ryan.Wanner@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v6 6/6] arm64: dts: microchip: add EV23X71A board
Date: Mon,  2 Mar 2026 12:20:14 +0100
Message-ID: <20260302112153.464422-7-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302112153.464422-1-robert.marko@sartura.hr>
References: <20260302112153.464422-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_032214_315008_8897E0CD 
X-CRM114-Status: GOOD (  15.77  )
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

Microchip EV23X71A is an LAN9696 based evaluation board.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Acked-by: Daniel Machon <daniel.machon@microchip.com>
Tested-by: Daniel Machon <daniel.machon@microchip.com>
---
Changes in v6:
* Pick Reviewed-by from Claudiu
* Pick Tested-by and Acked-by from Daniel

Changes in v5:
* Remove phys property from port 29
* Alphanumericaly sort pin nodes

Changes in v2:
* Split from SoC DTSI commit
* Apply DTS coding style
* Enclose array in i2c-mux
* Alphanumericaly sort nodes
* Change management port mode to RGMII-ID 

 arch/arm64/boot/dts/microchip/Makefile        |   1 +
 .../boot/dts/microchip/lan9696-ev23x71a.dts   | 756 ++++++++++++++++++
 2 files changed, 757 insertions(+)
 create mode 100644 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts

diff --git a/arch/arm64/boot/dts/microchip/Makefile b/arch/arm64/boot/dts/microchip/Makefile
index c6e0313eea0f..09d16fc1ce9a 100644
--- a/arch/arm64/boot/dts/microchip/Makefile
+++ b/arch/arm64/boot/dts/microchip/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_LAN969X) += lan9696-ev23x71a.dtb
 dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb125.dtb
 dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb134.dtb sparx5_pcb134_emmc.dtb
 dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb135.dtb sparx5_pcb135_emmc.dtb
diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
new file mode 100644
index 000000000000..4012ea7d07bb
--- /dev/null
+++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
@@ -0,0 +1,756 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2025 Microchip Technology Inc. and its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include "lan9691.dtsi"
+
+/ {
+	model = "Microchip EV23X71A";
+	compatible = "microchip,ev23x71a", "microchip,lan9696", "microchip,lan9691";
+
+	aliases {
+		serial0 = &usart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-restart {
+		compatible = "gpio-restart";
+		gpios = <&gpio 60 GPIO_ACTIVE_LOW>;
+		open-source;
+		priority = <200>;
+	};
+
+	i2c-mux {
+		compatible = "i2c-mux-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-parent = <&i2c3>;
+		idle-state = <0x8>;
+		mux-gpios = <&sgpio_out 0 1 GPIO_ACTIVE_HIGH>,
+			    <&sgpio_out 0 2 GPIO_ACTIVE_HIGH>,
+			    <&sgpio_out 0 3 GPIO_ACTIVE_HIGH>;
+		settle-time-us = <100>;
+
+		i2c_sfp0: i2c@0 {
+			reg = <0x0>;
+		};
+
+		i2c_sfp1: i2c@1 {
+			reg = <0x1>;
+		};
+
+		i2c_sfp2: i2c@2 {
+			reg = <0x2>;
+		};
+
+		i2c_sfp3: i2c@3 {
+			reg = <0x3>;
+		};
+
+		i2c_poe: i2c@7 {
+			reg = <0x7>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-status {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio 61 GPIO_ACTIVE_LOW>;
+		};
+
+		led-sfp1-green {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <0>;
+			gpios = <&sgpio_out 6 0 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led-sfp1-yellow {
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <0>;
+			gpios = <&sgpio_out 6 1 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led-sfp2-green {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <1>;
+			gpios = <&sgpio_out 7 0 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led-sfp2-yellow {
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <1>;
+			gpios = <&sgpio_out 7 1 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led-sfp3-green {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <2>;
+			gpios = <&sgpio_out 8 0 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led-sfp3-yellow {
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <2>;
+			gpios = <&sgpio_out 8 1 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led-sfp4-green {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <3>;
+			gpios = <&sgpio_out 9 0 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led-sfp4-yellow {
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <3>;
+			gpios = <&sgpio_out 9 1 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+	};
+
+	mux-controller {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		mux-gpios = <&sgpio_out 1 2 GPIO_ACTIVE_LOW>,
+			    <&sgpio_out 1 3 GPIO_ACTIVE_LOW>;
+	};
+
+	sfp0: sfp0 {
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp0>;
+		tx-disable-gpios = <&sgpio_out 6 2 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in 6 0 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in 6 1 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in 6 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	sfp1: sfp1 {
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp1>;
+		tx-disable-gpios = <&sgpio_out 7 2 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in 7 0 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in 7 1 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in 7 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	sfp2: sfp2 {
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp2>;
+		tx-disable-gpios = <&sgpio_out 8 2 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in 8 0 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in 8 1 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in 8 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	sfp3: sfp3 {
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp3>;
+		tx-disable-gpios = <&sgpio_out 9 2 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in 9 0 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in 9 1 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in 9 2 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&gpio {
+	emmc_sd_pins: emmc-sd-pins {
+		/* eMMC_SD - CMD, CLK, D0, D1, D2, D3, D4, D5, D6, D7, RSTN */
+		pins = "GPIO_14", "GPIO_15", "GPIO_16", "GPIO_17",
+		       "GPIO_18", "GPIO_19", "GPIO_20", "GPIO_21",
+		       "GPIO_22", "GPIO_23", "GPIO_24";
+		function = "emmc_sd";
+	};
+
+	fan_pins: fan-pins {
+		pins = "GPIO_25", "GPIO_26";
+		function = "fan";
+	};
+
+	fc0_pins: fc0-pins {
+		pins = "GPIO_3", "GPIO_4";
+		function = "fc";
+	};
+
+	fc2_pins: fc2-pins {
+		pins = "GPIO_64", "GPIO_65", "GPIO_66";
+		function = "fc";
+	};
+
+	fc3_pins: fc3-pins {
+		pins = "GPIO_55", "GPIO_56";
+		function = "fc";
+	};
+
+	mdio_irq_pins: mdio-irq-pins {
+		pins = "GPIO_11";
+		function = "miim_irq";
+	};
+
+	mdio_pins: mdio-pins {
+		pins = "GPIO_9", "GPIO_10";
+		function = "miim";
+	};
+
+	ptp_ext_pins: ptp-ext-pins {
+		pins = "GPIO_59";
+		function = "ptpsync_5";
+	};
+
+	ptp_out_pins: ptp-out-pins {
+		pins = "GPIO_58";
+		function = "ptpsync_4";
+	};
+
+	sgpio_pins: sgpio-pins {
+		/* SCK, D0, D1, LD */
+		pins = "GPIO_5", "GPIO_6", "GPIO_7", "GPIO_8";
+		function = "sgpio_a";
+	};
+
+	usb_over_pins: usb-over-pins {
+		pins = "GPIO_13";
+		function = "usb_over_detect";
+	};
+
+	usb_power_pins: usb-power-pins {
+		pins = "GPIO_1";
+		function = "usb_power";
+	};
+
+	usb_rst_pins: usb-rst-pins {
+		pins = "GPIO_12";
+		function = "usb2phy_rst";
+	};
+
+	usb_ulpi_pins: usb-ulpi-pins {
+		pins = "GPIO_30", "GPIO_31", "GPIO_32", "GPIO_33",
+		       "GPIO_34", "GPIO_35", "GPIO_36", "GPIO_37",
+		       "GPIO_38", "GPIO_39", "GPIO_40", "GPIO_41";
+		function = "usb_ulpi";
+	};
+};
+
+&flx0 {
+	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_USART>;
+	status = "okay";
+};
+
+&flx2 {
+	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_SPI>;
+	status = "okay";
+};
+
+&flx3 {
+	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
+	status = "okay";
+};
+
+&i2c3 {
+	pinctrl-0 = <&fc3_pins>;
+	pinctrl-names = "default";
+	i2c-analog-filter;
+	i2c-digital-filter;
+	i2c-digital-filter-width-ns = <35>;
+	i2c-sda-hold-time-ns = <1500>;
+	status = "okay";
+};
+
+&mdio0 {
+	pinctrl-0 = <&mdio_pins>, <&mdio_irq_pins>;
+	pinctrl-names = "default";
+	reset-gpios = <&gpio 62 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	phy3: phy@3 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <3>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy4: phy@4 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <4>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy5: phy@5 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <5>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy6: phy@6 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <6>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy7: phy@7 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <7>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy8: phy@8 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <8>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy9: phy@9 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <9>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy10: phy@10 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <10>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy11: phy@11 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <11>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy12: phy@12 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <12>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy13: phy@13 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <13>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy14: phy@14 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <14>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy15: phy@15 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <15>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy16: phy@16 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <16>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy17: phy@17 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <17>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy18: phy@18 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <18>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy19: phy@19 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <19>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy20: phy@20 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <20>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy21: phy@21 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <21>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy22: phy@22 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <22>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy23: phy@23 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <23>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy24: phy@24 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <24>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy25: phy@25 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <25>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy26: phy@26 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <26>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+
+	phy27: phy@27 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <27>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio>;
+	};
+};
+
+&serdes {
+	status = "okay";
+};
+
+&sgpio {
+	pinctrl-0 = <&sgpio_pins>;
+	pinctrl-names = "default";
+	microchip,sgpio-port-ranges = <0 1>, <6 9>;
+	status = "okay";
+
+	gpio@0 {
+		ngpios = <128>;
+	};
+	gpio@1 {
+		ngpios = <128>;
+	};
+};
+
+&spi2 {
+	pinctrl-0 = <&fc2_pins>;
+	pinctrl-names = "default";
+	cs-gpios = <&gpio 63 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&switch {
+	pinctrl-0 = <&ptp_out_pins>, <&ptp_ext_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ethernet-ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port0: port@0 {
+			reg = <0>;
+			phy-handle = <&phy4>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 0>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port1: port@1 {
+			reg = <1>;
+			phy-handle = <&phy5>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 0>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port2: port@2 {
+			reg = <2>;
+			phy-handle = <&phy6>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 0>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port3: port@3 {
+			reg = <3>;
+			phy-handle = <&phy7>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 0>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port4: port@4 {
+			reg = <4>;
+			phy-handle = <&phy8>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 1>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port5: port@5 {
+			reg = <5>;
+			phy-handle = <&phy9>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 1>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port6: port@6 {
+			reg = <6>;
+			phy-handle = <&phy10>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 1>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port7: port@7 {
+			reg = <7>;
+			phy-handle = <&phy11>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 1>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port8: port@8 {
+			reg = <8>;
+			phy-handle = <&phy12>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 2>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port9: port@9 {
+			reg = <9>;
+			phy-handle = <&phy13>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 2>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port10: port@10 {
+			reg = <10>;
+			phy-handle = <&phy14>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 2>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port11: port@11 {
+			reg = <11>;
+			phy-handle = <&phy15>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 2>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port12: port@12 {
+			reg = <12>;
+			phy-handle = <&phy16>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 3>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port13: port@13 {
+			reg = <13>;
+			phy-handle = <&phy17>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 3>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port14: port@14 {
+			reg = <14>;
+			phy-handle = <&phy18>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 3>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port15: port@15 {
+			reg = <15>;
+			phy-handle = <&phy19>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 3>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port16: port@16 {
+			reg = <16>;
+			phy-handle = <&phy20>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 4>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port17: port@17 {
+			reg = <17>;
+			phy-handle = <&phy21>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 4>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port18: port@18 {
+			reg = <18>;
+			phy-handle = <&phy22>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 4>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port19: port@19 {
+			reg = <19>;
+			phy-handle = <&phy23>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 4>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port20: port@20 {
+			reg = <20>;
+			phy-handle = <&phy24>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 5>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port21: port@21 {
+			reg = <21>;
+			phy-handle = <&phy25>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 5>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port22: port@22 {
+			reg = <22>;
+			phy-handle = <&phy26>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 5>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port23: port@23 {
+			reg = <23>;
+			phy-handle = <&phy27>;
+			phy-mode = "qsgmii";
+			phys = <&serdes 5>;
+			microchip,bandwidth = <1000>;
+		};
+
+		port24: port@24 {
+			reg = <24>;
+			phys = <&serdes 6>;
+			phy-mode = "10gbase-r";
+			sfp = <&sfp0>;
+			managed = "in-band-status";
+			microchip,bandwidth = <10000>;
+			microchip,sd-sgpio = <24>;
+		};
+
+		port25: port@25 {
+			reg = <25>;
+			phys = <&serdes 7>;
+			phy-mode = "10gbase-r";
+			sfp = <&sfp1>;
+			managed = "in-band-status";
+			microchip,bandwidth = <10000>;
+			microchip,sd-sgpio = <28>;
+		};
+
+		port26: port@26 {
+			reg = <26>;
+			phys = <&serdes 8>;
+			phy-mode = "10gbase-r";
+			sfp = <&sfp2>;
+			managed = "in-band-status";
+			microchip,bandwidth = <10000>;
+			microchip,sd-sgpio = <32>;
+		};
+
+		port27: port@27 {
+			reg = <27>;
+			phys = <&serdes 9>;
+			phy-mode = "10gbase-r";
+			sfp = <&sfp3>;
+			managed = "in-band-status";
+			microchip,bandwidth = <10000>;
+			microchip,sd-sgpio = <36>;
+		};
+
+		port29: port@29 {
+			reg = <29>;
+			phy-handle = <&phy3>;
+			phy-mode = "rgmii-id";
+			microchip,bandwidth = <1000>;
+		};
+	};
+};
+
+&tmon {
+	pinctrl-0 = <&fan_pins>;
+	pinctrl-names = "default";
+};
+
+&usart0 {
+	pinctrl-0 = <&fc0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usb {
+	pinctrl-0 = <&usb_ulpi_pins>, <&usb_rst_pins>, <&usb_over_pins>, <&usb_power_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.53.0


