Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98167CF256C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 04:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mtG1xIeqI3wrSQ1scbpaL0o6gAVG3ELNr84PAjxpSEU=; b=eoy4BTg8Vlaca+Bw8Bs75cE4nP
	+Qn3NrhNu+W1l6uGjQ/sLbZMhA2r8PWU0s9El0vFheFnnqpYO9H0qnFtpdBadGX/vYF61fH9pZx7Z
	YhPc3U/jy2hBsMvR5x97y9K3ZKTRANNsj9JuYimXhRwR2vz4R6uvMbef8jiGnibLJ6wCNn/eUF09/
	w9vxejk22l7AGEBuy31cZ7MuS34Rb5E31Gy+YPKLXss/gZ0LytGiDQRzEm4k+xy0F7KmHFx1F74wy
	jUry3PxuPhBwnxodR1haEJfo3O2/cR8zeQfpJmvBu5dkkCxIzTF1RamHqJtIF/5iKlCGe8CpT6Dlw
	hhNO+ZSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZt7-00000001nw8-04pf;
	Wed, 19 Nov 2025 04:33:49 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZt4-00000001nsV-0XSo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 04:33:47 +0000
Received: from pendragon.ideasonboard.com (unknown [205.220.129.225])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8C398B5;
	Wed, 19 Nov 2025 05:31:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763526700;
	bh=4fPDjJVL7dFOo7C+XLuMfEt3zJtEYIYH9XWQsl5NyhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oslRwvT21wy6hF/i4PJZupRViRTl6v/3BpnMs2LzlQmv6i0lvDlKJh7FL5Uv+JPcU
	 JDH5sO1OMryPAYFJ6OJSGUu0W6UflXVrNQMcSspF084Pcys5IF21Vb5rIBpxvXOVL9
	 dPnqOIThaA4QAaC0MfKkS+DR7oW20cUA9PyoCR9I=
Date: Wed, 19 Nov 2025 13:33:07 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: nxp: use dev_err_probe() to simplify code
Message-ID: <20251119043307.GH17526@pendragon.ideasonboard.com>
References: <20251117-cam_cleanup-v1-0-6cd42872db79@nxp.com>
 <20251117-cam_cleanup-v1-2-6cd42872db79@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251117-cam_cleanup-v1-2-6cd42872db79@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_203346_573028_0F95FD31 
X-CRM114-Status: GOOD (  22.06  )
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

Hi Frank,

Thank you for the patch.

On Mon, Nov 17, 2025 at 01:58:12PM -0500, Frank Li wrote:
> Use dev_err_probe() to simplify code. No functional change.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c    |  6 ++----
>  drivers/media/platform/nxp/imx7-media-csi.c   | 13 ++++---------
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 28 ++++++++++++---------------
>  3 files changed, 18 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 088b2945aee33731c565f049dd17721356300b84..ce93d868746f002c22e2f86b1e0aa84ec1a76061 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1547,10 +1547,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
>  	/* Now that the hardware is initialized, request the interrupt. */
>  	ret = devm_request_irq(dev, irq, mipi_csis_irq_handler, 0,
>  			       dev_name(dev), csis);
> -	if (ret) {
> -		dev_err(dev, "Interrupt request failed\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Interrupt request failed\n");
>  
>  	/* Initialize and register the subdev. */
>  	ret = mipi_csis_subdev_init(csis);
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index 933a5f39f9f4c9b43ca8d2a1819d0145981266e6..82109e6884a4d931a84ef02e2bde41d0d7248511 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -2218,11 +2218,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
>  
>  	/* Acquire resources and install interrupt handler. */
>  	csi->mclk = devm_clk_get(&pdev->dev, "mclk");
> -	if (IS_ERR(csi->mclk)) {
> -		ret = PTR_ERR(csi->mclk);
> -		dev_err(dev, "Failed to get mclk: %d", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(csi->mclk))
> +		return dev_err_probe(dev, PTR_ERR(csi->mclk), "Failed to get mclk\n");

		return dev_err_probe(dev, PTR_ERR(csi->mclk),
				     "Failed to get mclk\n");

>  
>  	csi->irq = platform_get_irq(pdev, 0);
>  	if (csi->irq < 0)
> @@ -2236,10 +2233,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
>  
>  	ret = devm_request_irq(dev, csi->irq, imx7_csi_irq_handler, 0, "csi",
>  			       (void *)csi);
> -	if (ret < 0) {
> -		dev_err(dev, "Request CSI IRQ failed.\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Request CSI IRQ failed.\n");
>  
>  	/* Initialize all the media device infrastructure. */
>  	ret = imx7_csi_media_init(csi);
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 0851f4a9ae52d3096f454da643cfdc5017e000b1..75709161fb26a61239b94430365849e022fdc14f 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -951,10 +951,9 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
>  	int ret = 0;
>  
>  	state->rst = devm_reset_control_array_get_exclusive(dev);
> -	if (IS_ERR(state->rst)) {
> -		dev_err(dev, "Failed to get reset: %pe\n", state->rst);
> -		return PTR_ERR(state->rst);
> -	}
> +	if (IS_ERR(state->rst))
> +		return dev_err_probe(dev, PTR_ERR(state->rst),
> +				     "Failed to get reset: %pe\n", state->rst);

		return dev_err_probe(dev, PTR_ERR(state->rst),
				     "Failed to get reset\n");

as dev_err_probe() prints the error already.

>  
>  	if (state->pdata->use_reg_csr) {
>  		const struct regmap_config regmap_config = {
> @@ -977,24 +976,21 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
>  
>  	ret = of_property_read_u32_array(np, "fsl,mipi-phy-gpr", out_val,
>  					 ARRAY_SIZE(out_val));
> -	if (ret) {
> -		dev_err(dev, "no fsl,mipi-phy-gpr property found: %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "no fsl,mipi-phy-gpr property found: %d\n", ret);

		return dev_err_probe(dev, ret,
				     "no fsl,mipi-phy-gpr property found\n");

or possibly

		return dev_err_probe(dev, ret, "no %s property found\n",
				     "fsl,mipi-phy-gpr");

to enable string de-duplication (assuming it's worth it).

>  
>  	ph = *out_val;
>  
>  	node = of_find_node_by_phandle(ph);
> -	if (!node) {
> -		dev_err(dev, "Error finding node by phandle\n");
> -		return -ENODEV;
> -	}
> +	if (!node)
> +		return dev_err_probe(dev, -ENODEV, "Error finding node by phandle\n");

Line wrap here too.

> +
>  	state->phy_gpr = syscon_node_to_regmap(node);
>  	of_node_put(node);
> -	if (IS_ERR(state->phy_gpr)) {
> -		dev_err(dev, "failed to get gpr regmap: %pe\n", state->phy_gpr);
> -		return PTR_ERR(state->phy_gpr);
> -	}
> +	if (IS_ERR(state->phy_gpr))
> +		return dev_err_probe(dev, PTR_ERR(state->phy_gpr),
> +				     "failed to get gpr regmap: %pe\n", state->phy_gpr);

		return dev_err_probe(dev, PTR_ERR(state->phy_gpr),
				     "failed to get gpr regmap\n");

I think you can also drop the error message upon
imx8mq_mipi_csi_parse_dt() failure in imx8mq_mipi_csi_probe().

With those changes,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	state->phy_gpr_reg = out_val[1];
>  	dev_dbg(dev, "phy gpr register set to 0x%x\n", state->phy_gpr_reg);

-- 
Regards,

Laurent Pinchart

