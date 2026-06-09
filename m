Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAD9CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 21:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGjz6oXrvv0vYyL9h564g5u9rOXsQ9Yj+tb2sJWaYA0=; b=YG/cc2YerwtB6NGK0E2FfBgcJn
	IfDQcIVpEHTojS9Woy3PPHmxzZaDRWntdVSUxbDaj3I+jenpznDnidbAbLa6baARVjRWCN7Xl0/Jo
	lRe1Lb1LCUJLCw8DSi4Jpcv6vS5cgjsDVmG5S8J6fRi0nOKA0j4VZG6zZKQlMjk2LUh7RxQ2sE90s
	ydQd08N+rh0/W0OSw5T2MIRVSTXQRqCinL2Alt6dCKo/sOZEtGVxeocNiypZcy26z1aZUtFtpo9AV
	nHRuCtvGrOfTOLKTOKOvaLQkqFKtFe5BNL3fwsJsn5OxgUDDpsZysQxVgIxFHPUIuO2rHTq5tjn64
	2prpn1dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX43A-00000006Oeb-2KbA;
	Tue, 09 Jun 2026 21:31:56 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX438-00000006Oe3-1Doz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 21:31:56 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-4863eae4526so2690462b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 14:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1781040712; x=1781645512; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aGjz6oXrvv0vYyL9h564g5u9rOXsQ9Yj+tb2sJWaYA0=;
        b=X7b/nB1QkJwPSZfyb8k9Kqr9siuBAtqImUMe9RrkAc2ydOgFfJUPWRJJjnC4N8W368
         ajXyv67cCErbXQqDFkJ7z6vjH4dK02/YfFl26i5ryNreAxMF1pSU/geaIy2cCgxqHYy9
         xLgkpr0KBTiA/lkCZ/mNz5Re2I2P9JBhRqykXfUO0h/C3S0BCSQvf61bKC4Kn/baB9tI
         UAg7P5SujlxQNXptopavebpieX6x2/vEJO7PtzXAWafyGLH6Mq/Kmj694yye3xw74U7s
         khMKSfDRCMwudguMnvhKRQPUfMG18eR79tvgEq4TwU13xzFmIBoMm4NDyQat69C6+coS
         KkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781040712; x=1781645512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGjz6oXrvv0vYyL9h564g5u9rOXsQ9Yj+tb2sJWaYA0=;
        b=eXE6tgY1gfV24Vgm0QofwlT5Q3fRdX1qcXq0Da8gmanOhVnAYEDxKwVRq1nSbki6FH
         dhEvuBlPyRdXyEC12ZYdO1arMBvKQ32jlWC+B3KBJCvhdCSVhNBDVuq1lYOkwsHu7AYo
         SsH7fdczOM6zHuBf565QOtizCo0joQqLBUUWFlra7+G8aTi64bs8Ar6qlzTAU1dWkJvj
         2Men6dbiy8gxUtg5wKM8nfon7TFxoBhGxrS6h509zEO0uMRvHQPhfnOdaMpqYGUG2iSB
         2ItOjow3yhbBxDIBaz0DBwWUMWE7kSPnW9qT/eCHrZVfly6p9n2c0NakcIS1jjqtvyUC
         uRWg==
X-Forwarded-Encrypted: i=1; AFNElJ+mu/jsyaTVdyiXznhrVmCm6DGvSHj04gQfS4VEE+8SX3KpZiOQNMqD+CeTFhwISBR9fT4sT60HAdPRyhy7f0hn@lists.infradead.org
X-Gm-Message-State: AOJu0Yy48Jw98Pjwq3za+eed6D0J8mxMqCYQ0a9eQoutL6wAoqV1T7Ks
	Rx7OFFWleOO6EkaudTnWyo+piYQV0ta/P1AY7SNbcz3JhgrrcADCOQox3gwOFoq+7aA=
