Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64BAD6A25B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 00:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10wE5VWzdx1j1JcUsuVVk9tMb3pBhzr4nB7jpXTE2Zg=; b=SATOolcY6G9hNeoRSYTpZZTbKw
	hPQrOQtKQFCV6TmkpPg7KP/u9gC/4NFDndHNRMzL9bVEWYp4qWIHlXKRL2X281RmQIYA/EJCqJ1LM
	U5c9lSQ4GALbAtBljdFIR0OSeBnzGzMObKuE3hD4uFWVv/T14xJtmPtUeUmFOUVp+2JmqE28vip05
	aGj4rJXbQXl1sQnT6apogIu28nb17jiBPPPP9BknKzYF/Sc2f5ws9Ruu8RzJ6zNUtGZ3zsEbvAtzJ
	ydK9RvlGgwCm1v7hJp1oSTNMvESkOJ5P+YIyxG+jv12I9CFVrNt4tBkJpIy1trfXNAYSFLw+1LEHW
	iqL4ocXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBjmC-00000001AtY-0sSZ;
	Fri, 15 Nov 2024 00:01:28 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBjlG-00000001Am6-0RlK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 00:00:31 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A70BBFF1;
	Fri, 15 Nov 2024 01:00:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731628811;
	bh=seximQ95TY/KDhb+vB8Hrmxf7e199hCpmjuNkdXkuG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KIb6hzSjvZi+J215tZhJkpOSoFXv9XqPGhABEBwjpXQ4B6N+OPgaj15PQGDZO4pgG
	 pKW5P8w1nGcKc5bGr2PBfR7q5jQey9fnnYvZSfTfFtY41ijd0Ze6hX8Q+iawcm0wIh
	 XZ3nwvYYRJhkMlpoqSZ5EaeR/3UouV089nRb9ztc=
Date: Fri, 15 Nov 2024 02:00:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] media: i2c: imx290: Limit analogue gain according to
 module
Message-ID: <20241115000017.GH31681@pendragon.ideasonboard.com>
References: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
 <20241114-media-imx290-imx462-v1-1-c538a2e24786@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241114-media-imx290-imx462-v1-1-c538a2e24786@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_160030_285879_B32EA3D5 
X-CRM114-Status: GOOD (  24.09  )
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

Hi Dave,

Thank you for the patch.

On Thu, Nov 14, 2024 at 04:01:13PM +0000, Dave Stevenson wrote:
> The imx327 only supports up to 29.4dB of analogue gain, vs
> the imx290 going up to 30dB. Both are in 0.3dB steps.
> 
> As we now have model specific config, fix this mismatch,
> and delete the comment referencing it.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx290.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index ee698c99001d..da654deb444a 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -176,6 +176,7 @@ struct imx290_model_info {
>  	enum imx290_colour_variant colour_variant;
>  	const struct cci_reg_sequence *init_regs;
>  	size_t init_regs_num;
> +	unsigned int max_analog_gain;
>  	const char *name;
>  };
>  
> @@ -876,14 +877,10 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  	 * up to 72.0dB (240) add further digital gain. Limit the range to
>  	 * analog gain only, support for digital gain can be added separately
>  	 * if needed.
> -	 *
> -	 * The IMX327 and IMX462 are largely compatible with the IMX290, but
> -	 * have an analog gain range of 0.0dB to 29.4dB and 42dB of digital
> -	 * gain. When support for those sensors gets added to the driver, the
> -	 * gain control should be adjusted accordingly.
>  	 */
>  	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> -			  V4L2_CID_ANALOGUE_GAIN, 0, 100, 1, 0);
> +			  V4L2_CID_ANALOGUE_GAIN, 0,
> +			  imx290->model->max_analog_gain, 1, 0);
>  
>  	/*
>  	 * Correct range will be determined through imx290_ctrl_update setting
> @@ -1441,18 +1438,21 @@ static const struct imx290_model_info imx290_models[] = {
>  		.colour_variant = IMX290_VARIANT_COLOUR,
>  		.init_regs = imx290_global_init_settings_290,
>  		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_290),
> +		.max_analog_gain = 100,
>  		.name = "imx290",
>  	},
>  	[IMX290_MODEL_IMX290LLR] = {
>  		.colour_variant = IMX290_VARIANT_MONO,
>  		.init_regs = imx290_global_init_settings_290,
>  		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_290),
> +		.max_analog_gain = 100,
>  		.name = "imx290",
>  	},
>  	[IMX290_MODEL_IMX327LQR] = {
>  		.colour_variant = IMX290_VARIANT_COLOUR,
>  		.init_regs = imx290_global_init_settings_327,
>  		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_327),
> +		.max_analog_gain = 98,
>  		.name = "imx327",
>  	},
>  };
> 

-- 
Regards,

Laurent Pinchart

