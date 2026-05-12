Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4C6CD4855
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 08:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AvdMBdFTlgEZ+NgOQJwvclLyoLJxV/JPRMgoqHd4xoY=; b=itML95tuYcDffsl1s/q5vBxiLb
	E4Wnr+lWMjKhF3PQ2wz88IJRDmcXdGn11ysiVYvRH5aYKFJ6VwnuJNBAhlCTu7Y1ewhmaI82TJf3L
	+WcRcPXMWCYHw7qOMvVft9eDPfU0Vn4jhHOBSnY3gn7zcvZYbfBAC+w79bJEILSqsjJc9VeLMhtLv
	8plNmOR799xvm6T2FHgNR/0iTmBv+Qh8ahx0sD5fet9VEr7/aYAWrbPKLD8/1RiT0STRd3USgTUwJ
	0wB2aaskdkZ1Y5FrWVzUsKw2XRAxEHhU+vE87ROPuf8xUsuv1+zrR/fS/yvgGSAZSlKR8F9Kzw0VS
	RREuLZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMi4F-0000000G1D6-1p64;
	Tue, 12 May 2026 08:02:15 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMi4D-0000000G1Bz-15jm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 08:02:14 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c8095d7d75bso2140084a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 01:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778572932; x=1779177732; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AvdMBdFTlgEZ+NgOQJwvclLyoLJxV/JPRMgoqHd4xoY=;
        b=mm7vo2K8PsJK42lwktKMYEnYHLa3HtvhQhXMLEOWc7vE9GCZDsymITs0+xLhUq0l/V
         /WqtfavwZ6dwluYSObeDMgKgHDWMf76HZ5L1F8XWi3Ei10Bzb1F6kVQ18RSb2WyAgAGp
         EKxASEPiNbq38BommSPQgzHYlmFlFb+fRgc7SX6LqCFthMmd4bDM5jrVGs0NGgthoOUo
         Nrs3Jxnl8uT1QkhiQ5BQk7eJvVfuz/dXJgqoTBwFy6KM6GDYnVhMIvRGtHMI8Lm/cFU5
         5rjl92ha6LiLpcIa/7BUq7Fs0swOxZd/fPh4iAmrjwO3sLamdfR/QTPnXg6IZOao3XDI
         feGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778572932; x=1779177732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvdMBdFTlgEZ+NgOQJwvclLyoLJxV/JPRMgoqHd4xoY=;
        b=FswoJkpw/Elvzs9+yxnBQZ+ZQb+EZf7gIZx8Z/n85OzEo/tUjOXCQ3QoCKKp0gxdOc
         RRj9gcphRqcH09xG4WjBV02uJIq6iucLB8sjN2eALvOADVKTsNSsy8dFRt/q/Afwehvz
         x0P1c2oC5Nf/jp3pWUERHNgVvA7585ZTrwaGQ8w4mdi4mVrBw4ImOKFoPr4tWAWYKjrB
         fUr8g2/+oQv/M5v76CR7rdc8rdAhW6Zvhg46Cvv0JxpJz16YbDmSk9A5XyGdItz2PeQz
         l0wEQSzZYhPWGdZqbHrPj4z187eqwHt/QMR6B9toirhUvHNDFQl8x7zrZtU3h0Rtp19X
         HE6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+aRiES7yR4RfZYjwEjW4zNKM4AScCqzxnYXjy52GPEoCgobbIMVMIHPHIhZX0qm3Jv1WVQIVVhHbjQ6v3FjgWj@lists.infradead.org
X-Gm-Message-State: AOJu0YyU664XrRuZbysSfmTja5RYu/vlzsvYvfhEBGiMf2mw7ZhoECSk
	1M/6W+9JoTj0pnS1taPKCT4NdJ+EH5pxxICUr+Q5Uzk1zkRlQFBBAPeI
X-Gm-Gg: Acq92OGEWVIlhXKbGUUZYGA/79Fx5IS/li7edMVeKqcWKgnNXbSEjbQo9cNTG0EldDs
	on9jrvgVk4dIqOA+efbcolqLXrMS4laugF0yGabWKwf3Atce1LAD1K/H5BzXVVYyzZ334O5TCnl
	Ku2NYb2iv9WhIy6D8RvmgZK6SI+SeUhZPdm79iZpL92Taa1UHmMMgBQ82g3zpCv52kyo3TgsUeV
	P5wBE9XdYCts5+5fABryE2YTJJJ/Vbw2Gx93DjDWVa77t0pPZjzJS6J9Kn5WYLY7uf8tK15CWP7
	yj5Zu288XMSYmiCypA55Zxi2JGEzuOKR1gvTqjraA0Lh58zisAn6dWjnSFvoaM4bA+mNGpWbSzD
	iklzzxPSFDYTp6uQWNg1E0qeTexG3IqdtJdGyjexqiMi7Lj6HLSbVbDUNT2fmtmuBWIbU8rVwS/
	V/7erOIwvZWZvD7mFPTACbLPBVOaxu5WcH8k+VkwcyNSr9uBbsHGhyKoTvOn3P0uh9gIBO/77c9
	9Ia
