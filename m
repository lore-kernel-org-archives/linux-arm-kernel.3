Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520B8C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6HfW0vkjtlkAm7uksKgsKqVu9qIf8mOl8bnZ7ef7cg=; b=l1f/Nx6xU5c7YcDqJLTyhr9N0p
	65epfywERhNflcjFXpQt3nvvKhHq5monNz8HkfnoVgUXYN3CiWmzTd5cIcRkF/rcq0kLSmmIWRj+I
	qc1wWLcpzXYrnKCwVvF9zEIHTTR4aeigNCgbkzgp6LRio9O2kzFR4cWv/1jrA+EnOlibQASsjrWkA
	R2nX18CnKXCDaL3g3onp7cKzMziRc5AWJosAgrYHu703c0yq5gScBauadQVxNi+/WElyiyne3Y47X
	1lLyKFh6DQjDEg4qxeMNnI2qlNBFfuvvjgaGHGnbXrszHST12ikKSFJbjf4PvdWi8RkUoW2jPUsjj
	H3wd4pXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29xW-00000004OAJ-2a53;
	Tue, 08 Apr 2025 14:29:50 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29vS-00000004NUD-1Zjj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 14:27:44 +0000
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso61496205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 07:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744122460; x=1744727260; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6HfW0vkjtlkAm7uksKgsKqVu9qIf8mOl8bnZ7ef7cg=;
        b=vGybNqhmbby6gM9mPhNcOCl+BjcSwqfW2NVQAoKAm+vcqxVqHreQJaSA/ShRVScniO
         eUZovLngOR1gwRP0DunN0H8LzMM3cweEY8ic4VNjND1dVsl1NR2yjzK1H/uaypKXpJ/r
         OEwK1anSzY5HfSMZks11J+pshAeuN7KoSINgp9skr89+lZsuzw8BRYgYe3zNxGnxcV3+
         00LHjkSqdJSUH6BF9Qvk6I/ACkZR71mZ92V2gmjQ/FGDD/E9EnmAk3rJjH22NDQF1HBK
         FZNqqG5jwjBpaYU1WcEvRVW8HIMDr8OInHwwBUMqmbjVvrygLwwkeJxDxh+8f6G5L/Th
         yoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744122460; x=1744727260;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F6HfW0vkjtlkAm7uksKgsKqVu9qIf8mOl8bnZ7ef7cg=;
        b=vl0/NKHdKgsHPOjX7eOen8CbJd/rp//WcMgjgQl7kcpL8i3Va52rJG1kQ5l2PZGWTf
         XUeljpUx3YC9oM6PDiflaTfJvr6Dm5yy5xZ8u46G2jTDHj+nmkJyZXc92k324J8Amn3S
         peAymcizH2+I9fG+/Gy1vT0v7Jk6WrdkjqA615NJ8zWtcVHZAPUmjT31Ye171y+obHGK
         VpbdfrI0kHfVvHhTwKZGZdSCoTWOnEXVpzLBWehZOLv6I1JU9nOKOVCOPAcRA5NwCKMI
         M0m1JlU+5K9CVJGfynGlTFWBW9DnoYektz+/pA48nV7c8xpbem6CopHFfROdCaeQ8sft
         J9Og==
X-Gm-Message-State: AOJu0YwGP0/SXao3n7bWT00GsksUkeiuxsDmAeChlo69VcOlBzDWQ1MW
	Fw83WBZm7i8b+ozqeQjI8pRgALC7ihfuk5QJTmXaVuRzQqY4/+5vq2XTdQ8/kyk=
X-Gm-Gg: ASbGnctEF9kwhdDMWFUPOCq6eJWkGovanmcq8nCiz15cEvDNTFc4btT0w1Ae9lgb0TK
	s1f+zFXl3aYmHScNVQJgQoqMhqx7mFWQgFz65EVcSd+2FgEJze1WqUHPmmkIzw4Jzopt+9FwDwK
	Wr5aORrW/DciQCi4dIJVIeyuz+4gyBdAfjJApkH7TE012rrDUwuHtZR1A2IsG1vKsK5nU/ZyIfk
	DWu8lrYphvYqNRaNCYrvg2O6Hvk5itnh7RSNXY1OPAlA0L5DyIqk6Zm++gsqC3hwENOyNLkh1SY
	QYxwi4X2oGP+CR89LJx5VkGoCEj2y03qbxGXRDnSOqJXe5u1SvC8PqJ1UbPjfGqLL29YU/avlLT
	d6MHG6lJCP6dnmKLdgIYo2Q==
