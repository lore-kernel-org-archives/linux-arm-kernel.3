Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4EEC47BCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 08:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JmM3DMB5KBZ/rOor1NH+mo1W6M5Mtv1nt3BZBMfv1+M=; b=nwuWZKfPB9G4NElt1lK7i8fKNo
	tF1XQiBjf4Uqlv9NRN3zsEElXskuNvwsjvnViKBuLm4I4+BNRfJ3+uKNzJ9NJicawn+/cxH8i5qOA
	09drPMWZ2rg0prq3Wn03ZVGLW2XRnVjvJhvCbilIMgwaVcADYPh8oFOUlPFVKQRJRTb9VDAlPsrlp
	SsX9C+WQxOTwRO9SNTDoExedCDeHQLcjVr3BjODn5qqfPb11oD4AF36i6/42Po4eZ0hIXGNjBvpP6
	73CGOTxfy260IfhRPTDrKPmGxZiiTY1Q0aUrkEZaKlrA3CyvSL57+YPcGtBpr00rKLzIfl/4EJUR5
	kzywAeWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2qN-0000000CeB1-2qiz;
	Tue, 06 Jan 2026 08:55:11 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2qL-0000000CeA5-239W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 08:55:10 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-477770019e4so5985805e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 00:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767689707; x=1768294507; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmM3DMB5KBZ/rOor1NH+mo1W6M5Mtv1nt3BZBMfv1+M=;
        b=U8kd911E66KcI824tehMem+Y63NRO5yHlQ4lPnR/Sx4nz5GzzOnyCcVkGAXqfWrFKq
         osAccMkdGDn2io4s3xtIX3wE7CCm5N0WL2TDMUlotgHMM582A1xNCmzKrsp1m1iQLzMu
         9Pf0uJndbPLmmXqJq9AIGEiZ5lnN21wtKQnCVGPYkK4VS9j6bLkT1whAYS5ir9ZQAJ1p
         KKIs1pnLlePtjtB8QnsYaeqlvqeW2ZUnAORar0kOzVL/2i8S/t386CJmUrzWiia2/43h
         5woRbRsOLwjwkQ+z+lE3UpUg/hgLm0YHZ66nQZhSnNvTKw8BAx5m8GNaZF5ELc3nBnFC
         6uNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767689707; x=1768294507;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmM3DMB5KBZ/rOor1NH+mo1W6M5Mtv1nt3BZBMfv1+M=;
        b=XBGvtzsEiLLItpAVdKyosX3SW7KDJ9DxJ41o/JYwD5UDCdWphtiYG7r91gVX57G1ez
         wlCh2PUoipEcCzeft/0plGn03ZhAsTXCZCqfuP6CLfDuBwXZrCvmdBbYlbqyDebhBGBv
         E60YpFG3d5WhMLagGrRQb9A7Q8E/oUq7m2+hTuV6NJqVx2acKGAt0I896jFgjJSEzP8R
         mT1QDAuigOOGH4WKdTUSsxHhx/MiB9t/yLsGEs0D8PE9i6luWA1h/SmfUHRrTBQgARM4
         HPIthxX59/Py7zcCsOZIiHj1SLHW0ivQ5ZOM8vqmQGiF/BrIZKuWPrNhwr66J2BH+c80
         9i5g==
X-Forwarded-Encrypted: i=1; AJvYcCVOXPmkY5N+gS0v2gR3ChU+jyme6jr8AZM99WP3TVTABbPHFx7xKRPg4Wh37xlKp7cRpbbMm/wacjEK1pBoPp3o@lists.infradead.org
X-Gm-Message-State: AOJu0YyzOcSVz1s27DYIvBy1/tuxwZrIYp4xjVAk3AfaZkCCzVqyBs6q
	/CjYEDidg/49Pg+hgsoLDDER+MJlbuzg6inhk2ccFAxWEAbuJA2dFbR73sBMZUGk++M=
X-Gm-Gg: AY/fxX7xUFfz+BbBOtYIYe3xyiFZ2AIQ1yOfgfftB244TYV+CvGWhkrrQJmgBkMcevs
	6INTioLzU/JIweq7SaaGpThDAPK7XZ8IPsaU0zqmFyoHTbW0m/HjkaCzPA938EnKarRjYGSN1yG
	Pj2jU9ImMgSxga37IxXdu+IefIC1sYwzNehrdEoxYbLk3LTwASiA0hnmfcfceok0EYxIa+RpR+U
	WD6hlXtE8jtG7altrD8GJs8AVnBilCunWRCsa6P8RxKWHgT40WreCrKf1m1fM2Eg9VteBG0irnn
	lAQsl1SqQuE2YLsPZJPreGGQ2HGfBVWw9oPRRyuh8ugTKzaUNiDYhSBUMfR+NwkbktyMinIGsnO
	JS5YNYDPVxzrheyS8q60t1jKdMAJ2/CXLOIPLgF70fa6VUSKOe8yI7bYk/1CcWJtNua+n32Wquc
	DIBD9eSTcyOpgDzpsQfIbyaPqqfKTHyYOVKFikRZV5uLxqwPTBfD7J+NvvUpqlSnk=
X-Google-Smtp-Source: AGHT+IFb9OptR/7Ov8dlKzvJEz8z8DSsQN/pBgI8GsGjv1cpt2h75dKypaad+D29pbLvT/bSO71hBg==
X-Received: by 2002:a05:600c:1d1d:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-47d7f073054mr24552195e9.10.1767689707266;
        Tue, 06 Jan 2026 00:55:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d? ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f7053f5sm30163085e9.14.2026.01.06.00.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 00:55:07 -0800 (PST)
Message-ID: <10d5df9b-842c-45d3-8821-d4ca0c364e97@linaro.org>
Date: Tue, 6 Jan 2026 09:55:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: mark the GPIO controller as
 sleeping
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
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
In-Reply-To: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_005509_571935_EF2CFB66 
X-CRM114-Status: GOOD (  16.75  )
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

On 1/6/26 09:52, Bartosz Golaszewski wrote:
> The GPIO controller is configured as non-sleeping but it uses generic
> pinctrl helpers which use a mutex for synchronization. This will cause
> lockdep splats when used together with shared GPIOs going through the
> GPIO shared proxy driver.
> 
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Cc: stable@vger.kernel.org
> Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Closes: https://lore.kernel.org/all/CAFBinCAc7CO8gfNQakCu3LfkYXuyTd2iRpMRm8EKXSL0mwOnJw@mail.gmail.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> index d9e3a8d5932a..ded7b218e2ec 100644
> --- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> @@ -893,7 +893,7 @@ static const struct gpio_chip aml_gpio_template = {
>   	.direction_input	= aml_gpio_direction_input,
>   	.direction_output	= aml_gpio_direction_output,
>   	.get_direction		= aml_gpio_get_direction,
> -	.can_sleep		= false,
> +	.can_sleep		= true,
>   };
>   
>   static void init_bank_register_bit(struct aml_pinctrl *info,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

