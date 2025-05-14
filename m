Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8B6C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iaWgi2+6QGoD6Bh6MAYJTWH0TqBtpBBy9hMdUN0b9I=; b=IUyiCI5D+jibgQUunXdt+rQn4x
	Rm9UxXAkB+hO8owxr5IPZV1HgMHthstjjO/+Aq9qMGhxGlIvkg5bHgdkrIUCyteVQrchVCqgSjohF
	mGM8N5nXu3wpDjhx2wT9kcjb/ith4LDBoUlVQf9hFJ1QFbnbc3Z00LVAYVfuExaPD9Im1kyJjgJqU
	GokNzfvbET9bOevNT8ztFj6Wv4MAAQrxuShd43IL/4oW9ZQ0I5e6scWmGLWWl6PYN60JC8YCvBs+k
	7jKtrE3jb+wyHjHDXFpA6RvwIVp1/lPdz4PR42m4Dm8oSMoZhjlfBHSBx68iSgpaLCUGCXrtM/eIt
	ZV6UjcHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCYq-0000000FItH-3xR6;
	Wed, 14 May 2025 13:54:16 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFAU6-0000000EvAp-00Wj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 11:41:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a0b9e2d640so6126169f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 04:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747222872; x=1747827672; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1iaWgi2+6QGoD6Bh6MAYJTWH0TqBtpBBy9hMdUN0b9I=;
        b=miowTI92Ku1DYIzm1ufi/VbQGvWukLvokKduhN3BlfXT5+Ji9dwZaPZjgOJffeAszt
         VB3Qe/kSzNOXake+k5t8HGPsSaZEEdq5ncPoyxLDfh2OdAD8IpsPdSubVEj03yTndQgS
         4epeg8uJpMB30cC7jym2dA6xGwgYlzJ6EaoPnE107o33aNQ4GirrcJ9UQWrgR5Dk2MsW
         Z+N4zMk347RAZqBIFII8RCwvTPWAc6rrG9s/J91Mw1MngUgQMlXRFug6XfljV7IeCuDr
         MMgNkISZ9kcxqKYeAydI8+1faa6EAAk6UQ7/n5WcmVQbbbofXngQLfjWmKMOLaqGS0u2
         JFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747222872; x=1747827672;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1iaWgi2+6QGoD6Bh6MAYJTWH0TqBtpBBy9hMdUN0b9I=;
        b=cUR/iJYBLhl88xsRpoW2mR0QS+bM4cmy9D+BqWlUjiQRq/svUl4cRWx0+xqI/SbLsG
         /g6Wm2WP2vPj6VoWy3DXMdxYO55xkLMnHWgchNPbLUemx2EOwcRkXF1/g/oQXs8P5Sc3
         VKR9zp/c19bxLR20q3bukZsFdhUJS9LLOY3burQGZQ+p7zpoyzElBbtN0LCI5GrNCC5N
         h1+/INYVTaCUKCzJoRN0RXxxhOv0hDY2df0D+gSbCLq2CuOKbmjJlumLxDcC4cPltkHi
         F0uKxoPf2MODJ0CwtXAckVJn7MX8uP/XElMSQAwoTT6IdiM4yK0NbOVlOLe3A9vNjthd
         XjAw==
X-Forwarded-Encrypted: i=1; AJvYcCXrrNqSgFMCaBz2elfu25A/1Ar8tODXcXbpbkv0IYVbQd4+20ryFdaLsirqDY+oEBiy8M+X+Ks7eQdpPKTMwkj2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6DzSB0a79sQTL+2UG4PYlR+O6N/pKGx1jWRraIDN0ESLSMnL8
	zRsVRjKYJPGzvn5uPWpmz3/yHLp6V7TKXkTaWC/1UUMXi2FV6F2J58vXo0lSfiM=
X-Gm-Gg: ASbGnctc/OYSUkjlKYB0qsQlhBCvEmItPzYEaFxGg2Y/IOTK2DbO8AuUHDJJjFk9s7d
	hSMqjou0i4ONcTbWX1SHiikmJOfbuZ6wdsdkTKOETkEgWrwRG1P9phHmW9iZobaXvt2uFo5Y3xg
	Bcy41Ic4wXyDlXYYfFoPS+KKC3YbYdo0ox2gv3K6p0K35x2diD1den4FqPDQtm0hCcq6NHvletc
	acDR1HHcU+2kkgKOE6uGMOLqo7jA1B7rtL+aKN9KMuhCuIsYmBDHfxArwGckVNXg/St9QrSK4yk
	+YvuSH8OQzdtTX96qlR9yl64hV1zKGlxtyEGkRT+x1Fn7KqIh8n2wFS+/MQ=
