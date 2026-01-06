Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1886DC47BC5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 08:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5XIBpzljoHQjxZKC8ws+REqtExLjvp1kVGJG4on0yQ=; b=BIoObGBWzkH10da6l4SbcFHS8b
	t2oMCpeTuKwkPUjoc0EJRJ301YnQ+XosoOObPVzLw/Rw2jyoE1pXhPpiJ/PU3kq6ICdbCVqs7bWB/
	oGlA9yYty1Uw6Us7hPugKvolkBBxmpWGbDw8CgK5E3l3GoF5s/fBfjGeL1iLZeByo/7++0HxzVuZL
	pi7zUJn5q2aXAf2HYS3JDeTp39w8i3LT5jurtOfDjKadegPZAckYaGY5tHAOoUdF2HjHo7aFiqKQy
	QHc7vSn7DqkXx64I+Bs4zd0a7z0uNDcrLtWzCz35KFU9r7gq+qN6Tm+wyjYteQxeSgp97Gs0ybXCd
	rNGCgeCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2s4-0000000CeTZ-2wC7;
	Tue, 06 Jan 2026 08:56:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2rz-0000000CeSd-1DiW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 08:56:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-477770019e4so5998955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 00:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767689809; x=1768294609; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5XIBpzljoHQjxZKC8ws+REqtExLjvp1kVGJG4on0yQ=;
        b=a39mbopZl83iWR7H2m4Ci4h2DQ99zigffoLIy0NGUnjFokpsMI28DZvYYWZdOE34s0
         I4tmPjA0YOHJ4iZIQ+cYKPyyva9m2Fff3hEqfFouFJBfXoJbOFoduEFiJHhnA58Tr/aX
         cKoI2xoMmOfufVZn5to9EP2pIDNHkqwD77Voq923wPP6VZC4tF9/mTl49BCkvc6XX8WD
         C6M9aeYQ9ZAz7sLm3l4oFVVJjc0929amukOv3jvhLwEDVQc6ugoWk6t/Rc5tvCkFdthZ
         QgLWJs05y1RDTWe7tlATtQ5vHuKQc6qm06umkW6wBxgCIVoFijJw9pTALuNkapeN1fKX
         MQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767689809; x=1768294609;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5XIBpzljoHQjxZKC8ws+REqtExLjvp1kVGJG4on0yQ=;
        b=LwHNVBIMy5zdd1aj/94q9zt0VRUU+E+mM6l0hSpvT54GFWVGR6Ah4eAl/rxCHwE0/W
         wIcyL1u/mePMqpBh/93RwBE0T0fNTpUHzMsxoNZPd151X3TfKEen/df4fzwp+G4QlEQG
         OgpwqL6VUhvv6Oc0yIGw0FFzIk3qlEn3e57Vw+U+qk+MnRfjwDSfqypsR9uk1V4AM0f+
         kxnvHdDp4nT04otecjFl5JzJwW1HtQ6tyEKp/h0yf/Er6+dc/ko15kbIdu0ioT1Bkd38
         cLrDMlN+5e5IHISwuBPlnFEIOJvE2dA8BLHpX5YH2K+8JtQsUPoPaQhgu2pN6SQ7kkVs
         XKYw==
X-Forwarded-Encrypted: i=1; AJvYcCUTIQkl28R7pPoG5Lto6RlmwgyYwij2qMrOmzMawolHuPhppJrvtZgtvQwQNLN+0h/1deRqx3joKGmil/hI7kt4@lists.infradead.org
X-Gm-Message-State: AOJu0YxrnPFeMaDa9k5+b+1rJpZglLVZTsyCQoJg+dBbk1zbluE+RFB4
	eABseQEb42Gw4DnM2WRX8K1+bRDQiE4Q4RYLjsnQxrGRtjsIfTncKW5kKH6f2FO2XAc=
X-Gm-Gg: AY/fxX7j+GmP3mO6AOH+u4t/U2yWju0d1XapPTcfMtdW9Gz3M96tzp5QnfKBKjxQhTx
	kiu3XJ1J80hdCD/f4ic6ZUZWjq/HY1eCgByO6EViiczH3UY7xE9U3zVyXmjXgZe1NC+vIiFo0/w
	sIxFb+oqGOCW2pkT+esbYrirPL4ykGC1uNLm9b71U6ePyGWPUcX+l5k3OvgkkHwVg/VbXaps7Ii
	ooxWYuCzwmGYHmEpuz4QWQZ3BEqBpGZ19kDsGihXUV5az7o11YlBEijMvRMEGWofLd4wqzp3rLE
	SlHmy630NwCF5ey1RPakyruOlKmNdBEcQOHMjY8cdadwxwjMo4Q7qwg9zA5urIPY/43ycWNghPR
	3tqlQUMLKW89t1lIqg4Gc8mDyLdG2cViLYy7z8J4Eu0B45JlX8ZJXrrKBd/ytkydWJGnYkoz8SP
	79U2lK4o03cvJO2slrp1ltnWIl16OD24xIWLuyJGo+pMvymbqh5hLqicHvmtmoAks=
