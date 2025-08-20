Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24804CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 00:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YyOEsX+fKcOuKZHA8rRpVPY7CJ056q5zQ3tA36ipMHk=; b=n0qxj8sm2o1ouMMjBld9Y5t6Ju
	NMl2pvOBExvNpxVWZPgCMAXSa2XBwFOmd1q0aQ9oDBmeomLUyz783nlomh60I4pTKgGXeQyfxyaHY
	3ctSjiW/f+EWSgirzMf9qbjgEKlsvhsiZVIn6mFLNGntp6L5DQVMqfnC3E0D3AG7mYL1cjgSiKXzJ
	Rus4me9pUplpno9TBgkxURuUndLtw1lfpIj1UDDNzzYcea8zLLrF9bEyfwT/G+zKMyv9l5BFZ3qpQ
	9Sz6BO2P43OIyWr5RCZ+Gtq7gBFlmjsoibDO9rLJKjZPCodNfcWSXcOg9wLooZlQSzkdSnW8m1JGR
	0zGHiQxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uot9N-0000000FIs8-37it;
	Thu, 21 Aug 2025 00:27:29 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uooJA-0000000Ekdi-3gPk;
	Wed, 20 Aug 2025 19:17:18 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 78A056A6;
	Wed, 20 Aug 2025 21:16:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755717376;
	bh=0/A8H1icU7FHYjzi9o9I32XxVYe3rNCvwIhcn7eOUVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lq6YGCZqiJjWB+4roTs5N/By7nrBAZ5l0TnHKytw1JW6ZWhR9Vu5xdjZ3rqh9JNnm
	 9K85WLCDazpXukhKoWkJ+oM0FgLiyi0iLEuR1Mw4GwlrCrRUMogeVMr7nDDHGaIYbM
	 z4KdIfWJx0BtWK137W5ByY775Z0y6gM/41I0Ulmg=
Date: Wed, 20 Aug 2025 22:16:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 04/32] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_dt()
Message-ID: <20250820191651.GB1722@pendragon.ideasonboard.com>
References: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
 <20250808-95_cam-v2-4-4b29fa6919a7@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250808-95_cam-v2-4-4b29fa6919a7@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_121717_058741_4C54D3A2 
X-CRM114-Status: GOOD (  21.00  )
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

Hi Frank,

Thank you for the patch.

On Fri, Aug 08, 2025 at 06:39:07PM -0400, Frank Li wrote:
> CSI2 data type is defined by MIPI Camera Serial Interface 2 Spec Ver4.1.
> See section 9.4.
> 
> Add helper function media_bus_fmt_to_csi2_dt() to convert media bus fmt to
> MIPI defined data type and avoid below duplicated static array in each CSI2
> drivers.
> 
> 	{
> 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> 		.data_type = MIPI_CSI2_DT_YUV422_8B,
> 	}
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 44 +++++++++++++++++++++++++++++++++++
>  include/media/mipi-csi2.h             |  3 +++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 3a48b6a55c6e322696b910dd519def4f0b4a58fb..fcc01030beb347499da2a3c8539793d20f6f512c 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -701,6 +701,50 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
>  
> +int media_bus_fmt_to_csi2_dt(int bus_fmt)
> +{
> +	switch (bus_fmt) {
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +		return MIPI_CSI2_DT_YUV422_8B;
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		return MIPI_CSI2_DT_RGB565;
> +	case MEDIA_BUS_FMT_BGR888_1X24:
> +		return MIPI_CSI2_DT_RGB888;
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +	case MEDIA_BUS_FMT_Y8_1X8:
> +		return MIPI_CSI2_DT_RAW8;
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +	case MEDIA_BUS_FMT_Y10_1X10:
> +		return MIPI_CSI2_DT_RAW10;
> +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +	case MEDIA_BUS_FMT_Y12_1X12:
> +		return MIPI_CSI2_DT_RAW12;
> +	case MEDIA_BUS_FMT_SBGGR14_1X14:
> +	case MEDIA_BUS_FMT_SGBRG14_1X14:
> +	case MEDIA_BUS_FMT_SGRBG14_1X14:
> +	case MEDIA_BUS_FMT_SRGGB14_1X14:
> +		return MIPI_CSI2_DT_RAW14;
> +	case MEDIA_BUS_FMT_SBGGR16_1X16:
> +	case MEDIA_BUS_FMT_SGBRG16_1X16:
> +	case MEDIA_BUS_FMT_SGRBG16_1X16:
> +	case MEDIA_BUS_FMT_SRGGB16_1X16:
> +		return MIPI_CSI2_DT_RAW16;
> +
> +	default:
> +		return MIPI_CSI2_DT_NULL;

I would use 0 here. MIPI_CSI2_DT_NULL is equal to 0x10, and I'm
concerned about driver comparing the return value of the function to 0.

> +	}
> +}
> +EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_dt);
> +

We have something similar for pixel formats, with the v4l2_format_info
structure and the v4l2_format_info() lookup function. Adding information
about media bus formats to the V4L2 core seems to be a good idea.

Regarding the implementation, I think you should mimick what we do for
the pixel formats, and add the data to an info structure with a lookup
function.

>  int media_bus_fmt_to_csi2_bpp(int bus_fmt)
>  {
>  	switch (bus_fmt) {
> diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
> index c5b4e8e1ca93803568b1eee85f7f99c3a45a0b6e..35de536b9b65b49ad9e2914437d26d0e4240cf38 100644
> --- a/include/media/mipi-csi2.h
> +++ b/include/media/mipi-csi2.h
> @@ -8,6 +8,8 @@
>  #ifndef _MEDIA_MIPI_CSI2_H
>  #define _MEDIA_MIPI_CSI2_H
>  
> +/* DT value ref to MIPI Camera Serial Interface 2 Spec Ver4.1 section 9.4 */
> +
>  /* Short packet data types */
>  #define MIPI_CSI2_DT_FS			0x00
>  #define MIPI_CSI2_DT_FE			0x01
> @@ -44,6 +46,7 @@
>  #define MIPI_CSI2_DT_RAW20		0x2f
>  #define MIPI_CSI2_DT_USER_DEFINED(n)	(0x30 + (n))	/* 0..7 */
>  
> +int media_bus_fmt_to_csi2_dt(int buf_fmt);
>  int media_bus_fmt_to_csi2_bpp(int bus_fmt);
>  
>  #endif /* _MEDIA_MIPI_CSI2_H */
> 
> 

-- 
Regards,

Laurent Pinchart

