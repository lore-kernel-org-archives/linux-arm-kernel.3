Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5558CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 08:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqG4Vhl3gJVR6ZhqmKUIStjnvxpVzC8nlU32UMscO8w=; b=0NGBkY2RI+4NQloLC/4BB9Hi/6
	oamAV7Yh4DVLKLgBn1t0r+dIjch7JO6Cwi7AXeFn6oYMJqNabLOHmfnMIaok4SuJ6JK3/jeJbF00a
	0EM7zJkXw9oq/+iDiZ3RjebOSc1livSfduWEqHaJODr9PeAWtKIfI7PnrbGld0uL1u6p9KdBuvya4
	S7mQT37pzmYeNvtPW8vibW0pEc/aqtgxm+dqI8zx8r3Uq+VIhRQnIN+U7UwwFw22wlgpMM1Tsu5Z+
	84RRCxd5XqliAUJibs3HkFNdWY6DnPzoHQLj0WUhHKSkD4R7aLWLcwa6UTls4nejeWqScn1XPyt3G
	Wb2uQFRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGv3V-0000000F2sG-29R0;
	Thu, 06 Nov 2025 08:09:17 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGv3S-0000000F2rv-3zbQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 08:09:16 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso1311220a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 00:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762416553; x=1763021353; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqG4Vhl3gJVR6ZhqmKUIStjnvxpVzC8nlU32UMscO8w=;
        b=E9rGyOb1ytmP5h6T+uT+xclk2/5qigvtRVhctbRFZBEErlLIMtw/oamURVRKxaQ4nR
         sld7zv7/lxYyM6jqR+7O4BE9P1BjIioH4ixdbfgaVXVjnqPs2jTUa6fb6HzZdJdi4I4E
         mTd+S2AcEhSD/2MgCy0udC+F2fUZiCCZd53Aa4GBafsez7PJBjNMW2Tthq+gXvfUlTL6
         a+DWuQw+tS8HKYfJnDnVklu11hyetOpMMB+wHuy8JP8n8dgQVWqbZjLLAa8maoMfbUWl
         vbe1koWoOLaSiIBJAIVMju8N7lEUiNaOPnNZsUqAIXjODD9X/rJ8wjhsGdsgJegSEC3R
         /LEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762416553; x=1763021353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqG4Vhl3gJVR6ZhqmKUIStjnvxpVzC8nlU32UMscO8w=;
        b=g2GoDrHJrB93ysbSXNbh7NjCKT6vHMb6z1Ywo6fwxF2qOBkb3NaVHayNdDDcjHMCav
         bUHOX85Ev01/WP3+RKxImadPZ6gU8nYlBWNOOvPJIoD/XJhiuk6QSvL430+evILoWw2i
         BwOZ1xk4O0trP44VIVWzLNWeZ5cdiU7tp5RnFETS1JLDoAvypHzu/rnA0DTUaeWzhr9q
         JhBREsQ4nKSe/F08aWE590mcQpjYLVjIdbuEmPl7JuGdxhJKfIhBp3e7GbtLmRR0eQcI
         eZTG1f5qaQJ32qWlD0K52GEAzmrgmk9n2JHWohYveZGE9jadlDhOqFVjC2N1JstIQvzq
         ju/w==
X-Forwarded-Encrypted: i=1; AJvYcCXuZug3F/WBQhA0ffNDPxoYWP/47QxxnjwrgrxmYlYt3f72d6EOZr6XSJ93i5PmT3uwvSvYp8dnoXTtxXfeFfPU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3HlMJQfzvEcs8rqkvUTztKzZLJ5laZIgQsgbw+0pWhXKYgaGG
	NVnyAKb5sllSrVe7VGpUOZJNdIS2dPNbpWYWUw2GJ3gGfUJfsoDJ8tDlowjeHuC1ryZj0P44DUw
	VjUU45hlu/cRyOn8oSGpfjytQWDuIlSx+UZW7FFgqLw==
X-Gm-Gg: ASbGncsEksecEy4ZZZnX47RpxHmFrP2uTfE474G61G5zq2LAw0U4UiT3qxaFtZVvHjv
	n2r6MGsJhwcwRFCcwH8dzMoAQ6gfvf1rP6YFyhSvOtjI/qLeMS3vexjh88vZMsBD+OooZ+0kt3D
	biK9FLGnmNB33KL8SpELkpLKsAyX6QlnKni2+eVdd+c7dxDWKVPLcqkJjURjYMXm5oHV+5mqk3C
	edKO0GGFj2l6SF9tPO9kO8XsJZTC4TUSLxJ/l7mDyn6HBDTUsZ2bex0tTpeFsBunBC3WrAP
