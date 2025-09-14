Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3FACAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 12:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6My8g8ijlC6ggM3Nx6OmXgJVfqUSxwxL444mCRnJ11g=; b=Geu26AjIsGTWL2VvpMPosfHBtM
	HgnZTskuNZA1HUqxKWhDdy0rt1LTcUwN4GcWHi/jYGtJNBbAhGX1yMQW25CwQuW0pA1tRcZKLkKq+
	iF1PyLY/SGQ9YUZKc7jqUkaYsNGWMw+SzaaMr033nIkn6wmoNDguPREUUIDcBXl8kKwl8vvBXarbY
	8Gml7AJ6Ow3Ibi1RS+T3/O0fIAN/OkbWSD0To1b9Ey2WZwCU0IHlVfKDIQbJaAbgfJZwxpM1a+ZfC
	LVN5iBJmmHSxofphYDlzc3kmIJNmK4OZUcO8WSNYszF4R51IIe3f5o4DjFaGGaoe/OWTUj2lh+thn
	XZdoAVvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlwb-00000001A10-3IGY;
	Sun, 14 Sep 2025 12:35:01 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlwZ-000000019yz-1BVc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 12:35:00 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b04770a25f2so450176966b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 05:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757853297; x=1758458097; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6My8g8ijlC6ggM3Nx6OmXgJVfqUSxwxL444mCRnJ11g=;
        b=GSkeTyV6zimbLCUQN+M+aPm5jiMq06zovPp7tpInXYkcsPJ/Jys6pwbPXtbzqOr47d
         xaFUwLFpf1Yu2Lo1VzUgiw8pfGAsnZ7fm+r+w/H5Xz/OG2U4WtLawM5Xw+dYmd4dGRh5
         2ArZylVYdkDX4jMfayu3Dhf4AYc12Z0381G3cNZRvzb2VcELsFon1gy2V3ag7zEvhokI
         4LABDIrHnrjy/deEjhaHWWsnYZzudRN0fLVP0090a7ud/Y9whOnIe1kaLPi/O069kSBH
         hN6PeiLSM0f6NxHUO0OroqdgxkZtTDRhnLmto+o2pRCW4clMq+nMYEyPWfzbszCtZTcZ
         n9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757853297; x=1758458097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6My8g8ijlC6ggM3Nx6OmXgJVfqUSxwxL444mCRnJ11g=;
        b=ufdh41fBJC9mWUWHzaoEfWu9djJkviyFlzA9PuT62rlt/aWEWJFQmmic2wR4MiQAUj
         oAUa/BJ8OfIQePdUgOixVQcyKPHCpOQ/PZ26zesvckHfjfnMTgXULHm7uT8pxbgLtkNe
         xp9VKqZEf8FhuE1c2p2N97d8xrVF6RsW8y50kvocc2tsRc7ja04Rr82Rdtq4W2MwhgJY
         8v45Ba4hjrLt/1Ibo43Ouphg9QPNYFVgs1sqs1m2n1zwXsu0wGccrnSP6cRZIh3wwz4o
         8OoCPYxstahHQrc+D5JSEEYChEXhPdgt1lUedWc3Cq6G/7Lfe6+dX00F4vRGHr3PJXPT
         PcLA==
X-Forwarded-Encrypted: i=1; AJvYcCWfSgs/RLQyrIxMU7OMGfNtxyTKN0qW4dbJP5utrAK7WgnII8jnXZSWatqg+DsA/q6m23dqnVNpMDkZk6sSY32r@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe5nehcHtSKhssu71VMmvTDmeEmlsXjVBow5ruQWH8OWFfqlOW
	g1Z1risxFVrXeWmsdjYw2IeEJBQqesH368SYPNu+pnQhkFIj6OEEsRb8inMTgp2gPDDTkfNix6G
	dp6cUqPBASvKGgt+zV/EtZK3zOoyhvbf4ohi3ABQToQ==
X-Gm-Gg: ASbGncvYIP9vOghzLUghjzQ7oA/zIc1s+Wh3u9C8Baccs/6KxAt1v+jeDpZpzpds/Of
	BgxKF2Ovcdv8TpyG366brrciyF/4db3VaF5Owbug2sJkNvGPEL6TeKM28YrUl3+0uBrcTukanzl
	y3AW6Y0VdcW4O+VS24wLiuKNYIyBIlATmtRzsOFeo78Nw7QXqvhvlFsDoHYuxGgLtX12dgfCAEh
	e7k5E//exWs4Ucs880jbuEyOWRLag0ntC4utA7qiM2ySRg=
