Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53252107BCC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8BNPAmgOv/vMOqiwqTDbOSBKLtJR6vy+2HnhG05i4Y=; b=d8wTdMAl7u52YUvjLUS2Z188k7
	De6gbPioTg851dudXGLgQgWfR67wdhmCf47SVeTmAqV/8XLTpSr30SqxZXbeyl5lFtOE3Qh36xHC5
	I6PDj06ePxncVj95aoeS1+n1H/BtATSbNb4Atr1k5ffWIOd+azEgwoSJYufyEf9r3SBNrdKGGa8zz
	26Ku6a8cS+mi3qtCU2zFU5SpIb43Fd7jVBvljwPhHfFAkN+A0X8zHdIKOYLitKYN03coMmioEX4Di
	C9ESQq/Nih5rNMFRtRgcLTYlmG1eMhwrKXQge7+KDG86eo+g0kD6qWeabwyCPbHYz5N52KcfNfNLx
	eAbrl8Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15Fc-00000000dHk-3Xvv;
	Fri, 13 Mar 2026 16:20:36 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15FW-00000000dFC-1miT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:20:31 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-439c9bdc1eeso2391852f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 09:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773418828; x=1774023628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8BNPAmgOv/vMOqiwqTDbOSBKLtJR6vy+2HnhG05i4Y=;
        b=KY+oyJPX9KGskMc1fNwsOdI8G2gOaed9eGuMlbsGpvxvOvk3Z+n7a74itw4Z7F/Bgw
         3yyb4ZlZUf6gS3tjw7vR6bi0GlHGtxIWcVY21Y+uetrb13YK/f0pb1JOJ0TROuAnM4pw
         IelESbIlQGrzDBMEMjD+1dRlaJ/6yrmbouBCzWzwXEPCN/kn6Vknygi7G3pfx9OT78uw
         Bc40AcSyyqiYVygoyxTP6w9aToxcPaBqcXp0uv4hfFp4i31aIZvnXEH7bq8eSb578ULJ
         aLr9ZTEuHS9KgKDLMUrDmTUA/OZQa0k67fhkpiOoyT4Ir+bYDUjnIWa3lrYE7LT4ACC2
         Hnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773418828; x=1774023628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T8BNPAmgOv/vMOqiwqTDbOSBKLtJR6vy+2HnhG05i4Y=;
        b=Yw5gORYkriQd4nrcH+fouyIpp57HgNLELLKJaSxgeLxMkzy1JtYhdMEZtB/rJfhKhZ
         9g32GS/SHh0cACz2fy65FP/dTpK9wbtLTV6mrZefczK7dwGzOQvKE8a2TckRZpz9ZABe
         EF4HFYW0z7Sq3+k8VkUYUFuZI7UD4J8CbdI4910TKIJ9vnz2wS8mHfbfBXd4Nrg1n7XM
         p01sloguwvAFWoKBGTq0++k58UmsWoeusv3gE96FKxKSMoyPr3X3mHShESFZfQl3UIUB
         T45tTwfJ29VvTz/nmVZ1TUPlcC48iyGkM8xEYmVex0aPaHXJV2NbK3Yy2QhqR+K4XtEK
         V5xg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ2EugIsiOrkYjtn+/cguHitsGvKSdQ/IPyzIk5+9QsT/7W2BfDtxNB6IpbvE93jnCVpPTwYb8zdfxSW9rFQow@lists.infradead.org
X-Gm-Message-State: AOJu0YwiZco3DQzIlcPhFEZpIMwd/2mDi9pE9yY8aM4dBVfZ3ce//Er2
	8kC5mCKzxI+aKMCLeg5hqcOFHfo9GmnAhJLALWCSp7rgl19+I/D13ahs
X-Gm-Gg: ATEYQzxBBkmypGWP+TYehcOHF2nj6KOa7L5yccWzWfOwpKb/4WwTKms9tjY+O+xGDsH
	rR9uupeZfNvduYPf8l6nNS0/PM3agmVmqQawGjVXLSbqCc9o/RN8r1I4P4qpcwsckv/1TpHMXV0
	5MyxFO2OrIB+BCgItqjURz0WPWcvScWw1voTE5QmKfkZ2BlTfGXQ4JMwGQummemQZfysy2KnczM
	Ioga4iog+IHDMZ0G3eUiCu1/uy4kdY5VHOXiY2l1NGMJQyK7r11UQ1AvJyBuualePce6FX/DK0D
	LR8EOCZy7d7HyC/VOVtJtOjmAWRjgDs/ruTcwZzYdDL1EfyBJUt7bBc26nZzZWIRdl4HHki0zg1
	K9mMVwZSfxAuHCLw0XXLoc+23FniU8w/JZUuyHOMnfsGSpnypa9hVJMcpWsUdNLOQydXEInsWL+
	uD5iiUP/503Lv+Y8Q+reI4nAYDm6UAW6U2ct4nN+nuvyQ7VOjjJH50O2X4iQ+VOu/Y2JeR+8BHe
	w/oBBp4FeiHY3f5gIhR+r4gTqZ80WJcmAm69O4=