X-Google-Smtp-Source: AGHT+IH2CN5E5d5IiEul9fORo75uv9zJHPufVjipSowLqASUDKgEkIqOTizOIqaf2tZjC9ZhGWR8Tg==
X-Received: by 2002:a05:6000:1868:b0:3a0:7aa3:cc74 with SMTP id ffacd0b85a97d-3a34969a54dmr2881005f8f.6.1747222872006;
        Wed, 14 May 2025 04:41:12 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2f4sm19387956f8f.78.2025.05.14.04.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 04:41:11 -0700 (PDT)
Message-ID: <2b2efbf8-a5df-4f2b-8660-67fc13168f58@tuxon.dev>
Date: Wed, 14 May 2025 14:41:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add
 documentation for the PCIe IP on Renesas RZ/G3S
To: Rob Herring <robh@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
 manivannan.sadhasivam@linaro.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, saravanak@google.com, p.zabel@pengutronix.de,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
 <20250430103236.3511989-5-claudiu.beznea.uj@bp.renesas.com>
 <20250509210800.GB4080349-robh@kernel.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250509210800.GB4080349-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_044114_049475_74A092DA 
X-CRM114-Status: GOOD (  24.88  )
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

Hi, Rob,

On 10.05.2025 00:08, Rob Herring wrote:
> On Wed, Apr 30, 2025 at 01:32:32PM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The PCIe IP available on the Renesas RZ/G3S complies with the PCI Express
>> Base Specification 4.0. It is designed for root complex applications and
>> features a single-lane (x1) implementation. Add documentation for it.
>> The interrupts, interrupt-names, resets, reset-names, clocks, clock-names
>> description were obtained from the hardware manual.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  .../pci/renesas,r9a08g045s33-pcie.yaml        | 242 ++++++++++++++++++
>>  1 file changed, 242 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
>> new file mode 100644
>> index 000000000000..354f9c3be139
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
>> @@ -0,0 +1,242 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pci/renesas,r9a08g045s33-pcie.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Renesas RZ/G3S PCIe host controller
>> +
>> +maintainers:
>> +  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> +
>> +description:
>> +  Renesas RZ/G3S PCIe host controller complies with PCIe Base Specification
>> +  4.0 and supports up to 5 GT/s (Gen2).
>> +
>> +properties:
>> +  compatible:
>> +    const: renesas,r9a08g045s33-pcie # RZ/G3S
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    items:
>> +      - description: System error interrupt
>> +      - description: System error on correctable error interrupt
>> +      - description: System error on non-fatal error interrupt
>> +      - description: System error on fatal error interrupt
>> +      - description: AXI error interrupt
>> +      - description: INTA interrupt
>> +      - description: INTB interrupt
>> +      - description: INTC interrupt
>> +      - description: INTD interrupt
>> +      - description: MSI interrupt
>> +      - description: Link bandwidth interrupt
>> +      - description: PME interrupt
>> +      - description: DMA interrupt
>> +      - description: PCIe event interrupt
>> +      - description: Message interrupt
>> +      - description: All interrupts
>> +
>> +  interrupt-names:
>> +    items:
>> +      - description: int_serr
>> +      - description: int_ser_cor
>> +      - description: int_serr_nonfatal
>> +      - description: int_serr_fatal
>> +      - description: axi_err_int
>> +      - description: inta_rc
>> +      - description: intb_rc
>> +      - description: intc_rc
>> +      - description: intd_rc
>> +      - description: intmsi_rc
> 
> Isn't every interrupt for the root complex?

It is! I just used the names that were available in the hardware manual.
I'll drop the "_rc" it in the next version.

> 
>> +      - description: int_link_bandwidth
>> +      - description: int_pm_pme
>> +      - description: dma_int
>> +      - description: pcie_evt_int
>> +      - description: msg_int
>> +      - description: int_all
> 
> 'int_' or '_int' is redundant (and inconsistent). Drop.

OK

> 
>> +
>> +  clocks:
>> +    items:
>> +      - description: System clock
>> +      - description: PM control clock
>> +
>> +  clock-names:
>> +    items:
>> +      - description: aclk
>> +      - description: clkl1pm
> 
> 'l1pm' or 'pm'

OK

