Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649D3CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 06:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Ugqv1s44lLqcX4JmETo9JSdUQjRGtApJwylkT2MhNI=; b=hYH+UqN1K3lnS4t19TvJeYjJH1
	ELzSOX/sfX9MaxzUAGhYRyyMIkOrHAQgvK3ijOcdyIuIdnI7ys7Y6tfeKkvk9AYlctMH827x1CJDL
	IvLSPR9QdIsWjg7+BKPNsCNkzhs3nTSK8mKlwJZthOUaIRlJO36A7r8HgFpD2/3D0VxqjDfhIqaAb
	/AqxIVT4JMGLZp2DnNv+hCD42cIkVjEDEzjq/9gQtI8149qXGkbTrHYa4Pspx5+wF1xk+9LGNRZVe
	jn92RhLgjpUHTjIHiJU8UO28qzs/Sg9EtxQ5Ru1FnwvjNLeqfD9Hkz7LvxiW+bRC8Q/GTHCILYCH0
	HsTJ4u6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBlZ-00000008P2W-38Vk;
	Fri, 24 Oct 2025 06:59:13 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBlW-00000008P1z-1oZa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 06:59:11 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-63c09ff13aeso2868736a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 23:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761289148; x=1761893948; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ugqv1s44lLqcX4JmETo9JSdUQjRGtApJwylkT2MhNI=;
        b=Oam3KK9CpuZvliwq6CkaROOyd//CHGO2PHRkZAqtSRNbu1Qx4eDgbOt3ia8tU0UAMk
         JPoqt91m5K6SyID8UKxMfrBzpfyndMiGusKBGShlC0cTw5Q4QHCER0zw7vExDJFkMJtN
         GYBp2GED9rW2riT3pcxjYMDI5c4NhTuPcqRDlwZ15rbiUSqZ5/202BMGvsMh1lDb05r4
         QQRWE7Wx0/rJ3Wq4cyL2oyr4DZFsL6ll6l2o/5fSnS4+kc6onp3UAYjroHpliARMud6f
         n+GfPk+P5l25m5hxO6agMG1WzX46SO8mwc+XUW6qf/+uYQ0Y8HxJ+7NRiv8IQviPVzvk
         sDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761289148; x=1761893948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Ugqv1s44lLqcX4JmETo9JSdUQjRGtApJwylkT2MhNI=;
        b=juTHsIvW50cecb7fH92fu6pqxpJ/SPUV7O3m8aRw8GrjnV8S4M5pE11wACEMuQKuOK
         A2UOpuUzkbWiUO0Ys2rb8Yr8O9GRvTPVr1Z8JKYlI70WTGnf0eTNebSmKqR0aAXrffOn
         4MIWFmkD7kWD6L13dImqrBhM/5gVxQ9njCxlfNAWxIX31evVtLIWrP5JKSciFENmmfYW
         zrKh07gUEPoAkBay+tcSyLNu080gKpF4016oSoa4GH353G1phoWArQ9cCW7fUkWVP278
         D9tFUoEcQ1vAzU8MmJgYbc4gWlcgvQ/ApN+wOg0mS3XeOq01RjBgREpVEv3T+koStvkD
         ylLA==
X-Forwarded-Encrypted: i=1; AJvYcCWNBtIDM5xw/KMgdGYsDMDLNjR+hj0uOGQV/kq5puxEZXnm+2LbbQyz/qTwPDU9LGIyKVqBZNppbs9OYGMfpueN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8LwVl6E+kUkPXPMMr0yKFzfLmVwfIOs6R97D8XDtD5U9NKmv8
	XV4SWngALEh0IxLFkmZtTXpHfMTWHL02wo+S7DD9hGYICpIy35pYvgXSas4m06lbk80tUZTWth0
	CRtk5dNZAMoOo87uIZ4d3OeeJ4sBdjehTnhwZhyH4LA==
X-Gm-Gg: ASbGncs2sNQms0shXr0KRZ47PJPy/s2+wsOaweKgHFo8Z6uB6fu1bDTOjoEICmoORyh
	byJfTUn7hTThoDgvmQVIJ6/IDBC+9+VSOUTWX1nA+GbXZ265fdibo+I6a+3tFg7O1r4CY5rm4Sv
	J9YJYJjrug59MURcSjRU5s+1ReZsU6KLj0+20bodAPBTz7jAfsXR2D2cuQKyIV++7PNEw2Dlxse
	IvmVpweHrMiHDlcz1Pb4ZUURlIhb0SdKCoFX8jFHoIG0/lzyWnmuhaqM/5/Ku3b9TKegXPhL1c1
	v6Fj/AONMtQSc3dcdLLQO7Gt
