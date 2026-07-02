Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5582FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 01:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3jSeMZN0e9RiTr23Xi2KHpV4fFpgmT05xW1Ks8KJnA=; b=tiD0vxJFX4F8hsHThVruZSoZ6P
	Seft4LQAS7Y4zA+hclAUTGaYLD6fh4l1ZMKvbPGotrCsNxEu/9fJE4QfQYk61iJDvmJaL8YDTADiX
	TurKaCKBDK0IGhVWC2pgP4dTOId09xDglAH03qGEPT+I1FIpgnMCPphmOW27f9LWCgCgrEhyN9mPk
	/W06JAx8/Mhqfzqd11ELMWUDd+kKCQ3OM8KlEXxT+ZJLMDe0T5s/Kt6YUeVdqqmrpeyYTfMt37s6J
	/NND71PfYi5by8DJsAlNyyQ5GjmCj0OoaprZmLus3vbWVDN66TcwjhGZt6ooNQ0rv946Zig/79QVZ
	++2Y6v1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf6Yv-00000003NTx-3uIU;
	Thu, 02 Jul 2026 01:49:57 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf6Yt-00000003NTB-1bfa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 01:49:56 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-37fc02e660bso884662a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 18:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782956994; x=1783561794; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3jSeMZN0e9RiTr23Xi2KHpV4fFpgmT05xW1Ks8KJnA=;
        b=bODTsj1OoFvfDAqZhhtD3NL/6suxv4f67m+NfJZ2nU8IA35ttW827f+FyyanfnF9a7
         oSwCTqt4maPiDDvdZPuIHXzqRnsvcos5fm8lPJm0J9kymkYKaWwBh9O2ol11U7ESGSNF
         wTF5O6Hkw2ZMcwfCwsQPadUpyBodyzWJq6Oxks3tot8QdRBbbqa54eQqHvKQ2lbjrzkT
         Rg+gk8YHbUZ7FAy5Rr+ZbRVYJP0rqyYILJYLNxIDlAP9HpJsnv03cA6cohhZs5SYVRJf
         6sSmW8WnToChRtW1UmG7Alpw+/tDz+O0mM+BKSc0fK8C0+xNi2qkOYuG0kRgj8zVg5Yf
         DedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782956994; x=1783561794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3jSeMZN0e9RiTr23Xi2KHpV4fFpgmT05xW1Ks8KJnA=;
        b=GuE5UIqRRUM8phIfxjuLUeeHqCuHNk6BGk0nLKfz4DHUv2zAVwojvalUGA4b9PNYDN
         L+vJk2VUajoXNGQLM9uq+dy4+eR7N8bPB2T3tNdQUYe5fKFP/D6BNZeox2jyWWZ2PrOt
         TOhlfBLXdEa2H3YUhRVywK7GvHkA3eyAutDFWxzkayYs6585+UOUYiDMc1aorxiolsWx
         MLcFiranvE4QZNPUaJht3YKgQlYZt141A77/OHEFnt3D4sLfkmSml/OenB+IMEdWPHK1
         msmTGqSEkTvbqRKOqVQb8UI2ssnj79wPq7+xcxMEBV+kc8zJDrmCe87y4UvTKOrYmKwt
         b1tw==
X-Forwarded-Encrypted: i=1; AHgh+RrmVpQwyJk9/V6iUBNoumf46kFfNOMjaWede6OQXFUh2djqTkMkVT8RScNGxDk/Zw5eFfyl5zK8vK0FykVDmQlc@lists.infradead.org
X-Gm-Message-State: AOJu0YzlRLZoNoy+0YelgzsJjxcAA47FQlQTvUQ2T4KBkW6MUAlizfYH
	b9ydfRClgOxGA4aJmombQUGvNt24zPeaP8Q5efwK/nWy8s2aUiMFiOtZ
