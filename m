Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB81CCE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5xS83R6jTExGfiXtHMfiumDDrM0n3+eJ9443zfQkUA=; b=gDTiHBQlKiN42Po7EHSYW1YDaO
	IWHKhQbRAh6AQ/j8SmCk9wWkjliGWkHyC9XxrQ6H59WfzhuBdba9VG2SUJOJ+bzp/R8dREhXoAKKy
	f36Q1ZS8vTeUgcd3bqC9279D1dInRxsvZrb297k4ZJ+a2VqkvQaSdcVXGT10I3jdJ+mf3JucmgWu+
	yXJMbN1ahjVXIEBNjWxUDICkREUkpwADwKVanLvrjZxYaC6/QU1TzYzZirGP/mgLJl7OvKm0T3op0
	GB8va7jL/aUDH7tCvhUiaoGqTcodyZMSGtmyGXNjAWxevpgoYj3pGR8iGJwLMieo0UcPWQ5uD4coQ
	fay8XvMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvFy-0000000FlBQ-1dCM;
	Mon, 17 Nov 2025 09:10:42 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvFv-0000000Fl9A-0yMT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 09:10:41 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so2002225f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 01:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763370637; x=1763975437; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z5xS83R6jTExGfiXtHMfiumDDrM0n3+eJ9443zfQkUA=;
        b=TC+N4/Svp5BFezqj9sPyP/oRJmvx71t6sKwrXXocq8A0k9vY1fKfAN+2aJq+855GCT
         0PaxjmGHMDdY2Pf5XXp9nA3SH1GxEdbW64lYoYJBnSNC040LfrJwFAXpgR1Y77FW8hNG
         bkQqWU8X2FjUHHN2t5tU+nI47XiXHOYriqIZcnWatxn2i1ZrMc2GVRiSmhViXICnbeBE
         /UldihllKI6zyAZZ0iFhoQqAWcMjA02H3CAWeHwwbIkJg0GMRAm0G74IM0OA02iw4xlL
         SzoCWWh0EerNq9zaLogdrwUkDubxfUaWJ58t9K6npGPtWw0OH3xpZ5dvYzejSlZMqhAr
         S9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370637; x=1763975437;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5xS83R6jTExGfiXtHMfiumDDrM0n3+eJ9443zfQkUA=;
        b=OiMCwyDdH3XN8jEq1GFQX29oFE2SMwpBXoIifRyVpTGmkZUWy65p0YX1Y7QeK5/EJI
         ZegigzVH8Wg1+n+B+3ixAp+c4iMDTkbp48i+RNLUkjHjuRmLajZfO7WB6gM6klhnQCgL
         Yh9LJrllrPH8ZE/g9sGV1kL5cVOTcIFV+UsqpLulTu/biPVAJ37CeoiFjFMZen8YBunv
         YXQI+Hba7JGNpw+RbhIJs2289htveEOcZww5rNmoW4qSOWKuIjBIH4ngaRDS9l+MsTCg
         koNuU69Q8vp69RPzOaj20X36zec2tFM9oTWUH/TWXZd2Lg4SdK+pciOBd/yz+nr8x//T
         nASA==
X-Gm-Message-State: AOJu0YwPlcmvvqhMQXWm7tvWS8tiIptaDKjLup/s2b5NK6dJhZCsiWce
	rYBChAHfeiKoSF88BJgqoMz0LRn6LpJAR/jAJ0TmhvIfNNK64zZdWGaQKXqLPNrjBLc=
X-Gm-Gg: ASbGncs5EnbmDDLa9QinuIHbHCKo+cK5p+qEU19shxAC1jiOxqS7A36nKsgoM4ICPHI
	++CDODqxamOKtC9CNSuQq7tcuoyPD6u182sjCt0r+pwTnxOenNuio68TgY+fVZj4elWz2o4vS1e
	BU0KwmUuses/0oQkb4UtmQTU+ZI6Io5ZW/4Z7JcM4xRJ3ahmTZPhreLS6MJgyqL3gti5IvMlxs6
	M6ssFtakoW/HOlJxDcBPAuLSgay72UDKU8kpFgVovQUvovlZ0sGWftuYUquqGzGT4BUZEGKxzv9
	Vfype1ZT+2RQzvFVJpwLEg9BEMYHmomX1o5qQPzaVJ11LFNegWe7F8hjNot0SOnMZ+3nV70g2UY
	4wNOYRkHwRw0Et1drGJ4XxWDnn8SW4+BreqdZoPaU8sXNwOtUIKX3lcBC9OtxIIRqO00pLAGXrC
	g0Dayl3CqhQPjIQQpOvQs0pny06SqCMSLBDDquW2kA3cnV1B/WYejnv4wulpetMm0=
