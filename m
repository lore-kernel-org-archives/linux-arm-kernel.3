Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B2DC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 02:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8gGVaqhMM6oty27Z2QyYNDyN7nHEV0g8AXLNh84UazY=; b=Ah+9oerE7Z7Mb2GWawEYC0mm6j
	15FUZ7TQV8sxDV7cAr8dihdIUm54SMZPIzs9q2wLuBvWonKVP8rjfYU2W01XGgAAwpixjqAXXBWge
	Efw1vW0NqV8wI/DAvWw8OX/hMWyw8KgG+4GxjhUh4sPiVesen5SonhNxN7A6HaNk+/eoPKz3BScP5
	D6vaYT/DDl3UR7Sxzt+hxwMUONWnsOejhdH4fDk0mCe6EJUIKM1a58qfIWYcoox+NG7QT2z+QMyms
	fxC21CN13LXnTAy+pvy3x/QQYW3OMNhZFnX4SugCCLrqb1Y1keMC6bleLO4xaqe5kLyVfsBHpHois
	paK22+kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woBGL-00000001pr4-1dMH;
	Mon, 27 Jul 2026 02:40:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woBGK-00000001pqx-1TnH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 02:40:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 11252600D8;
	Mon, 27 Jul 2026 02:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 494D21F000E9;
	Mon, 27 Jul 2026 02:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785120014;
	bh=8gGVaqhMM6oty27Z2QyYNDyN7nHEV0g8AXLNh84UazY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MmnPZ8r1N2DP2awT0imlw1xCiMZ3q6s3T6UawUAJTbEX1lxJwEzgONztghtNMiY2Q
	 BX2rYcSue1uMEXiP6NY+yvPGMtzYBDDhjKxC3uDM/PO+s1FsM+DLmhx8Vhs7unB2wH
	 zCOE3dj/mz1S27dF81y6fU+xH/IC7ITunGG7/wCeHw65Lvpw5NEU9KGcJaEpcJlq2q
	 5ad1/uBHL9i+la2IdwGjHcxaVG4hRkw1xHTl8lt4NlzoanVRVEr8EcuwxPpVhlJBBg
	 P5L49x/wD84uxCPmD7EH7jt0F9vhn7toehX5hiKEXk0Y6xRIOZKSnTZ3oj3vIuYFGu
	 b4OzHGrbbphzA==
Date: Mon, 27 Jul 2026 03:40:09 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: mdshahid03@gmail.com
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Broadcom internal
 kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: bcm_iproc_adc: Use dev_err_probe() for
 resource acquisition failures
Message-ID: <20260727034009.5c6b0be9@jic23-huawei>
In-Reply-To: <20260726180319.315016-1-mdshahid03@gmail.com>
References: <20260726180319.315016-1-mdshahid03@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sun, 26 Jul 2026 23:33:19 +0530
mdshahid03@gmail.com wrote:

> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> Replace open-coded dev_err() and error returns with dev_err_probe()
> for failures from syscon_regmap_lookup_by_phandle() and devm_clk_get()
> in the probe path.
> 
> This simplifies error handling and properly handles deferred probing.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  drivers/iio/adc/bcm_iproc_adc.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
> index cf4738b16e62..62f12eecc8b2 100644
> --- a/drivers/iio/adc/bcm_iproc_adc.c
> +++ b/drivers/iio/adc/bcm_iproc_adc.c
> @@ -522,19 +522,16 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  
>  	adc_priv->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
>  			   "adc-syscon");
> -	if (IS_ERR(adc_priv->regmap)) {
> -		dev_err(&pdev->dev, "failed to get handle for tsc syscon\n");
> -		ret = PTR_ERR(adc_priv->regmap);
> -		return ret;
> -	}
> +	if (IS_ERR(adc_priv->regmap))
> +		return dev_err_probe(&pdev->dev,
> +				     PTR_ERR(adc_priv->regmap),
> +				     "failed to get handle for tsc syscon\n");
>  
>  	adc_priv->adc_clk = devm_clk_get(&pdev->dev, "tsc_clk");
> -	if (IS_ERR(adc_priv->adc_clk)) {
> -		dev_err(&pdev->dev,
> -			"failed getting clock tsc_clk\n");
> -		ret = PTR_ERR(adc_priv->adc_clk);
> -		return ret;
> -	}
> +	if (IS_ERR(adc_priv->adc_clk))
> +		return dev_err_probe(&pdev->dev,
> +				     PTR_ERR(adc_priv->adc_clk),
> +				     "failed getting clock tsc_clk\n");

Why stop here?  There seem to be a number of other prints that follow
that would benefit from dev_err_probe() at least in terms of simplifying
the code if not due to the handling of potential deferred probes.

Please look at them all but also consider if the print is necessary.
Beware there are some mass removal patches dropping some specific
prints so you may cross with those.

Jonathan
>  
>  	adc_priv->irqno = platform_get_irq(pdev, 0);
>  	if (adc_priv->irqno < 0)


