Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A46610BA457
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5hJhTVETBI8BBIu2101FUx1H78Tkghq9JKrpJq7xtg=; b=jp6O7HST4/vDiKkABBtaJ0J0mW
	+LFFfHj+G6kZ1lRcWb+bGoYWZTu/2M8MCLATLCqbKf6YxqebmOPVW5saVndFiJrqlQhQwhRaJVgNb
	iG12NyOCjUkoIXbfXLmMv2utQVaL6jZ+Vkbdo3Ln3sI8pVVC4pFvuwMtIgrD0P96PrC+baA7xBEjJ
	ehvh4cZlu+7/u+hP3HsVw7HXE3BXZi0jtYhVbb9N1wwdDwwQhzPU8oOuUOjuO9dnsQe6kqpCd50Ic
	hErfEIZukqSZTTPaQDXb4jFTo2Ce6bN+1BUHKNHUEwGpUmzhSB5RXpcAzdZLsMrqt8Nf/hRN0CL8M
	v98/rLew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63By-000000072Q6-3JRz;
	Fri, 27 Mar 2026 09:09:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Bs-000000072O3-3ci9
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 09:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=V5hJhTVETBI8BBIu2101FUx1H78Tkghq9JKrpJq7xtg=; b=VQ0QTjdtQI9h7ULWuUU4VCXwuV
	aWyXDMrZ+jCgOxFpFtR/91F3heu7C6VyewTvWDZPG33eihz5eGe1Wc9yXExu2GcVC8yvMZ20ZrekD
	AobqSW6FbyifbNV8T60UwDJeN71h8LwzXm7VnZ1YvPIY1Y20lh3iqwkGRfAZ8qCOIAFOBWoHYZTvM
	XW5fif4zdLuT58MVDFXEy6sjRiUyriV4sjSKtFKytz//fDzPnSuRljyzzYirVzxw6d/AtKPRPVmWv
	5qtj4muWSvDWAw4Tdv/BHl7EapL6K+wzUl/k+EjfE6Pdj21ocbSZFsNHJqF6dEZfsZvbJ7Nr9Cvn9
	4shd3nkg==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Bp-0000000A2Jr-2FoE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 09:09:15 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso14342385e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 02:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774602552; x=1775207352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5hJhTVETBI8BBIu2101FUx1H78Tkghq9JKrpJq7xtg=;
        b=l7gcihXwFd1sLETos3M/CnOxZlUzNYBu42TdgIvxC15u6fmwSi6+ckw9O3+SJqkd7J
         Nqk1XerIobpRd0615+2jX+7U04P9n26bWJ2kTm7QEo0Nquy/XL+wGDr64wFfY3/LsimK
         YjAieQyakqUPZaF1eJ7uXVVHmVce5dYWJgqdeLA/6NE8budHxv3ZqnHniw0iBrocpR7r
         5mvUyDrF3fMEkG2hJyV8S6OkCTDrNG6g/WaGIVFOnRzDzNd5arfMTV9DNUfsPlr8CBIv
         BWTRbOLgS6trbgK4hJRzDwJzTokWsCQSDHNif1TCYeNoUzLQeW6PrQZiy56FS8BMEY4C
         LLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602552; x=1775207352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V5hJhTVETBI8BBIu2101FUx1H78Tkghq9JKrpJq7xtg=;
        b=IkSMTM3/yQDdJlwQtif5mEmYFHWVolO/2hujt9b1dVObb8qGjYCo8I2VWVuW9T/qgg
         ZEUThQMiPU3PGc3V++UEtW7CdUTaqsPQ8laGgooQwT8xhgt4C7v1B6AMoocZI8Sj9kJB
         IDpw8LeqQvUhRbUmxQIxnCRZSgecB+94vM5Cxhn38XJ1FEZYan4Lqb1LHszSly4EkNfp
         zNOkGnSIPWnMkE7lLmh26s8A337WEabRwQ+v5iMv1t8Q0GHZCo1wDUksyz0yYqH3nD+T
         2nUE6A3B/P88Jlc+qcdKc80h7h06fwwDbA6SrS61Q/u3MCei9CuQLFy56ByuTFLQCBeS
         zL2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEIk0uqzW8GapQYumQ0d6xgO3vMFofbjTzz6DDlvIaD3TmjrLDpvyjZErEsPxfk5CWNEkGu+nTwO9lpCXjYoyV@lists.infradead.org
