Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D07C55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 14:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=biNkA50kN2GCvNIWKTTRsuGKERA58n0pu0i9eBii5iE=; b=LdF3+QiuGt43nIinwLd997z2y3
	0b2E/k8+nzKnm5nUVsKeSZb+zVXwTxD0oEv6NEyY1PJqJYV4H8CIhstEcknmXmPYYq2z0zuFZ92rx
	jv/ToTFMadNHED1fAYAVkPf1Lm69NwqUFiqXrGH6EYKegnN2/qHWjiQzUmmhzAg5tttnWqKpyNCjT
	zfv5lXwurghoJyU8NgwpV6lKJ8kgKMbw0AhftSil5CcaxrP/C2n6rRWP1oRkdSLI4fZeFaGv6nQ1s
	nMEvLQWmpq9sRa1CKRvhhRxstngeNnjV/OyoO/VIKUvBwu7dW2CRvL1NgaGMjbSfLSWkeD7WwvJyu
	duvl8gbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqB3u-0000000ElC2-0h6s;
	Sat, 01 Aug 2026 14:51:42 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqB3r-0000000ElBf-1PeG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 14:51:40 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6aca0f482e5so1251618eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 07:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785595898; x=1786200698; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=biNkA50kN2GCvNIWKTTRsuGKERA58n0pu0i9eBii5iE=;
        b=L0o79ithjGGYoKAV6851JFtLlLOwDX/+mhQP72W+67HYokZOUF0kCncypW/CiwPkaq
         /gFHI7R1OY9te/tC1SMhojsIs11+NGCco0E1sfJQ/nmAubqcBceWXJK1chxBce9XEQHC
         cZuntpvZE40kkYQMpPkhllq9Ve1NHZKOhyFrWMZ6fRVgwYzne7WpAWQAt8eBQpzswJ/M
         xaoI4piFb6bz49jziW5LtJWsF1r/jpB6xI++gH9bpppfk8L6FJcHU3dPPFn1W/o3C8Cy
         HX45X6YSO8I1Sa58qb+n39GnKdz2J5rLhfUrZHro9IDymDGpisx+CRsKZoEJFSoQSBqE
         5jaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785595898; x=1786200698;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=biNkA50kN2GCvNIWKTTRsuGKERA58n0pu0i9eBii5iE=;
        b=s8hz66TI4Kp9TYjtNZxgJlq/P0edpbSeFQayoFfs9DmKf/5+YNG7szCM1pvcGdW3P7
         CuUDMkkSKHecVEFXCr1mT6QdGDjSOQItOL+IR7kUlmA5ek/L8sFJnLlS4wFOttkO5BGj
         GgGzB56tnWXYEt5PZoDWi04OAKPlisTleh2Uv3zJx2EIK5apkpfx7PZYd/kbTSSz8fx+
         WD6wKz1OffftK6Vg527G1OIVSttArC6Tm7uKMjmQdwhuPyI3OOa9YyzZSCv3bRssiJfB
         RDomrun/9UrN0QthsfI/Iw6QeBzsY8jIy2Yuf/MmMcIQQx8RYAZOQR2VYqIszv1vterT
         a+Sg==
X-Forwarded-Encrypted: i=1; AHgh+RrYZuYtEHrI2VQsMOPZOnT5U91LQvcVWmroBVrkxXS9OVkIoDENk/joJHxvYD3LnXH5uXr6AI58ZeU50/VIugLQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd8dZ/YxFm94825pMBI3LlzH9AfXTi0ndndTl+gPeVnUgub/Vs
	/oDzC5wUY6Wg/5cLy179V5CzryGkk3bP++cnb6SZ4ZANnbLfk4Fxn76qFgCN4HTc/t0=
X-Gm-Gg: AR+sD13ImWjYd05eWHzn+nUeS+8/TSUw4/4pGtWxqQ+GnrKW6dEz2k0cvp+Il5ugf7e
	PwNTSiFEQ0HUSbEvIZ4oOGjDq1+kAvWJi8e+xdq0lO5sNa1QcVRQdSwbjPKT6RSMt7VTh7/HuUZ
	HFTspg0SziyLzeTUFBTkeSJb0u6kMnS6C++f3v4+KsDm90j3iqTkdHPG+AyRKLxHCY5ajFrLpo9
	95jGN7nYgrgLvYPC2Krtn41KJgcxo0/i44nHb4QeKQTupBzzaviIXsyEbf929TkDjKqjywfAWTg
	9t5PVEgHmYFhfesBy9GscHLNo4sB7lfHNkIbp75L95OTIcFjZYiJbOz7nozY6L73/b/p4MAXfE9
	r+TD2muHSVLHJEu5R56Hi7WtrewJr+TuAByiX+joBU3LVfTEreW+qfHNoBRDWsYby7c8NIow7IM
	r9+vV58+BtwMX4ptdIstbqH1UwNdAouqGIlzVPTRMv8WiKwsWkohTYWoUIqUnTvngQkIFFAsDqa
	Vtne/zR3pawWP+uA/T92ef8cjYSN5jr/49C0Hs=
X-Received: by 2002:a05:6820:4b02:b0:6ac:c531:2ef4 with SMTP id 006d021491bc7-6ae43336570mr7319764eaf.26.1785595898078;
        Sat, 01 Aug 2026 07:51:38 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:359b:17f1:d4f9:4949? ([2600:8803:e7e4:500:359b:17f1:d4f9:4949])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f66c1d89sm3908964fac.13.2026.08.01.07.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 07:51:36 -0700 (PDT)
Message-ID: <8be00e0f-08ca-4744-9f24-eb41a63a858e@baylibre.com>
Date: Sat, 1 Aug 2026 09:51:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] iio: adc: bcm_iproc_adc: Convert probe error
 handling to dev_err_probe()
To: mdshahid03@gmail.com, Jonathan Cameron <jic23@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Joshua Crofts <joshua.crofts@broadcom.com>,
 Broadcom internal kernel list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
References: <20260801090953.61603-1-mdshahid03@gmail.com>
 <20260801090953.61603-4-mdshahid03@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260801090953.61603-4-mdshahid03@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_075139_388159_D82FBACC 
X-CRM114-Status: GOOD (  20.67  )
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

On 8/1/26 4:09 AM, mdshahid03@gmail.com wrote:
> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> This simplifies the probe error handling by replacing open-coded
> dev_err() and return sequences while preserving the existing
> messages.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  drivers/iio/adc/bcm_iproc_adc.c | 39 +++++++++++++++------------------
>  1 file changed, 18 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
> index 4acd9c3f089b..5fcd528eb88a 100644
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

Probably fine to put this on the same line as dev since it won't
be any longer than the text below.

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

same

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

dev and ret should be on the same line.

> +				     "failed to write IPROC_REGCTL2\n");
>  
>  	ret = devm_request_threaded_irq(dev, adc_priv->irqno,
>  				iproc_adc_interrupt_handler,
> @@ -556,11 +553,10 @@ static int iproc_adc_probe(struct platform_device *pdev)
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

same

> +				     "failed to enable clock\n");
>  
>  	ret = iproc_adc_enable(indio_dev);
>  	if (ret)
> @@ -574,7 +570,8 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  
>  	ret = iio_device_register(indio_dev);
>  	if (ret) {
> -		dev_err(dev, "iio_device_register failed:err %d\n", ret);
> +		dev_err_probe(dev, ret,
> +			      "failed to register IIO device\n");
>  		goto err_clk;
>  	}
>  


