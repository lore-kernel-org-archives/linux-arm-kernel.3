Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04242C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 22:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nwgl/CajbCuqI3qDYlx5YtTn1+2ycfN0HKzYqJne4fY=; b=OaM1mhkSQDcrgMMoPYMmpbkJ1T
	2H4P5m9P22w69auzEpohTKTCuEefr5olztdj9R5ugAZFf1IJvMh8d/Zj8dmMINxH18APA7lS8ntfu
	YnGT+imyxFzOucdn/nbsjsZFfm38eEE+4sEbhxzZeXPZamzhQ35AnoeCBVzTte/2yBS7TCl7AKiqg
	lJbJ/YHM66RHyyTav8oknF6WSpCzS3D4pBV2qvGlgSE2JTsR1PxC58y6qVMjFVn8BZIisjNVAe/h7
	zreWXZRkzl7mFx+8Kood9PxTO242rbbjRUypxdhyrmFKdgKCcvHGdzn9w5CZoehpGf/r8+HgKo6Y+
	K8KaTMjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7M6J-00000008iwd-0SOY;
	Tue, 22 Apr 2025 22:28:23 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7LwS-00000008h6i-1D8s;
	Tue, 22 Apr 2025 22:18:13 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4234B65F;
	Wed, 23 Apr 2025 00:18:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745360284;
	bh=zVstEXSZYJvbRbtxwPnlxYQjZQy97aDweLvry+rZZlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJEOG930kDbwQ81ItaCFUBa7veVoZCoSen3bK6km2s2o/Cc1rYOC4zi6eD4jmupL1
	 3/sSAHxGXDQ0dDSGlcUH44eXku39bCim4maANWvXYXG1612aQ246jp33TYU4Nt+OjB
	 vHFlE6+pxCvIHiGiIVxhSmU6B/QPyqT0IChHlagc=
Date: Wed, 23 Apr 2025 01:18:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-phy@lists.infradead.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Vinod Koul <vkoul@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy-zynqmp: Postpone getting clock rate until actually
 needed
Message-ID: <20250422221802.GB32759@pendragon.ideasonboard.com>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.7a5992b5-aa78-4b18-bf5c-70f893b58f48@emailsignatures365.codetwo.com>
 <20250314150431.28319-1-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314150431.28319-1-mike.looijmans@topic.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_151812_471124_9B98AE27 
X-CRM114-Status: GOOD (  33.74  )
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

Hi Mike,

Thank you for the patch.

On Fri, Mar 14, 2025 at 04:04:18PM +0100, Mike Looijmans wrote:
> At probe time the driver would display the following error and abort:
>   xilinx-psgtr fd400000.phy: Invalid rate 0 for reference clock 0
> 
> This issue was that at probe time, the system has not decided yet whether
> the GTR is to be used for SATA (150MHz) or PCIe (100 MHz).

At what point does the system decide that ? I've only used (and tested)
this driver for DisplayPort.

