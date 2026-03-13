Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D50106FD91
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 06:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKspgt19BRlk3T3bnDher33Ubx6JY+szccGAPMVxMvU=; b=aJ366bqA4SALbdq96Nqf9OkHBU
	VrNDypVgMoTpsedHQ6oJQOKHDeGfP5QBUPrN5Omlj8tRmYOJHfkE5gaBLzxG+xq1soVSvYugmY4/t
	WQRi9sBz65qvvI6urEn7QyDwWO97dbsMQ4Dywh+E2jMKv8wP6v1FKNTTa7PN94hdw/W/FTFeYnJLM
	un0l9pW7MuHHUzKyYbO4/lf9ijbi4eremsaBwHQLDb1uqabG7vlXxoPKRM05Ft7n6K622PQQ+y1ru
	fomZCa3L+Xb63+lix55uo5rH48w5HXBFN9DOpWBCCzccdnq3Ukl192lCOEqadlaLL74RFH3xacZ4W
	LB6s/4tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wRA-0000000GvRS-0tDl;
	Fri, 13 Mar 2026 06:55:56 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wR7-0000000GvQj-192Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 06:55:54 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-35a094cc3e9so1199032a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 23:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773384952; x=1773989752; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bKspgt19BRlk3T3bnDher33Ubx6JY+szccGAPMVxMvU=;
        b=DVz5/K6SGU8vgddRWBLw0mlLk6Opon740n7C/eIXBZyKfIS9nD6o4NG3N3KxA55mCv
         itHICXg2o3zE2D1a93wmk7RB/g1NhVrA4YNcPfA/AvgQz18MVSPn/Z1N/yeoxiJilAZh
         bJnZLsKkfrCu+gaOGxVWZuJ/7omWE3nfrkxKpfv/V+f2A30hgULJAZ6LoO7PkyxFuOhI
         I3UpTghwIxKpdl3OpzRvylQJKVBUmASOB7H58Z44mGW/z68u0ojYNFXMU6/rP5vMn96g
         FaWqgccs39uWb1pvD6BsCKXx6HoEofvt1rQhbZW0TMZC5dJVK9T49SI2YNWrXmZics5x
         jsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773384952; x=1773989752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKspgt19BRlk3T3bnDher33Ubx6JY+szccGAPMVxMvU=;
        b=XCXh/vY7X9hSbFK+y36eN7rODNA3iOjHYmJxbsrrA/vxHkzUdsdYu4h8YhmoKrAcMA
         JetyIOWB/11mzAJiGxOr/MT2Yqp1l248Ets6G7BAX26WA3OmnWNFuSC2QxQMCyX566ev
         jdgZs6m1tNzpq3UUNXOA52zhbE4vWDHONEgO7W3g70I4a434OoD72ObYqA2rVeLMDwoa
         pFWbjPVDG1cmbCheOcDUjWs9um7EHuSEvANKGMGAOmfdqbztASJMIbd1rE4csaG7fdup
         3tcmGssLGSX7glkZtXIczaWr+/Q7fb5L/fvyhF6MisXyGVf60cAZgVT/xVhLG39Tntn4
         5L5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5pOwOm1jLoizvgdbbNbtIWZkw12kKOh80Y+El5FLqCWfMWzSnqpDheVdUIUyxaboKT4YiqdD3tXGzP4THp5Ul@lists.infradead.org
X-Gm-Message-State: AOJu0YzdJ7CBxCXaruKMGA4iuWPnB7adG0es+Kd/JYP0dZDmT5/igW/q
	WAFIEPyOyPL5dLwDN310BByktwWM88uokM7Iz9aHjHU5Z1ImkJkOeAvm
