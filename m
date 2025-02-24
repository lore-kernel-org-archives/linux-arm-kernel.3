Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D269FC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9LRaiNk8FyZNRxtFP20bbpDLU2DtIYYR2CnN5SODS0=; b=wN0h2ffwxl765iMPmVKBWnEr9Z
	/0ztYgqp0n47qY7/Ec95eXoVh04QQwR6WRo5CssBcws5m0NjlobbdJ/eEh/Pf59ZDrIOUP1bZotST
	00/E41cw2xl/dIP69WoG1k/5uyTxnf0MiKZ5Ll7xIN8ZhaTn005Gd6W2Do3eMPjd9X6iQOOfSEGdC
	9gLQW1Kty9OQYSoT8sidY9BCAZpmxAbmgXRMO6AYLOjtI+25+Yzgp+zyWFBFjAbNGVdfrGrHAoB1g
	lzCLi8BAgw9ZkdeH8mkkwaNZ0uw32TTDIfQ/vULYeSLnO2Ct5vyeqWYmhFJOg8JSAPYPj+vUn5YLY
	czHpJr7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZFj-0000000E3Yg-2zi5;
	Mon, 24 Feb 2025 14:16:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYrb-0000000DyJp-1TUU
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 24 Feb 2025 13:51:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=i9LRaiNk8FyZNRxtFP20bbpDLU2DtIYYR2CnN5SODS0=; b=b+lpRKkKpLTk9IQ4Tj4BhLxtR5
	R1FJpXitseczIEUaTVKWVRSZyPUMVLZsVhuIMtxmAM784kFNNJ2yxgwayRd9waakoxGWCJ4CNPyZk
	4hYMV0Ipyf0MFfPlhMosXJVovb2G+QvGc+1acM/Mhti2nT7RCv1zKnfTgbup2DKfqRcnq4mM3oBE0
	18EwlP2sKpW+374hFAuDhesAgIkuS0OXIbcfhYxpAWh3D/k/BXp0YcevNvPGwq1ItBE9ctYUPtSZh
	cguChA2jc5BMjtexRZMBmb5zib0E08MscOoFEAumhdD/XR4NuMKgrfBLppZwQrJUaRQJWZnSyVqoC
	uVpyfqnA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYrX-00000003D7H-3shA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 13:51:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B6FA25C6E0A;
	Mon, 24 Feb 2025 13:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9D29C4CEEC;
	Mon, 24 Feb 2025 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740405065;
	bh=+eHC+4H8Gxjzo6CEgrKwo0NFaiQaM/f4spY+AvS6fx8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QvWLyURamJWLbvM/GfU9v5wZlaxdFkZIJHfEZGyRVbMMXpDDMXMbQ4UKPK4G0C8ro
	 NzzDidbLxfLV/8iGoASdWRy5lFvqTFWQ+/vvYJXBIjj3R48bs/03rqgBP2ylGzu+l/
	 2R7adSU3x8xh8qWmiafnN4Co3B8ukQyw8IkYE906U4cl8ziDIlB6P7zeV9lPw/cTL1
	 EXq7IVU3dpQQzoIzxv+PCS7dQtdW6FQIfiyrln27wauT1JFrbIl3SF6QfQorOBZU2z
	 j+aTAUyDATv9SeKiOuZgpmvp0D4iSo2MMxPyPLbn89gwNK49gy+x+0oJEQM2sOTBSc
	 mEhyOFCsDA/Uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1829C021BC;
	Mon, 24 Feb 2025 13:51:04 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 24 Feb 2025 14:51:01 +0100
Subject: [PATCH 11/14] arm64: dts: freescale: add Ka-Ro Electronics
 tx8p-ml81 COM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250224-initial_display-v1-11-5ccbbf613543@gocontroll.com>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
