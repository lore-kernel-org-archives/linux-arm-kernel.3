Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00072C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 00:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArPO0aSMNQ4VJy5Cn1NLmMTjUMksppDpeUXhdV8G3FI=; b=OwvIBGx9DtHOJYzk/JcVWTmmPH
	ducotEryKHk4/2SPILdLrcc6hhL1JSTQ4m1Go7ntOt/L9e2tIMjE8PGoxqfEXATVMG4R+kT60zDQp
	7f0xIzMueymV1sm674np+dbbrbeNM3Sbj/EtHjCTqM4DURyFHc+7qKzz6cbje5oTvz7+H6PDc18Rc
	DZ/wSEK2msdAc6zPRnJUnAQQ+eNCUnjlo6bPvRqVNmX0iFuB3x8FvwmoupSF4mq5nwnIrygxf3niJ
	kSh77jMw8DG3wGjkQ8Gdu2epaKcGCBTOyc+cCV/ednLa6Z5LVyIFheX1s0cf5rGvu5O6AHHamrIz6
	eX0krj2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubphn-00000006S87-2yKy;
	Wed, 16 Jul 2025 00:09:03 +0000
Received: from out-187.mta1.migadu.com ([2001:41d0:203:375::bb])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubpac-00000006RDV-28Jt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 00:01:39 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752624096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ArPO0aSMNQ4VJy5Cn1NLmMTjUMksppDpeUXhdV8G3FI=;
	b=gzN05hhi+uV+I7xKdtM+ZCjaHJ48IbPgXyyNjBhfgmBmNhSEFSk2dW1KypcZdrEDgJtWId
	5JMFgcjSVS8P4RdCXntMJnUE2wfTqVJBGfKKFC+3LBUDML4EW4B5yNThEtbUSe0Hmqizau
	9jKdx7JJHjVu46j9+HcwLFVs2PaxcAk=
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
Subject: [PATCH net v2 2/4] net: axienet: Fix resource release ordering
Date: Tue, 15 Jul 2025 20:01:08 -0400
Message-Id: <20250716000110.2267189-3-sean.anderson@linux.dev>
In-Reply-To: <20250716000110.2267189-1-sean.anderson@linux.dev>
References: <20250716000110.2267189-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_170138_687307_ED398010 
X-CRM114-Status: GOOD (  17.49  )
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

Device-managed resources are released after manually-managed resources.
Therefore, once any manually-managed resource is acquired, all further
resources must be manually-managed too.

Convert all resources before the MDIO bus is created into device-managed
resources. In all cases but one there are already devm variants available.

Fixes: 46aa27df8853 ("net: axienet: Use devm_* calls")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

(no changes since v1)

 .../net/ethernet/xilinx/xilinx_axienet_main.c | 89 ++++++++-----------
 1 file changed, 37 insertions(+), 52 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 6011d7eae0c7..1f277e5e4a62 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2744,6 +2744,11 @@ static void axienet_dma_err_handler(struct work_struct *work)
 	axienet_setoptions(ndev, lp->options);
 }
 
+static void axienet_disable_misc(void *clocks)
+{
+	clk_bulk_disable_unprepare(XAE_NUM_MISC_CLOCKS, clocks);
+}
+
 /**
  * axienet_probe - Axi Ethernet probe function.
  * @pdev:	Pointer to platform device structure.
@@ -2767,7 +2772,7 @@ static int axienet_probe(struct platform_device *pdev)
 	int addr_width = 32;
 	u32 value;
 
-	ndev = alloc_etherdev(sizeof(*lp));
+	ndev = devm_alloc_etherdev(&pdev->dev, sizeof(*lp));
 	if (!ndev)
 		return -ENOMEM;
 
@@ -2795,22 +2800,17 @@ static int axienet_probe(struct platform_device *pdev)
 	seqcount_mutex_init(&lp->hw_stats_seqcount, &lp->stats_lock);
 	INIT_DEFERRABLE_WORK(&lp->stats_work, axienet_refresh_stats);
 
-	lp->axi_clk = devm_clk_get_optional(&pdev->dev, "s_axi_lite_clk");
+	lp->axi_clk = devm_clk_get_optional_enabled(&pdev->dev,
+						    "s_axi_lite_clk");
 	if (!lp->axi_clk) {
 		/* For backward compatibility, if named AXI clock is not present,
 		 * treat the first clock specified as the AXI clock.
 		 */
