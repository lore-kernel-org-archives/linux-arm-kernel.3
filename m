Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4ADC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omopOdpKTyCcb7PSO2EkN5aJ0TMqkgpva2n1TsO3dC8=; b=iKq4Z/62ZA1gCx1KpXz+xYWhLD
	3KayRNYsNZX9F3ZrqsKtGutpJqGVqhbPpx2IXl3ls1aRcXqH5ZUAXBZIzzZxADPIKw028tiR7DGK9
	I6qaoDcx//FdAsNguSy1KEPbpaJwqbpL6WN/AKpGkY2AA/UOBLXKFizwzFMRjk0VLdseYPmjG96HC
	+lV00KwscP2xDyuWqHqoghcfByVyuvKdUhL61Eixckx0y0vKuDixLFeQqttOCySQeYZJ5xpbLl94S
	3Xy4SeCNPUPW7eIe6hyLYL+GtMuAha5s6hxOgGz2fYAjAfV97E7fOCQi34D1FPSc5tH6oSBZqUU/M
	8zw8fOzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9Q8-0000000EM8R-1XjX;
	Mon, 29 Jun 2026 10:40:56 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9Q5-0000000EM7a-1JOF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:40:54 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-845c65e0a10so1509319b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 03:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782729652; x=1783334452; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=omopOdpKTyCcb7PSO2EkN5aJ0TMqkgpva2n1TsO3dC8=;
        b=X+89AEt3LHK8kbju2eos2yDZuJzlWwtPrIEXVDuVKLckG+UybBHAXbrAqtRIXcHw34
         febNY/9Lk2252i0g/eBS5n2coE8owGzYUzqzDdbMo+tJOw3H+3/wSDWmLl4R54v5KnkR
         ds4Xi/VahXlpomTOHS3TjJDlRzagBBzl54N7N68xpcfbPmgTQWBqK1HCk25lgphGkgiQ
         MMuignePc/AFxvqOVU00NK1W160oW5TBWITj61rGVnGzxiCPTz7VwEdRsQ4gW7xqriq8
         e7bmGsnU85SgM0Mm2fq7V50gL0JcRU3mOIsMDBHQcvOfL+AIK5ZH+eBkNU2mEo9ezaOM
         r8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729652; x=1783334452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omopOdpKTyCcb7PSO2EkN5aJ0TMqkgpva2n1TsO3dC8=;
        b=L93qzYp0H6iNw8gFRopK0W+VgxGUaet9DfYXXPzfoOtlhtrTyH6bM3rnDp2rfvMJdP
         VnTF0ZLMF5hnyATiBLHuCqcN2SF14XLkemsLWGrKb3/iat7y0gmErGNlBffKwteohLst
         wdSh+jPBqQB0YlZHXxaiqh2oo50jb8JbrNRyk1D4UnL9VYt3uB0kTVQesbwd4n6+Sp79
         sYxyunBp5KxKQIgSmsyp86HLICdBiVVvaZFh4FGicVUVSXHF3JaLpEsHKD76IVUhptkh
         OSaTfiYk1qLd/hb8rwL7nfSSCdAfwZYB5wUWJi53k1jBBl0jHCxQ4UUv1M/bk8ZHeLCh
         BxGA==
X-Forwarded-Encrypted: i=1; AHgh+Rq113e0DT/XDU+Y4VIlsODJQMX7m7XPk8buWl6sctgyMrrRNZmOXUzPrBvMBCY5LAE+AngUYg9pt92CXL69O3RO@lists.infradead.org
X-Gm-Message-State: AOJu0YwNrAJh3eqgh+e6jPduw8dF4/VHWXbeQkVXxuiPp9btgUmA1B2w
	pVA8yGJJ/lu1zINFRV8Mo0HvgzhFU8qwEblUe/u5VcJHmyvQozvtMRPm
