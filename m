Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B4BD2629F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 01:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgqXTRv7SuLHTt+2NTHz03jAEdxCYVlWVDdqIWtgWKA=; b=3m3PXvvyTob07lYr3iOjXxYOM/
	JmRjG9/OYJ/Xdn6VZsg+04yS/MzGrPdZh2+YdD2BXjQfxLnHZvcEZH2La8b6tJEaxHyABHHB+HBId
	S9C5OTjGK43EqCUsMC2A7ZV/XL+iYpZ/uNQObxQ69+Ywpa3ivlqDN8cfHSG88G7O5ZCTTlmBfpqbb
	3p7v5skopNDx5MTik8I5/7uhUmO8v7FUQf9uJ8lEJtuFJ7XEXAJizMlzHWYhV+QsEydKtw2DyjQMW
	Ib2dFPD998aQK2D49dpGB5eHtT+hQ8tmv92BqrUfFAntti8YT5BORJnDkiBVd/tmDVgFqHj3ZeGz+
	RPYHn47g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNGD-00000004j0R-2fip;
	Wed, 21 Jan 2026 01:43:53 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNGB-00000004j03-09Q4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 01:43:52 +0000
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 31B182D7;
	Wed, 21 Jan 2026 02:43:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768959794;
	bh=4tldAe57KIhnwtzr8Bq/hvpgF6dJBV0FlSqy2EGPIco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ru1Q91ptMf7hveD3WxgR/C5BZjDqyKE8SqVBUqZNE6ltTIsv87fdJLJ8PKVk/CHmS
	 +Nj+Q2LFzqSr9spnLmtTocPaIFlH7eFD7E/2FIVmJApNl2pml3c9gQt2rUBB97YgKe
	 ENTG8QunDOkoc0J+bKMzdJ8NonSF8Im1NPo1nOkw=
Date: Wed, 21 Jan 2026 03:43:44 +0200
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
Subject: Re: [PATCH v4 2/4] media: nxp: imx8-isi: use
 devm_pm_runtime_enable() to simplify code
Message-ID: <20260121014344.GA403250@killaraus>
References: <20260116-cam_cleanup-v4-0-29ce01640443@nxp.com>
 <20260116-cam_cleanup-v4-2-29ce01640443@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116-cam_cleanup-v4-2-29ce01640443@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_174351_214124_F3050201 
X-CRM114-Status: GOOD (  20.42  )
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

On Fri, Jan 16, 2026 at 11:29:20AM -0500, Frank Li wrote:
> Use devm_pm_runtime_enable() to simplify code. Change to use
> dev_err_probe() because previous goto change to return.
> 
> No functional change.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> change in v2
> - remove error code print at dev_err_probe.
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index c3d411ddf492eb27b372763ce5d344a90c6ec524..486092511d1f9381c250ddcf844fc74c61a789b7 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -499,13 +499,14 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  	dma_size = isi->pdata->has_36bit_dma ? 36 : 32;
>  	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_size));
>  
> -	pm_runtime_enable(dev);
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
>  
>  	ret = mxc_isi_crossbar_init(isi);
> -	if (ret) {
> -		dev_err(dev, "Failed to initialize crossbar: %d\n", ret);
> -		goto err_pm;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to initialize crossbar\n");
>  
>  	for (i = 0; i < isi->pdata->num_channels; ++i) {
>  		ret = mxc_isi_pipe_init(isi, i);
> @@ -528,8 +529,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  
>  err_xbar:
>  	mxc_isi_crossbar_cleanup(&isi->crossbar);
> -err_pm:
> -	pm_runtime_disable(isi->dev);
> +
>  	return ret;
>  }
>  
> @@ -548,8 +548,6 @@ static void mxc_isi_remove(struct platform_device *pdev)
>  
>  	mxc_isi_crossbar_cleanup(&isi->crossbar);
>  	mxc_isi_v4l2_cleanup(isi);
> -
> -	pm_runtime_disable(isi->dev);
>  }
>  
>  static const struct of_device_id mxc_isi_of_match[] = {

-- 
Regards,

Laurent Pinchart