> The driver
> doesn't need to know the clock frequency at that point yet, so wait until
> the lane is actually being initialized before requesting the clock rate
> setting.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> 
>  drivers/phy/xilinx/phy-zynqmp.c | 61 ++++++++++++++++-----------------
>  1 file changed, 30 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
> index 05a4a59f7c40..e29e3e51d380 100644
> --- a/drivers/phy/xilinx/phy-zynqmp.c
> +++ b/drivers/phy/xilinx/phy-zynqmp.c
> @@ -222,7 +222,6 @@ struct xpsgtr_phy {
>   * @siou: siou base address
>   * @gtr_mutex: mutex for locking
>   * @phys: PHY lanes
> - * @refclk_sscs: spread spectrum settings for the reference clocks
>   * @clk: reference clocks
>   * @tx_term_fix: fix for GT issue
>   * @saved_icm_cfg0: stored value of ICM CFG0 register
> @@ -235,7 +234,6 @@ struct xpsgtr_dev {
>  	void __iomem *siou;
>  	struct mutex gtr_mutex; /* mutex for locking */
>  	struct xpsgtr_phy phys[NUM_LANES];
> -	const struct xpsgtr_ssc *refclk_sscs[NUM_LANES];
>  	struct clk *clk[NUM_LANES];
>  	bool tx_term_fix;
>  	unsigned int saved_icm_cfg0;
> @@ -398,13 +396,40 @@ static int xpsgtr_wait_pll_lock(struct phy *phy)
>  	return ret;
>  }
>  
> +/* Get the spread spectrum (SSC) settings for the reference clock rate */
> +static const struct xpsgtr_ssc *xpsgtr_find_sscs(struct xpsgtr_phy *gtr_phy)
> +{
> +	unsigned long rate;
> +	struct clk *clk;
> +	unsigned int i;
> +
> +	clk = gtr_phy->dev->clk[gtr_phy->refclk];
> +	rate = clk_get_rate(clk);
> +
> +	for (i = 0 ; i < ARRAY_SIZE(ssc_lookup); i++) {
> +		/* Allow an error of 100 ppm */
> +		unsigned long error = ssc_lookup[i].refclk_rate / 10000;
> +
> +		if (abs(rate - ssc_lookup[i].refclk_rate) < error)
> +			return &ssc_lookup[i];
> +	}
> +
> +	dev_err(gtr_phy->dev->dev, "Invalid rate %lu for reference clock %u\n",
> +		rate, gtr_phy->refclk);
> +
> +	return NULL;
> +}
> +
>  /* Configure PLL and spread-sprectrum clock. */
>  static void xpsgtr_configure_pll(struct xpsgtr_phy *gtr_phy)
>  {
>  	const struct xpsgtr_ssc *ssc;
>  	u32 step_size;
>  
> -	ssc = gtr_phy->dev->refclk_sscs[gtr_phy->refclk];
> +	ssc = xpsgtr_find_sscs(gtr_phy);
> +	if (!ssc)
> +		return;

Isn't it an issue that we now fail here without propagating an error
back to the caller ? The function is called by xpsgtr_phy_init(), which
return an int, so I think returning an error code here would make sense.

The rest of the patch looks good to me. I would however appreciate
feedback from someone at AMD more knowledgeable than I am with the
hardware. Michal, could you propose an appropriate second maintainer for
this driver ?

> +
>  	step_size = ssc->step_size;
>  
>  	xpsgtr_clr_set(gtr_phy->dev, PLL_REF_SEL(gtr_phy->lane),
> @@ -823,8 +848,7 @@ static struct phy *xpsgtr_xlate(struct device *dev,
>  	}
>  
>  	refclk = args->args[3];
> -	if (refclk >= ARRAY_SIZE(gtr_dev->refclk_sscs) ||
> -	    !gtr_dev->refclk_sscs[refclk]) {
> +	if (refclk >= ARRAY_SIZE(gtr_dev->clk)) {
>  		dev_err(dev, "Invalid reference clock number %u\n", refclk);
>  		return ERR_PTR(-EINVAL);
>  	}
> @@ -928,9 +952,7 @@ static int xpsgtr_get_ref_clocks(struct xpsgtr_dev *gtr_dev)
>  {
>  	unsigned int refclk;
>  
> -	for (refclk = 0; refclk < ARRAY_SIZE(gtr_dev->refclk_sscs); ++refclk) {
> -		unsigned long rate;
> -		unsigned int i;
> +	for (refclk = 0; refclk < ARRAY_SIZE(gtr_dev->clk); ++refclk) {
>  		struct clk *clk;
>  		char name[8];
>  
> @@ -946,29 +968,6 @@ static int xpsgtr_get_ref_clocks(struct xpsgtr_dev *gtr_dev)
>  			continue;
>  
>  		gtr_dev->clk[refclk] = clk;
> -
> -		/*
> -		 * Get the spread spectrum (SSC) settings for the reference
> -		 * clock rate.
> -		 */
> -		rate = clk_get_rate(clk);
> -
> -		for (i = 0 ; i < ARRAY_SIZE(ssc_lookup); i++) {
> -			/* Allow an error of 100 ppm */
> -			unsigned long error = ssc_lookup[i].refclk_rate / 10000;
> -
> -			if (abs(rate - ssc_lookup[i].refclk_rate) < error) {
> -				gtr_dev->refclk_sscs[refclk] = &ssc_lookup[i];
> -				break;
> -			}
> -		}
> -
> -		if (i == ARRAY_SIZE(ssc_lookup)) {
> -			dev_err(gtr_dev->dev,
> -				"Invalid rate %lu for reference clock %u\n",
> -				rate, refclk);
> -			return -EINVAL;
> -		}
>  	}
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart

