Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CAACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 03:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIAQ9DaAotLVRz2iB1AFoG5yBrv9qo1aI5uct5Q5rhg=; b=SoeatcgAqDGHOV3BXM+45lAXGw
	Z/ITzC1iyxcRu1MAuv1Zl/55BT+MbQpwqV6FthgN5faYWfStNzLcxHenxYaTv3Cyilbvrs990Sm4W
	IHdjn/a1fsZUK885CEPgKzQjOF0ghyCK7UxDwdc7+O2NR0crH6oodSSpjWVmgQAVwfNhy/LiyitUB
	j7VwGb/wjlq1d4JTP/ZBMCdQPNihUPO7H/pD5X1OfNtE2r2LUIBZZaRIwYSGe/jM0Fok2YL8/ObMy
	aobwV4ejVpHtV7madOqmzia+zmqKcklnRRwftoaGAGLbylFGeMLDfcIQ8pHK8hE9KUBYppcJ3KtMu
	WTWTbYbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPXGE-00000003MSu-1iXp;
	Wed, 20 May 2026 03:06:18 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPXG9-00000003MRs-1JEq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 03:06:16 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-367c26471f5so2686199a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 20:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779246372; x=1779851172; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nIAQ9DaAotLVRz2iB1AFoG5yBrv9qo1aI5uct5Q5rhg=;
        b=MpWg5spkO0vqZScZsi1CV196FJOwvRaEOtQuGqRls5bVotM8xg3vqbHdplUQuNuyTD
         PgTvVC30HCEMndFF3tK0392hvrrkYUOqsvuWQcBUTe8s+167cafjSLe9CSUt6lYkkWTO
         Pz5TcqljYpAejI/x7D+MVMhSrzrInGxtbezCPu0ZCbTiWWUBTsj1QMOjvHZMAdt6WZ8G
         v4vItyRfqvZld5m1C1fR2ivj4A0vAFg0y8/HcP+l4B9OHDe/F5aujhp9zMb6Lvn1Imjw
         RFjN3jmX/6TJ4u27bPo7MozKrKM1sUQ+nRNXbhNPQojtECuNmEON18UzDsqkgQhTnbnv
         70bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779246372; x=1779851172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIAQ9DaAotLVRz2iB1AFoG5yBrv9qo1aI5uct5Q5rhg=;
        b=EEX/MMi2OEQ17LK6eebdEE34uuNIAWC7r3Nng/a8SbGutFslJr6+RS0ps+KXM5cYv4
         3aCJLS0dZ3CnR/nYaPXdqNf9zE87VYCZ1DXeHsudLnDyp+NAh2YC+D+FcBB7/s29dyVS
         74aheWk7oRz1/ipWhZG+M226BKqaB0O57IvE1MV8j7+z8hwBMeSyKIL8sTvl/4l0ocF1
         lrksBXfnBTYFOW4lCkmhfq1cp5+olwP9Wt0vWBVkdC3ZhUOR2bjlsVY+eK7tKATSrNN6
         7eNlzLQg6+qUsqyB2EvffqGLuV2lA8uH50fEhGYfUT9TlciNk8WObC+JKYd30Gy+O6bd
         AOAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9L0MAKHEpd6BCIaJ+8CYnn1JZ3UKi2vWeK43oWtyrBYp6mk3A5QgkRaYdlv2GlbmTfVanONITgVj/1YRmeTwZX@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2kqSotdm1Jt9FdOYglvxdgC8+D3bjr5r6sRzT49WkaHZU53Yh
	qisQYWzYluo0SAq8iP2g6Jq01sSF4iwh+sIMLe/1jQZ2QlWZA66Ewta/
X-Gm-Gg: Acq92OGSUd/SzLsqequwGC9mNW6EYhGZScX0ezfV4wuRaoD6whUfbZdyPGslGVWC0Ov
	DRlstNxT+JRYZsjLi1qLJNJy7YzzwxWe2wVlGWQkupIVcw1twAhywIyIqjROx3G4Vu+W4SHd8rm
	M2rDkdX4v3xMFfXrLQHJh4eAhp+W3o4OAi/SVNPvrIRCtJO24SXos4VkFm4RfEze3VrjAkNfaGV
	cXmbXtDirnCmTtZ4khcBHOi6J4yFlMXZJmXFn/o60Vw6aWHs3lx0NNM/AmjgS9RBClY1wUF4OR2
	Us0giSu1hVtCO5mlf1LSdyRBXGgmcyZc4If+q++UQ9UxSO4vOtIgER1VTUHk9WNBfQLVfjDfa7/
	/rIEftUIzU/9QLslPSj2OPWG8Hf1EWRTCBtTa1PWD10T8agE0PCMYFhdDLClPQmJocRqxD8kqqE
	2bBgBRuRDLL16xHlmMiZWguQtkZE6xDpW/9DBgSjpybB7a52TDCiLUC4jI5cwtx5i7b2kjuGEHJ
	r52uJ8iTzi3LWs=
