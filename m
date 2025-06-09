Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EB7C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 17:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TzSqzq1VrgA990PGl630TsjWDpOUagJtIkeks6UeTe4=; b=aDqZUqwUCwQjJs0A7gu1thjWD+
	5/IWNtxVcWtvx6kyof96bUMMmyO0Eb4kjPr8zwkC02wYnjp8og/asN6DFJjSPMDcyubE30r/JetG3
	SGJxBvLKbyr/LZzgPK0P/1ILhKrWlCy3VPO5sO5wkjgaNBDcr+7WR/wGU0H8fjq5V4FfmEl5kHi7d
	tmfObLKVpw+5ARjo0AN4D6E8p9dT1zaJ9szhP6pFzPiyzVPjcW+LtrRM+e1Emvn8nyWSal+CZCLUq
	Ib5SQFchisa7/kRmpoGR1d7abZpefF1BSg13TJlnjSy7nxsUVM1ckpJVzwJeo5EF2EzQRscFQXhhH
	wctFixqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfzC-00000004lP7-1kc6;
	Mon, 09 Jun 2025 17:08:38 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOf5X-00000004cpZ-0W54
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 16:11:08 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-451d54214adso37397275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 09:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749485466; x=1750090266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TzSqzq1VrgA990PGl630TsjWDpOUagJtIkeks6UeTe4=;
        b=MZ3mCh3jYzjCdUyG0eJuZgqufEvni1SLf2BF6dPJwVWnQlEM1Xv6+KpIKcHypQvj5y
         h5g5tKY9UXCuPWz+gQo/tVgLlXYWADPJ359VRBOOAu1DJ8exmh52utBhMM8TyR36dYpW
         3RGLHXDDMD/Izkvd+Cllh/shXlgQ8xrLdK/QT3evobWcCNSTX0TlrBNkV5wb7PeOhZKZ
         cdQsVN17hR3Q5iVzvsHqsVN9J4AbY93OzWvkwYOOxeKklDIMbP4fegjymINHD1rl8oU4
         LGsgpSI+SBwDbJ4y1PcTY/EnKs0sF9nRSS0i4hDdZMAMPk74vrvOt3r5s8G5zH5Kf2tp
         /sCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749485466; x=1750090266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzSqzq1VrgA990PGl630TsjWDpOUagJtIkeks6UeTe4=;
        b=cMK9diNdDiVbugEj7W0ZjzppZYE8RhInjFllkgKSIPidg3BM1NfBgFPDvUEhahU+Ae
         IYeX5qK22pU0yYdWi35yJ7yAPReq4rZNm41JTs2/GGUcqh3wo5iyPm3nBCsAI92aGrxd
         UIsjS9o8diC6a+2U3NESRmGlz8y3VR5reeChuSAyhBrSvJPYPKbRssFb4SE02LQOdby0
         RizWjahuqb6c/yj2KJffkJJjbZawEGTmIvWlL/xezixQSXm3fFv9luLOhEESgE0OoLU0
         TBipggwy+a+5xoWFZiAVFQI9t0NqyDSH/4pBqyUNPQBfkos2D8f8CdbuEzYO5PusL181
         97ng==
X-Forwarded-Encrypted: i=1; AJvYcCVnIW1f4wA9fGaox3uDA0oiWdD7poXuSieaKcqIjgStNyVtnK7jrOAiiyEispt6J74t3lGS8O1u4+khBO9LE5kN@lists.infradead.org
X-Gm-Message-State: AOJu0YyE4dPCt+y5pzHECxxTlPsUauJOuAArufiXOiCKNNDvVF07KS8c
	UyAs3cB9Tyx9nxj4VWO3ftwxM43x7/kGe8NEdTy4zHAsjMDH1KwpbQyp
