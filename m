Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D80CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWXKv6dzpM2CS8QuqpR6KyDTLS4NLIuX56g7jGiE3Rc=; b=HRZw3DrEM5qVz4MhMJQJG7hPkZ
	IOHagMHdtk5qgEsr20hj+v91cGgWx52NzlgN6a2Rx9Zi6/nup+96SUv2x/eKTrOXTcA16nNjSj0qN
	CFyMDSGJvzZX9u82tdOKp5i953OCq3j4S+2slYxlB5od2zGni1bcKZIQ8Tk35hQzzhMJWZ4HNbWew
	aRdwFKKQ5nJRiI2BsRGpQKXVRpeNVYAArUFq15nvNXCVRrN8NJ8Q7YdwvENdx6fgMmzjRTDwEulWZ
	KXCi7cjOM8G608ppZD7/N/QJ1p/5qshGwXRf7rgiGp+HzfWr2WNXW/wC9DgPEcIUkzuLNSeTqyohs
	yonWkATg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvGQ-0000000FlL3-2y6Y;
	Mon, 17 Nov 2025 09:11:10 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvGM-0000000FlJ5-1UQq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 09:11:09 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42b387483bbso3360078f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 01:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763370664; x=1763975464; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qWXKv6dzpM2CS8QuqpR6KyDTLS4NLIuX56g7jGiE3Rc=;
        b=WgJhdJJpJ5sWS1cH42oSLhTtX6azF7q7MtqFVqEFfJWFKR/bkxtGTMwwZ7dfXg6pJ5
         ZQozvCkh1OeO971OJnMFfWRi1fKI+1CvrOn5FfNo54eG3Up5+zZlXByKdsm2j6n3Fwnp
         HebTb++WCKmSehbh45/mFXSavdJcyAgZ6w+7fVx9mR37BLmJi7diLI+nv/WcbAQV8Hlf
         l9adniy+lcz7eKVOcUZDyVENlPJjHKHrmqw3ux5XrigA0TvPcXzmgCQiSc6BnrLKmsLW
         js6S3nJglwotbN9d6iOFfL04+IIsZDSngOto5W3BT3CYyvvZrlv9LZpOYlVCztRPKihF
         3GrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370664; x=1763975464;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWXKv6dzpM2CS8QuqpR6KyDTLS4NLIuX56g7jGiE3Rc=;
        b=XL7DgBxeZ/WrV/G65Ti/Mg0WFxseus9ADYZO+EE2TANL3K6HoQLisS31lz0Ji55kyB
         FaFzDA4CnuX6auMYralGlV/cOLOBV22rwIgLVZvK7/G9C1Q5l9Kr+rcVcQCZ2EuMT/lI
         FP+Ka2W+iZxr6tYzm3FkufoglVlJSAsnu095JUbWcOa1FK1nPvCGgxKKeULxT7RIMw0l
         OTh3ROEaMeRZgCEGyYk8TYdxFgkMAMNvpq9xaowSNL+sql4LSX2KgGUywP1aDOj/UoDm
         CSLrtmjHg3ooDg2IOIhKRSxHUuYTCC3Jevye+qmSFpLl39u1m4rW2PN0LH12sjbVyS+h
         +xEQ==
X-Gm-Message-State: AOJu0Yz0Ymu6YWvypCIeKm34XYDsFT1Hp7XmP1AKMwE0E6EJ/Zm4YrFT
	zh8pdxGYSfgrJ0Nwut8CavmgxDuDJmjfRougEt/aYSWUwM3tvDlrby/cA7w7rwYRqfkoLU33ZgM
	h24so
X-Gm-Gg: ASbGncuROxYRzkEPlrAK8Snv5FePGcNnpOIdVtfdCfnZ601vqfrsH9rJFeu2t74/hTy
	VnsaiceMqhYGcG0rXi3hOzE4h7qsJmrL1Mmj3A9lak4zqSVAbSHOE/f8meh/YsSW8g6LqsVxc68
	EEIYenYqWu9mJVg+W9Q9R4NebkWF9AGn766Fq7miyyKZAoIXby3MvyZHVizf5dCAtUIzQ85gC6c
	c52Hn/rp8/ewCE30b9omPpGvcrKwykZym/x/7mJQpNBQFSMnLmNVhQFvgzZuJZX9rSYBaZko5Vj
	s5qaRLxN5nFlODtYJti1mB8EReYe28Kn5ukNSXtD0SqvvqBzupV+zO0ECFeatWjH9zVZsBXT/Zk
	dpbu/w1wUinpafO177H/L1PTX2ke+lrtxOtq7POK10LnwFnv0sJ3rPywhAlyzUXPLud2lG83LIa
	2e2WL80k8U7aCHwvhLFmemzWGvriJUzvd/xx+2zeFiunBvkL8Gov6Mmveu09UTYCw=