X-Google-Smtp-Source: AGHT+IEFzSlrXkuwJ4BeZNVJDc79m98CBMUnaDEEBTa0PE1ADYZ4JU0DGBnfFovWynU4GuvtS6T8sQ==
X-Received: by 2002:a05:600c:5346:b0:43c:f597:d582 with SMTP id 5b1f17b1804b1-43eda5d8460mr90477265e9.1.1744122460377;
        Tue, 08 Apr 2025 07:27:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71? ([2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3429f67sm169744825e9.7.2025.04.08.07.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 07:27:40 -0700 (PDT)
Message-ID: <ba7e31ff-5744-4409-921f-e2014f23151b@linaro.org>
Date: Tue, 8 Apr 2025 16:27:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 08/10] pinctrl: sx150x: use new GPIO line value setter
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
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-8-c9d521d7c8c7@linaro.org>
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
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-8-c9d521d7c8c7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_072742_422837_2EE45772 
X-CRM114-Status: GOOD (  19.67  )
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
>   drivers/pinctrl/pinctrl-sx150x.c | 23 ++++++++++++-----------
>   1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
> index 98262b8ce43a..d3a12c1c0de2 100644
> --- a/drivers/pinctrl/pinctrl-sx150x.c
> +++ b/drivers/pinctrl/pinctrl-sx150x.c
> @@ -432,24 +432,25 @@ static int sx150x_gpio_oscio_set(struct sx150x_pinctrl *pctl,
>   			    (value ? 0x1f : 0x10));
>   }
>   
> -static void sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
> -			    int value)
> +static int sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			   int value)
>   {
>   	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
>   
>   	if (sx150x_pin_is_oscio(pctl, offset))
> -		sx150x_gpio_oscio_set(pctl, value);
> -	else
> -		__sx150x_gpio_set(pctl, offset, value);
> +		return sx150x_gpio_oscio_set(pctl, value);
> +
> +	return __sx150x_gpio_set(pctl, offset, value);
>   }
>   
> -static void sx150x_gpio_set_multiple(struct gpio_chip *chip,
> -				     unsigned long *mask,
> -				     unsigned long *bits)
> +static int sx150x_gpio_set_multiple(struct gpio_chip *chip,
> +				    unsigned long *mask,
> +				    unsigned long *bits)
>   {
>   	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
>   
> -	regmap_write_bits(pctl->regmap, pctl->data->reg_data, *mask, *bits);
> +	return regmap_write_bits(pctl->regmap, pctl->data->reg_data, *mask,
> +				 *bits);
>   }
>   
>   static int sx150x_gpio_direction_input(struct gpio_chip *chip,
> @@ -1175,7 +1176,7 @@ static int sx150x_probe(struct i2c_client *client)
>   	pctl->gpio.direction_input = sx150x_gpio_direction_input;
>   	pctl->gpio.direction_output = sx150x_gpio_direction_output;
>   	pctl->gpio.get = sx150x_gpio_get;
> -	pctl->gpio.set = sx150x_gpio_set;
> +	pctl->gpio.set_rv = sx150x_gpio_set;
>   	pctl->gpio.set_config = gpiochip_generic_config;
>   	pctl->gpio.parent = dev;
>   	pctl->gpio.can_sleep = true;
> @@ -1190,7 +1191,7 @@ static int sx150x_probe(struct i2c_client *client)
>   	 * would require locking that is not in place at this time.
>   	 */
>   	if (pctl->data->model != SX150X_789)
> -		pctl->gpio.set_multiple = sx150x_gpio_set_multiple;
> +		pctl->gpio.set_multiple_rv = sx150x_gpio_set_multiple;
>   
>   	/* Add Interrupt support if an irq is specified */
>   	if (client->irq > 0) {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