X-Gm-Gg: AfdE7cnZy9Ey6/Rri49OrhLBIjRCJDa2qtQfIeJ6rGNQIQ5oKZopg9946ySLxThXq/W
	NASdNyEaazliYV/UZp6jAQH+wkVCJHAywHE0YOqfz9aRjoCbhtwCZZzi3K2ZwHPSmpiZ4XeX4CQ
	pAVq/JJ1uKqV2OvP7zJheGQVwAgVR2tn4Qs1bUn/qoeVl570TCorU7sp3xhw4PeQu4uh6hmQCsl
	ZJ7NvXEBLbxsgJQ2j31yz09ATdnCRecQNuAKC13nTW53BeNyIm1d4YiF3Quef55UlQ5bWHHCg3w
	QQ59psjkhDl7/FgDGdPKkYD0CleDyE5kmbQy1LuxBIuM/7iURSLzqnnJaXaREjJrz8CzW8vR5/4
	YcZgqAbCBB7XfuncDpPirZRitpYbh1ur9JdJG0Z8OMYlx5Q/iVn9FRZ6kyd/gXn1PoHpQadut7w
	1Kclbl6Y8KQXG+h8EXne4t1X41OkeZxZBGfyNNvjmTUpvIJQ4/4W9ECyNvFHVMM8xo3g==
X-Received: by 2002:a05:6a00:a253:b0:846:2f3d:6275 with SMTP id d2e1a72fcca58-8462f3d7595mr4441676b3a.58.1782729652146;
        Mon, 29 Jun 2026 03:40:52 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845cdc2ff53sm5565548b3a.7.2026.06.29.03.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:40:51 -0700 (PDT)
Message-ID: <24de6a00-ba4e-455b-baa7-479d1cc2edf3@gmail.com>
Date: Mon, 29 Jun 2026 18:40:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend
 for dual-port OTG support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260625023958.569299-1-a0987203069@gmail.com>
 <20260625023958.569299-3-a0987203069@gmail.com>
 <20260625-sexy-black-tarantula-4031a6@quoll>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260625-sexy-black-tarantula-4031a6@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_034053_358251_33D7BFBD 
X-CRM114-Status: GOOD (  26.84  )
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


On 6/25/2026 3:58 PM, Krzysztof Kozlowski wrote:
> On Thu, Jun 25, 2026 at 10:39:56AM +0800, Joey Lu wrote:
>>   properties:
>>     compatible:
>>       enum:
>>         - nuvoton,ma35d1-usb2-phy
>>   
>> +  reg:
>> +    maxItems: 1
>> +
>>     "#phy-cells":
>> -    const: 0
>> +    const: 1
>> +    description:
>> +      The single cell selects the PHY port. 0 selects the OTG port (USB0,
>> +      shared with DWC2 gadget controller) and 1 selects the host-only port
>> +      (USB1).
>>   
>> -  clocks:
>> -    maxItems: 1
> This is odd, considering that parent does not have clocks. So explain me
> this:
> 1. USB PHY needed clocks.
> 2. You extend USB PHY to cover second part.
> 3. That extension for second part means that clocks are not needed.
> Really, how? How is it possible in hardware?
The hardware has two independent clock domains:

   - The PHY analog block takes the 24 MHz HXT as its reference, wired
     directly to the PHY's internal PLL, which derives the required 
operating
     frequencies internally. This reference path is entirely outside the SoC
     software clock tree; no software-gatable clock gate needs to be enabled
     for the PHY to power up and lock its PLL. The only software control the
     PHY driver exercises is toggling each PHY's Power-On Reset (POR) bit,
     which resides in the SYS register block. The driver accesses this via
     the parent regmap

   - `HUSBH0_GATE` / `HUSBH1_GATE` / `USBD_GATE` are AHB/APB bus interface
     clocks for the host and gadget (EHCI, OHCI, DWC2). They gate
     the register-access path between the CPU and each controller, not 
the PHY
     analog circuitry itself.

