Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8109C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+mbYj9gFoY+dF3f91W1Xx4566ofLNjeGKmQ/I7aiac=; b=zyulCYyBkckLEItl5UlGwUBCFt
	Keh/rJVEqwBOCizBMpOwfVtrIoTtGHLDhUu61/MSMTXgfWICOFxQYqxqphofEYLWN74qxxa3cnDag
	OUPuGr3zNLFAiSUh8nKzep0MmU0peVXamU7RaVshbojfsi1uX33DayFY/ZezTMPvV6m+OFzT1wmhP
	rLVY3W5frTUpIirez21GBRVBfww6EGXqldY+kXEALfdwZLZKJKOdWrLAzBqzNoWnCVxJVZjOYeiFb
	bF2Rr5AB9lJwdChl0fQ7pMZUA2pWkyhzLsdQ94oMcArLJbEcVYTx2ZllUPDL1uF9MTz8slVzqtbvh
	uXrtjBUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61qt-00000002h50-2StW;
	Mon, 14 Sep 2026 08:15:47 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61qr-00000002h4b-0xCw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:15:46 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2dd4b3c752fso29097645ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 01:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373744; x=1789978544; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a+mbYj9gFoY+dF3f91W1Xx4566ofLNjeGKmQ/I7aiac=;
        b=aL93KmxTYJBHyBCRg6Z6tzDQLzos5cGwJYcoHBRv9K/a94+GGVxa6K43VVhgn+CPe5
         r8kOnn6YBa2HNMC7Q4SmtFxOoc6ebqVVFG+ovzNwdjUudC2lCza4Q9xuN58N9Bw3Rxyo
         2SOzz1AmqARZIGwwYpMlG9oZ4YC7/9B/5GvjI2u2+x86ayEh1PZOUQuy725/4UjnJvk3
         LFzjdb1kwzjw7+M04bV7UKO41C2mYH4RGaLynnvGcLOMyVRWKN2eSSmDggu4FwNB+seP
         S5yS4YYsbjwh3er/jQruDQclQFroubRw5AwUUoJ1flfn1wokH4jxyeIBSptDKQekqmmx
         Rd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373744; x=1789978544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+mbYj9gFoY+dF3f91W1Xx4566ofLNjeGKmQ/I7aiac=;
        b=mW7S4Ff1C8tDPrndhoIFrN/5F/JvimmGxQAX1/Suz0kPeMQcNDLUva733VaUvalK/f
         bm6HSD/YO3Dax3qjf0dZLyYsl5cfTvbLAnpOEY0Bh1azc+IB+YlKePaXv3rSyGXoKKfT
         kbD5Uo9Bk4OU+EgitMryjqffNHqJY571evKpW62uwCJhMWRdZEpjUdvZ0pcWbcc6dKpy
         oHG0HpGt3aVWYqg87xMPIeP87JkoJ5LD8g0R2drKa6ymhRnpfnYvq8dp28YwG8z2sDtR
         lrVZiYjncc9/RYW3gnW0JEvs9BmEFbVwVjhasFuC6zG5NhQkiTh4OAjfzbafmVxRMnWI
         K3hQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDiGe4dwZLfFpcsKXEe3oII0PUoyGw7oiwZY97eDQkuFdDH/hQ/1nTjaUfxw1aW2J7A3t3QTS4UdHJjfcoo/Oc@lists.infradead.org
X-Gm-Message-State: AFuF++nXZP+bXjeye7He2Nh3cS8jDE4B0WXvyM0GVKCtU0zc07UqdqmH
	k2urk83nOt2NWCHXQYZK6QPfhNjwluL4wCMjJhxJdqsqkSCEOUqXf0aQ
