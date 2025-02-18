Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED7EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 11:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZH1bVksmCx0plQEMgCUt60mErOEDPQEJF+dciIer4w=; b=hFNK1UjGFw7xReD6LP+N/Rw/sS
	x8QEG8vh66NwXbLGBCgQaUGDJM91JyeoA+RsATEpjXeEn697anp0MjDLFcXPgt6qO4vPIOj2qJ8CE
	D1ddznmd1t7eO/lfijz2f3XZnKQaqB/8IXurQlXIg90sj/uNKDXhONQzN/a6JiLLT6yCNypf7PxqW
	g7QhoUlYptj1ZYkddnK13+olfdd2LccTJCD76ijmlYoHYN2Hv26gBuIRVcGiVfeB3LAjaZS9iHEFv
	6qgfFFkH4+t+LaHen58ShG0lUQ+pw7QIs676bOgds39pXatUWC6LfxiATV6MrsJ1WoEoJy37ZypAC
	lScI9ZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLbw-00000007v1L-3BeF;
	Tue, 18 Feb 2025 11:17:56 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLZG-00000007uA2-2EHp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5ZH1bVksmCx0plQEMgCUt60mErOEDPQEJF+dciIer4w=; b=mMsS565BSOMEGYOhTy8coteI7H
	zXwIWtFNm0MvmcZVzpD+jAe66mi/w59zeijL3/EsJbdlgdMYcPursaxV9e7LdvSyw0zEzxds6x41U
	fv0HweRrjDM0J0PPQnApZCK7F4cppq6OFlsB4RxDE2tpqouFWlVPj+9ZmcSoBFWS9YNj1m2A6owR6
	fWNAUzsdHlyHJvq8YOXdQ4vuEK2DkTb3fG6+cgDaFedYNLg4+VT1y/fEi0hPZUxz330WkFmSavAHp
	1Xy6nP+2w3jlQ8xBM3mqpliVx6JqIKVxpwvX7DC2EbCzMfob2ROcsQySWxq1Y+xWOrby97FZX52JL
	KVnlHfkw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51354 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tkLZ5-0001hg-1A;
	Tue, 18 Feb 2025 11:14:59 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tkLYl-004RYv-Gz; Tue, 18 Feb 2025 11:14:39 +0000
In-Reply-To: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	Inochi Amaoto <inochiama@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH RFC net-next 1/7] net: stmmac: provide generic transmit clock
 configuration hook
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tkLYl-004RYv-Gz@rmk-PC.armlinux.org.uk>
Date: Tue, 18 Feb 2025 11:14:39 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_031510_568951_F7FD21F6 
X-CRM114-Status: GOOD (  15.87  )
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
They calculate the transmit clock, and then call the clk API to set a
clock to that rate.

Analysis of documentation suggests that the platform is responsible for
providing the transmit clock to the DWMAC core (clk_tx_i). The expected
rates are:

	10Mbps	100Mbps	1Gbps
MII	2.5MHz	25MHz
GMII			125MHz
RGMI	2.5MHz	25MHz	125MHz
RMII	2.5MHz	25MHz

It seems some platforms require this clock to be manually configured,
but there are outputs from the MAC core that indicate the speed, so a
platform may use these to automatically configure the clock. Thus, we
can't just provide one solution to configuring the clock.

Moreover, the clock may need to be derived from one of several sources
depending on the interface mode.

Provide a platform hook that is passed the interface mode, speed, and
transmit clock.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++++++
 include/linux/stmmac.h                            |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4d542f482ecb..f7ff94a09da2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -928,6 +928,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
 	unsigned int flow_ctrl;
 	u32 old_ctrl, ctrl;
+	int ret;
 
 	if ((priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP) &&
 	    priv->plat->serdes_powerup)
@@ -1000,6 +1001,16 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 	if (priv->plat->fix_mac_speed)
 		priv->plat->fix_mac_speed(priv->plat->bsp_priv, speed, mode);
 
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
 	if (!duplex)
 		ctrl &= ~priv->hw->link.duplex;
 	else
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


