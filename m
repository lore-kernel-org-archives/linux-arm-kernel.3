Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4129ACAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 08:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQP36cCGX22q0k7IcTILlGwR80arCJaxhV/jopp91Nw=; b=v7oerdl1KQU+r6KWwTySkz/yG1
	sTsP5t2xXjbOxpLHDMztg9LaW0GaUu6lo2FVGbvv41bG1erK6iYFAv2wX6/3yNsTRlL22b/IKGImT
	zZAVjab8Ly4isd/jbEny0mWPFamoWApPX75H4lgh+iVZyL7WWVdgHbaOrEmGjFV1jZ13ZmZA1NDpu
	d01ktt+1qq2Twd6sZEb03q4Gd4MZt12VXLvnbPyXu+4+8iv4LIQd0BYipmRoTM1rBQaWSgpGTAjWq
	gPEqHdqJKb9eD9gNsomaFWUJF+fNUcykQIThbNpiryo0RrWf9qfMwskX6w96nvh4aDMTV8HgngN7q
	HERz0T2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQlz-000000078C4-3D7n;
	Tue, 16 Sep 2025 08:10:47 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQlx-000000078B6-20bO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 08:10:46 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-62f1987d49fso1541594a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 01:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758010243; x=1758615043; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UQP36cCGX22q0k7IcTILlGwR80arCJaxhV/jopp91Nw=;
        b=JrWWZEghVAT7bR9e/Y4PqRSZq7BOI5Jeuekfe6XpGZmtTC0yQrR0/OJu5dZYVE9ASD
         CTxdPq/iBmmYeWHVm9StYjpFWrEIvfuBCkHgZYjVEIyjMfPTy5umidsNOEVxoudFBEZL
         k1fhIevAwFdysMWqlgleJyXnI97laYLOxeTfmoTMGhRD+ddBr/jejVJe70oD9DcgWUwL
         LCSAS4o7TOgqKVTYrAS/+5O305PTIiZfnmDPpdl10+k4caAXeMItM8Tv+lDVoxtjHv+y
         duDIJnRfNcNeiPjNQiyfZr7gjymkPk0bY0der0ev+kacABHyWrqWBCt4q9I2VC9qsC0z
         bQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758010243; x=1758615043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQP36cCGX22q0k7IcTILlGwR80arCJaxhV/jopp91Nw=;
        b=jMlShjcthzifle+1N7SLpxrL+1n08Krzk9cza0ED668tkpuryhi3ThUkMcXN4OL4AG
         elXO0SnZc9NUX15DaW2T4z/mhI4HMAZVwJZWITkBsRjp1uznc6Rh85rLEdJHOTaszZPp
         a7ELsIP1ddF/AHpBpebj3S40JETbKcVwAdTY1cu7qwbPAzLihqSJh+7xTU9zX9J2b/sS
         JFL/ZWszSevDR5BJBnyTKan/UKxUYBj9DWOn75qv9A8CFxkrKMRk9OKLzdAnPpByUiiW
         +w03s/UPqWaEUpbmT22QHKVhBjQdRQGqFW5p91HN/xSBlPmmYkStmmO1Fb0Pwml847pq
         Ce2g==
X-Forwarded-Encrypted: i=1; AJvYcCU/aWpdkgXC7MVVQl6V1FJFt0mIFgFmSrXS+1Tbrq7Fp0DQPXLIVWKkM7Z82wn/wJwr4/JaoIY0wL6aALQUQEvG@lists.infradead.org
X-Gm-Message-State: AOJu0YyAEMZCkbgQGGX8DSYd8y2vZt1eBeACnXf7WiNz7cs/4kZjjDfx
	Bp7VOJNLBuRlao0y8rH1DiV7K5eHSswPbAG+QJp3U/3TJDH47bykZIq1k/IOiPdAacitNBBhc7H
	IYwbU1xZOXCwuXeQgdH5mIfSMuWgCruvjU4sl7pRP1A==
X-Gm-Gg: ASbGnctDACckEbuekUKkO7LQPWB06ia02Pku2GABlYfAD0F6q1rY1CtSNsc9KOjJsS6
	JLxY/uoFDp2VgN1HCb0jbBLMc5Mew/WvsxC4OoBgGanbVGPAKSQ88mugGwsvvftrpksZsr5jas6
	PkEKtb7pRFCqHllZoA9zTXLDM1ZYvQUc0hNFkdqJWfMPxm6sWw/g3agyxT7NCDoVbyIDR7J3FD1
	aSqSPcoAJAX+cC2nyAx1iCZDf9WkB2geaQ=
