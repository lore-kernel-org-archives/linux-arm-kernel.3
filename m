Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C845CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlBKUGuvfMnGfuiypEqikRO1coECNduxCotAtZXGnIg=; b=W5A0+wdlHTUIfuWtkq8s8+LYSn
	0W1NZ3wT4Rk67TGEjQPcLakohLuTtbY8+H6NZrx0VgbyzXRvhUpPCHJvV6oZPD7WT80+YzypcUreG
	0u9+OnYR4FKNpph9wDMGcmMyptHbx3Ns/SB+QqRHOVzkQGFWdR1QSu/q4tehsxeEdzLGz1p3eJAsF
	O5A3UPqQmdr0n/E1HVXopO0F1cFuk/Q1nB/8yZQ8p9PswjPlbne6XWc0P5eXEelNNKNfMyW3KWiMP
	fn+4HfTWb2+sIQKWwNkqZlB4YtQ2zYVWJfG1w9WZ1KcJCTEJH6161NYJnONr9U67vUbvrwdKXoU89
	RknRRe+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmj9-0000000FHDl-3hdl;
	Wed, 03 Jun 2026 14:37:51 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmj0-0000000FGws-22Vo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:37:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso11277065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 07:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497461; x=1781102261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlBKUGuvfMnGfuiypEqikRO1coECNduxCotAtZXGnIg=;
        b=oqk2UVx8he09C5OqhsqBdYjx+R2SKhikBaGmJik2zOFzLjVlZ10DaEjGj1a03rV/3n
         pWLGsEsmfzeWxZio9EBBMQDCiebBUls6QBFSZmD9GxBl2YY8xbdGc7tunPPJnIsZW5L9
         ATZqV40OPK1+FrnelhkiogSwZEXaINaNsl0DhM648FTqjavOzmgFiQEMm3jsIMw182PH
         KnM544W60qmj5LtwcMjJHaHCrPJwq05A4qa1khEY0fEGL5mDsVpqey6LnKyHlOPYlAbO
         OZcxlEDafFr2MOLOhe3zcjj/J7pl1w9t6BOE2Fa5RL6Std/r58YJkc5uzuCwlwfCc3+r
         zpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497461; x=1781102261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QlBKUGuvfMnGfuiypEqikRO1coECNduxCotAtZXGnIg=;
        b=rY0RglW4uqU9gtuTpFkaTLw8MPrrJrQbJ83PialNeiBFsXdTfaLsjReK0r6ZFHM1K9
         wSr09kpjwxvOel8t/9xWcartzPWFtaZffiHsLbC0U6ouJ1ZQXM5OXkHNtaOAOKS0pycl
         EX8yiTQ7Ho4HUpgoL0Y1jOj9XHIV6bml3AenhVsnTtJ9eo+aoCDMWHIO19JAEiuNZ/ps
         42oLogjXTJ0Mhr1YqLWkNxj7NaedGQmN4xow0QKwc5KgBZhFGI7A6RrCI2/OACoV8nHD
         pJ8coIRIB3iTj3xn1+gdGd+4c9Dr4++qj7/0WTRImBvOXkMSaeJyzDLCufsB4Nliiiea
         V7WA==
X-Forwarded-Encrypted: i=1; AFNElJ9p7B9o8OYlDDiE+8wcJ2cbzMzUOaXcngSXrqnqE7SLrFk3q13Me9pF/4sKcBVp2Xnx/IktbV6WxmkGd3cuN27Y@lists.infradead.org
X-Gm-Message-State: AOJu0YyKSFrjW+vg4OGx3i2fnTfrB5DVwsX3Lr0pTeHkeUJ+K9im6yA4
	ESW9uC4v58bnR52ExXgeevx8JI3GMc2P1eFud04cP9ieyV4GrBABC0WE
