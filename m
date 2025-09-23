Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF2ECAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 17:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKpIP4JHqz6cG4UOF6o0Lt4gug+UcA+CBt0Oa3txFso=; b=M92sUJmDAWsubwuzrpST0TyK4w
	6mMkaXIo5q4RDnKhEJvL3f+MOaPDFgvqkzSNmmZkUx3L81o5lCqflyUMouMyqhEFOYWdyUr/IqG/Z
	0V0fiOekOHA64Sty8OjbQYgBwC5KiGjfI9+Z7EkncgLUDGFetpvyXYeWVBYc4dIhXdzSvM5fgGm7r
	psoga0MtPE9Kg54jkGFkQ7/wNHOv+PLeXEwDQnrl/D86vPiQBglbx5CrhrUwF+NoBs0UX5fOdxPbZ
	+86oHZnFDus/GHjiFZbNQYf07E0V9jrEZFp6GdD4A/0OcQ0Q22sMDdsxW4xKqd7yHOcwTtobRJiBB
	Bces9dYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v170a-0000000EPmd-39HR;
	Tue, 23 Sep 2025 17:40:56 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v170Y-0000000EPlp-0muQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 17:40:55 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-62fca01f0d9so8208333a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 10:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758649252; x=1759254052; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKpIP4JHqz6cG4UOF6o0Lt4gug+UcA+CBt0Oa3txFso=;
        b=D24c+5JbUsN7JNV0zJAs7P/WDTpQ7i4Wsz6gZBhKtWqB/CrA2Vv5G7WcaRDuckmYK3
         eBg4zvzvXvToUyZwB4gwduOjqvlqXoBmlEVbvdmq7ylBo+aj0DhKqntH+awCiWVZ6GXx
         N0XTZh5pUv9l4Ssx3NrLPwO1Q9+LSfk+GzPILY22jpJpOO5kmIe1xED1V2gFLCgjcAzL
         Se7A0nQRaaohgq+1XlaPuHyUXsh6OL0YfwHczELVUqHNoCE3S+jCAyD4Gho9K3b4b+DU
         hU2SSVyv5sISvSDXa5W0ppCR14Sv08H9lZA1j3mi+7Gi0/7tr6cx6/j9YBBbJKK1LgPj
         LMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758649252; x=1759254052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QKpIP4JHqz6cG4UOF6o0Lt4gug+UcA+CBt0Oa3txFso=;
        b=Q1fszxaDr+NqfpNodERDnVBh40DvB5EDMqicVOCNA3jNoZ5so0jxmEnPShnSUDeU3D
         m4CG9puhvtdMbUpCiU/AFnql+ErrsP5/R8rBad6FQZdxKoNIdCNBhIkY8qaC4Sdoj+4P
         ULIZTwJqCDzCHvesen6dM90AQtp5Lno+HnUEdkzBEi2UF3FMxZXPi+Oo+bUBIGPOcXRr
         Kjua05iJ2UpyNlw/NsegR/h+6cvO4M7lSr6NBJ1pj+9ethKjcHFNHokP6iYo03q+azvp
         AyFomLFeZdJKY/JGJwIAh5o8d/0jqrUyXWwOJ0vaO6iVW9YQVP9Jz6gmcadAO65wuqEE
         r2pA==
X-Forwarded-Encrypted: i=1; AJvYcCX8r5e1vkBThs0uah6e0kUgQxGOQDEDB1+Ag0IpeVJC4HbJjIJRVE4miRdexiemcYJG+rcfr/MuPDgpy27xnXa+@lists.infradead.org
X-Gm-Message-State: AOJu0YwTv0JHrUJJTJiO72NGHumvEZsoCXU8qbOIwUxp0h9B7FmXmv95
	qKA6WAHnOAj9SAGnnTZA8WqmqWPRsRD7cY0NPR00c/1NUI9Nk2fPkHa99hVd2jh8WmEKzwFRBRa
	96bImVAEWeh7ArhjcByinbHON/4sttTOYuAzMK3aY0Q==
X-Gm-Gg: ASbGncsnQSZgkNec1ruYR15ERjj2GveZ6qKSschZWbj+GSP3EaYZg8OOkSuc0uPsEHR
	GdO3wwXdbNvuE0NjX76ZVPdh7OZb7qAkRfYcrb4jN+pBgVQ4Hlx+1BLw0a+m0PcpfiR4nXsbN8Q
	axo/ScJnmgFK5m/+E5LwsMzXNeVwAhRzGJ4CVSeLc2e1kEH1WNZPPAZPLJXHtJdkUqAeYBKPDZ1
	oj9RSE7GvabaXZvVGAwJfQFbfEHyMXPnVJ5
