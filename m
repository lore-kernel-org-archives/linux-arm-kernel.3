Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5B5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 20:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iu/7BkGsGBE91wCLd243z0DyD6Dxurxs3l5CaDlz+Xg=; b=gS82wnUh/uNJCQE6vOjRyiOPhz
	KsWs5jGHwtxbYQ8hkcOSlStGMKqcZnQy58z584MnbsDRVEKYnBYOJdgjCJVvAGTqkBtaC1dwCu33r
	BQeczNGs5d1mcIX2jJ9jVB68H+XMKGcW4jxiY74rrUX+DkrTrqQbNh7hMSEgmgGc4OXPW7T0G+z9S
	aQnuIiEKFizxqNqD6hdOeCJPVBl5APrsuRCzQ9PvXgzZjL/pcVdr4mcpmxoXU1SGKt3b6FhIzLoem
	Cl/Oq4Muy9qP751y6/MoK2kXDUy5g3F7gY0d1CKki//aAPlb2GGPxyyGfIohLb4Cc792sxBCfLCan
	bDYd+qwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJ37-00000008kUM-1krF;
	Wed, 12 Feb 2025 20:09:33 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJ1f-00000008kFZ-3v4u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 20:08:05 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ab7dd005cb0so2841466b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 12:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739390882; x=1739995682; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iu/7BkGsGBE91wCLd243z0DyD6Dxurxs3l5CaDlz+Xg=;
        b=ZzSr1Lqg1XqTP4yveFwrJJ/kX9e+wBgG1pD5dncl62b0Ec5Yi8w+ckZ0Gilvgaa49/
         kBIGUcCH6zzfn/wUgKihfk8TCFtpOiAEkWQppqnoNyDC0+THNk/Ihtl3wxjZLw7VC/2n
         vt0Ge/3hKImfm40BNczSz1qkbOGoZM7C1SPut4lOAI3GOT4P2fYebHADVd5qyLtJFx46
         1NVMEmiXz3NgwWdyJG/8GfStt+I3YAX2i1gkRN5KI1EtLik6gn+ftNi0Rn/YffZYeWyQ
         l+m0eqfnTfDwaHp89zwU4WuLZV8NIezjhcOKYVTdMjNwTPuDDCqvci3hNmFxA6RM5i8h
         bv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739390882; x=1739995682;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iu/7BkGsGBE91wCLd243z0DyD6Dxurxs3l5CaDlz+Xg=;
        b=h8XmeYmtUJjUdPI6MEXas1zN26njsQj/Cii9dPdIiWOEB2iEZo3CDO+qjeQyijPj7T
         71qWEeLPGzhvNgKB6GiQAlSeDXzesVUOCgdGgmXvSKiLECFzYNRjldgMx523Un0JQL0E
         GYRPer3zMhqbBUX3UhkKFaCMVGMIzyJw0edB4WC82g6Ciu6swfVOv/pQA5ywxI9/C/iN
         Fa8vSVjMS1ag/nUSTLzuAGpLqDkZnnZqW7DhRfm7dnyGnn1WkVIp5kCr6YSsaR5Zj7/E
         8Y8JZGPOUAm3aKFBbmh/cyKHMslwOKbrsZqiNwl97kDrQhU65deQvlxtYGaQhaDKJ4V5
         rBWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRtCaZhr9dFH+AGupmk2wwtTq8UlIC/q34kjzRj2wg/le6w5MJBi7571gijz8yBcUnNsvn+jA3gZv6btUb13uW@lists.infradead.org
X-Gm-Message-State: AOJu0YyC4ISz2lRSvz6sQgSpi8JcKCf7LEyNv+te8Tdv36bL3ZWzUVCp
	Fz1h/wxCcZUNcS2daXnRhNt2a0mgVpqaIGyMlLC2jLWWitSwkPotj2CpJSZi64c=
X-Gm-Gg: ASbGncvirb9EbhLNOpcvB7rEtZ+PhhHiEoieJ21FfrLWeHlbnlD59UQduV9gt3ctap4
	hsxVfzj6P+kiSa/gFiPlfSc8K7gtqxRZ1pQWJSiIZIb86S/skj93SbQoqBK+rMjCPdu6EHAyrIZ
	Qqm/sePJE8ZBqQGPRR1BPUMMIe4HlprylIRMx7pPHjMlfnk6rBh43Ad8pVINKyc3meJtNm4TRfc
	SOZE44ScBh7YV2yVbOJoM4qTd4h3haOjjD5GjIy5Wvqo//mfJj89qD1/kGug95oLj9yhZC9XU36
	XsiE9H4kDJofjdtxGgvnHxS0gCOtE1tbwQo=
X-Google-Smtp-Source: AGHT+IGJXdMoTs2hWEXInTR+ltJbHmJj8H/ju9vPMe3A99qcrdj0eyslJQbPiSzl9wG+clAd5ieZpw==
X-Received: by 2002:a17:907:3da5:b0:aae:b259:ef5c with SMTP id a640c23a62f3a-ab7f31906bdmr184163766b.0.1739390880917;
        Wed, 12 Feb 2025 12:08:00 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7cf46bf57sm539299666b.165.2025.02.12.12.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 12:08:00 -0800 (PST)
Message-ID: <ab2394be-fe1c-46c1-9940-53b4ee1afc5b@linaro.org>
Date: Wed, 12 Feb 2025 21:07:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: dt-bindings: Add Sony IMX728
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
 <20250212195656.69528-2-slavine@d3embedded.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250212195656.69528-2-slavine@d3embedded.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_120803_985237_8190FE0C 
X-CRM114-Status: GOOD (  16.52  )
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
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      Specifier for the GPIO connected to the XCLR (System Reset) pin.

s/Specifier for the GPIO connected to the//
But you could say that it is active low, for example.

> +
> +  error0-gpios:
> +    maxItems: 1
> +    description:
> +      Specifier for the GPIO connected to the XWRN pin.

The same.

> +
> +  error1-gpios:
> +    maxItems: 1
> +    description:
> +      Specifier for the GPIO connected to the XERR pin.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: ../video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        clock-frequency = <400000>;

Drop, not really relevant.

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@1a {
> +            compatible = "sony,imx728";
> +            reg = <0x1a>;
> +
> +            clocks = <&fixed_clock>;
> +            clock-names = "inck";
> +
> +            reset-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
> +            error0-gpios = <&sens_exp 1 GPIO_ACTIVE_HIGH>;
> +            error1-gpios = <&sens_exp 2 GPIO_ACTIVE_HIGH>;
> +
> +            port {
> +                camera1: endpoint {
> +                    remote-endpoint = <&vin1a_ep>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 575f0e6f0532..50bff3558d7d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21885,6 +21885,12 @@ T:     git git://linuxtv.org/media.git
>  F:     Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
>  F:     drivers/media/i2c/imx415.c
> 
> +SONY IMX728 SENSOR DRIVER
> +M:     Stuart Burtner <sburtner@d3embedded.com>
> +L:     linux-media@vger.kernel.org
> +S:     Odd Fixes


Hm, why only odd fixes? If you don't care about driver, we also kind of
might not care and remove it soon.


> +F:     Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
> +
>  SONY MEMORYSTICK SUBSYSTEM
>  M:     Maxim Levitsky <maximlevitsky@gmail.com>
>  M:     Alex Dubov <oakad@yahoo.com>
> --
> 2.34.1
> 
> Please be aware that this email includes email addresses outside of the organization.


Obviously. Please drop it. You can use b4 relay if you need to escape
corporate junk.

Best regards,
Krzysztof

