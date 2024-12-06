Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D544BE77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhFxr4SRTC9Zxf9sqZGYHRV8vzds5Ebl4ERuSfIh/gI=; b=E2eYhG/fgU0yE5wxuQMGFktrC2
	9zJChONsVA8wBjcHGglljq2FaZAlQAW1lWI4IFQzWQ4bRkUhCHDoPTSdIt8nCaR2zLfKFTJhcei+m
	K8P+5JZQijwb4LzzEyxiZFtuOoRz85IV2h9lbly99jxM6U+Kvb5EDSYtlY3pFWm5evyqOWEXcfFvT
	vqjZbk6Iq/yJcJaHQ6xUJ1ooyf+20W0WEQ24EY72VXs4bC00udGoQj4TN0rHWgczdyZ3Ceo/9z7dj
	7VhnvpwyPehHASiGAOzDrP1uux5ZFSZo3OVmU3+t2zXI6CbcUOzFTJe/ee19Xd/LyoWmzrK90DD21
	uQ9nV2yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbDb-00000002A4g-0RsW;
	Fri, 06 Dec 2024 16:30:15 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbCZ-000000029sE-36qD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 16:29:12 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aa560a65fd6so396595566b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 08:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733502550; x=1734107350; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fhFxr4SRTC9Zxf9sqZGYHRV8vzds5Ebl4ERuSfIh/gI=;
        b=HfopqW2sEAmcGtn+Rx7q6IX0PjkfxRuYPNPXeNH6hA/oYrX0FWKenlhJoTHzmXo1/s
         s3WMRDsxZgNvgHvoR8z+a002yYsBYoQnMqcr9bPZNNoaDFcGhH5MjAWJgLksD/QlUWeZ
         Ekg1nBH9X6/GtXs2Gr0nU/D8mei2ANrYNb/y02pjEQI+5I4DxnPF3wd9QVio6voG0EJ8
         HkdBmf1gx75uUkLFrhMptCMtDOAcZIOnxbMHOon7Khdk2qkSCsLcskcffHPoUksvz093
         /fGONHa7LGCQgsf9PSKw6hVbL1+Y2RtSFvD8r0dLas1kByg4jUS/JTKAlrcILlAdaCTF
         k5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502550; x=1734107350;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fhFxr4SRTC9Zxf9sqZGYHRV8vzds5Ebl4ERuSfIh/gI=;
        b=hauFEPYj+YWQC7vX2tPooW+ApiD1PnrIPvgScBit17cISZZbYbmE9h/MyRPP1/LwQv
         CaHAKh8P9Gyqf1fVUZ/u3vokAzxYNXUg55tJbOnV02VNpTmexMj0YO85Q41ZW7Q8Ghx0
         KkwUx3vvOR9Ak1PafuMGZlXTy/NdMspMIqvq+g66BrxPdicqcEDWmdhbZbEiFpZV+7KU
         5oHRPtkLVgx3CRunTqo1Gygb+i/bk62mfUabb5g6KOStEq5FBzPDTWbtDuVLcAHmH0Mp
         J93cAE3HJN9l7121u5JqIW6TG8+6+xOuNqnMbJOaXEWn2FQR+ye3tRggNzSBOJ3YgTCH
         xwCw==
X-Gm-Message-State: AOJu0Yw4GvJXFCSvmU6l8dIHbBMdnmhDsK/bOf/6wYpZEZVsCZb/eUHE
	IStTR+F6FyuKm4Gu5Rq9tc+KXWo+gsB8spm4ftm9DcJStVIPSHwj
X-Gm-Gg: ASbGncv2fs2KbGqGKOLhMKdYYJxrcDEw7RJgCUFMQOM7+6bfNWiQcLtwdL7Y5vPTPjJ
	eV+rhexbnPpUsGnufDFogFFOwrq+6jPWsPapalItO+K+9DXJ/vyGxNgfMDg5Y0P0KRc/KUoIOGC
	ihoNPrHdbGWqooArvOWsdbooANkOyV+OCTtPPtCtM0luf6ZbSSvJAzYaTD5yEHeCl7GfAB0vsJ4
	4jHXd96PnH7sci9fCcAbBsJlnh6LKWDrEMP9o7Ilm2dEtsleA5uTxvrt0yO98LHL7hvfhbxqr47
	eqlPBWl9qrbCT83IIKexYdEqpn3m
