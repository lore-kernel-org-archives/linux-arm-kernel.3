Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8DEC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 08:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHpLMWOCRS1Vq35y+CI1Lj3GX0JTPFNPiz5/7Vq39gU=; b=FwnExT/RdM0auyKz7w8AtNPQRc
	hdsJMGNPncvGjDWImGAp5qi1IILeIUx2pZO2KBbto+JJlVmZL7qAMFNVo6cAOj4E9DILBmxeKT7Re
	cb1N2UAgQC1FTWEkTNpK2Ms3zy/v7jcXoCvYXSrk6QayWNBDuA8FNmUs/88fU/lL7EHj2ces348ZY
	NXR1tXQCxuprxmC0SyaxqhVGv1Xbwoae8edH9arjICqJajWCfQUiA3FGHATVEJkanXOyhPTgooDTr
	VDmuvfHeosbw4yvUAoWWn1ilr6drxg2zSR9TFlAceKDZ/VjZKJGIAJAGsAK2KK9gc2o0XLK0+J+jV
	gmYXlmTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5xE-0000000F3oa-2tue;
	Thu, 05 Jun 2025 08:28:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5v0-0000000F3gT-2EkI;
	Thu, 05 Jun 2025 08:25:50 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EFFC0593;
	Thu,  5 Jun 2025 10:25:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749111936;
	bh=jZB5GUQNSLUZGeN1I47kzPPREnhFS78kamPsE8HrUzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lonhup31Z1S3y5FuC22Cm3h5rArwmYJu7MnAAx33eIbQHvdQYmdDjQ1wzP5kmtq6U
	 2GsNC2Iuk1QtHC5CsCVMZvyKwPkRguP3zf8a0KS8kJg54+kGrwSeKwV+JC52DFw3Ux
	 Qh4N58hl/fKgt9Ra00eOlpcp2qW8Qh9OlXkMWoic=
Date: Thu, 5 Jun 2025 11:25:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] media: rkisp1: Properly handle result of
 rkisp1_params_init_vb2_queue()
Message-ID: <20250605082529.GH3755@pendragon.ideasonboard.com>
References: <20250523-supported-params-and-wdr-v3-0-7283b8536694@ideasonboard.com>
 <20250523-supported-params-and-wdr-v3-1-7283b8536694@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250523-supported-params-and-wdr-v3-1-7283b8536694@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_012546_892334_9E9A7BBD 
X-CRM114-Status: GOOD (  18.21  )
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

Hi Stefan,

Thank you for the patch.

On Fri, May 23, 2025 at 05:14:30PM +0200, Stefan Klug wrote:
> Properly handle the return of rkisp1_params_init_vb2_queue(). It is very
> unlikely that this ever fails without code changes but should be handled
> anyways.
> 
> While at it rename the error label for easier extension in the upcoming
> patch.

I'd have kept that change for the next patch, as it's hard to review
here without looking at upcoming changes. There's no need for a v4 just
because of this.

> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Changes in v3:
> - Moved these changes into its own patch
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index b28f4140c8a3..24a8de697f2b 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -2763,7 +2763,9 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  	vdev->queue = &node->buf_queue;
>  	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
>  	vdev->vfl_dir = VFL_DIR_TX;
> -	rkisp1_params_init_vb2_queue(vdev->queue, params);
> +	ret = rkisp1_params_init_vb2_queue(vdev->queue, params);
> +	if (ret)
> +		goto err_media;
>  
>  	params->metafmt = &rkisp1_params_formats[RKISP1_PARAMS_FIXED];
>  
> @@ -2777,18 +2779,18 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  	node->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
>  	if (ret)
> -		goto error;
> +		goto err_media;
>  
>  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
>  		dev_err(rkisp1->dev,
>  			"failed to register %s, ret=%d\n", vdev->name, ret);
> -		goto error;
> +		goto err_media;
>  	}
>  
>  	return 0;
>  
> -error:
> +err_media:
>  	media_entity_cleanup(&vdev->entity);
>  	mutex_destroy(&node->vlock);
>  	return ret;

-- 
Regards,

Laurent Pinchart

