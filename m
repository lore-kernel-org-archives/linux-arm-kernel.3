Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA276C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 19:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hGW3zRqriPAS/d9yIHlT3JxX1sizcvgONADdQSp/7A=; b=cuEEb2dOW5EDfhNhiMnI3+Lg++
	H7FCPjh4OKBqv9YNs9GI58Zyp09AsRni7rJNB5u/LAgLbNppslcis4lodK7bk+BO4h8Tgt4C58t5T
	ZW6Lz0BAedKUuwPU2n9cIonUmWfUZ7JM6Ep41MvnghCwkp8f5vQkl1FwBTPjieg/ctcwq/ompnv2T
	3Y7WB7KrzYlBnZgZNeDAgoW0m7bz8wXoY4nIQUYJ9MR7JyKoLgypOgxA6fAoimZs58zuPE2izj6xi
	Jw23aFaHrkv6MOmXFfqoLcyW6bzWHHPVxd+fyIfpRsslwtmhc1gzxtCRLuEvdltWfR9Ih6UO4z60Z
	myB3P3XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4m7r-00000006uvt-0LR7;
	Tue, 15 Apr 2025 19:39:19 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4m2k-00000006tdh-48hq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 19:34:04 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744745640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5hGW3zRqriPAS/d9yIHlT3JxX1sizcvgONADdQSp/7A=;
	b=N3R6oc6r4JKt7TkcGE92MK9qUfWwKLGb9oA4IeB7Dh2pdypg0lBTf5C0ojSMsdeQFGaMxo
	KCb58vTYiWROpW474XV9GqdrUmcxcSxYRjTck8UJkBtSQIpV84zViybF+bKfnD+VQvlytR
	oamywi/xTacvLgSbfTIdGT4NIeSHDws=
From: Sean Anderson <sean.anderson@linux.dev>
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>
Cc: upstream@airoha.com,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org,
	Kory Maincent <kory.maincent@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Suraj Gupta <suraj.gupta2@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Robert Hancock <robert.hancock@calian.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [net-next PATCH v3 08/11] net: axienet: Convert to use PCS subsystem
Date: Tue, 15 Apr 2025 15:33:20 -0400
Message-Id: <20250415193323.2794214-9-sean.anderson@linux.dev>
In-Reply-To: <20250415193323.2794214-1-sean.anderson@linux.dev>
References: <20250415193323.2794214-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_123403_170605_2D2BD3F3 
X-CRM114-Status: GOOD (  18.25  )
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

Convert the AXI Ethernet driver to use the PCS subsystem, including the
new Xilinx PCA/PMA driver. Unfortunately, we must use a helper to work
with bare MDIO nodes without a compatible.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
Reviewed-by: Suraj Gupta <suraj.gupta2@amd.com>

---

Changes in v3:
- Select PCS_XILINX unconditionally

 drivers/net/ethernet/xilinx/Kconfig           |   7 ++
 drivers/net/ethernet/xilinx/xilinx_axienet.h  |   4 +-
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 104 ++++--------------
 3 files changed, 28 insertions(+), 87 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/Kconfig b/drivers/net/ethernet/xilinx/Kconfig
index 7502214cc7d5..9f130376e1eb 100644
--- a/drivers/net/ethernet/xilinx/Kconfig
+++ b/drivers/net/ethernet/xilinx/Kconfig
@@ -25,8 +25,15 @@ config XILINX_EMACLITE
 
 config XILINX_AXI_EMAC
 	tristate "Xilinx 10/100/1000 AXI Ethernet support"
+	depends on COMMON_CLK
+	depends on GPIOLIB
 	depends on HAS_IOMEM
+	depends on OF
+	depends on PCS
 	depends on XILINX_DMA