X-Gm-Gg: AfdE7cmoq3xdgUTcNWfeFI34/wMxWhl/Bo1qjlL4KborheY0492ndhTXjhp5zwFu8Wo
	3hJAuEO/Kf8VXp5Mn7McmOZbA6y2iAu/lkilxgRgLJRvPVAmjuIYhp3hRnQu/uRpV1RV3ptKiBU
	h16gxORm0BrV07Ohh6FiVnW/9AsSdVAr/FiYgZqLmVIYRt0awAlv9mOkflGaOCm2gGv4DUH7gbi
	VZf95akTw5ZmvKI2HDbF/mn5eLfBsRVmdmtbAma5Tae9AsL8ShwB7Fj2FH1Jm+wPRGqlaSVr0Cx
	6tn2JM2j7FGexVnTcfxg29lq7hlV+GiQYwPWt1PpNzWU9o18xYwcWp74SnKs2ZvYT4TA/3KQL3+
	As11quBxvB7xt14gS44QBYHQS7wvkzJ2azgdlM63onNTSlOaHFsUmvSsbtHq1wUKpcnvWXbi/vd
	n9r+FwkpSgyn6jOuG+NyYhv+88uXySMJY5+qz3YQHAQduA/tvI3fin+3Indpzum75iXQ==
X-Received: by 2002:a17:90b:3b52:b0:37f:9ce3:ca93 with SMTP id 98e67ed59e1d1-380aa1d7714mr4632989a91.28.1782956993855;
        Wed, 01 Jul 2026 18:49:53 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e1631aadsm130307a91.4.2026.07.01.18.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 18:49:53 -0700 (PDT)
Message-ID: <b002cf5f-4e1a-4181-b9c3-d4f3870bffe8@gmail.com>
Date: Thu, 2 Jul 2026 09:49:46 +0800
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
 <24de6a00-ba4e-455b-baa7-479d1cc2edf3@gmail.com>
 <0f5a408b-5c55-4cd2-831a-49316c9912c9@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <0f5a408b-5c55-4cd2-831a-49316c9912c9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_184955_434016_1D0AC1D7 
X-CRM114-Status: GOOD (  31.55  )
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


On 6/30/2026 2:16 PM, Krzysztof Kozlowski wrote:
> On 29/06/2026 12:40, Joey Lu wrote:
>> On 6/25/2026 3:58 PM, Krzysztof Kozlowski wrote:
>>> On Thu, Jun 25, 2026 at 10:39:56AM +0800, Joey Lu wrote:
>>>>    properties:
>>>>      compatible:
>>>>        enum:
>>>>          - nuvoton,ma35d1-usb2-phy
>>>>    
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>>      "#phy-cells":
>>>> -    const: 0
>>>> +    const: 1
>>>> +    description:
>>>> +      The single cell selects the PHY port. 0 selects the OTG port (USB0,
>>>> +      shared with DWC2 gadget controller) and 1 selects the host-only port
>>>> +      (USB1).
>>>>    
>>>> -  clocks:
>>>> -    maxItems: 1
>>> This is odd, considering that parent does not have clocks. So explain me
>>> this:
>>> 1. USB PHY needed clocks.
>>> 2. You extend USB PHY to cover second part.
>>> 3. That extension for second part means that clocks are not needed.
>>> Really, how? How is it possible in hardware?
>> The hardware has two independent clock domains:
>>
>>     - The PHY analog block takes the 24 MHz HXT as its reference, wired
>>       directly to the PHY's internal PLL, which derives the required
>> operating
>>       frequencies internally. This reference path is entirely outside the SoC
>>       software clock tree; no software-gatable clock gate needs to be enabled
>>       for the PHY to power up and lock its PLL. The only software control the
>>       PHY driver exercises is toggling each PHY's Power-On Reset (POR) bit,
>>       which resides in the SYS register block. The driver accesses this via
>>       the parent regmap
>>
>>     - `HUSBH0_GATE` / `HUSBH1_GATE` / `USBD_GATE` are AHB/APB bus interface
>>       clocks for the host and gadget (EHCI, OHCI, DWC2). They gate
>>       the register-access path between the CPU and each controller, not
>> the PHY
>>       analog circuitry itself.
>>
>> The original single-port driver enabled `HUSBH0_GATE` as if it belonged
>> to the
>> PHY, but that gate is actually owned by EHCI0/OHCI0 and is already
>> managed by
>> those controller drivers through their own `clocks` DTS bindings. The PHY
>> driver was redundantly enabling the same gate.
>>
>> When extending the driver to cover PHY1, the same pattern held: EHCI1/OHCI1
>> manage `HUSBH1_GATE` themselves. There is no clock that belongs
>> exclusively to
>> the PHY, so `clocks` will be dropped from the PHY binding entirely.
> What driver has to do with it?
>
> You did not answer the question. How adding missing OTG to existing
> device causes that hardware to lose a clock? How is it possible?
>
To answer the hardware question directly: adding OTG support does not
cause the hardware to lose a clock. The hardware clock topology is
identical in both the single-port and dual-port cases.

