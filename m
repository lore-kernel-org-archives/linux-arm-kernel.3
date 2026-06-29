Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B677C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 07:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocU4bbQQvRYUjNRGEheDIX/JjGUc9Z8ZjL6L4LmeVWQ=; b=yyZWaUFt4/d0DLRTIKaw8pMTcq
	P/OOd1bi0pSRrhootynTv7cvSUmCq4/9CACrJHq0MGN77QCafsR4UbPemOcwKQ2gITCBZwdPwA6iG
	TRO8mCk2ASpU2OTli2ix+QPJSrDQGOBRmR8Af0RRg91ZccV5CesYMxz+35kSF2iQyLdyuZQX6ut3G
	6a8NuzYDNiPradghHCULRO+ULTO5NwsuOp+giQaSxVBtfDuEZs1mopgJAqMzx0zE3v6YOll0/zlqI
	f9kEgSqpztTP/wHb/xSZLnBg2ZCCxmo7pAvYc9oXB+Fd2VsZFvI/SFToKif9R8Drg1KCGz0QS6GK5
	tZ1SSceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we69s-0000000DrcL-2S0p;
	Mon, 29 Jun 2026 07:11:56 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we69p-0000000Drbe-3w5T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 07:11:55 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so470271a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 00:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782717113; x=1783321913; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ocU4bbQQvRYUjNRGEheDIX/JjGUc9Z8ZjL6L4LmeVWQ=;
        b=Ax7sKSvkLfhkfQyskBHKTYjKjU0+IflcZDg9XIUyx1neutiECDWoRNESuI4Duya4bK
         JmjYwlbIMTnDPfwnRE3LWrHBPEA1CiB+j5CH4hcmLcfoUjUB29hWbfueND6MBIWaCb3K
         1kgvo9aJqxOcNSWUU8pPTkxr6xdAIRBgCq46sVq+33XMYT3BdzBY8o4/x4RF4sFyBlVJ
         Rms6DagCd28ohrrPF3ozsNEcl00YHMa4+0nQrokryNhtIT5dHV59qvH37TS7IdTsI7Bo
         gndjOagaXyurq4rnewknhXkTstkAKpKkl/m+msPXQ2/tKJjoh6nxT5iOxcAFMwmv9krs
         6uaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782717113; x=1783321913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ocU4bbQQvRYUjNRGEheDIX/JjGUc9Z8ZjL6L4LmeVWQ=;
        b=Wx0L9NzuiSg7hEWlszRv7z9nu1XrPhqGrgdrqhSwwx0tdKFnO67TYzI7C4aAjrjUY+
         tbARZ3D2O4V2eKfAj9/MGxKlWnHgHdHo/zV9wzulhxOV4S2i5bSOCy+fiWZX3erPt4zi
         Q+CDZhcOIHDGUAhVfFqp8/wH4/xe7fvE8/WoHEVRzH6H2605895knOja2GOgj9FMztm0
         N2BO64vRDTjRxLrTiHD+FJrQ+fGFowsrBkjJGC3kXhtHncihqd1BnsbyrJDWqK7sNq3Y
         tN4hVCdu8BmlSZeYj6FYMKhYLuc9mMCSlSM/5WtPAViefdIQVu5g1jdua5zym15bmIQX
         Di1A==
X-Forwarded-Encrypted: i=1; AHgh+RpGV3asvepvSEXE8yyK+MaSqbybmzUgJjjhR9+VP9Tv8S2GYQn3ZW4aL97BJzMDLdOlBcaN0JUee3YZ/Cb6RVO4@lists.infradead.org
X-Gm-Message-State: AOJu0YwphFoyALIxX+e7/Gb4L3ULKcjh3TPMnlE1ObILVbZmG6S5s5sq
	aLgBwMS5Qt33DBvqZIcKQBG2MlyOCEXBU3zgYyq01L+nSFEdnOaCRP5w
X-Gm-Gg: AfdE7cnpG18XEsm4L57r6CTQfoDHAPYcM1rOInmTHyMd/R8g6QoCTJPK3Kmw6H2XbSL
	99IHYON/T50IBwlzLuJwKpfuFz9DrfP3twbIKE4X11eSaFtKjmDwMu3uHe6I+qphtElej6YOhhj
	CXBJToklO2tt/wKUv97VTUjj1fdIiDqq/Mv+8XoOT/PkDGGfdDwKPhMm+nb+pPXXXqEVOgyb65Z
	gs1psn80JMyTfopRNyaLno76mjDlPuj74UFP47jW7m20Fa0H08zGPI15yATa60pNtn17hNvxkr3
	32+sWrrxJ8JDEaiRpNFgI3jR4Fz/okOh0fzL2ShKfA9+ycHTE3iyf03ewZdYy8z8+vg9dWnCv+Z
	tfjOiAhVmWHwenTIsPQiQpGKrysvoDvHJks029X4Fe1Ff5rE277/abtM4bFfR0eCvw4wFqFyEIJ
	EgMNUl6LhvUmmnSmN6S1VbPQN2t4JJO2QitlC337jws3PtRR2eEhluo1ZVN9WIjtVb
X-Received: by 2002:a05:6a00:8005:b0:845:d284:9e14 with SMTP id d2e1a72fcca58-845d284a9e5mr8108752b3a.59.1782717113038;
        Mon, 29 Jun 2026 00:11:53 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845ebe987fcsm2596068b3a.39.2026.06.29.00.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 00:11:52 -0700 (PDT)