X-Google-Smtp-Source: AGHT+IGKj6Y7Rbxbcuv/p78PYY4VhOn0VuHWkuzF4bBzMgRnn4BUqA5lXuES789K8QEVi7gDnX95FchYWyP/N+Yb7J4=
X-Received: by 2002:a05:6402:42d4:b0:634:66c8:9e6d with SMTP id
 4fb4d7f45d1cf-63467a196c6mr3151558a12.35.1758649252279; Tue, 23 Sep 2025
 10:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
 <20250919155821.95334-2-vincent.guittot@linaro.org> <iom65w7amxqf7miopujxeulyiglhkyjszjc3nd4ivknj5npcz2@bvxej6ymkecd>
In-Reply-To: <iom65w7amxqf7miopujxeulyiglhkyjszjc3nd4ivknj5npcz2@bvxej6ymkecd>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 23 Sep 2025 19:40:40 +0200
X-Gm-Features: AS18NWBNIKbQJlsVTlHAuM-w_iiTyLoHRH4gz5lC-pFfTqvjXuoI-RD55es6jyQ
Message-ID: <CAKfTPtD2MH9_xT+Fq4vvpGNMJPSkwh3CMaVCLRcNxrn_Ab7eLQ@mail.gmail.com>
Subject: Re: [PATCH 1/3 v2] dt-bindings: PCI: s32g: Add NXP PCIe controller
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
X-CRM114-CacheID: sfid-20250923_104054_443601_B3480D15 
X-CRM114-Status: GOOD (  26.90  )
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

On Mon, 22 Sept 2025 at 08:21, Manivannan Sadhasivam <mani@kernel.org> wrot=
e:
>
> On Fri, Sep 19, 2025 at 05:58:19PM +0200, Vincent Guittot wrote:
> > Describe the PCIe controller available on the S32G platforms.
> >
>
> You should mention that this binding is for the controller operating in '=
Root
> Complex' mode.
>
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
> >  .../devicetree/bindings/pci/nxp,s32-pcie.yaml | 131 ++++++++++++++++++
> >  1 file changed, 131 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32-pcie.=
yaml
> >
> > diff --git a/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml b/=
Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
> > new file mode 100644
> > index 000000000000..cabb8b86c042
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
> > @@ -0,0 +1,131 @@
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
> > +  The S32G SoC family has two PCIe controllers, which can be configure=
d as
> > +  either Root Complex or Endpoint.
> > +
>
> But this binding is going to cover only the 'Root Complex' mode, isn't it=
?

I was planning to add the endpoint in the same file as the hardware
description remains the same between RC and EP but only the use of the
HW is different. But it looks like I have to separate binding for RC
and endpoint

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
> > +    maxItems: 8
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: link-req-stat
> > +      - const: dma
> > +      - const: msi
> > +      - const: phy-link-down
> > +      - const: phy-link-up
> > +      - const: misc
> > +      - const: pcs
> > +      - const: tlp-req-no-comp
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
> > +allOf:
> > +  - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
> > +  - $ref: /schemas/pci/pci-bus.yaml#
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
> > +                  /*
> > +                   * RC configuration space, 4KB each for cfg0 and cfg=
1
> > +                   * at the end of the outbound memory map
> > +                   */
> > +                  <0x5f 0xffffe000 0x0 0x00002000>,
> > +                  <0x58 0x00000000 0x0 0x40000000>; /* 1GB EP addr spa=
ce */
> > +            reg-names =3D "dbi", "dbi2", "atu", "dma", "ctrl",
> > +                        "config", "addr_space";
> > +            dma-coherent;
> > +            #address-cells =3D <3>;
> > +            #size-cells =3D <2>;
> > +            device_type =3D "pci";
> > +            ranges =3D
> > +                  /*
> > +                   * downstream I/O, 64KB and aligned naturally just
> > +                   * before the config space to minimize fragmentation
> > +                   */
> > +                  <0x81000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x000=
10000>,
>
> s/0x81000000/0x01000000
>
> since the 'relocatable' is irrelevant.
>
> > +                  /*
> > +                   * non-prefetchable memory, with best case size and
> > +                   * alignment
> > +                   */
> > +                  <0x82000000 0x0 0x00000000 0x58 0x00000000 0x7 0xfff=
e0000>;
>
> s/0x82000000/0x02000000
>
> And the PCI address really starts from 0x00000000? I don't think so.

I'm going to check why they set this value



>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