X-Google-Smtp-Source: AGHT+IF8s86824Z4r7SF4kEEtmlZBj5WGTNQHb7gb6RUflmAIF+L7mlo4qsXpdhcViNzJxq7Yyu7oe3gXzf0tllMkEY=
X-Received: by 2002:a05:6402:5cb:b0:62f:5424:7371 with SMTP id
 4fb4d7f45d1cf-62f54247560mr3409565a12.8.1758010243107; Tue, 16 Sep 2025
 01:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250912141436.2347852-2-vincent.guittot@linaro.org>
 <20250912225004.GA1651547@bhelgaas> <CAKfTPtCfjJ8-30aAeEyigeLyuKtTq+k6PQg+5w4-0Wa7pduZvg@mail.gmail.com>
In-Reply-To: <CAKfTPtCfjJ8-30aAeEyigeLyuKtTq+k6PQg+5w4-0Wa7pduZvg@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 16 Sep 2025 10:10:31 +0200
X-Gm-Features: AS18NWDYHx07ASF7wSVWhK8zmCGbokPhdl-skcD1HANsfet_AGVNQ3t6EmLGaps
Message-ID: <CAKfTPtDog36hBZ0XvhC-NyfL0SwB5ve53nLFpofToKt1ebhuGQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: pcie: Add the NXP PCIe controller
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com, 
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_011045_579613_C8D6DC21 
X-CRM114-Status: GOOD (  37.81  )
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

