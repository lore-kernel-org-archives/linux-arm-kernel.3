Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD6CFED3DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 15:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlPy3eW0kbNMua8eHVUnVBy11sqyRv1hpFqPENpVf9I=; b=S48FWXEtA5STL0ZR4VqvDS9/16
	zFDG61GGsAw/s5N3xY2hyZAi/fGUdaZNvUcxt4DUfMWNIXPxRy4ME4MNxITwDlHzQoq4hi5dAoHbR
	cOnUXifia60zHHuQVKgngsJiOsmPkc1+G6EeUIT+kDZRcvQZ7t/7ej5j2HizCT/LMoV0+0SqvxSxs
	72NRzKXzvsfIDBTGZD0Sy2AZKunvMk/nnnmVskGRhZjl7bSW1HU1bbWM2Q7r8SahlyQZ5MAChYh0t
	CTNt4wg40fB5UPyhv6htkMVIdJuY7WpP/dU1tBvOY2u8M/M2X6SwpX7chR/GX0JzxrkI5AAeT+Wdi
	BO7FkIOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGICy-0000000DMs9-2v4c;
	Fri, 24 Apr 2026 15:12:44 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGICv-0000000DMr8-3QXK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 15:12:43 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4891b0786beso51683535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 08:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777043560; x=1777648360; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlPy3eW0kbNMua8eHVUnVBy11sqyRv1hpFqPENpVf9I=;
        b=j0fg7bU0aC8yEaXp6l6pB64+89SrhAWRJ4/rsgfws4MCTqCE4+F3r+H8UY5lox2MYw
         iPKMkkS77xrhPGtGILt7yqjaxEaI70+V4jsXbCYpBgu7IpCCtJS/6zC+01UPQN6vNEVn
         w2zGO9ZiMEK7XPJeWQeFKZrRCtRh4VmHk5EHjf12pZN8KDmhCpEutpvAyYpMM8hrkZKO
         TUb1kxO3rP7lUYD18oK6P3zwltvMpzMBYJ8jEW79NVloWwZ6kPg68dv58EizION2e5Cd
         4P+5h17f1wMlSJSoMWa8sWU9vaPo4FO9knUCQS9aTInULWnM/C3rDQp9tEnpQWeB1trk
         flOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777043560; x=1777648360;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlPy3eW0kbNMua8eHVUnVBy11sqyRv1hpFqPENpVf9I=;
        b=m4DTl6nB7Eud4FjZw5h+Re0ShKc8zwmNtommlYpyi+/4ZmnuvMio7/Eu9rE90vuw6B
         ciwFm8KNLW0sPY13WzZG15+ho9Oqzo0eyOxoA7jpqVrdtCIUsfTHYu2FsN8zMzyxFslv
         qDYBN4PRivVDBqcsI3Vgi1Pq7GeVACekIZBxrQitzrKpmc09/QD/Q9Cq7uCTE8QoW8bh
         OIVOi+xshWGhMfJBg2h3yTN+FJapbqRsuEKOx5uYCt8tIok2xQ8/qIYzACQ0HOxmBhOC
         hGsWHKhplOTAVT0rz3wfKx+6wdRWta92c3taMPQLvXrqbfSxyLKGDxJiq+ZRh2dXJgzH
         /xLA==
X-Forwarded-Encrypted: i=1; AFNElJ9O5mICv8XGvRxaLVyj38s3yyCKauF9Hxye14sf//vGNxlXUmL62ZmWQr6+F/3q+9XaOydGXACaqDT1tG8fmT3o@lists.infradead.org
X-Gm-Message-State: AOJu0YxbtUF/KKmd0tDDgQZOzeV1WUezk0NTGjH4JNYylLNOqSFTWQLs
	KYvl93VJW65a8emZcDGP8/v3mZOoQWcrricz+5VvyjiUdTiAqdWMQ171ORvZJsVIQrE=
X-Gm-Gg: AeBDiesZijslitBnLLWTQloYyIDde0bjB6+qS06cp9+0w0jPXdOJOiAuCKw3XLqxpB/
	iMXZf1cSWl1dpk2vDzuEpyoP6Jm+2b1Zlhijr1Y4QNQBl7eDIMiCBBneA8e3pKl2lIz0XoaNJXQ
	O/V+yOYrxL4ys3Dw5cVshZRhWqM5pEpL5AC7s/pTxbZQfKdeSFKVIbDuZUyK4xBKPP1AM/CE5Qb
	/u93WqQOdemDV/ntC+mwpX6DbopgEJbishR1gvmDlqyZ19SXznKAZgyNbkz7Yp2RYmTN6ZQX4/q
	70hGmVdS8TRidDzYshagoV0ZWpw3C40UoxnOSts6jRYBNj73QAqfAk77g+ItAuLymyOb6RQO1mR
	Dj/BoESrvWWdjXcR+wF6wGWKC+QwNXGPiBOdaCFkSqo6JM0vc8UFs/rx2LJheIWzvgPZJAlHAR3
	ODKKXJV9wwmNT5tcV+IUv2JQXdPSPgOw8yEBc5VlnFr7SpTiykIVlbypVWBkrmU93hwYM66YL6D
	52uFDAmh2pLlwDM7w==
