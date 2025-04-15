Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D14C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 05:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uR8LPbHDgNSM7AhWPolnz9HlzPcZZRBNSxa2xgzKrD0=; b=QfYFp0GHxnv3JDBMmBcZwoKuOX
	fpeI0nvKoF4Tpp/Ppy/FG8thdNGOzdCg9odg1WHa/vV3ROZbh+Enu4Vmi/TID/cNN0M3LhjUOfU9f
	U6BQFo+kmA8x9jDwyETQOoCDzi/DenXwO2MzuyOiZMuR5wCsEnjBZufpPNyLzmWJsLFb6nhb2CKdV
	puLds9ChTzpjTA5SVXz1g9gBGfuc2uA1OAZZ6Qf8NYnoYDoPez3DrGhIqCXNA9mj6ymBs9BN98U08
	6OlMIUWotRz4m3fWkxK5wWRnI4PSfJHfzE6l2hD9uYifJFBVSsNEoffd6oAhHDwUq5KU8mcJgrTxr
	UXHclcEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4YRi-00000004Vuj-1ddN;
	Tue, 15 Apr 2025 05:02:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4XzM-00000004Rps-3Q7G
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Apr 2025 04:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uR8LPbHDgNSM7AhWPolnz9HlzPcZZRBNSxa2xgzKrD0=; b=RAO3Hf3FiC0cuslo4r4LtOzAje
	7m9EGSHs9qBwudpVZzMkAuuBNKzLlAf8ffieGl9Ncht27ImCM83fIbthBI42ag2ZgBQgLhxoJsajm
	xZ3yi30QJQ0tyEZz8BQiBVtUiQQZQQ3jPEwaCYMc7F/K6CxHfHSgFT7wowIqScIJVwr0ZzrLxToWl
	Eck17JoE7KIq/8T64sxVD7b8i+zxbfDNl3Qp+Z+8wRUvTH7pg35NGO2Su0YpUJqDHYj3F6Bl+7l3Z
	VT47Id64Q+yqYNRc5bA/c60s8e9R54EBnHkHQYRfl/AWtttM/6DPsDetP6UrbHyyhZBuxTu2UvXqB
	zssJw2KQ==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4XzF-00000009omH-2glT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 04:33:35 +0000
Received: from [89.212.21.243] (port=52324 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u4XzG-00Gb4I-00;
	Tue, 15 Apr 2025 06:33:29 +0200
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
Subject: [PATCH v2 14/15] arm64: dts: freescale: imx93-phyboard-segin: Add EQOS Ethernet
Date: Tue, 15 Apr 2025 06:33:10 +0200
Message-Id: <20250415043311.3385835-15-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415043311.3385835-1-primoz.fiser@norik.com>
References: <20250415043311.3385835-1-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20250415_053333_422759_C725E2E9 
X-CRM114-Status: UNSURE (   7.10  )
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
Changes in v2:
- add Reviewed-by tag

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