X-Gm-Message-State: AOJu0YxvM9dzdLScuKQzUlmkg0OXsa6cUA5KKWsU55Ry2TUIm0tMRFlp
	mV9IrwNr6cbtg+GOgkTqXIIVbMUsQjuipXouSG/UG7agE9AtzCyX+kBU
X-Gm-Gg: ATEYQzwIQysRKXXPT1LnvJgqV8v1/tz5zn3YUv5jFz8phWTY4ofRZS0XPkacwQYz7xZ
	+K+X62A89Szc18oD6uddqZH/eDeWbXbUEDRev79Td9S2rXSWa7qGhEjnFHJQMk3Bn8eDQ6YK1la
	7kQs1FnaBTpmMP+AaPvYOOWcUBGM4E/LD6ZWg43vrQ1Ldgf9dWqbIAI9o5MJCFDZcNoKL+KtEB5
	PNepeEtKfbYQdmpAbu/dkiLBdIFuk49WGUuuM7zpiqzbNljBOt6jFvL3wWKEWJVnopOLYRCplWW
	gWmV6FnLygajzprCOcZ3P5eJf5RY9AV70eYmU3VdrBGhYW0bYoMnUeVFbZbvkQITUznYsdpwU2c
	F0jyU6tkvk1RlazZreeBaIt2rzQ0aGfnc/gVI7QwHA+3DFFGUgnUJdqGkvLCDRi+Vtzv1EqCF5c
	r1Dp4pfq9f/4pffENa9Gzg2/duB9CV37pyNwq29xXTddIVJnp75WdYAKSHzqc1BPYfFpCEcmKon
	gvsRudBNWw++VtuU7AVIVf6O6SsuLCyAuBceDI89uVAcyYM
X-Received: by 2002:a05:600c:4744:b0:485:3b00:f92e with SMTP id 5b1f17b1804b1-48727d5e95bmr26171625e9.2.1774602551328;
        Fri, 27 Mar 2026 02:09:11 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487271be661sm11252605e9.35.2026.03.27.02.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:09:10 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Josua Mayer <josua@solid-run.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 3/3] arm64: dts: imx93-var-dart: Add support for Variscite Sonata board
Date: Fri, 27 Mar 2026 10:08:56 +0100
Message-ID: <676acc750ecc1c467bedf4f09996537c2716cafa.1774601806.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774601806.git.stefano.r@variscite.com>
References: <cover.1774601806.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_090913_810516_79F8A54C 
X-CRM114-Status: GOOD (  18.60  )
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

Add device tree support for the Variscite Sonata carrier board with the
DART-MX93 system on module.

The Sonata board includes
- uSD Card support
- USB ports and OTG
- Additional Gigabit Ethernet interface
- Uart, SPI and I2C interfaces
- GPIO Expanders
- RTC module
- TPM module
- CAN peripherals

