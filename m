Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903CFE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 10:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5VolyOiRVCeYJbZJVrBiLg0SsLQtCtA/FxSw1DsyG8=; b=pJL4jiFXfENnsCjFuziIitH1mA
	OzUBKuEDsUJfsUZXQOiHZVyN6EWEM2VF8uQGv1dWXQGDzzP/AZUF986fTmj7AQuOUrI8o4gOLi+1K
	BgWaGn9fRqqavwftdFMkWn7t9j5Z+SIONvIHW3ha6FQWV98otjCb0PMkz5JNvlHJbocDVpCTmYjLi
	DTq08eWYXZw9V6tuLleZ/zdeoTlBAVzJnLPdkTSFMq1N7VmfxH/J5NMPkZBftk2kaKT13VesDHdEe
	HC5fLxz31F7LXpl7njBybzNepbwxC52hcYtmVfw8UQ9TdUAeGs5EGDkTfPG5jzZU2Zp0N+0NXmiPh
	QiC5suuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUOFo-0000000GhxZ-1eB8;
	Sun, 05 Jan 2025 10:53:08 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUOEc-0000000Ghrj-2hVY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 10:51:55 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5d3e9f60bf4so24113548a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 02:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736074313; x=1736679113; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h5VolyOiRVCeYJbZJVrBiLg0SsLQtCtA/FxSw1DsyG8=;
        b=K0Oz0zxrEB4ra1Cl89ylPClIEK7YjEIvXyDwWvUY+Hu2/7K0u1octD2cDE5EIHq8RP
         xla1U2RfMXMMf0E7E5XS0oirdX6TuVLv/ZEoMMqt6iMqAyTv+G5goHEziZk2H3htjyGN
         jqqSyTYMlzFo7IdtrxvgKma5xLb7SN8HUpegUJUnvjLoLl07UwF08SVeDNARRrIycJF2
         s0Ykf8W8whkiBulNs8D2pa9WQXhMWe/NXrrr8NMYv0gFg6jt8n2uAPnHyoLS/816IRIE
         VyUDSjHa6JNgAudbQnqGyDDTO9y+T4PCHyrHAkA8r+WyNLOS4Gh1xqWKdvd71WIMIQhH
         7+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736074313; x=1736679113;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h5VolyOiRVCeYJbZJVrBiLg0SsLQtCtA/FxSw1DsyG8=;
        b=mr1KBJgCCok7u8j9E8puhDtfMm8TGzfXirRphJ138i7x9gi8QV30UVAh5gAqREoQq8
         9Xyc4Lnbw2Q+skqpR0KYo8coeYqZJ0FdHXQnGH2Wh82LDOB3gwWSqoQzYPZBIoRnUeoA
         A8o/+NwpU9sbl7n5pN+UE5wOVjlbeA5/8tyWr9XraPiON9Vir8H2FuhCP9ZfVq08Mw32
         WowaC6VIKHWMS9pGx1h/N8XCex9M4immZQVkEPK8UPnTVSGItFOamJERh7/QYxoMxRgd
         hm9isjuGCiCBrYQVVDSbtwjMg0FGWxSmHrLA5cOhZDtem6exbNhqlWjRWSaNJ7rxcjoo
         CtJg==
X-Forwarded-Encrypted: i=1; AJvYcCXje3MdFUVDxsKlGmB9EaBlOdExf65vx2mYoVbb+PUVQJwWXiadanXJzvUeBrcw8NMLf5oJpwmo1HjDvr460z79@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4vZaBZb+bIUDhWWV7atvSQbsKPhjCatA08NehlM3iZ7WyJRpY
	1ivC767yrMrnzVArKEsacVmarsPwbD8T3yuFhTON1HUUXhoAJ4Ao
X-Gm-Gg: ASbGnctQ+ba0++a+Kf6PQ89i+J5PH+6Yzct+9Gv19Y5hUWQ2GZXgj7Kog8dEygS5lR/
	RP1p05EoV8hpKhmKgKAL04NAmZQNTyRjI6EbfgXESygwDkPFdn3Pt0tPiZhXSvukqZK7hqfGRfK
	ZYHzu8VfuOKmt4Ld6/8y9Kg1ScD8HHd/CnC2LH/Rs71OnmDg72/WIjn3VDi10I3zBWtAjbnaKGQ
	jVNDGmm25QapPjshBPI9rHZO900k1dYGgc4Pfk0zFAqmPkt6lw9uLRIQ2zHzaYyEfou
