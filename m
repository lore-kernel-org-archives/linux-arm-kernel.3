Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A023EC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 00:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSPJIQb7zZXYaxjVPnZA2dEJZu7SMOpHsNQQVyaAN70=; b=1jJch3KikhA3WUOv6zFQdUwSyl
	29Hn+MboyGcUJOJ27I/q8nPgMVIebfRJcoAxgnHH4z3GILE4LQGZGvvh/o8Z8SbONAjuy7UnHnfGU
	S/ja2zy1jIlorjvkzzQ5H+WUqxfMUGrsknvu/0cDSreDbaxWuaH301ThWjr5FmCjcpXZdnAZF9LTP
	dgoIU/Oj/27CefScmlYkrMStTVBy6SoJYsx5F9QkxnQTDN7ENoP5lUkBcQKw5rvotyTitUVJagsv1
	uE+lch7o6fCMYbLydhVymff6b06LoDnZlbZ8sZtSGzZzvSp4rmpq4uWsF4/shRkP1krSjr7UIVzyu
	D6en4pyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubpkC-00000006SGn-20oa;
	Wed, 16 Jul 2025 00:11:32 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubpae-00000006RDr-2npr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 00:01:41 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752624098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aSPJIQb7zZXYaxjVPnZA2dEJZu7SMOpHsNQQVyaAN70=;
	b=gXJFCa7AKfGi9aAZ1fJlrVQl8e8dlfMkQ926d3oyDKFqN3LQznfY+iwmBmMo7bUomtHNwI
	swwiCFYq39XPV0wXe44C1O5u0vvneVnkO6CK9m+6htRYq++/f0G9v3kuYIWi8pu8R5XRv+
	BfUZTaYQmCIfOTxGqLVc92q1MKYIaFA=
From: Sean Anderson <sean.anderson@linux.dev>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,
	Saravana Kannan <saravanak@google.com>,
	Leon Romanovsky <leon@kernel.org>,
	linux-kernel@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Ira Weiny <ira.weiny@intel.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH net v2 3/4] net: axienet: Rearrange lifetime functions
Date: Tue, 15 Jul 2025 20:01:09 -0400
Message-Id: <20250716000110.2267189-4-sean.anderson@linux.dev>
In-Reply-To: <20250716000110.2267189-1-sean.anderson@linux.dev>
References: <20250716000110.2267189-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_170140_853007_AD2549C1 
X-CRM114-Status: GOOD (  15.63  )
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

Rearrange the lifetime functions (probe, remove, etc.) in preparation
for the next commit. No functional change intended.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

(no changes since v1)

 .../net/ethernet/xilinx/xilinx_axienet_main.c | 252 +++++++++---------
 1 file changed, 133 insertions(+), 119 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 1f277e5e4a62..c2512c04a88f 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2749,6 +2749,134 @@ static void axienet_disable_misc(void *clocks)
 	clk_bulk_disable_unprepare(XAE_NUM_MISC_CLOCKS, clocks);
 }
 