-		lp->axi_clk = devm_clk_get_optional(&pdev->dev, NULL);
-	}
-	if (IS_ERR(lp->axi_clk)) {
-		ret = PTR_ERR(lp->axi_clk);
-		goto free_netdev;
-	}
-	ret = clk_prepare_enable(lp->axi_clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to enable AXI clock: %d\n", ret);
-		goto free_netdev;
+		lp->axi_clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
 	}
+	if (IS_ERR(lp->axi_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(lp->axi_clk),
+				     "could not get AXI clock\n");
 
 	lp->misc_clks[0].id = "axis_clk";
 	lp->misc_clks[1].id = "ref_clk";
@@ -2818,18 +2818,23 @@ static int axienet_probe(struct platform_device *pdev)
 
 	ret = devm_clk_bulk_get_optional(&pdev->dev, XAE_NUM_MISC_CLOCKS, lp->misc_clks);
 	if (ret)
-		goto cleanup_clk;
+		return dev_err_probe(&pdev->dev, ret,
+				     "could not get misc. clocks\n");
 
 	ret = clk_bulk_prepare_enable(XAE_NUM_MISC_CLOCKS, lp->misc_clks);
 	if (ret)
-		goto cleanup_clk;
+		return dev_err_probe(&pdev->dev, ret,
+				     "could not enable misc. clocks\n");
+
+	ret = devm_add_action_or_reset(&pdev->dev, axienet_disable_misc,
+				       lp->misc_clks);
+	if (ret)
+		return ret;
 
 	/* Map device registers */
 	lp->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &ethres);
-	if (IS_ERR(lp->regs)) {
-		ret = PTR_ERR(lp->regs);
-		goto cleanup_clk;
-	}
+	if (IS_ERR(lp->regs))
+		return PTR_ERR(lp->regs);
 	lp->regs_start = ethres->start;
 
 	/* Setup checksum offload, but default to off if not specified */
@@ -2898,19 +2903,17 @@ static int axienet_probe(struct platform_device *pdev)
 			lp->phy_mode = PHY_INTERFACE_MODE_1000BASEX;
 			break;
 		default:
-			ret = -EINVAL;
-			goto cleanup_clk;
+			return -EINVAL;
 		}
 	} else {
 		ret = of_get_phy_mode(pdev->dev.of_node, &lp->phy_mode);
 		if (ret)
-			goto cleanup_clk;
+			return ret;
 	}
 	if (lp->switch_x_sgmii && lp->phy_mode != PHY_INTERFACE_MODE_SGMII &&
 	    lp->phy_mode != PHY_INTERFACE_MODE_1000BASEX) {
 		dev_err(&pdev->dev, "xlnx,switch-x-sgmii only supported with SGMII or 1000BaseX\n");
-		ret = -EINVAL;
-		goto cleanup_clk;
+		return -EINVAL;
 	}
 
 	if (!of_property_present(pdev->dev.of_node, "dmas")) {
@@ -2925,7 +2928,7 @@ static int axienet_probe(struct platform_device *pdev)
 				dev_err(&pdev->dev,
 					"unable to get DMA resource\n");
 				of_node_put(np);
-				goto cleanup_clk;
+				return ret;
 			}
 			lp->dma_regs = devm_ioremap_resource(&pdev->dev,
 							     &dmares);
