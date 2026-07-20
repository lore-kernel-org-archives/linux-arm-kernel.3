Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A16FC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 21:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UORWlzuR87ddV1y9kbk83e+yBPXKxZg8m/FZaB94uWs=; b=DfxWpN9tmHgvfNivPADlok8QLj
	lyxTbVE35jLFsOF/LvivsWPBhlZSNIpAzgJJ+nlLbxuBPCLAWN84jbAD+ni99txf9Jl2eWdcbzkG1
	akx2QlRtUr2bhp4Jd5tbCEviigk9plsojHN8cpnjLouv9m/q+4S90jPAfVVvYicykN7M8fQXXJlOn
	YVxp/N/gYEdROjVAyNwoSnLrATqOBI40vPpV0Cc83Dv0a+oH9HsN12ruaUgkjpPHcxrJb6JQHQ5eS
	rzW1xkpcKsHqy7LDsXdMN77aBjm2RvYnZXCH1OToeiMRig16vpXvuDC+YpRGEc+xaypaYmr7e0Ikw
	ou9A4QEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvKp-00000007wAa-05LF;
	Mon, 20 Jul 2026 21:15:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvKl-00000007w9w-3WCH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 21:15:33 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16078C1;
	Mon, 20 Jul 2026 23:14:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784582071;
	bh=fwkvO1BlTuFLr5TUGCzW1d48NNwgkil0zWOpeTLxt3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a2vj4h5fb+jeY11Sxl4+xM2vB02xWxZmhqISZwnk38K2AFshkUYgo8wH3mDnooQOq
	 YcPww7sOzpbMtaR9spni/jA6FAE4mE5RzUxpDo2YTtMP5AMrEZcyEny99fcc3CZAfO
	 FvXoo2M2GGPJWnBY6tZJW+RUZO48CwPUybAMuWoU=
Date: Tue, 21 Jul 2026 00:15:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v2 4/6] media: nxp: imx8-isi: Add 16-bit raw Bayer format
 support
Message-ID: <20260720211528.GE50424@killaraus.ideasonboard.com>
References: <20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com>
 <20260720-isi-v2-4-45845bc5d4fa@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720-isi-v2-4-45845bc5d4fa@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_141532_024628_23030B47 
X-CRM114-Status: GOOD (  17.78  )
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

Hello Guoniu, Laurentiu,

Thank you for the patch.

On Mon, Jul 20, 2026 at 11:34:06AM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> 
> Add support for 16-bit raw Bayer formats (SBGGR16, SGBRG16, SGRBG16,
> SRGGB16) to both the pipeline subdev and video capture interface.
> 
> These formats are commonly used by high-end image sensors that output
> 16-bit raw data, enabling the ISI to process and capture full dynamic
> range from such sensors.

It's not really high-end any more :-) Lots of sensors can output RAW16
today.

> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 24 +++++++++++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 36 ++++++++++++++++++++++
>  2 files changed, 60 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index 2d0843c86534..e58925d71164 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -179,6 +179,30 @@ static const struct mxc_isi_bus_format_info mxc_isi_bus_formats[] = {
>  		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
>  				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
>  		.encoding	= MXC_ISI_ENC_RAW,

While at it, could you please also add support for
MEDIA_BUS_FMT_Y16_1X16, for 16-bit monochrome sensors (here and in
mxc_isi_formats) ? With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SBGGR16_1X16,
> +		.output		= MEDIA_BUS_FMT_SBGGR16_1X16,
> +		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
> +				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGBRG16_1X16,
> +		.output		= MEDIA_BUS_FMT_SGBRG16_1X16,
> +		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
> +				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGRBG16_1X16,
> +		.output		= MEDIA_BUS_FMT_SGRBG16_1X16,
> +		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
> +				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SRGGB16_1X16,
> +		.output		= MEDIA_BUS_FMT_SRGGB16_1X16,
> +		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
> +				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +		.encoding	= MXC_ISI_ENC_RAW,
>  	},
>  	/* JPEG */
>  	{
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index fe4adfa3a1f0..5eb448f4c26f 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -356,6 +356,42 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.color_planes	= 1,
>  		.depth		= { 16 },
>  		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SBGGR16_1X16,
> +		.fourcc		= V4L2_PIX_FMT_SBGGR16,
> +		.type		= MXC_ISI_VIDEO_CAP,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 16 },
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGBRG16_1X16,
> +		.fourcc		= V4L2_PIX_FMT_SGBRG16,
> +		.type		= MXC_ISI_VIDEO_CAP,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 16 },
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGRBG16_1X16,
> +		.fourcc		= V4L2_PIX_FMT_SGRBG16,
> +		.type		= MXC_ISI_VIDEO_CAP,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 16 },
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SRGGB16_1X16,
> +		.fourcc		= V4L2_PIX_FMT_SRGGB16,
> +		.type		= MXC_ISI_VIDEO_CAP,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 16 },
> +		.encoding	= MXC_ISI_ENC_RAW,
>  	},
>  	/* JPEG */
>  	{

-- 
Regards,

Laurent Pinchart

