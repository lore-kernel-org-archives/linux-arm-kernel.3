Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB9CD3E787
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 10:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uC1tGDKghOkea1zNnMHJyn2LWZSucub90BQiLOEDDk=; b=nxd7RtAZQCoEnXxx7U7y4QotVY
	KyQZf5/YnUwzRC/ncTN1hg+aEYaGpQ/9Q0TIWCr3jBeJNsOMbLzg2xnJxHTjIe2kHn3wrOfGyaSqI
	PpT92lH2S6PlZ401ZcByXvEHo+HwI4H35L6WLZIcV7ATnygr8OGtZFonT5KPE7wKE5rHyytGv9Jkz
	iZYwj1s0F4i7AFMVlD+9XFyrOScIRGlAqkayoa3bIq4E5RoWn3KPEIy4U6bQDtNUTmFwtG5RRt/ol
	T9tY/I6cU9kCxI7xwmHWPXmzxrZ5o0ti68I+ptwi6ky4GHefgOVv1GZlPf5Qs3UuobHl6o9pSE9lX
	zIZX+5mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zgz-00000006SWG-1Dj3;
	Thu, 07 Nov 2024 10:24:45 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zYU-00000006QuM-3Yeb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 10:16:00 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20caea61132so6816915ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 02:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730974558; x=1731579358; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6uC1tGDKghOkea1zNnMHJyn2LWZSucub90BQiLOEDDk=;
        b=VJFVdOms2sn9Ca4cj17aEwBZL+vs7HMLB1MYiOtutNksLnKP9f6BwRdze0QaCe5w3I
         77HIbYFR6UDq9fyrmNmIa8P5ZSEf6e3KLa3EcaRPTqghtROz9MjeEVgvmynBYo1M+Uzv
         C/gQFcxrYM+Q6pqtlTVOAxHkP+NT1WEyCYmc9XZKN2tGlcQLLn4Ks3RmfK6fIqAKcLYn
         RDUp0JFbY8B+4/lEgx/Sk6G7vmg5wuKL0gsIhakp701g9LZsPhUt26aI4s9w1EiPGba+
         4LXmGwQfCodjSaFnre8h1db3TaO2RmqrILuuV2+Y+Z9Bs4FKzPFVGNA3I1KpvMVNTU+B
         fPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730974558; x=1731579358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6uC1tGDKghOkea1zNnMHJyn2LWZSucub90BQiLOEDDk=;
        b=KHQ3/d9/iXAhn7clEWBSnrTS9U9DLfXjj1+ZmV8n3JyquBwHVtlCrJQQWemZvIpDEt
         T6BoqtFYi0TUgPckquOSehHcIhnHYxRAi/QKb5qI8B4U2c9aGAYWiTfpL3ieCIrmErnd
         iWXHt8Bm95Se1Yq0uZD2zz20xw0xStWPRy0tjOxi+EuD7asu8wMc1RDVucdxtq90EBCb
         +FmEwsz4olZL71G7o2ZDAdZ2ywd4peFc50kBOzRVP6mYyU+6Oa+kKYmITmI6KR6QxvoU
         iFsOBnaOzb6H4QyLy9k0M4aQa7pSyxO464xiM+4fVR9FYBDB/9lvpuwSUWGyipbNowTY
         DoXA==
X-Forwarded-Encrypted: i=1; AJvYcCWvZvpxJ3c8ojWOtwpvOP9KbhJpUVnt6jJuGZle+FoH1vbRMyZd5xX6LvchdzL4o8+UrzmdkMbAecZ1YZhVVHY5@lists.infradead.org
X-Gm-Message-State: AOJu0YxOHixuh8Vlvch5t/o9gjrvCKTDIBZ+b4K51asuVpjGQdjmUxlM
	2q4hO+eETfxtRnkxSdbQzPZ+eo07EgwUGIt/G2rw1VB9U7BoDnjT
X-Google-Smtp-Source: AGHT+IG072GIpekpia0RPF6UHV7Q1vjZLLM17qv655ofL8si24CR7LuYWccsfVgbbHuGdYv/1tSAPA==
X-Received: by 2002:a17:902:9009:b0:20c:968e:4dcd with SMTP id d9443c01a7336-2111aec8494mr240923005ad.7.1730974557542;
        Thu, 07 Nov 2024 02:15:57 -0800 (PST)
Received: from [192.168.0.104] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177ddc940sm8817035ad.58.2024.11.07.02.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 02:15:57 -0800 (PST)
Message-ID: <7c2f6af3-5686-452a-8d8a-191899b3d225@gmail.com>
Date: Thu, 7 Nov 2024 18:15:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton
 MA35 family GMAC
To: Conor Dooley <conor@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-2-a0987203069@gmail.com>
 <20241106-bloated-ranch-be94506d360c@spud>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20241106-bloated-ranch-be94506d360c@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_021558_920664_D63A52B2 
X-CRM114-Status: GOOD (  27.29  )
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

Dear Conor,

Thank you for your reply.

