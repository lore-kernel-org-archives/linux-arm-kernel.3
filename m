Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B79BC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 20:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmQh7WNBVytuG3QTxljJy01b4onL5r5Bw3fy3XKBb7A=; b=gHvOGLM3XFbSKQPbHKzSGYHUyO
	vXCXqDl9VyqT82bpMjc0BPDEerEhwkX6tRyYgsWoq2v5uBik/7LSGKE7ha6NvZNAiIwsnL69Xv6KG
	l2391VLJNzeZ9QHEg6xe9u74CgQigxRAGJkrqXHumIgt7eatu7dLRy6JjlmCy6Ao6egz2Lekb52X+
	5hmMeSkUt2JDV6VHXMlw51F5mvKFXuTTiY8nnt1v+r0TjdkmRaL/Q7dQ7yoiNyFCJjS95TDvNBJs8
	w2eSow++rdbF3HysuNpU6Ixui+oBnEncEbYewmo5TI8q6XFNrFmE337NWqqYiM2WnWsQ+JGDs8f9Y
	PIlXJG0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSM9r-0000000EFG9-1LAM;
	Thu, 19 Jun 2025 20:46:51 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLWO-0000000EB0d-1bmh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 20:06:06 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750363562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vmQh7WNBVytuG3QTxljJy01b4onL5r5Bw3fy3XKBb7A=;
	b=S6RAREr+EK8Wrm17Ow34FNmnhd4HEdrIrRkz7Yie++mIN+YjzsZ1sSVqk13hhiMV0sNQWW
	F3liv5meZxympZ3TXsSE8QaCe+02JQa5qPxVvKm0UpWqlLsO97WqyNPzv+L9SApzvPNFPs
	nHwQt1/9/34mf2e3dkOyka2sYbdfO4Q=
From: Sean Anderson <sean.anderson@linux.dev>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Simek <michal.simek@amd.com>,
	Saravana Kannan <saravanak@google.com>,
	Leon Romanovsky <leon@kernel.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	linux-kernel@vger.kernel.org,
	Ira Weiny <ira.weiny@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH net 4/4] net: axienet: Split into MAC and MDIO drivers
Date: Thu, 19 Jun 2025 16:05:37 -0400
Message-Id: <20250619200537.260017-5-sean.anderson@linux.dev>
In-Reply-To: <20250619200537.260017-1-sean.anderson@linux.dev>
References: <20250619200537.260017-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_130604_569736_07C30EB8 
X-CRM114-Status: GOOD (  22.14  )
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

Returning EPROBE_DEFER after probing a bus may result in an infinite
probe loop if the EPROBE_DEFER error is never resolved. For example, if
the PCS is located on another MDIO bus and that MDIO bus is missing its
driver then we will always return EPROBE_DEFER. But if there are any
devices on our own MDIO bus (such as PHYs), those devices will be
successfully bound before we fail our own probe. This will cause the
deferred probing infrastructure to continuously try to probe our device.

To prevent this, split the MAC and MDIO functionality into separate
auxiliary devices. These can then be re-probed independently.

Fixes: 1a02556086fc ("net: axienet: Properly handle PCS/PMA PHY for 1000BaseX mode")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/net/ethernet/xilinx/Kconfig           |  1 +
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 76 +++++++++++--------
 .../net/ethernet/xilinx/xilinx_axienet_mdio.c | 32 +++++---
 3 files changed, 69 insertions(+), 40 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/Kconfig b/drivers/net/ethernet/xilinx/Kconfig
index 7502214cc7d5..3b940d2d3115 100644
--- a/drivers/net/ethernet/xilinx/Kconfig
+++ b/drivers/net/ethernet/xilinx/Kconfig
@@ -27,6 +27,7 @@ config XILINX_AXI_EMAC
 	tristate "Xilinx 10/100/1000 AXI Ethernet support"
 	depends on HAS_IOMEM
 	depends on XILINX_DMA
+	select AUXILIARY_BUS
 	select PHYLINK
 	select DIMLIB
 	help
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index c2512c04a88f..2f26474b16f6 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -22,6 +22,7 @@
  *  - Add support for extended VLAN support.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/etherdevice.h>
@@ -2749,13 +2750,16 @@ static void axienet_disable_misc(void *clocks)
 	clk_bulk_disable_unprepare(XAE_NUM_MISC_CLOCKS, clocks);
 }
 
