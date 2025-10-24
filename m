Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A613CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 10:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6t96NTq7vBJvnV/QSRlBuWO2dHEvhujwQJZIc/2QTo=; b=FwqayZlJ0xj5ck0dfqORo9P0aT
	eDKO8wkWZ/04BAaEMhtxUp67Jc8qvsC/uceZx90KazLPfMg+IrCy1tx8rEhOkD1BYkGld3stykwuB
	D0LW9cBMW/fg1BiGmZbYCFt/+HVOfttlGDtVDHLdYanjHcn+PpYyO0EQvl8JRVic4tXEnvLhjLqBf
	9cLkPGdveyCdfFXQR8lwVLRLqp82kT7BMDkXwlpFjaELUYSY1Wwg3OUM1TLGSZFX1sda+U44UA/X3
	vf1dLpPW4GmLiS1FzxWJOjjK3bLlv8JfJLuGseUR5kV0Cp6wY6+3sEBl1Yo/pgqer6iQ0zI5ZgGzu
	/8zAAmdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEyy-000000091NN-1saI;
	Fri, 24 Oct 2025 10:25:16 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEyw-000000091MR-2GFC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 10:25:15 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-63c1413dbeeso3075505a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 03:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761301512; x=1761906312; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X6t96NTq7vBJvnV/QSRlBuWO2dHEvhujwQJZIc/2QTo=;
        b=CBA4z4fydidVgrz0oKGAcMpYSmqq9BRsO+sVkDBbUO87dyCdNKN1E3ABe7+u7zKaLo
         edg2uFER3NqR/PZUfi/F2/QI7eLBl766MfwM4cQY2wxJQFHIaevGJxMAyj7dPupkG+co
         3+11tVi1vW4KchEhky0VZuebHa9kzqyb9PG+W8rataLsh0juxHn1WWMnauTdwcwBceuh
         s1AYqZbWPTyCVKrGs9dyRtdR1eNnJ8+5c95h25FUPkR/c9Ob1W9Nd26p30Cfu/Adx5ue
         wcydJoZFbERRVWUUKVYIxAydWhVhLWz/468+31GTNketPK+dJG3BvwxFiXPKZEbe3Hmo
         i2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761301512; x=1761906312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6t96NTq7vBJvnV/QSRlBuWO2dHEvhujwQJZIc/2QTo=;
        b=HLLczvHdpWwsuYxrtkNCixrQJ7RXy2e6keETyYcN2RX5c1xxhISXfAb6BlfG+U7VbW
         sumzomPu0LksqCZT+WnU+TT8boF+qsXI7zr4k9oq4VxS4X+O4uB98/9u/br+Y0s2fNV7
         0hhE3v+ruuf22/ovBOf0Q7L0wEqPDorpWlPEhFUh0C1au/xfMV6ssqBRerP0ayvaa0lh
         jQYKv6AZIFNP17XqVQC4IJMVR41spxN+Ms/G/1EWf2BSQjPcyDjowYbZH4oqi/Y9TCeK
         sc0jq6IZVac1bbO2o/o2MH2/NvJq53c4bgtWI/f2geBhfnTvJse4AZMuSFvCgFX9llpo
         bE4g==
X-Forwarded-Encrypted: i=1; AJvYcCU2f6hUn880KTIML3k06SwyamR138y/Qo+5p4nki8/hfUVORNOZHYD8GsyL1ApKN/jbEYEHImV0BWp34p1cwp5B@lists.infradead.org
X-Gm-Message-State: AOJu0YwzVllvGHFp+nEw9z7prWaS2KiStV3DYiHFDhiYVte3bWCBYkJ9
	PaO7u12rb/wP9Hh/1YJlJrqvlWnzIDoCeAM0exU1b2/Nbt/sLppGBqrZ
X-Gm-Gg: ASbGncuXmgqUv7w0Qp1G8GHjIxWFzsnCk95HVTgUqpzhb5WgHTKEGR/jTVayYx3RBAs
	ongX6H3a63GPhI3GyuPw7vqpDlplzfKWDMjoqWMpINnfl4kPs/Vs4kms7Ay0P2XcbK4QTvOg4ud
	cdr4uC0DRKAvWpcjawzzgTF4+1K1IBT4dNzwj/x/TsWq/SdpApsefCBqiFxrZz+ZUR4pTZsTBLG
	kfDj7EUlvGsfL2awqTRE5ipDK/NFjKXt0tDG0C6Exi00t9K/dcle3fqspnrM9FdHUM+59RpUlYi
	Y5/i5hB2LOkR83t5BkLtGqVR/Itr1dO8kdLYqT1UYv524UfWe6zI5negBo2cZsQ/6PSXzgO+u5C
	y4j6sbWfc4prRwm0bLQJyp7is2zBAtYyv88mVBwbMiG/NUsP3NlT2r4L7Zwz137fOvDcs8h6Q1S
	xPnM1TbADx4awP8onxruEGY3vFU3cdZBbCqBFnQoFo2ZHynVL4KKi+oNJpG9YOSKcCXgTUmiu2e
	sZfI7K06sgL