X-Google-Smtp-Source: AGHT+IEJvx7PhT0pC6BfUepWRgXK13eXOmZzfv73ZCW6+TJiJYOCoxTGtNTu1yWDMUrWyMkblol/Xg==
X-Received: by 2002:a17:907:60d6:b0:aab:daf9:972 with SMTP id a640c23a62f3a-aac334c0ba9mr5396506266b.28.1736074312491;
        Sun, 05 Jan 2025 02:51:52 -0800 (PST)
Received: from [192.168.0.3] ([151.251.251.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaee340665asm1675202366b.187.2025.01.05.02.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 02:51:52 -0800 (PST)
Message-ID: <fbe88d1e-6ffb-4806-8210-fa83df0287a5@gmail.com>
Date: Sun, 5 Jan 2025 12:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: soc: samsung: usi: add USIv1 and
 samsung,exynos8895-usi
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
 <20250104162915.332005-3-ivo.ivanov.ivanov1@gmail.com>
 <nk7rifc5mcsdlmgpncrpoumerajrpdekxpvqwwe2hz4b63rgci@flowtxwchm7y>
 <e7444f6c-f280-404a-8172-ae4869e3d492@gmail.com>
 <fca941a4-7c24-48dd-b36a-2f9b5c44575c@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <fca941a4-7c24-48dd-b36a-2f9b5c44575c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_025154_689237_239506E1 
X-CRM114-Status: GOOD (  37.26  )
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

On 1/5/25 12:39, Krzysztof Kozlowski wrote:
> On 05/01/2025 10:51, Ivaylo Ivanov wrote:
>> On 1/5/25 11:18, Krzysztof Kozlowski wrote:
>>> On Sat, Jan 04, 2025 at 06:29:14PM +0200, Ivaylo Ivanov wrote:
>>>>  
>>>>    reg:
>>>>      maxItems: 1
>>>> @@ -64,7 +75,6 @@ properties:
>>>>  
>>>>    samsung,mode:
>>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>> -    enum: [0, 1, 2, 3]
>>> Widest constraints stay here, so minimum/maximum.
>> Why?
> Because that's the coding style and that's how you define the field,
> considering you might miss a variant in multiple if:then: .
>
>
>> If we are going to add new enum values specific for each USI version,
>> isn't it better to selectively constrain them in the binding?
> You are supposed to constrained them.
>
> Again: widest constrains always stay in top level property. This applies
> to all bindings, all fields. Repeated multiple times, so here is
> standard example:
>
> https://elixir.bootlin.com/linux/v6.11-rc6/source/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml#L127

Ah, I see now. Will get that fixed.

>
>
>>>>      description:
>>>>        Selects USI function (which serial protocol to use). Refer to
>>>>        <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.
>>>> @@ -101,18 +111,42 @@ required:
>>>>    - samsung,sysreg
>>>>    - samsung,mode
>>>>  
>>>> +allOf:
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>> +              - samsung,exynos850-usi
>>>> +    then:
>>>> +      properties:
>>>> +        reg:
>>>> +          maxItems: 1
>>>> +
>>>> +        samsung,mode:
>>>> +          enum: [0, 1, 2, 3]
>>>> +
>>>> +      required:
>>>> +        - reg
>>>> +
>>>> +    else:
>>>> +      properties:
>>>> +        reg: false
>>>> +        samsung,clkreq-on: false
>>>> +
>>>> +        samsung,mode:
>>>> +          enum: [4, 5, 6, 7, 8, 9, 10]
>>> Is it really true? Previously for example GS101 had values 0-3, now you
>>> claim has values 4-10, so an ABI change without explanation.
>> How is it unexplained? Citing the commit message:
>> "Add constants for choosing USIv1 configuration mode in device tree.
>> Those are further used in the USI driver to figure out which value to
>> write into SW_CONF register."
>>
> I don't see reference here about GS101 and others.
>
>> USIv1 and v2 write different values to the SW_CONF register. For example:
>>
>> #define USI_V1_SW_CONF_UART        0x8
>> #define USI_V2_SW_CONF_UART    BIT(0)
>>
>> ..
>>  [USI_V2_UART] =    { .name = "uart", .val = USI_V2_SW_CONF_UART },
>>  [USI_V1_UART] =    { .name = "uart", .val = USI_V1_SW_CONF_UART },
>> ..
>>
>> Hence the decision to have separate constants for different USI versions,
>> which in my opinion is cleaner than meshing the enums together and
>> choosing what to use with IFs in the driver code.
> This does not answer at all why GS101 receives now different values than
> before.
>
> Explain why you are changing ABI.

Oh I see what I've missed, it should be everything non-8895 having 0-3,
not just the top-level compatible samsung,exynos850-usi.

>
>>>> +
>>>>  if:
>>> Missing allOf:
>>>
>>>>    properties:
>>>>      compatible:
>>>>        contains:
>>>>          enum:
>>>>            - samsung,exynos850-usi
>>>> +          - samsung,exynos8895-usi
>>> Effect is not readable and not correct. You have two if:then:else.
>>> Usually it is easier to just have separate if: for each group of
>>> variants and define/constrain complete for such group within its if:.
>>>
>>>>  
>>>>  then:
>>>>    properties:
>>>> -    reg:
>>>> -      maxItems: 1
>>>> -
>>>>      clocks:
>>>>        items:
>>>>          - description: Bus (APB) clock
>>>> @@ -122,16 +156,13 @@ then:
>>>>        maxItems: 2
>>>>  
>>>>    required:
>>>> -    - reg
>>>>      - clocks
>>>>      - clock-names
>>>>  
>>>>  else:
>>>>    properties:
>>>> -    reg: false
>>>>      clocks: false
>>>>      clock-names: false
>>>> -    samsung,clkreq-on: false
>>>>  
>>>>  additionalProperties: false
>>>>  
>>>> diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
>>>> index a01af169d..4c077c9a8 100644
>>>> --- a/include/dt-bindings/soc/samsung,exynos-usi.h
>>>> +++ b/include/dt-bindings/soc/samsung,exynos-usi.h
>>>> @@ -13,5 +13,12 @@
>>>>  #define USI_V2_UART		1
>>>>  #define USI_V2_SPI		2
>>>>  #define USI_V2_I2C		3
>>>> +#define USI_V1_NONE		4
>>> Drop, it is already there.
>>>
>>>> +#define USI_V1_I2C0		5
>>>> +#define USI_V1_I2C1		6
>>>> +#define USI_V1_I2C0_1		7
>>>> +#define USI_V1_SPI		8
>>> Drop
>>>
>>>> +#define USI_V1_UART		9
>>> Drop
>> How so? These bring different configuration values. Could you specify how
>> exactly you want me to implement these in the driver?
> Heh, so the binding was made poorly for the driver and driver was
> developed in a matching way, so now this became an argument. Binding and
> drivers are independent, so whatever argument was in the driver does not
> matter really.
>
> What I don't understand is downstream for USIv1 and USIv2 has it correct
> - proper string values without mentioning any version. So, surprisingly
> proper downstream binding, really rare case, was converted to something
> tied to current driver implementation.
>
> You have only one sort of property - the mode how you configure the USI
> engine. The mode can be: I2C, SPI, I2C0, I2C1 for special cases with two
> I2C etc.
>
> The mode is not "USI_V1_I2C" because it is redundant. USI V1 cannot be
> USI V2. You cannot tell USI to be v1 or v2. It is either v1 or v2. Only
> one of these, thus encoding this information in the binding is meaningless.
>
> I even mentioned this in original binding review:
> "so please drop everywhere v2 (bindings, symbols, Kconfig,
> functions) except the compatible."
> Well, then I missed to check on that, so now this mess has to be fixed.

Yeah I get it now. Alright, I'll look into what I can do to unmangle this
mess.

Thanks again!

Best regards,
Ivaylo

>
> Best regards,
> Krzysztof