X-Google-Smtp-Source: AGHT+IE9iMZLipi8SbmYOlVHFkjWHvFeGW1GqsUB94IHXcDFtD/+YhZqBpHxrpl4wzzT0r2J3Pq8q72gpM+PxQoXhrE=
X-Received: by 2002:a17:907:7f87:b0:b0e:d477:4961 with SMTP id
 a640c23a62f3a-b0ed477740fmr113747966b.23.1757853296988; Sun, 14 Sep 2025
 05:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250912141436.2347852-1-vincent.guittot@linaro.org>
 <20250912141436.2347852-2-vincent.guittot@linaro.org> <aMSHsoLHGUBoWX8e@lizhi-Precision-Tower-5810>
In-Reply-To: <aMSHsoLHGUBoWX8e@lizhi-Precision-Tower-5810>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Sun, 14 Sep 2025 14:34:44 +0200
X-Gm-Features: Ac12FXyj3Q4Ir_GGRHAULDx1O8xgannDkGizhiAuLvket8uRGtmjSHnXquF9Gho
Message-ID: <CAKfTPtBh3jvEQF09sL8g7Zeru+WvtQO31UFZEZDx1DYJ8RCK3w@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: pcie: Add the NXP PCIe controller
To: Frank Li <Frank.li@nxp.com>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com, 
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_053459_377233_44BC44D5 
X-CRM114-Status: GOOD (  38.93  )
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

On Fri, 12 Sept 2025 at 22:51, Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Sep 12, 2025 at 04:14:33PM +0200, Vincent Guittot wrote:
> > Describe the PCIe controller available on the S32G platforms.
>
> can you cc imx@lists.linux.dev next time? suppose most part is similar with
> imx and layerscape chips.

Ok will do

>
> >
> > Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> > Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> > Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  .../devicetree/bindings/pci/nxp,s32-pcie.yaml | 169 ++++++++++++++++++
> >  1 file changed, 169 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml b/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
> > new file mode 100644
> > index 000000000000..287596d7162d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
> > @@ -0,0 +1,169 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pci/nxp,s32-pcie.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP S32G2xx/S32G3xx PCIe controller
> > +
> > +maintainers:
> > +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > +  - Ionut Vicovan <ionut.vicovan@nxp.com>
> > +
> > +description:
> > +  This PCIe controller is based on the Synopsys DesignWare PCIe IP.
> > +  The S32G SoC family has two PCIe controllers, which can be configured as
> > +  either Root Complex or End Point.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - nxp,s32g2-pcie     # S32G2 SoCs RC mode
> > +      - items:
> > +          - const: nxp,s32g3-pcie
> > +          - const: nxp,s32g2-pcie
> > +
> > +  reg:
> > +    minItems: 7
>
> If minItems is the same maxItems, needn't minItems.

Ok, I didn't know that

>
> > +    maxItems: 7
> > +
> > +  reg-names:
> > +    items:
> > +      - const: dbi
> > +      - const: dbi2
> > +      - const: atu
> > +      - const: dma
> > +      - const: ctrl
> > +      - const: config
> > +      - const: addr_space
> > +
> > +  interrupts:
> > +    minItems: 8
> > +    maxItems: 8
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: link_req_stat
> > +      - const: dma
> > +      - const: msi
> > +      - const: phy_link_down
> > +      - const: phy_link_up
> > +      - const: misc
> > +      - const: pcs
> > +      - const: tlp_req_no_comp
>
> use - for names

Yes, I forgot to change this

>
> > +
> > +  msi-parent:
> > +    description:
> > +      Use this option to reference the GIC controller node which will
> > +      handle the MSIs. This property can be used only in Root Complex mode.
> > +      The msi-parent node must be declared as "msi-controller" and the list of
> > +      available SPIs that can be used must be declared using "mbi-ranges".
> > +      If "msi-parent" is not present in the PCIe node, MSIs will be handled
> > +      by iMSI-RX -Integrated MSI Receiver [AXI Bridge]-, an integrated
> > +      MSI reception module in the PCIe controller's AXI Bridge which
> > +      detects and terminates inbound MSI requests (received on the RX wire).
> > +      These MSIs no longer appear on the AXI bus, instead a hard-wired
> > +      interrupt is raised, documented as "DSP AXI MSI Interrupt" in the SoC
> > +      Reference Manual.
>
> Don't need description for this common property.
>
> msi-parent for pcie devices is most likely wrong. It should use msi-map.