X-Gm-Gg: Acq92OHLIXZdhSaDBJ4pFalg0NZzXzhMoDwQlP2/uBU2PSzI9amRIqzhJHbt25rZGvW
	DaRrO0qEEQ8z6LHUUQDe2hz9TGuNGL/lcm3WXBrGBK2hjIVndio9iEKOcfaWchaL88UAgJ84beQ
	sulCduzNerHen6nc1AM3ucncvUrZWYNAeVZgDHUQBvThjho613J/FcCugTFHDLebqquFDSfzgSR
	nXprz75t2D04kfx3IRVk5T/HCHUixDv4+WUk6ZD5hPaFnDEO+P+j5nhdNJXrOPBHGuMiTxG2VKk
	Kl8GQJnmDSNUXD6zvO7Dkvflja73ZX3CaGJrF8dz+Vb6f/2Y0M2wpO9ldMU+pEPgBYfQB18TTAl
	APizpdJpEoTGtZ68X3IdfBuD/9SD0ZTt3eJl6nJxztIVtKRh1sQJzkDzUAudBPo648QzYL/gDlE
	2gyCX8PsmMjijQQb4wNHoq7aRR01P5fX3hub6Dj1osjFsWczKfCW0zVCJb+5EZxu1kabO0MeVLH
	QxdI57npXPmhxARFwfQIC3iw3poi3JHeHnYA9/8KPbJ25Lw
X-Received: by 2002:a05:600c:4f44:b0:490:b26f:a512 with SMTP id 5b1f17b1804b1-490b5acf6d2mr67166455e9.0.1780497460679;
        Wed, 03 Jun 2026 07:37:40 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:40 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 13/14] arm64: dts: imx8mp-var-som-symphony: add second Ethernet port
Date: Wed,  3 Jun 2026 16:37:20 +0200
Message-ID: <57b48c65ec479641f3714292fc691ec8b70aa669.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_073742_544589_46AC6A22 
X-CRM114-Status: GOOD (  13.01  )
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

Add support for the second Ethernet interface available on the Symphony
carrier board.

Enable the FEC controller, add the MaxLinear MXL86110 Gigabit Ethernet
PHY on the MDIO bus, describe its reset and power configuration, and add
the required RGMII pinctrl settings.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Add FEC controller and MaxLinear MXL86110 PHY support

 .../dts/freescale/imx8mp-var-som-symphony.dts | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 6b2aaf6bae07..f4926ce0aec7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -66,6 +66,17 @@ pcie0_refclk: pcie0-refclk {
 		clock-frequency = <100000000>;
 	};
 
+	reg_fec_phy: regulator-fec-phy {
+		compatible = "regulator-fixed";
+		regulator-name = "fec-phy";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-enable-ramp-delay = <20000>;
+		gpio = <&pca9534 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -106,6 +117,38 @@ &ecspi2 {
 	status = "okay";
 };
 
+&eqos {
+	mdio {
+		ethphy1: ethernet-phy@5 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <5>;
+			reset-gpios = <&pca9534 5 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <20000>;
+			vddio-supply = <&vddio1>;
+
+			vddio1: vddio-regulator {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+		};
+	};
+};
+
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy1>;
+	phy-supply = <&reg_fec_phy>;
+	status = "okay";
+};
+
 &flexcan2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexcan2>;
@@ -363,6 +406,23 @@ MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
 		>;
 	};
 
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD4__ENET1_RGMII_RD0				0x90
+			MX8MP_IOMUXC_SAI1_RXD5__ENET1_RGMII_RD1				0x90
+			MX8MP_IOMUXC_SAI1_RXD6__ENET1_RGMII_RD2				0x90
+			MX8MP_IOMUXC_SAI1_RXD7__ENET1_RGMII_RD3				0x90
+			MX8MP_IOMUXC_SAI1_TXC__ENET1_RGMII_RXC				0x90
+			MX8MP_IOMUXC_SAI1_TXFS__ENET1_RGMII_RX_CTL			0x90
+			MX8MP_IOMUXC_SAI1_TXD0__ENET1_RGMII_TD0				0x00
+			MX8MP_IOMUXC_SAI1_TXD1__ENET1_RGMII_TD1				0x00
+			MX8MP_IOMUXC_SAI1_TXD2__ENET1_RGMII_TD2				0x00
+			MX8MP_IOMUXC_SAI1_TXD3__ENET1_RGMII_TD3				0x00
+			MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL			0x00
+			MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC				0x00
+		>;
+	};
+
 	pinctrl_flexcan2: flexcan2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART3_RXD__CAN2_TX					0x154
-- 
2.47.3


