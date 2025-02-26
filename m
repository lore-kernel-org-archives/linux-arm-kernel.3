Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F086C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 20:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeF7Ewx6NAusBYEOSje3skKSmmM4CYBVHEZ1SUTgkMY=; b=nOGft7jXMC+U139O5e470Q78ZE
	8W3CEpUHJesjhfn2AzGcYqOHtKEogECfUv4cZyk8MC0X+lqohVydtY52v7Fh3fuZkKgNyMQsGFIYi
	j010IA1T2DTYIqn0ASKbdOdPslwKEnGeaI0ttf+q4MQcbYM03bx6kaK0d6tUsCWCOHGJnlQyb9A36
	TM/reWLdLuI/z2/H/WRofjn2aupfwAuPX0+Y/IO00M8tou8+lszsQLZ5/aW+7NLe6Z6xw46UvDl2A
	ph91gNfBSLPFw1beplVbVYtXL978ssYf5Y/iJo9M/ZILy/ct3Anf4ej19xcYFkAWxGGbev37J88pa
	aIKBhI6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnOF5-00000005NF3-1Nue;
	Wed, 26 Feb 2025 20:42:55 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnOCW-00000005MxI-1Umj;
	Wed, 26 Feb 2025 20:40:18 +0000
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:2b29:76dc:a5a9:647c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9C1949E;
	Wed, 26 Feb 2025 21:38:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740602325;
	bh=TXJqXbK1vX8NmA7FEpqCUeP7RrAU0Ywxmcnb5iP26BM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uUJUF/yQUab2QYU+TOwjAEATLWKwxseYippfVXxx28KOGRWekBNjBD6MfnddV6k/Q
	 4gVA6WRE24YhBqVeORCByYnjzVTex42lX0ZP7k+K1/hHsN4pS+c27Q3Xs0KL/K6EGR
	 gZx/e9/4UfYTtyXwXjnFKsKeG8hj7yWf5VE0LxPo=
Date: Wed, 26 Feb 2025 21:40:11 +0100
From: Stefan Klug <stefan.klug@ideasonboard.com>
To: libcamera-devel@lists.libcamera.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Paul Elder <paul.elder@ideasonboard.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] media: rkisp1: Apply full quantization when color space
 JPEG is requested
Message-ID: <zgs5b6fuyzuihrvsgkm3xxrv4gr6g2umw6lvafqetzsnizmxc5@6jvux4xfnyep>
References: <20250226192413.2903243-1-stefan.klug@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250226192413.2903243-1-stefan.klug@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_124016_541566_B43E7C26 
X-CRM114-Status: GOOD (  18.65  )
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

Hi all,

unfortunately I was tricked by my own observations and this patch
doesn't actually fix the problem. So please ignore. I'll post a proper
fix soon.

Sorry for the noise.

Best regards,
Stefan

On Wed, Feb 26, 2025 at 08:23:53PM +0100, Stefan Klug wrote:
> When color space V4L2_COLORSPACE_JPEG is requested the ISP incorrectly
> sets the output quantization to V4L2_QUANTIZATION_LIM_RANGE. Fix that by
> applying the default quantization for the requested color space.
> 
> Fixes: c1ec5efba080 ("media: rkisp1: Allow setting all color space fields on ISP source pad")
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index d94917211828..98635d875ac4 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -646,7 +646,7 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
>  
>  	/*
>  	 * Copy the color space for the sink pad. When converting from Bayer to
> -	 * YUV, default to a limited quantization range.
> +	 * YUV, default to the default quantization range of the color space.
>  	 */
>  	src_fmt->colorspace = sink_fmt->colorspace;
>  	src_fmt->xfer_func = sink_fmt->xfer_func;
> @@ -654,7 +654,8 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
>  
>  	if (sink_info->pixel_enc == V4L2_PIXEL_ENC_BAYER &&
>  	    src_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
> -		src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
> +		src_fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(
> +			false, sink_fmt->colorspace, sink_fmt->ycbcr_enc);
>  	else
>  		src_fmt->quantization = sink_fmt->quantization;
>  
> -- 
> 2.43.0
> 
> 