On Sun, 14 Sept 2025 at 14:35, Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> On Sat, 13 Sept 2025 at 00:50, Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > On Fri, Sep 12, 2025 at 04:14:33PM +0200, Vincent Guittot wrote:
> > > Describe the PCIe controller available on the S32G platforms.
> > >
> > > Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > > Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > > Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> > > Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> > > Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> > > Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> > > Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > > Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > > Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > > Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > > Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > ---
> > >  .../devicetree/bindings/pci/nxp,s32-pcie.yaml | 169 ++++++++++++++++++
> > >  1 file changed, 169 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml b/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
> > > new file mode 100644
> > > index 000000000000..287596d7162d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
> > > @@ -0,0 +1,169 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pci/nxp,s32-pcie.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: NXP S32G2xx/S32G3xx PCIe controller
> > > +
> > > +maintainers:
> > > +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > > +  - Ionut Vicovan <ionut.vicovan@nxp.com>
> > > +
> > > +description:
> > > +  This PCIe controller is based on the Synopsys DesignWare PCIe IP.
> > > +  The S32G SoC family has two PCIe controllers, which can be configured as
> > > +  either Root Complex or End Point.
> >
> > s/End Point/Endpoint/ to match spec usage.
>
> Ok
>
> >
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - enum:
> > > +          - nxp,s32g2-pcie     # S32G2 SoCs RC mode
> > > +      - items:
> > > +          - const: nxp,s32g3-pcie
> > > +          - const: nxp,s32g2-pcie
> > > +
> > > +  reg:
> > > +    minItems: 7
> > > +    maxItems: 7
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: dbi
> > > +      - const: dbi2
> > > +      - const: atu
> > > +      - const: dma
> > > +      - const: ctrl
> > > +      - const: config
> > > +      - const: addr_space
> > > +
> > > +  interrupts:
> > > +    minItems: 8
> > > +    maxItems: 8
> > > +
> > > +  interrupt-names:
> > > +    items:
> > > +      - const: link_req_stat
> > > +      - const: dma
> > > +      - const: msi
> > > +      - const: phy_link_down
> > > +      - const: phy_link_up
> > > +      - const: misc
> > > +      - const: pcs
> > > +      - const: tlp_req_no_comp
> > > +
> > > +  msi-parent:
> > > +    description:
> > > +      Use this option to reference the GIC controller node which will
> > > +      handle the MSIs. This property can be used only in Root Complex mode.
> > > +      The msi-parent node must be declared as "msi-controller" and the list of
> > > +      available SPIs that can be used must be declared using "mbi-ranges".
> > > +      If "msi-parent" is not present in the PCIe node, MSIs will be handled
> > > +      by iMSI-RX -Integrated MSI Receiver [AXI Bridge]-, an integrated
> > > +      MSI reception module in the PCIe controller's AXI Bridge which
> > > +      detects and terminates inbound MSI requests (received on the RX wire).
> > > +      These MSIs no longer appear on the AXI bus, instead a hard-wired
> > > +      interrupt is raised, documented as "DSP AXI MSI Interrupt" in the SoC
> > > +      Reference Manual.
> > > +
> > > +  nxp,phy-mode:
> > > +    $ref: /schemas/types.yaml#/definitions/string
> > > +    description: Select PHY mode for PCIe controller
> > > +    enum:
> > > +      - crns  # Common Reference Clock, No Spread Spectrum
> > > +      - crss  # Common Reference Clock, Spread Spectrum
> > > +      - srns  # Separate reference Clock, No Spread Spectrum
> > > +      - sris  # Separate Reference Clock, Independent Spread Spectrum
> > > +
> > > +  max-link-speed:
> > > +    description:
> > > +      The max link speed is normaly Gen3, but can be enforced to a lower value
> > > +      in case of special limitations.
> >
> > s/normaly/normally/
> >
> > But I doubt you need this here at all.
>
> I'm going to remove the description
>
> >
> > > +    maximum: 3
> > > +
> > > +  num-lanes:
> > > +    description:
> > > +      Max bus width (1 or 2); it is the number of physical lanes
> > > +    minimum: 1
> > > +    maximum: 2
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - reg-names
> > > +  - interrupts
> > > +  - interrupt-names
> > > +  - ranges
> > > +  - nxp,phy-mode
> > > +  - num-lanes
> > > +  - phys
> > > +
> > > +additionalProperties: true
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/phy/phy.h>
> > > +
> > > +    bus {
> > > +        #address-cells = <2>;
> > > +        #size-cells = <2>;
> > > +
> > > +        pcie0: pcie@40400000 {
> > > +            compatible = "nxp,s32g3-pcie",
> > > +                         "nxp,s32g2-pcie";
> > > +            dma-coherent;
> > > +            reg = <0x00 0x40400000 0x0 0x00001000>,   /* dbi registers */
> > > +                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 registers */
> > > +                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers */
> > > +                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers */
> > > +                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl registers */
> > > +                  /* RC configuration space, 4KB each for cfg0 and cfg1
> > > +                   * at the end of the outbound memory map
> > > +                   */
> > > +                  <0x5f 0xffffe000 0x0 0x00002000>,
> > > +                  <0x58 0x00000000 0x0 0x40000000>; /* 1GB EP addr space */
> > > +                  reg-names = "dbi", "dbi2", "atu", "dma", "ctrl",
> > > +                              "config", "addr_space";
> > > +                  #address-cells = <3>;
> > > +                  #size-cells = <2>;
> > > +                  device_type = "pci";
> > > +                  ranges =
> > > +                  /* downstream I/O, 64KB and aligned naturally just
> > > +                   * before the config space to minimize fragmentation
> > > +                   */
> > > +                  <0x81000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x00010000>,
> > > +                  /* non-prefetchable memory, with best case size and
> > > +                  * alignment
> > > +                   */
> > > +                  <0x82000000 0x0 0x00000000 0x58 0x00000000 0x7 0xfffe0000>;
> > > +
> > > +                  nxp,phy-mode = "crns";
> > > +                  bus-range = <0x0 0xff>;
> > > +                  interrupts =  <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
> > > +                  interrupt-names = "link_req_stat", "dma", "msi",
> > > +                                    "phy_link_down", "phy_link_up", "misc",
> > > +                                    "pcs", "tlp_req_no_comp";
> > > +                  #interrupt-cells = <1>;
> > > +                  interrupt-map-mask = <0 0 0 0x7>;
> > > +                  interrupt-map = <0 0 0 1 &gic 0 0 0 128 4>,
> > > +                                  <0 0 0 2 &gic 0 0 0 129 4>,
> > > +                                  <0 0 0 3 &gic 0 0 0 130 4>,
> > > +                                  <0 0 0 4 &gic 0 0 0 131 4>;
> > > +                  msi-parent = <&gic>;
> > > +
> > > +                  num-lanes = <2>;
> > > +                  phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
> >
> > num-lanes and phys are properties of a Root Port, not the host bridge.
> > Please put them in a separate stanza.  See this for details and
> > examples:
> >
> >   https://lore.kernel.org/linux-pci/20250625221653.GA1590146@bhelgaas/
>
> Ok, I'm going to have a look

This driver relies on dw_pcie_host_init() to get common resources like
num-lane which doesn't look at childs to get num-lane.

I have to keep num-lane in the pcie node. Having this in mind should I
keep phys as well as they are both linked ?

>
> >
> > > +        };
> > > +    };
> > > --
> > > 2.43.0
> > >