X-Gm-Gg: Acq92OFea5ZOf02cd5bmMKHcE3HPblX79Gjx5l2FNtjfkKLfEajqR5rTe6Q62FrkMmq
	9Auuhg1gqgjFKvpoTXMMZwBNvyPVn4GeqUR72y6+87dgz9bY/zKBAyq06YgqBTCLATEsb8/G6nr
	Dh4A3NAOkRByntSlExu/NMz6aIDW4ObuHATnP9J3N+NP8ufer43KQLve1wfeNrxaLSz7sOS7vHI
	hgAAKCNQSIqERc5944jDp/5m5v8uxBTlLsq7MmbK8sv3fA6W8HysglbTAfV8NgfKksfwwpElwpz
	d3ud6pjD9QNl2XDg9QfYaclZAbmEZupKaere5pNTOOLNzNBa9BM3iEQllFO66OPGDfqsxXf3jxv
	p/UeNiAF4hCKYL9QAqENeMdbfkRfByQSIYfDB7QX0EAsPDwQZAkucNLMJtHbHd/SIhI40YS9wuu
	XjtAv+vcwzIMFkCDO0A/9w4v/MNyKe1fUroQ==
X-Received: by 2002:a05:6808:191e:b0:47b:bd7b:10e5 with SMTP id 5614622812f47-4868db2d9eamr11794474b6e.3.1781040712262;
        Tue, 09 Jun 2026 14:31:52 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b5a5a64sm17024127b6e.4.2026.06.09.14.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 14:31:51 -0700 (PDT)
Message-ID: <e5c0fc2a-dcf0-4165-b2dc-d16c6cbe92df@riscstar.com>
Date: Tue, 9 Jun 2026 16:31:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 10/14] dt-bindings: net: toshiba,tc9654-dwmac:
 add TC9564 Ethernet bridge
To: Rob Herring <robh@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
 a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, chenhuacai@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com,
 inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com,
 livelycarpet87@gmail.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260605010022.968612-1-elder@riscstar.com>
 <20260605010022.968612-11-elder@riscstar.com>
 <20260605144032.GA3659201-robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260605144032.GA3659201-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_143154_354334_00A1209D 
X-CRM114-Status: GOOD (  29.69  )
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

