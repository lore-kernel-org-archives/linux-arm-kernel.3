Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765A4C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzK2uV3jM7LNAvY+RCE19QMNrszM78M3cKYaB4hIw+M=; b=GZULC36R8HzDqhP1nVxOtc8SGg
	3f1/pCOKmCtINjztsPxxYTVJT6+wz6zh67E/gxtOmdcxt70yt2xdZZhK9etgVPeN7TEWDP38JM9xz
	awlFVXaFaopydR5mH33bi6Fp9MXkP5tu3GOrK9hYLY1LL1hPe3ErFPHO+0oNqUbpP8iuHuHI5rzTt
	VtlxqSydDSJqcOWPTi6iKVsaiFJ12zNRbsCke+odvEngNxhc/RDpfeQ7cWkNUCygH+9wrv7+3q4WT
	b+JRx88cQRaHeW9GXk1yNfLaGxr7f9di6w2Vz45Mb6/el0jLANW9V5HgLW3+jm19QamEoBfTMDmzi
	gZMpUYKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlryL-00000007Z5z-0rWb;
	Mon, 20 Jul 2026 17:40:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlryH-00000007Z5J-3jLL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:40:07 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42292289;
	Mon, 20 Jul 2026 19:39:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784569145;
	bh=e5OrRvxSiFTa/QC9cW29fVTOig3L9LCGIe18h8M+WF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lgCPsP91d7hkqCuMK8yrsy8hrbbKGZAqer2zMO7QBSMdSuh6Ea3eub82Tk2We03fe
	 sUtlMsf6UTVx45Bv/i2WffIvAA5eq4LyFdcr/vg/UiL2G/pu6X2qoNTjsow1Ko9KZ+
	 vz4NHCeF2tcp5bV6UHmixL+JBx0ExQSaiIGOPPpI=
Date: Mon, 20 Jul 2026 20:40:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
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
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 5/6] media: nxp: imx8-isi: Correct color map between
 V4L2 and ISI
Message-ID: <20260720174002.GC50424@killaraus.ideasonboard.com>
References: <20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com>
 <20260720-isi-v2-5-45845bc5d4fa@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720-isi-v2-5-45845bc5d4fa@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_104006_098414_5635C563 
X-CRM114-Status: GOOD (  16.00  )
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

Hi Guoniu,

On Mon, Jul 20, 2026 at 11:34:07AM +0800, Guoniu Zhou wrote:
> Fix the ISI input format for the color map V4L2_PIX_FMT_XBGR32 in
> memory-to-memory mode.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Tentatively,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'm running a build to test this change.

> ---
> Changes in v2:
> - Reword commit description for clarity (Frank Li)
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 5eb448f4c26f..05b51b98344b 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -151,7 +151,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.fourcc		= V4L2_PIX_FMT_XBGR32,
>  		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
>  				| MXC_ISI_VIDEO_M2M_CAP,
> -		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
> +		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XRGB8,
>  		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_XRGB888,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,

-- 
Regards,

Laurent Pinchart

