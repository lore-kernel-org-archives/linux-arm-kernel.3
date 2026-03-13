Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72AF106FD87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 06:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/jr7J8T+jhR53vKzR5OkWAl9M6wmaMQ89KXNhbZ4Ss=; b=jHrFyWhNENUfT/piRA8yOLsGsE
	mQjJbR0/Z9f/33ev8WFaKSszhBvhdKZ3oc0av1JIXjXoCCjTDQx4NBrKZcX1TvxC3LnM3lUtDRGLS
	LRQT91sHbLP9Jx5TUr8+QaLyiSS61juGtN2h2W9jQPNVgZWRTIrDIPnsKkJU1ahVfjE4nQDc1Gm8t
	E/moLYtOM3b2FZRT5qsDreD2IfGx15hFyfP8OUIFLLoufDXMYzId+aG6gALHc8U5ZQCH7o9rgjNoh
	j4ouZXdQRhDY0BdSJMbjA3QIuWsdX8IU1sy9z7UFOCdQPFU/dcRDDouPzBeWIsBxIxgAH12VbFbNw
	ydAc7uIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0w6v-0000000GsRO-3hDG;
	Fri, 13 Mar 2026 06:35:01 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0w6s-0000000GsQF-1FSZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 06:34:59 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-35a09e0dd63so1820796a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 23:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773383697; x=1773988497; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q/jr7J8T+jhR53vKzR5OkWAl9M6wmaMQ89KXNhbZ4Ss=;
        b=XYmke0+H7TZ1lCTFbaBbxlO+5a9DMi3ODZm5XGPAkCmtKyRP4EACzoWGh+QO/mQYRA
         Hpk4tkAh+ow4A/ZoFa6DyFwbKVcQRSeNUC4PxzbGEaU/ZOzlssRJHUdu+owdBClL0+az
         06jN8HSqxOKM+J/dd4P9wTRN0oZ3g0yP8OAZGLMyJfUuSJ5MLl6GoxrVPoQyGr3cUo+o
         m3tMnQx2FydzeWb/5D6nHVLLVAXQXuULiRp1lGjMV+WD3Fc1fI8ajEI78cTzlWHvr1TK
         ZlW06iOKc5BPHY/OplRe2vxApZgV65dvkiYGwPAx40Bn0O0IwwleG7vBJn3Voz5/keu/
         eOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773383697; x=1773988497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/jr7J8T+jhR53vKzR5OkWAl9M6wmaMQ89KXNhbZ4Ss=;
        b=leAvFDmygqxa0S/qy+zSrgbrPcZC/Ft/m6pz/rkJMPC6yMVz8YmTO4/YOmYvL9ZicH
         7/iK9U1SciBG7YLyWaBcia8+c3eUm4bJa0+aUZdeMa1lbvR0K9sm6weQzNsH8gKciqqQ
         3YGRIr4tHddYWzfMV0hQ+nAHGIWMR6dhsHCQKfNIfPCaNtMyQVQoWoOOX/KaAscttqFO
         DOFd+FYVbE2qnBINbZ7NbfREXq4uYIPTH9OMzlbjj0w4eK5mBDH6Udslb3ZLl0M2oRhs
         sojbdnYOhQ6s2sZM3COUwM4zx0J7HsvEb6GcSoBbkO0oPDOth/c20X2Zzqxmz0I2OrFB
         pIww==
X-Forwarded-Encrypted: i=1; AJvYcCUFU5ku2lahPo20hbF4QOjYlzaOsyzflO/0oOkRAl0Cgu8dcn4q8ao2KY8xFu2I/RHjpu8qY23TAz1mjTC1Ao4V@lists.infradead.org
X-Gm-Message-State: AOJu0YzpJgI7RlS/Qoedc+8eEEnbnUkGylQx4Mzi7Bc4S9P12Hozj74o
	e9voxcRnQPbOokPGXXZngi8r1xSmgH/q+Zd4a5ux/4SkoN+fgQ2ngXZc
X-Gm-Gg: ATEYQzwprak8vjZIfY+ERceQCYr5S7fPNmZ+bFD0AerCsOQ6P3V5od2JuxT8QgiT4vH
	jtP6hh+Q1QB+UB4wm9sL1gMtny8U/IAJwISBq0vGkYg0TOnZHAXKPyu86kFZPPmQ+yZn12BWeZv
	Oh+GRxz2z2o80MtTk7HWjBJc7DNgrs99HLI1aeimMGoYbpLUJ1s+ZMKzgnJwJhWXzY/gbYYADXB
	+gexzxFLR3qmT02F8ff75Jo900l9w4ChlTTIjX0GyLb3lQmBkXaiQ8UFbr1yRDdrw/Ppi2TphqM
	zN45t8i/Lb+Fkm5babKMz8TCb0/5Gty/3XaHPEnI0s/pAgZRQwkUyf4K/YIeHnz74Ii+7FBc5Z4
	vbt0WjyHVSzqZ7zXIUXGmNWAPIXz8CxQAD0NpqdJcIVSsoAIPRB4TZ+D4+ZL/nCTqNeGmiXcXni
	gFPnGRmzhFKVc2ulYjVWnU7Tlhnvh0kElAe6Za5WTafSlCMvlSkA2Fvzs=
