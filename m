Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F17C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 16:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4F/VhVHf5F041lHROkv/5STe3v2JEXbKH06Lbt6s5EQ=; b=ATW3w9O2vayYVF3v/669cuD7BX
	cQhm7VQNLTfQ9/J1csAM6b7afJLljjZ2bC5YBUEs51VGvuS5UskjykIM85UmiUShKEvNwoVeBpUyY
	KqXTJAXmL89hR6aY/IW/LMPefH2n2RgbWi/WakyXZXTFs89TiMl/Yk+M0TiJx3x5sxOHQYVAkSbw/
	eSLYEE9W0lbFQc516w+aFO/hi9fy8QPlXHrbCuIYpg9wDzhscikWkCF805MrCQQfl+IJ67tpQNyPz
	f96RDZK1FiGgo7IKX4wi1szfUme+AVBR9iYEt0xc6BxAxVbkBY9u9jhKcHg9zsu3Feu955zLD4AH6
	X6XL+rVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKtG-0000000DLSz-2oNx;
	Tue, 05 Aug 2025 16:51:54 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJhC-0000000D9h2-1KfU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 15:35:23 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754408120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4F/VhVHf5F041lHROkv/5STe3v2JEXbKH06Lbt6s5EQ=;
	b=qzZ2u1s+IV+1Wo3NUZsvhUqhL3h42+WH4TcA0GIg38JMIcvjVHPDN9RNUSvpqGZXRyEx2t
	5MbHo4FON1LEoRQCoWvOiCW6m8vdyNI72Trj/gEIRrBMbVkI9DADVAGF/awqLiuHUp7d+w
	dLI5u3STCvwsckclF/gzb8WSwqTgmtU=
From: Sean Anderson <sean.anderson@linux.dev>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	Leon Romanovsky <leon@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH net-next v4 5/7] net: axienet: Use device variable in probe
Date: Tue,  5 Aug 2025 11:34:54 -0400
Message-Id: <20250805153456.1313661-6-sean.anderson@linux.dev>
In-Reply-To: <20250805153456.1313661-1-sean.anderson@linux.dev>
References: <20250805153456.1313661-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_083522_677460_F4FAC5DB 
X-CRM114-Status: GOOD (  19.96  )
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

There are a lot of references to pdev->dev that we can shorten by using
a dev variable.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

(no changes since v3)