X-Google-Smtp-Source: AGHT+IFpGXTLSElm/iJX28AkNKWJysbi+VSdMAhhXx+DpEVvXomYFy1/eZ4xIzIhBa3g0OBlHb0wiAGdwqeYIeUCjdY=
X-Received: by 2002:a05:6402:3508:b0:640:c779:909 with SMTP id
 4fb4d7f45d1cf-64105a5c833mr5111127a12.27.1762416552602; Thu, 06 Nov 2025
 00:09:12 -0800 (PST)
MIME-Version: 1.0
References: <20251022174309.1180931-1-vincent.guittot@linaro.org>
 <20251022174309.1180931-2-vincent.guittot@linaro.org> <6k5zdhbhtqg2dghdm2bkbymr5rwzcowziaahfdvgw4dk22y43y@npsrperinzue>
In-Reply-To: <6k5zdhbhtqg2dghdm2bkbymr5rwzcowziaahfdvgw4dk22y43y@npsrperinzue>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 6 Nov 2025 09:09:01 +0100
X-Gm-Features: AWmQ_blssT-7N0Jk7hsjbSupnpo_HEbqq26DIoOJgn8hufRZY427ml3fisK5oFk
Message-ID: <CAKfTPtC87w7RVSDAXWXRX1sjgo4s=_Z_k62+mfTXrMZwmkEpFg@mail.gmail.com>
Subject: Re: [PATCH 1/4 v3] dt-bindings: PCI: s32g: Add NXP PCIe controller
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_000915_045089_4FD99D25 
X-CRM114-Status: GOOD (  25.37  )
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

On Thu, 6 Nov 2025 at 08:12, Manivannan Sadhasivam <mani@kernel.org> wrote:
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
> >  create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32g-pcie=
.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml b=
/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
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
> > +  The S32G SoC family has two PCIe controllers, which can be configure=
d as
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
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        pcie@40400000 {
> > +            compatible =3D "nxp,s32g3-pcie",
> > +                         "nxp,s32g2-pcie";
> > +            reg =3D <0x00 0x40400000 0x0 0x00001000>,   /* dbi registe=
rs */
> > +                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 register=
s */
> > +                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers=
 */
> > +                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers=
 */
> > +                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl register=
s */
> > +                  <0x5f 0xffffe000 0x0 0x00002000>;  /* config space *=
/
> > +            reg-names =3D "dbi", "dbi2", "atu", "dma", "ctrl", "config=
";
> > +            dma-coherent;
> > +            #address-cells =3D <3>;
> > +            #size-cells =3D <2>;
> > +            device_type =3D "pci";
> > +            ranges =3D
> > +                     <0x81000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x=
00010000>,
> > +                     <0x82000000 0x0 0x00000000 0x58 0x00000000 0x0 0x=
80000000>,
> > +                     <0x82000000 0x1 0x00000000 0x59 0x00000000 0x6 0x=
fffe0000>;
> > +
> > +            bus-range =3D <0x0 0xff>;
> > +            interrupts =3D <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
> > +                         <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
> > +            interrupt-names =3D "dma", "msi";
> > +            #interrupt-cells =3D <1>;
> > +            interrupt-map-mask =3D <0 0 0 0x7>;
> > +            interrupt-map =3D <0 0 0 1 &gic 0 0 GIC_SPI 128 IRQ_TYPE_L=
EVEL_HIGH>,
> > +                            <0 0 0 2 &gic 0 0 GIC_SPI 129 IRQ_TYPE_LEV=
EL_HIGH>,
> > +                            <0 0 0 3 &gic 0 0 GIC_SPI 130 IRQ_TYPE_LEV=
EL_HIGH>,
> > +                            <0 0 0 4 &gic 0 0 GIC_SPI 131 IRQ_TYPE_LEV=
EL_HIGH>;
> > +
> > +            phys =3D <&serdes0 PHY_TYPE_PCIE 0 0>;
>
> PHY is a Root Port specific resource, not Root Complex. So it should be m=
oved to
> the Root Port node and the controller driver should parse the Root Port n=
ode and
> control PHY. Most of the existing platforms still specify PHY and other R=
oot
> Port properties in controller node, but they are wrong.

Yeah, we had similar discussion on v1 and as designware core code
doesn't support it, the goal was to follow other implementations until
designware core is able to parse root port nodes.
I can add a root port node for the phy and parse it in s32 probe
function but then If I need to restrict the number of lane to 1
instead of the default 2 with num-lanes then I have to put it the
controller node otherwise designware core node will not get it.



>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