The PHY analog block derives its reference from the 24 MHz HXT crystal
through an always-on path via the PHY's internal PLL. No software-gated
clock in the kernel clock tree sits in this path. The PHY's power-on and
reset state is managed through USBPMISCR in the SYS register block, which
the driver accesses via the nuvoton,sys regmap outside the clock tree.

`HUSBH0_GATE` gates the AHB bus interface to the EHCI0/OHCI0 host
controllers that share PHY0. This relationship is the same in both the
single-port and dual-port configurations.
>>>> +  nuvoton,rcalcode:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +    minItems: 1
>>>> +    maxItems: 2
>>> You should require two values. I understand that any PHY is optional,
>>> thus you skip the entry, so how would you provide value for PHY1 only?
>> `nuvoton,rcalcode` will be changed to require exactly two values
>> (`minItems: 2, maxItems: 2`), one for PHY0 and one for PHY1 respectively.
>> The property will remain optional overall; when absent, each port
>> retains its
>> power-on default value loaded at hardware initialisation. When present, both
>> entries must be supplied.
> So are you going to implement it or not?
>
Yes, I will implement this change in the next version of the patchset.
>>>> +    items:
>>>> +      minimum: 0
>>>> +      maximum: 15
>>>> +    description:
>>>> +      Resistor calibration trim codes for PHY0 and PHY1 respectively.
>>>> +      Each 4-bit value is written to the RCALCODE field in USBPMISCR and
>>>> +      adjusts the PHY's internal termination resistance. Both entries are
>>>> +      optional; when absent the hardware reset default is used.
>>>>    
>>>> -  nuvoton,sys:
>>>> -    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +  nuvoton,oc-active-high:
>>>> +    type: boolean
>>>>        description:
>>>> -      phandle to syscon for checking the PHY clock status.
>>>> +      When present, the over-current detect input from the VBUS power switch
>>>> +      is treated as active-high. The default (property absent) is active-low.
>>>> +      This setting is shared by both USB host ports.
>>>>    
>>>>    required:
>>>>      - compatible
>>>> +  - reg
>>> That's ABI break which was not explained in the commit msg - neither
>>> specifying impact nor actually providing reasons why you break ABI.
>>>
>>> And honestly, you have no resources here except the address, so now it
>>> is clear that this should be folded into parent. See DTS101 talk slides.
>> The commit message will be updated to explicitly acknowledge the ABI break:
>> existing DTS files that contain a standalone `usb-phy` node without a `reg`
>> property will fail dt-schema validation after this change. The impact is
>> limited to the MA35D1 SoC; no upstream DTS for this SoC existed before this
>> patch series, so no in-tree board files are broken. The break is intentional
> But all of out of tree users are broken.
On reflection, the approach is being revised to eliminate the ABI break 
entirely.
The next revision will keep the existing `nuvoton,ma35d1-usb2-phy` binding
intact with all its current required properties (`compatible`, `clocks`,
`nuvoton,sys`, `#phy-cells`). New OTG and dual-port capability will be
expressed as strictly optional backward-compatible additions:

- `#phy-cells` updated from `const: 0` to `enum: [0, 1]`. Existing DTS
   with `#phy-cells = <0>` continues to validate and behave as before.
   New DTS opting into dual-port uses `#phy-cells = <1>`.
- `nuvoton,rcalcode`: optional, exactly two values when present.
- `nuvoton,oc-active-high`: optional boolean.
>
> Best regards,
> Krzysztof

