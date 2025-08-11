Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8A8CA0EDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59Pd3FU0tcgcZ3oC56LVLpviVCaL5pk/DSBzMzvKgwE=; b=bu41onxVVmI9QuSnKUuWvsi/4T
	0sMRDJTbahfLJ48IxwD1po87mdHZGbDVX6XCRGytFegsWYbi3wZr1AkiYPahqcAM46wGHp6ZA5DyM
	HP/vFUQ1YuhAuS2jAKXGIAKwtM0JKzOrksNQvnTsFx+8CztAxy1ufNLQWqiOTjgYv39YgGOEqDQ8d
	2u1g5wXgpZ+dmYBbQ+ikuUakDCroGbU5VSeA6VraOlARwLdqAOTa4h2Ot6eh/6NWiz7Cnv5JBus+Q
	Zo+kON+HbqTdJ8DGden9PSoIfs74Yt2JGUtZPtWiUXm6+9BxjeEzTCg/WVOhU3061poL4mpdIjmyB
	PeBMkMSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulacs-00000009CyZ-49Ay;
	Mon, 11 Aug 2025 22:04:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXd3-00000008qJh-0R0r;
	Mon, 11 Aug 2025 18:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=59Pd3FU0tcgcZ3oC56LVLpviVCaL5pk/DSBzMzvKgwE=; b=yXD4KX0j8xo623pGxJVTZTRYHu
	25/rTAlri/YlutoT09fF6Owx1hT5gqnP4Mb6y9rVyJdpin0pKKG0JXFsVDzVe04qJuINH1vBr6Ofv
	vmv2lIMrqXIwXhQ0Zr3lYGxBzYm/Z6m1aUvOxGIwULnxN8zBHi4pjIWRahP9B9e0hlxGVeOMatIYj
	9YXhozyeVcbM925UT8YwwpBfou0buxSKEsP3ak4+gxArONBuLOc9Q3LZAxRAk/EF29fYlxbWP8GGW
	Y395LXE1XkSH7ARA9jjfkLiNGdfu2gytHu2cazkre7nytNssV+Waco/tBHOScMoDAhE+a2iWdojcp
	ZnzpaOhg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38374 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1ulXcs-0003cJ-1I;
	Mon, 11 Aug 2025 19:52:06 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1ulXc7-008grH-Dh; Mon, 11 Aug 2025 19:51:19 +0100
In-Reply-To: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
References: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 8/9] net: stmmac: stm32: convert to
 suspend()/resume() methods
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1ulXc7-008grH-Dh@rmk-PC.armlinux.org.uk>
Date: Mon, 11 Aug 2025 19:51:19 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_115217_145425_A1FDA46C 
X-CRM114-Status: GOOD (  14.29  )
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

Convert stm32 to use the new suspend() and resume() methods rather
than implementing these in custom wrappers around the main driver's
suspend/resume methods. This allows this driver to use the stmmac
simple PM ops structure.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 68 +++++++------------
 1 file changed, 23 insertions(+), 45 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 1eb16eec9c0d..77a04c4579c9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -498,6 +498,26 @@ static int stm32mp1_parse_data(struct stm32_dwmac *dwmac,
 	return err;
 }
 
+static int stm32_dwmac_suspend(struct device *dev, void *bsp_priv)
+{
+	struct stm32_dwmac *dwmac = bsp_priv;
+
+	stm32_dwmac_clk_disable(dwmac);
+
+	return dwmac->ops->suspend ? dwmac->ops->suspend(dwmac) : 0;
+}
+
+static int stm32_dwmac_resume(struct device *dev, void *bsp_priv)
+{
+	struct stmmac_priv *priv = netdev_priv(dev_get_drvdata(dev));
+	struct stm32_dwmac *dwmac = bsp_priv;
+
+	if (dwmac->ops->resume)
+		dwmac->ops->resume(dwmac);
+
+	return stm32_dwmac_init(priv->plat);
+}
+
 static int stm32_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -535,6 +555,8 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
 
 	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP;
 	plat_dat->bsp_priv = dwmac;
+	plat_dat->suspend = stm32_dwmac_suspend;
+	plat_dat->resume = stm32_dwmac_resume;
 
 	ret = stm32_dwmac_init(plat_dat);
 	if (ret)
@@ -600,50 +622,6 @@ static void stm32mp1_resume(struct stm32_dwmac *dwmac)
 	clk_disable_unprepare(dwmac->clk_ethstp);
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int stm32_dwmac_suspend(struct device *dev)
-{
-	struct net_device *ndev = dev_get_drvdata(dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-	struct stm32_dwmac *dwmac = priv->plat->bsp_priv;
-
-	int ret;
-
-	ret = stmmac_suspend(dev);
-	if (ret)
-		return ret;
-
-	stm32_dwmac_clk_disable(dwmac);
-
-	if (dwmac->ops->suspend)
-		ret = dwmac->ops->suspend(dwmac);
-
-	return ret;
-}
-
-static int stm32_dwmac_resume(struct device *dev)
-{
-	struct net_device *ndev = dev_get_drvdata(dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-	struct stm32_dwmac *dwmac = priv->plat->bsp_priv;
-	int ret;
-
-	if (dwmac->ops->resume)
-		dwmac->ops->resume(dwmac);
-
-	ret = stm32_dwmac_init(priv->plat);
-	if (ret)
-		return ret;
-
-	ret = stmmac_resume(dev);
-
-	return ret;
-}
-#endif /* CONFIG_PM_SLEEP */
-
-static SIMPLE_DEV_PM_OPS(stm32_dwmac_pm_ops,
-	stm32_dwmac_suspend, stm32_dwmac_resume);
-
 static struct stm32_ops stm32mcu_dwmac_data = {
 	.set_mode = stm32mcu_set_mode
 };
@@ -691,7 +669,7 @@ static struct platform_driver stm32_dwmac_driver = {
 	.remove = stm32_dwmac_remove,
 	.driver = {
 		.name           = "stm32-dwmac",
-		.pm		= &stm32_dwmac_pm_ops,
+		.pm		= &stmmac_simple_pm_ops,
 		.of_match_table = stm32_dwmac_match,
 	},
 };
-- 
2.30.2


