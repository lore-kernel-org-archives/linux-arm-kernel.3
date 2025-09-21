Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1495BCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 23:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aq/XbpxEcTTBwM2uie3A5y3PRK50AFwXMuVecv5w7Mg=; b=w+hvWleeX4nk4FReF65IAUVjrC
	33uNIu4q3IMPLB32HVH6cd4z2Qk3qM7QxuIi8OWAjz4dsDVVnFwOHMh3YTbr4a47kCsLdPw0mil/S
	TjiSSK/WrEi3vy6w0UDR8C/nU2N1ffdqY2cEdM27xpOujGzoDUFZntHEzR0yX3PczONZcRQs0I2So
	a/9OBuIcOt7HStiAFCR9326VuxDGCv4d6E6tzom1d8r/j/gldfFjP1YQv0ynnXeDaHPZ32iXgIf8S
	mF2DdcjkUlT3PqQFVk5ZsjhnguNuyXvmCIW3G11crWUSbxT8ZcyydGVP2fAHNMhLZZ5adlCT08qb4
	1pk4hoOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Tb4-00000008P1e-3jMc;
	Sun, 21 Sep 2025 23:35:58 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Taz-00000008P0I-07Va
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 23:35:55 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-84a91cfc7f0so36435185a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Sep 2025 16:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758497752; x=1759102552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aq/XbpxEcTTBwM2uie3A5y3PRK50AFwXMuVecv5w7Mg=;
        b=BSA9VbpivwYL5LTXU1fY4/UO8Q1RZRaOoD9BHO5NlhZXxVYM4Kn2bTRExbreXKW7aH
         1n8rz8NO4Aw1B/jQbONnND9Kt6jrIGe4xfbT6lFFLrWtRONqYc7swYI30A4u6NEQbXVr
         D7294qYMOCwAqWNQMY526cISeWjMsSXouVc8tcH/MoCG3s56SouUwlPYfz/0Q7BVZ5Fs
         4sZUHmB17C4Ccfp86rQd6LbQXWVZCHGvUVtn3iDQ5kAZRhpyPAWPC+jmG3sOPLPUcVVA
         mDxyCDwLAijqs3lo9AosDi5IEZftWaggHNpc7y937JiwaxdG2enGyfniIgyciycNAwpa
         jb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758497752; x=1759102552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aq/XbpxEcTTBwM2uie3A5y3PRK50AFwXMuVecv5w7Mg=;
        b=Tk90QmM75e/mA8jvG1ioIDcPnlzgo9o99CxDIFAtoeBdbW0lRF61ssKR+TTKzdkhF+
         vbUSPZSQIZO3EY2H6iSDTCNYeYbwwvRO6MC+co0Rz6Z0YaMXEuv5rkRUDwla1v0P+4bq
         LQbe2I0uoFbvk3afAG2FiuG/uw7vGEt5sFbXCs3MF/krs+LsdFfG4lFAZrl4CZjluR6d
         FM3KtWKMSS3JJ540FN067yGD7694jiFuKqJDoBXRnZakleGWP3osXyKW1F/vbXsDFiN+
         aIFqUMo0VN8Dw8DiyB7AIZbSjB2BghXcfn2tfcIEJWTV9deMwPLe1f0fevoEjpiiNqpc
         xZLA==
X-Forwarded-Encrypted: i=1; AJvYcCUDDgjaFevjfjjxtvIfNiXdJH6PKs68sg+7BCDVrAc+/xcvyGW0UTaIjU/aqiTqgdgDcclIhqzTar34qOD38VIn@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6jH534AWSazb848wcn/oTZnZKZlctXSZgBymE/IbeIUOTneGu
	Fa68bbR028SiQ8sow8rFl2TJOLu7mEUaVpD4YzxscjoM84DuMf95ie5k
