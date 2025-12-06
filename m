Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D99D3B7D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 10:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIO9SzB3Xa4kmj3UsTvTuplTcl1BtW8wdpyi8S+F8h4=; b=Gnse1yuL8ByannBNHxSwi8zrUQ
	o+943DlxBZEHZS3U5qqj38tace+BgkqLN1tbf79I5GqWPAevGMufwMhRFfpLaLcf9yQjswsy0Eiy9
	9siU+kIupO7nIdCZP/rjWsl8RKjwJhdPV0EEBeA5teKviR0c02qUcKhcNS14UzFAwqTjM/SGZTto1
	2nVOraIxgu18L4RC8AemAblN2oxHHSQCfpcD0damzPDWj195sPbZ141EtyZOu7b/rYhwNpvSaRRw6
	930AejpK5n24VVNGLtmyd30xSG3UeznyShvcBnb8GYOGu6y6PN28rS1EK3473vfD0nJuo6s+qvWCA
	mFKttfwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRq0h-0000000AqDF-0iv5;
	Sat, 06 Dec 2025 10:59:31 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRq0d-0000000AqCu-2KbJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 10:59:29 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42e2e671521so1915400f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Dec 2025 02:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765018765; x=1765623565; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RIO9SzB3Xa4kmj3UsTvTuplTcl1BtW8wdpyi8S+F8h4=;
        b=B83KRYrGXPVvGjiQDTvH09X8g/Czylc+RLe087QgyHCjujW69J/j9zDC+MhFOw+skE
         MKsqeW0ena4Vc45xXjgTJtUr2g+tpAKYThOQOcopSZVBe+fJojHN/F5Zip/PUrtr8aaI
         GwhUrEBmQx3D3KJMRGoOBoMEyE8yDZjT9zIIN7/FTzMcaSz79DSUKddMaV+mHUnwcZ7n
         L3sICDMwIqatHQoiibZLkiSmKyQjhY9lU0NiasnabLWUp/2PQ68r+TAXWNkJTOPDzdek
         B7fukSGbrFrUaxmL7BzcdTNh1b5nlQPhz8/zJtLbFJGuTM/AWGMdEYB1DmfkjFcw/8Yl
         NadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765018765; x=1765623565;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIO9SzB3Xa4kmj3UsTvTuplTcl1BtW8wdpyi8S+F8h4=;
        b=VpPsd/mmQppqEnhhsy18tKC7lNueXOhPTwCdKUT1DISpMIcWzk+vU3yMfsJUK/BOMW
         5CQMiF5s1ZanR8qa8d500esu/Zc9gaK0nqISP0D26PMkyz1uTEIQzv9M03GMFsUqKfYJ
         C+NRKNgnOsXTWIl3ejrEdkVXGZVydYuO8nBL7UCS1VZCOF4pTq0TUphwht9hsS8W41fD
         WWuy0FedtDj5dbtcYjDaH59UUoC/b15dIWajeXuhW7WHcztWPsmpIsqwOb5GouApcSMR
         qSUu+SSKw1fZdkJaRHMAP9kykMIBnhf3yxVHDAaD/QT+eBCQ+u1DAop+NMI7o4KZblNP
         +cyg==
X-Forwarded-Encrypted: i=1; AJvYcCXeNWb0Y71eokDVHYqpYAnUVS+siKRChMov3pmgKkV/NfVhICvj+ogNVqHbddgOQHMH7ESkV6pzKmANvzBoDyLq@lists.infradead.org
X-Gm-Message-State: AOJu0YxVzn9XOtXD2ieT+RwaiCr2Gw9M9cW6vH6IPziE4DqGk2gJRsnT
	3KfOET71PPKftKD01iZBd1ruCJrRTqdl3uNYRZodtP0t+Iq16YKvOLow0KeByRTD+RiDMMMLnMf
	/7ih2
X-Gm-Gg: ASbGncteL8ac7Wk9ba0UMh5v10l8cXRLvbMLzzO/KVlCxGYSNWKQH94tUKf2KSfBQlX
	UQ79ZQtTgahFu+93EgOxN3QtdUsK7dR41TmhABPo1bQqip50xIN+BxsbrjwjrFN1CJa6wpB/86D
	LigemZCwbeUFflAtrycvUfBh1bqzr/HF4UMDqM6ZpNOEwAgXxrmZTRug79fPvdiLyAXc6URKimt
	ae25XRGQkZmrzI2Nc2lIArpIoVKFDs2gkM7MuLc4o9l34jBAZq7glYzIF9wDJnWi9Inn5U4DNB1
	FC607LKeuEuyzURqL9FG/zCRYSFei89NyaJl/fdzquXdfN1mGkGD7byJGW4K96oQ/4KH4LXzKiM
	zZyMFM088qyXpiCsf1cVxanHj9Y9oMIhE9uNh2+rolfVrMMPi03Ff4ANOTQgvISBrZBlWm4wPxv
	vcRoNQsZh63AH2YgeJgHMtcOxbu1byJQ==
