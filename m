Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE45D65C57
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 08:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLyvFPHpxm3Z8eNHyU2D0j8hgC2REPkIyuqNLE8iojs=; b=V8ZuRt4ObeywXeMgqXxf7UytH0
	6HhjXP4xSU6MkY6dQS2RK3tv999/N5By4LJwJlmKrCCYryohvzWwA8A+p3Zarj+K7x7Gak5HmBSIs
	6kBRi7DQW57yKHFM4QOGIUlrikBR7+4B/+JTCxy+ss7KLsyq8+zQDomPwpKAu0SnQPpbggxiV/NXf
	GgXgflaiz+JsCIZFpj3nAdK2xK6ryyxHAHv6svUEb2wmd+BoYSAMbJSNw2jjGEA8NgTgedeOjkLf6
	Y/I+AQLnbRLTV88RzAxavFvtfRHeB/HsCtqYflJxlcF/W4nTtCiuHn8Hgti0LfyNcxx9eLYD9ab5s
	gOtkPJ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBVHD-00000009DQ9-3G7e;
	Thu, 14 Nov 2024 08:32:31 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBVB4-00000009CjT-0qoC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 08:26:12 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a9a850270e2so58270366b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 00:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731572767; x=1732177567; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QLyvFPHpxm3Z8eNHyU2D0j8hgC2REPkIyuqNLE8iojs=;
        b=SyXwrjQ9Sohv0z5ea5EWFOw3Ng02vJIOlrzmhQPAuZTeDFolc9tKnqcjkWJdlZ469w
         DDIP/lamcKr7a6RRLMFnpf6c94p4tnGB8Rucp59wQCB/yj8mb0hFE+bVvEhMu0LHH3GO
         UcuedgfrphnTBCyBvwiTRP9dlXRKnOe1I4XuCXT2zfyBHHRZ8NfXv/jev0efzeMfOEaL
         L2M7wjYn7JpPiwDna+s/hpAzACuxedgenzNRRs5zL0M50Oa9XRf8NDKP3FMJcS6dClNd
         9t4Tm2hj9U+hoqRYOtOiSm5bDnMTCtFoOQZX8JLlvGDbBsmg6QhDzDjky7mWEH91pH2j
         I7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731572767; x=1732177567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QLyvFPHpxm3Z8eNHyU2D0j8hgC2REPkIyuqNLE8iojs=;
        b=Chlw/ze90+5whXWkcHMi61mOJMNHhF35pPXuZG21glhkHgh2Ec+kE4oQfvPW2CepKW
         Z9oX4XAD6PvvMzauwC7RbmqMoYbiVBvaTexwROa4wVylwqsZX7ANdB0bM89+SLzJqzK6
         Xnz/+9T8V3wpsfHTLOU2rD5L8nqjNNgKkt2hxv5CQB51To38zsNpUNX40QtjdeYrXdND
         2M/yY493KBZ0D+S7JFwEwmywoo0uZ1FnhIz1TTqcoKh5PzFlhkiFOo7Qe2sPcgSIDCQ4
         oJL0DM8gdalAZ9LAaziYzDCDfJTJHeynmE6n+bze6h3npoKELTCPiFm9I5Td783HCRM4
         19Vg==
X-Gm-Message-State: AOJu0YzSJ7pGcjIf39svo6fnY4TXtlMBVSAbnhv17fE3yrgI2L3hOXmW
	WriaTGsEhKulqQp9wFLLMkLRDOZh47GbErmQOAe47EMpO7KGhKth
X-Google-Smtp-Source: AGHT+IEf1WmcfXNdSENwfIUsrYNgAlR4c3RtKQdPsGuXCzLAnypp6yYLWhuIvEI3eSxUjjW590bBQw==
X-Received: by 2002:a17:906:7305:b0:a9e:8612:f201 with SMTP id a640c23a62f3a-aa20cdf5073mr103350866b.59.1731572766864;
        Thu, 14 Nov 2024 00:26:06 -0800 (PST)
