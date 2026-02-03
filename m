Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70DBE83073
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 10:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ls29wbQ7VPdzPLzxKpjgX8/RiU9+lNvgMaytuQRwg6A=; b=3x3ur3kBSeTGWLjqRdLv82g2SR
	PThKewyI96lCI8FokRauwRFBtJSoXBn/R2lPhXPuof2JTGpeVeKTcmgJTTYvsA2MQomSp2/vpY1mz
	ZzisKgo3Mw3HxAYgxJH5Hzlu6ozG/x+LAtkta54IR9xntBmxxRrjaRwtO0Xt2rnrryfMob6kt9lvW
	FuOHCPzomLLWypFaRPwE/PR6lg4BJRVvq9NoTcobekE1aij/2XytuTBzV216KHqOnlnHWAiF8JP1I
	3ohHI3yTIcBhPpT85bOilD9jmsm6m5Z3dTohMfe1vwixn7hyETV+yhmeQHf05nFIHSNzEcdM8b+lW
	81whVAqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDDm-00000006QxN-2kOk;
	Tue, 03 Feb 2026 10:01:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDDj-00000006Qvn-2Qdh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 10:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ls29wbQ7VPdzPLzxKpjgX8/RiU9+lNvgMaytuQRwg6A=; b=0e5Gwl4s2DBJlcfOBkwbY++/wF
	SlJZ8xNNIb8SJ1YVwAdDmjChi2bjVLTt03X9Q2098jhdRqootwDiYOKNSNmNdGEA/anaFDRSPBbNN
	pyqdY2xCNX0W4vucrDiBL406bR/o/geYQ0w/uLxH88I8rJ+HRLTd+hbu564nhLB3Rj5Ej1ROkPh0M
	B5XEVjOw0HecDOGvhK2/c0h1RpbNSNM/3Wb8Y3crl9jFEq8i3Nd1qNTvmCCguGJzaGY9D67nAR7W1
	5D+YHfTPowJRnauDAtS2ewHRjVCLhzeQ7gxTFEBWy+TtCOs7k1mGa0FTjA5kWZSo2yk4RixhuTpu/
	RO+YrQdQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38924 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vnDDf-000000004wh-1G8a;
	Tue, 03 Feb 2026 10:01:15 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vnDDe-00000007Xww-2VUU;
	Tue, 03 Feb 2026 10:01:14 +0000
In-Reply-To: <aYHHWm5UkD1JVa7D@shell.armlinux.org.uk>
References: <aYHHWm5UkD1JVa7D@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 1/4] net: stmmac: add wrappers for
 serdes_power[up|down]() methods
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vnDDe-00000007Xww-2VUU@rmk-PC.armlinux.org.uk>
Date: Tue, 03 Feb 2026 10:01:14 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_020119_638481_DBCF87B0 
X-CRM114-Status: GOOD (  14.36  )
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

Add wrappers for the serdes_power[up|down]() methods and update all
call sites. This will allow us to add state tracking.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 48 +++++++++++--------
 1 file changed, 29 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9500b332a152..93d18709bc13 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -882,6 +882,26 @@ static void stmmac_release_ptp(struct stmmac_priv *priv)
 	clk_disable_unprepare(priv->plat->clk_ptp_ref);
 }
 
+static void stmmac_legacy_serdes_power_down(struct stmmac_priv *priv)
+{
+	if (priv->plat->serdes_powerdown)
+		priv->plat->serdes_powerdown(priv->dev, priv->plat->bsp_priv);
+}
+
+static int stmmac_legacy_serdes_power_up(struct stmmac_priv *priv)
+{
+	int ret;
+
+	if (!priv->plat->serdes_powerup)
+		return 0;
+
+	ret = priv->plat->serdes_powerup(priv->dev, priv->plat->bsp_priv);
+	if (ret < 0)
+		netdev_err(priv->dev, "SerDes powerup failed\n");
+
+	return ret;
+}
+
 /**
  *  stmmac_mac_flow_ctrl - Configure flow control in all queues
  *  @priv: driver private structure
@@ -981,9 +1001,8 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 	u32 old_ctrl, ctrl;
 	int ret;
 
-	if ((priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP) &&
-	    priv->plat->serdes_powerup)
-		priv->plat->serdes_powerup(priv->dev, priv->plat->bsp_priv);
+	if (priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP)
+		stmmac_legacy_serdes_power_up(priv);
 
 	old_ctrl = readl(priv->ioaddr + MAC_CTRL_REG);
 	ctrl = old_ctrl & ~priv->hw->link.speed_mask;
@@ -4111,14 +4130,10 @@ static int __stmmac_open(struct net_device *dev,
 
 	stmmac_reset_queues_param(priv);
 
-	if (!(priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP) &&
-	    priv->plat->serdes_powerup) {
-		ret = priv->plat->serdes_powerup(dev, priv->plat->bsp_priv);
-		if (ret < 0) {
-			netdev_err(priv->dev, "%s: Serdes powerup failed\n",
-				   __func__);
+	if (!(priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP)) {
+		ret = stmmac_legacy_serdes_power_up(priv);
+		if (ret < 0)
 			goto init_error;
-		}
 	}
 
 	ret = stmmac_hw_setup(dev);
@@ -4222,8 +4237,7 @@ static void __stmmac_release(struct net_device *dev)
 	free_dma_desc_resources(priv, &priv->dma_conf);
 
 	/* Powerdown Serdes if there is */
-	if (priv->plat->serdes_powerdown)
-		priv->plat->serdes_powerdown(dev, priv->plat->bsp_priv);
+	stmmac_legacy_serdes_power_down(priv);
 
 	stmmac_release_ptp(priv);
 
@@ -8130,8 +8144,7 @@ int stmmac_suspend(struct device *dev)
 	/* Stop TX/RX DMA */
 	stmmac_stop_all_dma(priv);
 
-	if (priv->plat->serdes_powerdown)
-		priv->plat->serdes_powerdown(ndev, priv->plat->bsp_priv);
+	stmmac_legacy_serdes_power_down(priv);
 
 	/* Enable Power down mode by programming the PMT regs */
 	if (priv->wolopts) {
@@ -8233,11 +8246,8 @@ int stmmac_resume(struct device *dev)
 			stmmac_mdio_reset(priv->mii);
 	}
 
-	if (!(priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP) &&
-	    priv->plat->serdes_powerup) {
-		ret = priv->plat->serdes_powerup(ndev,
-						 priv->plat->bsp_priv);
-
+	if (!(priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP)) {
+		ret = stmmac_legacy_serdes_power_up(priv);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.47.3