X-Gm-Gg: AYBFou1ZEI+jsvbKu7PtgcgNsN4YUgXHi7+ueEO8NXo6mvJTe4MI0B0VukrS1dxRcZ6
	1VyPtsym7a9It69Lar+gsQ1Zq3r3+FDBW7ocYedJK3RAwEPLEr0E6gq7ftFVids2uQjlrmi1sCt
	U2Q9eUzoUb4L5hEjDsK6JTQ3gjJvlvW6bOU0Tc97p25qMsXfhombXuYTf5xlIf5V5EpdiNmWRcS
	rdlzzrpPDloINo70L5WThCzcRts0Pv2j0R5UnmwNE7AJjojgG4huZRrvGuXIzi0Dy22vi7HTpds
	2EqpcTJ9CSwjREq/wxIGJVGfrmDLT6P7n9qs75noE5MnC1Ak9d6o3HGliC8IiWb2BsKWwEnPrjW
	nCw+dD4VUeJkXavIERr9j8sjSV3bZk6Cu8OBOUC6iPdjtbRlaRufzxFoIwf6AEYV9eTRNszsAGZ
	lF8x0397sV+zrkZvEKSGc5MDpypTcP6w4JiiL6hY+FIS5LvZiKe4NMVKLKV9mioRM2SwOrMeZsT
	srQtDKEuCNWMmuMia3QOsZK6cdSdF9Gya/SouDRI+TCmYH26wkpztTwv+QMfa9zWg==
X-Received: by 2002:a17:902:e744:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2dd6c4835d0mr31756845ad.0.1789373744241;
        Mon, 14 Sep 2026 01:15:44 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cec8483sm44238255ad.44.2026.09.14.01.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:15:42 -0700 (PDT)
Message-ID: <2fd1f320-05a8-4782-8134-157c50024adb@gmail.com>
Date: Mon, 14 Sep 2026 16:15:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] dt-bindings: display: verisilicon,dc: add support
 for nuvoton,ma35d1-dcu
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260908092840.225220-1-a0987203069@gmail.com>
 <20260908092840.225220-2-a0987203069@gmail.com>
 <f74168b54fe8f070b7cfe79dc2fc83a63c2e8842.camel@iscas.ac.cn>
 <9d697240-3632-401f-aeba-c1fa5c2a29d4@gmail.com>
 <14f7fdf36a25b9669145b766becc6f32ef205320.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <14f7fdf36a25b9669145b766becc6f32ef205320.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_011545_321911_0F87B90B 
X-CRM114-Status: GOOD (  18.90  )
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