X-Received: by 2002:a05:600d:16:b0:489:19e9:b139 with SMTP id 5b1f17b1804b1-48919e9b29fmr249420635e9.1.1777043559595;
        Fri, 24 Apr 2026 08:12:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:608c:c052:cffc:495b? ([2a01:e0a:106d:1080:608c:c052:cffc:495b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4412150a071sm25224946f8f.21.2026.04.24.08.12.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 08:12:39 -0700 (PDT)
Message-ID: <cfee3aa2-e22b-4868-9ccd-f5016abe84b5@linaro.org>
Date: Fri, 24 Apr 2026 17:12:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 5/8] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
To: linux-kernel-dev@aliel.fr, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260424-add-mcu-fan-khadas-vim4-v5-0-afcfa7157b23@aliel.fr>
 <20260424-add-mcu-fan-khadas-vim4-v5-5-afcfa7157b23@aliel.fr>
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
In-Reply-To: <20260424-add-mcu-fan-khadas-vim4-v5-5-afcfa7157b23@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_081241_921824_EC183A1A 
X-CRM114-Status: GOOD (  21.33  )
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

On 4/24/26 16:17, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Replace the hardcoded MAX_LEVEL constant and fan register
> with values read from platform_data (fan_reg, max_level),
> as new MCUs need different values.
> 
> Optionally acquire and enable a "fan" regulator supply
> at probe time and on resume,
> so boards that gate fan power through a regulator are handled.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   drivers/thermal/khadas_mcu_fan.c | 37 ++++++++++++++++++++++++++++++-------
>   1 file changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
> index d35e5313bea41..5603fa099a858 100644
> --- a/drivers/thermal/khadas_mcu_fan.c
> +++ b/drivers/thermal/khadas_mcu_fan.c
> @@ -13,13 +13,15 @@
>   #include <linux/regmap.h>
>   #include <linux/sysfs.h>
>   #include <linux/thermal.h>
> -
> -#define MAX_LEVEL 3
> +#include <linux/regulator/consumer.h>
>   
>   struct khadas_mcu_fan_ctx {
>   	struct khadas_mcu *mcu;
> +	unsigned int fan_reg;
>   	unsigned int level;
> +	unsigned int max_level;
>   	struct thermal_cooling_device *cdev;
> +	struct regulator *power;
>   };
>   
>   static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
> @@ -27,8 +29,7 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
>   {
>   	int ret;
>   
> -	ret = regmap_write(ctx->mcu->regmap, KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
> -			   level);
> +	ret = regmap_write(ctx->mcu->regmap, ctx->fan_reg, level);
>   	if (ret)
>   		return ret;
>   
> @@ -40,7 +41,9 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
>   static int khadas_mcu_fan_get_max_state(struct thermal_cooling_device *cdev,
>   					unsigned long *state)
>   {
> -	*state = MAX_LEVEL;
> +	struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
> +
> +	*state = ctx->max_level;
>   
>   	return 0;
>   }
> @@ -61,7 +64,7 @@ khadas_mcu_fan_set_cur_state(struct thermal_cooling_device *cdev,
>   {
>   	struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
>   
> -	if (state > MAX_LEVEL)
> +	if (state > ctx->max_level)
>   		return -EINVAL;
>   
>   	if (state == ctx->level)
> @@ -78,6 +81,7 @@ static const struct thermal_cooling_device_ops khadas_mcu_fan_cooling_ops = {
>   
>   static int khadas_mcu_fan_probe(struct platform_device *pdev)
>   {
> +	const struct khadas_mcu_fan_pdata *pdata = dev_get_platdata(&pdev->dev);
>   	struct khadas_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
>   	struct thermal_cooling_device *cdev;
>   	struct device *dev = &pdev->dev;
> @@ -87,7 +91,21 @@ static int khadas_mcu_fan_probe(struct platform_device *pdev)
>   	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>   	if (!ctx)
>   		return -ENOMEM;
> +
>   	ctx->mcu = mcu;
> +	ctx->fan_reg   = pdata->fan_reg;
> +	ctx->max_level = pdata->max_level;
> +
> +	ctx->power = devm_regulator_get(dev->parent, "fan");
> +	if (IS_ERR(ctx->power))
> +		return PTR_ERR(ctx->power);
> +
> +	ret = regulator_enable(ctx->power);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable fan power supply: %d\n", ret);
> +		return ret;
> +	}
> +
>   	platform_set_drvdata(pdev, ctx);
>   
>   	cdev = devm_thermal_of_cooling_device_register(dev->parent,
> @@ -124,12 +142,17 @@ static int khadas_mcu_fan_suspend(struct device *dev)
>   
>   	ctx->level = level_save;
>   
> -	return 0;
> +	return regulator_disable(ctx->power);
>   }
>   
>   static int khadas_mcu_fan_resume(struct device *dev)
>   {
>   	struct khadas_mcu_fan_ctx *ctx = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = regulator_enable(ctx->power);
> +	if (ret)
> +		return ret;
>   
>   	return khadas_mcu_fan_set_level(ctx, ctx->level);
>   }
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

