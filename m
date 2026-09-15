Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C851EC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 00:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqAa/0mxM0iXn3wkgxJJafhH6jpyySmf+L4wmzQL4BQ=; b=forYqhRHF56vPv/jrguOW/Danm
	K7o5Annzs1x4S17QUUL/9ZQ+XNQl00ngfsxUDDuDzGypFr+Z69uVYZImk2NPoq8S2xycB8ExUlqhg
	k3sFFh+3FeFYp82IwlxtBFH5mkaecvmE0AVr2dzpKalTkxfQWEztjP+Cpvn4yTa8Sy2aaU1B4hdGk
	114Frvd2aF1bsgySmGwrABc/K1oqAU0nClTBpLUSasFxclQxPVQ3TDgiPVUheUceMWnytRfoZvUDu
	IJ4pZ8H2A1Kdi8rSbH8347SmhhoHWHNA2XswW4OlHav61CkOSNy3MWD63jErsb+tssmPgayGjuRER
	x0CbJsAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6GcV-00000004tH3-2Pj7;
	Tue, 15 Sep 2026 00:01:55 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6GcS-00000004tGg-3DQk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 00:01:54 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29F9D1741;
	Tue, 15 Sep 2026 02:00:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789430410;
	bh=DzjwrZ8Y9dyLlcnqv/R/WNI8vufkQK9CVzzRc4UyBTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZWcf1LHIfdA9FFvZwb43y2WBf10oGppSLA7fg/MiniXKtxyDne1ZCtOT8ObbgbXSh
	 0qnkcp59seWUhxwFj4YMw8ANrkoPEWd55t21scLKd6IiwaD/eyb8PQhYva5BsZ2vfv
	 o7n2/snFedXFGUcIUBoeELKtNLE2+pn6yar23BQc=
Date: Tue, 15 Sep 2026 03:01:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/6] media: imx8-isi: Use per-platform format_mask for
 output format field
Message-ID: <20260915000149.GC2796257@killaraus.ideasonboard.com>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-2-fafdb4b446d4@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831-isi_imx952-v2-2-fafdb4b446d4@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_170152_950762_25369337 
X-CRM114-Status: GOOD (  21.39  )
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

On Mon, Aug 31, 2026 at 11:36:57AM +0800, Guoniu Zhou wrote:
> The ISI output format field width differs across SoC generations:
> i.MX8 series (MN/MP/QM/QXP) use a 6-bit field (bits 29:24), while
> from i.MX8ULP onwards (including i.MX91/93/95/952) the field is
> extended to 7 bits (bits 30:24) to support RAW32 and RAW14 formats.
> 
> Replace the static CHNL_IMG_CTRL_FORMAT_MASK with a per-platform
> format_mask in mxc_isi_plat_data to correctly match the hardware
> format field width for each SoC.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 8 ++++++++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h | 1 +
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c   | 3 ++-
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h | 1 -
>  4 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index f2a8eb82fbfd..c1c16dbc1539 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -297,6 +297,7 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
>  	.reg_offset		= 0,
>  	.ier_reg		= &mxc_imx8_isi_ier_v1,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(29, 24),
>  	.buf_active_reverse	= false,
>  	.gasket_ops		= &mxc_imx8_gasket_ops,
>  	.has_36bit_dma		= false,
> @@ -309,6 +310,7 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
>  	.reg_offset		= 0x2000,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(29, 24),
>  	.buf_active_reverse	= true,
>  	.gasket_ops		= &mxc_imx8_gasket_ops,
>  	.has_36bit_dma		= true,
> @@ -322,6 +324,7 @@ static const struct mxc_isi_plat_data mxc_imx8qm_data = {
>  	.reg_offset		= 0x10000,
>  	.ier_reg		= &mxc_imx8_isi_ier_qm,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(29, 24),
>  	.buf_active_reverse	= true,
>  	.has_36bit_dma		= false,
>  };
> @@ -334,6 +337,7 @@ static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
>  	.reg_offset		= 0x10000,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(29, 24),
>  	.buf_active_reverse	= true,
>  	.has_36bit_dma		= false,
>  };
> @@ -345,6 +349,7 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
>  	.reg_offset		= 0x0,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(30, 24),
>  	.buf_active_reverse	= true,
>  	.has_36bit_dma		= false,
>  };
> @@ -356,6 +361,7 @@ static const struct mxc_isi_plat_data mxc_imx91_data = {
>  	.reg_offset		= 0,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(30, 24),
>  	.buf_active_reverse	= true,
>  	.has_36bit_dma		= false,
>  };
> @@ -367,6 +373,7 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
>  	.reg_offset		= 0,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(30, 24),
>  	.buf_active_reverse	= true,
>  	.gasket_ops		= &mxc_imx93_gasket_ops,
>  	.has_36bit_dma		= false,
> @@ -380,6 +387,7 @@ static const struct mxc_isi_plat_data mxc_imx95_data = {
>  	.reg_offset		= 0x10000,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(30, 24),
>  	.buf_active_reverse	= true,
>  	.has_36bit_dma		= true,
>  };
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 58b47335afc7..05c21c448b93 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -175,6 +175,7 @@ struct mxc_isi_plat_data {
>  	const struct mxc_isi_ier_reg  *ier_reg;
>  	const struct mxc_isi_set_thd *set_thd;
>  	const struct mxc_gasket_ops *gasket_ops;
> +	u32 format_mask;
>  	bool buf_active_reverse;
>  	bool has_36bit_dma;
>  };
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index 6aa760ce3605..2405f7d33d0a 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -410,13 +410,14 @@ void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
>  				       const struct mxc_isi_format_info *info,
>  				       struct v4l2_pix_format_mplane *format)
>  {
> +	const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
>  	u32 val;
>  
>  	/* set outbuf format */
>  	dev_dbg(pipe->isi->dev, "output format %p4cc", &format->pixelformat);
>  
>  	val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
> -	val &= ~CHNL_IMG_CTRL_FORMAT_MASK;
> +	val &= ~pdata->format_mask;
>  	val |= CHNL_IMG_CTRL_FORMAT(info->isi_out_format);
>  	mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
>  
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index e795f4daf3ff..7c4e736f4651 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -39,7 +39,6 @@
>  /* Channel Image Control Register */
>  #define CHNL_IMG_CTRL						0x0004
>  #define CHNL_IMG_CTRL_FORMAT(n)					((n) << 24)
> -#define CHNL_IMG_CTRL_FORMAT_MASK				GENMASK(29, 24)

Wouldn't it be simpler to extend this mask to 7 bits unconditionally ?
If bit 30 isn't used on older platforms, clearing it shouldn't cause
issues.

>  #define CHNL_IMG_CTRL_FORMAT_RGBA8888				0x00
>  #define CHNL_IMG_CTRL_FORMAT_ABGR8888				0x01
>  #define CHNL_IMG_CTRL_FORMAT_ARGB8888				0x02

-- 
Regards,

Laurent Pinchart