Icenowy Zheng 於 2026/9/10 下午 03:08 寫道:
> 在 2026-09-10四的 09:52 +0800，Joey Lu写道：
>> Icenowy Zheng 於 2026/9/9 下午 01:44 寫道:
>>> 在 2026-09-08二的 17:28 +0800，Joey Lu写道：
>>>> Add the Nuvoton MA35D1 DCUltraLite (nuvoton,ma35d1-dcu) to the
>>>> binding.
>>>> The DCUltraLite uses only four clocks (core, axi, ahb, pix0) and
>>>> one
>>>> reset (core), with a single output port.
>>>>
>>>> The MA35D1 clock controller gates the core, AXI and AHB clocks
>>>> with a
>>>> single bit, but each remains a distinct clock line feeding the IP
>>>> with
>>>> its own rate constraints, so all four must still be listed
>>>> individually
>>>> in the devicetree; core, axi and ahb happen to share the same
>>>> clock
>>>> phandle.
>>> This is weird, but I must admit that we're limited by the Common
>>> Clock
>>> Framework here, so I cannot give a better solution either.
>>>
>>> Anyway let's settle with the current result.
>>>
>>>> Move the clocks/clock-names minItems to 4 and resets/reset-names
>>>> minItems to 1 at the top level, since that is the lowest count
>>>> any
>>>> supported variant needs.  Add an allOf/if block that tightens the
>>>> constraint back up to the fixed 5-clock/3-reset topology required
>>>> by
>>>> the existing thead,th1520-dc8200 compatible, and another one that
>>>> caps
>>>> the new nuvoton,ma35d1-dcu compatible at the 4-clock/1-reset
>>>> count it
>>>> actually wires up.
>>>>
>>>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>>> ---
>>>>    .../bindings/display/verisilicon,dc.yaml      | 44
>>>> +++++++++++++++++++
>>>>    1 file changed, 44 insertions(+)
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>> index 919a900122012..773966677d0f4 100644
>>>> ---
>>>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>> +++
>>>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>> @@ -17,6 +17,7 @@ properties:
>>>>        items:
>>>>          - enum:
>>>>              - thead,th1520-dc8200
>>>> +          - nuvoton,ma35d1-dcu
>>>>          - const: verisilicon,dc # DC IPs have discoverable
>>>> ID/revision
>>>> registers
>>>>    
>>>>      reg:
>>>> @@ -26,6 +27,7 @@ properties:
>>>>        maxItems: 1
>>>>    
>>>>      clocks:
>>>> +    minItems: 4
>>>>        items:
>>>>          - description: DC Core clock
>>>>          - description: DMA AXI bus clock
>>>> @@ -34,6 +36,7 @@ properties:
>>>>          - description: Pixel clock of output 1
>>>>    
>>>>      clock-names:
>>>> +    minItems: 4
>>>>        items:
>>>>          - const: core
>>>>          - const: axi
>>>> @@ -42,12 +45,14 @@ properties:
>>>>          - const: pix1
>>>>    
>>>>      resets:
>>>> +    minItems: 1
>>>>        items:
>>>>          - description: DC Core reset
>>>>          - description: DMA AXI bus reset
>>>>          - description: Configuration AHB bus reset
>>>>    
>>>>      reset-names:
>>>> +    minItems: 1
>>>>        items:
>>>>          - const: core
>>>>          - const: axi
>>>> @@ -79,6 +84,45 @@ required:
>>>>      - reset-names
>>>>      - ports
>>>>    
>>>> +allOf:
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: thead,th1520-dc8200
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          minItems: 5
>>>> +
>>>> +        clock-names:
>>>> +          minItems: 5
>>>> +
>>>> +        resets:
>>>> +          minItems: 3
>>>> +
>>>> +        reset-names:
>>>> +          minItems: 3
>>>> +
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: nuvoton,ma35d1-dcu
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          maxItems: 4
>>>> +
>>>> +        clock-names:
>>>> +          maxItems: 4
>>>> +
>>>> +        resets:
>>>> +          maxItems: 1
>>>> +
>>>> +        reset-names:
>>>> +          maxItems: 1
>>> Maybe it's reasonable to restrict max port count to 1 for MA35D1?
>>> Although I am not sure about how to do this...
>>>
>>> Thanks,
>>> Icenowy
>>    I found the same kind of per-compatible port restriction already
>> used
>> upstream in renesas,du.yaml, e.g.:
>>
>>           ports:
>>             properties:
>>               port@2: false
>>               port@3: false
>>             required:
>>               - port@0
>>               - port@1
>>
>> Applied to our binding, that would look like:
>>
>>           ports:
>>             properties:
>>               port@1: false
>>             required:
>>               - port@0
>>
>> in the existing nuvoton,ma35d1-dcu allOf/if/then block, so schema
>> checks
>> would reject a port@1 node on this compatible instead of silently
>> accepting it.
>>
>> Happy to add it if you'd like the schema to enforce this, but wanted
>> to
>> check whether you consider it worth the extra lines given it doesn't
>> reflect an actual bug in any DT today. Let me know which way you'd
>> prefer and I'll fold it into the next version.
> Personally I think this is good, but maybe adding it as an additional
> patch after merging isn't a big problem, because this just plays as
> kind of a safety guard.
>
> Well this depends on how DT binding maintainers think, but as Conor has
> dropped his Ack, this shouldn't be a big issue.
>
> Thanks,
> Icenowy
I'll send the port@1: false restriction as a follow-up patch once this 
series lands.
Thanks!
>> Thanks.
>>>> +
>>>>    additionalProperties: false
>>>>    
>>>>    examples:

