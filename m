Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD550C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 11:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5okm8uoPz+8WNSFkmNfoiYJAYCsIf58am62AWYoUyw=; b=T3ZLXroz5YYHgwG3IvlzNzqzco
	1Ez+bt17rRbVL4C2w51ewn/awg9qjmB1mlutJ+m996+dO5O6G1OqOVicfPf1GRFlSAvwwJeBe3nz3
	8NShbAGMgLfWRN1zVvr2bqxT9x6temZP/8bbq7632z57RwEo/H3O08EZEXKT2JQnUR7nFB3pRsQoY
	kdUnNtNF/vUft8E404V87FGKVvpAhFbFyLTk9InUCUEHJ8yqbXZZJjF34tKO+UfzI9wIX4ti+OJIf
	NCsblgucE92DtMPECbAw5ylI5WckQJYh6i0AkwQ9jrF8sk3V4BTPJhSK3MgeuFAQTwzbMwneiOpf+
	1fXBltYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7C9q-0000000714k-20xn;
	Tue, 22 Apr 2025 11:51:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BJN-00000006qmd-0CXd
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 10:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=i5okm8uoPz+8WNSFkmNfoiYJAYCsIf58am62AWYoUyw=; b=ZyYgoguNCCuciBscN8uVGKjy+R
	ljvNb+2gGtnFXbtASjWy8D//hkZ2BUHvFPLAWSdofKj0rwCezCV+aHUu7oM36TYySpjks6/j+1aaX
	xQM8Ns/iRIyobTVOSloLNXXcnqqhAzBrVJ5ytY8663zn2mDIgc40bjwsZ903JQ08XJlnF6vT9+GYl
	MBJANIuC7KXEtAjB/lY3lk9BBv7U15P6SCT5U6kP/UwVbXpSKTr1+WjlN4zkqlUoG2Ony13/N0STp
	9R66oF+chyWdzWx74SG+ijxS4G68q3sOnHUhFRScdNX0j66C/VcnDNk+oHrVvHn29GJ40OvMwzUoF
	0BvvTLTQ==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7BJJ-0000000BBNu-28ai
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 10:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=i5okm8uoPz+8WNSFkmNfoiYJAYCsIf58am62AWYoUyw=; b=X5E8Mq7afcyHhQKgIGA2GXj9Qt
	RheJEEAbda9R1ZUFqO5pzm2yJW4GJMsGceFyDKkjD++pA2ZxJJPdrbeVpCg2wKCR321UZhkJ6sPFd
	+MNAa7wHMT3r3LrHv2of71UGLB3hPmtAdMLmOdw3vpe2G9O2g3BcHwEnUQEOFuhlIOMHZ5SnEz7rl
	iuMAsYwZXzhJjMQ0g6YAfm/VQFuPSgrdNIygoEbj9deaGODvE7tawnG0Vv1GOzAcnTd40/Aspos5n
	TqComNi771UbvmTThdowtag21z6yBYhIjYju5DXKEEuCheKNHkC1Szv9+xUUujDJrFag0dhe4O2X1
	jTOpl3jg==;
Received: from [89.212.21.243] (port=36562 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u7BJI-008kyr-10;
	Tue, 22 Apr 2025 12:57:04 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v4 14/15] arm64: dts: freescale: imx93-phyboard-segin: Add EQOS Ethernet
Date: Tue, 22 Apr 2025 12:56:43 +0200
Message-Id: <20250422105644.2725168-15-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422105644.2725168-1-primoz.fiser@norik.com>
References: <20250422105644.2725168-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_115706_130930_D9A5073E 
X-CRM114-Status: UNSURE (   6.85  )
X-CRM114-Notice: Please train this message.
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

Add support for the carrier-board Micrel KSZ8081 Ethernet PHY. This is a
10/100Mbit PHY connected to the EQOS interface and shares MDIO bus with
the Ethernet PHY located on the SoM (FEC interface).

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v4:
- no changes

 .../dts/freescale/imx93-phyboard-segin.dts    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 54e084e69706..c62cc06fad4b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -89,6 +89,28 @@ dailink_master: simple-audio-card,codec {
 	};
 };
 
+/* Ethernet */
+&eqos {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_eqos>;
+	phy-mode = "rmii";
+	phy-handle = <&ethphy2>;
+	assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
+				 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
+	assigned-clock-rates = <100000000>, <50000000>;
+	status = "okay";
+};
+
+&mdio {
+	ethphy2: ethernet-phy@2 {
+		compatible = "ethernet-phy-id0022.1561";
+		reg = <2>;
+		clocks = <&clk IMX93_CLK_ENET_REF_PHY>;
+		clock-names = "rmii-ref";
+		micrel,led-mode = <1>;
+	};
+};
+
 /* CAN */
 &flexcan1 {
 	pinctrl-names = "default";
@@ -173,6 +195,19 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX93_PAD_ENET1_TD2__CCM_ENET_QOS_CLOCK_GENERATE_REF_CLK	0x4000050e
+			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0		0x57e
+			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1		0x57e
+			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0		0x50e
+			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1		0x50e
+			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL	0x57e
+			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL	0x50e
+			MX93_PAD_ENET1_RXC__ENET_QOS_RX_ER		0x57e
+		>;
+	};
+
 	pinctrl_flexcan1: flexcan1grp {
 		fsl,pins = <
 			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX	0x139e
-- 
2.34.1