+static int axienet_mac_probe(struct axienet_local *lp)
+{
+	struct net_device *ndev = lp->ndev;
+	struct device_node *np;
+	int ret;
+
+	SET_NETDEV_DEV(ndev, lp->dev);
+	if (lp->phy_mode == PHY_INTERFACE_MODE_SGMII ||
+	    lp->phy_mode == PHY_INTERFACE_MODE_1000BASEX) {
+		np = of_parse_phandle(lp->dev->of_node, "pcs-handle", 0);
+		if (!np) {
+			/* Deprecated: Always use "pcs-handle" for pcs_phy.
+			 * Falling back to "phy-handle" here is only for
+			 * backward compatibility with old device trees.
+			 */
+			np = of_parse_phandle(lp->dev->of_node, "phy-handle", 0);
+		}
+		if (!np) {
+			dev_err(lp->dev,
+				"pcs-handle (preferred) or phy-handle required for 1000BaseX/SGMII\n");
+			return -EINVAL;
+		}
+		lp->pcs_phy = of_mdio_find_device(np);
+		of_node_put(np);
+		if (!lp->pcs_phy)
+			return -EPROBE_DEFER;
+		lp->pcs.ops = &axienet_pcs_ops;
+		lp->pcs.poll = true;
+	}
+
+	lp->phylink_config.dev = &ndev->dev;
+	lp->phylink_config.type = PHYLINK_NETDEV;
+	lp->phylink_config.mac_managed_pm = true;
+	lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE |
+		MAC_10FD | MAC_100FD | MAC_1000FD;
+
+	__set_bit(lp->phy_mode, lp->phylink_config.supported_interfaces);
+	if (lp->switch_x_sgmii) {
+		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
+			  lp->phylink_config.supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_SGMII,
+			  lp->phylink_config.supported_interfaces);
+	}
+
+	lp->phylink = phylink_create(&lp->phylink_config, lp->dev->fwnode,
+				     lp->phy_mode,
+				     &axienet_phylink_ops);
+	if (IS_ERR(lp->phylink)) {
+		ret = PTR_ERR(lp->phylink);
+		dev_err(lp->dev, "phylink_create error (%i)\n", ret);
+		goto cleanup_pcs;
+	}
+
+	ret = register_netdev(ndev);
+	if (ret) {
+		dev_err(lp->dev, "register_netdev() error (%i)\n", ret);
+		goto cleanup_phylink;
+	}
+
+	return 0;
+
+cleanup_phylink:
+	phylink_destroy(lp->phylink);
+cleanup_pcs:
+	if (lp->pcs_phy)
+		put_device(&lp->pcs_phy->dev);
+	return ret;
+}
+
+static void axienet_mac_remove(struct platform_device *pdev)
+{
+	struct net_device *ndev = platform_get_drvdata(pdev);
+	struct axienet_local *lp = netdev_priv(ndev);
+
+	unregister_netdev(ndev);
+	phylink_destroy(lp->phylink);
+	if (lp->pcs_phy)
+		put_device(&lp->pcs_phy->dev);
+}
+
+static void axienet_mac_shutdown(struct platform_device *pdev)
+{
+	struct net_device *ndev = platform_get_drvdata(pdev);
+
+	rtnl_lock();
+	netif_device_detach(ndev);
+
+	if (netif_running(ndev))
+		dev_close(ndev);
+
+	rtnl_unlock();
+}
+
+static int axienet_suspend(struct device *dev)
+{
+	struct net_device *ndev = dev_get_drvdata(dev);
+
+	if (!netif_running(ndev))
+		return 0;
+
+	netif_device_detach(ndev);
+
+	rtnl_lock();
+	axienet_stop(ndev);
+	rtnl_unlock();
+
+	return 0;
+}
+
+static int axienet_resume(struct device *dev)
+{
+	struct net_device *ndev = dev_get_drvdata(dev);
+
+	if (!netif_running(ndev))
+		return 0;
+
+	rtnl_lock();
+	axienet_open(ndev);
+	rtnl_unlock();
+
+	netif_device_attach(ndev);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(axienet_pm_ops,
+				axienet_suspend, axienet_resume);
+
 /**
  * axienet_probe - Axi Ethernet probe function.
  * @pdev:	Pointer to platform device structure.
@@ -3051,69 +3179,10 @@ static int axienet_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev,
 			 "error registering MDIO bus: %d\n", ret);
 
-	if (lp->phy_mode == PHY_INTERFACE_MODE_SGMII ||
-	    lp->phy_mode == PHY_INTERFACE_MODE_1000BASEX) {
-		np = of_parse_phandle(pdev->dev.of_node, "pcs-handle", 0);
-		if (!np) {
-			/* Deprecated: Always use "pcs-handle" for pcs_phy.
-			 * Falling back to "phy-handle" here is only for
-			 * backward compatibility with old device trees.
-			 */
-			np = of_parse_phandle(pdev->dev.of_node, "phy-handle", 0);
-		}
-		if (!np) {
-			dev_err(&pdev->dev, "pcs-handle (preferred) or phy-handle required for 1000BaseX/SGMII\n");
-			ret = -EINVAL;
-			goto cleanup_mdio;
-		}
-		lp->pcs_phy = of_mdio_find_device(np);
-		if (!lp->pcs_phy) {
-			ret = -EPROBE_DEFER;
-			of_node_put(np);
-			goto cleanup_mdio;
-		}
-		of_node_put(np);
-		lp->pcs.ops = &axienet_pcs_ops;
-		lp->pcs.poll = true;
-	}
+	ret = axienet_mac_probe(lp);
+	if (!ret)
+		return 0;
 
