Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7C8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 07:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jPQzETbuKo49mi8wQANfNeYO7kgQRt1+vSf7zU80tA=; b=BvB/A0J+MXA5MglKghu7bUmDoT
	94lAgPjS+Hds5TyFzTkG58FKjYkCG0NxyMpQFn30BNw9q6f8EX33ZU0OgGez5IH4weCFaDTgWLf/s
	DONqDRGKIqE0M1vdpxvxys3IIxZKTwe8mLgGdpAan4kj514nVFGqObcoziOFugBsfIPV4itxrQ1U3
	JOCw82iONkiW13eCLvgZyQNKuPrGqL2JE195eOoTWwkgjkrBdb0pjwOQwzcigc7tCCJ8esB9F3fFn
	yf7YTT0vw7G6VDlfL/jVZscLQ8rblU5bwxtuozHPQ0Oy591JgX40hcVC8QLyCI5IyCQ2FkirQiGxb
	NsuJc2HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSAe3-00000004m6W-0CXQ;
	Mon, 30 Dec 2024 07:56:59 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSAcq-00000004lyY-22vS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 07:55:45 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-385deda28b3so6507144f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 23:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735545342; x=1736150142; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+jPQzETbuKo49mi8wQANfNeYO7kgQRt1+vSf7zU80tA=;
        b=XGxOyz1dCdqGQ3oNFFwa4GYZBoT9tWdhpTZzppiH3mQK9gKOlIb7wV5kboN6syZVNt
         GBmMd05viwGc4lZjjt1HyabevpmWvN3NAR88fCIYVn9TXGFAxDRxZyQTaN034kZSH3dM
         q5n0xVQlhwL4db018bVdXj1aaKGW+7U/7decKLhnG40N9mXZfTEuplf+NpW8qIfIbRez
         26mcVkVY1jExxGDAAhTdL3aQlwMwOPUgz7MG8N2ijL2M4Q/7/DHTnyxx+j57ftldIdpa
         MGjJe9qicw4aLUHxmu2pLFxPnjEPpKrLIruomplAixMPAFI9y6JSyEm0OiYU18tSBcxn
         6w7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735545342; x=1736150142;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+jPQzETbuKo49mi8wQANfNeYO7kgQRt1+vSf7zU80tA=;
        b=VH1ad5RTK11VTxcOTpC+8cXDqcz2yLow+l+dsj6myl4r2x+QiSmLewsewppUzHrs9S
         0rFVX/1YN7a6PgHPikH4YgSSve2LRLs912iZoOAtPDJ9DGEwUVv90+kEoeX2Z0/YdQke
         M28OsDSGbHZ0T+i8jV9IEQXGw4lyQkZu1vmQPgu4DebbBOzogku5iOTtDTL+3UVnvHax
         S0mEChXOumalRDLu0589km4s1D7+t02HtEboP0M54tEgPkO4DnUjPpFYYqr62NNtcxcO
         PssERznuYnQJ4s2Pvq0pV39qa5fr/KcqqzbsKPuxcfQ9epGd6uMV2Ifq+kvzxTM5lc6y
         SSsA==
X-Forwarded-Encrypted: i=1; AJvYcCVtwr/kerLvT5gT70WEkg9NYyymFpGBkJS5Li7UV1Vkbxce9NZ3c5534M/EWi9SoL8qOU6vZgjglah5XVQZ/3Rn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1cQAKrKlYPs3WcaU301oW+cJJezqJEAeKNGH8e5W3lgP3F4gx
	6YoQVTazprISzVpi08OT1xRJe1qRH8Z7UG0nS37G6fccgy1+XAoM
X-Gm-Gg: ASbGnct+tNtziMfeUt47W0xoF8nqEsmIiZnoIOZ2nAR+FVlS/u0LudiV8aydH9gCi3U
	X7/StvSm93n6MdSP3QHau+jshdN5y5awhwG6+U8z/z7He16iSi07CiYUJoS90lulvDb/w8Gp/3j
	wlBn0YPerE5mOqtBkRO5MJVtDy+9bUcLA0HGdH06u6GaK96dyjcIPdlszM2qk+NbYvoIvg6dKGE
	9wtO0r3nLaIiygXIwJz4PazJFaiRT/zHsW32E/Uam1/jYdhYGpXNDUiYZRiBoSYF8WmWOIrDw==
X-Google-Smtp-Source: AGHT+IG2dh4UWHVSRIJXHl7OjSsaZff31+ehklabWaUsZJyeJBLzx13CbR+b1hLaxiOcwwHHm6XF2A==
X-Received: by 2002:a5d:5e09:0:b0:385:e3c1:50d5 with SMTP id ffacd0b85a97d-38a223fc3d0mr34519211f8f.48.1735545342134;
        Sun, 29 Dec 2024 23:55:42 -0800 (PST)
Received: from [192.168.1.104] ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8a8d3dsm29034261f8f.94.2024.12.29.23.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Dec 2024 23:55:41 -0800 (PST)
Message-ID: <a9c25aa2-d61e-4f67-8e88-a214e2b8d628@gmail.com>
Date: Mon, 30 Dec 2024 09:55:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynos8895: Rename PMU nodes to fixup sorting
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241222145257.31451-1-krzysztof.kozlowski@linaro.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20241222145257.31451-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_235544_532069_0BC70008 
X-CRM114-Status: GOOD (  16.74  )
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

On 12/22/24 16:52, Krzysztof Kozlowski wrote:
> Nodes should be sorted by name but it is also nice to have same class of
> devices together, so rename both PMU nodes (A53 and M2) to use "pmu"
> prefix, instead of suffix.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> I know we have everywhere else in pure-ARM designs nodes "arm-xxx-pmu",
> but this is too trivial and unimportant to change.  I however want to
> avoid copying unsorted-style code to new patches.

Looks good to me. I'll make sure to inform other people too, considering
we should have at least 3 SoCs lined up for Q1 2025.

Best regards,
Ivo

> ---
>  arch/arm64/boot/dts/exynos/exynos8895.dtsi | 48 +++++++++++-----------
>  1 file changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
> index 90b318b2f08a..d31d74cc4580 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
> @@ -26,30 +26,6 @@ aliases {
>  		pinctrl7 = &pinctrl_peric1;
>  	};
>  
> -	arm-a53-pmu {
> -		compatible = "arm,cortex-a53-pmu";
> -		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupt-affinity = <&cpu0>,
> -				     <&cpu1>,
> -				     <&cpu2>,
> -				     <&cpu3>;
> -	};
> -
> -	mongoose-m2-pmu {
> -		compatible = "samsung,mongoose-pmu";
> -		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupt-affinity = <&cpu4>,
> -				     <&cpu5>,
> -				     <&cpu6>,
> -				     <&cpu7>;
> -	};
> -
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> @@ -149,6 +125,30 @@ oscclk: osc-clock {
>  		clock-output-names = "oscclk";
>  	};
>  
> +	pmu-a53 {
> +		compatible = "arm,cortex-a53-pmu";
> +		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu0>,
> +				     <&cpu1>,
> +				     <&cpu2>,
> +				     <&cpu3>;
> +	};
> +
> +	pmu-mongoose-m2 {
> +		compatible = "samsung,mongoose-pmu";
> +		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu4>,
> +				     <&cpu5>,
> +				     <&cpu6>,
> +				     <&cpu7>;
> +	};
> +
>  	psci {
>  		compatible = "arm,psci";
>  		method = "smc";


