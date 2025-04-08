Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D8AC369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=maYeBHyukcD41Ok36kPrsdL9APyex77i93BMZAgSjDY=; b=K1cbigGeDsSX40wXkFrc5QWo0M
	//FLuHUxiw//w12WS6FCgxHetqRkbGU8DB3XpFRF9IC7c/AX3f10WqjJl5Rh6HmiaFRIpDy+RKBuV
	8eSO79quDIGbnkWcXnap+BpZbcoj1xChyL6QLiNGZHxQw1ZsoHIBO9dAJIorpstQ6zK4xWmgUquKR
	j/eDRtzMp9TyliL3TrgrOH6fZQOU21LFC72zdWX7iVrcH32gPkKlTyPryL/0+qYng8fJtZ7IFd4UE
	1Zr53+rwP4FbKnMO2tau4n9IQDLtI4ScBC1vZZPsZ48mypmNO982i3XevNxsMzsLz5CeIARfyPWof
	let0MgNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29zH-00000004OVi-0iOs;
	Tue, 08 Apr 2025 14:31:39 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29vZ-00000004NXJ-2X51
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 14:27:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so33327125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 07:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744122468; x=1744727268; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=maYeBHyukcD41Ok36kPrsdL9APyex77i93BMZAgSjDY=;
        b=pWySzRZko8EwBW+fGLiXe36yid3b9Qx5r50vuD+xwl4wNLeM1H3Ot4jSQDUE0QmGrz
         M+af7ufhbr5nADwbZa/ArC4aukrfn3CZoxGZC9EfyOZgDt62bzBFll6dQTr9QUFsU875
         JcUU+jAqYe0gpQhguFehimTh19JJ9FLyW0UrLqegVmK+ttNoXcaBxs3SKoXtWr656zoA
         em2bjBzIKeplJ8+zMO/ag29aIRXTqL+c7kvspJHRlf54wF6WqHVKy6OR8eHxfH3V9cAe
         NOCsYc88vgvSqYsPwRAHsLYieEaP+lIw1rD8nmXSzzqLZyeQgGNU/T1L7+v1RqYiFCJM
         TIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744122468; x=1744727268;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=maYeBHyukcD41Ok36kPrsdL9APyex77i93BMZAgSjDY=;
        b=Z2HKHcpkglGmRVc7ayrrhJsBG62LKbxbM+fbTgaud5o1usLElBmAB8Alp5gWQxzaXm
         H0UhttinbehcSaqNpBSkk4YDgBcJtMfF34VG8p9HOST/o7eiL5bmpYhQ68eGvo5FhLlM
         mIXxFCtvzItj5FyI4hFOgYygGnPdeD/Ca+awP3icVyF2bDBP/e/0PT4Zo9TEjFwQvgCi
         VYeqR14E/LygU+lhjiHawJHMZMQf8H04n83yPTBnxwLfvnhsrtwUNaw45txJUiFh0YsM
         c++CfDzqbhIcfuRbZJisU3sd1UjWf+W8IMPOK9MuxlDYYp/h6hemNprORo5L/bGSa95F
         oKyw==
X-Gm-Message-State: AOJu0YwWC26GaFNPHuLthBLokxE1dUzSzTfRDV+pL4/cFvsjFLDHEtoJ
	YkY8RBoDZVyPOmSQysOjRIEXs9wtblEKGfSU85XT27fOfb8QfvhjX9DZpy64Vsw=
X-Gm-Gg: ASbGnct6PbuUdnwxIw1BLB3PxHWfJdKdUY7vOTHPTeD4im7+MqVyCmLSPC8UXqJqkNT
	gqbmahM4bYlkwRccwHMZ5BP6+vH98pTwabMbhmwqGEMcIbDL4snkIRxn+G7lqNeTC+kRn0fahJL
	UnV0ybwT+R6/I5fs7CvAz8KalkumTYz9ygZHG/C09VZoCXxA6b8LZaCV2DBQEVBkRMjmj34rpRG
	64RTegxsKX+IVpNkq63p/4lzpx5ScjQBmhWQagKsDvsk9hRGJ4KTBhjT0MgygaRd6ynC/myEp1R
	9H8hkr6fS0/7Cg+jaoz4eOJ7FNhDOgtG/ImSFVjNLoU2MSwxrxO+LtsY0MC7Be/om2feD0nJcAY
	dp1tn3A1L8+h72endXRvaVQ==
X-Google-Smtp-Source: AGHT+IHOQl3NOqzgesmZMaye/+jS53HYFNcdFr4mTBR4HNItRvuMdvVuoVoOZXlrImVcJ2UxCZ7isA==
X-Received: by 2002:a05:6000:4011:b0:391:31f2:b99a with SMTP id ffacd0b85a97d-39cb35b2527mr16291235f8f.5.1744122467955;
        Tue, 08 Apr 2025 07:27:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71? ([2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm161009595e9.19.2025.04.08.07.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 07:27:47 -0700 (PDT)
Message-ID: <81d462fb-b118-4354-82b5-92c33d870b44@linaro.org>
Date: Tue, 8 Apr 2025 16:27:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 07/10] pinctrl: sx150x: enable building modules with
 COMPILE_TEST=y
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
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-7-c9d521d7c8c7@linaro.org>
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
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-7-c9d521d7c8c7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_072749_712095_B6A68BAF 
X-CRM114-Status: GOOD (  13.97  )
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
> Increase the build coverage by enabling the sx150x modules with
> COMPILE_TEST=y.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/pinctrl/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 464cc9aca157..94eb41bb9cf2 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -541,7 +541,7 @@ config PINCTRL_STMFX
>   
>   config PINCTRL_SX150X
>   	bool "Semtech SX150x I2C GPIO expander pinctrl driver"
> -	depends on I2C=y
> +	depends on I2C=y || COMPILE_TEST
>   	select PINMUX
>   	select PINCONF
>   	select GENERIC_PINCONF
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

