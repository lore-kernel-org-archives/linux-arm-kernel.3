Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FCEC55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 14:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMZw+Q+C27X+NpDBF0JL+cOPjhTz7PFEJuuJRyBNMQw=; b=OYp8hai5BhqPc8/HPagSwOOg+W
	slfSkdhTjH+jc1CAZQyIO6wBRlu/SwXw/oSmKQ8L2rxXxA1C9664kwMwo8sWaN0HXJsti/zGwS0lA
	M4KjyUc0fjpYc8fpYjmAHRZd/pgoqITkkTmRZfHmURQKvSyblLc3TIxLasy6Gp/pHtwdjJWfptaTN
	V4QdhgenadNJUHXsr8b1TDHrKbOLn5xX+/lPWzB4/lXRo/O6Ctkb/5DeZOKTcXSFewfr/mSJv/rHk
	lCyfY83LX1WG7IhAXin+nQu5FjBw5wBeYea0kuIF8CjX2RmkZgbHO6EuLjiNjzpfWQ2T+36MPP7dl
	zeBmU2Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqB1y-0000000El3V-3u30;
	Sat, 01 Aug 2026 14:49:42 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqB1v-0000000El36-1pEz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 14:49:41 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-4a40bcc8d69so1266685b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 07:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785595777; x=1786200577; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MMZw+Q+C27X+NpDBF0JL+cOPjhTz7PFEJuuJRyBNMQw=;
        b=dEAgF7P01wK/YwP9Col8soG1He0VvFag7YPHDyuYEiuOOc1XDAxUP+YRe/s90J+cGW
         ui/PezHLQ9bI31fUpymx0/S4D+o4RWNIK/w3D0IpUk5s7Fbhuuv8ac7k6ybPC8jl5YC+
         VGRe0ku7/n4qOD3sloQ/iLwxaR5gVEahkghGQ5RQgxMg7bShyj0KvRZ/qEVTlhxBC1xa
         fJbcJRPwdGkKCR6a07clVftvXxJ5AktwnD4O86j7WLgpKaOTfFA1DJYnJ2IX+MAuNTWh
         N7HGahn5n2I8KnfX4CA//BfdK4STXeeIy3W+W8YTEBCEARrOIJuSiic1z17BnVVVASOl
         dREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785595777; x=1786200577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MMZw+Q+C27X+NpDBF0JL+cOPjhTz7PFEJuuJRyBNMQw=;
        b=eLt2Ioq1TXokQcAfAQmXReNKhK24X4vco2n/em/7d1JSNn5UqVQ1tBxsYMqJkaCPsA
         ggncqIkaahP9Vo4xG3Sg5Q4Kj7gNYqAOc64CqyOVOE7CTgr4nouRo90LIZDgaSP6+5bh
         9ddgFrO+5hfsnv+4EDU8fwzJoT2KgxUgJugjzFN1K8LBAmPX7AHzGxE1seARnpOF42Hg
         KrDtxEnwI5o8kt8ghQ0GVMQ0dPES71OlMRgi08sCgqJEjV6OhQZIxHIpKeGg4/3vq2oS
         eGSc7LwV0slrathXaHmvqKuBA1+wknMA2H/EfughjL9GZd40TBhduwFxqOfSLYbRfRJg
         PwUA==
X-Forwarded-Encrypted: i=1; AHgh+RrGDFXdKp0MxMPuYN+P3/KMuqXw6W59MHP0yelgdL+sAvsj52fpv+xfpogIH+Zmvd/X2m5pJ5M4wb/ZR7zs7+AH@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpc7y603lTgL2qPxRicXPw8hfC/QVpmAzkMVj65Qvj3vgOi83W
	uJs/ibzdHEtXJbnRTrL9vigDOerZezNH+o/OPtM6IbcGw4wta618crJrOPl45G5eOjA=
