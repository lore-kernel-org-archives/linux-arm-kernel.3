Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A8DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 09:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwWFJk3E2hQKwW/U0+2xxWeFCfb/uwGs2aCzoqUQROA=; b=SET8C6p69KdHCPeH7QW171FDrH
	L46yvNR6e8m3w632U7A/R+77mLiamGNgU9PEODl92TRqomd1lU4Jq3YF0ON6oygro6vbED8ozS3l0
	5MLC41u0v12akrBAAGm2+uHPWRzOODisfJvRgbAofA0pg3n0zYqaKztE9ttQI85zZsWswXFGEYq78
	hnhk6RiH8qHjG7TfLQYY8G83ytXCFTrRBoB1aUIL/XMbORUyGpymfxc2LjrVYg9WQPdb1XPbRhbBB
	79kixBlHS9ZSbLBlvaNlGYqWUNp0mlH/C2eZsRjo+xGl/9PawaMzonSU/r1fVRdXrbWhacdcSQ1m8
	BsibGzug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUNFE-0000000Gd6l-1Req;
	Sun, 05 Jan 2025 09:48:28 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUNE3-0000000Gd0D-0BsU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 09:47:16 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5d3ce64e7e5so2487187a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 01:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736070433; x=1736675233; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FwWFJk3E2hQKwW/U0+2xxWeFCfb/uwGs2aCzoqUQROA=;
        b=aB5B3MCD5/fj8MO9dEFICAc7rpfaZikE1seQUOXQg1Q9Zl7rVSJvpnTZKXnW3+Hmj1
         Q3ZReX1IxAZR/9bAiwtqLfGE3w+da4t4eODNHzRQlOJPHJm/wgwNjS0mwkzRG9Er6PpK
         sMRT/u/JbPRBQJWAomVrvy1tHkoz/TLGegvK4LwIKCmPPhb9S6rttvm63xfDFwEBtqR+
         YyoYiP5/6jirrfpslTaNGOqgKZNVAmyn3iJqVBm6zZsBACPQuM0/yQu1KFjzIN/tSuk2
         4ajK4oeSUQXXufSsN9cG7eObXLvmH/hs36RRy42kDQmTlaRtPvDOr/T8ExsMlr/ED4m4
         AW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736070433; x=1736675233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwWFJk3E2hQKwW/U0+2xxWeFCfb/uwGs2aCzoqUQROA=;
        b=TqVZHZJV1+dHZsOTVjo5Lo7Jgp6n4EUUGGXNkUWEKtSQqa6m3LErkJTDbtYBZmv2Ld
         97dV4y9vPcqh05bXi6jMWf7c+CZQCvx4XVN8Yy4QeEgzJsijnlAWENIaNxmHcjLHLFIN
         0pEFjBEwbXilBJv0JFgP90jqW37M07M4oBkrnGUbDqxhn5OXWouTgCe9y/0mzYwgr/Gh
         +eoUvxCeVlva/FSoPNajIw8inrKeaXbahFnd5393S4GolfswwuMxpRolFo7sAnLDLYDa
         8jLzmqJ5fMQDQk0Oo/+ZJ+Wj7wefiL3OdQp7xGkP5GEaFcpN1cd0mHbhGxCEMVM2eKqI
         Y/tw==
X-Forwarded-Encrypted: i=1; AJvYcCUAyPCnbeHyxkaYovj5ESbEF2CSFvFHwQ5KH7m9vG91LXaRK0YR5EFhFluw4r4/lvHdcOClq8AvksYgFZ/o1zRL@lists.infradead.org
X-Gm-Message-State: AOJu0YzKZ9FxN0wjE6szdyWJV9f5gGDJvTFx6YDTbtcGKXlmr06mihPW
	PIHG6leTybVoPPzWLXN0JmT5lXCYF+oYE+5qUMwvvVZSSuTr5zlClMAG6zpjAtWxCDNR8Ct7lXD
	3
X-Gm-Gg: ASbGnct9pWgW19+cfd+YjgGGFJDkbITEtxKxY/ZG9Eby0Qo2FneS6ee7C1LH59/zqNW
	t7EpdYLSPGr6woPwdyLQQ1ngrL45jScDUxiyPKHCjxCRAzaTqmYxiHKgeTrhjTzO1m/e/1lBmCV
	cRNpNdfJCi+463Q5B5OdorBYdwl/URqf4+MeZgdy2CCPWRn9P+07v6Kf+8H1HlnQDVMfwFm4ezu
	vzHPhqtw/i9PsHsOP9TMJStYpOSgsg70ln7O3uwCrv1rRV0Zq7phQErJB42lC+1kJaN6nz7+UL/
X-Google-Smtp-Source: AGHT+IFBAgxEYhPQ8HTOUlchzxxlKiWSC2Pj7X7DaXwcKXltm+3dNqCxGlJWXie/QUbDh3tB7xbT1Q==
X-Received: by 2002:a17:906:3099:b0:aae:83c7:fd4e with SMTP id a640c23a62f3a-aae83c80390mr1497141566b.13.1736070432783;
        Sun, 05 Jan 2025 01:47:12 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0eae71desm2097610566b.89.2025.01.05.01.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 01:47:12 -0800 (PST)
Message-ID: <f089027b-6417-4d02-8f8a-24a3ecff74a9@linaro.org>
Date: Sun, 5 Jan 2025 10:47:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2
To: Ivan Sergeev <ivan8215145640@gmail.com>, robh@kernel.org
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <D6U1B36JH3HU.WQ8GEL7M3HRW@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <D6U1B36JH3HU.WQ8GEL7M3HRW@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_014715_131703_EF85D2C3 
X-CRM114-Status: GOOD (  13.43  )
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

On 05/01/2025 10:33, Ivan Sergeev wrote:
> Preparing a v5, fixed the phy-supply for usb nodes, but I have questions
> for the other warnings.
> 
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: /i2c@fe5c0000/ns2009@48: failed to match any schema with compatible: ['ti,tsc2007']
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: /i2c@fe5c0000/ns2009@48: failed to match any schema with compatible: ['ti,tsc2007']
> 
> Using `grep -r 'ti,tsc2007' Documentation` I can find a schema file for
> that `compatible` value: Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt
> Is it an invalid value or not a proper schema?

It's just not a schema. Warning can be ignored but you can also convert
TXT to schema in separate patch.

> 
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: wireless-bluetooth: uart1-gpios: {'rockchip,pins': [[2, 13, 0, 187]]} is not of type 'array'
>> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: touch: touch-gpio: {'rockchip,pins': [[0, 13, 0, 189], [0, 14, 0, 187]]} is not of type 'array'
>> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: wireless-bluetooth: uart1-gpios: {'rockchip,pins': [[2, 13, 0, 187]]} is not of type 'array'
>> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: touch: touch-gpio: {'rockchip,pins': [[0, 13, 0, 189], [0, 14, 0, 187]]} is not of type 'array'
>> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
> 
> I don't understand how these nodes differ in structure dcompared to
> other pinctrl nodes. Am I missing somethign taht is causing this
> warning?

Wrong naming. gpio and gpios are only GPIOs, not pinctrl. That's why
your SoC pinctrl schema is supposed to have strict suffix or prefix
naming for such pincfg nodes :/


Best regards,
Krzysztof