X-Google-Smtp-Source: AGHT+IFInPvL/+hlf6EvBiL3GuycrSuUEXiGcy+maGHmWCjrynz9VPYDH7y5YTt48xKHIlg1cCH8VA==
X-Received: by 2002:adf:b601:0:b0:42c:a420:e755 with SMTP id ffacd0b85a97d-42ca420e9eamr1015380f8f.23.1763370637172;
        Mon, 17 Nov 2025 01:10:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d631:aa74:9313:e9f3? ([2a01:e0a:3d9:2080:d631:aa74:9313:e9f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f19aa0sm25146237f8f.37.2025.11.17.01.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 01:10:36 -0800 (PST)
Message-ID: <3243f07f-da15-4819-837d-4de081d336ac@linaro.org>
Date: Mon, 17 Nov 2025 10:10:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 4/7] mmc: meson-mx-sdio: Use devm_mmc_alloc_host()
 helper
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ulf.hansson@linaro.org, Binbin Zhou <zhoubinbin@loongson.cn>
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
 <20251108231253.1641927-5-martin.blumenstingl@googlemail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20251108231253.1641927-5-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_011039_303648_2BF83FA8 
X-CRM114-Status: GOOD (  17.52  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 11/9/25 00:12, Martin Blumenstingl wrote:
> From: Binbin Zhou <zhoubinbin@loongson.cn>
> 
> Use new function devm_mmc_alloc_host() to simplify the code.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/mmc/host/meson-mx-sdio.c | 18 +++++++-----------
>   1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
> index ce1828d915da..214ce84f1ddd 100644
> --- a/drivers/mmc/host/meson-mx-sdio.c
> +++ b/drivers/mmc/host/meson-mx-sdio.c
> @@ -648,7 +648,7 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
>   	else if (IS_ERR(slot_pdev))
>   		return PTR_ERR(slot_pdev);
>   
> -	mmc = mmc_alloc_host(sizeof(*host), &slot_pdev->dev);
> +	mmc = devm_mmc_alloc_host(&slot_pdev->dev, sizeof(*host));
>   	if (!mmc) {
>   		ret = -ENOMEM;
>   		goto error_unregister_slot_pdev;
> @@ -667,13 +667,13 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
>   					     &meson_mx_sdio_regmap_config);
>   	if (IS_ERR(host->regmap)) {
>   		ret = PTR_ERR(host->regmap);
> -		goto error_free_mmc;
> +		goto error_unregister_slot_pdev;
>   	}
>   
>   	irq = platform_get_irq(pdev, 0);
>   	if (irq < 0) {
>   		ret = irq;
> -		goto error_free_mmc;
> +		goto error_unregister_slot_pdev;
>   	}
>   
>   	ret = devm_request_threaded_irq(host->controller_dev, irq,
> @@ -681,24 +681,24 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
>   					meson_mx_mmc_irq_thread, IRQF_ONESHOT,
>   					NULL, host);
>   	if (ret)
> -		goto error_free_mmc;
> +		goto error_unregister_slot_pdev;
>   
>   	core_clk = devm_clk_get_enabled(host->controller_dev, "core");
>   	if (IS_ERR(core_clk)) {
>   		ret = PTR_ERR(core_clk);
> -		goto error_free_mmc;
> +		goto error_unregister_slot_pdev;
>   	}
>   
>   	host->cfg_div_clk = meson_mx_mmc_register_clk(&pdev->dev, base);
>   	if (IS_ERR(host->cfg_div_clk)) {
>   		ret = PTR_ERR(host->cfg_div_clk);
> -		goto error_free_mmc;
> +		goto error_unregister_slot_pdev;
>   	}
>   
>   	ret = clk_prepare_enable(host->cfg_div_clk);
>   	if (ret) {
>   		dev_err(host->controller_dev, "Failed to enable MMC clock\n");
> -		goto error_free_mmc;
> +		goto error_unregister_slot_pdev;
>   	}
>   
>   	conf = 0;
> @@ -718,8 +718,6 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
>   
>   error_disable_div_clk:
>   	clk_disable_unprepare(host->cfg_div_clk);
> -error_free_mmc:
> -	mmc_free_host(mmc);
>   error_unregister_slot_pdev:
>   	of_platform_device_destroy(&slot_pdev->dev, NULL);
>   	return ret;
> @@ -737,8 +735,6 @@ static void meson_mx_mmc_remove(struct platform_device *pdev)
>   	of_platform_device_destroy(slot_dev, NULL);
>   
>   	clk_disable_unprepare(host->cfg_div_clk);
> -
> -	mmc_free_host(host->mmc);
>   }
>   
>   static const struct of_device_id meson_mx_mmc_of_match[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

