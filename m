Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB79606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 17:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tOOkfBZE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NgjaHYfiAaPHJ5kq0vWXXCIZ+lJdJlUeid+zTDPD1io=; b=tOOkfBZEekRle8
	/518agFArRs7iPs0EqGIfZ6YJONPpqdB/cbDZ0ikhl3mphijutT74Trrk5zhLnMFFwW2c5e3Zgl5r
	yOuhBHOeUShYCrSuEnocVQEBK7OQj6VBDvXvA+jlrIy7kvp+z70BnqTb9ABWtdGN8ip7/X3IsVZ7K
	+MlN7zXVjHfwD+1631t3Vx/jj4yEoW7G1J8vkwIFw2G23KcAK/TEMb1t2UUCbAbwjk2yqxwWJ1vGZ
	ENQCPGW844CYzoI0u8Wkkb2mSmYzb96qenog4VT8LW8sOplvOY6HWvxB8UmqkmyNRHJjo7MjC6am3
	J5dr7s8gq5AFYqs5z/rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwA7-0000000EYa9-0SgS;
	Thu, 22 Oct 2026 17:01:07 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwA4-0000000EYYi-1YCn;
	Thu, 22 Oct 2026 17:01:06 +0000
Received: by verein.lst.de (Postfix, from userid 107)
	id 9F96068D09; Thu, 22 Oct 2026 19:00:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=4.0.1
Received: from rocky.lan (dynamic-077-002-186-156.77.2.pool.telefonica.de [77.2.186.156])
	by verein.lst.de (Postfix) with ESMTPSA id 081A368C4E;
	Thu, 22 Oct 2026 19:00:36 +0200 (CEST)
Date: Thu, 22 Oct 2026 19:00:26 +0200
From: Torsten Duwe <duwe@lst.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Lucas Sinn <lucas.sinn@wolfvision.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
Message-ID: <20261022190026.6cb0a534@rocky.lan>
In-Reply-To: <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
	<20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
Organization: LST e.V.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.50; aarch64-suse-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_100104_702581_3235E40C 
X-CRM114-Status: GOOD (  19.23  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>

Hi Sascha,

first: thank you for driving this :)

On Thu, 22 Oct 2026 13:06:40 +0200
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> Add a driver for the JPEG hardware decoder Rockchip integrates into a
> number of its SoCs. 

[...]

> +static int rkjpegd_enum_fmt_vid_out(struct file *file, void *priv,
> +				    struct v4l2_fmtdesc *f)
> +{
> +	if (f->index)
> +		return -EINVAL;
> +
> +	f->pixelformat = V4L2_PIX_FMT_JPEG;
> +	f->flags |= V4L2_FMT_FLAG_DYN_RESOLUTION;
> +
> +	return 0;
> +}
> +
> +static int rkjpegd_enum_framesizes(struct file *file, void *priv,
> +				   struct v4l2_frmsizeenum *fsize)
> +{
> +	/* The decoded format follows the bitstream, nothing to enumerate. */
> +	if (fsize->pixel_format == V4L2_PIX_FMT_NV12 ||
> +	    fsize->pixel_format == V4L2_PIX_FMT_GREY)
> +		return -ENOTTY;
> +
> +	if (fsize->pixel_format != V4L2_PIX_FMT_JPEG)
> +		return -EINVAL;
> +
> +	if (fsize->index)
> +		return -EINVAL;
> +
> +	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> +	fsize->stepwise.min_width = RKJPEGD_MIN_WIDTH;
> +	fsize->stepwise.max_width = RKJPEGD_MAX_SIZE;
> +	fsize->stepwise.step_width = RKJPEGD_CODED_STEP;
> +	fsize->stepwise.min_height = RKJPEGD_MIN_HEIGHT;
> +	fsize->stepwise.max_height = RKJPEGD_MAX_SIZE;
> +	fsize->stepwise.step_height = RKJPEGD_CODED_STEP;
> +
> +	return 0;
> +}

Can it do JPEG, MJPEG or maybe both? AFAICT the difference is minimal,
so maybe try to be more permissive?

[...]

> +static const struct v4l2_ioctl_ops rkjpegd_ioctl_ops = {
> +	.vidioc_querycap = rkjpegd_querycap,
> +	.vidioc_enum_framesizes = rkjpegd_enum_framesizes,
> +
> +	.vidioc_enum_fmt_vid_cap = rkjpegd_enum_fmt_vid_cap,
> +	.vidioc_g_fmt_vid_cap_mplane = rkjpegd_g_fmt_vid_cap,
> +	.vidioc_try_fmt_vid_cap_mplane = rkjpegd_try_fmt_vid_cap,
> +	.vidioc_s_fmt_vid_cap_mplane = rkjpegd_s_fmt_vid_cap,
> +
> +	.vidioc_enum_fmt_vid_out = rkjpegd_enum_fmt_vid_out,
> +	.vidioc_g_fmt_vid_out_mplane = rkjpegd_g_fmt_vid_out,
> +	.vidioc_try_fmt_vid_out_mplane = rkjpegd_try_fmt_vid_out,
> +	.vidioc_s_fmt_vid_out_mplane = rkjpegd_s_fmt_vid_out,
> 

You are populating only the *_out_mplane members and not the single
plane ones? So a greyscale JPEG needs to go _mplane with 1 plane?

And for color, the colorspace on the decoded side should be
V4L2_COLORSPACE_JPEG, not sRGB, I think.

Would you mind to give a hint about your test setup?

Thanks,
	Torsten

