Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D06D41D79
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 13:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsaZoX49/UTmnCYipmJYozRv1F9KJT6zGJ2FPgwHPM0=; b=kVBg4Pz1BFuY1a6n7G2/23yk5z
	HqIHNXZZTcMM4Zffs3g99m+0Sx8cX0f1uBDc2jSzAy2G7NPPMOr0VJPEah+tWGq3GMO89hpqKqSpS
	YgB9hgRY/jbQdXBAQyMvmW+lECXEGHJ4U785AfeRY/XKcyXOn0+hvfPxEk0dqLPEK9JsR1yD1s0T2
	AQ5g+PVX5TRFbSoK7HT0kzq0ozYubnkzfhVpdXDBLUILcRs2Q0V2ZdXItVXU/gf8TPwANumBAv6B6
	1d5xCej5dHAh7ShDMTCgmUCB7eVo1hfcNtWL45TEFCbued7thsG/5OX4MYssTjPPEhFB6pN3uj37Q
	/uogzM8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAr72-00000003c6n-1lNh;
	Tue, 12 Nov 2024 13:39:20 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqwg-00000003Z0g-07y9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 13:28:39 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-37d47eff9acso3443172f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 05:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731418116; x=1732022916; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YsaZoX49/UTmnCYipmJYozRv1F9KJT6zGJ2FPgwHPM0=;
        b=PI9d/JlrFZbqqSYlUH/RfFAkrbgtL40FNYV3MFBSENTDmAgU42SMMnDx/7YWYHpoi6
         YoUduQGg7d6OVHmgUJFwq6uQs7uF7E0VkzhkipXSI3x5zrWmmgWTyiqdB9CKqg8SnWtU
         xvCVMPsaPpCTFER3v+v5B23yAxcxykq55MOyNFECj6kbitjD2NiQS/h679sDz3qLOaEw
         ZSXIr4jx/iizlseazybTatfkvEM9NkJkQZrh6p0ei8G2YBSWOV0yOhAPzBuVhSruvrIb
         gpyP9sOTJJ8IkqoHXPMFgsNPhlEcAAsf9P3+UewqUiEI0AJw3TwgEKoFKuMr2ZVxwub0
         PTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731418116; x=1732022916;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YsaZoX49/UTmnCYipmJYozRv1F9KJT6zGJ2FPgwHPM0=;
        b=b7Dxf2zrv527kIH81yCsN/rPIqKjVw2wChf+3Yiwqp3nLUcwB0AP4tQNhhaxRQUedb
         9uTwNoFDN89iGj5JyE/MnfHoEiQrYiApLl+MlxE0IqdCxhaeMhdxigAbSB/gKum1rNvT
         A+a/thaRmV0W5LrioOYszDpETMUHiyLq8sy+uJwd3ys4f1wyV01R55CnhDbc63E883at
         xIp9q2DmYfcf8t0cEVsJIh3xuzAFohDZs1uf0KtEC28UfLet3w/uz4lasrtyPk0gepA0
         YH39cmcG2qV7S6lIEqJ7jg8OQg/eYU8j19iuL1RxKHfiTrILj74uXar4tCvkMtxfler+
         jX5g==
X-Forwarded-Encrypted: i=1; AJvYcCUvO0WMC3Giwule13RjfU9affIaqN4SdaA6e6Q8CLMhJphm9IL8539CIzu7FtSucBirDGCPHZ7pimExPX6bu9EC@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv3vw5Gx+uPUdr8as50hhQNIS2h0t6VEks51nrPqrBUv3/k9tQ
	pHESVxL/iBbHy5230sEkzL5kJ8xpywfsE863K3Zp+d0189t/1OMhcSeGMYK4DKA=
X-Google-Smtp-Source: AGHT+IGcxUmMqHN8a/cQuWmNKDKEmC6I6tUTcWYjNJv51eGA/I3ZpzDc+lB74YRdvxBPxcRvqG1PMg==
X-Received: by 2002:a05:6000:186e:b0:382:b57:f0b5 with SMTP id ffacd0b85a97d-3820b57f16amr747635f8f.12.1731418115692;
        Tue, 12 Nov 2024 05:28:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8? ([2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda04111sm15330046f8f.92.2024.11.12.05.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 05:28:35 -0800 (PST)
Message-ID: <69918f77-c0d6-4151-b725-e5051f0f6680@linaro.org>
Date: Tue, 12 Nov 2024 14:28:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 3/5] pinctrl: meson: add interface of of_xlate
To: xianwei.zhao@amlogic.com, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241112-a4_pinctrl-v5-0-3460ce10c480@amlogic.com>
 <20241112-a4_pinctrl-v5-3-3460ce10c480@amlogic.com>
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
In-Reply-To: <20241112-a4_pinctrl-v5-3-3460ce10c480@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_052838_101709_85027F08 
X-CRM114-Status: GOOD (  16.53  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 12/11/2024 11:26, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Amlogic pinctrl software framework use system API of_gpio_simple_xlate
> which only support linear one-to-one correspondence to translate gpiospec
> to the GPIO number and flags before. It can not meet the non-linear needs.
> Add the interface satisfies the underlying driver to implement the
> transformation to meet the needs of various scenarios.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   drivers/pinctrl/meson/pinctrl-meson.c | 4 ++++
>   drivers/pinctrl/meson/pinctrl-meson.h | 4 ++++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 253a0cc57e39..fc0c0bef38c0 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -620,6 +620,10 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
>   	pc->chip.base = -1;
>   	pc->chip.ngpio = pc->data->num_pins;
>   	pc->chip.can_sleep = false;
> +	if (pc->data->of_xlate) {
> +		pc->chip.of_gpio_n_cells = pc->data->of_gpio_n_cells;
> +		pc->chip.of_xlate = pc->data->of_xlate;
> +	}
>   
>   	ret = gpiochip_add_data(&pc->chip, pc);
>   	if (ret) {
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
> index 7883ea31a001..cbb3f22552b9 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.h
> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
> @@ -120,6 +120,10 @@ struct meson_pinctrl_data {
>   	const struct pinmux_ops *pmx_ops;
>   	const void *pmx_data;
>   	int (*parse_dt)(struct meson_pinctrl *pc);
> +	int (*of_xlate)(struct gpio_chip *gc,
> +			const struct of_phandle_args *gpiospec,
> +			u32 *flags);
> +	int of_gpio_n_cells;
>   };
>   
>   struct meson_pinctrl {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