On 6/5/26 9:40 AM, Rob Herring wrote:
> On Thu, Jun 04, 2026 at 08:00:17PM -0500, Alex Elder wrote:
>> From: Daniel Thompson <daniel@riscstar.com>
>>
>> Add devicetree bindings for the Toshiba TC956x family of Ethernet-AVB/TSN
>> bridges.
>>
>> The TC9564 contains a PCIe switch with one upstream and three downstream
>> PCIe ports.  The third PCIe downstream port has an attached embedded PCIe
>> endpoint, and that endpoint implements two PCIe functions.  Each internal
>> PCIe function has a Synopsys XGMAC Ethernet interface capable of 10 Gbps
>> operation.
>>
>> The TC9564 also implements an embedded GPIO controller, which exposes
>> 10 lines externally.  Some platforms use these GPIO lines, so this
>> GPIO controller is managed by a separate driver.  Other embedded
>> peripherals (like a microcontroller, SRAM, and UART) are currently
>> unused.
>>
>> The GPIO controller is managed by registers accessed via MMIO on an
>> internal PCIe function's registers.
>>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../bindings/net/toshiba,tc9564-dwmac.yaml    | 120 ++++++++++++++++++
>>   MAINTAINERS                                   |   6 +
>>   2 files changed, 126 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
>> new file mode 100644
>> index 0000000000000..6e7a63dfcf86a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
>> @@ -0,0 +1,120 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/toshiba,tc9564-dwmac.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Toshiba TC956x Ethernet-AVB/TSN Controller
>> +
>> +maintainers:
>> +  - Alex Elder <elder@riscstar.com>
>> +  - Daniel Thompson <daniel@riscstar.com>
>> +
>> +description: |
>> +  The Toshiba TC9564 (and more generally, TC956x) incorporates a PCIe
>> +  gen 3 switch with one upstream and three downstream ports.  The first
>> +  two downstream ports are exposed externally, while the third is used
>> +  by an internal PCIe endpoint.  The PCIe endpoint implements two PCIe
>> +  functions, and attached to each of these is a 10 Gbps capable Synopsys
>> +  Ethernet controller.
>> +
>> +  The TC956x additionally implements other internal IP blocks, and in
>> +  particular it implements a GPIO controller.  Ten of the 35 GPIO lines
>> +  implemented are exposed externally and are usable by the platform.
>> +  It is platform-dependent whether the GPIO function must be exposed,
>> +  and if it is, PCIe function 0 supplies it.
>> +
>> +              ----------------------------------
>> +              |              Host              |
>> +              ------+...+----------+........+---
>> +                    |i2c|          |  PCIe  |
>> +    ----------------+...+----------+........+------
>> +    | TC956x        |I2C|          |upstream|     |
>> +    |               -----        --+--------+---  |
>> +    |  -----  ------  -------    | PCIe switch |  |
>> +    |  |SPI|  |GPIO|  |reset|    |             |  |
>> +    |  -----  ------  |clock|    | DS3 DS2 DS1 |  |
>> +    |                 -------    ---++--++--++--  |
>> +    |  -----  ------     downstream//    \\  \\   |  downstream
>> +    |  |MCU|  |SRAM|    /==========/      \\  \===== PCIe port 1
>> +    |  -----  ------   //PCIe port 3       \\     |
>> +    |                  ||                   \======= downstream
>> +    |  ----+-----------++-----------+----         |  PCIe port 2
>> +    |  | M | internal PCIe endpoint | M |         |
>> +    |  | S |------------------------| S |  ------ |
>> +    |  | I |   PCIe   |  |   PCIe   | I |  |UART| |
>> +    |  | G |function 0|  |function 1| G |  ------ |
> 
> I don't see nodes for these PCI functions. Boot this platform with
> CONFIG_PCI_DYNAMIC_OF_NODES enabled and use the resulting DT node
> structure. Anything else is wrong. This will give you the DTS:
> 
> dtc -O dts /proc/device-tree
> 
> The ethernet nodes should be just these PCI function nodes. You need to
> make the DWMAC PCI driver (stmmac_pci.c) bind to those 2 PCI devices.
> And really, a DT node for them should be completely optional (unless
> there's some power on ctrl needed).
> 
> Everything else like SPI, GPIO, UART, etc. should be under the PCIe
> switch upstream node in a pci-ep-bus.

I unfortunately hadn't looked closely enough at pci-ep-bus
before.  It really looks like what we should use.  It's a
simple bus, and we'll use platform drivers and compatible
strings to match the devices on the bus.

I'll work toward converting things over to use this model.

> 
> 
>> +    |  | E |----++----|  |----++----| E |         |
>> +    |  | N |  eMAC 0  |  |  eMAC 1  | N |         |
>> +    --------+.......+------+.....+-----------------
>> +            |USXGMII|      |SGMII|
>> +          --+.......+--  --+.....+--
>> +          |  ARQ113C  |  | QEP8121 |
>> +          |    PHY    |  |   PHY   |
>> +          -------------  -----------
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - pci1179,0220 # Toshiba TC9564 (a.k.a. Qualcomm QPS615)
>> +
>> +  gpio:
>> +    type: object
>> +    description: Embedded GPIO controller
>> +    $ref: /schemas/gpio/gpio.yaml#
> 
> gpio.yaml alone does not define a GPIO controller. How many #gpio-cells
> needs to be defined.
> 
> Is there no address associated with the controller?
> 
>> +
>> +  ethernet:
>> +    type: object
>> +    description: XGMAC Ethernet controller
>> +    $ref: /schemas/net/ethernet-controller.yaml#
>> +    properties:
>> +      mdio:
>> +        $ref: snps,dwmac.yaml#/properties/mdio
> 
> Either all of snps,dwmac.yaml should apply or none of it. Generally, we
> only reference whole schema files (OF graph being a notable exception).

OK.

> 
>> +    required:
>> +      - mdio
>> +
>> +required:
>> +  - compatible
>> +
>> +allOf:
>> +  - $ref: /schemas/pci/pci-device.yaml#
>> +  - $ref: /schemas/pci/pci-bus-common.yaml#
> 
> These 2 are just pci-pci-bridge.yaml.

OK.

					-Alex

> 
> Rob


