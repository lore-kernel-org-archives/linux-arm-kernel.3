Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0825CC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 14:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wp465GBd29bhYSADM6T0VGSuzx4l+sqGwpURc4OujX4=; b=wjn0kUJDtux4iF/rKk+Eojy3WN
	EcGDvCkK/L7KwYaiAP2jZvy9CqbjQRiPiyXG/BKBl8KnvEMq1W47AXh0Qoa7HOc2DCBzFZ+uYU60/
	5NhK/zX5awrI7Y+yRkAaLt5J6S8WGnrwabQufZdICtPq28NZgzsn7LiE3b166fpI+aKr484cj0GgJ
	RYYloUXxRR+a+VRFOMkqEt32zfNHfy4FGtbK6aDsQThvY93CqeyoGEUhrrECcTFCarr7Axc+yj1Gx
	2mrmkjkXPOJBTB4wXYT7+zL/25qTeSL/7ivFOBijVizhgkK9AxWqJhf7fVjT1Lzq5FS07JjBrBm2j
	Banq7IiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdCc-00000004LzC-21e1;
	Mon, 09 Jun 2025 14:10:18 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOd9s-00000004Lit-0bwZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 14:07:29 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so3540917f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 07:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749478046; x=1750082846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wp465GBd29bhYSADM6T0VGSuzx4l+sqGwpURc4OujX4=;
        b=cY+P5USM6kuzTPI4Fj55tYN0t6cJ/b+9BE6h7DjrTNFds0MHJjp/s1rjgCpH/K0/2K
         hPHVkpCiT06BNrcpMwM/pG0FhaQZPt5OpLdpbyvgKn9oZp1Kpi5LvYN5lsv0AlZnUgPa
         hdaY6cH6AcxoBkna+Bj7YUBje4MRpTKHymBQlAw8WYSN/jzeNdsast6aq9QRkmcfIuGF
         0LwQNS3OKTz4xAle2BcQa1kgmkc19gbCPre0AvCuJ5niODnsdoPVH/QdJjv3Kx8dq4Uh
         I0IPh1Lg97fX91QVT1wZ/bRy2Uk7DZ4DU5nwmUQmurK4tbkyNsudf1l0DLEbZKdXYJwN
         fwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749478046; x=1750082846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wp465GBd29bhYSADM6T0VGSuzx4l+sqGwpURc4OujX4=;
        b=AZRuuuq9yqkl/BvxqvjBJev1VKLbQxO0id4eSBgivv6O5olBbuNnALEV7znDYAv7/h
         eRTjct7YWPbFrmZefFA+GjZOjEa5j8qHVAfEJ8v6o8r4GCMeY6/fOmGkKcIZbaT7Aqjd
         YttVZ8b3c0giuIWZEtV6dWwB5i6a1O42Ar4+B0FgsoBTSKp0hCswMdCRbLobfPfUHx5G
         msnxMP2Ev3kzlUe/GMm/Ouz3AHTQMZq3YFkoiuTXSFr1Khtd/8HMsq1DS3zts7dEVnyM
         bevwp1fJwIMMY/F/vxmP9EeQcTmGDV7V7ZNToP/ZRudHXXt6xSDU7tbal7lgrw9ehpkD
         H1Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVJjvmmOVtxLqMoBXBIaFhX9zwxRqfkWOF6PNxIujBOpKTAOcGFc19MTWXyupGmLdfzvLB9XLL/EvZMIpVEdjvY@lists.infradead.org
X-Gm-Message-State: AOJu0YwazOdHuKu54FUDRnSHvdYssk0xlRyZMDxlmanAjwRli3qV+IYY
	mb8vUhXP268k9EyB41wuoMx6F4lYqZcA4smltpMcwdQsorUd3sR7yL/VllBXi8tN
X-Gm-Gg: ASbGnculDawErbv0AvKCfIe7xc0DbSveC6WLSxtw0Vj1xlOsDiixU2C6d4ZcQtqLUx2
	+ZgwjTnh83inhNh/CSmJspHKjNswfUm3ruoCLyAEgOPH5HjXuD24Ttrqcp/8zMOBVnwoiEAYMLO
	rzLd0dcpBrizD5cDEnxaS5QwerpKrWnF5J7C9PExrt84iLHAzKi/XHw4WSYTdVkQbAuaTHdlXp7
	LWH+VAad15SZaTbQDcUDBAyTSocedNARZfks9FgGgisJvTTKQdqKioSNBUfdaaZFla+lkiycpHR
	Z2Sds5DthsTr53rhCD03fr6atpkvV723m6LNrhybhNYZVOSHYrLEnxfhxZQ2xM5jRK0ApwCbz9m
	XUlrSld2v7I6uEmPxqBxyRRVVXiA6oNWz/og=
X-Google-Smtp-Source: AGHT+IG0REgGH1fHd+dkuiR3Fo6WREiMEfAZe6OZVVichjBI/5GBIj0dx+h9EBokmXQjt5fQUEHrXA==
X-Received: by 2002:a05:6000:401e:b0:3a4:fb33:85ce with SMTP id ffacd0b85a97d-3a531caf7f1mr11598279f8f.46.1749478045626;
        Mon, 09 Jun 2025 07:07:25 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229d9e9sm9803060f8f.13.2025.06.09.07.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:07:25 -0700 (PDT)
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
Subject: [PATCH v1] arm64: dts: freescale: imx8mp-var-som: Add EQoS support with MaxLinear PHY
Date: Mon,  9 Jun 2025 16:06:42 +0200
Message-ID: <20250609140643.26270-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_070728_184657_0B30E5C9 
X-CRM114-Status: GOOD (  13.06  )
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
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index b59da91fdd04..3be59692849f 100644
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
@@ -73,6 +91,54 @@ &A53_3 {
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
+			at803x,eee-disabled;
+			eee-broken-1000t;
+			reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
+			vddio-supply = <&reg_phy_vddio>;
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
@@ -239,6 +305,27 @@ &wdog1 {
 
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


