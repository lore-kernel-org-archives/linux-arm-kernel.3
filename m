Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D31CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 09:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K89RrwpcqLo8zDg2OvFefmB2AQCgF8PACyQq7p8WH+I=; b=PWSY/Qn3E2nulhzbcikbDPrTpe
	e22MEyDo/Zo6/S1n5D8+NYoeDZgCeRdztO3Nuf9z2kcr0tEwnvHdHlRfFc+ott2m7pK+IghQtC0ut
	Bdw77YicAmeKt6rgxbiMxm8cxRrLetT4cwundZc0bAI55T+BQvV4Cw0+zx1J5ZZ9kjGHhxsqDtDv/
	zfxChm0+jjAtC3wL3qyMIk0hptY7xdYT3VjM9k74glt7D1kIhJexvfc7aivM1RHSPFBqQoWfY0yJl
	8VeQbzD7kNt79E/aPxknrZ4vxLL/DEgekwjXIFnu0ylGwbx5VjF0uJpiuA7T2yMp/O8Dzxh8c63xx
	sfGbg9HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWVI-00000003Cu8-3Ljl;
	Mon, 08 Jun 2026 09:42:44 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWVG-00000003CtT-2yVc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 09:42:44 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8423b08b293so1727170b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 02:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780911762; x=1781516562; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K89RrwpcqLo8zDg2OvFefmB2AQCgF8PACyQq7p8WH+I=;
        b=phKUCMq7JpIhLH1gNXFvYKdppgxKod6tXgkUXfM5bPRUP6G5QnBoqQ3A4ydLOlefWa
         j7SbNtlGxNaes/uMn/hLjFY4Ikroqa+WAXWs0aSmtyNocUgODvq71RNDp/MS3oWI1jo/
         TwaJx38Jc8O9KLQvZLRlzUCpEc81lNhvuIHiWP1DFW+w5X8nUowmlMJYQkUd/G31WucA
         YdlEOXzpAAbeNzpCDtmwydQvMF/Qs4WIYDJbxcS9ZYBiN0Gsi3ByrLBfW80/+zQNlDKj
         eMP5F8rAmrs7EstpW/ckL4Hz5fCkeUm0oCSVWUDJIvUVi4WsQbRGuhdevrWJteJjr33A
         GbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780911762; x=1781516562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K89RrwpcqLo8zDg2OvFefmB2AQCgF8PACyQq7p8WH+I=;
        b=ceNOA5WBZAbVewqaI4vv/kYsatwduotpL+WbRZEPew8TZQUzM2L9RPs3QUJNRsWKVY
         dRoYc98Q6RjfqSoGYY3lpkxJVbpUi3O2ZTITNeHlITBTVfMo5U2ozlPlYRiOSRa19VKM
         2T+ERR2pYCvim0ViMEjoMKZJBqbAs2aWSkbenSec7t9urFbi7SDkZn2UTAiiKipWkmCP
         9huxfKH9xeypBPQaobAr0Sv2fcqTHlg+3o2ryD75MmRxKLb9LVLwoM6rcFfWd44AgB7T
         0xsRq3h1mnOUILHckY8xdQ+OaFgAbpHEqvOg68hUgBclDxMgsZPJX8xtgbsazEkk02nv
         i0zQ==
X-Forwarded-Encrypted: i=1; AFNElJ+oKQvbv/lop04n2oqIVrEn0TS0NOWPoWI3sm4EdRa3LpYMQf3VzDXlJ2vuuG/oP6Vg3Cz8EF/RdDODM0gWPO3K@lists.infradead.org
X-Gm-Message-State: AOJu0YzHsvS1Mei83k9wmOAYViuesbA48DFsFM2GsmVA8FvhlGjnMbR4
	hp71DMdGGcDDE/dNl1BhQKP5ckjAUC7z9ayQpBRygvGVT42D4H3NjabWne6Grw==
X-Gm-Gg: Acq92OHCq+TgYV1zmi/2fCNMpbjPE9C0ss1I0o/8gPe2hDEEg5D8LVVfitzV4xoW2kC
	k/0kBTNiaV2YkZqslE0/LdYLZUPgUxrakLkEHgm9hWQSzYxniK3gmyLBzETUSD9EkGupti/OJV0
	PO3mvkrnwPOvVQveJP+b/ez7SDrDCiu8S4CR8LhZw0F4sMQTLL3Jm3dkmzgG+e/gUv7+1IvgliL
	7uVtfgQQp/L88jChxAxp0bwQK4hn/rF0HBfv9FOaDixw7IRDvWSAr2BhuTWDlriNrJu4fup+4/M
	b/v2QNfkaOBvywGRj4xLGXxx30Qze8E76bi0DZI695PoVSuy2uy6mfh/vOgAxFEcIetjcZKmtOZ
	NkGB1ySSsX6+aCRhkHg23zdi9etgmckTDUlqEP+hoJ2S5JW14LauCkt57dJJEOSzOmsQ1n0smSj
	0UGfoyInal1Y+YLrhsDtMJlA5SHyAEoCc0+qSfONGqJvRtidVQsPUBZY64O839zD4d3jENGMF4v
	SMwcKEHa/nEez0=
X-Received: by 2002:a05:6a00:a227:b0:842:5719:455c with SMTP id d2e1a72fcca58-842b106587dmr14714982b3a.25.1780911761597;
        Mon, 08 Jun 2026 02:42:41 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372868sm19883930b3a.17.2026.06.08.02.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:42:41 -0700 (PDT)
Message-ID: <684fde52-569c-4b38-904c-dbb05054634f@gmail.com>
Date: Mon, 8 Jun 2026 17:42:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: display: verisilicon,dc: generalize
 for single-output variants
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260608023237.305036-1-a0987203069@gmail.com>
 <20260608023237.305036-2-a0987203069@gmail.com>
 <a3f6fa4529bff5390dd1beb164d600208dc650a5.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <a3f6fa4529bff5390dd1beb164d600208dc650a5.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_024242_757850_B17287FA 
X-CRM114-Status: GOOD (  25.25  )
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


