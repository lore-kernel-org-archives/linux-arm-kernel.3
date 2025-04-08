Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688F4C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 07:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXt1VUtxJKVhenaGxKn/M7BRvobuDoOHV9yLu3KSCFE=; b=u0vbPjgLt1Dba+C3SYoVm0eLYf
	R5m4cZ+cO3Lr7n6AQBmWEHMwy5qsil6qdcX4brhXnWhH7exOuKWnDvv+OzdUwXKcwghR5goWE2HpV
	3U+nhDmH3emibIPZaWfkJhGP92R8qB5yM+J4s+AfgPjxu9eEXAY3VQjNGXkIUQSJQka+er1LxsjBu
	EFa3cGECwUH08NeyJIz3RD1E3kKzY7/vOtJS4Z/WmDEl6fWyWa9v8FE1Vk4co0R2JC26ed1vx4uH/
	8G8K/6+hEUox4tHUb76o9qAbJo5BKHgM87h8jHR/71yLduIweJgeO3vfxQZ7uUJ3Oy+ykXDWjgTjo
	pD1xTMlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23h3-0000000392k-1aXc;
	Tue, 08 Apr 2025 07:48:25 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23aS-000000037Sv-16tZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 07:41:37 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3913d129c1aso3561658f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 00:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744098095; x=1744702895; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXt1VUtxJKVhenaGxKn/M7BRvobuDoOHV9yLu3KSCFE=;
        b=huz/T4n60O62zfXQ5ekWx/5gt/5fs7MswK+hejOyY3euQ0CwJt3n+YowPaVOfBbBEp
         dJEeDVCuwvZ9Po6UwH6WwR61yNo8QEOiK+4+Kx8D7bg0TSdR9XROdHw3f1xn+88SdUjT
         FKp37tI7IHnt2aBT+Onji2I4z+TyFdQ4blHGhocd5Cvo+DPJxtw+XQ2RiLro10yh/8lu
         1p++S7Ve9jJXwmWTzVM4nkV6i0DooOiJMBXdrub6c376rGFc7/edvpnWYb2rwUpVjeJ7
         lJmhgIun9CihMydKij65EKz+KxuAS10qTSTYIky1lTkp/Ny7pKVgTg12fRObhUjQ3ih0
         96uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744098095; x=1744702895;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XXt1VUtxJKVhenaGxKn/M7BRvobuDoOHV9yLu3KSCFE=;
        b=A5I1K0IGNrgOTVS2xr9JQ3GEahsFW1iLIQWOvp/cJQEt5zg7fLgXW2fIIBNJvqWSel
         YmfEudoyePJla3jVE513cd43zY4rkm0IAXDV+zodTVHBRmJGFGDLvbqzswH08YOZ2uIR
         GGsNpKvC0bmn13iBlmjJUVpYCnExyEbKG11iAySTpDgTPve5vAa/7Ssffm99c5bMvgON
         ohQ+7jqGg3Af0fZ6Z+1iiYb3Lj52qgw776tX0ZG1blEF3L5hC6aefJ4aPLDQT4WtFKkP
         VnOVd4kEESNzL13cymsSlb7cyW2/2w1icRCG9NVWgpBWoJkUgYxQ1J6/i0aAsqypRiq7
         lAtw==
X-Gm-Message-State: AOJu0YzCUq39ZGHozchyGemf7pO0LA+Azb/UI0IqhX9YKvUyI1q9FHwH
	AvSWgT96DB3UyV53IwDgZnmMVHwZaOX4MZ2n/XsK6tx5QP997OLRdnyaHTwy020=
X-Gm-Gg: ASbGncsdKaKfMrdH3kCw8Sh2U1e9Xep8FoVVana7DYMo2VcNtfHze5OnTgApRYMu1kM
	GlW5afRSICTaUk7+bzcAT2Yda4gd9RsZgMpI5h/3KKD3pAHQXaUKqGwpiPH6Bh0BDf5LZAKIub+
	P36TvuKTSIvT4kUYYOh7MIrnu8F6cLirbs6hM41V85xNbpNCp56qOzasJ3HmuP2m1k5TgoYO6zG
	dkD3nG+XY1QcBNbMWNZrJBLlld5EIK1RMC0RIczr41XxsAza4I+rK91azknQrTZwXV90Ds9i/tZ
	mQRHAGHvAKyEwN06taiFuXY+gmpkY9FmlDlKwf2xzIYlYoJ3ssX8WOqZF5bdkqo1iVTs6pcLVpA
	5mvOLf8Tr9rLctjRULzI+pQ==
X-Google-Smtp-Source: AGHT+IGwV0LdqrELIcKaYg5qGdauKUw5ISrN3fxgvRHpkZn+vvc+/FEZS7JUbltTES57GokFyHQFlA==
X-Received: by 2002:a05:6000:2cc:b0:391:952:c74a with SMTP id ffacd0b85a97d-39d820aca79mr1827989f8f.8.1744098094642;
        Tue, 08 Apr 2025 00:41:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71? ([2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c300968c4sm14179491f8f.9.2025.04.08.00.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 00:41:34 -0700 (PDT)
Message-ID: <a5c44052-1873-4df3-ae2b-ffe21246c16b@linaro.org>
Date: Tue, 8 Apr 2025 09:41:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 05/10] pinctrl: meson: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-5-c9d521d7c8c7@linaro.org>
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
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-5-c9d521d7c8c7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_004136_305837_2FFD9036 
X-CRM114-Status: GOOD (  15.98  )
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

On 08/04/2025 09:17, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/pinctrl/meson/pinctrl-meson.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 253a0cc57e39..e7485c82089c 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -580,9 +580,9 @@ static int meson_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
>   					      gpio, value);
>   }
>   
> -static void meson_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
> +static int meson_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
>   {
> -	meson_pinconf_set_drive(gpiochip_get_data(chip), gpio, value);
> +	return meson_pinconf_set_drive(gpiochip_get_data(chip), gpio, value);
>   }
>   
>   static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
> @@ -616,7 +616,7 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
>   	pc->chip.direction_input = meson_gpio_direction_input;
>   	pc->chip.direction_output = meson_gpio_direction_output;
>   	pc->chip.get = meson_gpio_get;
> -	pc->chip.set = meson_gpio_set;
> +	pc->chip.set_rv = meson_gpio_set;
>   	pc->chip.base = -1;
>   	pc->chip.ngpio = pc->data->num_pins;
>   	pc->chip.can_sleep = false;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