Conor Dooley 於 11/6/2024 11:44 PM 寫道:
> On Wed, Nov 06, 2024 at 07:19:28PM +0800, Joey Lu wrote:
>> Create initial schema for Nuvoton MA35 family Gigabit MAC.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/net/nuvoton,ma35xx-dwmac.yaml    | 163 ++++++++++++++++++
>>   1 file changed, 163 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35xx-dwmac.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35xx-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35xx-dwmac.yaml
>> new file mode 100644
>> index 000000000000..f4d24ca872b2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/nuvoton,ma35xx-dwmac.yaml
>> @@ -0,0 +1,163 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/nuvoton,ma35xx-dwmac.yaml#
> The filename needs to match the compatible.
I will fix it.
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton DWMAC glue layer controller
>> +
>> +maintainers:
>> +  - Joey Lu <yclu4@nuvoton.com>
>> +
>> +description:
>> +  Nuvoton 10/100/1000Mbps Gigabit Ethernet MAC Controller is based on
>> +  Synopsys DesignWare MAC (version 3.73a).
>> +
>> +# We need a select here so we don't match all nodes with 'snps,dwmac'
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - nuvoton,ma35d1-dwmac
>> +  required:
>> +    - compatible
>> +
>> +allOf:
>> +  - $ref: snps,dwmac.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    - items:
>> +        - enum:
>> +            - nuvoton,ma35d1-dwmac
>> +        - const: snps,dwmac-3.70a
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 2
>> +    items:
>> +      - description: MAC clock
>> +      - description: PTP clock
>> +
>> +  clock-names:
>> +    minItems: 2
>> +    contains:
>> +      - enum:
>> +          - stmmaceth
>> +          - ptp_ref
> This can just be an items list like interrupt-names, since the clocks
> property has a fixed order.
I will fix it.
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: macirq
> This name carries no information, this is an interrupt for a mac after
> all. You don't need a name since you only have one interrupt.
This interrupt name is an argument required by the stmmac driver to 
obtain interrupt information.
>> +  nuvoton,sys:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: phandle to access GCR (Global Control Register) registers.
> Why do you need a phandle to this? You appear to have multiple dwmacs on
> your device if the example is anything to go by, how come you don't need
> to access different portions of this depending on which dwmac instance
> you are?
On our platform, a system register is required to specify the TX/RX 
clock path delay control, switch modes between RMII and RGMII, and 
configure other related settings.
>> +  resets:
>> +    maxItems: 1
>> +
>> +  reset-names:
>> +    items:
>> +      - const: stmmaceth
>> +
>> +  mac-id:
>> +    maxItems: 1
>> +    description:
>> +      The interface of MAC.
> A vendor prefix is required for custom properties, but I don't think you
> need this and actually it is a bandaid for some other information you're
> missing. Probably related to your nuvoton,sys property only being a
> phandle with no arguments.
This property will be removed.
>> +
>> +  phy-mode:
>> +    enum:
>> +      - rmii
>> +      - rgmii-id
>> +
>> +  tx_delay:
> Needs constraints, a type, a vendor prefix and a unit suffix. No
> underscores in property names either. See the amlogic dwmac binding for
> an example.
I will fix it.
>> +    maxItems: 1
>> +    description:
>> +      Control transmit clock path delay in nanoseconds.
>> +
>> +  rx_delay:
> Ditto here.
I will fix it.
>
>> +    maxItems: 1
>> +    description:
>> +      Control receive clock path delay in nanoseconds.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-names
>> +  - clocks
>> +  - clock-names
>> +  - nuvoton,sys
>> +  - resets
>> +  - reset-names
>> +  - mac-id
>> +  - phy-mode
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>> +    //Example 1
>> +    eth0: ethernet@40120000 {
> The eth0 label is not used, drop it.
The label is used in dtsi and dts.
>> +        compatible = "nuvoton,ma35d1-dwmac";
>> +        reg = <0x0 0x40120000 0x0 0x10000>;
>> +        interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-names = "macirq";
>> +        clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
>> +        clock-names = "stmmaceth", "ptp_ref";
>> +
>> +        nuvoton,sys = <&sys>;
>> +        resets = <&sys MA35D1_RESET_GMAC0>;
>> +        reset-names = "stmmaceth";
>> +        mac-id = <0>;
>> +
>> +        clk_csr = <4>;
> This property is not documented.
This unused property will be removed.
>
> Cheers,
> Conor.
>
>> +        phy-mode = "rgmii-id";
>> +        phy-handle = <&eth_phy0>;
>> +        mdio0 {
>> +            compatible = "snps,dwmac-mdio";
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            eth_phy0: ethernet-phy@0 {
>> +                reg = <0>;
>> +            };
>> +        };
>> +    };
>> +
>> +  - |
>> +    //Example 2
>> +    eth1: ethernet@40130000 {
>> +        compatible = "nuvoton,ma35d1-dwmac";
>> +        reg = <0x0 0x40130000 0x0 0x10000>;
>> +        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-names = "macirq";
>> +        clocks = <&clk EMAC1_GATE>, <&clk EPLL_DIV8>;
>> +        clock-names = "stmmaceth", "ptp_ref";
>> +
>> +        nuvoton,sys = <&sys>;
>> +        resets = <&sys MA35D1_RESET_GMAC1>;
>> +        reset-names = "stmmaceth";
>> +        mac-id = <1>;
>> +
>> +        clk_csr = <4>;
>> +        phy-mode = "rmii";
>> +        phy-handle = <&eth_phy1>;
>> +        mdio1 {
>> +            compatible = "snps,dwmac-mdio";
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            eth_phy1: ethernet-phy@1 {
>> +                reg = <1>;
>> +            };
>> +        };
>> +    };
>> -- 
>> 2.34.1

Thanks!

BR,

Joey


