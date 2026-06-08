Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C8BCD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 09:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdqtVwTNX0imLywa7I0ecwdu4Le2YQgpibN80cjQUTg=; b=Rxb+k/HM2oau2eaOIeVQKQN44k
	ehOWa3xhfSiYZkdRKBDzlQgQ7Aw1ZJoinlx1FXtC1+GIJOOQaHQ8gObwlgPdmGdGmSw+5AyFbKvO6
	9v4L7gPFfC/9HxnRlGNcnBPLELtA9haJKTZrqDiGkZSySO4dYlG7eufJaWhEgZXTYFYmNd28swThg
	cp43ml5+I3j2UwzS1rtPm8wBz85Hl+eg37fichbzyi5ONr4OshLgvkcn/0/2d43P2UQI5HLhgY9f4
	g5koTN0LwXJ6bFh21T5AlYw4dR8/OT8dJbYF/WD6vYyPPXQTYnM5fYR/RDib5bOaoD/SNwhYwYiqr
	pFwWBvfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWWe-00000003DAk-28CW;
	Mon, 08 Jun 2026 09:44:08 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWWb-00000003D9z-35zT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 09:44:06 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c85c531d4a9so1578489a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 02:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780911845; x=1781516645; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QdqtVwTNX0imLywa7I0ecwdu4Le2YQgpibN80cjQUTg=;
        b=VqZ8WDX/Yrz3ZubqVcm5y56s+7gessk5kGndy/Q670MsD4tOzb936zRNtYJohH3ZQp
         hDz4MMa0Dje5G5+nwwRSinEZlI1TAr6tbTBR+hm90+GWeV0SzI9pWH7e8q8NNhHpMQog
         DsM7QI1wnES/XWK8eTOVQt3cnCOLSxZ8rOtB1i4I3G6tbC2IJj8IGBYuy+EBtTyl4ulN
         rcN6MWXcTQTZ85uioX7i/af+uT2dtlu+DC9WuoOM5j8i+pHaa0prCoEbuA+VmWhqsyx2
         27WAdJAAzS6ARSbajNn39XdaxqoIcsht1z/zvbJbX8onPYzqCCfpMgNKinxr0TGj8pvl
         wpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780911845; x=1781516645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdqtVwTNX0imLywa7I0ecwdu4Le2YQgpibN80cjQUTg=;
        b=kHziyuUwWjqWpRrIC+7u1cQ+HLZz6TfPNKAjcmqJPxr7hjQ8ydsEZzkW+rtyQLoPOY
         7Ufyp4+VhOA5yiesZyuh6EeidYVhi+SPUOnOeSyHphLbSR+ht/CXlX9aaXTDtwDXgmIU
         wVhLgs+S1UGApourH5fhy1jRR2iff1a15sc5TGg4+dcd7CEdBkfTLnMOS7+W3jJOAX2x
         iHnIPioMfIcUvMxCf0wD5ZPpeOtLj5n/NSUKccPjjrpFlX45qhmzTpbZlTjVNeDuOtbe
         49eFjIBALbTMvsyI9jCrcQnErzK9WtlAw5Uk04w68KT1GgMpMnpLFKHFc2GHstGhG8HB
         tHWA==
X-Forwarded-Encrypted: i=1; AFNElJ9PXy6z3TWqfq4H+uD2vwJmS7CGycHFAyzxyrG4VWCd3kMgdrbx5Bp/mNtLoyISYyogn6NVsg4oU1BHRag9EdFp@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl3P4NgWD+mTXuISO99t0OS4XwgF93bHxr5+qkysf+nuaJELUX
	7lPqpWfQT6daGDMDm6HunVFZqB7aZOgPWdy1a7doAXkhiVFnVS1tICsa
X-Gm-Gg: Acq92OE2J/5dQOee1YW/XGoDsDfGefCPEx5OpOGaEtBB68QrXAbergcLDVSOdpSO2Zt
	Oraw/wGlEt5iAkcavJhlYpUkGxY6ZpLru7jgmOtYEIhwwGwN/dUelHt910Ya9c0L8fXgqz3VY73
	OKjS+KjnYOIivZd/jhSiaLZrS9s3rsyq25LIjIY6P+oyJ+jKtW0DX3/Djz+Ox54L7Svk5XDqTNm
	vAN04bTSJ6D4YIDdeKCfZDEBHBx2LoZH6cLPNkcY7bTMAEaRSC9dkQN+rIIsKlknAFcHGC5570e
	qJogP3WcY2gVIimhR+mV1HP3WCu1+9krxgIgMcPMvodRB3KyeE/h0OIhuKGkmNNSQaDRdzip3Ht
	2UJhu7oQhxSygwD5X++ef2QHFTFCgl6xrkjXo6jCMo3EX/0y8fNu+REoWF5HzFk5+xriDgkDKpd
	Q4yjL4BtTi8oSs3rTQZP6wVszu/OeKXYQOp95sYJg4V//l8r/UZQcBsZJEP/9WqD1FBAcDqi9O1
	tGrGWjk6wJkIG4=
X-Received: by 2002:a05:6a21:700e:b0:39b:f026:6f8d with SMTP id adf61e73a8af0-3b4cd09b5a1mr17772625637.43.1780911844599;
        Mon, 08 Jun 2026 02:44:04 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0bdb98sm14220666a12.31.2026.06.08.02.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:44:04 -0700 (PDT)
Message-ID: <fb9c51bb-5e17-4e62-bfab-efc648cff4d6@gmail.com>
Date: Mon, 8 Jun 2026 17:44:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: display: verisilicon,dc: generalize
 for single-output variants
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: zhengxingda@iscas.ac.cn, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260608023237.305036-1-a0987203069@gmail.com>
 <20260608023237.305036-2-a0987203069@gmail.com>
 <20260608-emotional-rapid-woodlouse-61f7b9@quoll>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260608-emotional-rapid-woodlouse-61f7b9@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_024405_790692_1A3EE20E 