@@ -2942,19 +2945,17 @@ static int axienet_probe(struct platform_device *pdev)
 		}
 		if (IS_ERR(lp->dma_regs)) {
 			dev_err(&pdev->dev, "could not map DMA regs\n");
-			ret = PTR_ERR(lp->dma_regs);
-			goto cleanup_clk;
+			return PTR_ERR(lp->dma_regs);
 		}
 		if (lp->rx_irq <= 0 || lp->tx_irq <= 0) {
 			dev_err(&pdev->dev, "could not determine irqs\n");
-			ret = -ENOMEM;
-			goto cleanup_clk;
+			return -ENOMEM;
 		}
 
 		/* Reset core now that clocks are enabled, prior to accessing MDIO */
 		ret = __axienet_device_reset(lp);
 		if (ret)
-			goto cleanup_clk;
+			return ret;
 
 		/* Autodetect the need for 64-bit DMA pointers.
 		 * When the IP is configured for a bus width bigger than 32 bits,
@@ -2981,14 +2982,13 @@ static int axienet_probe(struct platform_device *pdev)
 		}
 		if (!IS_ENABLED(CONFIG_64BIT) && lp->features & XAE_FEATURE_DMA_64BIT) {
 			dev_err(&pdev->dev, "64-bit addressable DMA is not compatible with 32-bit architecture\n");
-			ret = -EINVAL;
-			goto cleanup_clk;
+			return -EINVAL;
 		}
 
 		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(addr_width));
 		if (ret) {
 			dev_err(&pdev->dev, "No suitable DMA available\n");
-			goto cleanup_clk;
+			return ret;
 		}
 		netif_napi_add(ndev, &lp->napi_rx, axienet_rx_poll);
 		netif_napi_add(ndev, &lp->napi_tx, axienet_tx_poll);
@@ -2998,15 +2998,12 @@ static int axienet_probe(struct platform_device *pdev)
 
 		lp->eth_irq = platform_get_irq_optional(pdev, 0);
 		if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO) {
-			ret = lp->eth_irq;
-			goto cleanup_clk;
+			return lp->eth_irq;
 		}
 		tx_chan = dma_request_chan(lp->dev, "tx_chan0");
-		if (IS_ERR(tx_chan)) {
-			ret = PTR_ERR(tx_chan);
-			dev_err_probe(lp->dev, ret, "No Ethernet DMA (TX) channel found\n");
-			goto cleanup_clk;
-		}
+		if (IS_ERR(tx_chan))
+			return dev_err_probe(lp->dev, PTR_ERR(tx_chan),
+					     "No Ethernet DMA (TX) channel found\n");
 
 		cfg.reset = 1;
 		/* As name says VDMA but it has support for DMA channel reset */
@@ -3014,7 +3011,7 @@ static int axienet_probe(struct platform_device *pdev)
 		if (ret < 0) {
 			dev_err(&pdev->dev, "Reset channel failed\n");
 			dma_release_channel(tx_chan);
-			goto cleanup_clk;
+			return ret;
 		}
 
 		dma_release_channel(tx_chan);
@@ -3119,13 +3116,6 @@ static int axienet_probe(struct platform_device *pdev)
 		put_device(&lp->pcs_phy->dev);
 	if (lp->mii_bus)
 		axienet_mdio_teardown(lp);
-cleanup_clk:
-	clk_bulk_disable_unprepare(XAE_NUM_MISC_CLOCKS, lp->misc_clks);
-	clk_disable_unprepare(lp->axi_clk);
-
-free_netdev:
-	free_netdev(ndev);
-
 	return ret;
 }
 
@@ -3143,11 +3133,6 @@ static void axienet_remove(struct platform_device *pdev)
 		put_device(&lp->pcs_phy->dev);
 
 	axienet_mdio_teardown(lp);
-
-	clk_bulk_disable_unprepare(XAE_NUM_MISC_CLOCKS, lp->misc_clks);
-	clk_disable_unprepare(lp->axi_clk);
-
-	free_netdev(ndev);
 }
 
 static void axienet_shutdown(struct platform_device *pdev)
-- 
2.35.1.1320.gc452695387.dirty