X-Google-Smtp-Source: AGHT+IFxGBJ/k+j6ZJVsFWmHOE/rf9wjq6MUOtPQXnpgzYxyl4FqltBjWGP+EQyry4lPmAzMGt5Q8g==
X-Received: by 2002:a05:6000:2c12:b0:42b:3d93:9a27 with SMTP id ffacd0b85a97d-42f89f455b1mr2081660f8f.36.1765018764417;
        Sat, 06 Dec 2025 02:59:24 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbff352sm14011733f8f.17.2025.12.06.02.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 02:59:24 -0800 (PST)
Message-ID: <b8e4805e-c0fc-489f-941d-d052668cbe74@tuxon.dev>
Date: Sat, 6 Dec 2025 12:59:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] ARM: dts: Add support for pcb8385
To: Horatiu Vultur <horatiu.vultur@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, wsa+renesas@sang-engineering.com,
 romain.sioen@microchip.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251201082629.2326339-1-horatiu.vultur@microchip.com>
 <20251201082629.2326339-3-horatiu.vultur@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251201082629.2326339-3-horatiu.vultur@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_025927_804098_BB342ED0 
X-CRM114-Status: GOOD (  18.08  )
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

Hi, Horatiu,

On 12/1/25 10:26, Horatiu Vultur wrote:
> Add basic support for pcb8385 [1]. It is a modular board which allows
> to add different daughter cards on which there are different PHYs.
> This adds support for UART, LEDs and I2C.
> 
> [1] https://www.microchip.com/en-us/development-tool/ev83e85a
> 
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/Makefile          |   3 +-
>  .../boot/dts/microchip/lan966x-pcb8385.dts    | 131 ++++++++++++++++++
>  2 files changed, 133 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/microchip/lan966x-pcb8385.dts
> 
> diff --git a/arch/arm/boot/dts/microchip/Makefile b/arch/arm/boot/dts/microchip/Makefile
> index 79cd38fdc7dab..08986c24a4700 100644
> --- a/arch/arm/boot/dts/microchip/Makefile
> +++ b/arch/arm/boot/dts/microchip/Makefile
> @@ -102,4 +102,5 @@ dtb-$(CONFIG_SOC_LAN966) += \
>  	lan966x-kontron-kswitch-d10-mmt-8g.dtb \
>  	lan966x-pcb8290.dtb \
>  	lan966x-pcb8291.dtb \
> -	lan966x-pcb8309.dtb
> +	lan966x-pcb8309.dtb \
> +	lan966x-pcb8385.dtb
> diff --git a/arch/arm/boot/dts/microchip/lan966x-pcb8385.dts b/arch/arm/boot/dts/microchip/lan966x-pcb8385.dts
> new file mode 100644
> index 0000000000000..6bbe1222f9106
> --- /dev/null
> +++ b/arch/arm/boot/dts/microchip/lan966x-pcb8385.dts
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * lan966x-pcb8385.dts - Device Tree file for PCB8385
> + */
> +/dts-v1/;
> +
> +#include "lan966x.dtsi"
> +#include "dt-bindings/phy/phy-lan966x-serdes.h"
> +
> +/ {
> +	model = "Microchip EVB - LAN9668";
> +	compatible = "microchip,lan9668-pcb8385", "microchip,lan9668", "microchip,lan966";
> +
> +	aliases {
> +		serial0 = &usart3;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	gpio-restart {
> +		compatible = "gpio-restart";
> +		gpios = <&gpio 59 GPIO_ACTIVE_LOW>;
> +		open-source;
> +		priority = <200>;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-p1-green {
> +			label = "cu0:green";
> +			gpios = <&sgpio_out 2 0 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +		};
> +
> +		led-p1-yellow {
> +			label = "cu0:yellow";
> +			gpios = <&sgpio_out 2 1 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +		};
> +
> +		led-p2-green {
> +			label = "cu1:green";
> +			gpios = <&sgpio_out 3 0 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +		};
> +
> +		led-p2-yellow {
> +			label = "cu1:yellow";
> +			gpios = <&sgpio_out 3 1 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +		};
> +	};
> +};
> +
> +&aes {
> +	status = "disabled"; /* Reserved by secure OS */

According to [1] this should be marked as reserved.

[1]
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#status

Thank you,
Claudiu