X-Received: by 2002:a05:600c:8b45:b0:485:35ba:1d81 with SMTP id 5b1f17b1804b1-48556703194mr60870005e9.21.1773418828051;
        Fri, 13 Mar 2026 09:20:28 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fd3dsm219944515e9.10.2026.03.13.09.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:20:27 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/2] arm64: dts: freescale: Add support for Variscite DART-MX91
Date: Fri, 13 Mar 2026 17:20:02 +0100
Message-ID: <275c78c15501dd39f47ebb26be48ad410c9c7c2e.1773417666.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773417666.git.stefano.r@variscite.com>
References: <cover.1773417666.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_092030_640793_6F47E165 
X-CRM114-Status: GOOD (  18.00  )
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

Add device tree support for the Variscite DART-MX91 system on module.
This SOM is designed to be used with various carrier boards.

The module includes:
- NXP i.MX91 MPU processor
- Up to 2GB of LPDDR4 memory
- Up to 128GB of eMMC storage memory
- Integrated 10/100/1000 Mbps Ethernet Transceiver
- Codec audio WM8904
- WIFI6 dual-band 802.11ax/ac/a/b/g/n with optional 802.15.4 and Bluetooth

Only SOM-specific peripherals are enabled by default. Carrier board
specific interfaces are left disabled to be enabled in the respective
carrier board device trees.

Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-91/dart-mx91/

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Rebased the series to for-next branch

v3->v4:
 - Fix space between BUCK4/BUCK5 aned parenthesis
 - Remove unused pinctrl groups

v2->v3:
 - Rebased the series to fix DTS apply issues.

v1->v2:
 - Ordering by hex and node name.

 .../boot/dts/freescale/imx91-var-dart.dtsi    | 468 ++++++++++++++++++
 1 file changed, 468 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
