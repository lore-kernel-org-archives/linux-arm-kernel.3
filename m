Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBA7D44C41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 13:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=po4SDkFceK6L+A0r9CoW5e+XAeuKVFUf0lqkYgvkprY=; b=LSrnwrRl1pTLEa3pIrxyMJ4jh9
	UgbNe97Ytj35Qq4vUc1Q0o04v/iUNH/eej718NA1CtUVGb4w2IOCAvehf8CRhkB//X6bvdezTI9A7
	insN1BGT5OhVAUQN05zmyWXA88ecIL0BW11rubsvHhARuwcQEcN3zBb+jqIch58vNksYs/wNiAOpB
	QgrIJ/FaVqMd5xV+wxWZASUfLF5rWVJHbCTanjPJ2Kz1mmychV0v7RFs0sLZrAxW9wNY050mE8/JH
	f7WEbPAIxf/sQCOicflllwM5oQcVOSHz2d8AuKV0RzzpBM86zYf3jyV1mZLo6VcyISEHXQd/5DdZ5
	mYlTCM+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNHg-0000000CPNd-33xU;
	Thu, 15 Jan 2026 13:21:08 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNHd-0000000CPNB-0Iwm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 13:21:07 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b872cf905d3so149563366b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 05:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768483263; x=1769088063; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=po4SDkFceK6L+A0r9CoW5e+XAeuKVFUf0lqkYgvkprY=;
        b=KS6Zhx0/vU5essPpa+aPoUREvyjqrK9iRjlmfy76tyX+Ri2yXhKXuQOH53saqJsM9W
         TTVP9oYk3w72qTXnSQfJVYsDWCuc//aHPfU9GPvVZVRrzNj8nN54jDcKoLdl7R1g5DPg
         rxQSNU7zaGcpTZ/P/Yt7HmvKqdROuBCqCS/REwiAKTPzEvaepkYihoO3CEOHmwrNTxbY
         IR5jZNYDYzMtsF5gFJwND2OLjy8/rALhq0fyyuPIO0fSYZWE0bwk6SUtwlREWKamHsKo
         dV/AXG2j4KLvURxtwXVNHCpiHe6oHbi8P2WT0mLWpQP8x/myCrHJ2FbvyTKgaJK9IfAP
         afAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768483263; x=1769088063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=po4SDkFceK6L+A0r9CoW5e+XAeuKVFUf0lqkYgvkprY=;
        b=eVEnIOkGH6u3hBaq8ycl1DoCup6IgrZoCrz4PeXIEton86DVNMPvHIRQXaglXia53n
         2F0S8QSb7c2M5FKq7jxqz8LGXXt/fMm2YiIl2dOvRX2hMfONsgeCv9OWkuRplWzhjrxm
         CaLstRgDeSqnqBHQYe5zXIidAoDHSpCXplopCZKmNyNMiRC8DBScTgdtmT0aqwsENM6o
         JIPD9SDx0RF2SbfZXAxUGostgY1G9FhE9CAoIh6ZZH0PiXAoANY8dW9Y03bg0Hbji2zr
         56CMxLjfXKA2ghZbFY45eLVVgXhDndwFRUyrTwDa/RtBcEUuUpHGwAes11xTYVKxJSix
         wM4A==
X-Forwarded-Encrypted: i=1; AJvYcCVR4UUZzabdJy/vjXdFjQWWgzv2QZT+5baoVNkA6aMccF45Sve6peKgp+SAwecmRQR0b6afdIfU28ZyLiygSnB9@lists.infradead.org
X-Gm-Message-State: AOJu0YyX+JyofzWpKwFT006NGpehRpB213UXgpUY3tuOOf0KtUctvTNs
	GRhCTIflgMjcUUU6bSV/Z9T3erRKBEwrGoH/AwTzElgJcVBpyHxGtw6Vx5xO5lfvSps=
X-Gm-Gg: AY/fxX6wONGEX8RNt2G4axm12WkncEdKCD37U5KDNTEYHY2hssDe7i9v4toZaE54SLq
	fQ1Sgu4cr7FFfIItTDs34RYlLlKH3oNYt9DGiD6VYWE+psvtIqE6B8WQ3ijqIonbIz3Xx7oo7ZX
	WB15tV1g41vJpRUo9ECkkeUPyTkKVSdHR6InshYKspWr7o3e8csiRyy3lKzY0TX/ULurgISBZP4
	EWOaEeAIIbbkTGNdLQhkATgdvFN/CkK7qgAZ50uxjEqFiO4nIkLTDZaVJpZ8HGxgo7grT4KLKAz
	WmhkA7PK58KJinqzhS3+Nw2pDrMSLvtVmqJAn2XTx/OZZsZ8Aix2tt/Huys6AI5nktBFcB7h2t6
	KMONKAJs3QwQ+Dkb8nHW4TwD83vsquN1jJwrSKDMcZt5BLQNkiqZTe7RrJVA7aSOYhHRoigCXBI
	lAHBn6Dgd868UrI92EPg==
X-Received: by 2002:a17:906:f58a:b0:b7a:39a2:7f50 with SMTP id a640c23a62f3a-b876113a364mr534982066b.39.1768483262801;
        Thu, 15 Jan 2026 05:21:02 -0800 (PST)
Received: from [10.11.12.107] ([86.127.43.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8767042186sm467121766b.0.2026.01.15.05.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 05:21:02 -0800 (PST)
Message-ID: <f7d75089-732b-42c8-a5f6-2e42e6e82c26@linaro.org>
Date: Thu, 15 Jan 2026 15:21:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: defconfig: enable Exynos ACPM thermal support
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
 <20260114-acpm-tmu-v1-8-cfe56d93e90f@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260114-acpm-tmu-v1-8-cfe56d93e90f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_052105_158713_FAA12D2D 
X-CRM114-Status: GOOD (  17.02  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 1/14/26 4:16 PM, Tudor Ambarus wrote:
> Enable the Exynos ACPM thermal driver (CONFIG_EXYNOS_ACPM_THERMAL)
> to allow temperature monitoring and thermal management on Samsung
> Exynos SoCs that use the Alive Clock and Power Manager (ACPM)
> protocol.
> 
> This ensures that thermal zones are properly exposed and handled on
> platforms such as the GS101.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 45288ec9eaf7365427d98195c48e2f8065a8bb1b..1bfe37857f51663c9d745cd575f107fef183008f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -752,6 +752,7 @@ CONFIG_BCM2711_THERMAL=m
>  CONFIG_BCM2835_THERMAL=m
>  CONFIG_BRCMSTB_THERMAL=m
>  CONFIG_EXYNOS_THERMAL=y
> +CONFIG_EXYNOS_ACPM_THERMAL=y

I should have made this a module. Will update after I get some feedback
on the rest of the patches.

>  CONFIG_TEGRA_SOCTHERM=m
>  CONFIG_TEGRA_BPMP_THERMAL=m
>  CONFIG_GENERIC_ADC_THERMAL=m
> 