+	select MDIO_DEVICE
+	select OF_DYNAMIC
+	select PCS_XILINX
 	select PHYLINK
 	select DIMLIB
 	help
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
index 5ff742103beb..f46e862245eb 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
@@ -473,7 +473,6 @@ struct skbuf_dma_descriptor {
  * @dev:	Pointer to device structure
  * @phylink:	Pointer to phylink instance
  * @phylink_config: phylink configuration settings
- * @pcs_phy:	Reference to PCS/PMA PHY if used
  * @pcs:	phylink pcs structure for PCS PHY
  * @switch_x_sgmii: Whether switchable 1000BaseX/SGMII mode is enabled in the core
  * @axi_clk:	AXI4-Lite bus clock
@@ -553,8 +552,7 @@ struct axienet_local {
 	struct phylink *phylink;
 	struct phylink_config phylink_config;
 
-	struct mdio_device *pcs_phy;
-	struct phylink_pcs pcs;
+	struct phylink_pcs *pcs;
 
 	bool switch_x_sgmii;
 
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 054abf283ab3..07487c4b2141 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -35,6 +35,8 @@
 #include <linux/platform_device.h>
 #include <linux/skbuff.h>
 #include <linux/math64.h>
+#include <linux/pcs.h>
+#include <linux/pcs-xilinx.h>
 #include <linux/phy.h>
 #include <linux/mii.h>
 #include <linux/ethtool.h>
@@ -2519,63 +2521,6 @@ static const struct ethtool_ops axienet_ethtool_ops = {
 	.get_rmon_stats = axienet_ethtool_get_rmon_stats,
 };
 
-static struct axienet_local *pcs_to_axienet_local(struct phylink_pcs *pcs)
-{
-	return container_of(pcs, struct axienet_local, pcs);
-}
-
-static void axienet_pcs_get_state(struct phylink_pcs *pcs,
-				  unsigned int neg_mode,
-				  struct phylink_link_state *state)
-{
-	struct mdio_device *pcs_phy = pcs_to_axienet_local(pcs)->pcs_phy;
-
-	phylink_mii_c22_pcs_get_state(pcs_phy, neg_mode, state);
-}
-
-static void axienet_pcs_an_restart(struct phylink_pcs *pcs)
-{
-	struct mdio_device *pcs_phy = pcs_to_axienet_local(pcs)->pcs_phy;
-
-	phylink_mii_c22_pcs_an_restart(pcs_phy);
-}
-
-static int axienet_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
-			      phy_interface_t interface,
-			      const unsigned long *advertising,
-			      bool permit_pause_to_mac)
-{
-	struct mdio_device *pcs_phy = pcs_to_axienet_local(pcs)->pcs_phy;
-	struct net_device *ndev = pcs_to_axienet_local(pcs)->ndev;
-	struct axienet_local *lp = netdev_priv(ndev);
-	int ret;
-
-	if (lp->switch_x_sgmii) {
-		ret = mdiodev_write(pcs_phy, XLNX_MII_STD_SELECT_REG,
-				    interface == PHY_INTERFACE_MODE_SGMII ?
-					XLNX_MII_STD_SELECT_SGMII : 0);
-		if (ret < 0) {
-			netdev_warn(ndev,
-				    "Failed to switch PHY interface: %d\n",
-				    ret);
-			return ret;
-		}
-	}
-
-	ret = phylink_mii_c22_pcs_config(pcs_phy, interface, advertising,
-					 neg_mode);
-	if (ret < 0)
-		netdev_warn(ndev, "Failed to configure PCS: %d\n", ret);
-
-	return ret;
-}
-
-static const struct phylink_pcs_ops axienet_pcs_ops = {
-	.pcs_get_state = axienet_pcs_get_state,
-	.pcs_config = axienet_pcs_config,
-	.pcs_an_restart = axienet_pcs_an_restart,
-};
-
 static struct phylink_pcs *axienet_mac_select_pcs(struct phylink_config *config,
 						  phy_interface_t interface)
 {
@@ -2583,8 +2528,8 @@ static struct phylink_pcs *axienet_mac_select_pcs(struct phylink_config *config,
 	struct axienet_local *lp = netdev_priv(ndev);
 
 	if (interface == PHY_INTERFACE_MODE_1000BASEX ||
-	    interface ==  PHY_INTERFACE_MODE_SGMII)
-		return &lp->pcs;
+	    interface == PHY_INTERFACE_MODE_SGMII)
+		return lp->pcs;
 
 	return NULL;
 }
@@ -3056,28 +3001,23 @@ static int axienet_probe(struct platform_device *pdev)
 
 	if (lp->phy_mode == PHY_INTERFACE_MODE_SGMII ||
 	    lp->phy_mode == PHY_INTERFACE_MODE_1000BASEX) {
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
+		DECLARE_PHY_INTERFACE_MASK(interfaces);
+
+		phy_interface_zero(interfaces);
+		if (lp->switch_x_sgmii ||
+		    lp->phy_mode == PHY_INTERFACE_MODE_SGMII)
+			__set_bit(PHY_INTERFACE_MODE_SGMII, interfaces);
+		if (lp->switch_x_sgmii ||
+		    lp->phy_mode == PHY_INTERFACE_MODE_1000BASEX)
+			__set_bit(PHY_INTERFACE_MODE_1000BASEX, interfaces);
+
+		lp->pcs = axienet_xilinx_pcs_get(&pdev->dev, interfaces);
+		if (IS_ERR(lp->pcs)) {
+			ret = PTR_ERR(lp->pcs);
+			dev_err_probe(&pdev->dev, ret,
+				      "could not get PCS for 1000BASE-X/SGMII\n");
 			goto cleanup_mdio;
 		}
-		of_node_put(np);
-		lp->pcs.ops = &axienet_pcs_ops;
-		lp->pcs.poll = true;
 	}
 
 	lp->phylink_config.dev = &ndev->dev;
@@ -3115,8 +3055,6 @@ static int axienet_probe(struct platform_device *pdev)
 	phylink_destroy(lp->phylink);
 
 cleanup_mdio:
-	if (lp->pcs_phy)
-		put_device(&lp->pcs_phy->dev);
 	if (lp->mii_bus)
 		axienet_mdio_teardown(lp);
 cleanup_clk:
@@ -3139,9 +3077,7 @@ static void axienet_remove(struct platform_device *pdev)
 	if (lp->phylink)
 		phylink_destroy(lp->phylink);
 
-	if (lp->pcs_phy)
-		put_device(&lp->pcs_phy->dev);
-
+	pcs_put(&pdev->dev, lp->pcs);
 	axienet_mdio_teardown(lp);
 
 	clk_bulk_disable_unprepare(XAE_NUM_MISC_CLOCKS, lp->misc_clks);
-- 
2.35.1.1320.gc452695387.dirty


