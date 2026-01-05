Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6236CC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJeP3umUUPJKCdZprAUZ1ZTfLiCOqec4hH3IqgMAE2k=; b=Meb5X8F9sVjQu+HK0sPWVMRRQu
	Rs37unRTFfFe6krnE3SIuJe6+7VaUvUm4u55xPYgRjol4c108mwTeW+5BnErZILrMErohyhc4aYZE
	Pgb1EtIkMwBDwOfAQUCBkinRT6gMLqgtx3TE3VErPnC+tHlNNb0jrEn5ywVRop/xosOVDPlWbtWGz
	6FEHnqdenlqN0m+mUPB+sevHCX1LDdFKd52w93cZHvg/5crKeuyYdVlUnvhkqNxjhMH0B6LL4j2F0
	ahsMIFhMwV09nLdJjN/UMu3Rk8dH+r5nWO1gNVbGFGre23Q1RyZcZdbH8r6f/jB2dvZ9zaxeZwzJg
	1Sci+8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmBd-0000000BaZ2-1nuK;
	Mon, 05 Jan 2026 15:08:01 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmBZ-0000000BaXU-2uqW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:07:59 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-47796a837c7so205595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 07:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767625676; x=1768230476; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJeP3umUUPJKCdZprAUZ1ZTfLiCOqec4hH3IqgMAE2k=;
        b=KcKFNqLejGDM/u62ZnFccOIVNB4NvHm9Pyowkt5Cm0tobX+QH/fgyyDVFjKzWcinyI
         agwPISDZlZN/1dt5maDA++vdHdoaj4cimxbfm02gkeaXTi25w78CDbwZ5wGED5eWGptV
         xVuLk6AyfK6SJq8m16GOtMaLGae6fZYvS80qY8PqO/+xx7R2VfnidW3vQVqxrDG+TVpF
         pOSt5cY3RgwmvTPYb4UhlIchaguBj/februQLLH9Q7Gdm9z3cZDP6ZDWxDC74HNU8F6+
         Sa82+5E18DbPbnK0PM80oJtOYgjjcA+KSN5BtPPgsn98jYmLcD52gkNe3KwfGksQOaFQ
         hlcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767625676; x=1768230476;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJeP3umUUPJKCdZprAUZ1ZTfLiCOqec4hH3IqgMAE2k=;
        b=NH5kjbMKt2wp1UdfvmG5zO3lOL/U3eVzAHKAMnNX8oGrZ1zLPr+Ar4oOJu+b9L0rs4
         Zy6So5X17G7g+4J5g2f3JaCW2CpnQb/3NRlvTnP8Mzmq4UAc9rOwlu+hTTUsBdAW/Kcb
         fzZXElWFpmX4d8pZmkiRwJ5TqhTYirEhsUf/A9ZN+d47B1Adi9c0hUmgOX9z+08Mn3ii
         rvdJtlapexkA0lZD3JH29nVk+PPICJIbrnYRztp2Vmyo/IroTQlqrQhki/x8mdsqmA8a
         ARJPLhXImwV0KwJgopZ83ep2lWQsH4mUF1/LAIjkH2IhHFYFe2z62MDCBBOQgfg9Ljj5
         EOqg==
X-Forwarded-Encrypted: i=1; AJvYcCXdPmG+HKFIy/Kxbv66CxUQUPBe4NREfTRFEQWTksVew7AwvR+vorwWzayrykw4Cuh1Aki3ibTHDq0nvDQZnDT2@lists.infradead.org
X-Gm-Message-State: AOJu0YzkwV1Az/zuxTUD4u4WztoZAuZZeJCYZygG8UnZLR4R/PhDsFcW
	Q/VdP9uPT6H0V80DXDhd9a+6viOgBbqwXjHGb01pX7n06mqwH0ZT6qVYCyksI+/FpeE=
X-Gm-Gg: AY/fxX4t9sSobDr48HKWZ0XLSFTVseJBeEAfqgGPsCsa5S4fVE8A7Uqtpl7uGtO/9VG
	BD+4qE3g0bR5yASlBZqy1hnJgXQc8sizhO8ONFZf9nHS5X7/4ZvdaSgiLsI5Aa1jGQyQ8QOPEJS
	f5fEVoPTH2xmk6Bl6UUf1NcHfO8hCzWVIUxragml4tnKX4bqm1JzGAz5AGrG+bIF8CbFoMB1ZZN
	0YAE9PlARvfmbJGdiDjEugSEoCdR/CQF0sbcGr/fxTTbxDGgxikFbAsvyq8jzCe0Tnat8aGpAsl
	vwiDXEkZheKSOpTAXe99MR9jJk6UMUzVG1Nsfc85oymhmQoC7R+7THg14lgJ6y3GT2llB2MjhfN
	kxinDrbJhVI4vqVmIZp/1EO9iLuwtj8VjT0wTz0i0v/Iw6sn05+iC1/9OBX2ATKDNlOa2EZ7GFY
	dz4khj4wHzjgc4xdtEJ4KH98S+tvW92r81cxQdvJzlxOQhKXcSGM045Gx+pV47gnA=