X-Received: by 2002:a05:6a20:9144:b0:3a3:adea:83ac with SMTP id adf61e73a8af0-3aad44c2583mr14068901637.46.1778572931739;
        Tue, 12 May 2026 01:02:11 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d36a12sm20537152b3a.27.2026.05.12.01.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:02:11 -0700 (PDT)
Message-ID: <8904a207-9dd8-4fd3-a0d8-7c688361bea3@gmail.com>
Date: Tue, 12 May 2026 16:02:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display: verisilicon,dc: generalize for
 DCUltra Lite variant
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260511075142.54752-1-a0987203069@gmail.com>
 <20260511075142.54752-2-a0987203069@gmail.com>
 <cb69490652409eb4f07b3ee642d478e1b2e28c5b.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <cb69490652409eb4f07b3ee642d478e1b2e28c5b.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_010213_311877_A03CA7C9 
X-CRM114-Status: GOOD (  31.28  )
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


On 5/11/2026 5:59 PM, Icenowy Zheng wrote:
> 在 2026-05-11一的 15:51 +0800，Joey Lu写道：
>> Extend the verisilicon,dc base schema to accommodate the Nuvoton
>> MA35D1
>> DCUltra Lite (a previous generation of the DC8000 series) which has a
>> different clock topology, no reset control, and a single output.
>>
>> - Replace the fixed clock/reset item lists with minItems/maxItems
>> ranges
>>    so sub-schemas can enforce variant-specific constraints
>> - Add a 'port' property (single-port alias) alongside the existing
>> 'ports'
>>    for single-output variants
>> - Remove the mandatory 'ports' requirement from the base schema; sub-
>> schemas
>>    shall enforce their own port topology
>> - Add a 'select' stanza so the validator matches any node whose
>> compatible
>>    contains a known Verisilicon DC string, including SoC-specific glue
>> - Relax additionalProperties to allow unevaluatedProperties
>> enforcement in
>>    sub-schemas
>> - Fix a minor whitespace issue in the port@0 description
>>
>> Add nuvoton,ma35d1-dcu.yaml as a sub-schema for the Nuvoton MA35D1
>> DCUltra
>> Lite display controller:
>>
>> The Nuvoton MA35D1 integrates the Verisilicon DCUltra Lite display
>> controller. It is a single-output display controller with a 32-bit
>> RGB (DPI) interface. Unlike the DC8000, it does not have discoverable
>> chip identity registers, does not support the CONFIG_EX commit path,
>> and uses dedicated IRQ status/enable registers at offsets
>> 0x147C/0x1480.
>> The clock topology uses two clocks (bus gate and pixel divider) and
>> does not require explicit reset control from the driver.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/display/nuvoton,ma35d1-dcu.yaml  | 94
>> +++++++++++++++++++
>>   .../bindings/display/verisilicon,dc.yaml      | 64 +++++++------
>>   2 files changed, 131 insertions(+), 27 deletions(-)
>>   create mode 100644
>> Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
>>
>> diff --git
>> a/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
>> b/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
>> new file mode 100644
>> index 000000000000..9279004ae27c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/nuvoton,ma35d1-
>> dcu.yaml
>> @@ -0,0 +1,94 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/nuvoton,ma35d1-dcu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 DCUltra Lite display controller
>> +
>> +maintainers:
>> +  - Joey Lu <yclu4@nuvoton.com>
>> +
>> +description:
>> +  The Nuvoton MA35D1 integrates the Verisilicon DCUltra Lite display
>> +  controller. It is a single-output display controller with a 32-bit
>> +  RGB (DPI) interface.
> You'd better write this in verisilicon,dc.yaml with if clauses. See
> Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml for an
> example for a generic IP with different integrations, and how it
> constraints different SoC's integration.
Understood. I'll drop both the separate nuvoton,ma35d1-dcu.yaml
file and the `nuvoton,ma35d1-dcu` compatible string entirely. Since the
chip identity registers are present on the DCUltra Lite (model=0x0,
rev=0x5560, customer=0x305), the MA35D1 DT node will use
`compatible = "verisilicon,dc"` directly. The YAML will use a single
`if/then/else` block in `allOf:` keyed on whether `thead,th1520-dc8200`
is present in the compatible list: the `then` branch enforces DC8200
constraints (5 clocks, 3 resets, `ports` required), and the `else`
branch enforces DCUltra Lite / generic constraints (2 clocks, 1 reset,
`port` required, `ports` forbidden). The Nuvoton MA35D1 example will use
`compatible = "verisilicon,dc"` and fall into the `else` branch.
>> +
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - nuvoton,ma35d1-dcu
>> +  required:
>> +    - compatible
>> +
>> +allOf:
>> +  - $ref: http://devicetree.org/schemas/display/verisilicon,dc.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: nuvoton,ma35d1-dcu
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description:
>> +      Register range of the DCUltra Lite controller. The address
>> space
>> +      is 0x2000 bytes.
> Is it really 0x2000 bytes? The next peripherals in the address space,
> the GC520L 2D GPU, is 0x20000 bytes away from the start of DCU
> registers space.
Good point. The 0x2000 figure is the driver's `max_register`,
not the full hardware block size. I'll remove the description text
claiming "0x2000 bytes" and update the example to use `0x20000` to
match the actual hardware address space.
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Bus clock that gates register access (DCU_GATE)
>> +      - description: Pixel clock divider for display timing
>> (DCUP_DIV)
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: pix0
>> +
>> +  resets:
>> +    maxItems: 1
>> +    description:
>> +      Optional reset for the display controller. The driver does not
>> +      assert or deassert this reset; it may be used by firmware or
>> +      boot loaders to bring the hardware to a clean state.
> Why is there a reset in hardware but not toggled in the software?
The driver will handle the reset in v2. The probe path will call
`devm_reset_control_bulk_get_optional_shared()` unconditionally with all
three names ("core", "axi", "ahb"). Since the MA35D1 DT only provides a
single reset named "core", the "axi" and "ahb" entries will be no-op
handles — optional bulk reset lookup skips absent entries silently.
>> +
>> +  port:
>> +    $ref: /schemas/graph.yaml#/properties/port
>> +    description:
>> +      Output port to the downstream display device (e.g. RGB panel).
>> +      The DCUltra Lite supports a single parallel RGB output.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - port
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>> +
>> +    display@40260000 {
>> +        compatible = "nuvoton,ma35d1-dcu";
>> +        reg = <0x40260000 0x2000>;
>> +        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&clk DCU_GATE>, <&clk DCUP_DIV>;
>> +        clock-names = "core", "pix0";
>> +        resets = <&sys MA35D1_RESET_DISP>;
>> +
>> +        port {
>> +            dpi_out: endpoint {
>> +                remote-endpoint = <&panel_in>;
>> +            };
>> +        };
>> +    };
>> diff --git
>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> index 9dc35ab973f2..00884529f8c1 100644
>> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> @@ -9,15 +9,34 @@ title: Verisilicon DC-series display controllers
>>   maintainers:
>>     - Icenowy Zheng <uwu@icenowy.me>
>>   
>> +description:
>> +  Verisilicon DC-series display controllers.
>> +
>> +# Select any node whose compatible contains one of the known
>> Verisilicon DC
>> +# or DC-derived compatible strings, including SoC-specific glue
>> variants.
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - verisilicon,dc
>> +          - thead,th1520-dc8200
>> +          - nuvoton,ma35d1-dcu
>> +  required:
>> +    - compatible
>> +
>>   properties:
>>     $nodename:
>>       pattern: "^display@[0-9a-f]+$"
>>   
>>     compatible:
>> -    items:
>> -      - enum:
>> -          - thead,th1520-dc8200
>> -      - const: verisilicon,dc # DC IPs have discoverable ID/revision
>> registers
>> +    # Enumerated in full so the schema validator can verify any
>> compatible
>> +    # string against this list, including those from child schemas.
>> +    contains:
>> +      enum:
>> +        - verisilicon,dc
>> +        - thead,th1520-dc8200
>> +        - nuvoton,ma35d1-dcu
>>   
>>     reg:
>>       maxItems: 1
>> @@ -26,32 +45,24 @@ properties:
>>       maxItems: 1
>>   
>>     clocks:
>> -    items:
>> -      - description: DC Core clock
>> -      - description: DMA AXI bus clock
>> -      - description: Configuration AHB bus clock
>> -      - description: Pixel clock of output 0
>> -      - description: Pixel clock of output 1
>> +    minItems: 2
>> +    maxItems: 5
>>   
>>     clock-names:
>> -    items:
>> -      - const: core
>> -      - const: axi
>> -      - const: ahb
>> -      - const: pix0
>> -      - const: pix1
>> +    minItems: 2
>> +    maxItems: 5
>>   
>>     resets:
>> -    items:
>> -      - description: DC Core reset
>> -      - description: DMA AXI bus reset
>> -      - description: Configuration AHB bus reset
>> +    minItems: 1
>> +    maxItems: 3
>>   
>>     reset-names:
>> -    items:
>> -      - const: core
>> -      - const: axi
>> -      - const: ahb
>> +    minItems: 1
>> +    maxItems: 3
>> +
>> +  port:
>> +    $ref: /schemas/graph.yaml#/properties/port
>> +    description: Single video output port for single-output
>> variants.
>>   
>>     ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>> @@ -59,7 +70,7 @@ properties:
>>       properties:
>>         port@0:
>>           $ref: /schemas/graph.yaml#/properties/port
>> -        description: The first output channel , endpoint 0 should be
>> +        description: The first output channel, endpoint 0 should be
>>             used for DPI format output and endpoint 1 should be used
>>             for DP format output.
>>   
>> @@ -75,9 +86,8 @@ required:
>>     - interrupts
>>     - clocks
>>     - clock-names
>> -  - ports
>>   
>> -additionalProperties: false
>> +additionalProperties: true
>>   
>>   examples:
>>     - |