X-Received: by 2002:a17:90b:1fce:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-369519cb5d1mr21310800a91.9.1779246371983;
        Tue, 19 May 2026 20:06:11 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369514361b6sm15491821a91.12.2026.05.19.20.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 20:06:11 -0700 (PDT)
Message-ID: <a112cb8b-21fb-4c33-89a3-14a4feb5e3f9@gmail.com>
Date: Wed, 20 May 2026 11:06:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: display: verisilicon, dc: generalize
 for single-output variants
To: Conor Dooley <conor@kernel.org>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260519055114.1886525-1-a0987203069@gmail.com>
 <20260519055114.1886525-2-a0987203069@gmail.com>
 <a66cc60fe163167e30e42f0b4be996cae1170a5e.camel@iscas.ac.cn>
 <20260519-fretful-blush-1aac18fa1360@spud>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260519-fretful-blush-1aac18fa1360@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_200615_131132_453014AC 
X-CRM114-Status: GOOD (  28.37  )
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

On 5/20/2026 12:47 AM, Conor Dooley wrote:
> On Tue, May 19, 2026 at 03:26:58PM +0800, Icenowy Zheng wrote:
>> 在 2026-05-19二的 13:51 +0800，Joey Lu写道：
>>> The existing schema assumes a fixed clock/reset topology and dual-
>>> output
>>> port structure matching the DC8200 IP block.  This prevents reuse for
>>> single-output variants such as the Verisilicon DCU Lite used in the
>>> Nuvoton MA35D1 SoC.
>>>
>>> Rework the schema so that variant-specific constraints are expressed
>>> via allOf/if-then-else:
>>>
>>> - The thead,th1520-dc8200 compatible keeps its existing five-clock,
>>>    three-reset, dual-port requirements.
>>>
>>> - A standalone verisilicon,dc compatible covers IPs whose identity is
>>>    discovered entirely through hardware registers; these have flexible
>>>    clock and reset counts, a single 'port' property, and no 'ports'
>>>    requirement.
>>>
>>> Changes to the base schema:
>>> - Replace the fixed clock/reset items lists with minItems/maxItems
>>>    ranges; variant sub-schemas tighten the constraints via if-then-
>>> else.
>>> - Add a 'port' property (graph.yaml single-port alias) alongside the
>>>    existing 'ports', for single-output variants.
>>> - Drop the unconditional 'ports' requirement; each if-branch enforces
>>>    its own port topology.
>>> - Tighten additionalProperties to unevaluatedProperties to allow
>>>    per-variant schemas to add their own constraints cleanly.
>>> - Fix a stray space in the port@0 description.
>>> - Add a DT example for the generic verisilicon,dc compatible
>>>    (Nuvoton MA35D1 DCU Lite).
>>>
>>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>> ---
>>>   .../bindings/display/verisilicon,dc.yaml      | 135 ++++++++++++++--
>>> --
>>>   1 file changed, 108 insertions(+), 27 deletions(-)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>> index 9dc35ab973f2..3a814c2e083e 100644
>>> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>> @@ -14,10 +14,12 @@ properties:
>>>       pattern: "^display@[0-9a-f]+$"
>>>   
>>>     compatible:
>>> -    items:
>>> -      - enum:
>>> -          - thead,th1520-dc8200
>> You should add a fallback compatible here for your SoC, in case its
>> integration gets something quirky; this compatible is usually not
>> consumed by the driver (see how thead,th1520-dc8200 exists in the
>> binding but not the driver).
> s/fallback compatible/soc-specific compatible/, but yes.
> NAK to what's been done here, especially after the discussions on
> earlier versions of this verisilicon binding.
> pw-bot: changes-requested
Understood. I will add `nuvoton,ma35d1-dcu` as the SoC-specific 
compatible string paired with `verisilicon,dc` as the generic fallback, 
matching the pattern used for `thead,th1520-dc8200`. The standalone 
`verisilicon,dc` compatible will be removed from the binding. The driver 
match table is not changed since hardware detection is done via ID 
registers.
>>> -      - const: verisilicon,dc # DC IPs have discoverable ID/revision
>>> registers
>>> +    oneOf:
>>> +      - items:
>>> +          - enum:
>>> +              - thead,th1520-dc8200
>>> +          - const: verisilicon,dc
>>> +      - const: verisilicon,dc  # DC IPs have discoverable
>>> ID/revision registers
>>>   
>>>     reg:
>>>       maxItems: 1
>>> @@ -26,32 +28,24 @@ properties:
>>>       maxItems: 1
>>>   
>>>     clocks:
>>> -    items:
>>> -      - description: DC Core clock
>>> -      - description: DMA AXI bus clock
>>> -      - description: Configuration AHB bus clock
>>> -      - description: Pixel clock of output 0
>>> -      - description: Pixel clock of output 1
>>> +    minItems: 2
>>> +    maxItems: 5
>>>   
>>>     clock-names:
>>> -    items:
>>> -      - const: core
>>> -      - const: axi
>>> -      - const: ahb
>>> -      - const: pix0
>>> -      - const: pix1
>>> +    minItems: 2
>>> +    maxItems: 5
>>>   
>>>     resets:
>>> -    items:
>>> -      - description: DC Core reset
>>> -      - description: DMA AXI bus reset
>>> -      - description: Configuration AHB bus reset
>>> +    minItems: 1
>>> +    maxItems: 3
>>>   
>>>     reset-names:
>>> -    items:
>>> -      - const: core
>>> -      - const: axi
>>> -      - const: ahb
>>> +    minItems: 1
>>> +    maxItems: 3
>>> +
>>> +  port:
>>> +    $ref: /schemas/graph.yaml#/properties/port
>>> +    description: Single video output port for single-output
>>> variants.
>> Maybe the endpoint numbering rule needs a move to here? (I am not very
>> sure).
I will add a description to the `port` property noting that endpoint 0 
is used for DPI output, which is the only output type for DCUltraLite.
>>>   
>>>     ports:
>>>       $ref: /schemas/graph.yaml#/properties/ports
>>> @@ -59,7 +53,7 @@ properties:
>>>       properties:
>>>         port@0:
>>>           $ref: /schemas/graph.yaml#/properties/port
>>> -        description: The first output channel , endpoint 0 should be
>>> +        description: The first output channel, endpoint 0 should be
>>>             used for DPI format output and endpoint 1 should be used
>>>             for DP format output.
>>>   
>>> @@ -75,9 +69,75 @@ required:
>>>     - interrupts
>>>     - clocks
>>>     - clock-names
>>> -  - ports
>>>   
>>> -additionalProperties: false
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: thead,th1520-dc8200
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          items:
>>> +            - description: DC Core clock
>>> +            - description: DMA AXI bus clock
>>> +            - description: Configuration AHB bus clock
>>> +            - description: Pixel clock of output 0
>>> +            - description: Pixel clock of output 1
>>> +
>>> +        clock-names:
>>> +          items:
>>> +            - const: core
>>> +            - const: axi
>>> +            - const: ahb
>>> +            - const: pix0
>>> +            - const: pix1
>>> +
>>> +        resets:
>>> +          items:
>>> +            - description: DC Core reset
>>> +            - description: DMA AXI bus reset
>>> +            - description: Configuration AHB bus reset
>>> +
>>> +        reset-names:
>>> +          items:
>>> +            - const: core
>>> +            - const: axi
>>> +            - const: ahb
>>> +
>>> +      required:
>>> +        - ports
>>> +
>>> +    else:
>>> +      properties:
>>> +        clocks:
>>> +          items:
>>> +            - description: Bus clock that gates register access
>>> +            - description: Pixel clock divider for display timing
>> Please don't make compatible-specific description strings for
>> individual compatibles, and keep these descriptions outside of the if.
>> The compatible-specific part should be used to specify what's required
>> for the specific SoC, for dt validation purpose.
>>
>> BTW if the clock is both the working clock and bus clock for the
>> controller, I suggest listing it twice, except if the IP core is
>> provided without a dedicated core clock (in the case I suggest to use
>> "bus" only).
> I agree. If the same clock is provided to two+ ports on the IP, that
> should still be two+ clocks in the devicetree.
>
>> Here's an example for "listing it twice":
>> ```
>> clocks = <&clk DCU_GATE>, <&clk DCU_GATE>, <&clk DCUP_DIV>;
>> clock-names = "core", "bus", "pix0";
>> ```
>>
>> Well nonetheless the name "core" does not match the description "Bus
>> clock that gates register access".
>>
>> Thanks,
>> Icenowy