-static int axienet_mac_probe(struct axienet_local *lp)
+static int axienet_mac_probe(struct auxiliary_device *auxdev,
+			     const struct auxiliary_device_id *id)
 {
+	struct axienet_local *lp = auxdev->dev.platform_data;
 	struct net_device *ndev = lp->ndev;
 	struct device_node *np;
 	int ret;
 
-	SET_NETDEV_DEV(ndev, lp->dev);
+	auxiliary_set_drvdata(auxdev, ndev);
+	SET_NETDEV_DEV(ndev, &auxdev->dev);
 	if (lp->phy_mode == PHY_INTERFACE_MODE_SGMII ||
 	    lp->phy_mode == PHY_INTERFACE_MODE_1000BASEX) {
 		np = of_parse_phandle(lp->dev->of_node, "pcs-handle", 0);
@@ -2818,9 +2822,9 @@ static int axienet_mac_probe(struct axienet_local *lp)
 	return ret;
 }
 
-static void axienet_mac_remove(struct platform_device *pdev)
+static void axienet_mac_remove(struct auxiliary_device *auxdev)
 {
-	struct net_device *ndev = platform_get_drvdata(pdev);
+	struct net_device *ndev = auxiliary_get_drvdata(auxdev);
 	struct axienet_local *lp = netdev_priv(ndev);
 
 	unregister_netdev(ndev);
@@ -2829,9 +2833,9 @@ static void axienet_mac_remove(struct platform_device *pdev)
 		put_device(&lp->pcs_phy->dev);
 }
 
-static void axienet_mac_shutdown(struct platform_device *pdev)
+static void axienet_mac_shutdown(struct auxiliary_device *auxdev)
 {
-	struct net_device *ndev = platform_get_drvdata(pdev);
+	struct net_device *ndev = auxiliary_get_drvdata(auxdev);
 
 	rtnl_lock();
 	netif_device_detach(ndev);
@@ -2877,6 +2881,24 @@ static int axienet_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(axienet_pm_ops,
 				axienet_suspend, axienet_resume);
 
+static const struct auxiliary_device_id xilinx_axienet_mac_id_table[] = {
+	{ .name = KBUILD_MODNAME ".mac", },
+	{ },
+};
+MODULE_DEVICE_TABLE(auxiliary, xilinx_axienet_mac_id_table);
+
+static struct auxiliary_driver xilinx_axienet_mac = {
+	.name = "mac",
+	.id_table = xilinx_axienet_mac_id_table,
+	.probe = axienet_mac_probe,
+	.remove = axienet_mac_remove,
+	.shutdown = axienet_mac_shutdown,
+	.driver = {
+		 .pm = &axienet_pm_ops,
+	},
+};
+module_auxiliary_driver(xilinx_axienet_mac)
+
 /**
  * axienet_probe - Axi Ethernet probe function.
  * @pdev:	Pointer to platform device structure.
@@ -2892,12 +2914,14 @@ static DEFINE_SIMPLE_DEV_PM_OPS(axienet_pm_ops,
 static int axienet_probe(struct platform_device *pdev)
 {
 	int ret;
+	struct auxiliary_device *auxdev;
 	struct device_node *np;
 	struct axienet_local *lp;
 	struct net_device *ndev;
 	struct resource *ethres;
 	u8 mac_addr[ETH_ALEN];
 	int addr_width = 32;
+	char name[20];
 	u32 value;
 
 	ndev = devm_alloc_etherdev(&pdev->dev, sizeof(*lp));
@@ -2906,7 +2930,6 @@ static int axienet_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ndev);
 
-	SET_NETDEV_DEV(ndev, &pdev->dev);
 	ndev->features = NETIF_F_SG;
 	ndev->ethtool_ops = &axienet_ethtool_ops;
 
@@ -3174,36 +3197,27 @@ static int axienet_probe(struct platform_device *pdev)
 	lp->tx_dma_cr = axienet_calc_cr(lp, XAXIDMA_DFT_TX_THRESHOLD,
 					XAXIDMA_DFT_TX_USEC);
 
-	ret = axienet_mdio_setup(lp);
-	if (ret)
-		dev_warn(&pdev->dev,
-			 "error registering MDIO bus: %d\n", ret);
-
-	ret = axienet_mac_probe(lp);
-	if (!ret)
-		return 0;
-
-	if (lp->mii_bus)
-		axienet_mdio_teardown(lp);
-	return ret;
-}
-
-static void axienet_remove(struct platform_device *pdev)
-{
-	struct net_device *ndev = platform_get_drvdata(pdev);
-	struct axienet_local *lp = netdev_priv(ndev);
-
-	axienet_mac_remove(pdev);
-	axienet_mdio_teardown(lp);
+	snprintf(name, sizeof(name), "mdio.%llx",
+		 (unsigned long long)lp->regs_start);
+	auxdev = devm_auxiliary_device_create(&pdev->dev, name, lp);
+	if (IS_ERR(auxdev))
+		return dev_err_probe(&pdev->dev, PTR_ERR(auxdev),
+				     "could not create MDIO bus\n");
+
+	snprintf(name, sizeof(name), "mac.%llx",
+		 (unsigned long long)lp->regs_start);
+	auxdev = devm_auxiliary_device_create(&pdev->dev, name, lp);
+	if (IS_ERR(auxdev))
+		return dev_err_probe(&pdev->dev, PTR_ERR(auxdev),
+				     "could not create MAC\n");
+
+	return 0;
 }
 
 static struct platform_driver axienet_driver = {
 	.probe = axienet_probe,
-	.remove = axienet_remove,
-	.shutdown = axienet_mac_shutdown,
 	.driver = {
 		 .name = "xilinx_axienet",
-		 .pm = &axienet_pm_ops,
 		 .of_match_table = axienet_of_match,
 	},
 };
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c b/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c
index 9ca2643c921e..8874525ec3f3 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c
@@ -9,6 +9,7 @@
  * Copyright (c) 2010 - 2012 Xilinx, Inc. All rights reserved.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/clk.h>
 #include <linux/of_address.h>
 #include <linux/of_mdio.h>
@@ -277,12 +278,15 @@ static int axienet_mdio_enable(struct axienet_local *lp, struct device_node *np)
  * Sets up the MDIO interface by initializing the MDIO clock.
  * Register the MDIO interface.
  **/
-int axienet_mdio_setup(struct axienet_local *lp)
+static int axienet_mdio_probe(struct auxiliary_device *auxdev,
+			      const struct auxiliary_device_id *id)
 {
+	struct axienet_local *lp = auxdev->dev.platform_data;
 	struct device_node *mdio_node;
 	struct mii_bus *bus;
 	int ret;
 
+	auxiliary_set_drvdata(auxdev, lp);
 	bus = mdiobus_alloc();
 	if (!bus)
 		return -ENOMEM;
@@ -294,7 +298,7 @@ int axienet_mdio_setup(struct axienet_local *lp)
 	bus->name = "Xilinx Axi Ethernet MDIO";
 	bus->read = axienet_mdio_read;
 	bus->write = axienet_mdio_write;
-	bus->parent = lp->dev;
+	bus->parent = &auxdev->dev;
 	lp->mii_bus = bus;
 
 	mdio_node = of_get_child_by_name(lp->dev->of_node, "mdio");
@@ -317,15 +321,25 @@ int axienet_mdio_setup(struct axienet_local *lp)
 	return ret;
 }
 
-/**
- * axienet_mdio_teardown - MDIO remove function
- * @lp:		Pointer to axienet local data structure.
- *
- * Unregisters the MDIO and frees any associate memory for mii bus.
- */
-void axienet_mdio_teardown(struct axienet_local *lp)
+static void axienet_mdio_remove(struct auxiliary_device *auxdev)
 {
+	struct axienet_local *lp = auxiliary_get_drvdata(auxdev);
+
 	mdiobus_unregister(lp->mii_bus);
 	mdiobus_free(lp->mii_bus);
 	lp->mii_bus = NULL;
 }
+
+static const struct auxiliary_device_id xilinx_axienet_mdio_id_table[] = {
+	{ .name = KBUILD_MODNAME ".mdio", },
+	{ },
+};
+MODULE_DEVICE_TABLE(auxiliary, xilinx_axienet_mdio_id_table);
+
+static struct auxiliary_driver xilinx_axienet_mdio = {
+	.name = "mdio",
+	.id_table = xilinx_axienet_mdio_id_table,
+	.probe = axienet_mdio_probe,
+	.remove = axienet_mdio_remove,
+};
+module_auxiliary_driver(xilinx_axienet_mdio)
-- 
2.35.1.1320.gc452695387.dirty


