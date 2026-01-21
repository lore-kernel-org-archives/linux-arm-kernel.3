Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C06D262AF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 02:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NhqLCxQ6zolhto+bLWV+fUyIzevt5+m3r7aEUYoFOU=; b=imoMosQPLptyVB6bVIBqieAtmL
	RvKIfWVLBCkrXHPLNRbcABITfaJytT7yctvswnALy2SIqcCFhrebTPFqxHnjy3QmoxHZCGcgYCzl8
	/J41O7x6hE5bWY3HvmPcpjAfLHLv9j+HGSw34j+pyzENaJ/ar6uhf/K22GuTina1or7ZhaHLsoG6N
	tiRAXlxNDJFrlTZybABSzmDIw5ETnqAGaTwHZKfWifg9Qt+BgDDW0jTFoZo1YltzlVpnPbhE2khCN
	9G30H+TnBXv6YuC2TFTM8wjvoKbK+jE42zpyioaGxIO81b0aEIRsmX/33A27EUXvh+SoLFOmvuA1x
	Oq3gKKXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNWE-00000004kKg-3C66;
	Wed, 21 Jan 2026 02:00:26 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNWC-00000004kK1-15cc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 02:00:25 +0000
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 533952D7;
	Wed, 21 Jan 2026 02:59:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768960791;
	bh=68MvO/CIzKJobttG0puN9bf9GvmXdMKv8aVGVlIIvvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lbHTctrRRnAh9VTEcZG/+Llnux+4ZuXWcxeW8KWnsHu26Fst/tDo2rnSOUnqbkrEv
	 GDEUH/JzuIH4+Aw8SQ4M3MT8Hfj2cO7c+fb/VDRG+EiXEyFIqRbXzabADBfrYMsjLY
	 XrWFka9VVRu0nmXPN2ir+FGznhynt0ConQuurRiY=
Date: Wed, 21 Jan 2026 04:00:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2 2/5] media: staging: media: imx6-mipi-csi2: use
 devm_mutex_init() to simplify code
Message-ID: <20260121020021.GF403250@killaraus>
References: <20260116-stage-csi2-cleanup-v2-0-a56e9cb25196@nxp.com>
 <20260116-stage-csi2-cleanup-v2-2-a56e9cb25196@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116-stage-csi2-cleanup-v2-2-a56e9cb25196@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_180024_436535_A5294194 
X-CRM114-Status: GOOD (  17.10  )
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

On Fri, Jan 16, 2026 at 11:17:57AM -0500, Frank Li wrote:
> Use devm_mutex_init() to simplify the code. No functional change.
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> index 1113ea2a37f03753423164069b95c049968cc0af..4f740170d2bbf586ac0a58b5d25f8f8432e9e6a3 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -777,12 +777,14 @@ static int csi2_probe(struct platform_device *pdev)
>  	if (!csi2->base)
>  		return -ENOMEM;
>  
> -	mutex_init(&csi2->lock);
> +	ret = devm_mutex_init(&pdev->dev, &csi2->lock);
> +	if (ret)
> +		return ret;
>  
>  	ret = clk_prepare_enable(csi2->pllref_clk);
>  	if (ret) {
>  		v4l2_err(&csi2->sd, "failed to enable pllref_clk\n");
> -		goto rmmutex;
> +		return ret;
>  	}
>  
>  	ret = clk_prepare_enable(csi2->dphy_clk);
> @@ -805,8 +807,6 @@ static int csi2_probe(struct platform_device *pdev)
>  	clk_disable_unprepare(csi2->dphy_clk);
>  pllref_off:
>  	clk_disable_unprepare(csi2->pllref_clk);
> -rmmutex:
> -	mutex_destroy(&csi2->lock);
>  	return ret;
>  }
>  
> @@ -820,7 +820,6 @@ static void csi2_remove(struct platform_device *pdev)
>  	v4l2_async_unregister_subdev(sd);
>  	clk_disable_unprepare(csi2->dphy_clk);
>  	clk_disable_unprepare(csi2->pllref_clk);
> -	mutex_destroy(&csi2->lock);
>  	media_entity_cleanup(&sd->entity);
>  }
>  

-- 
Regards,

Laurent Pinchart

