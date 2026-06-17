Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95275CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VbVg/KwHCVhdvL9LHCxz6CTvTzl761Uhp31GttVosv0=; b=xz6l+Zx7R5Ij9H2X4XYcB1l/0G
	dasK7fNAwmfJ1440p4u85drTtI7AJwaQ/IQ7/vco0TOB6iaPJ2Rxpb1IO/jht8+601gsJTcNSeMzS
	EhvnumJAPWigd5FvHb2umhabXqVmFFzbxlrpTozRouTW5pSUhTC4+WZDPq+13G4DqJsLYBLBjNeJg
	oTf1tJoXuiaOEjhXFGwSipCwrb5fk9jl7DwiqEnRKq1WHk8b7J3wuzVMOFvv3eFvRyFEsAjhmdRwZ
	Yreu1Sc3pffw98rn+8yTravfhDLAagJJ14JtRIXkihfU30Weeejg0sKWITmDjLVijjpTfptqJlTp1
	6fxtUomQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnSK-0000000H307-3O0K;
	Wed, 17 Jun 2026 10:25:12 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnSH-0000000H2zZ-2ydl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:25:10 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c6a97e1d1bso10323225ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781691908; x=1782296708; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VbVg/KwHCVhdvL9LHCxz6CTvTzl761Uhp31GttVosv0=;
        b=Xy+U5gVFklbnAhOrceSjxf0fanJWyz/3S1JDGAZGu3C0Hh9CLHdeJafXxqkrIH6Wst
         a9u3wBvxsqB7GRm4Bj2AKg/BycmEsZkGnaTh+bRZ62TBiBU+qIA4gjnzkm7MQd94XMl5
         2zFRelDtPTzyOYMxICNamxEiGd+HjsUSw+WvJcTWiAfy936rdZVKrCcbuv2Jqms5qHbF
         9d0f4/ORUcOTQylorV5fQUX+wfep0N5sSqh3O1Ygh/wyE9vYJUK8JwWJVAxNsYAESwH8
         HObBOPwM0EL/ppSRwJlrB64hNo+jryw5ZxLreN7qVDOkL0JWJmqpngSNR/12k3sYu4hd
         U5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781691908; x=1782296708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VbVg/KwHCVhdvL9LHCxz6CTvTzl761Uhp31GttVosv0=;
        b=qnKV91HnrPe7qVQ/i/HqGEDzZU2XN6nrH6c1TEtDnZ/L/eto+tO4+k6Rp1NS4Jz7Rl
         TmmHYVPZUnWUeDxbNfYxX8ylE/ipkOrUT0ChISMa69KwtgPQMRBiUpZTVasd5OFhDZQX
         9Y+HMkFxemmL3eb9wtBlO9hjWlLMzSCLjWbhe5/3KUuoxVTufsmqRUb2+O1H44hJomSB
         wJ4D1b6IZlOvB+VHuqPiYaqt5CyV+12HdmF4xEZOoO7X6Aask7zA6qpEpRvp4uEwq6YG
         PMH3bYgDRoc8URdEr36o+WFRY/cTZxnT/bGDHr6dgTO2ZbgkykY8bpCv+z4wdwEQnBwK
         Pchg==
X-Forwarded-Encrypted: i=1; AFNElJ9vEcb2Uxdle+sK+gF0HTgbCaYwFaIx2dKxvQ7bmNqa3Z3c4jIFke078rHpPtY/tNcKvDKYV1F9YWgs+YJzBMAs@lists.infradead.org
X-Gm-Message-State: AOJu0YyXY4BRbZmzPu4qiteDaH9IRxOIc5H5hrjKRMrL+srn/2KW/ege
	8S544D+xLfPXYuu5QTA0zLgB/fBC4o1eHdhC56Kpt1UVvuJ93p0cXSUS
X-Gm-Gg: AfdE7cneZpmA8aEXaZ28CGggule3hGAEgVEZxVfxMNAOZAXlFe1Gpwei0vr1rSfmvkD
	iYxbd9TxQYbqeEVn4pvyRilkgSvvtXy+ZQWrYxKnZn96cOH3WuNeeBzT5Xbi2bkBYl5jIduwH25
	YzS3xkcORb7lYz/rUrb73XyeOVnCJUlX5d9NH2EVvl4lrCu/xSzJA1W7KLJNso5wZtulIaiIhlg
	qe4mYdNXTfispsg+UD8GuNbgfh0c9LYxK3Unv/TzKiw1848lPsI6QFA5tXBXtscXh05kGrHb5he
	jMapHlCwBJls9yoHXOAxgm6l+UcFeLozm4gzpAviQqZTTNnWFGO937trV6NOl4M73n3QAYrRMCz
	KkH2V1I9pvnZv2EnhDw5P35m3HLabHXyHx3IMvVX09aLey/czxiH4ROZtPFrpKcYwGYPiQgWEwy
	N13BHIDcFbfK6HHuryZYcX5g87jcWegBiKLyoDIy4YwZPiwPIa9b0175KD+ajhPtxqdg==
X-Received: by 2002:a17:902:ef44:b0:2c6:c66b:4b03 with SMTP id d9443c01a7336-2c6c66b4d39mr11874145ad.10.1781691908280;
        Wed, 17 Jun 2026 03:25:08 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb4134sm143780715ad.30.2026.06.17.03.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:25:07 -0700 (PDT)
