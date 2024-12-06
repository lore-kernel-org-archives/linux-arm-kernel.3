Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14026E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 03:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1J08d2GpR5DBDse4TbjdicR+imRnKLikvjMWBZLku0=; b=AldQWaIFpGgbNZacnAPuFmgcLQ
	7XooGUxoD18ii9kt/cXgDrKvZh3gI2WJ5LT3Cgo6FBMGkGucMdzi3hICbyyTgbPf/OX32+6gTkdak
	Ry0jVBS6XIvVqSqL5O9S4UcjPHZwYS/qIwxl4TkTnZIKzlrzQO1+pMWgGPRGAs+jinH6KJI0F4tm2
	zVya1rRPEZsWBXKha5CELjzxoiTisQO7kUXzSvQ/ti2LpxDAAmePWUKzEU/bUXQp7cH8ezufu7ajd
	1c+tPiRCChIH5Q1itkEe+AHY7N3eEJxYbHVxf1MWqetAvmBAsK9M5Z5J/DjXlXDGlVsZv7snBCKID
	KSvxgGEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJOtg-00000000Ppb-1SG9;
	Fri, 06 Dec 2024 03:20:52 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJOsf-00000000Phh-1n3p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 03:19:50 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-215909152c5so18380285ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 19:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733455188; x=1734059988; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o1J08d2GpR5DBDse4TbjdicR+imRnKLikvjMWBZLku0=;
        b=RxxY5fAWHfJZMP3thzwQ4y3V64zr5iRIJNfW+lZffxMyA/+dlhL2OsXGUIINThspEy
         ftWp2UpwVdv/xw5xspnAFZsjz5Mi/+IFjWObrD0uemxtlyvNeDBtwJPogOmTGxvkudo/
         93QYWMZXm79WS1hMGHsYfF4hOj3x8mZX8cjJ/X/1Ey24BVx1G1xNOqJMe8TzWVw1kIQz
         uxhmM0apSFQpmIKNMlyZNxGX6kfOHDkmgZU0uo8qjNMnfuNi1/l+jjFrTRAqsuc8j278
         hcgz9ZpQ2oaj4baYoI7bjL1KQmLvta9vcYMVm19Y/szBP8TT+GS6IIcqB4tHAPOp5OJl
         0S4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733455188; x=1734059988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o1J08d2GpR5DBDse4TbjdicR+imRnKLikvjMWBZLku0=;
        b=fESs2NjungxL2X/M746rQEw+ELucQk/hqne6izsAWRpW8tcCSGmHgXS1SEGEr1zFs9
         ITFLpzufKh2sGnAEKqkU/D/f0gDHI4DlOFvR+XqWyMCnQ5mucKwrw9vmuYqSOCSDRFdG
         uvMppdWYBJapxQzrdooDxc2Hrb3sZIqtuyOGBHneXtqmK8FtCcPVYABg7wDQ9lOXgLI1
         07f4vMQOFU+Uqhe2Unw1HY9+otkbQFQr4VDpPqxpb2i7mBGa0lbUx2TWsVllZhjGy1jH
         F1DoIuw4zYSz1MRiR5ieRauhKQV9YtkULz+Y3Pk9YdLSStk3OfmrXr41gxgZz28bPlTT
         XaUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmrgQXiSa2fha0jbxWpSz/TV6s+JHExKHAkPMY2wlEHQfO2mFL3f3vdbbk1PnlPCyHMZ8kyvpDAgouDuq0K8bz@lists.infradead.org
X-Gm-Message-State: AOJu0YziFjHdBQBgPlwzMyXC47kvX0MFjaKHGpTchXPBp4ZEchPf+goX
	CT0+OC/I9bFo1n5SWY54zd8LoZ4oMXM3stgXrJ8BpL8r3Kk67qZK
X-Gm-Gg: ASbGncvIf3aiGMO3IEVNFqeBYd06dFSHhg6WnkJ9BzzsscvpL/FC6tJghwW6gYNCWX7
	QUC9Ng9VeHQBRlH5A2w/J/kXNX4KncDnZ2eElFwftrNv0fkvezOM50ck2aWnPMfq9VC3R32mBF3
	jFDVpSuP3dOqgzv9Oov274EekXGK3idLnDUSymrCWQvCoRvHyOOX90dyhwFBP0g9HrdZxfeOwsN
	aDVzP+nsSuh0bcacI/0l9i9VDmolGb6DgRrc5Sw7CBz+XvTEw/IrbjIFv9sgliSMXdrKklnxM5H
	0WjOz6GJ1CKKpRJ/4locNrAtzebK
X-Google-Smtp-Source: AGHT+IF785ewAXxfZzF45gbEj/3x8DTYf9enjYTZG3Qjck/WxskvwgRBw9uMc142aJEKW0klUE6onw==
X-Received: by 2002:a17:903:240a:b0:215:6816:6345 with SMTP id d9443c01a7336-21614d74ed8mr23832465ad.16.1733455188374;
        Thu, 05 Dec 2024 19:19:48 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21610638673sm5075265ad.271.2024.12.05.19.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 19:19:47 -0800 (PST)
Message-ID: <a04cd927-63cb-4271-bfc7-3ec97c5a978d@gmail.com>
Date: Fri, 6 Dec 2024 11:19:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton
 MA35 family GMAC
To: Rob Herring <robh@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
References: <20241202023643.75010-1-a0987203069@gmail.com>
 <20241202023643.75010-2-a0987203069@gmail.com>
 <20241204142722.GA177756-robh@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20241204142722.GA177756-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_191949_507476_821857E3 
X-CRM114-Status: GOOD (  16.35  )
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

Dear Rob,

Thank you for your reply.

Rob Herring 於 12/4/2024 10:27 PM 寫道:
> On Mon, Dec 02, 2024 at 10:36:41AM +0800, Joey Lu wrote:
>> Create initial schema for Nuvoton MA35 family Gigabit MAC.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 134 ++++++++++++++++++
>>   .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>>   2 files changed, 135 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
>> new file mode 100644
>> index 000000000000..e44abaf4da3e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
>> @@ -0,0 +1,134 @@
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
>> +  mdio:
>> +    $ref: /schemas/net/mdio.yaml#
> Drop. snps,dwmac.yaml already has this.
Got it.
>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-names
> Drop all 4. Already required by snps,dwmac.yaml.
Got it.
>
>> +  - clocks
>> +  - clock-names
>> +  - nuvoton,sys
>> +  - resets
>> +  - reset-names
>> +  - phy-mode
> Drop this one too.
Got it.
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
>> +            ethernet-phy@0 {
>> +                reg = <0>;
>> +            };
>> +        };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> index eb1f3ae41ab9..4bf59ab910cc 100644
>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> @@ -67,6 +67,7 @@ properties:
>>           - ingenic,x2000-mac
>>           - loongson,ls2k-dwmac
>>           - loongson,ls7a-dwmac
>> +        - nuvoton,ma35d1-dwmac
>>           - qcom,qcs404-ethqos
>>           - qcom,sa8775p-ethqos
>>           - qcom,sc8280xp-ethqos
>> -- 
>> 2.34.1

Thanks!

BR,

Joey


