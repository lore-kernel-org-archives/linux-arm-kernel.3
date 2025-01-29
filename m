Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B59EC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 17:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=za9dNj6z5UwMbMZAHOKmk5bfHNfMXx0RETQ+5ugmfNE=; b=y2HgFJ5S4Hb4O1mA1m0k3mxHlv
	A6gRf/5wWlJphXNLdrvDgcHBn7Xs/PqFb6rQgBtYic19YKijiu3UuE5lNyKJC3IJ7CRN0RriZ6C6i
	swZVnPMBJd9kF4nOHQcwi4jp+FPM3vJcyFimMpGvcv6YjXkeeMYBT5NdpWGA7chiT9GIrbcEBNawL
	uf+JRhiT0ptCCISLy4nZWqOLCIV2edz16T3wRVJ9uGWOgFKh0YhViGV1wfzPia33x5LXl30+ZSL/E
	0QissSDUtg37KWWYUq77OZmXw2cI8Z4+RH5bjwL749YDbXG5ULtPgLuxz76lB7V2NO1tRWtfJrtU2
	ijaPsYUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdCCo-00000007Xuv-0NmD;
	Wed, 29 Jan 2025 17:50:26 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdCAn-00000007XaW-2KiJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 17:48:27 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TCeDMg014111;
	Wed, 29 Jan 2025 18:48:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	za9dNj6z5UwMbMZAHOKmk5bfHNfMXx0RETQ+5ugmfNE=; b=PS4MExHczAtm0Lka
	8VZM6oCkv286HoxwuYcSXBTKqL2nw5kTLgJ3F/vKK7DZGjjjz7tbqxdc6aFFeXOw
	XKMlLhI808y+s+FpeBUxamaDQMqHB/P98FfpUtIvP6Qscy+sv14jnVI2tvwO1hFF
	9R/v/DSG2ix5D750Zc02jcTfve+Scf3aanbLlOOv7xZP/gzYDDnUP5Gv2iGIM7AD
	OAqJXbAQwGI96tm5zVQqgaVmDxc/57qNG4AcJLMf/IQ8ch9xO7/BOV0/BVEiC05G
	N1NKeznoRzKM1FNwH6E0ewJNaZ2prbgRxM4D+90X1p4jWspDk5NNbO5T/ST/NiIt
	tMEMRA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44f4134d06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 18:48:00 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C08524002D;
	Wed, 29 Jan 2025 18:46:38 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BCFC43CD6F7;
	Wed, 29 Jan 2025 18:40:25 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 29 Jan
 2025 18:40:24 +0100
Message-ID: <e3d01bce-a7d4-4690-8a2f-3bbb1ee5ccb7@foss.st.com>
Date: Wed, 29 Jan 2025 18:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: spi: Add STM32 OSPI controller
To: Conor Dooley <conor@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <christophe.kerello@foss.st.com>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
 <20250128081731.2284457-2-patrice.chotard@foss.st.com>
 <20250128-panama-manly-a753d91c297c@spud>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250128-panama-manly-a753d91c297c@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_03,2025-01-29_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_094822_100095_B4758929 
X-CRM114-Status: GOOD (  24.65  )
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



On 1/28/25 19:02, Conor Dooley wrote:
> On Tue, Jan 28, 2025 at 09:17:23AM +0100, patrice.chotard@foss.st.com wrote:
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> Add device tree bindings for the STM32 OSPI controller.
>>
>> Main features of the Octo-SPI controller :
>>   - support sNOR / sNAND / HyperRAM™ and HyperFlash™ devices.
>>   - Three functional modes: indirect, automatic-status polling,
>>     memory-mapped.
>>   - Up to 4 Gbytes of external memory can be addressed in indirect
>>     mode (per physical port and per CS), and up to 256 Mbytes in
>>     memory-mapped mode (combined for both physical ports and per CS).
>>   - Single-, dual-, quad-, and octal-SPI communication.
>>   - Dual-quad communication.
>>   - Single data rate (SDR) and double transfer rate (DTR).
>>   - Maximum target frequency is 133 MHz for SDR and 133 MHz for DTR.
>>   - Data strobe support.
>>   - DMA channel for indirect mode.
>>   - Double CS mapping that allows two external flash devices to be
>>     addressed with a single OCTOSPI controller mapped on a single
>>     OCTOSPI port.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>  .../bindings/spi/st,stm32mp25-ospi.yaml       | 102 ++++++++++++++++++
>>  1 file changed, 102 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml b/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml
>> new file mode 100644
>> index 000000000000..f1d539444673
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml
>> @@ -0,0 +1,102 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/spi/st,stm32mp25-ospi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STMicroelectronics STM32 Octal Serial Peripheral Interface (OSPI)
>> +
>> +maintainers:
>> +  - Patrice Chotard <patrice.chotard@foss.st.com>
>> +
>> +allOf:
>> +  - $ref: spi-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: st,stm32mp25-ospi
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  memory-region:
>> +    maxItems: 1
> 
> Whatever about not having descriptions for clocks or reg when there's
> only one, I think a memory region should be explained.

