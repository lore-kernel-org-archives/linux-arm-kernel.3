Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C403F33A96
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 17:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1H3aMgJWdVbQCPLWOAyx7P6LsERTSVtijRezA7gODQ=; b=T3q3estJiZytTElAt1ERttGtSD
	dFimN1qbMnpXN5rHPowCTKYMM7V1K5eXsFnGO4FdlVn2QgOUYR8lpiXG84R6GLuHtGZooRwEGXMN1
	kB3c3shdNz22tXBM7R7mVzThaLba8NsNlmFaupKmz8j9m1vr4aeweK7h7XJ+DI0n0ju9qIYY2AYim
	8jIv+eMZWPrZcuORaeEDI1cTqXq2huLo3d/lyy7imwJkq5BzpavlcepKsrIXu5lF5QixWLj0nyj90
	qHfYOLZhnMXBDhwreecmB6J+uwAohSlheeh+GJZ8s2sLutUt2eyz+h3pn5ooWkhuBGhVAFgfHedNs
	3X05T0aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCRf-00000002I9H-05Lr;
	Thu, 05 Mar 2026 17:25:07 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCRZ-00000002I4B-3I6p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 17:25:03 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48375f10628so55684655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772731500; x=1773336300; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1H3aMgJWdVbQCPLWOAyx7P6LsERTSVtijRezA7gODQ=;
        b=jHC1d70ZQrWdlgSuLsu4AlXrCItdhm06mVkua2pFYy4QwBeadUmYHDjzK/x/41CEjZ
         4ummnONn8rOm3HoTMeKAi3DdAUg2T6jaIg6A9DNFRj8Yp1JN2vRvX5eZG7PnDfPkEkXL
         yOfufBBJT/zvNZx98S3yShvNgc5qRBDNAEgkTM5I8wf3XF6ST/oHsSWGyv4XZFuB6Jgb
         m7zA8hfjTAe5OJ9o7hXUVLYDhlBueoRIBdmCEwJQIBMF4qLK5hhQLK0QqYXRF+m4aIdY
         d4RHCqE1IOIzvs1OfDoFqtzLxBw0WX06Llt9cMTJAK88/13UKZ/dNl+toFRAhSjd0tNl
         q1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731500; x=1773336300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W1H3aMgJWdVbQCPLWOAyx7P6LsERTSVtijRezA7gODQ=;
        b=MYXkozUOFi2S7Jkp16ejJDa+5KqXe1hFvtmZSerOT/IXwtsamlQEwybQdUKN6H9wcF
         Jt8s/LRqDNwLqY026xCiZGU1IQYDxUA6ImeurwypMZPY4Ba8RNzatDVxDeVuk7Na8XG8
         s9LhMPdhJkM3zGUP5XLAhlGHcaSQsRegKlDL4Dcis9of8FN6ENOgYFhjXG88P/sZeGe5
         jFoqHBPQpcdVixU0uiM7KUP1vrPm3FG6isLyM6ditC5Bl4MFE350S4+x0p4pts1ueB6K
         IAyChgTC9nKjrxtnxgGHetroMX+RZ5dPu2Hb7rleui/mF6iaT8one6txrk3PfwU6yXoX
         Zx4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUa6oc+FmjlL68pyNsPQrax0ZRIdmrDc81bU5ENu5fxJHEi6klEqTOjfSNvKVgGZoYqLjeAoRNz41m3wO6ugkzQ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo8wbefohv/3pSSt2gbPq63+LXDD7trknswxbw1en8ZXX4xGVT
	l0k21KqF5XOGMG+iQNW2ogDdgNokq1KHP7pWAvZ9/8t9zihpH3Wj9BXu
