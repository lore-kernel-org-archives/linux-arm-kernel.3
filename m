Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302CEC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 02:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpl02wFSQUzfqIkSPliw06Gp8adNirX4z9LPQ52Pyoc=; b=GvMNRFGwvS7Pb0+hYZ44z3SN8m
	+6L6nUNgZ4T1KZEbn5hwAp8xGbu3qVg7FDgGBEP6hJxZk+za/RxdGhQDV7O+qJc+0Gg+dfW3ekcHK
	0U5KWrthUtyEfHVHKK1TeRB9LqEM1EaZ8vqucF4SBTxC5L8ZkkBqg21L8QH3IuEPGH0uhdi8ANGGh
	N3MEKbq5WPNIe5i75mAs2bvWUfNWCPlPRla1VkSn3mYRX8nTygGV6rSmwRzoZVasyjgsPUvgWO5lt
	FWLNZJk5LA/eq3SSapTTvRGQYkXB6mHrxQGaczP8H/ilTvbAp0fKGWd8p5OZ5IFAtz3AQtjUV+k1M
	OtnwwwBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqLZA-0000000FGdh-02Bu;
	Sun, 02 Aug 2026 02:04:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqLZ8-0000000FGdT-3d0g
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 02:04:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E55A06057A;
	Sun,  2 Aug 2026 02:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C761F00AC4;
	Sun,  2 Aug 2026 02:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785636277;
	bh=wpl02wFSQUzfqIkSPliw06Gp8adNirX4z9LPQ52Pyoc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=CMiGMS1jP6rl5SRFkGe1GyfGx+nkF27OZQoj2S2oyeuHlfyeUx6XwCWR0lGxUYvy+
	 kskAM6uVTKhSKLOTW13V1zfMZ7qky2AkdB+uzjcqI0bE3c4A9HW0kJQ+b3okY1oZMY
	 sRTjww7zazHYe61GKsjFuOaLvFWf5nr4MZw96i1vSezSqm8+IvjTRnPfO6y/9iqfeR
	 SCWT3kxoI9lGyz69Ez8RaEan7h1P/FfnS6NRr59pPpEEn01914Wxobz4lKO9e5TXof
	 EDGFZEgGj1AHG0C4GA23EXo0jQjIwCT57hBPvZ3KHEdyZ5lYfX/QbrfG1O8Bd4WfoJ
	 ASPscnS7VEKQQ==
Date: Sun, 2 Aug 2026 03:04:33 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: mdshahid03@gmail.com
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Joshua Crofts
 <joshua.crofts@broadcom.com>, Broadcom internal kernel list
 <bcm-kernel-feedback-list@broadcom.com>, David Lechner
 <dlechner@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Ray Jui <rjui@broadcom.com>, Scott
 Branden <sbranden@broadcom.com>
Subject: Re: [PATCH v3 3/3] iio: adc: bcm_iproc_adc: Convert probe error
 handling to dev_err_probe()
Message-ID: <20260802030433.696454fe@jic23-huawei>
In-Reply-To: <20260731182347.42888-4-mdshahid03@gmail.com>
References: <20260731182347.42888-1-mdshahid03@gmail.com>
	<20260731182347.42888-4-mdshahid03@gmail.com>
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

On Fri, 31 Jul 2026 23:53:47 +0530
mdshahid03@gmail.com wrote:

> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> This simplifies the probe error handling by replacing open-coded
> dev_err() and return sequences. Also remove the redundant
> dev_err() after iproc_adc_enable(), as the helper already reports
> the failure.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  drivers/iio/adc/bcm_iproc_adc.c | 43 +++++++++++++++------------------
>  1 file changed, 19 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
> index 29ea35972a23..5fcd528eb88a 100644
> --- a/drivers/iio/adc/bcm_iproc_adc.c
> +++ b/drivers/iio/adc/bcm_iproc_adc.c
> @@ -523,19 +523,16 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  
>  	adc_priv->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
>  			   "adc-syscon");
> -	if (IS_ERR(adc_priv->regmap)) {
> -		dev_err(dev, "failed to get handle for tsc syscon\n");
> -		ret = PTR_ERR(adc_priv->regmap);
> -		return ret;
> -	}
> +	if (IS_ERR(adc_priv->regmap))
> +		return dev_err_probe(dev,
> +				     PTR_ERR(adc_priv->regmap),
> +				     "failed to get handle for tsc syscon\n");

Look for places to wrap less as part of this change. E.g.
		return dev_err_probe(dev, PTR_ERR(adc_priv->regmap),
				     "failed to get handle for tsc syscon\n");

>  
>  	adc_priv->adc_clk = devm_clk_get(dev, "tsc_clk");
> -	if (IS_ERR(adc_priv->adc_clk)) {
> -		dev_err(dev,
> -			"failed getting clock tsc_clk\n");
> -		ret = PTR_ERR(adc_priv->adc_clk);
> -		return ret;
> -	}
> +	if (IS_ERR(adc_priv->adc_clk))
> +		return dev_err_probe(dev,
> +				     PTR_ERR(adc_priv->adc_clk),
Same here.
> +				     "failed getting clock tsc_clk\n");
>  
>  	adc_priv->irqno = platform_get_irq(pdev, 0);
>  	if (adc_priv->irqno < 0)
> @@ -543,10 +540,10 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  
>  	ret = regmap_clear_bits(adc_priv->regmap, IPROC_REGCTL2,
>  				IPROC_ADC_AUXIN_SCAN_ENA);
> -	if (ret) {
> -		dev_err(dev, "failed to write IPROC_REGCTL2 %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev,
Definitely the same here!
> +				     ret,
> +				     "failed to write IPROC_REGCTL2\n");
>  
>  	ret = devm_request_threaded_irq(dev, adc_priv->irqno,
>  				iproc_adc_interrupt_handler,
> @@ -556,17 +553,14 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	ret = clk_prepare_enable(adc_priv->adc_clk);

This should be combined with the get (be careful on ordering

> -	if (ret) {
> -		dev_err(dev,
> -			"clk_prepare_enable failed %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev,
and here.

The local style before this patch was a bit odd. No need to keep it.

> +				     ret,
> +				     "failed to enable clock\n");
>  
>  	ret = iproc_adc_enable(indio_dev);
> -	if (ret) {
> -		dev_err(dev, "failed to enable adc %d\n", ret);
> +	if (ret)
>  		goto err_adc_enable;
Look at converting the whole thing to devm managed cleanup.  You'll
need one custom cleanup function and devm_add_action_or_reset()

> -	}
>  
>  	indio_dev->name = "iproc-static-adc";
>  	indio_dev->info = &iproc_adc_iio_info;
> @@ -576,7 +570,8 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  
>  	ret = iio_device_register(indio_dev);
>  	if (ret) {
> -		dev_err(dev, "iio_device_register failed:err %d\n", ret);
> +		dev_err_probe(dev, ret,
> +			      "failed to register IIO device\n");
dev_err_probe() is as you see much less of an improvement when
we aren't returning.  If we switch the whole thing to devm managed
cleanup then we will be returning here.   If you make that change
I don't mind if you flip to return dev_err_probe() directly in that
patch to avoid unnecessary code churn.

thanks

Jonathan

>  		goto err_clk;
>  	}
>  