X-Gm-Gg: AR+sD11GuLExv3RU/2kfs8gjYeZP5SJYhZFAa2zVHA3jpK45uC0Z17HKFJC0mjkpfCK
	M+ldkje4FqgNPZTs0AyqFKwKjSaq+yhcv6xxM8MUaMVHiggcGzJ1Han+FRG9M5+zBTCuw6JW2zU
	/RO0sYJgjGTs72Z8R0gaB2/Zaga5gOWxPHLLA3KdkSyCattsTsaQRUyDmXGvfnbm0M94EuI35sw
	FdKth5PX5ak67avkeTf2tz/MquuoyD062rsCPXIgE8/byFLp8ju59qMCRi1Drm5J03y8RE/SzD2
	quTavv8r6Tu+hytig+70tJrckIwoBLZPtJhB0rvIop4q62w2Wx9VV3x2zflpcqtd/SOPzRhDn3y
	zvChMKXkNb/Tl9AaKYlmlItZtFbEZjl/AKns0N8311B3CtMSKHOFpXEqF9emF/GcC3H6Jov9o2U
	T6OS2KQPL25YZfXo+VSwByrjQezO5n4X6MDIBG0V/CBynVOs2qvoKoHhBwbB6SfrG+1ykLGTH0X
	3xMqqar6asf7OK2MQyhMpu6/8ynZJU71VuzbFE=
X-Received: by 2002:a05:6808:d46:b0:4a4:a930:1f76 with SMTP id 5614622812f47-4af5e20b693mr6486505b6e.11.1785595777592;
        Sat, 01 Aug 2026 07:49:37 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:359b:17f1:d4f9:4949? ([2600:8803:e7e4:500:359b:17f1:d4f9:4949])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4af58e9568asm2968074b6e.9.2026.08.01.07.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 07:49:35 -0700 (PDT)
Message-ID: <36ce2fd3-9a98-4212-8de3-c17fc368b196@baylibre.com>
Date: Sat, 1 Aug 2026 09:49:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] iio: adc: bcm_iproc_adc: Introduce local device
 pointer
To: mdshahid03@gmail.com, Jonathan Cameron <jic23@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Joshua Crofts <joshua.crofts@broadcom.com>,
 Broadcom internal kernel list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
References: <20260801090953.61603-1-mdshahid03@gmail.com>
 <20260801090953.61603-3-mdshahid03@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260801090953.61603-3-mdshahid03@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_074939_516883_25DC65C2 
X-CRM114-Status: GOOD (  19.17  )
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
> Introduce a local 'struct device *dev' variable in iproc_adc_probe()
> and use it instead of repeatedly referencing '&pdev->dev'.
> 
> This simplifies the code and makes subsequent error handling changes
> less verbose.
> 
> No functional change intended.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  drivers/iio/adc/bcm_iproc_adc.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
> index 7c2e2770cd61..4acd9c3f089b 100644
> --- a/drivers/iio/adc/bcm_iproc_adc.c
> +++ b/drivers/iio/adc/bcm_iproc_adc.c
> @@ -506,9 +506,10 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  {
>  	struct iproc_adc_priv *adc_priv;
>  	struct iio_dev *indio_dev = NULL;
> +	struct device *dev = &pdev->dev;
>  	int ret;
>  
> -	indio_dev = devm_iio_device_alloc(&pdev->dev,
> +	indio_dev = devm_iio_device_alloc(dev,
>  					sizeof(*adc_priv));
>  	if (!indio_dev)
>  		return -ENOMEM;
> @@ -523,14 +524,14 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  	adc_priv->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
>  			   "adc-syscon");
>  	if (IS_ERR(adc_priv->regmap)) {
> -		dev_err(&pdev->dev, "failed to get handle for tsc syscon\n");
> +		dev_err(dev, "failed to get handle for tsc syscon\n");
>  		ret = PTR_ERR(adc_priv->regmap);
>  		return ret;
>  	}
>  
> -	adc_priv->adc_clk = devm_clk_get(&pdev->dev, "tsc_clk");
> +	adc_priv->adc_clk = devm_clk_get(dev, "tsc_clk");
>  	if (IS_ERR(adc_priv->adc_clk)) {
> -		dev_err(&pdev->dev,
> +		dev_err(dev,
>  			"failed getting clock tsc_clk\n");
>  		ret = PTR_ERR(adc_priv->adc_clk);
>  		return ret;
I imagine some, if not all, of these will fit on one line now
without going over 80 chars.