new file mode 100644
index 000000000000..a9e44efad13f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
@@ -0,0 +1,468 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for Variscite DART-MX91
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-91/dart-mx91/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/usb/pd.h>
+#include "imx91.dtsi"
+
+/ {
+	model = "Variscite DART-MX91 Module";
+	compatible = "variscite,var-dart-mx91", "fsl,imx91";
+
+	sound-wm8904 {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "wm8904-audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN2L", "Line In Jack",
+			"IN2R", "Line In Jack",
+			"IN1L", "Microphone Jack",
+			"IN1R", "Microphone Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+		};
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio4 14 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio3 7 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
+	};
+};
+
+&eqos {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_eqos>;
+	pinctrl-1 = <&pinctrl_eqos_sleep>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+	snps,clk-csr = <5>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		clock-frequency = <1000000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <15000>;
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
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep", "gpio";
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
+	pinctrl-2 = <&pinctrl_lpi2c3_gpio>;
+	scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	wm8904: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clk IMX93_CLK_SAI1_GATE>;
+		clock-names = "mclk";
+		AVDD-supply = <&buck5>;
+		CPVDD-supply = <&buck5>;
+		DBVDD-supply = <&buck4>;
+		DCVDD-supply = <&buck5>;
+		MICVDD-supply = <&buck5>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+		/* GPIO1 = DMIC_CLK, don't touch others */
+		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+		/* DMIC is connected to IN1L */
+		wlf,in1l-as-dmicdat1;
+	};
+
+	pmic@25 {
+		compatible = "nxp,pca9451a";
+		reg = <0x25>;
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-name = "BUCK1";
+				regulator-min-microvolt = <650000>;
+				regulator-max-microvolt = <2237500>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck2: BUCK2 {
+				regulator-name = "BUCK2";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <2187500>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck4: BUCK4 {
+				regulator-name = "BUCK4";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck5: BUCK5 {
+				regulator-name = "BUCK5";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck6: BUCK6 {
+				regulator-name = "BUCK6";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1: LDO1 {
+				regulator-name = "LDO1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4: LDO4 {
+				regulator-name = "LDO4";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo5: LDO5 {
+				regulator-name = "LDO5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+/* BT module */
+&lpuart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart5>, <&pinctrl_bt>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+&sai1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_sai1>;
+	pinctrl-1 = <&pinctrl_sai1_sleep>;
+	assigned-clocks = <&clk IMX93_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <12288000>;
+	#sound-dai-cells = <0>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+/* eMMC */
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+/* WiFi */
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	keep-power-in-suspend;
+	bus-width = <4>;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
+
+&wdog3 {
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_bt: btgrp {
+		fsl,pins = <
+			MX91_PAD_ENET2_MDIO__GPIO4_IO15				0x51e
+		>;
+	};
+
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX91_PAD_ENET1_MDC__ENET1_MDC				0x57e
+			MX91_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x57e
+			MX91_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
+			MX91_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
+			MX91_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
+			MX91_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
+			MX91_PAD_ENET1_RXC__ENET_QOS_RGMII_RXC			0x5fe
+			MX91_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
+			MX91_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
+			MX91_PAD_ENET1_TD1__ENET1_RGMII_TD1			0x57e
+			MX91_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
+			MX91_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
+			MX91_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x5fe
+			MX91_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
+			MX91_PAD_UART2_TXD__GPIO1_IO7				0x51e
+		>;
+	};
+
+	pinctrl_eqos_sleep: eqos-sleepgrp {
+		fsl,pins = <
+			MX91_PAD_ENET1_MDC__GPIO4_IO0				0x31e
+			MX91_PAD_ENET1_MDIO__GPIO4_IO1				0x31e
+			MX91_PAD_ENET1_RD0__GPIO4_IO10				0x31e
+			MX91_PAD_ENET1_RD1__GPIO4_IO11				0x31e
+			MX91_PAD_ENET1_RD2__GPIO4_IO12				0x31e
+			MX91_PAD_ENET1_RD3__GPIO4_IO13				0x31e
+			MX91_PAD_ENET1_RXC__GPIO4_IO9				0x31e
+			MX91_PAD_ENET1_RX_CTL__GPIO4_IO8			0x31e
+			MX91_PAD_ENET1_TD0__GPIO4_IO5				0x31e
+			MX91_PAD_ENET1_TD1__GPIO4_IO4				0x31e
+			MX91_PAD_ENET1_TD2__GPIO4_IO3				0x31e
+			MX91_PAD_ENET1_TD3__GPIO4_IO2				0x31e
+			MX91_PAD_ENET1_TXC__GPIO4_IO7				0x31e
+			MX91_PAD_ENET1_TX_CTL__GPIO4_IO6			0x31e
+		>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO28__LPI2C3_SDA				0x40000b9e
+			MX91_PAD_GPIO_IO29__LPI2C3_SCL				0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c3_gpio: lpi2c3gpiogrp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO28__GPIO2_IO28				0x40000b9e
+			MX91_PAD_GPIO_IO29__GPIO2_IO29				0x40000b9e
+		>;
+	};
+
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX91_PAD_SAI1_TXC__SAI1_TX_BCLK				0x31e
+			MX91_PAD_SAI1_TXFS__SAI1_TX_SYNC			0x31e
+			MX91_PAD_SAI1_TXD0__SAI1_TX_DATA0			0x31e
+			MX91_PAD_SAI1_RXD0__SAI1_RX_DATA0			0x31e
+			MX91_PAD_I2C2_SDA__SAI1_RX_BCLK				0x31e
+			MX91_PAD_I2C2_SCL__SAI1_RX_SYNC				0x31e
+			MX91_PAD_UART2_RXD__SAI1_MCLK				0x31e
+		>;
+	};
+
+	pinctrl_sai1_sleep: sai1-sleepgrp {
+		fsl,pins = <
+			MX91_PAD_SAI1_TXC__GPIO1_IO12				0x31e
+			MX91_PAD_SAI1_TXFS__GPIO1_IO11				0x31e
+			MX91_PAD_SAI1_TXD0__GPIO1_IO13				0x31e
+			MX91_PAD_SAI1_RXD0__GPIO1_IO14				0x31e
+			MX91_PAD_UART2_RXD__GPIO1_IO6				0x31e
+			MX91_PAD_I2C2_SDA__GPIO1_IO3				0x31e
+			MX91_PAD_I2C2_SCL__GPIO1_IO2				0x31e
+		>;
+	};
+
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			MX91_PAD_DAP_TDO_TRACESWO__LPUART5_TX			0x31e
+			MX91_PAD_DAP_TDI__LPUART5_RX				0x31e
+			MX91_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B			0x31e
+			MX91_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B			0x31e
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX91_PAD_SD1_CLK__USDHC1_CLK				0x1582
+			MX91_PAD_SD1_CMD__USDHC1_CMD				0x1382
+			MX91_PAD_SD1_DATA0__USDHC1_DATA0			0x1382
+			MX91_PAD_SD1_DATA1__USDHC1_DATA1			0x1382
+			MX91_PAD_SD1_DATA2__USDHC1_DATA2			0x1382
+			MX91_PAD_SD1_DATA3__USDHC1_DATA3			0x1382
+			MX91_PAD_SD1_DATA4__USDHC1_DATA4			0x1382
+			MX91_PAD_SD1_DATA5__USDHC1_DATA5			0x1382
+			MX91_PAD_SD1_DATA6__USDHC1_DATA6			0x1382
+			MX91_PAD_SD1_DATA7__USDHC1_DATA7			0x1382
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE			0x1582
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD1_CLK__USDHC1_CLK				0x158e
+			MX91_PAD_SD1_CMD__USDHC1_CMD				0x138e
+			MX91_PAD_SD1_DATA0__USDHC1_DATA0			0x138e
+			MX91_PAD_SD1_DATA1__USDHC1_DATA1			0x138e
+			MX91_PAD_SD1_DATA2__USDHC1_DATA2			0x138e
+			MX91_PAD_SD1_DATA3__USDHC1_DATA3			0x138e
+			MX91_PAD_SD1_DATA4__USDHC1_DATA4			0x138e
+			MX91_PAD_SD1_DATA5__USDHC1_DATA5			0x138e
+			MX91_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
+			MX91_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD1_CLK__USDHC1_CLK				0x15fe
+			MX91_PAD_SD1_CMD__USDHC1_CMD				0x13fe
+			MX91_PAD_SD1_DATA0__USDHC1_DATA0			0x13fe
+			MX91_PAD_SD1_DATA1__USDHC1_DATA1			0x13fe
+			MX91_PAD_SD1_DATA2__USDHC1_DATA2			0x13fe
+			MX91_PAD_SD1_DATA3__USDHC1_DATA3			0x13fe
+			MX91_PAD_SD1_DATA4__USDHC1_DATA4			0x13fe
+			MX91_PAD_SD1_DATA5__USDHC1_DATA5			0x13fe
+			MX91_PAD_SD1_DATA6__USDHC1_DATA6			0x13fe
+			MX91_PAD_SD1_DATA7__USDHC1_DATA7			0x13fe
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE			0x15fe
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX91_PAD_SD3_CLK__USDHC3_CLK				0x1582
+			MX91_PAD_SD3_CMD__USDHC3_CMD				0x1382
+			MX91_PAD_SD3_DATA0__USDHC3_DATA0			0x1382
+			MX91_PAD_SD3_DATA1__USDHC3_DATA1			0x1382
+			MX91_PAD_SD3_DATA2__USDHC3_DATA2			0x1382
+			MX91_PAD_SD3_DATA3__USDHC3_DATA3			0x1382
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD3_CLK__USDHC3_CLK				0x158e
+			MX91_PAD_SD3_CMD__USDHC3_CMD				0x138e
+			MX91_PAD_SD3_DATA0__USDHC3_DATA0			0x138e
+			MX91_PAD_SD3_DATA1__USDHC3_DATA1			0x138e
+			MX91_PAD_SD3_DATA2__USDHC3_DATA2			0x138e
+			MX91_PAD_SD3_DATA3__USDHC3_DATA3			0x138e
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD3_CLK__USDHC3_CLK				0x15fe
+			MX91_PAD_SD3_CMD__USDHC3_CMD				0x13fe
+			MX91_PAD_SD3_DATA0__USDHC3_DATA0			0x13fe
+			MX91_PAD_SD3_DATA1__USDHC3_DATA1			0x13fe
+			MX91_PAD_SD3_DATA2__USDHC3_DATA2			0x13fe
+			MX91_PAD_SD3_DATA3__USDHC3_DATA3			0x13fe
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3-sleepgrp {
+		fsl,pins = <
+			MX91_PAD_SD3_CLK__GPIO3_IO20				0x31e
+			MX91_PAD_SD3_CMD__GPIO3_IO21				0x31e
+			MX91_PAD_SD3_DATA0__GPIO3_IO22				0x31e
+			MX91_PAD_SD3_DATA1__GPIO3_IO23				0x31e
+			MX91_PAD_SD3_DATA2__GPIO3_IO24				0x31e
+			MX91_PAD_SD3_DATA3__GPIO3_IO25				0x31e
+		>;
+	};
+
+	pinctrl_usdhc3_wlan: usdhc3wlangrp {
+		fsl,pins = <
+			MX91_PAD_ENET2_MDC__GPIO4_IO14				0x51e
+			MX91_PAD_SD2_RESET_B__GPIO3_IO7				0x51e
+		>;
+	};
+};
-- 
2.47.3


