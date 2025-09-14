Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FA3CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 12:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZRPj8VFGD82gxi1pIqE3YbUy5FZEodVqHSWuZV8rz0=; b=Jm3DcvRIuWO6coQzB4FB34xuIs
	ztJs/6L7zy13FvMVUg7xkj21f7i3v7S6tB5dpOZrNo71g4yLPDFvzKFneqB/8hOaW3YxY4s2opGPf
	AgZUvGXMuBAgJCz9F5J3pBOIoiJgQ0lYXOkCKXl6QAhj9sQTGpm/HNU2E4S09w4GU7rNA+8kylC1v
	WirJio13lrA+67HUijSOnFRLjegzP7TGzgsHF70t57pk5u+oFashJHlNdN6ZFsFC8aDIgo2Yl90mq
	9lX+WXlhXD9XSXZnng4gu9nzuL6ZBa5ARM+mlIEZXbUs7SsGGsVUkEmWRO0eX2tRMkWTjjdkpaqM5
	ObR98zLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlx5-00000001A83-0kRR;
	Sun, 14 Sep 2025 12:35:31 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlx2-00000001A7S-0hW9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 12:35:29 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-62f330eeb86so428972a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 05:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757853326; x=1758458126; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kZRPj8VFGD82gxi1pIqE3YbUy5FZEodVqHSWuZV8rz0=;
        b=RoHWDEgstuVyp8AvzERyJ6X9gLl8Y1K8aY5+Lct7i+EdXKKj/r9BHZMlzc01q+k+VB
         xWLeb7YyCRvJSA7K30Kibtonp0S8QOqW+upmO+L2X4PeOsG6E0ZBWSnS3rFMa5Xk0EWu
         RNATtbJIKRPBhbsTgRbj/OfFKSXvuia8DQHvPBH3UiuuPxbiIW/4pJikqOD1y6Mzjstb
         kdswGBQzJzOmM4cmOpB2fi3CwA0qkX8l9XfsnZS2gQRBbVibCv7Z56iaaQdWr0jZSw5C
         r3HPCBz65GHbXG2UdClIVMbRUo/WzJNOYOnInEDf2iVZ2wPw2pn5YCfMCbbJMPuKzHwa
         G6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757853326; x=1758458126;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZRPj8VFGD82gxi1pIqE3YbUy5FZEodVqHSWuZV8rz0=;
        b=CuyRzKRw0kjrbPJ1UeRx0bEqJAz6p+sT21iZiUBoV6W/dkQO0Oo/4gl2tL2cyzNzwn
         e8KBARBpeptOdQ9AvRyr07UkTC6/AW4CMVBMmun4oiA2HnXwutm4P6b0euksRjLkhAbB
         NTPHEboaVva8sKOcaIyvkx0zo683wd4c7O60D5hCGI/2imzAR+ynvAEhlaR8nLN7QP6s
         yjZ5Izo41zlFP57uKxMnrn/dc45M4z5xBxpqv1kSAmQTNA90dyDfWO5GmQSxhEdVWgPC
         o56DRU3GN6t5hPeWE0clEF78PMt6iedYEHaZo6v4exn+xBt2sg70YiGpEUcq+iGWcQaD
         6fbg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ3kDCk8IvpPUGEaUfnewP3Wk/35Zvsp4JlLEcjuUzgaMwH19ilt+Epf/WnRkZpYb0F4oDlg4uLmL/MvrGDaBI@lists.infradead.org
X-Gm-Message-State: AOJu0YzdYGTXeDKWbeZBMNKq2IyScOQWmbxRULO6IvupMSau9Jy3XROl
	H1Zrr5QsC2n2om6kjs4GbWbS9MawjeFbyypWMfVXNmc0rfMotVqCDTjbOXoCnARNupFzA99pG04
	RA9E9dudkHB57YYaC3J3cGev1dexYkwGMwZkJMfcr6A==
X-Gm-Gg: ASbGncvtC/8wef0X+NObtv8x77XIYzOtqzm81IyOmB2ov4JS12OuoHKsbalTMzAv7X3
	eS4fEqa6cDFwVdFIdGEPbACqQ3197p7f1AtvWHZvt0NIAbxoMgQUmkzBJS25lSK8AB157AR098f
	BYtEEAhQHExQXW0/8A8MiGiXHY9iWY4jvfp9agshxi6O/t2m+aEEZ0mSfl4X95TVZLk21Zp6D/L
	L39gHmXGg+G7X87g8AvCgn3v4XXWLKRhSuI+rB6yNCCSeg=
X-Google-Smtp-Source: AGHT+IGC5U6e2Dn1tMsLyF18gYUHRa22VodbP73NxQ0EqXqogritItpRUDjrhDJduFW7Qc87Fq6Zc0iIgGpKneFSjR0=
X-Received: by 2002:a05:6402:390c:b0:628:6af4:595 with SMTP id
 4fb4d7f45d1cf-62ed82fc9f7mr8593311a12.20.1757853326146; Sun, 14 Sep 2025
 05:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250912141436.2347852-2-vincent.guittot@linaro.org> <20250912225004.GA1651547@bhelgaas>
In-Reply-To: <20250912225004.GA1651547@bhelgaas>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Sun, 14 Sep 2025 14:35:14 +0200
X-Gm-Features: Ac12FXzoBnTdY1zYFeG3eA1G823XRIjgcnE5BClULnG3hfvuq5oVWCbfskuc7HM
Message-ID: <CAKfTPtCfjJ8-30aAeEyigeLyuKtTq+k6PQg+5w4-0Wa7pduZvg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250914_053528_257951_D540A12F 
X-CRM114-Status: GOOD (  34.98  )
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

On Sat, 13 Sept 2025 at 00:50, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Fri, Sep 12, 2025 at 04:14:33PM +0200, Vincent Guittot wrote:
> > Describe the PCIe controller available on the S32G platforms.
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
>
> s/End Point/Endpoint/ to match spec usage.

Ok

>
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
> s/normaly/normally/
>
> But I doubt you need this here at all.

I'm going to remove the description

>
> > +    maximum: 3
> > +
> > +  num-lanes:
> > +    description:
> > +      Max bus width (1 or 2); it is the number of physical lanes
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
> > +                  msi-parent = <&gic>;
> > +
> > +                  num-lanes = <2>;
> > +                  phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
>
> num-lanes and phys are properties of a Root Port, not the host bridge.
> Please put them in a separate stanza.  See this for details and
> examples:
>
>   https://lore.kernel.org/linux-pci/20250625221653.GA1590146@bhelgaas/

Ok, I'm going to have a look

>
> > +        };
> > +    };
> > --
> > 2.43.0
> >

