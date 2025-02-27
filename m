Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427D8C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 09:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85VgIqhBATiy0aavPuYyQryWEVxMpvOYtGXBoWcV9P0=; b=Q2x9W1V8kYtGVKRwgxruz+Gjdp
	2JLcvwUvH1YshKirkOBd9XjtAGeOJ/aGlbWSwe9PcX4pu1wK7XDFJ4cWNAKFuhJskF4o4UMV0t0oz
	Sby53f27VCnwg0vpjxScuiEUtTWR5JqprGnCEZV2SQ5LjFQIO+uOc0TWHw4yNIoGhMKqQMMTj+sZJ
	mzPQkjRdJ5HKulFED/fpnhnIB3cyNim+zYmtKLO4+E+cxoRQx0/Y+NR2A52dEXjp5PbWDVPPhurPH
	5ZA5tDIv/Bj3yJCv/VF6l7LlVhaBjQwxps9LE8iydB1C4lzpRgIKmmOmYdkexIgl2QqaaGb4NuX0c
	k04Gg0Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaIi-00000006sdW-3t0a;
	Thu, 27 Feb 2025 09:35:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tna2c-00000006pcd-1qfd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 09:18:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=85VgIqhBATiy0aavPuYyQryWEVxMpvOYtGXBoWcV9P0=; b=UdCEG4Utz2Bq+l0roktewsEruR
	q4XSHgKawZ3ddVXyAP5T9aBO9BwkenUH8I8mxH5vXUFniJSLslWDRlZ9sr0ja9HII1LDX/m3OVUem
	nVd7B7Sb/ywC95kA/MI8wi3TtGDaSTOurQ1djMxcOqoKfebeCjpit1J4d5yOwX2DB//GslQ2m+BkX
	XtE2K0ONJVXV8iYN2Cwnw2JtYJa+hzVDGfzYvuUBm95V364L+TjPnxTKdCwvd0Cj/YOz+TdmsMzOY
	m4qN0tPp/MVrZ9ZNLl2b0z7n1y/CG38TBfcmnWCvh1JOHuI7kFoOOHUbgqGULjumqqS1gwY7UVzcP
	rHp9CIBQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36296 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tna0Z-0006bW-2F;
	Thu, 27 Feb 2025 09:16:43 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tna0F-0052sS-Lr; Thu, 27 Feb 2025 09:16:23 +0000
In-Reply-To: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
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
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 01/11] net: stmmac: provide set_clk_tx_rate() hook
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tna0F-0052sS-Lr@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2025 09:16:23 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_011850_471724_2A133D6F 
X-CRM114-Status: GOOD (  15.05  )
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

Several stmmac sub-drivers which support RGMII follow the same pattern.
They calculate the transmit clock rate, and then call clk_set_rate().

Analysis of several implementation documents suggests that the platform
is responsible for providing the transmit clock to the DWMAC core's
clk_tx_i. The expected rates are:

	10Mbps	100Mbps	1Gbps
MII	2.5MHz	25MHz
RMII	2.5MHz	25MHz
GMII			125MHz
RGMI	2.5MHz	25MHz	125MHz

It seems some platforms require this clock to be manually configured,
but there are outputs from the MAC core that indicate the speed, so a
platform may use these to automatically configure the clock. Thus, we
can't just provide one solution to configure this clock rate.

Moreover, the clock may need to be derived from one of several sources
depending on the interface mode.

Provide a platform hook that is passed the transmit clock, interface
mode and speed.

Reviewed-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++++++
 include/linux/stmmac.h                            |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 424fa2fe31c6..e66cd6889728 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -928,6 +928,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
 	unsigned int flow_ctrl;
 	u32 old_ctrl, ctrl;
+	int ret;
 
 	if ((priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP) &&
 	    priv->plat->serdes_powerup)
@@ -1020,6 +1021,16 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 	if (ctrl != old_ctrl)
 		writel(ctrl, priv->ioaddr + MAC_CTRL_REG);
 
+	if (priv->plat->set_clk_tx_rate) {
+		ret = priv->plat->set_clk_tx_rate(priv->plat->bsp_priv,
+						priv->plat->clk_tx_i,
+						interface, speed);
+		if (ret < 0)
+			netdev_err(priv->dev,
+				   "failed to configure transmit clock for %dMbps: %pe\n",
+				   speed, ERR_PTR(ret));
+	}
+
 	stmmac_mac_set(priv, priv->ioaddr, true);
 	if (priv->dma_cap.eee)
 		stmmac_set_eee_pls(priv, priv->hw, true);
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 6d2aa77ea963..cd0d1383df87 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -78,6 +78,7 @@
 			| DMA_AXI_BLEN_32 | DMA_AXI_BLEN_64 \
 			| DMA_AXI_BLEN_128 | DMA_AXI_BLEN_256)
 
+struct clk;
 struct stmmac_priv;
 
 /* Platfrom data for platform device structure's platform_data field */
@@ -231,6 +232,8 @@ struct plat_stmmacenet_data {
 	u8 tx_sched_algorithm;
 	struct stmmac_rxq_cfg rx_queues_cfg[MTL_MAX_RX_QUEUES];
 	struct stmmac_txq_cfg tx_queues_cfg[MTL_MAX_TX_QUEUES];
+	int (*set_clk_tx_rate)(void *priv, struct clk *clk_tx_i,
+			       phy_interface_t interface, int speed);
 	void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
 	int (*fix_soc_reset)(void *priv, void __iomem *ioaddr);
 	int (*serdes_powerup)(struct net_device *ndev, void *priv);
@@ -252,6 +255,7 @@ struct plat_stmmacenet_data {
 	struct clk *stmmac_clk;
 	struct clk *pclk;
 	struct clk *clk_ptp_ref;
+	struct clk *clk_tx_i;		/* clk_tx_i to MAC core */
 	unsigned long clk_ptp_rate;
 	unsigned long clk_ref_rate;
 	struct clk_bulk_data *clks;
-- 
2.30.2