-	lp->phylink_config.dev = &ndev->dev;
-	lp->phylink_config.type = PHYLINK_NETDEV;
-	lp->phylink_config.mac_managed_pm = true;
-	lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE |
-		MAC_10FD | MAC_100FD | MAC_1000FD;
-
-	__set_bit(lp->phy_mode, lp->phylink_config.supported_interfaces);
-	if (lp->switch_x_sgmii) {
-		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
-			  lp->phylink_config.supported_interfaces);
-		__set_bit(PHY_INTERFACE_MODE_SGMII,
-			  lp->phylink_config.supported_interfaces);
-	}
-
-	lp->phylink = phylink_create(&lp->phylink_config, pdev->dev.fwnode,
-				     lp->phy_mode,
-				     &axienet_phylink_ops);
-	if (IS_ERR(lp->phylink)) {
-		ret = PTR_ERR(lp->phylink);
-		dev_err(&pdev->dev, "phylink_create error (%i)\n", ret);
-		goto cleanup_mdio;
-	}
-
-	ret = register_netdev(lp->ndev);
-	if (ret) {
-		dev_err(lp->dev, "register_netdev() error (%i)\n", ret);
-		goto cleanup_phylink;
-	}
-
-	return 0;
-
-cleanup_phylink:
-	phylink_destroy(lp->phylink);
-
-cleanup_mdio:
-	if (lp->pcs_phy)
-		put_device(&lp->pcs_phy->dev);
 	if (lp->mii_bus)
 		axienet_mdio_teardown(lp);
 	return ret;
@@ -3124,69 +3193,14 @@ static void axienet_remove(struct platform_device *pdev)
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct axienet_local *lp = netdev_priv(ndev);
 
-	unregister_netdev(ndev);
-
-	if (lp->phylink)
-		phylink_destroy(lp->phylink);
-
-	if (lp->pcs_phy)
-		put_device(&lp->pcs_phy->dev);
-
+	axienet_mac_remove(pdev);
 	axienet_mdio_teardown(lp);
 }
 
-static void axienet_shutdown(struct platform_device *pdev)
-{
-	struct net_device *ndev = platform_get_drvdata(pdev);
-
-	rtnl_lock();
-	netif_device_detach(ndev);
-
-	if (netif_running(ndev))
-		dev_close(ndev);
-
-	rtnl_unlock();
-}
-
-static int axienet_suspend(struct device *dev)
-{
-	struct net_device *ndev = dev_get_drvdata(dev);
-
-	if (!netif_running(ndev))
-		return 0;
-
-	netif_device_detach(ndev);
-
-	rtnl_lock();
-	axienet_stop(ndev);
-	rtnl_unlock();
-
-	return 0;
-}
-
-static int axienet_resume(struct device *dev)
-{
-	struct net_device *ndev = dev_get_drvdata(dev);
-
-	if (!netif_running(ndev))
-		return 0;
-
-	rtnl_lock();
-	axienet_open(ndev);
-	rtnl_unlock();
-
-	netif_device_attach(ndev);
-
-	return 0;
-}
-
-static DEFINE_SIMPLE_DEV_PM_OPS(axienet_pm_ops,
-				axienet_suspend, axienet_resume);
-
 static struct platform_driver axienet_driver = {
 	.probe = axienet_probe,
 	.remove = axienet_remove,
-	.shutdown = axienet_shutdown,
+	.shutdown = axienet_mac_shutdown,
 	.driver = {
 		 .name = "xilinx_axienet",
 		 .pm = &axienet_pm_ops,
-- 
2.35.1.1320.gc452695387.dirty


