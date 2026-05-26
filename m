Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A33CD5BCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 07:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCUC1w8o3SPo/dQIjvTcR6pWtcHK4WC6Ve79t1hbi2E=; b=PC6LfVBJ41ZjmEYjZQzX0tIXih
	oWZBeIKFjX0rIJ40eat0dYy32lhy5eJn3awUuF28fp4JYX+i/JDFZZZZ5GQSEztlKoWsbDND7rBV8
	b9qNbPFiyuJR8WsQNUwREqhFcEjHl2wZ08rH8/NhjTTuVdQXjQB2mz4Epqv4PWXBJmMhVt9sluTY7
	AA9gBFIo9DIzsddDqMv9ORqYG/F6PyOSW8NgVS2Y/5fMQ2MxLnBH+Ad7PPvnPPA8dVwaS9PhovEh/
	liRDoKSiiGy8AqETIuBX4EnIKhFwgDxWTGVTFgtPnNYIpfhtRlBqj0jgwd2YnM1W1vP+1+kHhVbXj
	WbWri0nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRm00-00000001F3h-4AjF;
	Tue, 26 May 2026 07:14:49 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRlzy-00000001F2T-0adR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 07:14:47 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso8228449f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 00:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779779684; x=1780384484; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eCUC1w8o3SPo/dQIjvTcR6pWtcHK4WC6Ve79t1hbi2E=;
        b=MtE7VYFlUS6wM49a9QhuEXWM7ehze6jKfKjmVYSemAmMQqmC82VuXNNF2QfCHcrS+I
         imykjG192ph7IYujX7YtzYE/nVaYOVEqs+4r9VYHGYNWgTq0JCbM3RdQXmwMFTz2xb0g
         UkfTfaEVjAaIDNGjnCV8jjQoHBB49HyfYx7ClhMfepjoZny3+2yVrbwAWtRNfEKAplsa
         UiB0dUch77RHpsAyMaTxc/sHbgpOVhk/hyKR4Vw3YCHxaVtq+YTHQDTIzZX5FPj28r5b
         +Ha7fHn6OpqFxQA+C980CquMwMDGPvGTMI1Bhf5lb06I2zh7ABshfzfWc7WD9Qd6hOsM
         SgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779779684; x=1780384484;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCUC1w8o3SPo/dQIjvTcR6pWtcHK4WC6Ve79t1hbi2E=;
        b=iu/JMZZugrwJYb5WljCe3z7X3lA0TYYSKzAWr4OtURpVwTbFQTJCWNsnsoe8f0OGG2
         bTqHzOf4XpjKIzempgG6ZLAxIZNDQCB3uad50aeqTGcz0jBFppWwGERsauu0iCCkLTNN
         KHlN0Z+XQxyYg+1J9thJk2vo/V5nTMuiJqUNwQah/XYt+L12AiNIVkLWcllOInBZT6OJ
         va0ZSKli6+Z+IqfdZutUcepGG4eoGmaw+fX39URs2/P0UcJbSmNFx5VIuu+YBVVCi/8+
         X2bnzS+uyf00QiD4FO1+baUOxJfcz7Uwc06LXPwuk0F+VFlKvBlqBm8uNGcsMVOeOFzJ
         HyyA==
X-Forwarded-Encrypted: i=1; AFNElJ/zVAy8q4anX8qat2N28b0SAU+mMzposFvr8sZNJlpA2Y21qe5lhOE3n4UQk/RchTmQ8paP6kc+1+LAU1GGiaw2@lists.infradead.org
X-Gm-Message-State: AOJu0YxOiuFvUPg4Niy0EuHtpkZzBrrr5nzzhk71JPfi+MKD32KjKax4
	P7JOm9nO31RTMDLTOFzTilmvOt9kzdf7aV7ewhVscNEeZ1kO2nQvsyILUbsuMZcbTFU=
X-Gm-Gg: Acq92OGgrs/j3UFTEKT2yYeJ6okRCs6Rtei//3o0jtEp/crHf3ZOcgMbnhRZyElghZM
	uXhYHZv14hBZw8icFfdCSJH5EqoAl9Cprd0AYC1kbprsk+AVRw/pyzKatjxbjIfhXHkVlttNDZp
	uKAgbkd6vQhlRpJwK3A9Oy4l4DQjIRIIFO83it5OqRUTweZlwEGORE9s5TmH0rgPdPSFfciyGLw
	0FsAPoSCZtrotG8uinBfMHQXitFoSYzSX8uufY8Y8Su4RbTFmAkpYDjlD1fq6214LJIZcB6YU08
	hKa26odazyJxEEPo9TOjyQIr1gLptniItii7ETwdxLcMN1T5IRgJGZUwHl/VSOkyAAdwBBjVRVG
	Jw4LXxSJCO26WemJYhhP5yeKw4dcBJNvaheQ0oRPiazq4Rf4wm9Nw7HIz3uXV/RpnSvGjLdE8Xt
	+34MhdAB8FwsGUX5tQA5eijAsFB8hl1+mHa8gxH7Ku7ZRGhnTaf4bTVb0MzWD+IpOhRo6LJf8dL
	F/Ui0s=
X-Received: by 2002:a05:6000:4283:b0:45e:633e:a7cc with SMTP id ffacd0b85a97d-45eb38bade1mr29186012f8f.24.1779779683519;
        Tue, 26 May 2026 00:14:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:aba9:2be3:1465:636a? ([2a01:e0a:106d:1080:aba9:2be3:1465:636a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6cce01asm34146772f8f.11.2026.05.26.00.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:14:43 -0700 (PDT)
Message-ID: <45081b91-7b49-44f0-998c-af9927deadf0@linaro.org>
Date: Tue, 26 May 2026 09:14:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: gpio: meson-axg: Fix whitespace issue
To: Jun Yan <jerrysteve1101@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260524154954.385778-1-jerrysteve1101@gmail.com>
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
In-Reply-To: <20260524154954.385778-1-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_001446_210656_386E9C9C 
X-CRM114-Status: GOOD (  12.92  )
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

On 5/24/26 17:49, Jun Yan wrote:
> Clean up whitespace misalignment in meson-axg-gpio.h
> 
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>   include/dt-bindings/gpio/meson-axg-gpio.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/dt-bindings/gpio/meson-axg-gpio.h b/include/dt-bindings/gpio/meson-axg-gpio.h
> index 25bb1fffa97a..a0d42bcd9bd3 100644
> --- a/include/dt-bindings/gpio/meson-axg-gpio.h
> +++ b/include/dt-bindings/gpio/meson-axg-gpio.h
> @@ -23,7 +23,7 @@
>   #define GPIOAO_11	11
>   #define GPIOAO_12	12
>   #define GPIOAO_13	13
> -#define GPIO_TEST_N 14
> +#define GPIO_TEST_N	14
>   
>   /* Second GPIO chip */
>   #define GPIOZ_0		0
> @@ -52,7 +52,7 @@
>   #define BOOT_12		23
>   #define BOOT_13		24
>   #define BOOT_14		25
> -#define GPIOA_0	    26
> +#define GPIOA_0		26
>   #define GPIOA_1		27
>   #define GPIOA_2		28
>   #define GPIOA_3		29

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