> 
>> +
>> +  resets:
>> +    items:
>> +      - description: AXI2PCIe Bridge reset
>> +      - description: Data link layer/transaction layer reset
>> +      - description: Transaction layer (ACLK domain) reset
>> +      - description: Transaction layer (PCLK domain) reset
>> +      - description: Physical layer reset
>> +      - description: Configuration register reset
>> +      - description: Configuration register reset
>> +
>> +  reset-names:
>> +    items:
>> +      - description: aresetn
>> +      - description: rst_b
>> +      - description: rst_gp_b
>> +      - description: rst_ps_b
>> +      - description: rst_rsm_b
>> +      - description: rst_cfg_b
>> +      - description: rst_load_b
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  dma-ranges:
>> +    description:
>> +      A single range for the inbound memory region.
>> +    maxItems: 1
>> +
>> +  renesas,sysc:
>> +    description: System controller phandle
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  vendor-id:
>> +    const: 0x1912
>> +
>> +  device-id:
>> +    const: 0x0033
>> +
>> +  legacy-interrupt-controller:
>> +    description: Interrupt controller node for handling legacy PCI interrupts
>> +    type: object
>> +
>> +    properties:
>> +      "#address-cells":
>> +        const: 0
>> +
>> +      "#interrupt-cells":
>> +        const: 1
>> +
>> +      interrupt-controller: true
>> +
>> +      interrupts:
>> +        items:
>> +          - description: INTA interrupt
>> +          - description: INTB interrupt
>> +          - description: INTC interrupt
>> +          - description: INTD interrupt
>> +
>> +    required:
>> +      - "#address-cells"
>> +      - "#interrupt-cells"
>> +      - interrupt-controller
>> +      - interrupts
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - resets
>> +  - reset-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - interrupt-map
>> +  - interrupt-map-mask
>> +  - power-domains
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - "#interrupt-cells"
>> +  - renesas,sysc
>> +  - vendor-id
>> +  - device-id
>> +
>> +allOf:
>> +  - $ref: /schemas/pci/pci-host-bridge.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    bus {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        gic: interrupt-controller {
>> +            interrupt-controller;
>> +            #interrupt-cells = <3>;
>> +        };
> 
> Drop. Don't need to show provider nodes for the example.

This was needed for the schema to compile with the intx node.

> 
>> +
>> +        pcie@11e40000 {
>> +            compatible = "renesas,r9a08g045s33-pcie";
>> +            reg = <0 0x11e40000 0 0x10000>;
>> +            ranges = <0x03000000 0 0x30000000 0 0x30000000 0 0x8000000>;
>> +            dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0 0x8000000>;
>> +            bus-range = <0x0 0xff>;
>> +            clocks = <&cpg CPG_MOD R9A08G045_PCI_ACLK>,
>> +                     <&cpg CPG_MOD R9A08G045_PCI_CLKL1PM>;
>> +            clock-names = "aclk", "clkl1pm";
>> +            resets = <&cpg R9A08G045_PCI_ARESETN>,
>> +                     <&cpg R9A08G045_PCI_RST_B>,
>> +                     <&cpg R9A08G045_PCI_RST_GP_B>,
>> +                     <&cpg R9A08G045_PCI_RST_PS_B>,
>> +                     <&cpg R9A08G045_PCI_RST_RSM_B>,
>> +                     <&cpg R9A08G045_PCI_RST_CFG_B>,
>> +                     <&cpg R9A08G045_PCI_RST_LOAD_B>;
>> +            reset-names = "aresetn", "rst_b", "rst_gp_b", "rst_ps_b",
>> +                          "rst_rsm_b", "rst_cfg_b", "rst_load_b";
>> +            interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
> 
> It is very odd that you have the INTx interrupts here and below.
> 
> As I mentioned in the driver, you don't need the legacy node any more. 
> Just add 'interrupt-controller' to this node and point interrupt-map to 
> this node.
Will try it like this.

Thank you for your review,
Claudiu

> 
>> +                         <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
>> +            interrupt-names = "int_serr", "int_serr_cor", "int_serr_nonfatal",
>> +                              "int_serr_fatal", "axi_err_int", "inta_rc",
>> +                              "intb_rc", "intc_rc", "intd_rc",
>> +                              "intmsi_rc", "int_link_bandwidth", "int_pm_pme",
>> +                              "dma_int", "pcie_evt_int", "msg_int",
>> +                              "int_all";
>> +            #interrupt-cells = <1>;
>> +            interrupt-map-mask = <0 0 0 7>;
>> +            interrupt-map = <0 0 0 1 &pcie_intx 0>, /* INT A */
>> +                            <0 0 0 2 &pcie_intx 1>, /* INT B */
>> +                            <0 0 0 3 &pcie_intx 2>, /* INT C */
>> +                            <0 0 0 4 &pcie_intx 3>; /* INT D */
>> +            device_type = "pci";
>> +            num-lanes = <1>;
>> +            #address-cells = <3>;
>> +            #size-cells = <2>;
>> +            power-domains = <&cpg>;
>> +            renesas,sysc = <&sysc>;
>> +            vendor-id = <0x1912>;
>> +            device-id = <0x0033>;
>> +
>> +            pcie_intx: legacy-interrupt-controller {
>> +                interrupt-controller;
>> +                #interrupt-cells = <1>;
>> +                #address-cells = <0>;
>> +                interrupt-parent = <&gic>;
>> +                interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
>> +                             <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
>> +                             <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
>> +                             <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
>> +            };
>> +        };
>> +    };
>> +
>> +...
>> -- 
>> 2.43.0
>>


