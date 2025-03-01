Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E17CC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 14:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncO524Bzl0PXjah3VCVCg5sSxxzrPzJgF88z4jj9r4o=; b=P8oG0ohbZ8Gq7juVekSopu7pe1
	s4ZEKq1ncWMkAEbEM4WTPN3bgHKVlK+DQ5lDy+jg2gq1rdABO5HcMIvfcFDn0trdIm0qNc8xAT6nA
	UQNkCBEx7KMFNGzkIxEebESwfPhSaEAvLtsCdwMkiVcKIDl5RCLK24weV5oLstW2F1ZFcHoujnCY5
	TuKb/jRhmqvGQhJvW20q1Se3as2YdQd4fnPSj6M7sT2RR4sQpGJp7Xp7PrLRH3ebs0dc8HrI6UEm5
	FOu8IzyqLrnTgSwVvLwVZYrzEQDTbMImd378uyi1AMaIkaXFfQKwTx2NGs7qP0YhYe6JUoLZgGII3
	gxRNtTmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNxV-0000000EV9z-0Qtj;
	Sat, 01 Mar 2025 14:36:53 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNvu-0000000EUta-3HNf;
	Sat, 01 Mar 2025 14:35:16 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD0DA66B;
	Sat,  1 Mar 2025 15:33:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740839622;
	bh=vOx2aCR711x8XBMo5usk7el1mpTt/EExYD3ss0D/AD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jq/ql4+6oMrO70oDvXDSy6Ow+xYAlNbU24jR2LiPzTBdEHCyHtvtF3d/RRjH8ABr9
	 HWdKdQljD3upBXq7gO6Ju16cNJzvWBd1ShXvVeTW7d53A5dAMQ1l/lMpecRzghS4tY
	 PaM30k0UNsah8UYFpXRY8QBHltPiFLTKwLIU9jfo=
Date: Sat, 1 Mar 2025 16:34:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: rkisp1: Set format defaults based on
 requested color space
Message-ID: <20250301143453.GJ7342@pendragon.ideasonboard.com>
References: <20250227114558.3097101-1-stefan.klug@ideasonboard.com>
 <20250227114558.3097101-2-stefan.klug@ideasonboard.com>
 <20250301010252.GI7342@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250301010252.GI7342@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_063514_990769_A5A587DB 
X-CRM114-Status: GOOD (  41.58  )
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