X-Google-Smtp-Source: AGHT+IHVhcrD4cFn15kBjA+uODwKV5wK2G+r23W9N60bAGfWDxnPZimvr/c08dbGWpVozMUlUFTokA==
X-Received: by 2002:a05:6000:2302:b0:430:f742:fbb9 with SMTP id ffacd0b85a97d-432bc9d0f80mr3076920f8f.23.1767689809193;
        Tue, 06 Jan 2026 00:56:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d? ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee24esm3109698f8f.33.2026.01.06.00.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 00:56:48 -0800 (PST)
Message-ID: <728220d3-f093-4252-a0be-c45bf0dab597@linaro.org>
Date: Tue, 6 Jan 2026 09:56:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: extend build coverage with COMPILE_TEST=y
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260106085520.21129-1-bartosz.golaszewski@oss.qualcomm.com>
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
In-Reply-To: <20260106085520.21129-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_005651_366710_110319BB 
X-CRM114-Status: GOOD (  15.43  )
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

On 1/6/26 09:55, Bartosz Golaszewski wrote:
> We currently only build these drivers on ARM but there's nothing that
> should stop us from building it with allmodconfig on other
> architectures. Extend the build coverage for all meson drivers.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>   drivers/pinctrl/meson/Kconfig | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
> index 0315e224bce6..ce6aeec2fc79 100644
> --- a/drivers/pinctrl/meson/Kconfig
> +++ b/drivers/pinctrl/meson/Kconfig
> @@ -15,25 +15,25 @@ if PINCTRL_MESON
>   
>   config PINCTRL_MESON8
>   	bool "Meson 8 SoC pinctrl driver"
> -	depends on ARM
> +	depends on ARM || COMPILE_TEST
>   	select PINCTRL_MESON8_PMX
>   	default ARCH_MESON
>   
>   config PINCTRL_MESON8B
>   	bool "Meson 8b SoC pinctrl driver"
> -	depends on ARM
> +	depends on ARM || COMPILE_TEST
>   	select PINCTRL_MESON8_PMX
>   	default ARCH_MESON
>   
>   config PINCTRL_MESON_GXBB
>   	tristate "Meson gxbb SoC pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON8_PMX
>   	default ARCH_MESON
>   
>   config PINCTRL_MESON_GXL
>   	tristate "Meson gxl SoC pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON8_PMX
>   	default ARCH_MESON
>   
> @@ -42,7 +42,7 @@ config PINCTRL_MESON8_PMX
>   
>   config PINCTRL_MESON_AXG
>   	tristate "Meson axg Soc pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON_AXG_PMX
>   	default ARCH_MESON
>   
> @@ -51,25 +51,25 @@ config PINCTRL_MESON_AXG_PMX
>   
>   config PINCTRL_MESON_G12A
>   	tristate "Meson g12a Soc pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON_AXG_PMX
>   	default ARCH_MESON
>   
>   config PINCTRL_MESON_A1
>   	tristate "Meson a1 Soc pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON_AXG_PMX
>   	default ARCH_MESON
>   
>   config PINCTRL_MESON_S4
>   	tristate "Meson s4 Soc pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON_AXG_PMX
>   	default ARCH_MESON
>   
>   config PINCTRL_AMLOGIC_A4
>   	bool "AMLOGIC pincontrol"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	default ARCH_MESON
>   	help
>   	  This is the driver for the pin controller found on Amlogic SoCs.
> @@ -80,13 +80,13 @@ config PINCTRL_AMLOGIC_A4
>   
>   config PINCTRL_AMLOGIC_C3
>   	tristate "Amlogic C3 SoC pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON_AXG_PMX
>   	default ARCH_MESON
>   
>   config PINCTRL_AMLOGIC_T7
>   	tristate "Amlogic T7 SoC pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON_AXG_PMX
>   	default ARCH_MESON
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

