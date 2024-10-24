Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5ACDD0BB63
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 06:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHiB1nsK1qpZhm/FdPl8dF5UIwuidEAxiYymrmn4Sd0=; b=4UyOcURcfMQVZm2J/AeVHzqCnF
	kTjIWnBJxBYkT+HN60eIpujlNrzhgC7sfvwTfNxRLi/zmmKF/Trq1VFLJ2V5q05TCUcr+mo8WRF94
	6+a60FZHo798++kuDBc/8GCKzCM+pc5ElYIqay05Ayy34uKt8DyYhI5hVs/JUfweV3VdT162pzQoL
	U6MR85PeqPqvd6lCb6qPIHdaJXgl1Q9FkdjGaiWJRx8M3baJx5eUdWfSV7lWm1oMCWs47ARYSTZ99
	m7WKtxZnUllnfJo45S6YUy63zCsOQhr+aM0M+u8M1Z02e0//u26SKt080+WzcnszXI7WJibTlgAQ0
	x7ol9h1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rIo-0000000Gv17-3bYC;
	Thu, 24 Oct 2024 06:26:34 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rD3-0000000GtqF-2GhQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 06:20:39 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5c962c3e97dso647776a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 23:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729750836; x=1730355636; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MHiB1nsK1qpZhm/FdPl8dF5UIwuidEAxiYymrmn4Sd0=;
        b=H/+C79TKt2EdV+JjGi52+OmzeY9oryQ9/3c2FL3WmneUxmIlGmU532I5ZlzWXp/SXl
         SVrtLSeCy9qFnYre0GqvzSEwsXtXsuxtYhKbG7fq4Qo1E8jSSI2AGq+yCoMlEbvOi422
         kIjrnAJU3oy4r4ldPxVEUZ+HxAGfGcRK9C1IoMTsDghHZuedGTot0K2ZGj4jfNyN+phI
         j9L3TR3/C3I9VybbDd+RcFsb5prjxtsSIhTVyn9csYrNXqrjpve7zqXfeKWTl7+j/acw
         5dFtAk2/T+6py4mWAxKUEfCKViSww4N3C7OtsiEuX/6MFVO2vP9C1h16JlPyi8mUTMak
         PZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729750836; x=1730355636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MHiB1nsK1qpZhm/FdPl8dF5UIwuidEAxiYymrmn4Sd0=;
        b=CTf8sOjIN2bUinyHAptCHVkkZjm8XyGmANgH+V+C78Us/bNUc7BFZw+/PSoNUaXwOC
         jj/u/Xd0Glbr9evxh5rEJeax5cO1LXbqLJfoXJ00sfxy6ZgGVfS2qQOuzE1/SL5IBI/a
         TnIVG3cAwUJz+iySg3AomMqzxsSzyzP9nn6xxalHCZ591wzAgEH6/Go66KsRXM6be0ca
         ZFsT4mcuaUmWXW1Ya74JX8RjQyB1PVbZq1CsHq46bNIoCZ7GGToCImV9gIaEh4F+txhq
         t4q5vGvd/CcfcPogVfxbtZuB7tNoXv+cc6OsR8+xU7Y+fMzMqb5QE/kJbQwPqvZlzmk1
         X8Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXdRqW9/Ltlz4U0qNDNUTvrJGVWZjjRx+BhaD4nNwAfjVE7Ft0CT4poXhmRuHNFKTPodrZKQS2PHNtWqPUgyNfK@lists.infradead.org
X-Gm-Message-State: AOJu0YzVWUbQ/4Jve8c4gmi8nfUMBJCVAh1onr9ef92ux3W3RNAHrvRu
	uqAyWypJTd578L7pwnTAr2q+kfnN8mHNmevqEx+9H6dMLv8GHo/n
X-Google-Smtp-Source: AGHT+IE2ZpY7TmUgBuR96ZhsvqeyEqfMsfdiuqhfVmq7J7r5uGb4JyadGqwO6kl6EYjCqQuB82Uu0A==
X-Received: by 2002:a17:906:7309:b0:a99:dde6:9f42 with SMTP id a640c23a62f3a-a9abf96ce04mr509757366b.47.1729750835227;
        Wed, 23 Oct 2024 23:20:35 -0700 (PDT)
