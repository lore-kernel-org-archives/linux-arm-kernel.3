Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14591D262BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 03:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17+DNkkNcmMDigIJBL8XgDaqQaWKVbdBHFS6qgPE1RU=; b=zOy8BwMJF9bQE1usdps11oQpvJ
	JX/MTqQO/n2g5Lc95B/ovsYpQeW0gEUHwgKAyj/p4/GGNqN6x3rLP19pkrgnVPoZ6yxQ17Hg4AZ7G
	2vcW19+C2aTe7K8VfV/MRPa0RiE7b3DWrKTkZzq7FssuQwH+b+6P5pEWITXjZai8JhmiPBUg+HLZf
	zEX1TURkTLFBUMyzhlveMrezAhPdlu3Ggr1Fggfr2DBMgszaAfQKMssGOOx9wD4sXnv20gpv/hz8r
	tckG8tacRcQQtt9xVVkrlYGv9OhJMv1NMHwfNKoKFtpdFxW0EZmB94D7t5H5xJH0Iohp+gblC10kM
	2FR2D9RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viOnO-00000004px5-0o3S;
	Wed, 21 Jan 2026 03:22:14 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viOnL-00000004pw8-2lfu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 03:22:12 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-81f46b5e2ccso3166103b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 19:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768965730; x=1769570530; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=17+DNkkNcmMDigIJBL8XgDaqQaWKVbdBHFS6qgPE1RU=;
        b=ShhUJ99bdXa3vrYMImv/Xb2dwaIyRrA1nZM8EA6VyzlmKAiUIMO4gixSYsTnHx6iRX
         J9vaViS12ehW6H0VFAD7ev5LGzz4+HuCzrX5zqPKxp8P6AS2k0MuDEQYOlCs3N+Cf0zW
         IEmf5mgsig7ov8uoVMIJ5qgmqOXXfTm6b57cyirv7SI5kOvx/5KXttrDgbZAeRyBgI+S
         4YUk7r6GcWAIpwxTVlaLIbSAiptYqYLImECjm3vmk8IJuQ1j+YfRH8hVqxOxgLDXb17g
         h0y/YiwNFX0VsrQQsipuobNT7VfKx9zQrJOKV7LDI+r5uM4hM64U6hvFNN3rRVqKi7uJ
         dCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768965730; x=1769570530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17+DNkkNcmMDigIJBL8XgDaqQaWKVbdBHFS6qgPE1RU=;
        b=EG/PjFLZlc4jveS5X/P5z5/vYalyQOmFT2AcdHsCXD0Z8/+4TGhjlzu8UIzBMfiEXt
         LZsb+PHmORW2ZSG9zrmFNwnqy2gaOmeo9Pxl+4VpWZIH3MGzHHNK2hTVoSgsZ4jtcsce
         22sqZ8RPBcOPVm6N5shG1er2Pwv+FKS27HsFIFerqKMxWpHD4UC9J4IqrVo+NwFxxHXx
         CMHuABA8umxo9+VO1Q4b7UfjYtq1VDbudDAuLUoWPv1FpFqoFHFwvU8MKZolZs4ZKxAs
         wl02j1vnICvbZEjDAukbO9JACZUk7Zc54sluYgXz3xlM2yG0EHuU5lT32ytJIYo+votV
         Ty3A==
X-Forwarded-Encrypted: i=1; AJvYcCW6IbrLL7Uvq7wb2P5RaKyfUzzElUUkJlMKI/whPeP645Ngy23b9QwFP1uaHEH26li2+jRLLesy/r4DQj9hr2pl@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq5PF6+kgjSKqEekYD3iXhulPAlHTLfmQJh7R9UTbRW+/zNODV
	pd45v3hOdxBc/GY2T9oklymZ18TYoUm+S1j2atPY9l4JMPcmXSf51qrY/MgFbJL8
X-Gm-Gg: AZuq6aIerWQBKYRxMrwb10ecEXn5kF/AV0IKROCUAPcDj3OgKimKHADU1kcvfrOM+S8
	gQeb9wgiUBhTMA+7rLxtHkrj3HedqG3l99JMnYCy68zFKtOMjaLp88+8816ipa1S2Fqg5RWLuTg
	S2dRCR0ltQGl4nsNSIMPREl7ZAy2TnIQwiBxImRWyX2a5Rdtc6xoDeDtw/oPwVR7vLbjBos/+Tl
	+vG0c4yZs3PuiIbQYbtslpCitzwD8PPuPH1uti3K4B7BNs5pCjLWib/Oy+Z1hB2O+DMOwix9zyt
	dpJtVIHYSrHsUvXLHYKJjnCYoCgzRFnTOBh7HImzcRMGcmA6Bz8XjVisPwtVbw2BxCybWCwMr2V
	cIQNK6J7ApVaHX1lsVz4+msENITxyfEfCi0vwvatLbDUUjMInBsssdRiYGyXtvKtgSIpYv1y7KP
	40UJnbngCtH6DMEerAOr3J7XRG9joKQlMJ/oIW0uflpHHd+UFeF7ozqRSPKr03GczS
