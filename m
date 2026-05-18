Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB02CCD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4rDUc5EqEKFX11/kqxVh1oXm8vbkQVcvmcoTJm6o8g=; b=vWm1t6NsaDMundxfyH3/LrYzIo
	KJt2OMVvJ/Vs8t+dkeZNWAP7tI7i+SntAKrmG2sIZBceSW4M/KGe6XDnEfTqjScB93g6VNwd0wOew
	b71ztpR/fkKkAirG9DFRHnkmjF9g2+0fOlSgyQwkuE5FpL/2Vnj4B0Jp01Ax5q8L1p3gumhzupy0B
	piuWjFChyIL/e68UvsUpBuXGUtEL7I3+g7/iuASyycNg+oqp+3TRif6pYNgfIyE29luNtEfaevscG
	1GmtWQnUgoo3DM59Tkzf+ixWJRTbjZMOvmw2a9dpvp11lXOo5wP3fAZ/rMADhy12/wH9XdtykCtoe
	eu22ZgVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz0t-0000000Fz9G-0pZ6;
	Mon, 18 May 2026 14:32:11 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz0l-0000000Fz3f-36XR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:32:05 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48fde648a71so16217115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779114722; x=1779719522; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4rDUc5EqEKFX11/kqxVh1oXm8vbkQVcvmcoTJm6o8g=;
        b=EivV4mMmmhCoQfSfrVddiH2WrO4c2QMGe96PfBjfhmFUX+HSDSbLoZgVJgto4MzUZA
         fqBSpwaTZukoW3zf/Y2dQLT2ziNzvyo1nTIhx6zf4SW2HD2fHlPsVhHHPI+pDCOSQcK1
         OpqQAtiuxxlEzl4PrfaK5FBVqiP/0OJfRIV15dgi7CH46VSWJQ1oDQbDQMmWHK0tq/57
         SwBPHyFzCwlQBFHzsMToLe6wk/wln1saH4/wd1kPxamuYQHKI9n0MySzfwT8nsO+U3nD
         t0XeFO/4dQsVUrJvSS7wZok4KySf30K7bWatba/8F9I5XSNnn5ziYwFK9zaQ7ra5kjTX
         4yYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114722; x=1779719522;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4rDUc5EqEKFX11/kqxVh1oXm8vbkQVcvmcoTJm6o8g=;
        b=cod+YvMbEm7c4AA9FXfOpD51NPenfkyYJEzSaVd5WzfJuECm0iC860O1LtXT3Q8284
         x99GCsYKKzLTbK46cdMK0itIYGXByeAucYkYK+eLmCuyrk0kmirVAMOn9dJOYVOPUJQT
         HbTxiCicHXuFWWZggHRrPXJOZnjJduTR62lDrimDKmeuMTDwxPhapXJ36GzQ74a5zK0k
         AkkxIim+cJSV+ZV2rLaTRkBlDFKQssVEjcLIY0+yeFaC2bjFgGDa1TyULxvfm5fpk3+m
         X9WvveVnnQbC2m7fh7aMlp63kOw1ZHU9jgmt7QSetj35YBI6GHaNXJcV6D6I7sE+/IMB
         LYzg==
X-Forwarded-Encrypted: i=1; AFNElJ95gZaKJ/IbcO0mLOUJRLw2z56cPKA1hj1GqLEtWtRYp9XN152Ke0iiDEdOj5VE5G1NiFKb6ZtRvegEyIwtGbGe@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb1GibITvfywN3y0RcFYDaymZoMxWWmk3ueJcf1Z2HUr+YPhjC
	3+W2Gjtqq0UyDmHSq/eAG7oVINRESh5UyGpz4ysGwbWN2M2C1jlLYj+8NQY13guO6U0=
