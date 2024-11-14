Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D249CD65C60
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 09:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIgMw3kcbX2cViYwKLxSrOgXx4G3278BNEqwDErsN4w=; b=dTB2pnITI4agh3SsB6mO+57m9R
	5PPoJH+ASIOZYenCb4K/knHmWMUROGH2Qim5+LeeH9in8ywTegEKDITdUjuxiL1tVFft+1ES2OmEK
	dyu8BdE9Jr778jriJR5jQAWmGkVrKzJNK0RcB+J8Z2zmZJi8hVq0dSelVFn5laLOHr7KCgX4Ka6HZ
	2+tHt9kBgqtPuSmN/esN9MoYagu2AdcKOStgl0ssrS3Iq4uqpaUPM8jYhH73Eq6Q2jcjV2SOU70KB
	8diPYKvSpcI5AvvH04lEhKySx9VQcgK0btUFbSZnyx+OdgDprbxsuveBZ51anvOCWoJWcrkb7kpdu
	VYfq0JZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBVtI-00000009JjR-0km0;
	Thu, 14 Nov 2024 09:11:52 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBVrR-00000009JSR-0y9e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 09:09:58 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aa2099efdc3so101076266b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 01:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731575395; x=1732180195; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SIgMw3kcbX2cViYwKLxSrOgXx4G3278BNEqwDErsN4w=;
        b=ZdYbP+eygMVbjk8915//tq7lRru0WrP/nEbIqpq0lMngyVsLzBu/57oyMw2KRhPrw7
         maK5tj8ANrNKaDgB4/zwNyecc4vgO64uJintc1fbkIVHZhGaEr7rSl+K3esZYB8Iz3Hy
         wJJ84dSC4fIqLielm9d90vc5UJVvZ0iQ+DhgyS31PTTLirsj63yJOx7aX9KKARciHn0g
         FymrreJpRWnqRJT04ojhpg2Q3uUlzgzv5uAZPvi1BFCluWqnRZBdbYGmCBPPiy6V6WXk
         zkrtH0Ix47kPsZcr2PS/rYZP8sdqlXT88wZVDlzWOarkhFTHZodBCHeNJ1/RgNFVfA2c
         55Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731575395; x=1732180195;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SIgMw3kcbX2cViYwKLxSrOgXx4G3278BNEqwDErsN4w=;
        b=dA5Db2nIVW05B/15lJ07ijE2hYGLwzBu5afpy/faT32AXV5pGZIcFFLSFbYVpel7iV
         LWxvufy/UScxdwLeCjrL4H8TjFenrnKdVaCd/2W1xFYRnae7YkYDWKGFdu72q2wmei4I
         oQVlv5z+k7V01oqkJXa0czp8oWALJW54IvQZ4u8CKlQnSJ5zfE3hOSskWayNxNImeOfi
         C8wPNnLiahnaq48md6Aite4in6uPkALgXn+WffQF1NE4dTLyOmyuGX90JUZv55IA5Y7h
         /PLgXkfGOWywFSdH3bTx1HnOjQQSk33WZY7vXez2X+TVhaoeI2ZWMyuj9dLYsJJjKqoy
         suQA==
X-Gm-Message-State: AOJu0Yzcn9YpaWgCp6P61dGMLyLEeqoIpGdjK/6RSab5GW0htNX8uTUo
	Lh1OhSAwdSGHOvshmc7sR6DW+NRiebAbvGWm9cUUXT9c/a/ckRyUeo19Mg==
X-Google-Smtp-Source: AGHT+IGBteVNoQuoY0Pbzb5nv37xUTx0G4wOdBXfGdk3MfgzzCLnRqq/tgiDnAX34GMPq6sktjArJw==
X-Received: by 2002:a17:907:6d02:b0:a9d:e1cf:b9d3 with SMTP id a640c23a62f3a-aa2076872cfmr223889266b.12.1731575395339;
        Thu, 14 Nov 2024 01:09:55 -0800 (PST)
Received: from [192.168.43.21] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df507ebsm39140366b.47.2024.11.14.01.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 01:09:54 -0800 (PST)
Message-ID: <9f48459e-f381-446a-86bf-c8d1bb8858bc@gmail.com>
Date: Thu, 14 Nov 2024 11:09:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S20 5G (x1s)
Content-Language: en-US
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 igor.belwon@mentallysanemainliners.org
References: <20241030232308.72210-1-umer.uddin@mentallysanemainliners.org>
 <20241030232308.72210-4-umer.uddin@mentallysanemainliners.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20241030232308.72210-4-umer.uddin@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_010957_313629_3ADF0773 
X-CRM114-Status: GOOD (  19.72  )
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




On 10/31/24 01:23, Umer Uddin wrote:
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
> index 7a934499b..deb8dc509 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -9,5 +9,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
>  	exynos850-e850-96.dtb		\
>  	exynos8895-dreamlte.dtb		\
>  	exynos990-c1s.dtb		\
> +	exynos990-x1s.dtb		\
>  	exynosautov9-sadk.dtb		\
>  	exynosautov920-sadk.dtb
> diff --git a/arch/arm64/boot/dts/exynos/exynos990-x1s.dts b/arch/arm64/boot/dts/exynos/exynos990-x1s.dts
> new file mode 100644
> index 000000000..162961446
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
> +#include "exynos990-hubble-common.dtsi"
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

The space from 0x100000000 to 0x880000000 isn't a hole in the memory
though, is it? 0x880000000 is in the 64 bit address space.

Best regards, Ivo.

> +		      <0x8 0x80000000 0x2 0x7e800000>;
> +	};
> +};