X-Received: by 2002:aa7:888b:0:b0:81e:81fb:b392 with SMTP id d2e1a72fcca58-81fe87db4bamr3212275b3a.11.1768965730358;
        Tue, 20 Jan 2026 19:22:10 -0800 (PST)
Received: from [192.168.0.102] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa1291135sm13268978b3a.47.2026.01.20.19.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 19:22:10 -0800 (PST)
Message-ID: <7a43bedf-6d31-4ae1-b2c6-97cb3757ad9f@gmail.com>
Date: Wed, 21 Jan 2026 11:22:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 1/3] dt-bindings: net: nuvoton: Add schema for
 Nuvoton MA35 family GMAC
To: Rob Herring <robh@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260119073342.3132502-1-a0987203069@gmail.com>
 <20260119073342.3132502-2-a0987203069@gmail.com>
 <20260121020728.GA1671298-robh@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260121020728.GA1671298-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_192211_710492_33D3E72C 
X-CRM114-Status: GOOD (  17.25  )
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


Rob Herring 於 1/21/2026 10:07 AM 寫道:
> On Mon, Jan 19, 2026 at 03:33:39PM +0800, Joey Lu wrote:
>> Create initial schema for Nuvoton MA35 family Gigabit MAC.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++++++++
>>   .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>>   2 files changed, 127 insertions(+)
>>   create mode 100755 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> This should not be executable.
>
> Rob
Thanks for catching this.

I will fix the file mode in the next revision.

Joey

>> diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
>> new file mode 100755
>> index 000000000000..8eaddfdc937c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
>> @@ -0,0 +1,126 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml#
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
>> +allOf:
>> +  - $ref: snps,dwmac.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - nuvoton,ma35d1-dwmac
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description:
>> +      Register range should be one of the GMAC interface.
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: MAC clock
>> +      - description: PTP clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: stmmaceth
>> +      - const: ptp_ref
>> +
>> +  nuvoton,sys:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      - items:
>> +          - description: phandle to access syscon registers.
>> +          - description: GMAC interface ID.
>> +            enum:
>> +              - 0
>> +              - 1
>> +    description:
>> +      A phandle to the syscon with one argument that configures system registers
>> +      for MA35D1's two GMACs. The argument specifies the GMAC interface ID.
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  reset-names:
>> +    items:
>> +      - const: stmmaceth
>> +
>> +  phy-mode:
>> +    enum:
>> +      - rmii
>> +      - rgmii
>> +      - rgmii-id
>> +      - rgmii-txid
>> +      - rgmii-rxid
>> +
>> +  tx-internal-delay-ps:
>> +    default: 0
>> +    minimum: 0
>> +    maximum: 2000
>> +    description:
>> +      RGMII TX path delay used only when PHY operates in RGMII mode with
>> +      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
>> +      Allowed values are from 0 to 2000.
>> +
>> +  rx-internal-delay-ps:
>> +    default: 0
>> +    minimum: 0
>> +    maximum: 2000
>> +    description:
>> +      RGMII RX path delay used only when PHY operates in RGMII mode with
>> +      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
>> +      Allowed values are from 0 to 2000.
>> +
>> +required:
>> +  - clocks
>> +  - clock-names
>> +  - nuvoton,sys
>> +  - resets
>> +  - reset-names
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>> +    ethernet@40120000 {
>> +        compatible = "nuvoton,ma35d1-dwmac";
>> +        reg = <0x40120000 0x10000>;
>> +        interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-names = "macirq";
>> +        clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
>> +        clock-names = "stmmaceth", "ptp_ref";
>> +
>> +        nuvoton,sys = <&sys 0>;
>> +        resets = <&sys MA35D1_RESET_GMAC0>;
>> +        reset-names = "stmmaceth";
>> +
>> +        phy-mode = "rgmii-id";
>> +        phy-handle = <&eth_phy0>;
>> +        mdio {
>> +            compatible = "snps,dwmac-mdio";
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            eth_phy0: ethernet-phy@0 {
>> +                reg = <0>;
>> +            };
>> +        };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> index dd3c72e8363e..10cb5e555750 100644
>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> @@ -69,6 +69,7 @@ properties:
>>           - ingenic,x2000-mac
>>           - loongson,ls2k-dwmac
>>           - loongson,ls7a-dwmac
>> +        - nuvoton,ma35d1-dwmac
>>           - nxp,s32g2-dwmac
>>           - qcom,qcs404-ethqos
>>           - qcom,sa8775p-ethqos
>> -- 
>> 2.43.0
>>

