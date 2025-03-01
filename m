Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8245FC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 01:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cO4vmZbQphpy8zLoX+vL0e+VOhOBG9W0g8J0rgIwLZ0=; b=j2i0u28f4mbPY9L1hjiZ9UZejk
	PkrwjEQ2rTCVDCy4IWu3myvZ9T+ZnHZ/Dr1UI6x1JBjwzVfHCH19/MjyksEGL1UejdaBGRPVj+56V
	RATV51S301k+TGlDIIQ2eeBVwJ8Dfxa90FKObzpkF+MNDI6OAGDB0TNJ0Cm5NpTYdcJ97uAua/6fF
	FmSMtfgzArpld9ka3IFWlj/rc8nbP+FJoGDNhD9/IXA+n0LSJCoTFdNjn785TZ0nhVBGflpRSeheH
	FId9wRnlYI7fxrGG84tsEFpkQDi++U47NpPAi5uiVkuhOQJ61u/GUb/AoKJVXLtAOE7uhEmaa82g2
	Ablm9Lfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toBHc-0000000D7sg-1jJH;
	Sat, 01 Mar 2025 01:04:48 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toBG5-0000000D7mm-3bAO;
	Sat, 01 Mar 2025 01:03:15 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 834BF8BE;
	Sat,  1 Mar 2025 02:01:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740790902;
	bh=E4CFDdWpLRuR6cWZBhtXLShaSWGwBIT3NTPSNKAfUWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uc9F/QBIBnzEY8mfv0uRYcjyLx1ko30GlR6UK9oG6Mg+09RDBQuv4YBoid0CDNW2v
	 ClYEYPokYcreyrwHOzssSlYCW7T63hzqvhor+H0Pnlo0UBpr4jU26EL2mvEczEG8YN
	 i1BqUzwfl53p9s+Mei8kwCD4gBCZQdigbbpa7BTc=
Date: Sat, 1 Mar 2025 03:02:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: rkisp1: Set format defaults based on
 requested color space
Message-ID: <20250301010252.GI7342@pendragon.ideasonboard.com>
References: <20250227114558.3097101-1-stefan.klug@ideasonboard.com>
 <20250227114558.3097101-2-stefan.klug@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250227114558.3097101-2-stefan.klug@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_170314_035829_8C022F2F 
X-CRM114-Status: GOOD (  23.31  )
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

On Thu, Feb 27, 2025 at 12:44:59PM +0100, Stefan Klug wrote:
> When color space JPEG is requested, the ISP sets the quantization
> incorrectly to limited range. To fix that, set the xfer_func, ycbcr_enc
> and quantization to the defaults for the requested color space if they
> are not specified explicitly.

The commit message fails to explain why you're addressing xfer_func and
ycbcr_enc to fix the quantization issue.

> Do this only in case we are converting
> from RAW to YUV.

And this should explain why.

> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> ---
>  .../media/platform/rockchip/rkisp1/rkisp1-isp.c   | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index d94917211828..468f5a7d03c7 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -680,10 +680,23 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,

Adding a bit more context:

	set_csc = format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC;

	if (set_csc && src_info->pixel_enc == V4L2_PIXEL_ENC_YUV) {

If V4L2_MBUS_FRAMEFMT_SET_CSC isn't set, the colorspace fields on the
source pad will be copied from the sink pad, which doesn't seem right.
It's a separate issue, but fixing both together may lead to better code.

>  		if (sink_info->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
>  			if (format->colorspace != V4L2_COLORSPACE_DEFAULT)
>  				src_fmt->colorspace = format->colorspace;
> -			if (format->xfer_func != V4L2_XFER_FUNC_DEFAULT)
> +
> +			if (format->xfer_func == V4L2_XFER_FUNC_DEFAULT)

Are you sure the condition should be inverted ?

>  				src_fmt->xfer_func = format->xfer_func;
> +			else
> +				src_fmt->xfer_func =
> +					V4L2_MAP_XFER_FUNC_DEFAULT(format->colorspace);
> +
>  			if (format->ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT)
>  				src_fmt->ycbcr_enc = format->ycbcr_enc;
> +			else
> +				src_fmt->ycbcr_enc =
> +					V4L2_MAP_YCBCR_ENC_DEFAULT(format->colorspace);
> +
> +			if (format->quantization == V4L2_QUANTIZATION_DEFAULT)
> +				src_fmt->quantization =
> +					V4L2_MAP_QUANTIZATION_DEFAULT(false,
> +						format->colorspace, format->ycbcr_enc);

Shouldn't this use src_fmt instead of format ?

I think quantization handling could be moved below.

>  		}
>  
>  		if (format->quantization != V4L2_QUANTIZATION_DEFAULT)

-- 
Regards,

Laurent Pinchart