X-Google-Smtp-Source: AGHT+IHyuINLK5MdbEyCE84WDmNGgCERjzRvEgCe7ErPY+YmW9fdaWeR1WnnEstHTpOfhgyPahtbCg==
X-Received: by 2002:a05:6000:657:b0:42b:2a09:2e55 with SMTP id ffacd0b85a97d-42b592d106dmr9359114f8f.0.1763370664318;
        Mon, 17 Nov 2025 01:11:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d631:aa74:9313:e9f3? ([2a01:e0a:3d9:2080:d631:aa74:9313:e9f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b622sm24597140f8f.29.2025.11.17.01.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 01:11:02 -0800 (PST)
Message-ID: <9df2dd4c-9283-4f3c-859e-586e1b397a96@linaro.org>
Date: Mon, 17 Nov 2025 10:11:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 5/7] mmc: meson-mx-sdio: Use dev_err_probe() where
 appropriate
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ulf.hansson@linaro.org
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
 <20251108231253.1641927-6-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20251108231253.1641927-6-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_011106_434233_5C98B23C 
X-CRM114-Status: GOOD (  17.40  )
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
> This streamlines probe error handling / logging with other drivers.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/mmc/host/meson-mx-sdio.c | 30 +++++++++++++++++-------------
>   1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
> index 214ce84f1ddd..052bcf8f32df 100644
> --- a/drivers/mmc/host/meson-mx-sdio.c
> +++ b/drivers/mmc/host/meson-mx-sdio.c
> @@ -520,16 +520,14 @@ static int meson_mx_mmc_add_host(struct meson_mx_mmc_host *host)
>   	struct device *slot_dev = mmc_dev(mmc);
>   	int ret;
>   
> -	if (of_property_read_u32(slot_dev->of_node, "reg", &host->slot_id)) {
> -		dev_err(slot_dev, "missing 'reg' property\n");
> -		return -EINVAL;
> -	}
> +	if (of_property_read_u32(slot_dev->of_node, "reg", &host->slot_id))
> +		return dev_err_probe(slot_dev, -EINVAL,
> +				     "missing 'reg' property\n");
>   
> -	if (host->slot_id >= MESON_MX_SDIO_MAX_SLOTS) {
> -		dev_err(slot_dev, "invalid 'reg' property value %d\n",
> -			host->slot_id);
> -		return -EINVAL;
> -	}
> +	if (host->slot_id >= MESON_MX_SDIO_MAX_SLOTS)
> +		return dev_err_probe(slot_dev, -EINVAL,
> +				     "invalid 'reg' property value %d\n",
> +				     host->slot_id);
>   
>   	/* Get regulators and the supported OCR mask */
>   	ret = mmc_regulator_get_supply(mmc);
> @@ -666,7 +664,8 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
>   	host->regmap = devm_regmap_init_mmio(&pdev->dev, base,
>   					     &meson_mx_sdio_regmap_config);
>   	if (IS_ERR(host->regmap)) {
> -		ret = PTR_ERR(host->regmap);
> +		ret = dev_err_probe(host->controller_dev, PTR_ERR(host->regmap),
> +				    "Failed to initialize regmap\n");
>   		goto error_unregister_slot_pdev;
>   	}
>   
> @@ -680,12 +679,16 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
>   					meson_mx_mmc_irq,
>   					meson_mx_mmc_irq_thread, IRQF_ONESHOT,
>   					NULL, host);
> -	if (ret)
> +	if (ret) {
> +		dev_err_probe(host->controller_dev, ret,
> +			      "Failed to request IRQ\n");
>   		goto error_unregister_slot_pdev;
> +	}
>   
>   	core_clk = devm_clk_get_enabled(host->controller_dev, "core");
>   	if (IS_ERR(core_clk)) {
> -		ret = PTR_ERR(core_clk);
> +		ret = dev_err_probe(host->controller_dev, PTR_ERR(core_clk),
> +				    "Failed to get and enable 'core' clock\n");
>   		goto error_unregister_slot_pdev;
>   	}
>   
> @@ -697,7 +700,8 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
>   
>   	ret = clk_prepare_enable(host->cfg_div_clk);
>   	if (ret) {
> -		dev_err(host->controller_dev, "Failed to enable MMC clock\n");
> +		dev_err_probe(host->controller_dev, ret,
> +			      "Failed to enable MMC (cfg div) clock\n");
>   		goto error_unregister_slot_pdev;
>   	}
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

