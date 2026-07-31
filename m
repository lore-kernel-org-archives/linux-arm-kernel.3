Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6D9C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 09:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwbZejQtpnuo86QdZNkvfiwPzfIoi9keDu3oZjpOvc0=; b=YjWcolc2Bn72R8FSMGGQBQFMfC
	4ZW6yIaDrRPGTktTk3OHdAadsQQ5lqWIxjWm3MLoPI1RRjjmYfUxC0eOd55CD/5slfSIo/qFxWeea
	NplJb556zK0N5L/hx55EWHkMuaZMmUbKyVjubHN/qF4Mgc29C6dMLiUeoS/0jgJdVfEuh1Ymqqk80
	rRK+ECRWPK4ic7ffdddGo7xazJ+46fssYDX2BafzMa7ZMr8WZ4ng9/A515ejkxRbMK5/m/6dCYZMz
	lcWqWVcCYkWFrQpomK9QG2GjNxoJCI5dnPkFBdi7XY14RUXWkWzJazSmym7p2f1IDccfCd8aH89NA
	j19fvykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjvY-0000000CF9p-1Vot;
	Fri, 31 Jul 2026 09:53:16 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjvV-0000000CF7b-0Ujx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 09:53:14 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47f84023916so801779f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 02:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785491591; x=1786096391; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fwbZejQtpnuo86QdZNkvfiwPzfIoi9keDu3oZjpOvc0=;
        b=D/mwx3LddvyjeTQm3PYB1sxCyQj7St5wH6QkL3VBj+k7M/U94AWc3tVhtkf+kU8hdc
         oct+VSyin4IeofPIvL7yFBIVVGgyuvmO/cV432tGbXsa1h8x8k/Cj1LwmlAbofWvc9JO
         7UOzR1VMLQQZolF98OzwYTN/vAScZU3NXsMeZws02VolpObcqKCM0/OcTYJo0JlReLZM
         MBmbB89/KYHj5qDCNu0uMeeWWiN5Z23Uv1C/Z2fsuIs8+soYoezg7fdEdGqQShoMKN85
         i3vL9aGxb+hDwAu4a+seCf6qv2wYnv3wZZBz+XMRjyTPD1qxXiN9F7JlfwF/Vvf0hZQf
         r8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785491591; x=1786096391;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwbZejQtpnuo86QdZNkvfiwPzfIoi9keDu3oZjpOvc0=;
        b=X8MmZdx4wXudtGXzngXYXsKHXpIs0afEI36V8ZD20e6LzVcAEmKs+7JcDdqS0uMl7n
         YG3+fH4nNuuhOIXaNdTrh85mfkul+R9qiMyVQt3jahH0xbbPcnEzPhQ7XjmwAFWJGh4N
         XDK4+ZdObHtE/FVdWtHGX2g/vBpskV4Lsjuc+/HAGaS3p+GAIsExfqZtLsxFobzpXkcG
         cPVw1uagcCOPQx6x786EoP9Q/fNmiWX/vLIorGP7c7KK9LkfxD0nujFHJ+/fqNAt5X1n
         Li1iBWM5TWZD9pGTY0wd9Bq5FB+HyW5UkXeTTt2K9TVxtIPdFQo0y61L7h55BcwVVLqM
         efMw==
X-Forwarded-Encrypted: i=1; AHgh+RpazJ0UWZc5/DTlE+0AUmS5AkI73uKtQ4TAFFSX6JRgZV9iJS1roemM0CpevSmHHDvVAFixZNCr6ugqhLpus1kV@lists.infradead.org
X-Gm-Message-State: AOJu0YzEE6Vry7Hmi4+tbdAc6yCAdNmcC7v8qDV9ZnW8N6QqObq5WRSw
	qhXgRvBxQ+4GiXcEtCYULmGpwu3oonK2IJ7cE/2YXkVaVKQdLRm5BWN2
X-Gm-Gg: AR+sD116hpdbDcALTIs7mWcbW3iKxJF6fYPChOYypewV9/3kJ/SGEzl/Mf+ZDSJiPxH
	AtS+0mXtHmY1EAnrZcRa0JGobaSrR5MLwXbcCpYnxsO6j1Q7HjQvF4lSDxxVnBxbcM/4XzUGDT0
	aNqVsYauic0O+ZX7ZSd8CVGZxLtcu4190JRSSgJCS94HYnT7dQNR1wUmH14pkZCiVsppXkUdFsG
	McbXqIlX+hOlCmKYhLRljMX21UT7SC0Ngk00CL099qYKSLPUi6kn+FiaOuJg4IiA3mOw3Trxq5O
	HFd7ogH7KbB2buzAeecK9Vcw6NUakIu6RPlWOP0Y0OMMiRRLEExKVMOEfomwB0m9oUWEKh1Kbao
	3nN+kTsRZ7yH1BfYqpNtu8dD9dBvLqflPrvw1+Nb79T73FWh1H7Zs4ubb9kQhGZIpKayt6DRjfB
	QlC96rAPXFnhEDLBDao04K8fEHTFGaromSBuQWHR5kSZca8qXtpoF9BqOcYup8dh2NGCiKLmzY7
	8lNBRzncNOXN7Gr2pFgfIwPfn67ydaGHN8dXmIVSf8qI/QSLZmVxVTYfxJ6kNX0Tex4slvHmraa
	s2K3kT1wRlXp+WRivVVLD0wUGlvzHfuqDcFAAdR14MmT9u9ukgPVLCEU+s29Kzy/R0mVXQdwpZx
	wJrBS5vd3Wg/BuJRNJ4y01wrSgQKp2qWANcIupS0CkK0ccmKppdDV6AmFfFB70+oA5T6eeL0=
