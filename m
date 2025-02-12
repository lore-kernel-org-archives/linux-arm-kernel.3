Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69820C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 20:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=siR4X3wXu1dY8Wk3/59DZPVn6YOYAggv/c5RGQ73U1w=; b=iGqOw0s+YkMJJwN8nZUdKwGUbm
	1BamdfA/LPP1fvv3h03Mrm8jTMLFGXigt4c1YkUIFX3p0G23/RxMyUlt7RviIdswt3Qc2BFLgD0Ix
	xCk9etKKRX2hivggaRcY2KVyUnaTNRlNY+bwXAZh5SEpPxMh9/V1midAw6oaXuQpACJGaMZ2+AyUX
	EqlQw9TLbC1qQle9cBxpbtF6lhjExbYR3l2cN+xXFAvujb4xEbyRlBYpnzy93Us333B/DBtC56eek
	HjOFFuPdJ3r14Tr/wFTbZGiFtRKcKADOW2nvC+Ew/en4/pybNdjhmYK3Mr0SfQN9Kob9DztjIgvsE
	Xz2ZCsIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJ8O-00000008l9T-09Bs;
	Wed, 12 Feb 2025 20:15:00 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJ6j-00000008kwL-0MuO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 20:13:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4393f97e9ebso172175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 12:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739391195; x=1739995995; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=siR4X3wXu1dY8Wk3/59DZPVn6YOYAggv/c5RGQ73U1w=;
        b=yU5d5We5P/KWkAWdQ9kI4oQyuSK/mcrcoWfAH4D4HnpPdJIbHlxYX1r7+iBrTWpdsK
         LFFufhakVwRepwRDsAbCXuB/DwJDSk5Bf0gAdjtya2QqrrwGsHZ0zdOR7njKmp88vgIn
         uZRmswjibyVrTNax8zo1JzMMADYpJHpSnvye+UvI764ffcGClVYWiwG5d8Xr8WmgU8VM
         x86i43n2g7Yl6/yT+VB7C3Q8uAU+qQljckTv5os1qmmtTwOuPwYScjo0x8JFjuf58N2z
         TdcuwOmQkamyfsX/p+sGWf9aRceUO+vdBBw4GpZyhFuG9Y3G0vsYBwzKJnkB3VU9djAD
         XTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739391195; x=1739995995;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=siR4X3wXu1dY8Wk3/59DZPVn6YOYAggv/c5RGQ73U1w=;
        b=BNiXx6JIoTsa1yo+n0EvjyraSAELxcl2tlNd1GcHYcEm5RKRKeEb4rst6v05RlvWM4
         1C83q1H38rUZdtEEQaEsHi8PQy3M149V7kBQcL7bYFl/SZUSLuddDDSNgjYOeX1i+rN/
         tZp5d5ZRKyA8PkJxlzF2qUbhq5SETpxv3QfD0i8uRy7WggVo5p+obQBFNuJnl5pZbSEu
         jnw/L4kmJmcghVThj+lscFJGMNS8Z/sguqoO6WMpaR8ZGAWD4WefgZRSTdXccl+Ql48S
         odl5S4Abv0vLedYi+AMNztTs1QPkQCzYbmlCBCfo/c4wb175DWXAJX8oMHBHY/m1ZVPJ
         y4Xg==
X-Forwarded-Encrypted: i=1; AJvYcCX27t/NO1j98mqcrQf7UhQlJmcqmUf4ueAZ/eQDJ4tKgPCFg6At4viLAi2RbkzYjnX282HeYIRfkudbi83ypC3N@lists.infradead.org
X-Gm-Message-State: AOJu0YyxKdR70SMb8kFN8U5lgHX+8hPaq0YAzFh9dXCG7dT/uYA/M/Be
	4Zby9OVqQkfE2SqBZd5vjCpemlY2sl9XyNPx+xnbvYqm8b8urdChgnRyGSPibTc=
