Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEF6CA1001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 22:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/gIAWzLi/dYVjmDUDiAyhdJpQJDLZnDh9I4LCgtu6Y=; b=ekBpOquqBeeBs+/+xuWZjln2I2
	rfxrn/cccd85FZnylWPFR21XTbIUClc7rBrPoIjF1pi8tqAaI7Ns+uRpLgUzApyw94EYTh5+zbUBq
	rtkz3RhAgUzBFuaBY49xMTjxrDTzZplNedi3DdohoomApnnit2RrZGABM+m36KyIl2kHw3VYhTxCh
	en98RnF2DHlXrNorSnBRnvKTpy8q5maI+HVQaenX0v6XPvY6Ig1pJOKKdCKyvJO7ua5446RAw9KTK
	Fo/gE0oxzP3kf9cwMe+YobQtePqHJG4j9PLB+oeJClS/cmqhKEWoxd3+IDpc6k/t3mMaw/bsnzDWA
	7mBYu+4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urkm4-00000003S87-46DJ;
	Thu, 28 Aug 2025 22:07:16 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uri2T-00000002wvH-0J40
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 19:12:02 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3c6df24f128so851928f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1756408319; x=1757013119; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k/gIAWzLi/dYVjmDUDiAyhdJpQJDLZnDh9I4LCgtu6Y=;
        b=NUsgvZVL+BUE3TOxKKHrcww7llPIB/wpDCe8So0ncFvtTwwkVXL9ak1hgrWktq8gYC
         Ui38+jiEbbnR0d9o5bhIkx6uqiHb3WcOZGlnVVJuCBCLp7PITvoPKhGPcRklvLHHOS86
         M5VTJyllwn8ti6HuNVKqmFTqf5uL5xhF+/Idg2qV4kGYZG0X7mJxETphVB54YKZdYA5s
         s8bVdaSxUOG7VSjyng5iu8xEhXM23S43SFxwnXp99y/7H9NW30e2ADFd1RWZIBeJ+Yvp
         0JLw4RYqru/+orGfYm98CWHfR68ZbjZxIzrn/fqDL/cScOx6YXk0ATCSP3vLckqjtWwu
         3CUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756408319; x=1757013119;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k/gIAWzLi/dYVjmDUDiAyhdJpQJDLZnDh9I4LCgtu6Y=;
        b=ntze1YG+fnsRpnzSCzogdIj5QtGbZgj37iLnHMqjazXA5TdCQ2ShAyWPJaMZ/Wygor
         ZipMAwhnveoX84ScHBnDesOQffOqsrgwioMnxsNtlZU4YPVqz+gQAdNRJn/Iribs0aaL
         D59rnM0qA2O0a41+X0J/LCk9Xg+bdDumjA3k2/2XOwCq28r7FoO8mSYldnqaB8TQAHCC
         TVl6y0L0c4NNoYT6IysIpWFPfprrkTxLNQnibuk7MJDmblItqq7cYadQfX1735jPldnZ
         Hr4R3/VwsUEn6XSE72j40BHhuQ+kTZ9O8923ReF0y8RMc+BWiniJIFntHpxEq2jZVlRn
         eqwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEZOYRd35yLqynFOTfMDf6GdzKekoNU3dbBl0oMukkdF8bcBHYL1uMFF5EJe+z3gReEMUDUdQyyhPdPpj3br9g@lists.infradead.org
X-Gm-Message-State: AOJu0Yyoj4l8whRBZ4HtOE5tBwRqG1F1J1qryqqk9GoWOdmZYO4Ng29q
	Pi+5XtRPAXyFyUZqd8FbjHzs19ud5p/ejj5Gd9s9MY9gbWGFyadQ3FXBVrffnrWYew0=
X-Gm-Gg: ASbGncvV0qEQcuqliqA0Zb6a23JR/GS+Gw84wryVeZWSn4wPAxWAWcC1iSIVlIsQQwz
	VZXSxZ0Zd9JS0ki0Y2YcytjjP5mlG5Jqbn/2vKXj4txCJ9Wtr90uacg/fYcliQCaGSZfTeJxzgT
	elQM4skfwJ4VBZyibH40F3E4pkwfujxsJDB5bdSaopxQFnCVNFzpztmC/BxJZHuncCB95LGCgof
	F2jBg2zqUSOnXYJ8xCdJA41IiY1F81SikmnxFwofhyZfBzcCSZ/Fl4d15z8qfpV7Hd1aVq3xRke
	ZwbZAwSGf2hvltUE1n0I+X0h14dxAvCfSdIK0QcDB6tFqnCf6bBSkWSQcotqmkd/p9JazhbHo90
	BkQOeO/nk/eva/ZaPvBG+QOsRTaxF95mZzRIAKvqgZoa1dMhahQ4oqy+tPTnPwZKPjLc+fPCZkh
	fXThip+p9n87MQ