X-Gm-Gg: Acq92OE4J7hmHVuRNdR4OEQdL2XSvzCJRlr5ZTSrqzx1OYuMYn43T0BYs0x46rr0uZe
	ZI9oOWRoVKvClLeS80NbWW9p/HzaewmV0vy4EJaU06ImV+7KCXOK4xt0o/x/5073MZbd1E2MpVk
	gl/X5wjtir1QIHVLJJHMDFKXKHndeZ78cDBNiAkbTazLZjYL5V9ETNXH85AZn99GrJUZoBMMb4a
	JW8Pkvwz8NSkLm09pK5keQ+EdudyBg5X6WW2ptsabcUDOaFD+0Te3UyiofBwdjpdU5MM/G7vBmu
	rGWZFRu7AicQWd63gxL87P46EwKjnZryrm5mxm3QtlJu0FezUP8P89Zoqby71dn2DrBEhuKO3cd
	06gE47gmEWQ4qz/2nMYXOpWZFNu51Zp/BPaTXImW13sns65ve/hXYHmaWzsW23JGI/Ns1jsITH0
	InvLGJI/2sgi79z/SJ5FFjzqziL4b+fJIn+MLSqiodfDbcOUZNJwVuEwfAF8cWk/zp6vXduhedN
	RQD3QE=
X-Received: by 2002:a05:600c:4851:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48feea99dc7mr117236255e9.7.1779114721755;
        Mon, 18 May 2026 07:32:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1029:e3c5:362e:1250? ([2a01:e0a:106d:1080:1029:e3c5:362e:1250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4dac000sm265809055e9.0.2026.05.18.07.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 07:32:01 -0700 (PDT)
Message-ID: <72b341e6-5ada-48e9-a9c1-a442810b15da@linaro.org>
Date: Mon, 18 May 2026 16:32:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: fix gpio output glitch
To: xianwei.zhao@amlogic.com, Linus Walleij <linusw@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
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
In-Reply-To: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_073203_828140_5514368E 
X-CRM114-Status: GOOD (  19.94  )
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

On 5/18/26 10:26, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> When the system transitions from bootloader to kernel, the GPIO is
> expected to keep driving high.
> 
> However, the Linux kernel first configures the pin direction and then
> sets the output value. This may cause a brief low-level glitch on the
> GPIO line, which can be problematic for regulator control.
> 
> By configuring the output value before switching the pin direction to
> output, the glitch can be avoided.
> 
> This commit fixes the issue by swapping the configuration order.
> 
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> fix one issue when set gpio line high.
> ---
>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> index 35d27626a336..1bd58fbbd26a 100644
> --- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> @@ -548,11 +548,11 @@ static int aml_pinconf_set_output_drive(struct aml_pinctrl *info,
>   {
>   	int ret;
>   
> -	ret = aml_pinconf_set_output(info, pin, true);
> +	ret = aml_pinconf_set_drive(info, pin, high);
>   	if (ret)
>   		return ret;
>   
> -	return aml_pinconf_set_drive(info, pin, high);
> +	return aml_pinconf_set_output(info, pin, true);
>   }
>   
>   static int aml_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
> @@ -921,15 +921,14 @@ static int aml_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
>   	unsigned int bit, reg;
>   	int ret;
>   
> -	aml_gpio_calc_reg_and_bit(bank, AML_REG_DIR, gpio, &reg, &bit);
> -	ret = regmap_update_bits(bank->reg_gpio, reg, BIT(bit), 0);
> +	aml_gpio_calc_reg_and_bit(bank, AML_REG_OUT, gpio, &reg, &bit);
> +	ret = regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
> +				 value ? BIT(bit) : 0);
>   	if (ret < 0)
>   		return ret;
>   
> -	aml_gpio_calc_reg_and_bit(bank, AML_REG_OUT, gpio, &reg, &bit);
> -
> -	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
> -				  value ? BIT(bit) : 0);
> +	aml_gpio_calc_reg_and_bit(bank, AML_REG_DIR, gpio, &reg, &bit);
> +	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit), 0);
>   }
>   
>   static int aml_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
> 
> ---
> base-commit: 73d4991a6949eedb51e442d4e81415017d85975b
> change-id: 20260518-fix-set-value-glitch-f43cd366c295
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