On 6/8/2026 2:32 PM, Icenowy Zheng wrote:
> 在 2026-06-08一的 10:32 +0800，Joey Lu写道：
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
>> - Relax the top-level clocks/resets definitions to minItems ranges so
>>    the base schema accepts both variants.
>> - Keep ports in the global required list and keep
>> additionalProperties
>>    tightened to unevaluatedProperties.
>> - Add an allOf/if block for thead,th1520-dc8200: five-clock (core,
>> axi,
>>    ahb, pix0, pix1), three-reset (core, axi, ahb).
>> - Add an allOf/if block for nuvoton,ma35d1-dcu: two-clock (core,
>> pix0),
>>    one-reset (core).
>> - Fix a stray space in the port@0 description.
>> - Add a DT example for the Nuvoton MA35D1 DCU Lite using
>> ports/port@0.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/display/verisilicon,dc.yaml      | 103 +++++++++++++++-
>> --
>>   1 file changed, 90 insertions(+), 13 deletions(-)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> index 9dc35ab973f2..db0260d874c5 100644
>> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> @@ -17,7 +17,8 @@ properties:
>>       items:
>>         - enum:
>>             - thead,th1520-dc8200
>> -      - const: verisilicon,dc # DC IPs have discoverable ID/revision
>> registers
>> +          - nuvoton,ma35d1-dcu
>> +      - const: verisilicon,dc  # DC IPs have discoverable
>> ID/revision registers
> Ah is an extra space added here, which leads to this hunk looking
> strange?
The extra space was added because `yamllint` reports "too few spaces 
before comment" (warning: comments) when only one space precedes the 
`#`. However, since this constitutes an unrelated whitespace change that 
makes the diff harder to read, I will revert to the original 
single-space form to keep the patch clean.
>>   
>>     reg:
>>       maxItems: 1
>> @@ -26,6 +27,7 @@ properties:
>>       maxItems: 1
>>   
>>     clocks:
>> +    minItems: 2
> Maybe restrictions about the clock count shouldn't be inserted here,
> and technically it's possible that only the pixel clock is controllable
> by Linux (all other clocks are in a fixed configuration).
Understood. I will remove the per-variant clock items descriptions from 
the top-level `clocks:` section and move them into the respective 
allOf/if blocks. The top-level will only carry `minItems`/`maxItems` for 
schema validation range.
>>       items:
>>         - description: DC Core clock
>>         - description: DMA AXI bus clock
>> @@ -34,24 +36,19 @@ properties:
>>         - description: Pixel clock of output 1
>>   
>>     clock-names:
>> -    items:
>> -      - const: core
>> -      - const: axi
>> -      - const: ahb
>> -      - const: pix0
>> -      - const: pix1
> Ah I think the total list should still appear here, and they should be
> corresponding to the descriptions above?
Understood. I will restore the full items list for `clock-names` at the 
top level (all five entries: core, axi, ahb, pix0, pix1) and add 
`minItems` to make it flexible. Per-variant allOf blocks will only 
constrain with `minItems`/`maxItems`.
>> +    minItems: 2
>> +    maxItems: 5
>>   
>>     resets:
>> +    minItems: 1
>>       items:
>>         - description: DC Core reset
>>         - description: DMA AXI bus reset
>>         - description: Configuration AHB bus reset
>>   
>>     reset-names:
>> -    items:
>> -      - const: core
>> -      - const: axi
>> -      - const: ahb
> Ditto here.
Understood. I will restore the full items list for `reset-names` at the 
top level (core, axi, ahb) with `minItems`. Same pattern as clock-names.
>> +    minItems: 1
>> +    maxItems: 3
>>   
>>     ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>> @@ -59,7 +56,7 @@ properties:
>>       properties:
>>         port@0:
>>           $ref: /schemas/graph.yaml#/properties/port
>> -        description: The first output channel , endpoint 0 should be
>> +        description: The first output channel, endpoint 0 should be
>>             used for DPI format output and endpoint 1 should be used
>>             for DP format output.
>>   
>> @@ -77,7 +74,60 @@ required:
>>     - clock-names
>>     - ports
>>   
>> -additionalProperties: false
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
>> +
>> +        clock-names:
>> +          items:
>> +            - const: core
>> +            - const: axi
>> +            - const: ahb
>> +            - const: pix0
>> +            - const: pix1
>> +
>> +        resets:
>> +          minItems: 3
>> +          maxItems: 3
>> +
>> +        reset-names:
>> +          items:
>> +            - const: core
>> +            - const: axi
>> +            - const: ahb
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
>> +
>> +        clock-names:
>> +          items:
>> +            - const: core
>> +            - const: pix0
>> +
>> +        resets:
> Do we have minItems: 1 here? (The DT schema validator always has some
> quirks that I fail to remember, so I am not sure.)
Yes, I will add `minItems: 1` to `resets:` in the nuvoton block.
>> +          maxItems: 1
>> +
>> +        reset-names:
>> +          items:
>> +            - const: core
>> +
> I think resets should be described as required in both device-specific
> bindings.
>
> Thanks,
> Icenowy

Understood. I will add `required: [resets, reset-names]` inside the 
`then:` block for both thead,th1520-dc8200 and nuvoton,ma35d1-dcu.

Many thanks!

>> +unevaluatedProperties: false
>>   
>>   examples:
>>     - |
>> @@ -120,3 +170,30 @@ examples:
>>           };
>>         };
>>       };
>> +
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>> +
>> +    display@40260000 {
>> +        compatible = "nuvoton,ma35d1-dcu", "verisilicon,dc";
>> +        reg = <0x40260000 0x20000>;
>> +        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&clk DCU_GATE>, <&clk DCUP_DIV>;
>> +        clock-names = "core", "pix0";
>> +        resets = <&sys MA35D1_RESET_DISP>;
>> +        reset-names = "core";
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +                dpi_out: endpoint {
>> +                    remote-endpoint = <&panel_in>;
>> +                };
>> +            };
>> +        };
>> +    };

