Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC22C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 15:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbXV7Jz6WVrITK8Rs8Q4HW4Bd6iCFtQ/awDMcDecl1w=; b=PGxI43jBZ37CQ9e2uChWyspv/U
	fmOoEtPbDeQWumrpXEKsdIh6cw4fmxG8uDli8HMt5Ee8CcvQboiZ3ITAe0uKixfNH5+pp6nITPcTY
	Qz4oFtE6KcjL0dHNPL3cSwlDd4cLsi4eU6c/SEOggcShHB3/8SqwFuEq6hHaD1GjmaBaNLyX6LNrI
	lzzC4a/2NN2y5nUJtSDxA4lcsfRxXfIYWi63CU0stDZyvVJcdRbds7yv4zUUmcsG5zt1PKsVrm5Su
	Gvto64qopjTteNWBhzBx1R27MOe8Ks9PTETXvb/jAXYQstqqG+clUo5aDTCOh8/WCBk0KgTLhuCrT
	ITrT3lvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4M9e-00000002hu4-0Aee;
	Mon, 14 Apr 2025 15:55:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4M62-00000002hOd-1cf6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 15:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bbXV7Jz6WVrITK8Rs8Q4HW4Bd6iCFtQ/awDMcDecl1w=; b=qhVjvgGHXjNDAvZ4HJXz0AbBNl
	RiHSjoIDbWdlCw2DVdJuC04xFJXIbLimHZTYMOp3IB1Acqtyl2KkqQPeT2uSyT10Rm/djAuowFmQ3
	peHZeVjM2K9bVfAQVmq/NFO7/9lAdYr5iEGgjgNYf4i9VOoeIkDDIVfOsV1tifk64oQIij1sbnH2d
	4XhoWlUlJ7hx86y4A0QUQM9WSKfhJtYEuLke63itNtl/mxQFggZ0Jiu0G2OqfNEpkxNrkZcn2WzuT
	Cm0A9riejTsK3Vg2+eqxL6AW/5ib6InnZfMZa6ECE/olhIrDVDUM0qZdSQTMFi7HX1uBJfd21TLRK
	YLZDWqOw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47054 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u4M5y-0006o9-1L;
	Mon, 14 Apr 2025 16:51:38 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u4M5N-000YGD-5i; Mon, 14 Apr 2025 16:51:01 +0100
In-Reply-To: <Z_0u9pA0Ziop-BuU@shell.armlinux.org.uk>
References: <Z_0u9pA0Ziop-BuU@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 1/2] net: stmmac: ingenic: convert to
 stmmac_pltfr_pm_ops
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u4M5N-000YGD-5i@rmk-PC.armlinux.org.uk>
Date: Mon, 14 Apr 2025 16:51:01 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_085142_427336_D8E928D0 
X-CRM114-Status: GOOD (  16.21  )
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

Convert the Ingenic glue driver to use the generic stmmac platform
power management operations.

In order to do this, we need to make ingenic_mac_init() arguments
compatible with plat_dat->init() by adding a plat_dat member to struct
ingenic_mac. This allows the custom suspend/resume operations to be
removed, and the PM ops pointer replaced with stmmac_pltfr_pm_ops.

This will adds runtime PM and noirq suspend/resume ops to this driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 41 ++++---------------
 1 file changed, 8 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index 066783d66422..607e467324a4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -56,6 +56,7 @@ enum ingenic_mac_version {
 
 struct ingenic_mac {
 	const struct ingenic_soc_info *soc_info;
+	struct plat_stmmacenet_data *plat_dat;
 	struct device *dev;
 	struct regmap *regmap;
 
@@ -70,13 +71,13 @@ struct ingenic_soc_info {
 	int (*set_mode)(struct plat_stmmacenet_data *plat_dat);
 };
 
-static int ingenic_mac_init(struct plat_stmmacenet_data *plat_dat)
+static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
 {
-	struct ingenic_mac *mac = plat_dat->bsp_priv;
+	struct ingenic_mac *mac = bsp_priv;
 	int ret;
 
 	if (mac->soc_info->set_mode) {
-		ret = mac->soc_info->set_mode(plat_dat);
+		ret = mac->soc_info->set_mode(mac->plat_dat);
 		if (ret)
 			return ret;
 	}
@@ -284,44 +285,18 @@ static int ingenic_mac_probe(struct platform_device *pdev)
 
 	mac->soc_info = data;
 	mac->dev = &pdev->dev;
+	mac->plat_dat = plat_dat;
 
 	plat_dat->bsp_priv = mac;
+	plat_dat->init = ingenic_mac_init;
 
-	ret = ingenic_mac_init(plat_dat);
+	ret = ingenic_mac_init(pdev, mac);
 	if (ret)
 		return ret;
 
 	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int ingenic_mac_suspend(struct device *dev)
-{
-	int ret;
-
-	ret = stmmac_suspend(dev);
-
-	return ret;
-}
-
-static int ingenic_mac_resume(struct device *dev)
-{
-	struct net_device *ndev = dev_get_drvdata(dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-	int ret;
-
-	ret = ingenic_mac_init(priv->plat);
-	if (ret)
-		return ret;
-
-	ret = stmmac_resume(dev);
-
-	return ret;
-}
-#endif /* CONFIG_PM_SLEEP */
-
-static SIMPLE_DEV_PM_OPS(ingenic_mac_pm_ops, ingenic_mac_suspend, ingenic_mac_resume);
-
 static struct ingenic_soc_info jz4775_soc_info = {
 	.version = ID_JZ4775,
 	.mask = MACPHYC_TXCLK_SEL_MASK | MACPHYC_SOFT_RST_MASK | MACPHYC_PHY_INFT_MASK,
@@ -373,7 +348,7 @@ static struct platform_driver ingenic_mac_driver = {
 	.remove		= stmmac_pltfr_remove,
 	.driver		= {
 		.name	= "ingenic-mac",
-		.pm		= pm_ptr(&ingenic_mac_pm_ops),
+		.pm		= &stmmac_pltfr_pm_ops,
 		.of_match_table = ingenic_mac_of_matches,
 	},
 };
-- 
2.30.2