X-Google-Smtp-Source: AGHT+IHNPKjsE1L43Mcol0BPhYCu+RrWOpaqpZKfNqq23wdaZg/I9TTFl/xgV8vj8QWVD5+5pya8pQ==
X-Received: by 2002:a05:600c:5249:b0:456:1a69:94fa with SMTP id 5b1f17b1804b1-47d1954a128mr636773765e9.13.1767625675529;
        Mon, 05 Jan 2026 07:07:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d4c1:5589:eadb:1033? ([2a01:e0a:3d9:2080:d4c1:5589:eadb:1033])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7443c04csm35338465e9.1.2026.01.05.07.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 07:07:55 -0800 (PST)
Message-ID: <0a457882-1700-4edd-ba86-3682b05731f0@linaro.org>
Date: Mon, 5 Jan 2026 16:07:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
References: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
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
In-Reply-To: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_070757_774874_7CE14196 
X-CRM114-Status: GOOD (  18.00  )
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

On 1/5/26 16:05, Bartosz Golaszewski wrote:
> The GPIO controller is configured as non-sleeping but it uses generic
> pinctrl helpers which use a mutex for synchronization.
> 
> This can cause the following lockdep splat with shared GPIOs enabled on
> boards which have multiple devices using the same GPIO:
> 
> BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:591
> in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 142, name:
> kworker/u25:3
> preempt_count: 1, expected: 0
> RCU nest depth: 0, expected: 0
> INFO: lockdep is turned off.
> irq event stamp: 46379
> hardirqs last  enabled at (46379): [<ffff8000813acb24>]
> _raw_spin_unlock_irqrestore+0x74/0x78
> hardirqs last disabled at (46378): [<ffff8000813abf38>]
> _raw_spin_lock_irqsave+0x84/0x88
> softirqs last  enabled at (46330): [<ffff8000800c71b4>]
> handle_softirqs+0x4c4/0x4dc
> softirqs last disabled at (46295): [<ffff800080010674>]
> __do_softirq+0x14/0x20
> CPU: 1 UID: 0 PID: 142 Comm: kworker/u25:3 Tainted: G C
> 6.19.0-rc4-next-20260105+ #11963 PREEMPT
> Tainted: [C]=CRAP
> Hardware name: Khadas VIM3 (DT)
> Workqueue: events_unbound deferred_probe_work_func
> Call trace:
>    show_stack+0x18/0x24 (C)
>    dump_stack_lvl+0x90/0xd0
>    dump_stack+0x18/0x24
>    __might_resched+0x144/0x248
>    __might_sleep+0x48/0x98
>    __mutex_lock+0x5c/0x894
>    mutex_lock_nested+0x24/0x30
>    pinctrl_get_device_gpio_range+0x44/0x128
>    pinctrl_gpio_set_config+0x40/0xdc
>    gpiochip_generic_config+0x28/0x3c
>    gpio_do_set_config+0xa8/0x194
>    gpiod_set_config+0x34/0xfc
>    gpio_shared_proxy_set_config+0x6c/0xfc [gpio_shared_proxy]
>    gpio_do_set_config+0xa8/0x194
>    gpiod_set_transitory+0x4c/0xf0
>    gpiod_configure_flags+0xa4/0x480
>    gpiod_find_and_request+0x1a0/0x574
>    gpiod_get_index+0x58/0x84
>    devm_gpiod_get_index+0x20/0xb4
>    devm_gpiod_get+0x18/0x24
>    mmc_pwrseq_emmc_probe+0x40/0xb8
>    platform_probe+0x5c/0xac
>    really_probe+0xbc/0x298
>    __driver_probe_device+0x78/0x12c
>    driver_probe_device+0xdc/0x164
>    __device_attach_driver+0xb8/0x138
>    bus_for_each_drv+0x80/0xdc
>    __device_attach+0xa8/0x1b0
> 
> Fixes: 6ac730951104 ("pinctrl: add driver for Amlogic Meson SoCs")
> Cc: stable@vger.kernel.org
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>   drivers/pinctrl/meson/pinctrl-meson.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 18295b15ecd9..4507dc8b5563 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -619,7 +619,7 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
>   	pc->chip.set = meson_gpio_set;
>   	pc->chip.base = -1;
>   	pc->chip.ngpio = pc->data->num_pins;
> -	pc->chip.can_sleep = false;
> +	pc->chip.can_sleep = true;
>   
>   	ret = gpiochip_add_data(&pc->chip, pc);
>   	if (ret) {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