Ok, I'm going to have a look.

>
> > +
> > +  nxp,phy-mode:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: Select PHY mode for PCIe controller
> > +    enum:
> > +      - crns  # Common Reference Clock, No Spread Spectrum
> > +      - crss  # Common Reference Clock, Spread Spectrum
> > +      - srns  # Separate reference Clock, No Spread Spectrum
> > +      - sris  # Separate Reference Clock, Independent Spread Spectrum
> > +
> > +  max-link-speed:
> > +    description:
> > +      The max link speed is normaly Gen3, but can be enforced to a lower value
> > +      in case of special limitations.
>
> needn't description here.

ok

>
> > +    maximum: 3
> > +
> > +  num-lanes:
> > +    description:
> > +      Max bus width (1 or 2); it is the number of physical lanes
>
> needn't description here.

ok

>
> > +    minimum: 1
> > +    maximum: 2
> > +
> > +allOf:
> > +  - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - interrupt-names
> > +  - ranges
> > +  - nxp,phy-mode
> > +  - num-lanes
> > +  - phys
> > +
> > +additionalProperties: true
>
> unevaluatedProperties: false
>
> because you refs to /schemas/pci/snps,dw-pcie-common.yaml
>
> You can send to me do internal review before you post to upstream.

ok, thanks

>
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/phy/phy.h>
> > +
> > +    bus {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        pcie0: pcie@40400000 {
>
> Needn't label "pcie0"

ok

>
> > +            compatible = "nxp,s32g3-pcie",
> > +                         "nxp,s32g2-pcie";
> > +            dma-coherent;
> > +            reg = <0x00 0x40400000 0x0 0x00001000>,   /* dbi registers */
> > +                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 registers */
> > +                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers */
> > +                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers */
> > +                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl registers */
> > +                  /* RC configuration space, 4KB each for cfg0 and cfg1
> > +                   * at the end of the outbound memory map
> > +                   */
> > +                  <0x5f 0xffffe000 0x0 0x00002000>,
> > +                  <0x58 0x00000000 0x0 0x40000000>; /* 1GB EP addr space */
> > +                  reg-names = "dbi", "dbi2", "atu", "dma", "ctrl",
> > +                              "config", "addr_space";
> > +                  #address-cells = <3>;
> > +                  #size-cells = <2>;
> > +                  device_type = "pci";
> > +                  ranges =
> > +                  /* downstream I/O, 64KB and aligned naturally just
> > +                   * before the config space to minimize fragmentation
> > +                   */
> > +                  <0x81000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x00010000>,
> > +                  /* non-prefetchable memory, with best case size and
> > +                  * alignment
> > +                   */
> > +                  <0x82000000 0x0 0x00000000 0x58 0x00000000 0x7 0xfffe0000>;
> > +
> > +                  nxp,phy-mode = "crns";
> > +                  bus-range = <0x0 0xff>;
> > +                  interrupts =  <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
> > +                                <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
> > +                                <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
> > +                                <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
> > +                                <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
> > +                                <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> > +                                <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> > +                                <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
> > +                  interrupt-names = "link_req_stat", "dma", "msi",
> > +                                    "phy_link_down", "phy_link_up", "misc",
> > +                                    "pcs", "tlp_req_no_comp";
> > +                  #interrupt-cells = <1>;
> > +                  interrupt-map-mask = <0 0 0 0x7>;
> > +                  interrupt-map = <0 0 0 1 &gic 0 0 0 128 4>,
> > +                                  <0 0 0 2 &gic 0 0 0 129 4>,
> > +                                  <0 0 0 3 &gic 0 0 0 130 4>,
> > +                                  <0 0 0 4 &gic 0 0 0 131 4>;
>
> use pre define macro
>
> <0 0 0 1 &gic GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,

yes

>
> > +                  msi-parent = <&gic>;
>
> Suppose it is wrong for pcie



>
> you should use msi-map
>
> Frank
> > +
> > +                  num-lanes = <2>;
> > +                  phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
> > +        };
> > +    };
> > --
> > 2.43.0
> >

