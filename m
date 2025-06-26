Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE43BC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 14:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idh10+JsRz1ZHjVnaSYCjG9wWXpOOuIrbzWNYHckzT0=; b=ENlmZwBHrZ8EIXzWGkwbAJNYUw
	KTi4sax1CPkjgwZzovXBOcWMS6Rv0Wi8maY//2gbaL1UMI4QGVMUEjIa115nk29Mf+WB9MdsG1Hyu
	+83Ak0Nart/LHKsir/tYO2ludN5f6deXNAjub8WDklrrdP8nCaEGRJO6qi5yOO1CwI3HsH2y+FC30
	v04FB4rsmVXnqAvGK13R2kipf97dDVYZDybKONgLUMGb1ecb/aOUPmB8i0yo/4z6jD6B0WPNEass2
	jB5x9UfwS0bIiJrOcX8nYcVMxqhjE9WkTgLYSGMn11B5uQxyoVU7MNpa0iGNO4dxicYWGad75vSYS
	ZRXP4jKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnaZ-0000000BvGr-21pt;
	Thu, 26 Jun 2025 14:28:31 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnLR-0000000BsQ2-12vi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 14:12:54 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4536b8c183cso6986495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 07:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750947172; x=1751551972; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idh10+JsRz1ZHjVnaSYCjG9wWXpOOuIrbzWNYHckzT0=;
        b=CYReqlOSCUrR9JPGcXejzCn3wtkmNDQh9ahcihneTgdva4wna+lk967daIL05D5KPu
         YhjzG1NvLA0+LL9AEeW3QZDZ0TAPKue6hFfABd9uFP6Sg6i6dJSxGWQHpR1rdPCM4mW4
         ueO2yqOimBvDM/Pqppqcof9jKgUCGCl35bR+FSng+RWOkdy2pDayhKbGSEV9DR6mi+60
         k4FR/OTDixzVF8fWi4MJr0faPnioRWPW8Xow/GmOsO2KzJDdok9Lvc1QfyFZc82iwHgq
         PRGngvCYstkL37L2wu3YpgaCTBiG2S0Pv8TmUZAGhK+2KBXJGvMGqGGM4eNGafMWx1Wl
         hnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947172; x=1751551972;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=idh10+JsRz1ZHjVnaSYCjG9wWXpOOuIrbzWNYHckzT0=;
        b=Jun2XMHGkk6mOMcJklIEno7GpafThkKweIZrDnOM9tXW2zP6Cpzd/O61SPBSpsoMvt
         OHW3WOYbj4V/d97nLhts0LfAnFkv2+oLznv05CTLG7EGIAHb2Obhj5ByrT0AaFzdqr28
         orLyZ0Gwb2BL5kUUTK1a3r06TuZct4HheuNrV6+tO3FrgYK/Or9I6NVUGgoCN2GF094+
         fjAoCzH70jvTDmZPvlznC6bW5f033qMD4hizvFhQ6YLaF+Zhj7ZffOBd7dWapVAFrobW
         fP7zzOZCec6HvB0lqW48zu0ODGEYa5WnQW0E7iPET0Ba0IJJfdSWrqzMfLk55/sC2fHg
         TFug==
X-Forwarded-Encrypted: i=1; AJvYcCVDEgn6uXDB8R6qnVF6PPo6xiUU7gj0rnwkVzE6tcYESOTEduVrC96SMtkGgxZy2YTCJw3b87iPSsO0FWhm45YP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0cxU79YbfyAhZwXMGBQvg1e8f8uxaRz2uIlHaMTghBh2Q0g3v
	Qj2a1KDFR9nqRQLIBK6M5KOjq1wZjWz5xLaqASESAkAOEMASE3ZWpKIhPYtpe9vNwgA=
X-Gm-Gg: ASbGncsyHoHZbEsSH/lVV/ZbNCoDhgd7mLi30HzeMaxDmL1+1y27lJQ8z75NBymXeRF
	REnKNxeFJbiA3w3/HmPTYFCAN2GV3Jzgrh/OmejeCukq9mhf5xiE++Rf/hmu8O4p0CKXJFmE9qn
	fF7aMobca9ZdFJmCVzc2AqqYHl7R6kWxz4nrZmz8lHHUmLNJWiDuP7H8U7W18ktJBsVYF9Ac1Hm
	YmJ8up92myY0zxNTvbsfw22woD0t7mUUfywvwcnFhKwMtkrAaNvpzF8AhZdVRK+JdWN6RdS+N+z
	fzybXFqNoUBkAZKdwnsYPUgu0eOt+3ftdRZ/PqiJl/t1/uRJl066/A0ad43TebqhQwbkEZvqT/K
	MqTtUmmLoI0dsNIum2uUvqchRM784nURY8+XZUzUDfmo4iUB+Cg==
X-Google-Smtp-Source: AGHT+IE7Q7mlKruv8URp7hHM6crDlnNtpi1iYsCn32qtT+RUqOTHjkI20cptaGqB8cXtsnPMosNgUg==
X-Received: by 2002:a05:600c:630f:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-45388a14880mr43012765e9.15.1750947171441;
        Thu, 26 Jun 2025 07:12:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fa6f:b132:4858:18cc? ([2a01:e0a:3d9:2080:fa6f:b132:4858:18cc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ba553sm50242095e9.31.2025.06.26.07.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:12:51 -0700 (PDT)
Message-ID: <60f437b3-2780-4bd3-95a4-d0453dcb83e7@linaro.org>
Date: Thu, 26 Jun 2025 16:12:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/5] dt-bindings: mfd: khadas-mcu: add cooling-levels
 property
To: muhammed.efecetin.67@gmail.com, linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de, lee@kernel.org,
 rafael@kernel.org, efectn@protonmail.com, daniel.lezcano@linaro.org
References: <cover.1746518265.git.efectn@protonmail.com>
 <f4d27c690b562cc72997c9ae00c6145b3722561a.1746518265.git.efectn@protonmail.com>
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
In-Reply-To: <f4d27c690b562cc72997c9ae00c6145b3722561a.1746518265.git.efectn@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_071253_292976_3CCA80C9 
X-CRM114-Status: GOOD (  14.72  )
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
> Add fan controlling step property which is used by Khadas Edge 2.
> 
> Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
> ---
>   Documentation/devicetree/bindings/mfd/khadas,mcu.yaml | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
> index 084960fd5..f69643aae 100644
> --- a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
> +++ b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
> @@ -11,7 +11,7 @@ maintainers:
>   
>   description: |
>     Khadas embeds a microcontroller on their VIM and Edge boards adding some
> -  system feature as PWM Fan control (for VIM2 rev14 or VIM3), User memory
> +  system feature as PWM Fan control (for VIM2 rev14, VIM3, Edge2), User memory
>     storage, IR/Key resume control, system power LED control and more.
>   
>   properties:
> @@ -22,6 +22,13 @@ properties:
>     "#cooling-cells": # Only needed for boards having FAN control feature
>       const: 2
>   
> +  cooling-levels:
> +    description:
> +      Max speed of PWM fan, from 0 to 100. This property is necessary for Khadas Edge 2.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    items:
> +      maximum: 100

The cooling level can be detected dynamically by reading the MCU register, so
just set the max_level to 100 when edge2 is detected, and drop this property.

Neil

> +
>     reg:
>       maxItems: 1
>   