X-Received: by 2002:a17:90b:5185:b0:359:8ed3:8a65 with SMTP id 98e67ed59e1d1-35a22113798mr1985658a91.34.1773383697493;
        Thu, 12 Mar 2026 23:34:57 -0700 (PDT)
Received: from [192.168.1.5] ([27.7.215.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a07f0a365sm6999155a91.13.2026.03.12.23.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 23:34:57 -0700 (PDT)
Message-ID: <648da83c-79c5-4936-939d-690e7af1f95e@gmail.com>
Date: Fri, 13 Mar 2026 12:04:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: usb: generic-ohci: add AT91RM9200
 OHCI binding support
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
 <20260307-atmel-usb-v3-2-3dc48fe772be@gmail.com>
 <20260308-camouflaged-sage-warthog-fdbb7d@quoll>
 <1d49a4f4-8694-470f-82e2-6021772fc821@kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <1d49a4f4-8694-470f-82e2-6021772fc821@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_233458_346260_37999CB9 
X-CRM114-Status: GOOD (  23.73  )
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



On 08-03-2026 14:58, Krzysztof Kozlowski wrote:
> On 08/03/2026 10:23, Krzysztof Kozlowski wrote:
>> On Sat, Mar 07, 2026 at 09:16:19AM +0000, Charan Pedumuru wrote:
>>> Add binding support for the Atmel AT91RM9200 OHCI USB host controller
>>> to the generic OHCI schema.
>>>
>>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> 
> Also:
> 
> A nit, subject: drop second/last, redundant "binding support". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> And you cannot add support for bindings. The DT schema or some kernel
> Makefile gave that support, not this file.

Okay, I will change that.

> 
> 
>>> ---
>>>  .../devicetree/bindings/usb/generic-ohci.yaml      | 33 ++++++++++++++++++++++
>>>  1 file changed, 33 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>>> index 961cbf85eeb5..a8a94b9c1fee 100644
>>> --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>>> @@ -55,6 +55,7 @@ properties:
>>>            - ti,ohci-omap3
>>>        - items:
>>>            - enum:
>>> +              - atmel,at91rm9200-ohci
>>>                - cavium,octeon-6335-ohci
>>>                - nintendo,hollywood-usb-ohci
>>>                - nxp,ohci-nxp
>>> @@ -137,6 +138,16 @@ properties:
>>>        The associated ISP1301 device. Necessary for the UDC controller for
>>>        connecting to the USB physical layer.
>>>  
>>> +  atmel,vbus-gpio:
>>
>> gpio is deprecated. All bindings use gpios. Also, pins do not use vendor
>> prefixes.
>>
>>
>>> +    description: GPIO used to control or sense the USB VBUS power.
>>> +    minItems: 1
>>> +    maxItems: 3
>>
>> Why is this flexible? There is only one VBUS, no? Which pin is it
>> exactly on this device?
>>
>>> +
>>> +  atmel,oc-gpio:
>>> +    description: GPIO used to signal USB overcurrent condition.
>>> +    minItems: 1
>>> +    maxItems: 3
>>
>> Same question here - how is the pin called in the schematics?
>>
>>> +
>>>  required:
>>>    - compatible
>>>    - reg
>>> @@ -144,6 +155,28 @@ required:
>>>  
>>>  allOf:
>>>    - $ref: usb-hcd.yaml
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: atmel,at91rm9200-ohci
>>> +    then:
>>> +      properties:
>>> +        clock-names:
>>> +          items:
>>> +            - const: ohci_clk
>>> +            - const: hclk
>>> +            - const: uhpck
>>> +
>>> +      required:
>>> +        - clocks
>>> +        - clock-names
>>
>> There is already if:then:else covering clocks, so this makes multiple
>> clauses being applied to same device. That's not really readable.
>> Unfortunately that's a bit of a mess from existing binding. This can be
>> solved by moving this to separate schema, especially that you want to
>> add some specific properties to this device.
> 
> I guess Rob was fine with this, so let's keep it in this file.

Yes, it should be defined here as the fallback compatible is already defined in this existing YAML.

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Charan.


