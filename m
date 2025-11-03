Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C0ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 11:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+x67xrOfs+NtjduqtRJxZD8HBELV2D7qvud2IndiqU4=; b=oGj91lNBcFrDyYolmXIfEsi+LN
	hDx6d8O67wu2t6rRn7IJ8690vIjbK4rFveuHKj7JddaDITiFSztHWq4mvw+aq7h/61ceiPkbSrrMv
	msZju4waudCFvlYcC2pk7DVUXOtFHYLXNv4yVVBB7WBOTwlPaeBsCfcWx8nxiviskv81DOtvvpZX5
	jWEmw0WFJuTjzyEtvSu3v2jq/jLYltps10Fa11YaegkWZr+b6ywrZd4mdIQ9TjVZIDphj4nyURqul
	KArzNHIXVFTEV/jc8aZ+qkBX8D2/6UxD7TRTMosR1idLwG3rwOy+KAkUSSP+7OZTDgOKmSmHcQF0p
	ylmx66Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFt5e-00000009mc3-09Of;
	Mon, 03 Nov 2025 11:51:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFt5Y-00000009mW2-3uWH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 11:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+x67xrOfs+NtjduqtRJxZD8HBELV2D7qvud2IndiqU4=; b=eDlTZltoetN3Hk1dXyigbldu0u
	gLYRDBWpaj8VhWcsanGsGMOEUnFEmvC66Nj4x1QtyF9BH1Qc/u73b7jubrIw5ZWPWmoKzk3GSGmtL
	xJ9VYkHMSdMM42Dt1mcLxJSlD11vWe+IaORHyBYfRrUznWsbnT5Hyy7U7dB07Z7+qFT+pT95V8b0G
	XWTfellsJlbbkChSQwSejkGFdESfUc9XW1T0/bSPpZgSgo6LMOMRm7sDvUaOFtMzQNbTnJWGkGbZz
	FjQGf64JAQ9Xj87x8/+0Fzjt3KRvSmN7HSRkQXrWz0SxaznipsaFpnMXTXOx7CdEYBEMhIlYm9jnl
	sc2ueNDQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35376 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vFt5G-000000000iL-006H;
	Mon, 03 Nov 2025 11:50:50 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vFt5C-0000000ChpR-2kAB;
	Mon, 03 Nov 2025 11:50:46 +0000
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
Subject: [PATCH net-next 11/11] net: stmmac: imx: use ->set_phy_intf_sel()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vFt5C-0000000ChpR-2kAB@rmk-PC.armlinux.org.uk>
Date: Mon, 03 Nov 2025 11:50:46 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_035109_003427_2702ACA9 
X-CRM114-Status: GOOD (  11.71  )
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

Rather than placing the phy_intf_sel() setup in the ->init() method,
move it to the new ->set_phy_intf_sel() method.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 38 +++++--------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index ae1b73e1bcb2..db288fbd5a4d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -134,36 +134,19 @@ static int imx_dwmac_clks_config(void *priv, bool enabled)
 	return ret;
 }
 
-static int imx_dwmac_init(struct platform_device *pdev, void *priv)
+static int imx_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
 {
-	struct imx_priv_data *dwmac = priv;
-	phy_interface_t interface;
-	int phy_intf_sel, ret;
-
-	if (dwmac->ops->set_intf_mode) {
-		interface = dwmac->plat_dat->phy_interface;
-
-		phy_intf_sel = stmmac_get_phy_intf_sel(interface);
-		if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
-		    phy_intf_sel != PHY_INTF_SEL_RGMII &&
-		    phy_intf_sel != PHY_INTF_SEL_RMII) {
-			dev_dbg(dwmac->dev,
-				"imx dwmac doesn't support %s interface\n",
-				phy_modes(interface));
-			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
-		}
+	struct imx_priv_data *dwmac = bsp_priv;
 
-		ret = dwmac->ops->set_intf_mode(dwmac, phy_intf_sel);
-		if (ret)
-			return ret;
-	}
+	if (!dwmac->ops->set_intf_mode)
+		return 0;
 
-	return 0;
-}
+	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
+	    phy_intf_sel != PHY_INTF_SEL_RGMII &&
+	    phy_intf_sel != PHY_INTF_SEL_RMII)
+		return -EINVAL;
 
-static void imx_dwmac_exit(struct platform_device *pdev, void *priv)
-{
-	/* nothing to do now */
+	return dwmac->ops->set_intf_mode(dwmac, phy_intf_sel);
 }
 
 static int imx_dwmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
@@ -342,8 +325,7 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 		plat_dat->tx_queues_cfg[i].tbs_en = 1;
 
 	plat_dat->host_dma_width = dwmac->ops->addr_width;
-	plat_dat->init = imx_dwmac_init;
-	plat_dat->exit = imx_dwmac_exit;
+	plat_dat->set_phy_intf_sel = imx_set_phy_intf_sel;
 	plat_dat->clks_config = imx_dwmac_clks_config;
 	plat_dat->bsp_priv = dwmac;
 	dwmac->plat_dat = plat_dat;
-- 
2.47.3


