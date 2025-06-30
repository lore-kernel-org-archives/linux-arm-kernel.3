Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EDFC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 23:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MoMuJvPuXqCkPnYCeujUH+TZ1/ZfD5QfrSpIB9wH9Lc=; b=FbV/Q+8laZD3DXsMBG7RnmMBMG
	PDoOjkaxj46mte88CiaLo1qbQTJwXZE6/Wvg6Ig5B9J/Q3ELAADHnyTTunmi4qJKbxxqihQs3KnrG
	jk2+RIQ1XzbsH05NUqRCCqE4PJrMdVBiMx+BEAWsFaWV6aJs6xBla5/q/Z6Ad6NPVBVaJwp6v9r9O
	E96/zwc+UUoGSRoV1ksg0N7+M3JBE6IFqqC6XhJjR+021faEJaVJedoMbV8816c7eJY1s15JaxnnF
	9IPB83QCfDJZlBALz7YGaXrg2PX0YZ2KOEzLhqWdclkXgIEUteviYo/mSBDoLUhd1h8NDZGc+vjfa
	DFo8vQiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWNZb-00000003fC8-15EY;
	Mon, 30 Jun 2025 23:06:03 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWNXB-00000003ez0-2EHd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 23:03:34 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 19694838;
	Tue,  1 Jul 2025 01:03:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751324590;
	bh=sWv863fyXuCrnXTBpsU+O9opYOp2wtSbPC8lgNg6dbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rl+RTzOxv+c6CaBMiG4nfFqUhF2iKYmXe98VcGiQWiLz5mUFxi48OCiX4syKITPCh
	 C4CiSNVute4XMfdZu14IMWcSaCEPckPaBOkKeU5NylRPgV5zB93WgCQqEIBVk+1A9M
	 Q5TbYzSnThwSnOXjRF7qijiNoM8D3+7DsCur8T5c=
Date: Tue, 1 Jul 2025 02:03:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH 1/5] media: nxp: isi: add support for UYVY8_2X8 and
 YUYV8_2X8 bus codes
Message-ID: <20250630230306.GF15184@pendragon.ideasonboard.com>
References: <20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com>
 <20250630-imx8qxp_pcam-v1-1-eccd38d99201@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630-imx8qxp_pcam-v1-1-eccd38d99201@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_160333_711485_C52A4BE5 
X-CRM114-Status: GOOD (  17.79  )
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

On Mon, Jun 30, 2025 at 06:28:17PM -0400, Frank Li wrote:
> From: Alice Yuan <alice.yuan@nxp.com>
> 
> Add support for media bus codes UYVY8_2X8 and YUYV8_2X8 in the ISI pipe.
> These formats are commonly used by sensors like ov5640, which typically
> uses MEDIA_BUS_FMT_YUYV8_2X8.
> 
> Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index d76eb58deb096..1a4bf1ac02641 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -39,6 +39,16 @@ static const struct mxc_isi_bus_format_info mxc_isi_bus_formats[] = {
>  		.output		= MEDIA_BUS_FMT_YUV8_1X24,
>  		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK),
>  		.encoding	= MXC_ISI_ENC_YUV,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_UYVY8_2X8,
> +		.output		= MEDIA_BUS_FMT_YUV8_1X24,
> +		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK),
> +		.encoding	= MXC_ISI_ENC_YUV,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
> +		.output		= MEDIA_BUS_FMT_YUV8_1X24,
> +		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK),
> +		.encoding	= MXC_ISI_ENC_YUV,

This doesn't seem quite right. The format here corresponds to the pixel
link interface between the ISI and its source. There's no difference in
this patch in in register values between MEDIA_BUS_FMT_UYVY8_2X8 and
MEDIA_BUS_FMT_UYVY8_1X16. I don't think the ISI would be able to
automatically differentiate between receiving UYVY on a 16-bit bus with
one clock per pixel, and receiving it on a 8-bit bus with two clocks per
pixel. I believe you should translate MEDIA_BUS_FMT_UYVY8_2X8 to
MEDIA_BUS_FMT_UYVY8_1X16 in the source subdev driver.

>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_YUV8_1X24,
>  		.output		= MEDIA_BUS_FMT_YUV8_1X24,

-- 
Regards,

Laurent Pinchart