X-Gm-Gg: ASbGncvzFdLcjwl00rY8yBPThlalVwr+/iz07uyd/deTgVo3SM2lljkRw5lRH+e8Fmo
	GOcN/4awwVCDct3hDSZoGmCV7yo/t7nMAFIoHXeggDT3k8iTDenA1fMa/j23ltDW401keOGny0i
	Omlsbk1zHGBLH1XGFk9sYMBdYvES6k/+RE2Uuke3sU6AzWV9p/VChyUsCv379/Q7TLQccIdVPTn
	BoIsxZPrAwp6ZaUxVqKmPzO0egIY2K//MXl//rQuODhzts2x2kzW7bjig1c2lK2uWSmZ7aiU5Wh
	pACMhIPRhwNzXN1xSUn30Wr/QKEXyIW+Jhx+D5tyZ/hgApTjOOfbJSnOyzq96oIx+UpYgAnqok3
	AE4a2oSFeDBYjoIbdrytoIQUzMVZJDaZWxs6k3fojozOtSA4nCls=
X-Google-Smtp-Source: AGHT+IHtWr8BYWk0a543mLVk9jLcs4xheLhrEKiEs3MLNZwTHVl4JwO0HGo3p2pbvEb6k8kswMAtLg==
X-Received: by 2002:a05:620a:372b:b0:7e8:8086:cb83 with SMTP id af79cd13be357-836393287f2mr1839104185a.28.1758497751546;
        Sun, 21 Sep 2025 16:35:51 -0700 (PDT)