X-Google-Smtp-Source: AGHT+IGVuJymha8VKQyO64M6kJMfy+4YYQgBArp3qJU6xZoYfGieRMXhDd0nPPTezX5Ph1gUf3sViw==
X-Received: by 2002:a05:6000:430c:b0:3c7:a2d5:b299 with SMTP id ffacd0b85a97d-3c7a2e4fee4mr14496227f8f.17.1756408319369;
        Thu, 28 Aug 2025 12:11:59 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6103:4200:a4c6:4e84:e72c:19fd? ([2a02:2f04:6103:4200:a4c6:4e84:e72c:19fd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf270fc09bsm398093f8f.11.2025.08.28.12.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 12:11:58 -0700 (PDT)
Message-ID: <fe7afeb5-e009-4f68-a3a8-58ff967d3780@tuxon.dev>
Date: Thu, 28 Aug 2025 22:11:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add
 documentation for the PCIe IP on Renesas RZ/G3S
From: claudiu beznea <claudiu.beznea@tuxon.dev>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, lizhi.hou@amd.com, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250708163407.GA2149616@bhelgaas>
 <71d109a1-211a-45ee-8525-03f1859b789a@tuxon.dev>
Content-Language: en-US
In-Reply-To: <71d109a1-211a-45ee-8525-03f1859b789a@tuxon.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_121201_121880_57C9E766 
X-CRM114-Status: GOOD (  25.28  )
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

Hi, Bjorn,

On 8/8/25 14:25, Claudiu Beznea wrote:
> Hi, Bjorn,
> 
> On 08.07.2025 19:34, Bjorn Helgaas wrote:
>> On Fri, Jul 04, 2025 at 07:14:04PM +0300, Claudiu wrote:
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> The PCIe IP available on the Renesas RZ/G3S complies with the PCI Express
>>> Base Specification 4.0. It is designed for root complex applications and
>>> features a single-lane (x1) implementation. Add documentation for it.
>>
>>> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
>>
>> The "r9a08g045s33" in the filename seems oddly specific.  Does it
>> leave room for descendants of the current chip that will inevitably be
>> added in the future?  Most bindings are named with a fairly generic
>> family name, e.g., "fsl,layerscape", "hisilicon,kirin", "intel,
>> keembay", "samsung,exynos", etc.
>>
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +
>>> +    bus {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +
>>> +        pcie@11e40000 {
>>> +            compatible = "renesas,r9a08g045s33-pcie";
>>> +            reg = <0 0x11e40000 0 0x10000>;
>>> +            ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>;
>>> +            dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0 0x38000000>;
>>> +            bus-range = <0x0 0xff>;
>>> +            clocks = <&cpg CPG_MOD R9A08G045_PCI_ACLK>,
>>> +                     <&cpg CPG_MOD R9A08G045_PCI_CLKL1PM>;
>>> +            clock-names = "aclk", "pm";
>>> +            resets = <&cpg R9A08G045_PCI_ARESETN>,
>>> +                     <&cpg R9A08G045_PCI_RST_B>,
>>> +                     <&cpg R9A08G045_PCI_RST_GP_B>,
>>> +                     <&cpg R9A08G045_PCI_RST_PS_B>,
>>> +                     <&cpg R9A08G045_PCI_RST_RSM_B>,
>>> +                     <&cpg R9A08G045_PCI_RST_CFG_B>,
>>> +                     <&cpg R9A08G045_PCI_RST_LOAD_B>;
>>> +            reset-names = "aresetn", "rst_b", "rst_gp_b", "rst_ps_b",
>>> +                          "rst_rsm_b", "rst_cfg_b", "rst_load_b";
>>> +            interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
>>> +            interrupt-names = "serr", "serr_cor", "serr_nonfatal",
>>> +                              "serr_fatal", "axi_err", "inta",
>>> +                              "intb", "intc", "intd", "msi",
>>> +                              "link_bandwidth", "pm_pme", "dma",
>>> +                              "pcie_evt", "msg", "all";
>>> +            #interrupt-cells = <1>;
>>> +            interrupt-controller;
>>> +            interrupt-map-mask = <0 0 0 7>;
>>> +            interrupt-map = <0 0 0 1 &pcie 0 0 0 0>, /* INT A */
>>> +                            <0 0 0 2 &pcie 0 0 0 1>, /* INT B */
>>> +                            <0 0 0 3 &pcie 0 0 0 2>, /* INT C */
>>> +                            <0 0 0 4 &pcie 0 0 0 3>; /* INT D */
>>
>> The spec styles these closed up: "INTA", "INTB", etc.
> 
> I'll update it.
> 
>>
>>> +            device_type = "pci";
>>> +            num-lanes = <1>;
>>> +            #address-cells = <3>;
>>> +            #size-cells = <2>;
>>> +            power-domains = <&cpg>;
>>> +            vendor-id = <0x1912>;
>>> +            device-id = <0x0033>;
>>
>> Some of this is specific to a Root Port, not to the Root Complex as a
>> whole.  E.g., device-type = "pci", num-lanes, vendor-id, device-id,
>> are Root Port properties.  Some of the resets, clocks, and interrupts
>> might be as well.
>>
>> I really want to separate those out because even though this
>> particular version of this PCIe controller only supports a single Root
>> Port, there are other controllers (and possibly future iterations of
>> this controller) that support multiple Root Ports, and it makes
>> maintenance easier if the DT bindings and the driver structures are
>> similar.
> 
> I'll ask the Renesas HW team about the resets and clocks as the HW manual
> don't offer any information about this.

Renesas HW team replied to me that there are no clock, reset, or interrupt 
signals dedicated specifically to the Root Port. All these signals are shared 
across the PCIe system.

Taking this and your suggestions into account, I have prepared the following 
device tree:

pcie: pcie@11e40000 {
	compatible = "renesas,r9a08g045-pcie";
	reg = <0 0x11e40000 0 0x10000>;
	ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>;
	/* Map all possible DRAM ranges (4 GB). */
	dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0x1 0x0>;
	bus-range = <0x0 0xff>;
	interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
		     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
		     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
		     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
		     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
		     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
		     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
		     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
		     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
		     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
		     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
		     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
		     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
		     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
		     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
		     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
	interrupt-names = "serr", "serr_cor", "serr_nonfatal",
			  "serr_fatal", "axi_err", "inta",
			  "intb", "intc", "intd", "msi",
			  "link_bandwidth", "pm_pme", "dma",
			  "pcie_evt", "msg", "all";
	#interrupt-cells = <1>;
	interrupt-controller;
	interrupt-map-mask = <0 0 0 7>;
	interrupt-map = <0 0 0 1 &pcie 0 0 0 0>, /* INTA */
			<0 0 0 2 &pcie 0 0 0 1>, /* INTB */
			<0 0 0 3 &pcie 0 0 0 2>, /* INTC */
			<0 0 0 4 &pcie 0 0 0 3>; /* INTD */
	clocks = <&cpg CPG_MOD R9A08G045_PCI_ACLK>,
		 <&cpg CPG_MOD R9A08G045_PCI_CLKL1PM>;
	clock-names = "aclk", "pm";
	resets = <&cpg R9A08G045_PCI_ARESETN>,
		 <&cpg R9A08G045_PCI_RST_B>,
		 <&cpg R9A08G045_PCI_RST_GP_B>,
		 <&cpg R9A08G045_PCI_RST_PS_B>,
		 <&cpg R9A08G045_PCI_RST_RSM_B>,
		 <&cpg R9A08G045_PCI_RST_CFG_B>,
		 <&cpg R9A08G045_PCI_RST_LOAD_B>;
	reset-names = "aresetn", "rst_b", "rst_gp_b", "rst_ps_b",
		      "rst_rsm_b", "rst_cfg_b", "rst_load_b";
	power-domains = <&cpg>;
	device_type = "pci";
	#address-cells = <3>;
	#size-cells = <2>;
	renesas,sysc = <&sysc>;
	status = "disabled";

	pcie_port0: pcie@0,0 {
		reg = <0x0 0x0 0x0 0x0 0x0>;
		ranges;
		clocks = <&versa3 5>;
		clock-names = "ref";
		device_type = "pci";
		vendor-id = <0x1912>;
		device-id = <0x0033>;
		bus-range = <0x1 0xff>;
		#address-cells = <3>;
		#size-cells = <2>;
	};
};

and added clocks in the port section, populated with the reference clock that is 
provided by a board specific clock generator (that I failed to noticed 
previously on schematics; this clock is always on).

Please let me know if you find something wrong with this format.

Thank you,
Claudiu


> 
> If they will confirm some of the clocks and/or resets could be controlled
> as part of a port then patch 3/9 "PCI: of_property: Restore the arguments
> of the next level parent" in this series will not be needed anymore. Would
> you prefer me to abandon it or post it as individual patch, if any?
> 
>>
>> This email includes pointers to sample DT bindings and driver code
>> that is structured to allow multiple Root Ports:
>>
>>    https://lore.kernel.org/linux-pci/20250625221653.GA1590146@bhelgaas/
> 
> Thank you for this!
> 
> And, thank you for your review,
> Claudiu
> 
>>
>> Bjorn
> 


