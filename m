Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9BFCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 11:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kly4N6abxp7aiePb6wwRYSJBZH1/+QjzYw61vq0g2YY=; b=nlR+T27iTTgf9jmm0y9MnHbo9/
	x+DJveoTkXNA2+stEj4dHybr3KaW/lxYFoDW165p0zMBjfYKTBLOt+MvBMyigg5OvUhyOr61DyDEl
	oB7S207/5Po8FK1YU7tXnTe+YMSeREC4xv01OvlVFV03b5qYur9e4Yqm/Sg9426xtHw2UXsi1ieGn
	CZFQ4x+K8m/Tz+D9HZz+bpZy3LgbP9PJIl30F7iuLG8eyFSsz18AL+wNSLqT3cKg8QdQEv4+lFvlQ
	DNZY04hLi/YHGl7pVb1IiVJVIJstWG4aqsxzEfAak6fMVLWIIkjPXuDK2kKBKGa8ieevPJGBRD1a3
	RMhM7ZHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFt5U-00000009mUW-3pWt;
	Mon, 03 Nov 2025 11:51:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFt5S-00000009mR4-3QXX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 11:51:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kly4N6abxp7aiePb6wwRYSJBZH1/+QjzYw61vq0g2YY=; b=VLRDRUvcQXaTw2J9kkhL41exjg
	l03aK4H5uo2r3lFc7UW+qkMbskoYLmUNx1vTeQXFsWaGs/dVVrYQMk6ahorUvjrArrwmmMrW259rT
	d3gYqe06cb7qItzqXKILT6Mt5XgrHxlNNDsoghKsHOBnQRZsL6WTkefxMg6+rwYqZUKRz7iMHwEua
	FrXmdJ1esBBO2TXfhbNL31mcEW2ySLoGgSM3cn6UgIz8E31IZbecuu7xWNkYUdtqoNrTsmbHoi3Hd
	PIVdJnkHQ9YKxgv78dtENXBUJYvGAHwn/M9EaCCt1LFsMRmGOUQp6ye+LHFVBOPu3mwoHX3gSD3A8
	0yD2ZqVQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50026 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vFt56-000000000ho-2CKc;
	Mon, 03 Nov 2025 11:50:40 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vFt52-0000000ChpG-1bsd;
	Mon, 03 Nov 2025 11:50:36 +0000
In-Reply-To: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	s32@nxp.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH net-next 09/11] net: stmmac: imx: simplify set_intf_mode()
 implementations
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vFt52-0000000ChpG-1bsd@rmk-PC.armlinux.org.uk>
Date: Mon, 03 Nov 2025 11:50:36 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_035102_858575_D86EAE30 
X-CRM114-Status: GOOD (  12.85  )
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

Simplify the set_intf_mode() implementations, testing the phy_intf_sel
value rather than the PHY interface mode.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 67 ++++++-------------
 1 file changed, 19 insertions(+), 48 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index dc28486a7af0..d69be9de4468 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -67,29 +67,15 @@ static int imx8mp_set_intf_mode(struct plat_stmmacenet_data *plat_dat,
 				u8 phy_intf_sel)
 {
 	struct imx_priv_data *dwmac = plat_dat->bsp_priv;
-	int val;
-
-	switch (plat_dat->phy_interface) {
-	case PHY_INTERFACE_MODE_MII:
-		val = 0;
-		break;
-	case PHY_INTERFACE_MODE_RMII:
-		val = dwmac->rmii_refclk_ext ? 0 : GPR_ENET_QOS_CLK_TX_CLK_SEL;
-		break;
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-		val = GPR_ENET_QOS_RGMII_EN;
-		break;
-	default:
-		pr_debug("imx dwmac doesn't support %s interface\n",
-			 phy_modes(plat_dat->phy_interface));
-		return -EINVAL;
-	}
+	unsigned int val;
 
-	val |= FIELD_PREP(GPR_ENET_QOS_INTF_SEL_MASK, phy_intf_sel) |
-	       GPR_ENET_QOS_CLK_GEN_EN;
+	val = FIELD_PREP(GPR_ENET_QOS_INTF_SEL_MASK, phy_intf_sel) |
+	      GPR_ENET_QOS_CLK_GEN_EN;
+
+	if (phy_intf_sel == PHY_INTF_SEL_RMII && !dwmac->rmii_refclk_ext)
+		val |= GPR_ENET_QOS_CLK_TX_CLK_SEL;
+	else if (phy_intf_sel == PHY_INTF_SEL_RGMII)
+		val |= GPR_ENET_QOS_RGMII_EN;
 
 	return regmap_update_bits(dwmac->intf_regmap, dwmac->intf_reg_off,
 				  GPR_ENET_QOS_INTF_MODE_MASK, val);
@@ -99,39 +85,24 @@ static int
 imx8dxl_set_intf_mode(struct plat_stmmacenet_data *plat_dat,
 		      u8 phy_intf_sel)
 {
-	int ret = 0;
-
 	/* TBD: depends on imx8dxl scu interfaces to be upstreamed */
-	return ret;
+	return 0;
 }
 
 static int imx93_set_intf_mode(struct plat_stmmacenet_data *plat_dat,
 			       u8 phy_intf_sel)
 {
 	struct imx_priv_data *dwmac = plat_dat->bsp_priv;
-	int val, ret;
-
-	switch (plat_dat->phy_interface) {
-	case PHY_INTERFACE_MODE_RMII:
-		if (dwmac->rmii_refclk_ext) {
-			ret = regmap_clear_bits(dwmac->intf_regmap,
-						dwmac->intf_reg_off +
-						MX93_GPR_CLK_SEL_OFFSET,
-						MX93_GPR_ENET_QOS_CLK_SEL_MASK);
-			if (ret)
-				return ret;
-		}
-		break;
-	case PHY_INTERFACE_MODE_MII:
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-		break;
-	default:
-		dev_dbg(dwmac->dev, "imx dwmac doesn't support %s interface\n",
-			phy_modes(plat_dat->phy_interface));
-		return -EINVAL;
+	unsigned int val;
+	int ret;
+
+	if (phy_intf_sel == PHY_INTF_SEL_RMII && dwmac->rmii_refclk_ext) {
+		ret = regmap_clear_bits(dwmac->intf_regmap,
+					dwmac->intf_reg_off +
+					MX93_GPR_CLK_SEL_OFFSET,
+					MX93_GPR_ENET_QOS_CLK_SEL_MASK);
+		if (ret)
+			return ret;
 	}
 
 	val = FIELD_PREP(MX93_GPR_ENET_QOS_INTF_SEL_MASK, phy_intf_sel) |
-- 
2.47.3