Understood. I will remove all description strings from the if/else 
branches; the if/then clauses will only constrain clock-names and 
reset-names items (name values only, no descriptions). Regarding clock 
naming: DCU_GATE on MA35D1 is a peripheral gate clock without a separate 
dedicated core working clock, so I will keep "core" as the name and drop 
the misleading description "Bus clock that gates register access". The 
description mismatch was entirely in the if/else strings which are now 
removed.

Thanks.

>>
>>> +
>>> +        clock-names:
>>> +          items:
>>> +            - const: core
>>> +            - const: pix0
>>> +
>>> +        resets:
>>> +          maxItems: 1
>>> +          description:
>>> +            Reset line for the display controller.
>>> +
>>> +        reset-names:
>>> +          items:
>>> +            - const: core
>>> +
>>> +      required:
>>> +        - port
>>> +
>>> +      not:
>>> +        required:
>>> +          - ports
>>> +
>>> +unevaluatedProperties: false
>>>   
>>>   examples:
>>>     - |
>>> @@ -120,3 +180,24 @@ examples:
>>>           };
>>>         };
>>>       };
>>> +
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>>> +
>>> +    display@40260000 {
>>> +        compatible = "verisilicon,dc";
>>> +        reg = <0x40260000 0x20000>;
>>> +        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
>>> +        clocks = <&clk DCU_GATE>, <&clk DCUP_DIV>;
>>> +        clock-names = "core", "pix0";
>>> +        resets = <&sys MA35D1_RESET_DISP>;
>>> +        reset-names = "core";
>>> +
>>> +        port {
>>> +            dpi_out: endpoint {
>>> +                remote-endpoint = <&panel_in>;
>>> +            };
>>> +        };
>>> +    };