X-Google-Smtp-Source: AGHT+IF86QyycasoUk+ELZ9QbLE4bGmnC9yh+mUscHAIYaOpvP1/1w6LcGQtootw3at/t7O2OP71pw==
X-Received: by 2002:a17:907:60ce:b0:aa6:4a87:3c4 with SMTP id a640c23a62f3a-aa64a8703d1mr22320266b.3.1733502549893;
        Fri, 06 Dec 2024 08:29:09 -0800 (PST)
Received: from [192.168.1.107] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62608855bsm261793666b.138.2024.12.06.08.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 08:29:09 -0800 (PST)
Message-ID: <be1bcd99-8a05-4b7f-8546-23cd96071e05@gmail.com>
Date: Fri, 6 Dec 2024 18:29:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S20 5G (x1s)
Content-Language: en-US
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 igor.belwon@mentallysanemainliners.org
References: <20241206154149.4271-1-umer.uddin@mentallysanemainliners.org>
 <20241206154149.4271-4-umer.uddin@mentallysanemainliners.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20241206154149.4271-4-umer.uddin@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_082911_785596_8FFD9CFC 
X-CRM114-Status: GOOD (  21.04  )
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

On 12/6/24 17:41, Umer Uddin wrote:
> Add initial support for the Samsung Galaxy S20 5G (x1s/SM-G981B)
> phone. It was launched in 2020, and it's based on the Exynos 990 SoC. It
> has only one configuration with 12GB of RAM and 128GB of UFS 3.0 storage.
>
> This device tree adds support for the following:
>
> - SimpleFB
> - 12GB RAM
> - Buttons
>
> Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
> ---
>  arch/arm64/boot/dts/exynos/Makefile          |  1 +
>  arch/arm64/boot/dts/exynos/exynos990-x1s.dts | 28 ++++++++++++++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s.dts
>
> diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
> index 948a2c6cb..7dbecd367 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -10,5 +10,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
>  	exynos8895-dreamlte.dtb		\
>  	exynos990-c1s.dtb		\
>  	exynos990-r8s.dtb               \
> +        exynos990-x1s.dtb               \

I noticed that there's spaces instead of tabs to indent the '\' after
exynos990-r8s.dtb, unlike the rest of the entries. This patch also
uses spaces to indent the whole entry. If maintainers are fine with
it, then it's alright, but if there's a v6 you could change it to use
tabs for consistancy's sake.

Rest looks fine to me.

Best regards, Ivo.

>  	exynosautov9-sadk.dtb		\
>  	exynosautov920-sadk.dtb
> diff --git a/arch/arm64/boot/dts/exynos/exynos990-x1s.dts b/arch/arm64/boot/dts/exynos/exynos990-x1s.dts
> new file mode 100644
> index 000000000..1ae881015
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos990-x1s.dts
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Samsung Galaxy S20 5G (x1s/SM-G981B) device tree source
> + *
> + * Copyright (c) 2024, Umer Uddin <umer.uddin@mentallysanemainliners.org>
> + */
> +
> +/dts-v1/;
> +#include "exynos990-x1s-common.dtsi"
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	model = "Samsung Galaxy S20 5G";
> +	compatible = "samsung,x1s", "samsung,exynos990";
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x0 0x3ab00000>,
> +		      /* Memory hole */
> +		      <0x0 0xc1200000 0x0 0x1ee00000>,
> +		      /* Memory hole */
> +		      <0x0 0xe1900000 0x0 0x1e700000>,
> +		      /* Memory hole */
> +		      <0x8 0x80000000 0x2 0x7e800000>;
> +	};
> +};