X-Gm-Gg: ASbGnct45TVRmhE9mcdxs/dK0fylYqhbNfpkGR2b5Wgel3hedSk0CBtAmBeK3vwZl3O
	sC7ZbmHxwl/wqcNhVLVa0+YRKD+mTDfpeoxERz3IAmYtYaYQtJN01B/jXDQ4gTruovu3w7BrnTT
	I1zfIMrluu8MYxILUBp0r5EAe6b3JJybBChSZV/Ys78rpuq4OoLtiZFLszSrb9bRVImch/ToWRe
	wxDpKOn7YKsNng/8ZUBj87vax/TrVo9lXEbW3m/vEbgO2Xdyqcy5z0fwjGWLoxUZ+n5fGez4k33
	DxP4OC5tz47cKnKOzh+IQVe91Qj1KYg+QwZsPsOAuLSWQ9/4kCbf/QqiwZy+O1cmRkv6piNBzLm
	8hdpGAhe1eJGN7qdjylA0/hCg7YmEkY5CFb+5hRLHiq5DDQ==
X-Google-Smtp-Source: AGHT+IHtIAm+CgeogJ80QF3mkNurNdrFEg3E5GnfvWjyLoDvXRNtPRfHKHTN4qOmq57RWOY/L62rDQ==
X-Received: by 2002:a05:600c:4e09:b0:442:c993:6f94 with SMTP id 5b1f17b1804b1-452013510famr130923885e9.12.1749485465033;
        Mon, 09 Jun 2025 09:11:05 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209bc6d3esm115098115e9.6.2025.06.09.09.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 09:11:04 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: andrew@lunn.ch,
	Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] arm64: dts: freescale: imx8mp-var-som: Add EQoS support with MaxLinear PHY
Date: Mon,  9 Jun 2025 18:09:48 +0200
Message-ID: <20250609160949.35654-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_091107_161385_F6BCD4A9 
X-CRM114-Status: GOOD (  12.82  )
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

Enable the EQoS Ethernet controller on the i.MX8MP VAR-SOM with the
integrated Maxlinear MXL86110 PHY. The PHY is connected to the EQOS
MDIO bus at address 4.

This patch adds:
- EQOS controller configuration with RGMII interface.
- Proper reset timings.
- PHY power supply regulators.
- RGMII pinmux configuration for all data, control and clock signals.
- LED configuration for link status indication via the LED subsystem
  under /sys/class/leds/, leveraging the support implemented in the.
  mxl86110 PHY driver (drivers/net/phy/mxl-86110.c).
  Two LEDs are defined to match the LED configuration on the Variscite
  VAR-SOM Carrier Boards:
    * LED@0: Yellow, netdev trigger.
    * LED@1: Green, netdev trigger.

The RGMII TX/RX delays are implemented in SOM via PCB passive
delays, so no software delay configuration is required.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
v2:
  - Removed 'eee' properties.

v1: https://lore.kernel.org/imx/20250609140643.26270-1-stefano.radaelli21@gmail.com/

 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index b59da91fdd04..29f080904482 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -55,6 +55,24 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 		states = <3300000 0x0 1800000 0x1>;
 		vin-supply = <&ldo5>;
 	};
+
+	reg_phy_supply: regulator-phy-supply {
+		compatible = "regulator-fixed";
+		regulator-name = "phy-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-enable-ramp-delay = <20000>;
+		gpio = <&gpio2 20 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	reg_phy_vddio: regulator-phy-vddio {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
 };
 
 &A53_0 {
@@ -73,6 +91,53 @@ &A53_3 {
 	cpu-supply = <&buck2>;
 };
 
+&eqos {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_eqos>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@4 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <4>;
+			reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
+			vddio-supply = <&reg_phy_vddio>;
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
 &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -239,6 +304,27 @@ &wdog1 {
 
 &iomuxc {
 
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
+			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0x2
+			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x90
+			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1			0x90
+			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2			0x90
+			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3			0x90
+			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x90
+			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL			0x90
+			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0			0x16
+			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1			0x16
+			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2			0x16
+			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3			0x16
+			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x16
+			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x16
+			MX8MP_IOMUXC_SD2_WP__GPIO2_IO20					0x10
+			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10				0x150
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SD1_DATA4__I2C1_SCL				0x400001c2

base-commit: e271ed52b344ac02d4581286961d0c40acc54c03
prerequisite-patch-id: 2335ebcc90360b008c840e7edf7e34a595880edf
-- 
2.43.0