Received: from [192.168.35.18] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df268d5sm35235566b.5.2024.11.14.00.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 00:26:06 -0800 (PST)
Message-ID: <746e218b-a00c-49ac-a998-511696bc9525@gmail.com>
Date: Thu, 14 Nov 2024 10:26:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: Add initial support for Samsung Galaxy
 S20 FE (r8s)
Content-Language: en-US
To: Denzeel Oliva <wachiturroxd150@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241112193149.1262-1-wachiturroxd150@gmail.com>
 <20241112193149.1262-3-wachiturroxd150@gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20241112193149.1262-3-wachiturroxd150@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_002610_294296_A37E3A82 
X-CRM114-Status: GOOD (  20.21  )
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




On 11/12/24 21:31, Denzeel Oliva wrote:
> Add initial support for the Samsung Galaxy S20 FE (r8s/SM-G780F) device.
> Its launch was in 2020 and also based on the Exynos 990 SoC.
> It is only configured with 6GB of RAM, although storage options may differ.

As far as I can tell, there are models with more than 6gb's of ram.
How would the memory node differ for them?

>
> This device tree adds support for the following:
>
> - SimpleFB
> - 6GB RAM
> - Buttons
>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  arch/arm64/boot/dts/exynos/Makefile          |   1 +
>  arch/arm64/boot/dts/exynos/exynos990-r8s.dts | 115 +++++++++++++++++++
>  2 files changed, 116 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos990-r8s.dts
>
> diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
> index 7a934499b..948a2c6cb 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -9,5 +9,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
>  	exynos850-e850-96.dtb		\
>  	exynos8895-dreamlte.dtb		\
>  	exynos990-c1s.dtb		\
> +	exynos990-r8s.dtb               \
>  	exynosautov9-sadk.dtb		\
>  	exynosautov920-sadk.dtb
> diff --git a/arch/arm64/boot/dts/exynos/exynos990-r8s.dts b/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
> new file mode 100644
> index 000000000..b21863bbb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Samsung Galaxy S20 FE (r8s/SM-G780F) device tree source
> + *
> + * Copyright (c) 2024, Denzeel Oliva <wachiturroxd150@gmail.com>
> + */
> +
> +/dts-v1/;
> +#include "exynos990.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	model = "Samsung Galaxy S20 FE";
> +	compatible = "samsung,r8s", "samsung,exynos990";
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@f1000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0 0xf1000000 0 (1080 * 2400 * 4)>;
> +			width = <1080>;
> +			height = <2400>;
> +			stride = <(1080 * 4)>;
> +			format = "a8r8g8b8";
> +		};
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x0 0x3ab00000>,
> +		      /* Memory hole */
> +		      <0x0 0xc1200000 0x0 0x1ee00000>,
> +		      /* Memory hole */
> +		      <0x0 0xe1900000 0x0 0x1e700000>,
> +		      /* Memory hole - last block */
> +		      <0x08 0x80000000 0x0 0x0c000000>;

0x08 -> 0x8

Best regards, Ivo.

> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		cont_splash_mem: framebuffer@f1000000 {
> +			reg = <0 0xf1000000 0 0x13c6800>;
> +			no-map;
> +		};
> +
> +		abox_reserved: audio@f7fb0000 {
> +			reg = <0 0xf7fb0000 0 0x2a50000>;
> +			no-map;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&key_power &key_voldown &key_volup>;
> +		pinctrl-names = "default";
> +
> +		power-key {
> +			label = "Power";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		voldown-key {
> +			label = "Volume Down";
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			gpios = <&gpa0 4 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		volup-key {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> +
> +&oscclk {
> +	clock-frequency = <26000000>;
> +};
> +
> +&pinctrl_alive {
> +	key_power: key-power-pins {
> +		samsung,pins = "gpa2-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	key_voldown: key-voldown-pins {
> +		samsung,pins = "gpa0-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	key_volup: key-volup-pins {
> +		samsung,pins = "gpa0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +};