Link: https://variscite.com/carrier-boards/sonata-board/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx93-var-dart-sonata.dts   | 654 ++++++++++++++++++
 2 files changed, 655 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 2da6dc4f8a14..266eddd745c9 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -487,6 +487,7 @@ imx93-tqma9352-mba91xxca-rgb-cdtech-dc44-dtbs := imx93-tqma9352-mba91xxca.dtb im
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
new file mode 100644
index 000000000000..5513d3b148a2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
@@ -0,0 +1,654 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Variscite Sonata carrier board for DART-MX93
+ *
+ * Link: https://variscite.com/carrier-boards/sonata-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include "imx93-var-dart.dtsi"
+
+/ {
+	model = "Variscite DART-MX93 on Sonata-Board";
+	compatible = "variscite,var-dart-mx93-sonata",
+		     "variscite,var-dart-mx93",
+		     "fsl,imx93";
+
+	aliases {
+		ethernet0 = &eqos;
+		ethernet1 = &fec;
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		i2c0 = &lpi2c1;
+		i2c1 = &lpi2c2;
+		i2c2 = &lpi2c3;
+		i2c3 = &lpi2c4;
+		i2c4 = &lpi2c5;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		serial0 = &lpuart1;
+		serial1 = &lpuart2;
+		serial2 = &lpuart3;
+		serial3 = &lpuart4;
+		serial4 = &lpuart5;
+		serial5 = &lpuart6;
+		serial6 = &lpuart7;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&pca6408_1 4 GPIO_ACTIVE_LOW>;
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
+		button-down {
+			label = "Down";
+			linux,code = <KEY_DOWN>;
+			gpios = <&pca6408_1 6 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-back {
+			label = "Back";
+			linux,code = <KEY_BACK>;
+			gpios = <&pca6408_1 7 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_leds_gpio>;
+
+		led-emmc {
+			gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+			label = "eMMC";
+			linux,default-trigger = "mmc0";
+		};
+	};
+
+	clk40m: oscillator {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+		clock-output-names = "can_osc";
+	};
+
+	reg_vref_1v8: regulator-adc-vref {
+		compatible = "regulator-fixed";
+		regulator-name = "vref_1v8";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_SD2_3V3";
+		off-on-delay-us = <20000>;
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&gpio2 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ethosu_mem: ethosu-region@88000000 {
+			compatible = "shared-dma-pool";
+			reusable;
+			reg = <0x0 0x88000000 0x0 0x8000000>;
+		};
+
+		vdev0vring0: vdev0vring0@87ee0000 {
+			reg = <0 0x87ee0000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@87ee8000 {
+			reg = <0 0x87ee8000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: vdev1vring0@87ef0000 {
+			reg = <0 0x87ef0000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: vdev1vring1@87ef8000 {
+			reg = <0 0x87ef8000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@2021e000 {
+			reg = <0 0x2021e000 0 0x1000>;
+			no-map;
+		};
+
+		vdevbuffer: vdevbuffer@87f00000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x87f00000 0 0x100000>;
+			no-map;
+		};
+
+		ele_reserved: ele-reserved@87de0000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x87de0000 0 0x100000>;
+			no-map;
+		};
+	};
+};
+
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
+/* Use external instead of internal RTC */
+&bbnsm_rtc {
+	status = "disabled";
+};
+
+&eqos {
+	mdio {
+		ethphy1: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			reset-assert-us = <15000>;
+			reset-deassert-us = <100000>;
+			reset-gpios = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
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
+&fec {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_fec>;
+	pinctrl-1 = <&pinctrl_fec_sleep>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy1>;
+	status = "okay";
+};
+
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	status = "okay";
+};
+
+&lpi2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c1>;
+	pinctrl-1 = <&pinctrl_lpi2c1_gpio>;
+	pinctrl-2 = <&pinctrl_lpi2c1_gpio>;
+	pinctrl-names = "default", "sleep", "gpio";
+	scl-gpios = <&gpio1 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio1 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pca9534: gpio@22 {
+		compatible = "nxp,pca9534";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-0 = <&pinctrl_captouch>;
+		pinctrl-names = "default";
+		reset-gpios = <&pca6408_2 4 GPIO_ACTIVE_LOW>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		wakeup-source;
+	};
+
+	/* USB Type-C Controller */
+	typec@3d {
+		compatible = "nxp,ptn5150";
+		reg = <0x3d>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <29 IRQ_TYPE_LEVEL_HIGH>;
+		pinctrl-0 = <&pinctrl_extcon>;
+		pinctrl-names = "default";
+
+		port {
+			typec1_dr_sw: endpoint {
+				remote-endpoint = <&usb1_drd_sw>;
+			};
+		};
+	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		wakeup-source;
+	};
+};
+
+&lpi2c5 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep", "gpio";
+	pinctrl-0 = <&pinctrl_lpi2c5>;
+	pinctrl-1 = <&pinctrl_lpi2c5_gpio>;
+	pinctrl-2 = <&pinctrl_lpi2c5_gpio>;
+	scl-gpios = <&gpio2 23 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 22 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
+&lpi2c7 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep", "gpio";
+	pinctrl-0 = <&pinctrl_lpi2c7>;
+	pinctrl-1 = <&pinctrl_lpi2c7_gpio>;
+	pinctrl-2 = <&pinctrl_lpi2c7_gpio>;
+	scl-gpios = <&gpio2 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pca6408_1: gpio@20 {
+		compatible = "nxp,pcal6408";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	pca6408_2: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+	};
+};
+
+&lpspi8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi8>;
+	cs-gpios = <&gpio2 1 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	/* CAN controller */
+	can0: can@0 {
+		compatible = "microchip,mcp251xfd";
+		reg = <0>;
+		clocks = <&clk40m>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_can>;
+		spi-max-frequency = <1000000>;
+	};
+};
+
+/* Console (J10) */
+&lpuart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+/* Header (J12.4, J12.6) */
+&lpuart6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart6>;
+	status = "okay";
+};
+
+/* Header (J12.11, J12.13) */
+&lpuart7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart7>;
+	status = "okay";
+};
+
+&tpm3 {
+	pinctrl-0 = <&pinctrl_tpm3>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	disable-over-current;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	status = "okay";
+
+	port {
+		usb1_drd_sw: endpoint {
+			remote-endpoint = <&typec1_dr_sw>;
+		};
+	};
+};
+
+&usbotg2 {
+	disable-over-current;
+	dr_mode = "host";
+	status = "okay";
+};
+
+/* SD */
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+	status = "okay";
+};
+
+&wdog3 {
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_can: cangrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO03__GPIO2_IO03			0x31e
+		>;
+	};
+
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
+		>;
+	};
+
+	pinctrl_extcon: extcongrp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO4__GPIO4_IO29			0x31e
+		>;
+	};
+
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x57e
+			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x57e
+			MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2		0x57e
+			MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3		0x37e
+			MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC		0x58e
+			MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL	0x57e
+			MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x57e
+			MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x57e
+			MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2		0x57e
+			MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3		0x57e
+			MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC		0x58e
+			MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x57e
+		>;
+	};
+
+	pinctrl_fec_sleep: fecsleepgrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_RD0__GPIO4_IO24			0x51e
+			MX93_PAD_ENET2_RD1__GPIO4_IO25			0x51e
+			MX93_PAD_ENET2_RD2__GPIO4_IO26			0x51e
+			MX93_PAD_ENET2_RD3__GPIO4_IO27			0x51e
+			MX93_PAD_ENET2_RXC__GPIO4_IO23			0x51e
+			MX93_PAD_ENET2_RX_CTL__GPIO4_IO22		0x51e
+			MX93_PAD_ENET2_TD0__GPIO4_IO19			0x51e
+			MX93_PAD_ENET2_TD1__GPIO4_IO18			0x51e
+			MX93_PAD_ENET2_TD2__GPIO4_IO17			0x51e
+			MX93_PAD_ENET2_TD3__GPIO4_IO16			0x51e
+			MX93_PAD_ENET2_TXC__GPIO4_IO21			0x51e
+			MX93_PAD_ENET2_TX_CTL__GPIO4_IO20		0x51e
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX93_PAD_PDM_CLK__CAN1_TX			0x139e
+			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX		0x139e
+		>;
+	};
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			/* GPIO Expanders shared IRQ */
+			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10            0x31e
+		>;
+	};
+
+	pinctrl_leds_gpio: ledgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO11__GPIO2_IO11			0x31e
+		>;
+	};
+
+	pinctrl_lpi2c1: lpi2c1grp {
+		fsl,pins = <
+			MX93_PAD_I2C1_SCL__LPI2C1_SCL			0x40000b9e
+			MX93_PAD_I2C1_SDA__LPI2C1_SDA			0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c1_gpio: lpi2c1-gpiogrp {
+		fsl,pins = <
+			MX93_PAD_I2C1_SCL__GPIO1_IO00			0x31e
+			MX93_PAD_I2C1_SDA__GPIO1_IO01			0x31e
+		>;
+	};
+
+	pinctrl_lpi2c5: lpi2c5grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO22__LPI2C5_SDA			0x40000b9e
+			MX93_PAD_GPIO_IO23__LPI2C5_SCL			0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c5_gpio: lpi2c5-gpiogrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO22__GPIO2_IO22			0x31e
+			MX93_PAD_GPIO_IO23__GPIO2_IO23			0x31e
+		>;
+	};
+
+	pinctrl_lpi2c7: lpi2c7grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO07__LPI2C7_SCL			0x40000b9e
+			MX93_PAD_GPIO_IO06__LPI2C7_SDA			0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c7_gpio: lpi2c7-gpiogrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO07__GPIO2_IO07			0x31e
+			MX93_PAD_GPIO_IO06__GPIO2_IO06			0x31e
+		>;
+	};
+
+	pinctrl_lpspi8: lpspi8grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO00__GPIO2_IO00			0x31e
+			MX93_PAD_GPIO_IO01__GPIO2_IO01			0x31e
+			MX93_PAD_GPIO_IO12__GPIO2_IO12			0x31e
+			MX93_PAD_GPIO_IO13__LPSPI8_SIN			0x31e
+			MX93_PAD_GPIO_IO14__LPSPI8_SOUT			0x31e
+			MX93_PAD_GPIO_IO15__LPSPI8_SCK			0x31e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO3__GPIO4_IO28			0x31e
+		>;
+	};
+
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO02__GPIO2_IO02			0x31e
+		>;
+	};
+
+	pinctrl_tpm3: tpm3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO24__TPM3_CH3			0x51e
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX93_PAD_UART1_RXD__LPUART1_RX			0x31e
+			MX93_PAD_UART1_TXD__LPUART1_TX			0x31e
+		>;
+	};
+
+	pinctrl_uart6: uart6grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO05__LPUART6_RX			0x31e
+			MX93_PAD_GPIO_IO04__LPUART6_TX			0x31e
+		>;
+	};
+
+	pinctrl_uart7: uart7grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO09__LPUART7_RX			0x31e
+			MX93_PAD_GPIO_IO08__LPUART7_TX			0x31e
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX93_PAD_SD2_CLK__USDHC2_CLK			0x1582
+			MX93_PAD_SD2_CMD__USDHC2_CMD			0x40001382
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0		0x40001382
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1		0x40001382
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2		0x40001382
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3		0x40001382
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD2_CLK__USDHC2_CLK			0x158e
+			MX93_PAD_SD2_CMD__USDHC2_CMD			0x4000138e
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0		0x4000138e
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1		0x4000138e
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2		0x4000138e
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3		0x4000138e
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD2_CLK__USDHC2_CLK			0x15fe
+			MX93_PAD_SD2_CMD__USDHC2_CMD			0x400013fe
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0		0x400013fe
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1		0x400013fe
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2		0x400013fe
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3		0x400013fe
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX93_PAD_SD2_CD_B__GPIO3_IO00			0x31e
+		>;
+	};
+};
-- 
2.47.3