On Sat, Mar 01, 2025 at 03:02:54AM +0200, Laurent Pinchart wrote:
> On Thu, Feb 27, 2025 at 12:44:59PM +0100, Stefan Klug wrote:
> > When color space JPEG is requested, the ISP sets the quantization
> > incorrectly to limited range. To fix that, set the xfer_func, ycbcr_enc
> > and quantization to the defaults for the requested color space if they
> > are not specified explicitly.
> 
> The commit message fails to explain why you're addressing xfer_func and
> ycbcr_enc to fix the quantization issue.
> 
> > Do this only in case we are converting
> > from RAW to YUV.
> 
> And this should explain why.
> 
> > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > ---
> >  .../media/platform/rockchip/rkisp1/rkisp1-isp.c   | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > index d94917211828..468f5a7d03c7 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > @@ -680,10 +680,23 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
> 
> Adding a bit more context:
> 
> 	set_csc = format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC;
> 
> 	if (set_csc && src_info->pixel_enc == V4L2_PIXEL_ENC_YUV) {
> 
> If V4L2_MBUS_FRAMEFMT_SET_CSC isn't set, the colorspace fields on the
> source pad will be copied from the sink pad, which doesn't seem right.

Thinking some more about it, it's not wrong either. The colorspace and
xfer_func fields are not used by the driver, as the related ISP
processing blocks are configured through ISP parameters. Without
userspace providing the value of the fields on the source pad, the
driver can't know what colorspace and xfer_func is produced. Copying the
values from the sink pad is as good of a guess as we can make.

The ycbcr_enc and quantization fields are different, as they are taken
into account by the driver to configure the ISP. Copying ycbcr_enc from
the sink pad means that it will be set to V4L2_YCBCR_ENC_601 when the
sink format is bayer and the source format is YUV. As the sink
colorspace is most likely going to be V4L2_COLORSPACE_RAW in that case,
that's a fine default, and is identical to what we would get from
V4L2_MAP_YCBCR_ENC_DEFAULT(). Setting the quantization to
V4L2_QUANTIZATION_LIM_RANGE also seems fine as a default, and it what
V4L2_MAP_QUANTIZATION_DEFAULT() would give us.

TL;DR: there's probably no need to change the current behaviour when
V4L2_MBUS_FRAMEFMT_SET_CSC isn't set.

> It's a separate issue, but fixing both together may lead to better code.
> 
> >  		if (sink_info->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
> >  			if (format->colorspace != V4L2_COLORSPACE_DEFAULT)
> >  				src_fmt->colorspace = format->colorspace;
> > -			if (format->xfer_func != V4L2_XFER_FUNC_DEFAULT)
> > +
> > +			if (format->xfer_func == V4L2_XFER_FUNC_DEFAULT)
> 
> Are you sure the condition should be inverted ?
> 
> >  				src_fmt->xfer_func = format->xfer_func;
> > +			else
> > +				src_fmt->xfer_func =
> > +					V4L2_MAP_XFER_FUNC_DEFAULT(format->colorspace);
> > +
> >  			if (format->ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT)
> >  				src_fmt->ycbcr_enc = format->ycbcr_enc;
> > +			else
> > +				src_fmt->ycbcr_enc =
> > +					V4L2_MAP_YCBCR_ENC_DEFAULT(format->colorspace);
> > +
> > +			if (format->quantization == V4L2_QUANTIZATION_DEFAULT)
> > +				src_fmt->quantization =
> > +					V4L2_MAP_QUANTIZATION_DEFAULT(false,
> > +						format->colorspace, format->ycbcr_enc);
> 
> Shouldn't this use src_fmt instead of format ?
> 
> I think quantization handling could be moved below.
> 
> >  		}
> >  
> >  		if (format->quantization != V4L2_QUANTIZATION_DEFAULT)

Now I'm wondering if this is right. As far as I can tell, the
quantization isn't taken into account by the driver when the ISP is
bypassed (capturing raw bayer data, or capturing YUV data from a YUV
sensor).

How about something like this ?

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index d94917211828..9c215c9bb30f 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -659,11 +659,10 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
 		src_fmt->quantization = sink_fmt->quantization;

 	/*
-	 * Allow setting the source color space fields when the SET_CSC flag is
-	 * set and the source format is YUV. If the sink format is YUV, don't
-	 * set the color primaries, transfer function or YCbCr encoding as the
-	 * ISP is bypassed in that case and passes YUV data through without
-	 * modifications.
+	 * Allow setting the source color space fields when the SET_CSC flag.
+	 * This is restricted to the case where the sink format is raw and the
+	 * source format is YUV, as in other cases the ISP is bypassed and the
+	 * input data is passed through without modifications.
 	 *
 	 * The color primaries and transfer function are configured through the
 	 * cross-talk matrix and tone curve respectively. Settings for those
@@ -676,18 +675,30 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
 	 */
 	set_csc = format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC;

-	if (set_csc && src_info->pixel_enc == V4L2_PIXEL_ENC_YUV) {
-		if (sink_info->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
-			if (format->colorspace != V4L2_COLORSPACE_DEFAULT)
-				src_fmt->colorspace = format->colorspace;
-			if (format->xfer_func != V4L2_XFER_FUNC_DEFAULT)
-				src_fmt->xfer_func = format->xfer_func;
-			if (format->ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT)
-				src_fmt->ycbcr_enc = format->ycbcr_enc;
-		}
+	if (set_csc && sink_info->pixel_enc == V4L2_PIXEL_ENC_BAYER &&
+	    src_info->pixel_enc == V4L2_PIXEL_ENC_YUV) {
+		if (format->colorspace != V4L2_COLORSPACE_DEFAULT)
+			src_fmt->colorspace = format->colorspace;
+
+		if (format->xfer_func != V4L2_XFER_FUNC_DEFAULT)
+			src_fmt->xfer_func = format->xfer_func;
+		else
+			src_fmt->xfer_func =
+				V4L2_MAP_XFER_FUNC_DEFAULT(src_fmt->colorspace);
+
+		if (format->ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT)
+			src_fmt->ycbcr_enc = format->ycbcr_enc;
+		else
+			src_fmt->ycbcr_enc =
+				V4L2_MAP_YCBCR_ENC_DEFAULT(src_fmt->colorspace);

 		if (format->quantization != V4L2_QUANTIZATION_DEFAULT)
 			src_fmt->quantization = format->quantization;
+		else
+			src_fmt->quantization =
+				V4L2_MAP_QUANTIZATION_DEFAULT(false,
+							      src_fmt->colorspace,
+							      src_fmt->ycbcr_enc);
 	}

 	*format = *src_fmt;

Can I let you write a commit message ? :-)

-- 
Regards,

Laurent Pinchart