X-Gm-Gg: ATEYQzwXyEZwjwb0KqXi+9GyGe29RwSK0j+/0rTDIt3gZ6uYlUsft5K0TKaElJChZUa
	RswOkhRYv9OH1bn4mQo2ukeaYs+RU+uQ++nNiBuZDgrt5xhTSGwBazYTQdvhC1lgWmWidDnR6EG
	YtYCK/s9S60xgNuHKuPvCNv2mri4v/Ws6rhjx5E4gb3Hf337vqkyfApH+Y5g9FIs1IjOGGy55NS
	nX9KTdZpn90HEWlqu3Zdzs2tGybc3+AupfSW2uzp8UZLHM9EpbZ18AGltdT2HhIytNEDhchGVjm
	kR9s0j0jPyEzWwj21unVwnYOHeA1ijfSxBqr9Bm1aw3kFh4MxPdw7G8HbS1ULp5cE5O4GVMTHM0
	e1jnCDxfEmu/hDZzfGpAa5p+oRzlczb06d+2nLZ+gMOjSLTR+pecXmeuz9tB/Oiye6o21RWx+eQ
	HJhAF6tGcPIavCj/Kpd9aGkG8EbmkMe3loYk9+7kkNJAXV
X-Received: by 2002:a17:90a:e7d0:b0:359:806c:7a94 with SMTP id 98e67ed59e1d1-35a21e4edfdmr2091970a91.7.1773384952107;
        Thu, 12 Mar 2026 23:55:52 -0700 (PDT)
Received: from [192.168.1.5] ([27.7.215.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359fc97356dsm8699301a91.8.2026.03.12.23.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 23:55:51 -0700 (PDT)
Message-ID: <c60b4ee6-74bc-49b9-b6e7-2f4d535b13a8@gmail.com>
Date: Fri, 13 Mar 2026 12:25:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] dt-bindings: usb: atmel,at91rm9200-udc: convert to
 DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Herve Codina <herve.codina@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
 <20260307-atmel-usb-v3-4-3dc48fe772be@gmail.com>
 <20260308-nifty-honest-buzzard-ccde9b@quoll>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260308-nifty-honest-buzzard-ccde9b@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_235553_353092_9F5B1741 
X-CRM114-Status: GOOD (  18.99  )
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



On 08-03-2026 14:57, Krzysztof Kozlowski wrote:
> On Sat, Mar 07, 2026 at 09:16:21AM +0000, Charan Pedumuru wrote:
>> Convert Atmel AT91 USB Device Controller (UDC) binding to DT schema.
>> Changes during conversion:
>> - Include "atmel,pullup-gpio" and "atmel,matrix" in the properties since
>>   they are required by existing in-tree DTS definitions.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
>> ---
>>  .../bindings/usb/atmel,at91rm9200-udc.yaml         | 77 ++++++++++++++++++++++
> 
> Where is the actual conversion? You are supposed to remove other file
> for this to be a "convert".
> 
>>  1 file changed, 77 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml
>> new file mode 100644
>> index 000000000000..6961cd5d5d89
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml
>> @@ -0,0 +1,77 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/atmel,at91rm9200-udc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Atmel AT91 USB Device Controller (UDC)
>> +
>> +maintainers:
>> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
>> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
>> +
>> +description:
>> +  The Atmel AT91 USB Device Controller provides USB gadget (device-mode)
>> +  functionality on AT91 SoCs. It requires a peripheral clock and an AHB
>> +  clock for operation and may optionally control VBUS power through a GPIO.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - atmel,at91rm9200-udc
>> +      - atmel,at91sam9260-udc
>> +      - atmel,at91sam9261-udc
>> +      - atmel,at91sam9263-udc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 2
> 
> Drop

Sure.

> 
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: pclk
>> +      - const: hclk
>> +
>> +  atmel,vbus-gpio:
>> +    description: GPIO used to enable or control VBUS power for the USB bus.
>> +    maxItems: 1
>> +
>> +  atmel,matrix:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: Phandle to the Atmel bus matrix controller.
>> +
>> +  atmel,pullup-gpio:
>> +    description:
>> +      GPIO controlling the USB D+ pull-up resistor used to signal device
>> +      connection to the host.
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +
>> +unevaluatedProperties: false
> 
> additionalProperties

Okay.

> 
> Best regards,
> Krzysztof
> 

-- 
Best Regards,
Charan.