Received: from rogerio-laptop.home ([184.148.194.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-83631a8095esm725949085a.49.2025.09.21.16.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 16:35:51 -0700 (PDT)
From: Rogerio Pimentel <rpimentel.silva@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: xiaofeng.wei@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com,
	marex@denx.de,
	Markus.Niebel@tq-group.com,
	y.moog@phytec.de,
	joao.goncalves@toradex.com,
	frieder.schrempf@kontron.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rogerio Pimentel <rpimentel.silva@gmail.com>,
	Anson Huang <Anson.Huang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Daniel Baluta <daniel.baluta@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
Date: Sun, 21 Sep 2025 19:35:34 -0400
Message-Id: <20250921233534.838680-2-rpimentel.silva@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250921233534.838680-1-rpimentel.silva@gmail.com>
References: <20250921233534.838680-1-rpimentel.silva@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_163553_095444_D618135E 
X-CRM114-Status: GOOD (  15.47  )
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

The FRDM-i.MX8MP is an NXP development platform based on the i.MX8M Plus
SoC, featuring a quad Cortex-A53, Cortex-M7 co-processor, 4GB LPDDR4,
32GB eMMC, Wi-Fi 6/Bluetooth 5.4/802.15.4 tri-radio, Ethernet, HDMI/MIPI
display interfaces, camera connectors, and standard expansion headers.

Based on the device tree found in the NXP repository at github
https://github.com/nxp-imx-support/meta-imx-frdm and on imx8mp-evk
board kernel mainline device tree.

This is a basic device tree supporting:

 - Quad Cortex-A53
 - 4GB LPDDR4 DRAM
 - PCA9450C PMIC with regulators
 - Two NXP PCAL6416 GPIO expanders
 - RGB LEDs via GPIO expander
 - I2C1, I2C2, I2C3 controllers
 - UART2 (console) and UART3 (with RTS/CTS)
 - USDHC3 (8-bit eMMC)
 - SNVS power key (onboard power button)

Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Signed-off-by: Shawn Guo <shawnguo@kernel.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
---

Changes in v2:

 - Fixed dt-binding schema warnings
 - Renamed nodes 'red, green and blue' to
   'led-0, led-1 and led-2'
 - Renamed led labels 'led-0, led-1 and led-2'
   to 'red, green and blue'
 - Added Reviewed-by and Signed-off-by tags

 
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 355 ++++++++++++++++++
 2 files changed, 356 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 525ef180481d..d861e576779a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -206,6 +206,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pro.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pulse.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
new file mode 100644
index 000000000000..9138c65739aa
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
@@ -0,0 +1,355 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2019 NXP
+ */
+
+/dts-v1/;
+
+#include "imx8mp.dtsi"
+
+/ {
+	model = "NXP i.MX8MPlus FRDM board";
+	compatible = "fsl,imx8mp-frdm", "fsl,imx8mp";
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			label = "red";
+			gpios = <&pcal6416 13 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-1 {
+			label = "green";
+			gpios = <&pcal6416 14 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+
+		led-2 {
+			label = "blue";
+			gpios = <&pcal6416 15 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0 0xc0000000>,
+		      <0x1 0x00000000 0 0x40000000>;
+	};
+};
+
+&A53_0 {
+	cpu-supply = <&reg_arm>;
+};
+
+&A53_1 {
+	cpu-supply = <&reg_arm>;
+};
+
+&A53_2 {
+	cpu-supply = <&reg_arm>;
+};
+
+&A53_3 {
+	cpu-supply = <&reg_arm>;
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	status = "okay";
+
+	pmic@25 {
+		compatible = "nxp,pca9450c";
+		reg = <0x25>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pmic>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+
+		regulators {
+			BUCK1 {
+				regulator-name = "BUCK1";
+				regulator-min-microvolt = <720000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			reg_arm: BUCK2 {
+				regulator-name = "BUCK2";
+				regulator-min-microvolt = <720000>;
+				regulator-max-microvolt = <1025000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+				nxp,dvs-run-voltage = <950000>;
+				nxp,dvs-standby-voltage = <850000>;
+			};
+
+			BUCK4 {
+				regulator-name = "BUCK4";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3600000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			reg_buck5: BUCK5 {
+				regulator-name = "BUCK5";
+				regulator-min-microvolt = <1650000>;
+				regulator-max-microvolt = <1950000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			BUCK6 {
+				regulator-name = "BUCK6";
+				regulator-min-microvolt = <1045000>;
+				regulator-max-microvolt = <1155000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO1 {
+				regulator-name = "LDO1";
+				regulator-min-microvolt = <1650000>;
+				regulator-max-microvolt = <1950000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO3 {
+				regulator-name = "LDO3";
+				regulator-min-microvolt = <1710000>;
+				regulator-max-microvolt = <1890000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO5 {
+				regulator-name = "LDO5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+
+	pcal6416: gpio@20 {
+		compatible = "nxp,pcal6416";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pcal6416_int>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names = "CSI1_nRST",
+			"CSI2_nRST",
+			"DSI_CTP_RST",
+			"EXT_PWREN1",
+			"CAN_STBY",
+			"EXP_P0_5",
+			"EXP_P0_6",
+			"P0_7",
+			"LVDS0_BLT_EN",
+			"LVDS1_BLT_EN",
+			"LVDS0_CTP_RST",
+			"LVDS1_CTP_RST",
+			"SPK_PWREN",
+			"RLED_GPIO",
+			"GLED_GPIO",
+			"BLED_GPIO";
+	};
+
+	pcal6416_1: gpio@21 {
+		compatible = "nxp,pcal6416";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pcal6416_1_int>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names = "P0_0",
+			"P0_1",
+			"AUD_nINT",
+			"RTC_nINTA",
+			"USB1_SS_SEL",
+			"USB2_PWR_EN",
+			"SPI_EXP_SEL",
+			"P0_7",
+			"W2_HOST_WAKE_SD_3V3",
+			"W2_HOST_WAKE_BT_3V3",
+			"EXP_WIFI_BT_PDN_3V3",
+			"EXP_BT_RST_3V3",
+			"W2_RST_IND_3V3",
+			"SPI_nINT_3V3",
+			"KEYM_PCIE_nWAKE",
+			"P1_7";
+	};
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	status = "okay";
+};
+
+&i2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	status = "okay";
+};
+
+&snvs_pwrkey {
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>;
+	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&usdhc3 {
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC3>;
+	assigned-clock-rates = <400000000>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL	0x400001c2
+			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA	0x400001c2
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL	0x400001c2
+			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA	0x400001c2
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL	0x400001c2
+			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA	0x400001c2
+		>;
+	};
+
+	pinctrl_pmic: pmicgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03	0x000001c0
+		>;
+	};
+
+	pinctrl_pcal6416_int: pcal6416_int_grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16	0x146
+		>;
+	};
+
+	pinctrl_pcal6416_1_int: pcal6416_1_int_grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11	0x146
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x140
+			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x140
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX	0x140
+			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX	0x140
+			MX8MP_IOMUXC_ECSPI1_SS0__UART3_DCE_RTS	0x140
+			MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS	0x140
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d0
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d0
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d0
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d0
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d0
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d0
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d0
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d0
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d0
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x190
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x194
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d4
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d4
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d4
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d4
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d4
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d4
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d4
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d4
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d4
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x194
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x196
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d6
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d6
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d6
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d6
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d6
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d6
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d6
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d6
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d6
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x196
+		>;
+	};
+};
-- 
2.25.1