X-Gm-Gg: ATEYQzze0P68O3e1yQZcq3IbaautiyR5AFhB53OwkRDzOH0ojoi9hfV4Ue3sPM0g8Ic
	3D8ePz66KixaY1sDbJLiB24UpJWwgE/3vnAQaUi+ZkkU1x+j/nYnPqAB5tcX58Wm1aNOJVLkSO8
	+rQ2PZ3rilK7uyuR0kQPEDIWEUYngzVqGI/SKd3JKLIbURz7dZDW30y9IyYW/x4L5sKDW1B6iBW
	ScpDu1rh4hmyaesBMhRPWdgMNYCUq6YzWKPja6fZFQ09tyXQ4DW/21xGwF9EdBlbbQWQzMqASOB
	tPTX5us5Ra+3TqN2ChzAPNGJc/eoaErpY0s7Bq4f39G4/VUIIEl1GwQNqAFrMJgfLa+8gKq9m+S
	8xfQwFXa39D1jn/D/eWkfiPafk9zRNYkFcINDiiRSSuUn7zTHo86TAL+aF7qk/03KpST1DuYjIy
	hABn0/yHVDM/Ivz/npJsb1pNwl0zoCf/TrODrvzBMqyoGQgjiFDH42k/dKcfQkDmURW/A/G2K6p
	WwC4YaU6WqXV9UYglkGSWHrMnY=
X-Received: by 2002:a05:600c:1e88:b0:483:703e:4ad5 with SMTP id 5b1f17b1804b1-485198800afmr108726125e9.22.1772731499926;
        Thu, 05 Mar 2026 09:24:59 -0800 (PST)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fafe4c9sm67153495e9.15.2026.03.05.09.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 09:24:59 -0800 (PST)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 05 Mar 2026 18:24:32 +0100