X-Received: by 2002:a05:6000:712:b0:47f:9254:d453 with SMTP id ffacd0b85a97d-47fd2abbdf4mr3203164f8f.8.1785491591146;
        Fri, 31 Jul 2026 02:53:11 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0ae0sm2757970f8f.33.2026.07.31.02.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 02:53:10 -0700 (PDT)
Date: Fri, 31 Jul 2026 11:53:09 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, David Lechner
 <dlechner@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Subject: Re: [RESEND PATCH v2] iio: adc: bcm_iproc_adc: Convert probe() to
 use dev_err_probe()
Message-ID: <20260731115309.000073a3@gmail.com>
In-Reply-To: <20260730155712.374464-1-mdshahid03@gmail.com>
References: <20260730155712.374464-1-mdshahid03@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_025313_525853_12E7E473 
X-CRM114-Status: GOOD (  26.24  )
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

On Thu, 30 Jul 2026 21:27:12 +0530
mdshahid03@gmail.com wrote:

> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> Replace open-coded probe error handling with dev_err_probe() for
> resource acquisition and initialization failures.
> 
> This simplifies the error paths, avoids repetitive error handling,
> and automatically suppresses duplicate messages when -EPROBE_DEFER is
> returned while preserving the existing error messages.
> 
> Also remove the redundant error message after iproc_adc_enable(),
> allowing the error to be propagated without additional logging.

Separate patch for this along with the removal of dev_err() at
devm_request_threaded_irq(), see below.

> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
> v2:
> - Convert remaining probe error paths to use dev_err_probe().
> - Remove redundant error message after iproc_adc_enable()
>  drivers/iio/adc/bcm_iproc_adc.c | 52 +++++++++++++++------------------
>  1 file changed, 24 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
> index cf4738b16e62..08e056468d8e 100644
> --- a/drivers/iio/adc/bcm_iproc_adc.c
> +++ b/drivers/iio/adc/bcm_iproc_adc.c
> @@ -522,52 +522,48 @@ static int iproc_adc_probe(struct platform_device *pdev)
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

Given the amount of &pdev->dev calls, it would be a good idea to introduce a
local `struct device *dev = &pdev->dev;` in a separate patch which would go
before the dev_err_probe() patch.

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
>  
>  	adc_priv->irqno = platform_get_irq(pdev, 0);
>  	if (adc_priv->irqno < 0)
> -		return adc_priv->irqno;
> +		return dev_err_probe(&pdev->dev,
> +				     adc_priv->irqno,
> +				     "failed to get IRQ\n");

Remove this, platform_get_irq() already prints an error message, keep
the original.

>  
>  	ret = regmap_clear_bits(adc_priv->regmap, IPROC_REGCTL2,
>  				IPROC_ADC_AUXIN_SCAN_ENA);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to write IPROC_REGCTL2 %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(&pdev->dev,
> +				     ret,
> +				     "failed to write IPROC_REGCTL2\n");
>  
>  	ret = devm_request_threaded_irq(&pdev->dev, adc_priv->irqno,
>  				iproc_adc_interrupt_handler,
>  				iproc_adc_interrupt_thread,
>  				IRQF_SHARED, "iproc-adc", indio_dev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "request_irq error %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(&pdev->dev,
> +				     ret,
> +				     "failed to request IRQ\n");

You only need to return ret here, devm_request_threaded_irq() already
prints an error message on failure. Separate patch for the removal please
(ideally the first patch in your series to reduce churn).

>  
>  	ret = clk_prepare_enable(adc_priv->adc_clk);
> -	if (ret) {
> -		dev_err(&pdev->dev,
> -			"clk_prepare_enable failed %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(&pdev->dev,
> +				     ret,
> +				     "failed to enable clock\n");
>  
>  	ret = iproc_adc_enable(indio_dev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to enable adc %d\n", ret);
> +	if (ret)
>  		goto err_adc_enable;
> -	}
>  
>  	indio_dev->name = "iproc-static-adc";
>  	indio_dev->info = &iproc_adc_iio_info;

Also, you've missed an additional dev_err() in the iio_device_register()
check, you can change that one as well.

-- 
Kind regards,
Joshua Crofts