X-Google-Smtp-Source: AGHT+IFAhTtwkuQJ8tJVRO47CmkrlfK4n6utip+dcl9Wbc27L/1MyGaOtTTrwRtxBRNLnwzLIx8auf00o2MEwmZjM6I=
X-Received: by 2002:a05:6402:304a:20b0:638:3f72:1266 with SMTP id
 4fb4d7f45d1cf-63c1f640163mr23343462a12.16.1761289148308; Thu, 23 Oct 2025
 23:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20251022174309.1180931-1-vincent.guittot@linaro.org>
 <20251022174309.1180931-2-vincent.guittot@linaro.org> <aPkt5sigtL/EN0A3@lizhi-Precision-Tower-5810>
In-Reply-To: <aPkt5sigtL/EN0A3@lizhi-Precision-Tower-5810>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 24 Oct 2025 08:58:57 +0200
X-Gm-Features: AWmQ_bk6VPRIEAG_QafjLl74cCVYdfxYgbB6ZD71K263u0GS0jqTcUigkEeIqKs
Message-ID: <CAKfTPtAz_joc4KFnxypFXJQTPeRF5y5UKhRyoW6kcMrwQgu+7g@mail.gmail.com>
Subject: Re: [PATCH 1/4 v3] dt-bindings: PCI: s32g: Add NXP PCIe controller
To: Frank Li <Frank.li@nxp.com>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_235910_502676_874466E1 
X-CRM114-Status: GOOD (  19.84  )
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

On Wed, 22 Oct 2025 at 21:18, Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Oct 22, 2025 at 07:43:06PM +0200, Vincent Guittot wrote:
> > Describe the PCIe host controller available on the S32G platforms.
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
> >  .../bindings/pci/nxp,s32g-pcie.yaml           | 102 ++++++++++++++++++
> >  1 file changed, 102 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
> > new file mode 100644
> > index 000000000000..2d8f7ad67651
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
> > @@ -0,0 +1,102 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pci/nxp,s32g-pcie.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP S32G2xxx/S32G3xxx PCIe Root Complex controller
> > +
> > +maintainers:
> > +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > +  - Ionut Vicovan <ionut.vicovan@nxp.com>
> > +
> > +description:
> > +  This PCIe controller is based on the Synopsys DesignWare PCIe IP.
> > +  The S32G SoC family has two PCIe controllers, which can be configured as
> > +  either Root Complex or Endpoint.
> > +
> > +allOf:
> > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - nxp,s32g2-pcie
> > +      - items:
> > +          - const: nxp,s32g3-pcie
> > +          - const: nxp,s32g2-pcie
> > +
> > +  reg:
> > +    maxItems: 6
> > +
> > +  reg-names:
> > +    items:
> > +      - const: dbi
> > +      - const: dbi2
> > +      - const: atu
> > +      - const: dma
> > +      - const: ctrl
> > +      - const: config
> > +
> > +  interrupts:
> > +    maxItems: 2
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: dma
> > +      - const: msi
>
> Most likely dma irq is optional irq, seldom use built-in edma in RC mode.
> so put msi to the first.
>
> interrupt-names:
>   items:
>     - const: msi
>     - const: dma
>   minItems: 1
>
> missed phys
>
> phys:
>   maxItems: 1

okay

>
> Frank
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - interrupt-names
> > +  - ranges
> > +  - phys
> > +
> > +unevaluatedProperties: false
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
> > +        pcie@40400000 {
> > +            compatible = "nxp,s32g3-pcie",
> > +                         "nxp,s32g2-pcie";
> > +            reg = <0x00 0x40400000 0x0 0x00001000>,   /* dbi registers */
> > +                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 registers */
> > +                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers */
> > +                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers */
> > +                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl registers */
> > +                  <0x5f 0xffffe000 0x0 0x00002000>;  /* config space */
> > +            reg-names = "dbi", "dbi2", "atu", "dma", "ctrl", "config";
> > +            dma-coherent;
> > +            #address-cells = <3>;
> > +            #size-cells = <2>;
> > +            device_type = "pci";
> > +            ranges =
> > +                     <0x81000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x00010000>,
> > +                     <0x82000000 0x0 0x00000000 0x58 0x00000000 0x0 0x80000000>,
> > +                     <0x82000000 0x1 0x00000000 0x59 0x00000000 0x6 0xfffe0000>;
> > +
> > +            bus-range = <0x0 0xff>;
> > +            interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
> > +                         <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
> > +            interrupt-names = "dma", "msi";
> > +            #interrupt-cells = <1>;
> > +            interrupt-map-mask = <0 0 0 0x7>;
> > +            interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <0 0 0 2 &gic 0 0 GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <0 0 0 3 &gic 0 0 GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <0 0 0 4 &gic 0 0 GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +            phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
> > +        };
> > +    };
> > --
> > 2.43.0
> >