Message-ID: <6d3e3121-22f2-4c59-9678-df2f57ff4d31@gmail.com>
Date: Wed, 17 Jun 2026 18:25:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] dt-bindings: display: verisilicon, dc: generalize
 for single-output variants
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260615065003.76661-1-a0987203069@gmail.com>
 <20260615065003.76661-2-a0987203069@gmail.com>
 <3683c5c617324f5835529617325745ef48fa1943.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <3683c5c617324f5835529617325745ef48fa1943.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_032509_753845_E0694DB7 
X-CRM114-Status: GOOD (  19.63  )
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


On 6/15/2026 4:19 PM, Icenowy Zheng wrote:
> 在 2026-06-15一的 14:49 +0800，Joey Lu写道：
>> The existing schema hard-codes the five-clock/three-reset/dual-port
>> topology of the DC8200 IP block, preventing reuse for single-output
>> variants such as the Verisilicon DCUltraLite used in the Nuvoton
>> MA35D1
>> SoC.
>>
>> Rework the schema so that variant-specific constraints are expressed
>> via
>> allOf/if blocks:
>>
>> - Add nuvoton,ma35d1-dcu to the SoC-specific compatible enum.  The
>>    generic verisilicon,dc fallback remains the driver-binding string.
>> - Move clock and reset items descriptions into the per-variant
>> allOf/if
>>    blocks; keep only minItems/maxItems at the top level so the base
>> schema
>>    accepts all variants.
>> - Restore full items lists for clock-names and reset-names at the top
>>    level with minItems so the names are validated against the
>> descriptions.
>> - Keep ports in the global required list and keep
>> additionalProperties: false.
>> - Add an allOf/if block for thead,th1520-dc8200: five-clock (core,
>> axi,
>>    ahb, pix0, pix1), three-reset (core, axi, ahb), required resets.
>> - Add an allOf/if block for nuvoton,ma35d1-dcu: two-clock (core,
>> pix0),
>>    one-reset (core), required resets.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/display/verisilicon,dc.yaml      | 80
>> +++++++++++++++++--
>>   1 file changed, 73 insertions(+), 7 deletions(-)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> index 9dc35ab973f2..0c41286b8223 100644
>> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> @@ -17,6 +17,7 @@ properties:
>>       items:
>>         - enum:
>>             - thead,th1520-dc8200
>> +          - nuvoton,ma35d1-dcu
>>         - const: verisilicon,dc # DC IPs have discoverable ID/revision
>> registers
>>   
>>     reg:
>> @@ -26,14 +27,12 @@ properties:
>>       maxItems: 1
>>   
>>     clocks:
>> -    items:
>> -      - description: DC Core clock
>> -      - description: DMA AXI bus clock
>> -      - description: Configuration AHB bus clock
>> -      - description: Pixel clock of output 0
>> -      - description: Pixel clock of output 1
> Clock descriptions should still be in the global part instead of the
> per-compatible part.
>
> In the per-compatible part, clock-names should be constraint for SoCs.
I will move the `items:` clock descriptions back into the global 
`clocks:` property, covering all five possible clocks. In the 
per-compatible sections I will remove the description items and only 
constrain `clocks: minItems/maxItems` and `clock-names: 
minItems/maxItems`; for nuvoton,ma35d1-dcu I will additionally override 
`clock-names: items:` to the two names actually used (core, pix0).
>> +    minItems: 2
>> +    maxItems: 5
>>   
>>     clock-names:
>> +    minItems: 2
>> +    maxItems: 5
>>       items:
>>         - const: core
>>         - const: axi
>> @@ -42,12 +41,16 @@ properties:
>>         - const: pix1
>>   
>>     resets:
>> +    minItems: 1
>> +    maxItems: 3
>>       items:
>>         - description: DC Core reset
>>         - description: DMA AXI bus reset
>>         - description: Configuration AHB bus reset
>>   
>>     reset-names:
>> +    minItems: 1
>> +    maxItems: 3
>>       items:
>>         - const: core
>>         - const: axi
>> @@ -59,7 +62,7 @@ properties:
>>       properties:
>>         port@0:
>>           $ref: /schemas/graph.yaml#/properties/port
>> -        description: The first output channel , endpoint 0 should be
>> +        description: The first output channel, endpoint 0 should be
> If you really want to fix this, please make it a separated patch
> instead of doing it here, for commit atomicity.
>
> Thanks,
> Icenowy
I’ll drop this change and keep it as is
>>             used for DPI format output and endpoint 1 should be used
>>             for DP format output.
>>   
>> @@ -77,6 +80,69 @@ required:
>>     - clock-names
>>     - ports
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: thead,th1520-dc8200
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 5
>> +          maxItems: 5
>> +          items:
>> +            - description: DC Core clock
>> +            - description: DMA AXI bus clock
>> +            - description: Configuration AHB bus clock
>> +            - description: Pixel clock of output 0
>> +            - description: Pixel clock of output 1
>> +
>> +        clock-names:
>> +          minItems: 5
>> +          maxItems: 5
>> +
>> +        resets:
>> +          minItems: 3
>> +          maxItems: 3
>> +
>> +        reset-names:
>> +          minItems: 3
>> +          maxItems: 3
>> +
>> +      required:
>> +        - resets
>> +        - reset-names
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: nuvoton,ma35d1-dcu
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 2
>> +          maxItems: 2
>> +          items:
>> +            - description: DC Core clock
>> +            - description: Pixel clock of output 0
>> +
>> +        clock-names:
>> +          minItems: 2
>> +          maxItems: 2
>> +
>> +        resets:
>> +          minItems: 1
>> +          maxItems: 1
>> +
>> +        reset-names:
>> +          maxItems: 1
>> +
>> +      required:
>> +        - resets
>> +        - reset-names
>> +
>>   additionalProperties: false
>>   
>>   examples:

