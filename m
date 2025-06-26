Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0183AC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 14:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tyfKJ3iWwfYhEwtvlvqYH/qs9dAR1n1suyqwAjSqmI=; b=1zsu0BhlQggFFw9xsbFJOmXjoP
	/Xdg846zNxzhj8SqKBd8GWuRhtEj6clII1JE5vVMR6nvMR8EIO9gLP2USmDc8jWqPfQdB6h5dpDgz
	lUWHUaIIyqwAU0jwdKf++PBGpN7dVfz4NO6WzpI8bU6lcCvXkx3tutpQkB47DR0j3ore1xfF8vxnS
	edQczVuBLbrNjakM+0Ys5WlVb1zmDS6hD2JOO4BecM36Gp39VqewxJuQJ3x2R2B3H59nG3qsKgyVd
	276pY8B9nqlh2S5ot0Rzw2T6/ZfujoKMxixiFrWI35GQ/EelER9STN4wrIbBN9e/plKCCaza3D/UV
	ACODzSCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnTn-0000000Bu3N-2CIb;
	Thu, 26 Jun 2025 14:21:31 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnG2-0000000BrRd-37kc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 14:07:19 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so636003f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 07:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750946837; x=1751551637; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tyfKJ3iWwfYhEwtvlvqYH/qs9dAR1n1suyqwAjSqmI=;
        b=VbJ2GEnqm3y4btTaxDox9sImjBB91CdBsHi8b163sVkExb2LManxBCENXDK2dJqjPY
         Gysv+dx9ioXqYN/ema5wvSvD8E4dntQFeD0QIT94Y55k7bh6ZQzoxZ+XjHH6ccJdi+dn
         HpsVNbkwiiXKxvpxbuF96Ds9/uwOkJ10ws1ZaauXwNrjKh269KV7E6qfTfsox7zE3q7C
         Lo/gxxSew70GERaKtOVlTB0d3jjUkJvBi6KnhFJv/eg5PRD7/6UPC6Iac0n3z5xePKDL
         1QTg7YiQKWFcH8ksCaUDQ4JGg1eMPyP3Cl1ny2q6uqanrS7aCU0vhvYtbrySbTYfUQAZ
         szgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946837; x=1751551637;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4tyfKJ3iWwfYhEwtvlvqYH/qs9dAR1n1suyqwAjSqmI=;
        b=nD36B5N6HRez59IJJI7XO/YuvFCwyuXhy5oizyuoSvAT5axSFFHLtt17s8MCq9FTAJ
         dhfc7F5XJvJqkVzzQtxcWwRqYUDElCSeOuDUyAqWRkPnbwRjgFtwNH4nJdqo3iSwpLMK
         Fe1iEGYM2wvsGkGJJuuFZj++G5hSK0kTcghF2HCSv9NqAFmat7e4hULA4C/9A6WR1j7g
         zaUu+1DrWZlhPGpTxwW4uNr7bGzP53pB3wuS7CZB5PmgaGEHEUSi8OXslpv1vDQD/5cW
         L1wGcIcm1wrBoQOFPP9vj2MbJponzBQk7e1GTtp/6bcJt/dUjMS8JO1lqxgmCZtnlYsJ
         jI2g==
X-Forwarded-Encrypted: i=1; AJvYcCX8bEO2xgEVCMqpicYRTh8ArQ2Nyn8EGWvApURoftwzfC+zvP68UFCDqUKsUkwcwmE4DBJ/4LznmtlhO/d3knLT@lists.infradead.org
X-Gm-Message-State: AOJu0YzMifHIw8DdYvMlEo15LsydNPqOV1BfycXq0kVdtsP6m7UDbFHX
	c1uJA1q1Bn9pSE5ozWnWe4rt30IrN+Hyjotq/hNaFokJ22hAyCroA+ff5CPAADnCBjQ=
X-Gm-Gg: ASbGncuAeirmmjTaQp0Whs43OC04woQWKn+i9rnyVSntpeGxJ1GtwLtkv9x3xVfHR5C
	rFn2VyHl1dX0/AKMKpJL5sS7VaD9eupR8I3U56hZT/YNiIh98yv77ij1IsyI3phVDeqyxgKSH+G
	aI/sdyqsQ9l2VVQtcFR8qEOxMS4mmlNNuLS+6uS+LnmKnigsw+OXCqQDutgvmxxHFarO1QD7EQJ
	deIt2qPYzxkVomWwtyljNaJs6ocNAHGmbm43UJMr8bN+bajHcRQuY0KoBQ1DDLc7nFqF1Ik+7qK
	bsBL4DFzqq7v2D2i6QK71G7a9J4hQiu9kd11t1XkKFPOogCQDn86GmyGNDSdeS1T8EXN1Ygflem
	JDzOIR5xOkfF5crjgg6kHmFTvDYxhgRmDwGyBxN8=
X-Google-Smtp-Source: AGHT+IH2o/48Q3NSxhVyfkjDMI5iDi5m1hTz1aTZlrpWBbENmqy1WfQrH0ZoXoOKjfZDADuR+Pkv4w==
X-Received: by 2002:a05:6000:420c:b0:3a6:e2d5:f161 with SMTP id ffacd0b85a97d-3a6f2e8725bmr2928225f8f.8.1750946832282;
        Thu, 26 Jun 2025 07:07:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fa6f:b132:4858:18cc? ([2a01:e0a:3d9:2080:fa6f:b132:4858:18cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e72c1sm18312f8f.1.2025.06.26.07.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:07:12 -0700 (PDT)
Message-ID: <f92836f5-c81a-4bfd-a77f-903e74452c59@linaro.org>
Date: Thu, 26 Jun 2025 16:07:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/5] mfd: khadas-mcu: drop unused nvmem code
To: muhammed.efecetin.67@gmail.com, linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de, lee@kernel.org,
 rafael@kernel.org, efectn@protonmail.com, daniel.lezcano@linaro.org
References: <cover.1746518265.git.efectn@protonmail.com>
 <1b421ddfd44d096cd3a979462ced002e2356eb21.1746518265.git.efectn@protonmail.com>
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
In-Reply-To: <1b421ddfd44d096cd3a979462ced002e2356eb21.1746518265.git.efectn@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_070718_791335_31F325CD 
X-CRM114-Status: GOOD (  15.31  )
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

On 26/06/2025 16:04, muhammed.efecetin.67@gmail.com wrote:
> From: Muhammed Efe Cetin <efectn@protonmail.com>
> 
> Drop "khadas-mcu-user-mem" code since it is not used anywhere.
> 
> Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
> ---
>   drivers/mfd/khadas-mcu.c | 11 -----------
>   1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
> index ba981a788..ca4bd6cf5 100644
> --- a/drivers/mfd/khadas-mcu.c
> +++ b/drivers/mfd/khadas-mcu.c
> @@ -80,10 +80,6 @@ static struct mfd_cell khadas_mcu_fan_cells[] = {
>   	{ .name = "khadas-mcu-fan-ctrl", },
>   };
>   
> -static struct mfd_cell khadas_mcu_cells[] = {
> -	{ .name = "khadas-mcu-user-mem", },
> -};
> -
>   static int khadas_mcu_probe(struct i2c_client *client)
>   {
>   	struct device *dev = &client->dev;
> @@ -105,13 +101,6 @@ static int khadas_mcu_probe(struct i2c_client *client)
>   		return ret;
>   	}
>   
> -	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
> -				   khadas_mcu_cells,
> -				   ARRAY_SIZE(khadas_mcu_cells),
> -				   NULL, 0, NULL);
> -	if (ret)
> -		return ret;
> -
>   	if (of_property_present(dev->of_node, "#cooling-cells"))
>   		return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
>   					    khadas_mcu_fan_cells,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

