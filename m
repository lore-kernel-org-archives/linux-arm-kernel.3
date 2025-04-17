Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A14C369CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 17:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jQ2RDmpRxd/UlVEMitc8xfzDNE1izM57yeWpzmYqHf0=; b=FTCSVkkSdYuOY7BQGeymCcC3wC
	+iF9mhbPt+N9ZYRhpEWCcMa52N9jSm9YMIX21bW2HILrHcPg18BtU4cIq9W/9qYhJjyizn0p0sxbm
	wKTbVxfqbpmcWhKqNpaFn4P8wjnkfyGpyxeIoKNe/r5c23UKtQZv2wCmkSbalaX6bHgr1yRey9+6L
	oQLUM/FWfqlFvxVmvqjjpMXIjS1pZLk+GU/8gUXSv0TkjgRF8O3m9MIuHVLXSZDW9q4Ksph83IOyi
	v+2jAZQbRfRtebj10GttzQ26uuomuHOwXzascoSXANiQYwUjFKG+B8ROp93wYvtej6qvRE6ln1dIy
	7Qi/+exw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Sz2-0000000Dpzx-3Nfh;
	Thu, 17 Apr 2025 17:25:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SlA-0000000DmVb-1cPM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 17:10:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jQ2RDmpRxd/UlVEMitc8xfzDNE1izM57yeWpzmYqHf0=; b=Xx2JT3sPcKmxheT8VmOoRFY0SO
	Z20onmT3xxDpfbYCjpMPkf6I7+S0PwdHWvboVfy+XgngP5vhKa7vq0BSA3ancFH6pWYmdNHP/+4Q9
	eeTrddHNbC3o0eve5YljD8/Bd/ENrap542p4YdFB8OTinui5zGS47GHuPc0NRqmL3WB9z8HAsJ4US
	G2DAoCAtABZ9Bb/7SVqTJIQnpazW64hslK9ng+NRCiosql4AzxfZ9/aStOVvVMgLBVG0+tiZNtT6s
	aitgKGsq1izatjB5N1pLzOpnTYskaA4Wxif8wROjXzB4+YcJJce6XlQckF1TDQaYRv2Hjv1w69duS
	WiL5crxw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52332 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u5Sj2-0007fW-1E;
	Thu, 17 Apr 2025 18:08:32 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u5SiQ-001I0B-OQ; Thu, 17 Apr 2025 18:07:54 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v3] net: stmmac: visconti: convert to
 set_clk_tx_rate() method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u5SiQ-001I0B-OQ@rmk-PC.armlinux.org.uk>
Date: Thu, 17 Apr 2025 18:07:54 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_101044_416850_93385313 
X-CRM114-Status: GOOD (  14.85  )
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

Convert visconti to use the set_clk_tx_rate() method. By doing so,
the GMAC control register will already have been updated (unlike with
the fix_mac_speed() method) so this code can be removed while porting
to the set_clk_tx_rate() method.

There is also no need for the spinlock, and has never been - neither
fix_mac_speed() nor set_clk_tx_rate() can be called by more than one
thread at a time, so the lock does nothing useful.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Acked-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-visconti.c  | 25 +++++--------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
index 33cf99797df5..5e6ac82a89b9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
@@ -51,21 +51,14 @@ struct visconti_eth {
 	u32 phy_intf_sel;
 	struct clk *phy_ref_clk;
 	struct device *dev;
-	spinlock_t lock; /* lock to protect register update */
 };
 
-static void visconti_eth_fix_mac_speed(void *priv, int speed, unsigned int mode)
+static int visconti_eth_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
+					phy_interface_t interface, int speed)
 {
-	struct visconti_eth *dwmac = priv;
+	struct visconti_eth *dwmac = bsp_priv;
 	struct net_device *netdev = dev_get_drvdata(dwmac->dev);
 	unsigned int val, clk_sel_val = 0;
-	unsigned long flags;
-
-	spin_lock_irqsave(&dwmac->lock, flags);
-
-	/* adjust link */
-	val = readl(dwmac->reg + MAC_CTRL_REG);
-	val &= ~(GMAC_CONFIG_PS | GMAC_CONFIG_FES);
 
 	switch (speed) {
 	case SPEED_1000:
@@ -77,24 +70,19 @@ static void visconti_eth_fix_mac_speed(void *priv, int speed, unsigned int mode)
 			clk_sel_val = ETHER_CLK_SEL_FREQ_SEL_25M;
 		if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RMII)
 			clk_sel_val = ETHER_CLK_SEL_DIV_SEL_2;
-		val |= GMAC_CONFIG_PS | GMAC_CONFIG_FES;
 		break;
 	case SPEED_10:
 		if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RGMII)
 			clk_sel_val = ETHER_CLK_SEL_FREQ_SEL_2P5M;
 		if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RMII)
 			clk_sel_val = ETHER_CLK_SEL_DIV_SEL_20;
-		val |= GMAC_CONFIG_PS;
 		break;
 	default:
 		/* No bit control */
 		netdev_err(netdev, "Unsupported speed request (%d)", speed);
-		spin_unlock_irqrestore(&dwmac->lock, flags);
-		return;
+		return -EINVAL;
 	}
 
-	writel(val, dwmac->reg + MAC_CTRL_REG);
-
 	/* Stop internal clock */
 	val = readl(dwmac->reg + REG_ETHER_CLOCK_SEL);
 	val &= ~(ETHER_CLK_SEL_RMII_CLK_EN | ETHER_CLK_SEL_RX_TX_CLK_EN);
@@ -136,7 +124,7 @@ static void visconti_eth_fix_mac_speed(void *priv, int speed, unsigned int mode)
 		break;
 	}
 
-	spin_unlock_irqrestore(&dwmac->lock, flags);
+	return 0;
 }
 
 static int visconti_eth_init_hw(struct platform_device *pdev, struct plat_stmmacenet_data *plat_dat)
@@ -228,11 +216,10 @@ static int visconti_eth_dwmac_probe(struct platform_device *pdev)
 	if (!dwmac)
 		return -ENOMEM;
 
-	spin_lock_init(&dwmac->lock);
 	dwmac->reg = stmmac_res.addr;
 	dwmac->dev = &pdev->dev;
 	plat_dat->bsp_priv = dwmac;
-	plat_dat->fix_mac_speed = visconti_eth_fix_mac_speed;
+	plat_dat->set_clk_tx_rate = visconti_eth_set_clk_tx_rate;
 
 	ret = visconti_eth_clock_probe(pdev, plat_dat);
 	if (ret)
-- 
2.30.2