Subject: [PATCH 4/6] arm64: dts: freescale: imx95-verdin: Add Ivy carrier
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-verdin-imx95-upstream-frank-li-base-v1-4-823fad02def9@toradex.com>
References: <20260305-verdin-imx95-upstream-frank-li-base-v1-0-823fad02def9@toradex.com>
In-Reply-To: <20260305-verdin-imx95-upstream-frank-li-base-v1-0-823fad02def9@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_092501_985572_5B616AC7 
X-CRM114-Status: GOOD (  14.36  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add support for the Verdin i.MX95 SoM mated with the Ivy carrier board.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/ivy-carrier-board
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../arm64/boot/dts/freescale/imx95-verdin-ivy.dtsi | 515 +++++++++++++++++++++
 .../dts/freescale/imx95-verdin-nonwifi-ivy.dts     |  21 +
 .../boot/dts/freescale/imx95-verdin-wifi-ivy.dts   |  21 +
 4 files changed, 559 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 952268856cac..34af11b1ef6b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -454,8 +454,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 
 imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-ivy.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin-ivy.dtsi
new file mode 100644
index 000000000000..36687dff0a6f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-ivy.dtsi
@@ -0,0 +1,515 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common dtsi for Verdin iMX95 SoM on Ivy carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/ivy-carrier-board
+ */
+
+#include <dt-bindings/mux/mux.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/net/ti-dp83867.h>
+
+/ {
+	aliases {
+		eeprom1 = &carrier_eeprom;
+	};
+
+	/* AIN1 Voltage w/o AIN1_MODE gpio control */
+	ain1_voltage_unmanaged: voltage-divider-ain1 {
+		compatible = "voltage-divider";
+		#io-channel-cells = <1>;
+		io-channels = <&ivy_adc1 0>;
+		full-ohms = <19>;
+		output-ohms = <1>;
+	};
+
+	/* AIN1 Current w/o AIN1_MODE gpio control */
+	ain1_current_unmanaged: current-sense-shunt-ain1 {
+		compatible = "current-sense-shunt";
+		#io-channel-cells = <0>;
+		io-channels = <&ivy_adc1 1>;
+		shunt-resistor-micro-ohms = <100000000>;
+	};
+
+	/* AIN1_MODE - SODIMM 216 */
+	ain1_mode_mux_ctrl: mux-controller-0 {
+		compatible = "gpio-mux";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio5>;
+		#mux-control-cells = <0>;
+		mux-gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
+	};
+
+	ain1-voltage {
+		compatible = "io-channel-mux";
+		channels = "ain1_voltage", "";
+		io-channels = <&ain1_voltage_unmanaged 0>;
+		io-channel-names = "parent";
+		mux-controls = <&ain1_mode_mux_ctrl>;
+		settle-time-us = <1000>;
+	};
+
+	ain1-current {
+		compatible = "io-channel-mux";
+		channels = "", "ain1_current";
+		io-channels = <&ain1_current_unmanaged>;
+		io-channel-names = "parent";
+		mux-controls = <&ain1_mode_mux_ctrl>;
+		settle-time-us = <1000>;
+	};
+
+	/* AIN2 Voltage w/o AIN2_MODE gpio control */
+	ain2_voltage_unmanaged: voltage-divider-ain2 {
+		compatible = "voltage-divider";
+		#io-channel-cells = <1>;
+		io-channels = <&ivy_adc2 0>;
+		full-ohms = <19>;
+		output-ohms = <1>;
+	};
+
+	/* AIN2 Current w/o AIN2_MODE gpio control */
+	ain2_current_unmanaged: current-sense-shunt-ain2 {
+		compatible = "current-sense-shunt";
+		#io-channel-cells = <0>;
+		io-channels = <&ivy_adc2 1>;
+		shunt-resistor-micro-ohms = <100000000>;
+	};
+
+	/* AIN2_MODE - SODIMM 218 */
+	ain2_mode_mux_ctrl: mux-controller-1 {
+		compatible = "gpio-mux";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio6>;
+		#mux-control-cells = <0>;
+		mux-gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
+	};
+
+	ain2-voltage {
+		compatible = "io-channel-mux";
+		channels = "ain2_voltage", "";
+		io-channels = <&ain2_voltage_unmanaged 0>;
+		io-channel-names = "parent";
+		mux-controls = <&ain2_mode_mux_ctrl>;
+		settle-time-us = <1000>;
+	};
+
+	ain2-current {
+		compatible = "io-channel-mux";
+		channels = "", "ain2_current";
+		io-channels = <&ain2_current_unmanaged>;
+		io-channel-names = "parent";
+		mux-controls = <&ain2_mode_mux_ctrl>;
+		settle-time-us = <1000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ivy_leds>;
+
+		/* D7 Blue - SODIMM 30 - LEDs.GPIO1 */
+		led-0 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			gpios = <&gpio2 16 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* D7 Green - SODIMM 32 - LEDs.GPIO2 */
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* D7 Red - SODIMM 34 - LEDs.GPIO3 */
+		led-2 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* D8 Blue - SODIMM 36 - LEDs.GPIO4 */
+		led-3 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <2>;
+			gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* D8 Green - SODIMM 54 - LEDs.GPIO5 */
+		led-4 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <2>;
+			gpios = <&gpio5 10 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* D8 Red - SODIMM 44 - LEDs.GPIO6 */
+		led-5 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <2>;
+			gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* D9 Blue - SODIMM 46 - LEDs.GPIO7 */
+		led-6 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <3>;
+			gpios = <&gpio5 4 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* D9 Red - SODIMM 48 - LEDs.GPIO8 */
+		led-7 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <3>;
+			gpios = <&gpio5 7 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	reg_3v2_ain1: regulator-3v2-ain1 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3200000>;
+		regulator-min-microvolt = <3200000>;
+		regulator-name = "+3V2_AIN1";
+	};
+
+	reg_3v2_ain2: regulator-3v2-ain2 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3200000>;
+		regulator-min-microvolt = <3200000>;
+		regulator-name = "+3V2_AIN2";
+	};
+
+	/* Ivy Power Supply Input Voltage */
+	ivy-input-voltage {
+		compatible = "voltage-divider";
+		/* Verdin ADC_1 */
+		io-channels = <&adc1 0>;
+		full-ohms = <204700>; /* 200k + 4.7k */
+		output-ohms = <4700>;
+	};
+
+	ivy-5v-voltage {
+		compatible = "voltage-divider";
+		/* Verdin ADC_2 */
+		io-channels = <&adc1 1>;
+		full-ohms = <39000>; /* 27k + 12k */
+		output-ohms = <12000>;
+	};
+
+	ivy-3v3-voltage {
+		compatible = "voltage-divider";
+		/* Verdin ADC_3 */
+		io-channels = <&adc1 2>;
+		full-ohms = <54000>; /* 27k + 27k */
+		output-ohms = <27000>;
+	};
+
+	ivy-1v8-voltage {
+		compatible = "voltage-divider";
+		/* Verdin ADC_4 */
+		io-channels = <&adc1 3>;
+		full-ohms = <39000>; /* 12k + 27k */
+		output-ohms = <27000>;
+	};
+};
+
+/* Verdin ADC_1, ADC_2, ADC_3 and ADC_4 */
+&adc1 {
+	status = "okay";
+};
+
+/* Verdin ETH_1 (On-module PHY) */
+&enetc_port0 {
+	status = "okay";
+};
+
+/* Verdin ETH_2_RGMII */
+&enetc_port1 {
+	phy-handle = <&ethphy2>;
+	phy-mode = "rgmii-id";
+
+	status = "okay";
+};
+
+/* Verdin CAN_1 */
+&flexcan1 {
+	status = "okay";
+};
+
+/* Verdin CAN_2 */
+&flexcan2 {
+	status = "okay";
+};
+
+&gpio1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ctrl_sleep_moci>;
+	gpio-line-names = "";
+};
+
+&gpio2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio2>,
+		    <&pinctrl_gpio3>;
+	gpio-line-names =
+		"", /* 0 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 10 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"GPIO2", /* Verdin GPIO_2 - SODIMM 208 */
+		"",
+		"", /* 20 */
+		"",
+		"",
+		"",
+		"GPIO3", /* Verdin GPIO_3 - SODIMM 210 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 30 */
+		"";
+};
+
+&gpio3 {
+	gpio-line-names = "";
+};
+
+&gpio4 {
+	gpio-line-names = "";
+};
+
+&gpio5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_qspi1_cs2_gpio>,
+		    <&pinctrl_qspi1_dqs_gpio>,
+		    <&pinctrl_qspi1_io0_gpio>,
+		    <&pinctrl_qspi1_io1_gpio>,
+		    <&pinctrl_qspi1_io2_gpio>,
+		    <&pinctrl_qspi1_io3_gpio>;
+	gpio-line-names =
+		"DIGI_1", /* SODIMM 56 */
+		"DIGI_2", /* SODIMM 58 */
+		"REL1",   /* SODIMM 60 */
+		"REL2",   /* SODIMM 62 */
+		"",
+		"",
+		"",
+		"",
+		"REL4", /* SODIMM 66 */
+		"",
+		"", /* 10 */
+		"REL3", /* SODIMM 64 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"";
+};
+
+/* Verdin I2C_1 */
+&lpi2c4 {
+	status = "okay";
+
+	temperature-sensor@4f {
+		compatible = "ti,tmp1075";
+		reg = <0x4f>;
+	};
+
+	carrier_eeprom: eeprom@57 {
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+/* Verdin I2C_4_CSI */
+&lpi2c5 {
+	status = "okay";
+
+	ivy_adc1: adc@40 {
+		compatible = "ti,ads1119";
+		reg = <0x40>;
+		interrupt-parent = <&som_gpio_expander>;
+		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+		avdd-supply = <&reg_3v2_ain1>;
+		dvdd-supply = <&reg_3v2_ain1>;
+		vref-supply = <&reg_3v2_ain1>;
+		#address-cells = <1>;
+		#io-channel-cells = <1>;
+		#size-cells = <0>;
+
+		/* AIN1 0-33V Voltage Input */
+		channel@0 {
+			reg = <0>;
+			diff-channels = <0 1>;
+		};
+
+		/* AIN1 0-20mA Current Input */
+		channel@1 {
+			reg = <1>;
+			diff-channels = <2 3>;
+		};
+	};
+
+	ivy_adc2: adc@41 {
+		compatible = "ti,ads1119";
+		reg = <0x41>;
+		interrupt-parent = <&som_gpio_expander>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+		avdd-supply = <&reg_3v2_ain2>;
+		dvdd-supply = <&reg_3v2_ain2>;
+		vref-supply = <&reg_3v2_ain2>;
+		#address-cells = <1>;
+		#io-channel-cells = <1>;
+		#size-cells = <0>;
+
+		/* AIN2 0-33V Voltage Input */
+		channel@0 {
+			reg = <0>;
+			diff-channels = <0 1>;
+		};
+
+		/* AIN2 0-20mA Current Input */
+		channel@1 {
+			reg = <1>;
+			diff-channels = <2 3>;
+		};
+	};
+};
+
+/* Verdin SPI_1 */
+&lpspi6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi6>,
+		    <&pinctrl_spi1_cs>,
+		    <&pinctrl_gpio1>,
+		    <&pinctrl_gpio4>;
+	cs-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>,
+		   <&som_gpio_expander 13 GPIO_ACTIVE_LOW>,
+		   <&gpio2 0 GPIO_ACTIVE_LOW>,
+		   <&gpio5 12 GPIO_ACTIVE_LOW>;
+
+	tpm@2 {
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg = <2>;
+		spi-max-frequency = <18500000>;
+	};
+
+	fram@3 {
+		compatible = "fujitsu,mb85rs256", "atmel,at25";
+		reg = <3>;
+		address-width = <16>;
+		size = <32768>;
+		spi-max-frequency = <33000000>;
+		pagesize = <1>;
+	};
+};
+
+/* Verdin UART_3, used as the Linux console */
+&lpuart1 {
+	status = "okay";
+};
+
+/* Verdin UART_1 */
+&lpuart7 {
+	status = "okay";
+};
+
+/* Verdin UART_2, through RS485 transceiver */
+&lpuart8 {
+	rs485-rts-active-low;
+	rs485-rx-during-tx;
+	linux,rs485-enabled-at-boot-time;
+
+	status = "okay";
+};
+
+&netc_emdio {
+	ethphy2: ethernet-phy@2 {
+		reg = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_eth2_rgmii_int>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+	};
+};
+
+/* Verdin PCIE_1 */
+&pcie0 {
+	status = "okay";
+};
+
+&som_gpio_expander {
+	gpio-line-names = "";
+};
+
+/* Verdin USB_1 */
+&usb2 {
+	status = "okay";
+};
+
+/* Verdin USB_2 */
+&usb3 {
+	fsl,permanently-attached;
+
+	status = "okay";
+};
+
+&usb3_phy {
+	status = "okay";
+};
+
+/* Verdin SD_1 */
+&usdhc2 {
+	status = "okay";
+};
+
+&scmi_iomuxc {
+	pinctrl_ivy_leds: ivyledsgrp {
+		fsl,pins = <IMX95_PAD_GPIO_IO16__GPIO2_IO_BIT16		0x11e>, /* SODIMM 30 */
+			   <IMX95_PAD_GPIO_IO26__GPIO2_IO_BIT26		0x11e>, /* SODIMM 32 */
+			   <IMX95_PAD_GPIO_IO21__GPIO2_IO_BIT21		0x11e>, /* SODIMM 34 */
+			   <IMX95_PAD_GPIO_IO20__GPIO2_IO_BIT20		0x11e>, /* SODIMM 36 */
+			   <IMX95_PAD_XSPI1_DATA5__GPIO5_IO_BIT5	0x11e>, /* SODIMM 44 */
+			   <IMX95_PAD_XSPI1_DATA4__GPIO5_IO_BIT4	0x11e>, /* SODIMM 46 */
+			   <IMX95_PAD_XSPI1_DATA7__GPIO5_IO_BIT7	0x11e>, /* SODIMM 48 */
+			   <IMX95_PAD_XSPI1_SS0_B__GPIO5_IO_BIT10	0x11e>; /* SODIMM 54 */
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dts
new file mode 100644
index 000000000000..ebe1aec1ffa4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/ivy-carrier-board
+ */
+
+/dts-v1/;
+
+#include "imx95-verdin.dtsi"
+#include "imx95-verdin-nonwifi.dtsi"
+#include "imx95-verdin-ivy.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX95 on Ivy Board";
+	compatible = "toradex,verdin-imx95-nonwifi-ivy",
+		     "toradex,verdin-imx95-nonwifi",
+		     "toradex,verdin-imx95",
+		     "fsl,imx95";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dts
new file mode 100644
index 000000000000..7ff2d03a254d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/ivy-carrier-board
+ */
+
+/dts-v1/;
+
+#include "imx95-verdin.dtsi"
+#include "imx95-verdin-wifi.dtsi"
+#include "imx95-verdin-ivy.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX95 WB on Ivy Board";
+	compatible = "toradex,verdin-imx95-wifi-ivy",
+		     "toradex,verdin-imx95-wifi",
+		     "toradex,verdin-imx95",
+		     "fsl,imx95";
+};

-- 
2.43.0