Message-ID: <7e96cc1a-eb60-4eeb-937d-64e83bc35279@gmail.com>
Date: Mon, 29 Jun 2026 15:11:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
To: David Lechner <dlechner@baylibre.com>, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nuno.sa@analog.com, andy@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260625110638.38438-1-cwweng.linux@gmail.com>
 <20260625110638.38438-2-cwweng.linux@gmail.com>
 <40485b4e-6585-42a1-9b84-3019328574c5@baylibre.com>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <40485b4e-6585-42a1-9b84-3019328574c5@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_001153_991542_7DEC79EE 
X-CRM114-Status: GOOD (  33.86  )
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

Hi David,

Thanks for the review.

 > Datasheet says there are 4 interrupts.

Yes, the controller has four EOC interrupt outputs, ADINT0 to ADINT3.
The initial driver only uses ADINT0, but the hardware does provide four
interrupt lines.

I will update the binding to allow up to four interrupt entries and
document the order as ADINT0, ADINT1, ADINT2 and ADINT3. The example
will keep a single interrupt entry since that is the only one used by
the initial driver.

 > Should there be an optional vref-supply for the V_REF pin?

Yes, I agree. I will add an optional vref-supply property.

I will also update the driver so that it does not force the external
reference path unconditionally. If vref-supply is present, the driver
will enable it and use it to report the ADC scale. Otherwise, the driver
will use the internal reference path.

 > Should there be a dmas property? Datasheet says it supports PDMA 
transfer.

The hardware does support PDMA, but DMA support is intentionally not
included in this initial upstream version. The initial driver will only
support interrupt-driven direct raw reads, and the MA35D1 PDMA provider
is not upstream yet.

I would prefer to leave dmas/dma-names out of the initial binding and
add them later together with DMA support. Please let me know if you
would prefer optional DMA properties to be described now.

 > I assume 8 is for the internal batter voltage channel? Often, we don't
 > include fixed internal channels like this in the devicetree since they
 > are always the same and don't depend on external wiring.

Correct. Channels 0 to 7 are the external ADC input pins, while channel
8 is the internal VBAT input. I will limit the DT child channel nodes to
external channels 0 to 7.

If VBAT support is added later, it can be exposed by the driver as a
fixed internal channel rather than being described by devicetree.

 > adc.yaml already specifies minItems and maxItems, so we don't need to
 > repeat it.

Since I plan to simplify v2 and drop differential channel support from
the initial submission, I will remove diff-channels from the initial
binding.

Differential input support can be added later once the fixed hardware
pair constraints and signed output handling are implemented in the
driver.

 > This (and reg) are uint32, so don't really need minimum: 0.
 >
 > Also, I assume that 8 is for the internal battery voltage channel,
 > which wouldn't make sense as part of a differential input.

Will fix. The v2 binding will restrict child nodes to external channels
0 to 7 and drop the unnecessary minimum: 0.

Thanks,
Chi-Wen


David Lechner 於 2026/6/28 上午 04:05 寫道:
> On 6/25/26 6:06 AM, Chi-Wen Weng wrote:
>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>
>> Add devicetree binding for the Enhanced ADC controller found on
>> Nuvoton MA35D1 SoCs.
>>
>> The controller has one register region, one interrupt and one functional
>> clock. ADC inputs are described using standard channel child nodes,
>> including optional differential channel pairs.
>>
>> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
>> ---
>>   .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 100 ++++++++++++++++++
>>   1 file changed, 100 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
>> new file mode 100644
>> index 000000000000..ae7ad0f7689a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
>> @@ -0,0 +1,100 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iio/adc/nuvoton,ma35d1-eadc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 Enhanced Analog to Digital Converter
>> +
>> +maintainers:
>> +  - Chi-Wen Weng <cwweng@nuvoton.com>
>> +
>> +description: |
>> +  The Nuvoton MA35D1 Enhanced Analog to Digital Converter (EADC) is a
>> +  12-bit ADC controller integrated in the MA35D1 SoC. Each enabled ADC
>> +  input is described by a child channel node.
>> +
>> +properties:
>> +  compatible:
>> +    const: nuvoton,ma35d1-eadc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
> Datasheet says there are 4 interrupts.
>
>> +
>> +  clocks:
>> +    maxItems: 1
> Should there be an optional vref-supply for the V_REF pin?
>
> Should there be a dmas property? Datasheet says it supports
> PDMA transfer.
>
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +patternProperties:
>> +  '^channel@[0-8]$':
>> +    type: object
>> +    $ref: adc.yaml
>> +    unevaluatedProperties: false
>> +
>> +    properties:
>> +      reg:
>> +        minimum: 0
>> +        maximum: 8
> I assume 8 is for the internal batter voltage channel? Often, we don't
> include fixed internal channels like this in the devicetree since they
> are always the same and don't depend on external wiring.
>
>> +
>> +      diff-channels:
>> +        minItems: 2
>> +        maxItems: 2
> adc.yaml already specifies minItems and maxItems, so we don't need to repeat it.
>
>> +        items:
>> +          minimum: 0
>> +          maximum: 8
> This (and reg) are uint32, so don't really need minimum: 0.
>
> Also, I assume that 8 is for the internal battery voltage channel, which
> wouldn't make sense as part of a differential input.
>
>> +
>> +    required:
>> +      - reg
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - '#address-cells'
>> +  - '#size-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        adc@40430000 {
>> +            compatible = "nuvoton,ma35d1-eadc";
>> +            reg = <0x0 0x40430000 0x0 0x10000>;
>> +            interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&clk EADC_GATE>;
>> +
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            channel@0 {
>> +                reg = <0>;
>> +            };
>> +
>> +            channel@1 {
>> +                reg = <1>;
>> +            };
>> +
>> +            channel@2 {
>> +                reg = <2>;
>> +                diff-channels = <2 3>;
>> +            };
>> +        };
>> +    };
>> +...