In-Reply-To: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740405062; l=15971;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=U6EaQKYXnBF016yPvOvciC5YpGGfdo+pFQHsfi1Bjqc=;
 b=EuM+q6D0v6OXfDDF04OzrtSDkm2l73LxI5/ro4yM1BqnU42Ep6ZMjjZTL0MQcyXzB92g/Fd5p
 uULI0/1ynQfBZariZbPxqvMRdG0ic8v+qZE4VG6IsLUrfaCItwEjjO4
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_135112_439557_3B271244 
X-CRM114-Status: GOOD (  11.96  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

The Ka-Ro Electronics tx8p-ml81 is a COM based on the imx8mp SOC. It has
2 GB or ram and 8 GB of eMMC storage on board.

Add it to enable boards based on this Module

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 547 +++++++++++++++++++++
 1 file changed, 547 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..3c29265c3f0db87c8315aedc7386d58eb6bec6b8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
@@ -0,0 +1,547 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2020 Lothar Waßmann <LW@KARO-electronics.de>
+ * 2025 Maud Spierings <maudspierings@gocontroll.com>
+ */
+
+#include "imx8mp.dtsi"
+
+/ {
+	/* PHY regulator */
+	regulator-3v3-etn {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_3v3_etn>;
+		regulator-name = "3v3-etn";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_vdd_3v3>;
+		gpios = <&gpio1 23 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&A53_0 {
+	cpu-supply = <&reg_vdd_arm>;
+};
+
+&A53_1 {
+	cpu-supply = <&reg_vdd_arm>;
+};
+
+&A53_2 {
+	cpu-supply = <&reg_vdd_arm>;
+};
+
+&A53_3 {
+	cpu-supply = <&reg_vdd_arm>;
+};
+
+
+&eqos {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_eqos>;
+	pinctrl-1 = <&pinctrl_eqos_sleep>;
+	assigned-clocks = <&clk IMX8MP_CLK_ENET_AXI>,
+			  <&clk IMX8MP_CLK_ENET_QOS_TIMER>,
+			  <&clk IMX8MP_CLK_ENET_QOS>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_266M>,
+				 <&clk IMX8MP_SYS_PLL2_100M>,
+				 <&clk IMX8MP_SYS_PLL2_50M>;
+	assigned-clock-rates = <0>, <100000000>, <50000000>;
+	phy-mode = "rmii";
+	phy-handle = <&ethphy0>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ethphy_rst_b>;
+		reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+		reset-delay-us = <25000>;
+
+		ethphy0: ethernet-phy@0 {
+			reg = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_ethphy_int_b>;
+			interrupt-parent = <&gpio4>;
+			interrupts = <21 IRQ_TYPE_EDGE_FALLING>;
+			clocks = <&clk IMX8MP_CLK_ENET_QOS>;
+			smsc,disable-energy-detect;
+		};
+	};
+};
+
+&gpio1 {
+	gpio-line-names = "SODIMM_152",
+		"SODIMM_42",
+		"PMIC_WDOG_B SODIMM_153",
+		"PMIC_IRQ_B",
+		"SODIMM_154",
+		"SODIMM_155",
+		"SODIMM_156",
+		"SODIMM_157",
+		"SODIMM_158",
+		"SODIMM_159",
+		"SODIMM_161",
+		"SODIMM_162",
+		"SODIMM_34",
+		"SODIMM_36",
+		"SODIMM_27",
+		"SODIMM_28",
+		"ENET_MDC",
+		"ENET_MDIO",
+		"",
+		"ENET_XTAL1/CLKIN",
+		"ENET_TXD1",
+		"ENET_TXD0",
+		"ENET_TXEN",
+		"ENET_POWER",
+		"ENET_COL/CRS_DV",
+		"ENET_RXER",
+		"ENET_RXD0",
+		"ENET_RXD1",
+		"",
+		"",
+		"",
+		"";
+};
+
+&gpio2 {
+	gpio-line-names = "",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"SODIMM_51",
+		"SODIMM_57",
+		"SODIMM_56",
+		"SODIMM_52",
+		"SODIMM_53",
+		"SODIMM_54",
+		"SODIMM_55",
+		"SODIMM_15",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"";
+};
+
+&gpio3 {
+	gpio-line-names = "",
+		"",
+		"EMMC_DS",
+		"EMMC_DAT5",
+		"EMMC_DAT6",
+		"EMMC_DAT7",
+		"",
+		"",
+		"",
+		"",
+		"EMMC_DAT0",
+		"EMMC_DAT1",
+		"EMMC_DAT2",
+		"EMMC_DAT3",
+		"",
+		"EMMC_DAT4",
+		"",
+		"EMMC_CLK",
+		"EMMC_CMD",
+		"SODIMM_75",
+		"SODIMM_145",
+		"SODIMM_163",
+		"SODIMM_164",
+		"SODIMM_165",
+		"SODIMM_143",
+		"SODIMM_144",
+		"SODIMM_72",
+		"SODIMM_73",
+		"SODIMM_74",
+		"SODIMM_93",
+		"",
+		"";
+};
+
+&gpio4 {
+	gpio-line-names = "SODIMM_98",
+		"SODIMM_99",
+		"SODIMM_100",
+		"SODIMM_101",
+		"SODIMM_45",
+		"SODIMM_43",
+		"SODIMM_105",
+		"SODIMM_106",
+		"SODIMM_107",
+		"SODIMM_108",
+		"SODIMM_104",
+		"SODIMM_103",
+		"SODIMM_115",
+		"SODIMM_114",
+		"SODIMM_113",
+		"SODIMM_112",
+		"SODIMM_109",
+		"SODIMM_110",
+		"SODIMM_95",
+		"SODIMM_96",
+		"SODIMM_97",
+		"ENET_nINT",
+		"ENET_nRST",
+		"SODIMM_84",
+		"SODIMM_87",
+		"SODIMM_86",
+		"SODIMM_85",
+		"SODIMM_83",
+		"",
+		"SODIMM_66",
+		"SODIMM_65",
+		"";
+};
+
+&gpio5 {
+	gpio-line-names = "",
+		"",
+		"",
+		"SODIMM_76",
+		"SODIMM_81",
+		"SODIMM_146",
+		"SODIMM_48",
+		"SODIMM_46",
+		"SODIMM_47",
+		"SODIMM_44",
+		"SODIMM_49",
+		"",
+		"SODIMM_70",
+		"SODIMM_69",
+		"PMIC_SCL",
+		"PMIC_SDA",
+		"SODIMM_41",
+		"SODIMM_40",
+		"SODIMM_148",
+		"SODIMM_149",
+		"SODIMM_150",
+		"SODIMM_151",
+		"SODIMM_60",
+		"SODIMM_59",
+		"SODIMM_64",
+		"SODIMM_63",
+		"SODIMM_62",
+		"SODIMM_61",
+		"SODIMM_68",
+		"SODIMM_67",
+		"",
+		"";
+};
+
+&i2c1 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	clock-frequency = <400000>;
+	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pmic@25 {
+		reg = <0x25>;
+		compatible = "nxp,pca9450c";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pmic>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+
+		regulators {
+			reg_vdd_soc: BUCK1 {
+				regulator-name = "vdd-soc";
+				regulator-min-microvolt = <805000>;
+				regulator-max-microvolt = <900000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			reg_vdd_arm: BUCK2 {
+				regulator-name = "vdd-core";
+				regulator-min-microvolt = <805000>;
+				regulator-max-microvolt = <950000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+				nxp,dvs-run-voltage = <950000>;
+				nxp,dvs-standby-voltage = <850000>;
+			};
+
+			reg_vdd_3v3: BUCK4 {
+				regulator-name = "3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			reg_nvcc_nand: BUCK5 {
+				regulator-name = "nvcc-nand";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			reg_nvcc_dram: BUCK6 {
+				regulator-name = "nvcc-dram";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			reg_snvs_1v8: LDO1 {
+				regulator-name = "snvs-1v8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2_reg: LDO2 {
+				regulator-name = "LDO2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1150000>;
+				regulator-always-on;
+			};
+
+			reg_vdda_1v8: LDO3 {
+				regulator-name = "vdda-1v8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4_reg: LDO4 {
+				regulator-name = "LDO4";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			ldo5_reg: LDO5 {
+				regulator-name = "LDO5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+			};
+		};
+	};
+};
+
+&usdhc3 { /* eMMC */
+	max-frequency = <200000000>;
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC3>;
+	assigned-clock-rates = <200000000>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	bus-width = <8>;
+	vmmc-supply = <&reg_vdd_3v3>;
+	vqmmc-supply = <&reg_nvcc_nand>;
+	voltage-ranges = <3300 3300>;
+	non-removable;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_TD2__CCM_ENET_QOS_CLOCK_GENERATE_REF_CLK
+			(MX8MP_DSE_X4 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE | MX8MP_SION)
+			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC
+			(MX8MP_DSE_X4 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO
+			(MX8MP_DSE_X4 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST)
+			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST)
+			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_RXC__ENET_QOS_RX_ER
+			(MX8MP_FSEL_FAST | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST)
+		>;
+	};
+
+	pinctrl_eqos_sleep: eqos-sleep-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_TD2__GPIO1_IO19
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_MDC__GPIO1_IO16
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_MDIO__GPIO1_IO17
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_TD0__GPIO1_IO21
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_TD1__GPIO1_IO20
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_RD0__GPIO1_IO26
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_RD1__GPIO1_IO27
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_RXC__GPIO1_IO25
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_RX_CTL__GPIO1_IO24
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_TX_CTL__GPIO1_IO22
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_ethphy_int_b: ethphy-int-bgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_RXFS__GPIO4_IO21
+			(MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT)
+		>;
+	};
+
+	pinctrl_ethphy_rst_b: ethphy-rst-bgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22
+			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL
+			(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE | MX8MP_SION)
+			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA
+			(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE | MX8MP_SION)
+		>;
+	};
+
+	pinctrl_i2c1_gpio: i2c1-gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14
+			(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE | MX8MP_SION)
+			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15
+			(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE | MX8MP_SION)
+		>;
+	};
+
+	pinctrl_pmic: pmicgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03
+			(MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_reg_3v3_etn: reg-3v3-etngrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_TXC__GPIO1_IO23
+			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK
+			(MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE
+			(MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+		>;
+	};
+};

-- 
2.48.1