Received: from [192.168.35.18] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91559dfcsm564188966b.132.2024.10.23.23.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 23:20:34 -0700 (PDT)
Message-ID: <596cc7e3-ecba-40f4-a3c1-321c31c0240f@gmail.com>
Date: Thu, 24 Oct 2024 09:20:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] arm64: dts: exynos: Add initial support for Samsung
 Galaxy S9 (SM-G960F)
To: Markuss Broks <markuss.broks@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa
 <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maksym Holovach <nergzd@nergzd723.xyz>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
 <20241024-exynos9810-v1-12-ed14d0d60d08@gmail.com>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-12-ed14d0d60d08@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_232037_619679_8248B71D 
X-CRM114-Status: GOOD (  20.41  )
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


On 10/24/24 01:36, Markuss Broks wrote:
> Samsung Galaxy S9 (SM-G960F), codenamed starlte, is a mobile phone
> released in 2017. It has 4GB of RAM, 64GB of UFS storage, Exynos9810
> SoC and 1440x2960 Super AMOLED display.
>
> This initial device tree enables the framebuffer pre-initialised
> by bootloader and physical buttons of the device, with more support
> to come in the future.
>
> Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  arch/arm64/boot/dts/exynos/Makefile               |   1 +
>  arch/arm64/boot/dts/exynos/exynos9810-starlte.dts | 119 ++++++++++++++++++++++
>  2 files changed, 120 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
> index 7a934499b235892eef38cd926905e02f0ce08278..6760b3d59e819fb52bc8cf4dc6877a0b9db9ce47 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
>  	exynos7885-jackpotlte.dtb	\
>  	exynos850-e850-96.dtb		\
>  	exynos8895-dreamlte.dtb		\
> +	exynos9810-starlte.dtb		\
>  	exynos990-c1s.dtb		\
>  	exynosautov9-sadk.dtb		\
>  	exynosautov920-sadk.dtb
> diff --git a/arch/arm64/boot/dts/exynos/exynos9810-starlte.dts b/arch/arm64/boot/dts/exynos/exynos9810-starlte.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..f3a1910402b8d686dd7bd156a691ec541e10ad08
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos9810-starlte.dts
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Samsung Galaxy S9 (starlte/SM-G960F) device tree source
> + *
> + * Copyright (c) 2024 Markuss Broks <markuss.broks@gmail.com>
> + * Copyright (c) 2024 Maksym Holovach <nergzd@nergzd723.xyz>
> + */
> +
> +/dts-v1/;
> +#include "exynos9810.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	model = "Samsung Galaxy S9 (SM-G960F)";
> +	compatible = "samsung,starlte", "samsung,exynos9810";
> +	chassis-type = "handset";
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		framebuffer@cc000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0x0 0xcc000000 (1440 * 2960 * 4)>;
> +			width = <1440>;
> +			height = <2960>;
> +			stride = <(1440 * 4)>;
> +			format = "a8r8g8b8";
> +		};
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x3c800000>,
> +		      <0x8 0x80000000 0x80000000>,
> +		      <0x0 0xc0000000 0x20000000>,
> +		      <0x0 0xe1900000 0x1e700000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		framebuffer@cc000000 {
> +			reg = <0x0 0xcc000000 (1440 * 2960 * 4)>;
> +			no-map;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&key_voldown &key_volup &key_bixby &key_power>;
Sort alphabetically the same way as the nodes below.
> +		pinctrl-names = "default";
> +
> +		/* In stock firmware used for assistant. Map it as a camera button for now */
> +		bixby-key {
> +			label = "Bixby";
Small nit: isn't it referred to as a "wink" button in downstream? Might be
best to stay consistent with that, like exynos8895-dreamlte.
> +			linux,code = <KEY_CAMERA>;
> +			gpios = <&gpa0 6 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		power-key {
> +			label = "Power";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		volup-key {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		voldown-key {
> +			label = "Volume Down";
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			gpios = <&gpa0 4 GPIO_ACTIVE_LOW>;
> +		};
Sort the nodes alphabetically.
> +	};
> +};
> +
> +&oscclk {
> +	clock-frequency = <26000000>;
> +};
> +
> +&pinctrl_alive {
> +	key_bixby: key-bixby-pins {
> +		samsung,pins = "gpa0-6";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	key_volup: key-volup-pins {
> +		samsung,pins = "gpa0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	key_voldown: key-voldown-pins {
> +		samsung,pins = "gpa0-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	key_power: key-power-pins {
> +		samsung,pins = "gpa2-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
Sort these too.
> +};
>

