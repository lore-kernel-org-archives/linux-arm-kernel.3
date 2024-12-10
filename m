Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DB4E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 21:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/TEMZfbq0jaQ0Bvw7H8/whT9tQxinQCI6Wxd1hCr6Y=; b=I7pKmx+nxFQlArvGF3+ggT010f
	peYG9ENFYSInoUL6T4k5kBiv6nCp4VxSNlQc28T95P9qIvPx52Q2RLl3kGXMhzstfrj+7O8vOzL4C
	UqqgetrrTBeT8atJIbAJA4KHbvQhEq5EFQ1mESrm6O+ZoRO6l8OC54jjcaAaOX+94YZ6p5qy0RHWn
	vJ5EcRwisYRZFgiISsl5BqjL1uwz0dztnMGr4f4emdUVOSMjEs6KpC4jn/qQZp5Dc7y7q/Y55DCca
	BehP5/T5ooc+te4W4ZZR6S2i8WE3mrPDMt9j6a2/tOAk9tReGfBJ+pQkB0oseBJ0eWom5vTrfjUpx
	+d/4PSdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7WQ-0000000CmMV-3iW6;
	Tue, 10 Dec 2024 21:11:58 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7VN-0000000CmCP-0r61
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 21:10:54 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-3022598e213so22764721fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 13:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733865051; x=1734469851; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i/TEMZfbq0jaQ0Bvw7H8/whT9tQxinQCI6Wxd1hCr6Y=;
        b=XNge8uUbhag5blVLMH2a5LiQo04NAzAbv5OgLdqES9SZIPaPHH5yq/91anzB0mSkWp
         Nl6/c5LVDWFmQ2fGDxbOFRJNY6xd5lEBUu0qsu/1r+iT9Ayybf2vKxNH7q4HHjw4zdb9
         +0Y75Zml8HJ+BA+wKl/N429ELJ7S1mX8LLTlOsusNFUyVh+pmI30epG2+SrNoJLVv04T
         QMAE26XNbI1yIU/8od4ox3B68ONuh/F6ZjJlgbqZ5SbPmzcLMnom/BrkHoX7K3YQ55Ix
         bzFGpdTgqYmTk+SSdTExVdXx6iMBvGUetEXZni3uMw5PIeEdYHlztFPyKK9NqzawGBaK
         uROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733865051; x=1734469851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i/TEMZfbq0jaQ0Bvw7H8/whT9tQxinQCI6Wxd1hCr6Y=;
        b=gKL26zLk8fhdZVPPf7TCLRZ4NZsZHyCSTnddorY8gIHJG6rMh2Mit2jRqfZX/c1Zzk
         0zU9yONM+Byn1KAKVSLQbrEBtWnUaQ4bHjpALgOUcGikigFSZi64sUOKtSGGU8AsdR7F
         FLd6wk0bg//ZoNayH2QsVv52ieDgEMpl8b0xJxizYLn/JKrslgm9N1VpdkeAq4QVA7Eo
         oo6yGRc5/+MAljJQTsbcZEHUvAhhJd9M9xaVUbbiDy7u5FHBTZ4szlnLe13bBntE8pny
         d2mAuROQusPpqLqGaBmXo/ghMxFmHteGXF4yT41P1XXwQp+M/zJDwQqWDHnFUE1cf2wJ
         46LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV1BOAb926YnLTxpVy7ng7JjWgRHrza4PcCoBxHeaPHuRJwy+/ZoejdaT18D5wkWzbZQBYosryM8wN7vOmM37e@lists.infradead.org
X-Gm-Message-State: AOJu0YwPoaC2z0u4YQL0m709ZxXWCYRWDpPOSsZq7z7HH3qePgNDW0Al
	2V2f+fUWexCk0IOJABCApFoBYifCiyP3UNr29C2MFT1VFPMy9/gJ
X-Gm-Gg: ASbGncssmGSRqIaFb3/Rq8vpq1vfp/rq+s50DhurZYnEwbZRsStI3S7xMYvd2JGe6o4
	NQLzKSoDfpxovBj28rjOeM2Zn3EZRyap2NvO7ZQkcVDB7bE7/TELHhAsW6BfQUH0RG39j/hM91Z
	/eWNzDwbhlS9FHdhAtnO1+DbrhYgE+OlqwO7lugExL3Wpn+CybH0UcxM2pcuWsCkE8gEra97cYU
	ItlG2J+GqvBND3sjEn7yd6ofr2TKyZLURzqWONJQQAcePwOU2qHpftQ+4Pnl39OFQ==
X-Google-Smtp-Source: AGHT+IHRit5K/PJSdYi1ezn9KV1uCZK9mQQ4OcVcnES9kI4Wftm++v7qYBkluI6PlbbxGtVfPWA5qw==
X-Received: by 2002:a2e:9a14:0:b0:2fb:510c:7236 with SMTP id 38308e7fff4ca-30240d728a9mr2089651fa.40.1733865050350;
        Tue, 10 Dec 2024 13:10:50 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30220a14d61sm8014071fa.115.2024.12.10.13.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 13:10:50 -0800 (PST)
Message-ID: <768b70d3-910a-42f2-a61a-6338a41f41b1@gmail.com>
Date: Tue, 10 Dec 2024 23:10:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: exynos8895: Add syscon-poweroff and
 syscon-reboot nodes
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241210180216.398165-1-ivo.ivanov.ivanov1@gmail.com>
 <20241210180216.398165-3-ivo.ivanov.ivanov1@gmail.com>
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <20241210180216.398165-3-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_131053_247085_823122E6 
X-CRM114-Status: GOOD (  17.48  )
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

Hi,

On 12/10/24 8:02 PM, Ivaylo Ivanov wrote:
> For Exynos8895, a reboot is handled by setting the bit(SWRESET_SYSTEM[1])
> of SWRESET register(PMU + 0x400) and power-off is handled by setting
> bit(DATA[8]) of PS_HOLD_CONTROL register (PMU + 0x330c).
>
> Tested using "reboot" and "poweroff -p" commands.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>   arch/arm64/boot/dts/exynos/exynos8895.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
> index 90b318b2f..9eb89dd19 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
> @@ -388,6 +388,21 @@ pmu_system_controller: system-controller@16480000 {
>   			compatible = "samsung,exynos8895-pmu",
>   				     "samsung,exynos7-pmu", "syscon";
>   			reg = <0x16480000 0x10000>;
> +
> +			poweroff: syscon-poweroff {
> +				compatible = "syscon-poweroff";
> +				regmap = <&pmu_system_controller>;
> +				offset = <0x330c>; /* PS_HOLD_CONTROL */
> +				mask = <0x100>; /* reset value */
> +			};
> +
> +			reboot: syscon-reboot {
> +				compatible = "syscon-reboot";
> +				regmap = <&pmu_system_controller>;
> +				offset = <0x400>; /* SWRESET */
> +				mask = <0x1>; /* SWRESET_SYSTEM */
> +				value = <0x1>; /* reset value */
> +			};
>   		};
Aren't those already included with 
arm/samsung/exynos-syscon-restart.dtsi? I can see that the values for 
poweroff are different here though, does it not work with the value from 
exynos-syscon-restart?
>   
>   		pinctrl_alive: pinctrl@164b0000 {


- Markuss


