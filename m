Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB30CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 01:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yB6sQuoxIrStAJiD+3OYFTTHYglYUSCUWDl/1PQcws=; b=lcq7od2dv6voI/aWZYmkmjA+dI
	aH7Xu/JSlTJODfkGuyc+/ikvwTY+LPyXOGjBVZxJF3W5cpxIyW4OOvgRoYH1uZmhbjncd3MCrROe7
	FtY7so4LhNESW/R4E3lxOMYJAve67l05gjd5O71BzbyuzMXFXc0djtYHR7xkWa0Ff1i3hnNTTxXcu
	47TArSR5MDiHrv8pZcUkVi4WNl4rkA2xzwMYro0lEhvJsPEkdT4wxwz+BSGa+lkuFw30oQ5XkfpUR
	RGMkCB/550QsIP2als/QCbByRKLDYrE6J/C6DSXM11dh6Cn+tlsjEHPkpf6IL4FCPI4oaBIWkrIt5
	qQTo77Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBti-0000000CwQy-0If2;
	Mon, 27 Oct 2025 01:19:46 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBte-0000000CwQE-41fd;
	Mon, 27 Oct 2025 01:19:44 +0000
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8594D14A6;
	Mon, 27 Oct 2025 02:17:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761527873;
	bh=FS+KlOZTayfUweHo35RYfizlXiiTS/dCMqOAye4j6/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSr4M6GXYmVqXJ9DNbAIsvskO1G8IzD4w5TqPONHF5q/NBWj+wASYuTLdhVHb38C2
	 7YKeykbbg0p9Y3WWXgQjfVYQejOJXz1HsTyGjxy1DTjXtadyc/uwMysXRqBDDPCp/p
	 1q1pdqj5EsuYsjtJ1H0vlJ1rVgpwGLaEfTbbQTHY=
Date: Mon, 27 Oct 2025 03:19:27 +0200
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
Subject: Re: [PATCH v3 02/31] media: v4l2-common: Add helper function
 v4l_get_required_align_by_bpp()
Message-ID: <20251027011927.GS13023@pendragon.ideasonboard.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-2-c9286fbb34b9@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250821-95_cam-v3-2-c9286fbb34b9@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_181943_140100_A7A3A9E7 
X-CRM114-Status: GOOD (  25.77  )
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

On Thu, Aug 21, 2025 at 04:15:37PM -0400, Frank Li wrote:
> Add helper v4l_get_required_align_by_bpp() to help get width alignment
> requirement. Basic replace below logic and enhance to any 2^[0..31] in
> drivers/media/platform/nxp/imx-mipi-csis.c
> 
> mipi_csis_set_fmt(
> {
>         ...
> 
>         switch (csis_fmt->width % 8) {
>         case 0:
>                 align = 0;
>                 break;
>         case 4:
>                 align = 1;
>                 break;
>         case 2:
>         case 6:
>                 align = 2;
>                 break;
>         default:
>                 /* 1, 3, 5, 7 */
>                 align = 3;
>                 break;
>         }
> 	...
> }
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> The same patch will be see at https://lore.kernel.org/imx/20250729-imx8qxp_pcam-v4-2-4dfca4ed2f87@nxp.com/
> dw csi2 patch also this
> ---
>  include/media/v4l2-common.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 39dd0c78d70f7b935c2e10f9767646d2cedd3079..0a9da5e8daaddf26903d9ff4bed08b283dcd38b2 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -704,4 +704,34 @@ static inline bool v4l2_is_quant_valid(__u8 quantization)
>  	       quantization == V4L2_QUANTIZATION_LIM_RANGE;
>  }
>  
> +/**
> + * v4l_get_required_align_by_bpp - get align requirement for
> + *	v4l_bound_align_image(). (bpp * width) % (1 << align) have to be 0.
> + *	given number bpp, get width's alignment requirement. For example,
> + *	if align is 3, means require bpp * width must be multiples of 8.
> + *	    bpp     return  width's requirememnt
> + *	    0       0       none
> + *	    1       3       8 (need 3 zero bits)
> + *	    2       2       4
> + *	    3       3       8
> + *	    4       1       2
> + *	    5       3       8
> + *	    6       2       4
> + *	    7       3       8

This is supposed to be a brief one-line description. The rest of the
documentation goes after the argument.

Also, have checked the formatting of the generated documentation ?

> + * @bpp: input bpp

I have no idea if this is a bits per pixel or bytes per pixel value. I'm
actually not sure what the function is even supposed to do. It feels
it's really a ad-hoc helper, I would like to see it being used in
multiple drivers to see if it makes sense.

> + * @align: expected alignment, 2^(align).
> + *
> + * return: required alignment.
> + */
> +static inline u32 v4l_get_required_align_by_bpp(u32 bpp, u32 align)
> +{
> +	int pos;
> +
> +	if (bpp == 0)
> +		return 0;
> +
> +	pos = ffs(bpp) - 1;
> +	return pos > align ? 0 : align - pos;
> +}
> +
>  #endif /* V4L2_COMMON_H_ */
> 

-- 
Regards,

Laurent Pinchart