ok i will add :

    description: |
      Memory region to be used for memory-map read access.

> 
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    items:
>> +      - description: phandle to OSPI block reset
>> +      - description: phandle to delay block reset
>> +
>> +  dmas:
>> +    maxItems: 2
>> +
>> +  dma-names:
>> +    items:
>> +      - const: tx
>> +      - const: rx
>> +
>> +  st,syscfg-dlyb:
>> +    description: phandle to syscon block
>> +      Use to set the OSPI delay block within syscon to
>> +      tune the phase of the RX sampling clock (or DQS) in order
>> +      to sample the data in their valid window and to
>> +      tune the phase of the TX launch clock in order to meet setup
>> +      and hold constraints of TX signals versus the memory clock.
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> Why do you need a phandle here? I assume looking up by compatible ain't
> possible because you have multiple controllers on the SoC? Also, I don't

Yes, we got 2 OCTOSPI controller, each of them have a dedicated delay block
 syscfg register.

> think your copy-paste "phandle to" stuff here is accurate:
>       st,syscfg-dlyb = <&syscfg 0x1000>;
> There's an offset here that you don't mention in your description.

I will add it as following:

  st,syscfg-dlyb:
    description:
      Use to set the OSPI delay block within syscon to
      tune the phase of the RX sampling clock (or DQS) in order
      to sample the data in their valid window and to
      tune the phase of the TX launch clock in order to meet setup
      and hold constraints of TX signals versus the memory clock.
    $ref: /schemas/types.yaml#/definitions/phandle-array
    items:
      - description: phandle to syscfg
      - description: register offset within syscfg


> 
>> +    items:
>> +      maxItems: 1
>> +
>> +  access-controllers:
>> +    description: phandle to the rifsc device to check access right
>> +      and in some cases, an additional phandle to the rcc device for
>> +      secure clock control
> 
> This should be described using items rather than a free-form list.

  access-controllers:
    description: phandle to the rifsc device to check access right
      and in some cases, an additional phandle to the rcc device for
      secure clock control
    items:
      - description: phandle to bus controller or to clock controller
      - description: access controller specifier
     minItems: 1
     maxItems: 2

> 
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - interrupts
>> +  - st,syscfg-dlyb
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
>> +    spi@40430000 {
> 
> nit: you missing a blank line here.
> 
>> +      compatible = "st,stm32mp25-ospi";
>> +      reg = <0x40430000 0x400>;
>> +      memory-region = <&mm_ospi1>;
>> +      interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
>> +      dmas = <&hpdma 2 0x62 0x00003121 0x0>,
>> +             <&hpdma 2 0x42 0x00003112 0x0>;
>> +      dma-names = "tx", "rx";
>> +      clocks = <&scmi_clk CK_SCMI_OSPI1>;
>> +      resets = <&scmi_reset RST_SCMI_OSPI1>, <&scmi_reset RST_SCMI_OSPI1DLL>;
>> +      access-controllers = <&rifsc 74>;
>> +      power-domains = <&CLUSTER_PD>;
>> +      st,syscfg-dlyb = <&syscfg 0x1000>;
>> +
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      flash@0 {
>> +        compatible = "jedec,spi-nor";
>> +        reg = <0>;
>> +        spi-rx-bus-width = <4>;
>> +        spi-max-frequency = <108000000>;
>> +      };
>> +    };
>> -- 
>> 2.25.1
>>