X-CRM114-Status: GOOD (  22.43  )
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


On 6/8/2026 4:00 PM, Krzysztof Kozlowski wrote:
> On Mon, Jun 08, 2026 at 10:32:33AM +0800, Joey Lu wrote:
>> The existing schema hard-codes the five-clock/three-reset/dual-port
>> topology of the DC8200 IP block, preventing reuse for single-output
>> variants such as the Verisilicon DCUltraLite used in the Nuvoton MA35D1
>> SoC.
>>
>> Rework the schema so that variant-specific constraints are expressed via
>> allOf/if blocks:
>>
>> - Add nuvoton,ma35d1-dcu to the SoC-specific compatible enum.  The
>>    generic verisilicon,dc fallback remains the driver-binding string.
>> - Relax the top-level clocks/resets definitions to minItems ranges so
>>    the base schema accepts both variants.
>> - Keep ports in the global required list and keep additionalProperties
>>    tightened to unevaluatedProperties.
>> - Add an allOf/if block for thead,th1520-dc8200: five-clock (core, axi,
>>    ahb, pix0, pix1), three-reset (core, axi, ahb).
>> - Add an allOf/if block for nuvoton,ma35d1-dcu: two-clock (core, pix0),
>>    one-reset (core).
>> - Fix a stray space in the port@0 description.
>> - Add a DT example for the Nuvoton MA35D1 DCU Lite using ports/port@0.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/display/verisilicon,dc.yaml      | 103 +++++++++++++++---
>>   1 file changed, 90 insertions(+), 13 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> index 9dc35ab973f2..db0260d874c5 100644
>> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> @@ -17,7 +17,8 @@ properties:
>>       items:
>>         - enum:
>>             - thead,th1520-dc8200
>> -      - const: verisilicon,dc # DC IPs have discoverable ID/revision registers
>> +          - nuvoton,ma35d1-dcu
>> +      - const: verisilicon,dc  # DC IPs have discoverable ID/revision registers
> Why do you need to change indentation? Why introducing irrelevant
> changes to the diff?
The extra space was introduced to satisfy `yamllint`'s "too few spaces 
before comment" warning, which requires two spaces before an inline `#`. 
Since this is an unrelated change that pollutes the diff, I will revert 
it to the original single-space form.
>>   
>>     reg:
>>       maxItems: 1
>> @@ -26,6 +27,7 @@ properties:
>>       maxItems: 1
>>   
>>     clocks:
>> +    minItems: 2
>>       items:
>>         - description: DC Core clock
>>         - description: DMA AXI bus clock
> That's not true anymore. In such case the list should also be defined
> per variant and here only min/maxItems.
>
Understood. I will remove the `items:` description list from the 
top-level `clocks:` and keep only `minItems`/`maxItems`. The per-variant 
items descriptions will be moved into the allOf/if blocks.
>> @@ -34,24 +36,19 @@ properties:
>>         - description: Pixel clock of output 1
>>   
>>     clock-names:
>> -    items:
>> -      - const: core
>> -      - const: axi
>> -      - const: ahb
>> -      - const: pix0
>> -      - const: pix1
>> +    minItems: 2
>> +    maxItems: 5
>>   
>>     resets:
>> +    minItems: 1
>>       items:
>>         - description: DC Core reset
>>         - description: DMA AXI bus reset
>>         - description: Configuration AHB bus reset
>>   
>>     reset-names:
>> -    items:
>> -      - const: core
>> -      - const: axi
>> -      - const: ahb
> This stays, with minItems. Variants only need min/maxItems
>
Understood. I will restore the top-level `clock-names` and `reset-names` 
items lists and add `minItems` to each. The per-variant allOf blocks 
will only carry `minItems`/`maxItems`.
>
>> +    minItems: 1
>> +    maxItems: 3
>>   
>>     ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>> @@ -59,7 +56,7 @@ properties:
>>       properties:
>>         port@0:
>>           $ref: /schemas/graph.yaml#/properties/port
>> -        description: The first output channel , endpoint 0 should be
>> +        description: The first output channel, endpoint 0 should be
>>             used for DPI format output and endpoint 1 should be used
>>             for DP format output.
>>   
>> @@ -77,7 +74,60 @@ required:
>>     - clock-names
>>     - ports
>>   
>> -additionalProperties: false
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: thead,th1520-dc8200
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 5
>> +          maxItems: 5
>> +
>> +        clock-names:
>> +          items:
>> +            - const: core
>> +            - const: axi
>> +            - const: ahb
>> +            - const: pix0
>> +            - const: pix1
>> +
>> +        resets:
>> +          minItems: 3
>> +          maxItems: 3
>> +
>> +        reset-names:
> minItems: 3
Understood. I will add `minItems: 3` to `reset-names` in the 
thead,th1520-dc8200 block.
>> +          items:
>> +            - const: core
>> +            - const: axi
>> +            - const: ahb
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: nuvoton,ma35d1-dcu
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 2
>> +          maxItems: 2
>> +
>> +        clock-names:
>> +          items:
>> +            - const: core
>> +            - const: pix0
>> +
>> +        resets:
>> +          maxItems: 1
>> +
>> +        reset-names:
> maxItems: 1
Understood. I will add `maxItems: 1` to `reset-names` in the nuvoton block.
>> +          items:
>> +            - const: core
>> +
>> +unevaluatedProperties: false
> Stop making random changes to the binding.
>
> Best regards,
> Krzysztof

Understood. I will revert to `additionalProperties: false` as in the 
original binding.

Many thanks!


