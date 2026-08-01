Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F278C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 06:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shXI5gTecK3XzXEfQhSt8Ph409l47ex30hjHXtZWBBA=; b=dp/C+G5k+czQNRfG0iycVUCHix
	2OsAIhafZbif6jnghuS02wwTDRDFiBh92rB635ZOdp/s3suqlm+/8+/LhLYv/++VG0mRF9sfhCnKL
	m4yQnZSGQX7gkQSztp0WKYUG0x6+mlgPbmRLmhVcn1dkfApqgJ95xFKJdVoNNJfaKqvR5Co7Z+Kt0
	3jxVCw6J/Vez5ED2LJYPPV5ADhvVMD/hjrvMc6N6D4yjBUmoAvcBDUE3REzs63JoxSeoaEh+wGXA1
	PLpGc5eDXA4nRmKt6KzhXNuzd6DhFSfzaFJIFbaDN2JPTkZHgB52IRsCQPtltfHyq/gK6nGM9trla
	qLiqOJ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq3TF-0000000DxGL-1VIK;
	Sat, 01 Aug 2026 06:45:21 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq3TD-0000000DxFz-16k7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 06:45:20 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso1126010f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 23:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785566717; x=1786171517; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=shXI5gTecK3XzXEfQhSt8Ph409l47ex30hjHXtZWBBA=;
        b=DiKywel/6myZRkA5Mp/DvkvC165CvjgRhFZ+O5wB71RHYNokTItQSbusMac9xMnb5n
         6asZMqkwjz7MlpEY4I0lsAyEgtFmnHWPXpFPdrdHmuItflBrKAFaUdscPeWgIvoBnFJh
         sas7iHhwtyumVZ0knZ/3VqmJSYGWWGT+fbOYqqNtNyhCUYs1WH+nWy/fJSkcDrmK3mWR
         cVsqQ0slu60lTg7AIWmMeYah8BYvPPUneN4LTXFWQW71dhjHamHlzVg6lVn9UInFBpTs
         jkjGPj8UJtE4kcT/CfhidH6viM5eHlaMxIvYpwDCxxRZMhcxiAHUCjMEj2vXGi4AqgsX
         ytfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785566717; x=1786171517;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=shXI5gTecK3XzXEfQhSt8Ph409l47ex30hjHXtZWBBA=;
        b=qwx8DrVuWOkYMf6XlXTdRp4JnkusXwRPR9/XLYHEy4Mx3KrJXdG5a27ZNgPqT1ZgWg
         izgWvFNAyoN5TDOJXFcs6a7CX/CoItydxZIcOlt2rj7xtCqtUNBGb4D/J5TLs9oLYVag
         BmAnQEFq51+vVTmBqGfpoGWljFxzVEoDNxTVckIglcac/qCeeDjuoqX3eHHLP5H8NRHv
         3WNa9Ox2QkYCm/8uB4rAHZkMDhxIwE4gEHds/4cztlqa+EF8cpcGNpKSE8MsoPZcVD5f
         MCYuKAMgWTtFJBLzRh+tqW9mqIH7QDG9K9h3Goc3NOrwzu128Whvj4enSdbT4FUWEFqT
         ft1g==
X-Forwarded-Encrypted: i=1; AHgh+Ro4ygCao0O3qPd8xkbxcF34O+3BFVyJAgnFPS7UYeBTXomoxg9E3ariVTsfUUA60yJ/kk9Sh8LDxr6aDa3CMf/s@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzma52FyVxtchQTANDndXug9WZjbBd+jEfuvrFE8dX+b78ZM6k
	VVj868FCKW3d//otj7jOgYKHh1OTE1nJKEcLou9gBuQKs4YT8XSr5QAY
X-Gm-Gg: AR+sD12lVGCNOLifLckvhPXrNevFQlZlaIdq4vxGi2k8WRyflt5GxdyIxFiXBku9Zv7
	PeYzVVA2RTZLwdsMXuSbCNoEjZEdNZXCGAOv3+Pc1l4jgWM4iIjlAT2vXWLLm3me+ihTgxheKFm
	V/OpgAvMMJgkh/fZ4z1LDV6wH/xrezaCOMi+C003sc6T+cCi1X1bvY2k4fED78AYvMrDn1MVpnr
	HpJtGWdSDrXdnQ0IMaIjL7TyGJplI6HZScK6v8k1C82+4YMc2/hkgNAQxJpEpiQAD+yU7NdE7ET
	6C6cMOQzKNtsMEaj22+2Uo4zs9U+KOcW13FD4IFskWH/n0omtlfF0zQyGsznUJJGI401ZIajf5s
	Ux0fqGOgB/YCQsocA5Awe+lJatLhlajHzfG9BbHgvdY5M+glKoxsGcpMmjj2f+873mH2pUYteB7
	lcJdqDxZj5HnRPXXIyENiGYlHxVsqqKD8Pn+laH/WM/VmW3gnRyZD1BuD8MUQO0HkvMbX3RD+x8
	S0uK00fHvu3qxEg8LZCuNVxIM7K5XcDaNb/Izp9dCKTYHOmRmjkI/FnnHSEA61KcRJYASH9SBAu
	turrwCX4tBWaVaUnwSpSinggD6unxKOeVOOrj6OsTOvdHhtZhWzF8auiGf/4cWf2eyyYMmenYS4
	/I4KLHtFQWQlaAf5azZGCaPt1pMjorBARZr9O9fImhgypsytvhm/Jlzq/WMY=
X-Received: by 2002:a05:6000:186e:b0:47f:aead:f81b with SMTP id ffacd0b85a97d-47fd72c48a0mr4568734f8f.21.1785566716620;
        Fri, 31 Jul 2026 23:45:16 -0700 (PDT)
Received: from systembl0wer (109-81-110-31.rct.o2.cz. [109.81.110.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458ea4asm12408852f8f.31.2026.07.31.23.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 23:45:16 -0700 (PDT)
Date: Sat, 1 Aug 2026 08:45:11 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Joshua Crofts
 <joshua.crofts@broadcom.com>, Broadcom internal kernel list
 <bcm-kernel-feedback-list@broadcom.com>, David Lechner
 <dlechner@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Ray Jui <rjui@broadcom.com>, Scott
 Branden <sbranden@broadcom.com>
Subject: Re: [PATCH v3 3/3] iio: adc: bcm_iproc_adc: Convert probe error
 handling to dev_err_probe()
Message-ID: <20260801084511.795962ac@systembl0wer>
In-Reply-To: <20260731182347.42888-4-mdshahid03@gmail.com>
References: <20260731182347.42888-1-mdshahid03@gmail.com>
	<20260731182347.42888-4-mdshahid03@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_234519_370660_27E5CA62 
X-CRM114-Status: GOOD (  21.08  )
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
> +				     ret,
> +				     "failed to write IPROC_REGCTL2\n");
>  
>  	ret = devm_request_threaded_irq(dev, adc_priv->irqno,
>  				iproc_adc_interrupt_handler,
> @@ -556,17 +553,14 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	ret = clk_prepare_enable(adc_priv->adc_clk);
> -	if (ret) {
> -		dev_err(dev,
> -			"clk_prepare_enable failed %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev,
> +				     ret,
> +				     "failed to enable clock\n");
>  
>  	ret = iproc_adc_enable(indio_dev);
> -	if (ret) {
> -		dev_err(dev, "failed to enable adc %d\n", ret);
> +	if (ret)

I'd say it would be better to move this change to the patch where
you remove the dev_err() at devm_request_threaded_irq().

-- 
Kind regards,
Joshua Crofts

