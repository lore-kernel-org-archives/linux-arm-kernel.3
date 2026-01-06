Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0EACEFCFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 19:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8Uv8ViAxWsHdMXcBt3qZfhJJPVyoN2bV3IhBd0MKqI=; b=xnKeDIrUo7PV/ZAeQSQSXmYcNn
	3NuipPb144d1oUcvRrjljgE9AxRAT21bIRQayO6wIMi4Lg/4qDhf/oWWvkf+bS5d6lr+BlZU9sWtr
	AxKrv58zg9fnFgftvndQ4Gr1F1XY5sRAoquAfN91LsfueEHuGYR/5EnFuf2nyON3FOGraoxvKE8//
	w7K8HteWFWHGKxxqQM/zDCDfhZPqC8F/TFM32hGSX78okAEqEV2NY1HC/b4VZkB71SlCLmvGg5hy+
	NHzQyUxEGmbK3rQ0o7cSxmGqmBe9rradPTxZ2k4mPRlUUqybN9/gpQ7QIPY0TWPCUF7YUFiELpjnw
	h6DqaRpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdChM-0000000DkpM-1NKz;
	Tue, 06 Jan 2026 19:26:32 +0000
Received: from out-173.mta1.migadu.com ([2001:41d0:203:375::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdChI-0000000Dkop-2Sce
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 19:26:30 +0000
Message-ID: <97983e82-698a-4042-9417-f9d9c1247e77@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767727584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e8Uv8ViAxWsHdMXcBt3qZfhJJPVyoN2bV3IhBd0MKqI=;
	b=Fj1XaccsM8tAaJ6yXQgYuvaedm/5E8T3WwjZ5YHl5OcO+68ianotJqnNyrWaqLLtvFkFET
	r53GUxCF5eZ5muXC6P8OHoUe4qQZmjwMi77Vqy5u3ZAtx5C4s9jp+2reo5ZXw/GxG1vRC5
	q5M1rHfdrurF1GM/WDhuzbca4MhqB9I=
Date: Tue, 6 Jan 2026 14:26:00 -0500
MIME-Version: 1.0
Subject: Re: [RFC PATCH 2/2] net: axienet: Fix resource release ordering
To: Suraj Gupta <suraj.gupta2@amd.com>, mturquette@baylibre.com,
 sboyd@kernel.org, radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, michal.simek@amd.com
Cc: linux@armlinux.org.uk, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260102085454.3439195-1-suraj.gupta2@amd.com>
 <20260102085454.3439195-3-suraj.gupta2@amd.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20260102085454.3439195-3-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_112628_782620_6B8F1176 
X-CRM114-Status: GOOD (  25.04  )
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

On 1/2/26 03:54, Suraj Gupta wrote:
> From: Sean Anderson <sean.anderson@linux.dev>
> 
> Device-managed resources are released after manually-managed resources.
> Therefore, once any manually-managed resource is acquired, all further
> resources must be manually-managed too.
> 
> Convert all resources before the MDIO bus is created into device-managed
> resources. In all cases but one there are already devm variants available.
> 
> Fixes: 46aa27df8853 ("net: axienet: Use devm_* calls")
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> Co-developed-by: Suraj Gupta <suraj.gupta2@amd.com>
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> ---
>  .../net/ethernet/xilinx/xilinx_axienet_main.c | 83 ++++++-------------
>  1 file changed, 27 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 284031fb2e2c..998bacd508b8 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -2787,7 +2787,7 @@ static int axienet_probe(struct platform_device *pdev)
>  	int addr_width = 32;
>  	u32 value;
>  
> -	ndev = alloc_etherdev(sizeof(*lp));
> +	ndev = devm_alloc_etherdev(&pdev->dev, sizeof(*lp));
>  	if (!ndev)
>  		return -ENOMEM;
>  
> @@ -2815,41 +2815,32 @@ static int axienet_probe(struct platform_device *pdev)
>  	seqcount_mutex_init(&lp->hw_stats_seqcount, &lp->stats_lock);
>  	INIT_DEFERRABLE_WORK(&lp->stats_work, axienet_refresh_stats);
>  
> -	lp->axi_clk = devm_clk_get_optional(&pdev->dev, "s_axi_lite_clk");
> +	lp->axi_clk = devm_clk_get_optional_enabled(&pdev->dev,
> +						    "s_axi_lite_clk");
>  	if (!lp->axi_clk) {
>  		/* For backward compatibility, if named AXI clock is not present,
>  		 * treat the first clock specified as the AXI clock.
>  		 */
> -		lp->axi_clk = devm_clk_get_optional(&pdev->dev, NULL);
> -	}
> -	if (IS_ERR(lp->axi_clk)) {
> -		ret = PTR_ERR(lp->axi_clk);
> -		goto free_netdev;
> -	}
> -	ret = clk_prepare_enable(lp->axi_clk);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Unable to enable AXI clock: %d\n", ret);
> -		goto free_netdev;
> +		lp->axi_clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
>  	}
> +	if (IS_ERR(lp->axi_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(lp->axi_clk),
> +				     "could not get AXI clock\n");
>  
>  	lp->misc_clks[0].id = "axis_clk";
>  	lp->misc_clks[1].id = "ref_clk";
>  	lp->misc_clks[2].id = "mgt_clk";
>  
> -	ret = devm_clk_bulk_get_optional(&pdev->dev, XAE_NUM_MISC_CLOCKS, lp->misc_clks);
> -	if (ret)
> -		goto cleanup_clk;
> -
> -	ret = clk_bulk_prepare_enable(XAE_NUM_MISC_CLOCKS, lp->misc_clks);
> +	ret = devm_clk_bulk_get_optional_enable(&pdev->dev, XAE_NUM_MISC_CLOCKS,
> +						lp->misc_clks);
>  	if (ret)
> -		goto cleanup_clk;
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "could not get/enable misc. clocks\n");
>  
>  	/* Map device registers */
>  	lp->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &ethres);
> -	if (IS_ERR(lp->regs)) {
> -		ret = PTR_ERR(lp->regs);
> -		goto cleanup_clk;
> -	}
> +	if (IS_ERR(lp->regs))
> +		return PTR_ERR(lp->regs);
>  	lp->regs_start = ethres->start;
>  
>  	/* Setup checksum offload, but default to off if not specified */
> @@ -2918,19 +2909,17 @@ static int axienet_probe(struct platform_device *pdev)
>  			lp->phy_mode = PHY_INTERFACE_MODE_1000BASEX;
>  			break;
>  		default:
> -			ret = -EINVAL;
> -			goto cleanup_clk;
> +			return -EINVAL;
>  		}
>  	} else {
>  		ret = of_get_phy_mode(pdev->dev.of_node, &lp->phy_mode);
>  		if (ret)
> -			goto cleanup_clk;
> +			return ret;
>  	}
>  	if (lp->switch_x_sgmii && lp->phy_mode != PHY_INTERFACE_MODE_SGMII &&
>  	    lp->phy_mode != PHY_INTERFACE_MODE_1000BASEX) {
>  		dev_err(&pdev->dev, "xlnx,switch-x-sgmii only supported with SGMII or 1000BaseX\n");
> -		ret = -EINVAL;
> -		goto cleanup_clk;
> +		return -EINVAL;
>  	}
>  
>  	if (!of_property_present(pdev->dev.of_node, "dmas")) {
> @@ -2945,7 +2934,7 @@ static int axienet_probe(struct platform_device *pdev)
>  				dev_err(&pdev->dev,
>  					"unable to get DMA resource\n");
>  				of_node_put(np);
> -				goto cleanup_clk;
> +				return ret;
>  			}
>  			lp->dma_regs = devm_ioremap_resource(&pdev->dev,
>  							     &dmares);
> @@ -2962,19 +2951,17 @@ static int axienet_probe(struct platform_device *pdev)
>  		}
>  		if (IS_ERR(lp->dma_regs)) {
>  			dev_err(&pdev->dev, "could not map DMA regs\n");
> -			ret = PTR_ERR(lp->dma_regs);
> -			goto cleanup_clk;
> +			return PTR_ERR(lp->dma_regs);
>  		}
>  		if (lp->rx_irq <= 0 || lp->tx_irq <= 0) {
>  			dev_err(&pdev->dev, "could not determine irqs\n");
> -			ret = -ENOMEM;
> -			goto cleanup_clk;
> +			return -ENOMEM;
>  		}
>  
>  		/* Reset core now that clocks are enabled, prior to accessing MDIO */
>  		ret = __axienet_device_reset(lp);
>  		if (ret)
> -			goto cleanup_clk;
> +			return ret;
>  
>  		/* Autodetect the need for 64-bit DMA pointers.
>  		 * When the IP is configured for a bus width bigger than 32 bits,
> @@ -3001,14 +2988,13 @@ static int axienet_probe(struct platform_device *pdev)
>  		}
>  		if (!IS_ENABLED(CONFIG_64BIT) && lp->features & XAE_FEATURE_DMA_64BIT) {
>  			dev_err(&pdev->dev, "64-bit addressable DMA is not compatible with 32-bit architecture\n");
> -			ret = -EINVAL;
> -			goto cleanup_clk;
> +			return -EINVAL;
>  		}
>  
>  		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(addr_width));
>  		if (ret) {
>  			dev_err(&pdev->dev, "No suitable DMA available\n");
> -			goto cleanup_clk;
> +			return ret;
>  		}
>  		netif_napi_add(ndev, &lp->napi_rx, axienet_rx_poll);
>  		netif_napi_add(ndev, &lp->napi_tx, axienet_tx_poll);
> @@ -3018,15 +3004,12 @@ static int axienet_probe(struct platform_device *pdev)
>  
>  		lp->eth_irq = platform_get_irq_optional(pdev, 0);
>  		if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO) {
> -			ret = lp->eth_irq;
> -			goto cleanup_clk;
> +			return lp->eth_irq;
>  		}
>  		tx_chan = dma_request_chan(lp->dev, "tx_chan0");
> -		if (IS_ERR(tx_chan)) {
> -			ret = PTR_ERR(tx_chan);
> -			dev_err_probe(lp->dev, ret, "No Ethernet DMA (TX) channel found\n");
> -			goto cleanup_clk;
> -		}
> +		if (IS_ERR(tx_chan))
> +			return dev_err_probe(lp->dev, PTR_ERR(tx_chan),
> +					     "No Ethernet DMA (TX) channel found\n");
>  
>  		cfg.reset = 1;
>  		/* As name says VDMA but it has support for DMA channel reset */
> @@ -3034,7 +3017,7 @@ static int axienet_probe(struct platform_device *pdev)
>  		if (ret < 0) {
>  			dev_err(&pdev->dev, "Reset channel failed\n");
>  			dma_release_channel(tx_chan);
> -			goto cleanup_clk;
> +			return ret;
>  		}
>  
>  		dma_release_channel(tx_chan);
> @@ -3139,13 +3122,6 @@ static int axienet_probe(struct platform_device *pdev)
>  		put_device(&lp->pcs_phy->dev);
>  	if (lp->mii_bus)
>  		axienet_mdio_teardown(lp);
> -cleanup_clk:
> -	clk_bulk_disable_unprepare(XAE_NUM_MISC_CLOCKS, lp->misc_clks);
> -	clk_disable_unprepare(lp->axi_clk);
> -
> -free_netdev:
> -	free_netdev(ndev);
> -
>  	return ret;
>  }
>  
> @@ -3163,11 +3139,6 @@ static void axienet_remove(struct platform_device *pdev)
>  		put_device(&lp->pcs_phy->dev);
>  
>  	axienet_mdio_teardown(lp);
> -
> -	clk_bulk_disable_unprepare(XAE_NUM_MISC_CLOCKS, lp->misc_clks);
> -	clk_disable_unprepare(lp->axi_clk);
> -
> -	free_netdev(ndev);
>  }
>  
>  static void axienet_shutdown(struct platform_device *pdev)

Reviewed-by: Sean Anderson <sean.anderson@linux.dev>

I think you should resend this without RFC now that the merge window is open.

