Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71760C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 21:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SObuPjh1EdHeCynqQnGUv+279+7vNvJ2ZuT0lwWY7wY=; b=s/cFkDW7yd8QC5uyb9LWuD0g4u
	bNP6hZ5nlTFWPC3cys4Xb7JWYEqBVbULOdXH74TlBSYFrrQGwHAHXRab50JRzs+LJN+ToQUMXYICI
	AiHybXBcWjbv+koAol10qI2s0nMibDGaNpYhw0JhzPJHO+NQMiNxNtEEGGsqAIhQymYhS+RceRtfF
	GzskhDmj99rTHQBS8EDq+9dAhj/4kDLPMXllg/uj8BUx+s4fMxq8MrpVXHFTwS033/Ybf2nYW8EXT
	6OMLMgIU//9/eiwF+gqTFhjyYRLdumO4QrN1y/PNjs7nG4ry6QNVFiESG5Mo6wuP8JGR+3iJlCj2A
	30S2SOkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ydd-00000005AuF-2ZbM;
	Mon, 21 Apr 2025 21:25:13 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6yZk-00000005AV3-2PYk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 21:21:13 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DBA96D6;
	Mon, 21 Apr 2025 23:19:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745270344;
	bh=gbGNiLskkmYRnfhaDT9bpoBD6PYRZv46CeHD/P2qXpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K9IxOC49dSTtU49w7/HCkhvaaKZlahqnNF+Qmymta/l7Q5+DBh3QpaRImohAN2dBg
	 UOZh7W/gs2KGZbxO14kADhJ2D8gLF8jMKwCWhpQEV6GDrXvztd/XHEIaUzIJ/y8Gu4
	 +OO4g6zJxHA9eqzZtOEYFJntgMCRl2Y2lhKAYwZo=
Date: Tue, 22 Apr 2025 00:21:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v4 06/13] media: nxp: imx8-isi: Use dev_err_probe()
 simplify code
Message-ID: <20250421212109.GP17813@pendragon.ideasonboard.com>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
 <20250408-8qxp_camera-v4-6-ef695f1b47c4@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250408-8qxp_camera-v4-6-ef695f1b47c4@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_142112_750243_F33714F4 
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

Hi Frank,

Thank you for the patch.

On Tue, Apr 08, 2025 at 05:53:04PM -0400, Frank Li wrote:
> Use dev_err_probe() simplify code. No functional changes intended.

In the subject line and here, s/simplify/to simplify/

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 073ea5912de3b..398cc03443be3 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -428,19 +428,14 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
>  
>  	isi->regs = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(isi->regs)) {
> -		dev_err(dev, "Failed to get ISI register map\n");
> -		return PTR_ERR(isi->regs);
> -	}
> +	if (IS_ERR(isi->regs))
> +		return dev_err_probe(dev, PTR_ERR(isi->regs), "Failed to get ISI register map\n");

		return dev_err_probe(dev, PTR_ERR(isi->regs),
				     "Failed to get ISI register map\n");

>  
>  	if (isi->pdata->gasket_ops) {
>  		isi->gasket = syscon_regmap_lookup_by_phandle(dev->of_node,
>  							      "fsl,blk-ctrl");
> -		if (IS_ERR(isi->gasket)) {
> -			ret = PTR_ERR(isi->gasket);
> -			dev_err(dev, "failed to get gasket: %d\n", ret);
> -			return ret;
> -		}
> +		if (IS_ERR(isi->gasket))
> +			return dev_err_probe(dev, PTR_ERR(isi->gasket), "failed to get gasket\n");

			return dev_err_probe(dev, PTR_ERR(isi->gasket),
					     "failed to get gasket\n");

With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	}
>  
>  	dma_size = isi->pdata->has_36bit_dma ? 36 : 32;

-- 
Regards,

Laurent Pinchart