X-Google-Smtp-Source: AGHT+IHTHgs0pyWlo13qBQS26Rgr3vhTfFmMcTIQ+wdzXkyhuEnAqbnnt4Ad2dnb5X5EuPrAo4MDig==
X-Received: by 2002:a05:6402:2708:b0:634:5db4:8fab with SMTP id 4fb4d7f45d1cf-63e6008435cmr1888460a12.6.1761301511996;
        Fri, 24 Oct 2025 03:25:11 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-81-118-90-13.business.telecomitalia.it. [81.118.90.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3f324275sm3877742a12.33.2025.10.24.03.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 03:25:11 -0700 (PDT)
Date: Fri, 24 Oct 2025 12:25:08 +0200
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 2/2] arm64: dts: freescale: imx93-phyboard-nash: Add
 pwm-fan overlay
Message-ID: <aPtUBGowNkBB5DRR@alb3rt0-ThinkPad-P15-Gen-1>
References: <20251007084028.1125185-1-primoz.fiser@norik.com>
 <20251007084028.1125185-2-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007084028.1125185-2-primoz.fiser@norik.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_032514_603699_66B36478 
X-CRM114-Status: GOOD (  20.02  )
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

On Tue, Oct 07, 2025 at 10:40:28AM +0200, Primoz Fiser wrote:
> Add overlay to support PWM fan on the phyBOARD-Nash-i.MX93 board. Fan
> can be connected to the FAN (X48) connector on the board and will be
> controlled according to the following CPU temperature trips table:
> 
>  - bellow 50 degrees - fan is off (<1% duty cycle)
>  - between 50 and 58 degrees - low fan speed (~35% duty cycle)
>  - between 58 and 65 degrees - fan medium speed (~60% duty cycle)
>  - above 65 degrees - fan at full speed (>99% duty cycle)
> 
> The output frequency of PWM signal is set to 25 kHz.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  2 +
>  .../imx93-phyboard-nash-pwm-fan.dtso          | 75 +++++++++++++++++++
>  2 files changed, 77 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtso
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index c72a6fdc5412..9807eb878916 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -358,11 +358,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
>  
>  imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
>  imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
> +imx93-phyboard-nash-pwm-fan-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-pwm-fan.dtbo
>  imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
>  imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
>  imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-jtag.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-peb-wlbt-07.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-pwm-fan.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtso
> new file mode 100644
> index 000000000000..d1adf04d56d9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtso
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
> + * Author: Primoz Fiser <primoz.fiser@norik.com>
> + */
> +
> +#include <dt-bindings/pwm/pwm.h>
> +#include "imx93-pinfunc.h"
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	fan0: pwm-fan {
> +		compatible = "pwm-fan";
> +		#cooling-cells = <2>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_fan>;
> +		cooling-levels = <1 90 150 200 255>;
> +		pwms = <&tpm6 1 40000 PWM_POLARITY_INVERTED>;
> +	};
> +
> +	thermal-zones {
> +		cpu-thermal {
> +			trips {
> +				cpu_low: cpu-low {
> +					hysteresis = <3000>;
> +					temperature = <50000>;
> +					type = "active";
> +				};
> +
> +				cpu_med: cpu-med {
> +					hysteresis = <3000>;
> +					temperature = <58000>;
> +					type = "active";
> +				};
> +
> +				cpu_high: cpu-high {
> +					hysteresis = <3000>;
> +					temperature = <65000>;
> +					type = "active";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map1 {
> +					cooling-device = <&fan0 1 1>;
> +					trip = <&cpu_low>;
> +				};
> +
> +				map2 {
> +					cooling-device = <&fan0 2 2>;
> +					trip = <&cpu_med>;
> +				};
> +
> +				map3 {
> +					cooling-device = <&fan0 4 4>;
> +					trip = <&cpu_high>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&tpm6 {
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_fan: fangrp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO23__TPM6_CH1	0x31e
> +		>;
> +	};
> +};
> -- 
> 2.34.1
> 
> 
Reviewed-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>