The original single-port driver enabled `HUSBH0_GATE` as if it belonged 
to the
PHY, but that gate is actually owned by EHCI0/OHCI0 and is already 
managed by
those controller drivers through their own `clocks` DTS bindings. The PHY
driver was redundantly enabling the same gate.

When extending the driver to cover PHY1, the same pattern held: EHCI1/OHCI1
manage `HUSBH1_GATE` themselves. There is no clock that belongs 
exclusively to
the PHY, so `clocks` will be dropped from the PHY binding entirely.
>> +  nuvoton,rcalcode:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 2
> You should require two values. I understand that any PHY is optional,
> thus you skip the entry, so how would you provide value for PHY1 only?
`nuvoton,rcalcode` will be changed to require exactly two values
(`minItems: 2, maxItems: 2`), one for PHY0 and one for PHY1 respectively.
The property will remain optional overall; when absent, each port 
retains its
power-on default value loaded at hardware initialisation. When present, both
entries must be supplied.
>> +    items:
>> +      minimum: 0
>> +      maximum: 15
>> +    description:
>> +      Resistor calibration trim codes for PHY0 and PHY1 respectively.
>> +      Each 4-bit value is written to the RCALCODE field in USBPMISCR and
>> +      adjusts the PHY's internal termination resistance. Both entries are
>> +      optional; when absent the hardware reset default is used.
>>   
>> -  nuvoton,sys:
>> -    $ref: /schemas/types.yaml#/definitions/phandle
>> +  nuvoton,oc-active-high:
>> +    type: boolean
>>       description:
>> -      phandle to syscon for checking the PHY clock status.
>> +      When present, the over-current detect input from the VBUS power switch
>> +      is treated as active-high. The default (property absent) is active-low.
>> +      This setting is shared by both USB host ports.
>>   
>>   required:
>>     - compatible
>> +  - reg
> That's ABI break which was not explained in the commit msg - neither
> specifying impact nor actually providing reasons why you break ABI.
>
> And honestly, you have no resources here except the address, so now it
> is clear that this should be folded into parent. See DTS101 talk slides.
The commit message will be updated to explicitly acknowledge the ABI break:
existing DTS files that contain a standalone `usb-phy` node without a `reg`
property will fail dt-schema validation after this change. The impact is
limited to the MA35D1 SoC; no upstream DTS for this SoC existed before this
patch series, so no in-tree board files are broken. The break is intentional
and justified: the PHY register block is physically contained within the 
syscon
MMIO range, and modelling it as a child of the syscon with a standard `reg`
property correctly reflects the hardware topology and follows the convention
established by similar sub-blocks in other SoCs.
>>     - "#phy-cells"
>> -  - clocks
>> -  - nuvoton,sys
>>   
>>   additionalProperties: false
>>   
>>   examples:
>>     - |
>> -    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    system-management@40460000 {
>> +        compatible = "nuvoton,ma35d1-reset", "syscon", "simple-mfd";
>> +        reg = <0x40460000 0x200>;
>> +        #reset-cells = <1>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
> Drop. Keep only child node and make parent binding example complete.
The example in `nuvoton,ma35d1-usb2-phy.yaml` will be changed to show only
the `usb-phy@60` child node, without wrapping it in the parent node.
The full parent + child example will be moved to 
`nuvoton,ma35d1-reset.yaml`.

Thanks for review.
>>   
>> -    usb_phy: usb-phy {
>> -        compatible = "nuvoton,ma35d1-usb2-phy";
>> -        clocks = <&clk USBD_GATE>;
>> -        nuvoton,sys = <&sys>;
>> -        #phy-cells = <0>;
>> +        usb-phy@60 {
>> +            compatible = "nuvoton,ma35d1-usb2-phy";
>> +            reg = <0x60 0x14>;
>> +            #phy-cells = <1>;
>> +        };
>>       };
>> -- 
>> 2.43.0
>>