X-Gm-Gg: ASbGncs/5x5YUW5BVPwE5QtRaVf8lI1MrPn+TvKxHv9xl6sWyDFak1qbYuSnQo9rOW4
	+dZmI/Nll7uQoCgc04MQJ9MoqbdhJ1RbJRaia63Kx5ys28Eu/IIHdp3SctEptjyROOnghzrT3WV
	SoED8C9lJQU7nsooYKo46O/yGfMkouIUdvLNB2Q4uMB/EK3MfrTZhUECEooShJQPE/4Ty4JeknW
	NNnFnRuaVbaKKpelaUxhG+2F7plt1ed0eK7g79nvdXlA8unwABXNHSOq6603r65/fvJ2G1ZdfNX
	aEA6f+HK++ZcP9BELhFK/sbFZPLq6hZli44=
X-Google-Smtp-Source: AGHT+IHikjJvp5u8qCa0vEGl29r0IoBtI4+HDUF6b7Z7YpsAzvHLbGnS/H5Prc+T/NKOySlDUqzPlA==
X-Received: by 2002:a05:6000:400b:b0:38d:cab2:91dd with SMTP id ffacd0b85a97d-38dea270b48mr1432182f8f.6.1739391193872;
        Wed, 12 Feb 2025 12:13:13 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4ebdb8csm12825633f8f.55.2025.02.12.12.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 12:13:13 -0800 (PST)
Message-ID: <83f805b2-afa7-4939-87c5-840d9aaf2443@linaro.org>
Date: Wed, 12 Feb 2025 21:13:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: ti: k3-am62a7-sk: Add overlay for fusion
 2 board
To: Sebastian LaVine <slavine@d3embedded.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Abel Vesa <abel.vesa@linaro.org>, Achath Vaishnav <vaishnav.a@ti.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Javier Carrasco <javier.carrasco@wolfvision.net>, Jianzhong Xu <xuj@ti.com>,
 Julien Massot <julien.massot@collabora.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mikhail Rudenko <mike.rudenko@gmail.com>, Nishanth Menon <nm@ti.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stuart Burtner <sburtner@d3embedded.com>, Tero Kristo <kristo@kernel.org>,
 Thakkar Devarsh <devarsht@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Will Deacon <will@kernel.org>,
 Zhi Mao <zhi.mao@mediatek.com>
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-4-slavine@d3embedded.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250212195656.69528-4-slavine@d3embedded.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_121317_138663_809AAB9A 
X-CRM114-Status: GOOD (  15.20  )
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

On 12/02/2025 20:56, Sebastian LaVine wrote:
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 27fb3c1be732..bf6a48da0887 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21890,6 +21890,7 @@ M:      Stuart Burtner <sburtner@d3embedded.com>
>  L:     linux-media@vger.kernel.org
>  S:     Odd Fixes
>  F:     Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
> +F:     arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
>  F:     drivers/media/i2c/imx728.c
> 
>  SONY MEMORYSTICK SUBSYSTEM
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index f71360f14f23..fcd8d11e5678 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -31,6 +31,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62-lp-sk-nand.dtbo
>  # Boards with AM62Ax SoC
>  dtb-$(CONFIG_ARCH_K3) += k3-am62a7-sk.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62a7-phyboard-lyra-rdk.dtb
> +dtb-$(CONFIG_ARCH_K3) += k3-am62a7-sk-fusion-2.dtbo

I don't see the overlay being applied.

> 
>  # Boards with AM62Px SoC
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso b/arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
> new file mode 100644
> index 000000000000..68e06d643bfd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DT Overlay for Fusion 2 (FPD-Link IV) board on SK-AM62A
> + * https://www.ti.com/tool/J7EXPAXEVM/
> + *
> + * Copyright (C) 2024 D3 Embedded - https://www.d3embedded.com
> + */
> +
> + /dts-v1/;
> + /plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +       clk_fusion2_25M_fixed: fixed-clock-25M {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <25000000>;
> +       };
> +};
> +
> +&exp2 {
> +       p9-hog {
> +               /* P9 - CSI_RSTz */
> +               gpio-hog;
> +               gpios = <9 GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "CSI_RSTz";
> +       };
> +
> +       p19-hog {
> +               /* P19 -CSI_SEL2 */
> +               gpio-hog;
> +               gpios = <19 GPIO_ACTIVE_HIGH>;
> +               output-low;
> +               line-name = "CSI_SEL2";
> +       };
> +};
> +
> +&main_i2c2 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       status = "okay";
> +
> +       i2c-switch@71 {
> +               compatible = "nxp,pca9543";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x71>;

reg is always the second property. See DTS coding style.



Best regards,
Krzysztof