Changes in v3:
- New

 .../net/ethernet/xilinx/xilinx_axienet_main.c | 83 +++++++++----------
 1 file changed, 41 insertions(+), 42 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 1f277e5e4a62..28927c7c6c41 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2764,6 +2764,7 @@ static void axienet_disable_misc(void *clocks)
 static int axienet_probe(struct platform_device *pdev)
 {
 	int ret;
+	struct device *dev = &pdev->dev;
 	struct device_node *np;
 	struct axienet_local *lp;
 	struct net_device *ndev;
@@ -2772,13 +2773,13 @@ static int axienet_probe(struct platform_device *pdev)
 	int addr_width = 32;
 	u32 value;
 
-	ndev = devm_alloc_etherdev(&pdev->dev, sizeof(*lp));
+	ndev = devm_alloc_etherdev(dev, sizeof(*lp));
 	if (!ndev)
 		return -ENOMEM;
 
 	platform_set_drvdata(pdev, ndev);
 
-	SET_NETDEV_DEV(ndev, &pdev->dev);
+	SET_NETDEV_DEV(ndev, dev);
 	ndev->features = NETIF_F_SG;
 	ndev->ethtool_ops = &axienet_ethtool_ops;
 
@@ -2788,7 +2789,7 @@ static int axienet_probe(struct platform_device *pdev)
 
 	lp = netdev_priv(ndev);
 	lp->ndev = ndev;
-	lp->dev = &pdev->dev;
+	lp->dev = dev;
 	lp->options = XAE_OPTION_DEFAULTS;
 	lp->rx_bd_num = RX_BD_NUM_DEFAULT;
 	lp->tx_bd_num = TX_BD_NUM_DEFAULT;
@@ -2800,33 +2801,32 @@ static int axienet_probe(struct platform_device *pdev)
 	seqcount_mutex_init(&lp->hw_stats_seqcount, &lp->stats_lock);
 	INIT_DEFERRABLE_WORK(&lp->stats_work, axienet_refresh_stats);
 
-	lp->axi_clk = devm_clk_get_optional_enabled(&pdev->dev,
-						    "s_axi_lite_clk");
+	lp->axi_clk = devm_clk_get_optional_enabled(dev, "s_axi_lite_clk");
 	if (!lp->axi_clk) {
 		/* For backward compatibility, if named AXI clock is not present,
 		 * treat the first clock specified as the AXI clock.
 		 */
-		lp->axi_clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
+		lp->axi_clk = devm_clk_get_optional_enabled(dev, NULL);
 	}
 	if (IS_ERR(lp->axi_clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(lp->axi_clk),
+		return dev_err_probe(dev, PTR_ERR(lp->axi_clk),
 				     "could not get AXI clock\n");
 
 	lp->misc_clks[0].id = "axis_clk";
 	lp->misc_clks[1].id = "ref_clk";
 	lp->misc_clks[2].id = "mgt_clk";
 
-	ret = devm_clk_bulk_get_optional(&pdev->dev, XAE_NUM_MISC_CLOCKS, lp->misc_clks);
+	ret = devm_clk_bulk_get_optional(dev, XAE_NUM_MISC_CLOCKS, lp->misc_clks);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
+		return dev_err_probe(dev, ret,
 				     "could not get misc. clocks\n");
 
 	ret = clk_bulk_prepare_enable(XAE_NUM_MISC_CLOCKS, lp->misc_clks);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
+		return dev_err_probe(dev, ret,
 				     "could not enable misc. clocks\n");
 
-	ret = devm_add_action_or_reset(&pdev->dev, axienet_disable_misc,
+	ret = devm_add_action_or_reset(dev, axienet_disable_misc,
 				       lp->misc_clks);
 	if (ret)
 		return ret;
@@ -2843,7 +2843,7 @@ static int axienet_probe(struct platform_device *pdev)
 	if (axienet_ior(lp, XAE_ABILITY_OFFSET) & XAE_ABILITY_STATS)
 		lp->features |= XAE_FEATURE_STATS;
 
-	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,txcsum", &value);
+	ret = of_property_read_u32(dev->of_node, "xlnx,txcsum", &value);
 	if (!ret) {
 		switch (value) {
 		case 1:
@@ -2858,7 +2858,7 @@ static int axienet_probe(struct platform_device *pdev)
 			break;
 		}
 	}
-	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,rxcsum", &value);
+	ret = of_property_read_u32(dev->of_node, "xlnx,rxcsum", &value);
 	if (!ret) {
 		switch (value) {
 		case 1:
@@ -2877,13 +2877,13 @@ static int axienet_probe(struct platform_device *pdev)
 	 * Here we check for memory allocated for Rx/Tx in the hardware from
 	 * the device-tree and accordingly set flags.
 	 */
-	of_property_read_u32(pdev->dev.of_node, "xlnx,rxmem", &lp->rxmem);
+	of_property_read_u32(dev->of_node, "xlnx,rxmem", &lp->rxmem);
 
-	lp->switch_x_sgmii = of_property_read_bool(pdev->dev.of_node,
+	lp->switch_x_sgmii = of_property_read_bool(dev->of_node,
 						   "xlnx,switch-x-sgmii");
 
 	/* Start with the proprietary, and broken phy_type */
-	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,phy-type", &value);
+	ret = of_property_read_u32(dev->of_node, "xlnx,phy-type", &value);
 	if (!ret) {
 		netdev_warn(ndev, "Please upgrade your device tree binary blob to use phy-mode");
 		switch (value) {
@@ -2906,32 +2906,31 @@ static int axienet_probe(struct platform_device *pdev)
 			return -EINVAL;
 		}
 	} else {
-		ret = of_get_phy_mode(pdev->dev.of_node, &lp->phy_mode);
+		ret = of_get_phy_mode(dev->of_node, &lp->phy_mode);
 		if (ret)
 			return ret;
 	}
 	if (lp->switch_x_sgmii && lp->phy_mode != PHY_INTERFACE_MODE_SGMII &&
 	    lp->phy_mode != PHY_INTERFACE_MODE_1000BASEX) {
-		dev_err(&pdev->dev, "xlnx,switch-x-sgmii only supported with SGMII or 1000BaseX\n");
+		dev_err(dev, "xlnx,switch-x-sgmii only supported with SGMII or 1000BaseX\n");
 		return -EINVAL;
 	}
 
-	if (!of_property_present(pdev->dev.of_node, "dmas")) {
+	if (!of_property_present(dev->of_node, "dmas")) {
 		/* Find the DMA node, map the DMA registers, and decode the DMA IRQs */
-		np = of_parse_phandle(pdev->dev.of_node, "axistream-connected", 0);
+		np = of_parse_phandle(dev->of_node, "axistream-connected", 0);
 
 		if (np) {
 			struct resource dmares;
 
 			ret = of_address_to_resource(np, 0, &dmares);
 			if (ret) {
-				dev_err(&pdev->dev,
+				dev_err(dev,
 					"unable to get DMA resource\n");
 				of_node_put(np);
 				return ret;
 			}
-			lp->dma_regs = devm_ioremap_resource(&pdev->dev,
-							     &dmares);
+			lp->dma_regs = devm_ioremap_resource(dev, &dmares);
 			lp->rx_irq = irq_of_parse_and_map(np, 1);
 			lp->tx_irq = irq_of_parse_and_map(np, 0);
 			of_node_put(np);
@@ -2944,11 +2943,11 @@ static int axienet_probe(struct platform_device *pdev)
 			lp->eth_irq = platform_get_irq_optional(pdev, 2);
 		}
 		if (IS_ERR(lp->dma_regs)) {
-			dev_err(&pdev->dev, "could not map DMA regs\n");
+			dev_err(dev, "could not map DMA regs\n");
 			return PTR_ERR(lp->dma_regs);
 		}
 		if (lp->rx_irq <= 0 || lp->tx_irq <= 0) {
-			dev_err(&pdev->dev, "could not determine irqs\n");
+			dev_err(dev, "could not determine irqs\n");
 			return -ENOMEM;
 		}
 
@@ -2974,20 +2973,20 @@ static int axienet_probe(struct platform_device *pdev)
 				if (ioread32(desc) > 0) {
 					lp->features |= XAE_FEATURE_DMA_64BIT;
 					addr_width = 64;
-					dev_info(&pdev->dev,
+					dev_info(dev,
 						 "autodetected 64-bit DMA range\n");
 				}
 				iowrite32(0x0, desc);
 			}
 		}
 		if (!IS_ENABLED(CONFIG_64BIT) && lp->features & XAE_FEATURE_DMA_64BIT) {
-			dev_err(&pdev->dev, "64-bit addressable DMA is not compatible with 32-bit architecture\n");
+			dev_err(dev, "64-bit addressable DMA is not compatible with 32-bit architecture\n");
 			return -EINVAL;
 		}
 
-		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(addr_width));
+		ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(addr_width));
 		if (ret) {
-			dev_err(&pdev->dev, "No suitable DMA available\n");
+			dev_err(dev, "No suitable DMA available\n");
 			return ret;
 		}
 		netif_napi_add(ndev, &lp->napi_rx, axienet_rx_poll);
@@ -3000,16 +2999,16 @@ static int axienet_probe(struct platform_device *pdev)
 		if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO) {
 			return lp->eth_irq;
 		}
-		tx_chan = dma_request_chan(lp->dev, "tx_chan0");
+		tx_chan = dma_request_chan(dev, "tx_chan0");
 		if (IS_ERR(tx_chan))
-			return dev_err_probe(lp->dev, PTR_ERR(tx_chan),
+			return dev_err_probe(dev, PTR_ERR(tx_chan),
 					     "No Ethernet DMA (TX) channel found\n");
 
 		cfg.reset = 1;
 		/* As name says VDMA but it has support for DMA channel reset */
 		ret = xilinx_vdma_channel_set_config(tx_chan, &cfg);
 		if (ret < 0) {
-			dev_err(&pdev->dev, "Reset channel failed\n");
+			dev_err(dev, "Reset channel failed\n");
 			dma_release_channel(tx_chan);
 			return ret;
 		}
@@ -3024,14 +3023,14 @@ static int axienet_probe(struct platform_device *pdev)
 		ndev->netdev_ops = &axienet_netdev_ops;
 	/* Check for Ethernet core IRQ (optional) */
 	if (lp->eth_irq <= 0)
-		dev_info(&pdev->dev, "Ethernet core IRQ not defined\n");
+		dev_info(dev, "Ethernet core IRQ not defined\n");
 
 	/* Retrieve the MAC address */
-	ret = of_get_mac_address(pdev->dev.of_node, mac_addr);
+	ret = of_get_mac_address(dev->of_node, mac_addr);
 	if (!ret) {
 		axienet_set_mac_address(ndev, mac_addr);
 	} else {
-		dev_warn(&pdev->dev, "could not find MAC address property: %d\n",
+		dev_warn(dev, "could not find MAC address property: %d\n",
 			 ret);
 		axienet_set_mac_address(ndev, NULL);
 	}
@@ -3048,21 +3047,21 @@ static int axienet_probe(struct platform_device *pdev)
 
 	ret = axienet_mdio_setup(lp);
 	if (ret)
-		dev_warn(&pdev->dev,
+		dev_warn(dev,
 			 "error registering MDIO bus: %d\n", ret);
 
 	if (lp->phy_mode == PHY_INTERFACE_MODE_SGMII ||
 	    lp->phy_mode == PHY_INTERFACE_MODE_1000BASEX) {
-		np = of_parse_phandle(pdev->dev.of_node, "pcs-handle", 0);
+		np = of_parse_phandle(dev->of_node, "pcs-handle", 0);
 		if (!np) {
 			/* Deprecated: Always use "pcs-handle" for pcs_phy.
 			 * Falling back to "phy-handle" here is only for
 			 * backward compatibility with old device trees.
 			 */
-			np = of_parse_phandle(pdev->dev.of_node, "phy-handle", 0);
+			np = of_parse_phandle(dev->of_node, "phy-handle", 0);
 		}
 		if (!np) {
-			dev_err(&pdev->dev, "pcs-handle (preferred) or phy-handle required for 1000BaseX/SGMII\n");
+			dev_err(dev, "pcs-handle (preferred) or phy-handle required for 1000BaseX/SGMII\n");
 			ret = -EINVAL;
 			goto cleanup_mdio;
 		}
@@ -3091,18 +3090,18 @@ static int axienet_probe(struct platform_device *pdev)
 			  lp->phylink_config.supported_interfaces);
 	}
 
-	lp->phylink = phylink_create(&lp->phylink_config, pdev->dev.fwnode,
+	lp->phylink = phylink_create(&lp->phylink_config, dev->fwnode,
 				     lp->phy_mode,
 				     &axienet_phylink_ops);
 	if (IS_ERR(lp->phylink)) {
 		ret = PTR_ERR(lp->phylink);
-		dev_err(&pdev->dev, "phylink_create error (%i)\n", ret);
+		dev_err(dev, "phylink_create error (%i)\n", ret);
 		goto cleanup_mdio;
 	}
 
 	ret = register_netdev(lp->ndev);
 	if (ret) {
-		dev_err(lp->dev, "register_netdev() error (%i)\n", ret);
+		dev_err(dev, "register_netdev() error (%i)\n", ret);
 		goto cleanup_phylink;
 	}
 
-- 
2.35.1.1320.gc452695387.dirty


