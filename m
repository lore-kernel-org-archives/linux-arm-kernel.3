Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA94CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 17:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTmCve7ow8KUe86m2S+D+TMV8DrrT745aVc8Mr0EBG4=; b=kUPpd480algTDeqcSuHEktiyhU
	WHUumUhINbvveOHhasRcYtiM9lwrcuDo6ANReMPgqolVa2wV/qRFmJWpy07eUVTgqLM1exCUa6RL0
	oYdWlddzWLap8b3y3uuWKabETN2ethy/9yTxc7imOViaq42wB8OX6qhamrjPuC9i+V9PYAxOGmyQP
	Q7h3hOLeBarU2ks4tzhkbsHT1LdXZnxk6VcP1gqYVd4nBI9ruWSP2J3TKEkF7Ll49O/3duYyVG7Sv
	l1P8FYKrP7B3ldWwQbEMjDlDg6YhuIL6ZAggdjcyI6P9lR7GjpP1pGmZvy4AUN8C9OnyFQ3P9veFW
	nJtTcttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v954U-00000002PBy-2Zgv;
	Wed, 15 Oct 2025 17:13:55 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v954R-00000002PBC-3woR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 17:13:53 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b553412a19bso4363747a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 10:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760548430; x=1761153230; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTmCve7ow8KUe86m2S+D+TMV8DrrT745aVc8Mr0EBG4=;
        b=Wos3OGAmLYn3And97f8Km07YHGO2DdTsuuQpWSlu/zJhrXDd1cDnbbKCHNOdHEGnpS
         DO60JS4bIMMqac4MEItimetg+K6je+Hi88txN0XMcPf2V+uHJEH5Xd5u8RbAR/oVaP/M
         kJ7T2vROGra/5/rssStx0nCozYEFyqOk/4kXzcKoxW8Jt5OFPOPWHph4uAefiOeMIdHj
         KpmlyIWHT6PTSqXEo5ljunRPzzXywUt8ohdZhIJX5LGNpI9m08BZb4o2w+7/ymJmws/N
         q41jlnr/dMoPJBBjhe2ySLp33uZl+bhjHUN7qy9rfQ6cUGmPTGH8cHxcQr5hDo4vZyZm
         bZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760548430; x=1761153230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTmCve7ow8KUe86m2S+D+TMV8DrrT745aVc8Mr0EBG4=;
        b=qW9aCzwNOY4vDOd6/yMFY/O4ar+g/b9nnSsDUnKDDc5j1hJ+RUQmAHaRX0+81beWn0
         PvwGHqBaMktMovDEeT/y/IYWbX8aIjx374QjlacA96FiklQ6yvDARv/yTHLh/iYCVAko
         YQSTVOWSR7KQbhhfphCdoEL4s0hSXLXzh3hcymbQVq7OfMFi+hzYqFcbLc/e8g6AEgzh
         YU8R6xRL2NiLoqf31lCnsJgmsroAVFsqFoiSRPdx6KAvPko07bv3a0ODZm1Zix0o45wO
         MU3TDw3mE1Zy81xZ/k9xDQ3+r9vZKfhdmK0i7dDOCTDGSiHolonyUr8i6D0L/EHSK4M+
         +8oQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+YGD3HiYgrj6hyno286VBaDISSse/9BV8EFl1msKlBNbrxemRZSO8dQUwDJeSCLCD3SXttg3+uajoeYcPQm+O@lists.infradead.org
X-Gm-Message-State: AOJu0YxZFfUGnrZ06p5FS0GlMB7pYybSWDBxHESm2X/c19ZCYuMlL16F
	Yx/TFrWyMxX4hlx1eois1W2l1vgSIrCg8FTfKugcmolJGawnMDUN+L2TuPL5TfotejyDy6FXtSX
	j37WHjJiAZB1xmjRroEVHNoej71sxBPXCG2REaUOy
X-Gm-Gg: ASbGncuxDnnZ5MOpEmC/7h/Gz9sfpFQ262g1VuUACLPAFYKM/mitWsCR8Ey2mfpRbrW
	M/U5aQN2rkavROfnza/lAQZBR8i3wHA5TibeYQwC0uVXcIQ97pZgUwzFxlL6K8aurveTAzu4Fkk
	UzscC3Z3DKxauCZPpfBcrpo0ZnPhW2zWTzWSd7C3gnmC5qTmTRczyNjrrXhJ6nlmBZD6LSAxUvp
	4CIROKds9W15gqf0avNUcjOkeg+z/iMIPfOtHNYzPa/P3jjB0vSUujR5XlcDR4q4X0oPVmxov7j
X-Google-Smtp-Source: AGHT+IG7xm/DEDbS/nNDrpe7ReteweNLIKFfyokAzWV7zMp350kRJ3eICS85Rhzn8PDxA9SglM5C/lh1HX9E/pJg4Bg=
X-Received: by 2002:a17:902:f650:b0:276:305b:14a7 with SMTP id
 d9443c01a7336-290273ef0ebmr363338475ad.33.1760548429863; Wed, 15 Oct 2025
 10:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251010201607.1190967-1-royluo@google.com> <20251010201607.1190967-2-royluo@google.com>
 <066a9598-ad30-4327-be68-87299bba6fda@kernel.org> <CA+zupgwc7b51pNRLWRy2CX=n4=FTm=AP7J0dRP2RLjyK5LxGtw@mail.gmail.com>
 <b7b3de64-c656-4a84-8ba4-2d5c7eda9783@kernel.org> <CA+zupgzo9zRO2GHR2Np0Tm4M5_h8y0GF2JGGqE_S0BxSR_ZbqQ@mail.gmail.com>
 <20251015-backlash-overtime-4c636f12b165@spud>
In-Reply-To: <20251015-backlash-overtime-4c636f12b165@spud>
From: Roy Luo <royluo@google.com>
Date: Wed, 15 Oct 2025 10:13:13 -0700
X-Gm-Features: AS18NWCEm2YS-Sip7tv4iMJuDS6bNEhHmOhmHYieVj8y_mcbM2tH_CjtqCUTPM4
Message-ID: <CA+zupgyKsnp5D9kW-AeoAsweODXx4BXLr7fVnB+J9tzYRbM_fg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_101351_978457_5FD34BEE 
X-CRM114-Status: GOOD (  56.77  )
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

On Wed, Oct 15, 2025 at 1:59=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Oct 14, 2025 at 05:50:17PM -0700, Roy Luo wrote:
> > On Tue, Oct 14, 2025 at 1:22=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> > >
> > > On 14/10/2025 03:40, Roy Luo wrote:
> > > > On Fri, Oct 10, 2025 at 5:09=E2=80=AFPM Krzysztof Kozlowski <krzk@k=
ernel.org> wrote:
> > > >>
> > > >> On 10/10/2025 22:16, Roy Luo wrote:
> > > >>> Document the device tree bindings for the DWC3 USB controller fou=
nd in
> > > >>> Google Tensor SoCs, starting with the G5 generation.
> > > >>>
> > > >>> The Tensor G5 silicon represents a complete architectural departu=
re from
> > > >>> previous generations (like gs101), including entirely new clock/r=
eset
> > > >>> schemes, top-level wrapper and register interface. Consequently,
> > > >>> existing Samsung/Exynos DWC3 USB bindings are incompatible, neces=
sitating
> > > >>> this new device tree binding.
> > > >>>
> > > >>> The USB controller on Tensor G5 is based on Synopsys DWC3 IP and =
features
> > > >>> Dual-Role Device single port with hibernation support.
> > > >>
> > > >> You still mix, completely unnecessarily, subsystems. For Greg this=
 is
> > > >> actually even undesired, but regardless don't do this for any case=
s
> > > >> because it just makes everything slower or more difficult to apply=
.
> > > >>
> > > >> Really, think how maintainers should deal with your patches.
> > > >>
> > > >
> > > > Understood, I will separate the patches into two distinct series: o=
ne for
> > > > the controller and one for the PHY.
> > > > Appreciate the feedback and the explanation.
> > > >
> > > >>>
> > > >>> Signed-off-by: Roy Luo <royluo@google.com>
> > > >>> ---
> > > >>>  .../bindings/usb/google,gs5-dwc3.yaml         | 141 ++++++++++++=
++++++
> > > >>>  1 file changed, 141 insertions(+)
> > > >>>  create mode 100644 Documentation/devicetree/bindings/usb/google,=
gs5-dwc3.yaml
> > > >>>
> > > >>> diff --git a/Documentation/devicetree/bindings/usb/google,gs5-dwc=
3.yaml b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> > > >>> new file mode 100644
> > > >>> index 000000000000..6fadea7f41e8
> > > >>> --- /dev/null
> > > >>> +++ b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> > > >>> @@ -0,0 +1,141 @@
> > > >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > >>> +# Copyright (c) 2025, Google LLC
> > > >>> +%YAML 1.2
> > > >>> +---
> > > >>> +$id: http://devicetree.org/schemas/usb/google,gs5-dwc3.yaml#
> > > >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > >>> +
> > > >>> +title: Google Tensor Series (G5+) DWC3 USB SoC Controller
> > > >>> +
> > > >>> +maintainers:
> > > >>> +  - Roy Luo <royluo@google.com>
> > > >>> +
> > > >>> +description:
> > > >>> +  Describes the DWC3 USB controller block implemented on Google =
Tensor SoCs,
> > > >>> +  starting with the G5 generation. Based on Synopsys DWC3 IP, th=
e controller
> > > >>> +  features Dual-Role Device single port with hibernation add-on.
> > > >>> +
> > > >>> +properties:
> > > >>> +  compatible:
> > > >>> +    const: google,gs5-dwc3
> > > >>> +
> > > >>> +  reg:
> > > >>> +    items:
> > > >>> +      - description: Core DWC3 IP registers.
> > > >>> +      - description: USB host controller configuration registers=
.
> > > >>> +      - description: USB custom interrrupts control registers.
> > > >>> +
> > > >>> +  reg-names:
> > > >>> +    items:
> > > >>> +      - const: dwc3_core
> > > >>> +      - const: host_cfg
> > > >>> +      - const: usbint_cfg
> > > >>> +
> > > >>> +  interrupts:
> > > >>> +    items:
> > > >>> +      - description: Core DWC3 interrupt.
> > > >>> +      - description: High speed power management event for remot=
e wakeup from hibernation.
> > > >>> +      - description: Super speed power management event for remo=
te wakeup from hibernation.
> > > >>
> > > >> Wrap at 80 (see coding style) or just shorten these.
> > > >
> > > > Ack, will fix it in the next patch.
> > > >
> > > >>
> > > >>> +
> > > >>> +  interrupt-names:
> > > >>> +    items:
> > > >>> +      - const: dwc_usb3
> > > >>
> > > >> So just "core"?
> > > >
> > > > I'd prefer to stick to "dwc_usb3" as that's
> > > > 1. more expressive by referring to the underlying IP name,
> > >
> > >
> > > But that's completely redundant name.
> > >
> > > > 2. consistent with established dwc3 bindings such as
> > > >     Documentation/devicetree/bindings/usb/snps,dwc3.yaml,
> > >
> > > If you use only one interrupt. You don't use one interrupt here.
> >
> > After looking into it further, I found that the interrupt name "dwc_usb=
3"
> > must be used here to adhere to the interrupt naming defined in
> > "snps,dwc3.yaml".
>
> Did you just chose to not read what Krzysztof said here? It must be used
> only when that's the sole interrupt, which he stated is not the case for
> your platform.
>
> > This requirement stems from the device's corresponding glue driver
> > utilizing a so-called "flattened" model (see [1] for context). This mod=
el
> > causes the glue driver to probe an underlying "snps,dwc3" device.
> > Consequently, the core DWC3 interrupt defined here is consumed by
> > the driver handling the "snps,dwc3" device, making it mandatory to
> > follow the interrupt naming established in "snps,dwc3.yaml".
>
> I look at the binding and noticed that interrupt-names isn't even a
> required property by snps,dwc3.yaml, and this comment about driver
> behaviour likely isn't accurate given that the code in for host mode
> (and the others are identical) is written so that it will grab the first
> interrupt if the specific names it looks for are absent:
> | static int dwc3_host_get_irq(struct dwc3 *dwc)
> | {
> |       struct platform_device  *dwc3_pdev =3D to_platform_device(dwc->de=
v);
> |       int irq;
> |
> |       irq =3D platform_get_irq_byname_optional(dwc3_pdev, "host");
> |       if (irq > 0) {
> |               dwc3_host_fill_xhci_irq_res(dwc, irq, "host");
> |               goto out;
> |       }
> |
> |       if (irq =3D=3D -EPROBE_DEFER)
> |               goto out;
> |
> |       irq =3D platform_get_irq_byname_optional(dwc3_pdev, "dwc_usb3");
> |       if (irq > 0) {
> |               dwc3_host_fill_xhci_irq_res(dwc, irq, "dwc_usb3");
> |               goto out;
> |       }
> |
> |       if (irq =3D=3D -EPROBE_DEFER)
> |               goto out;
> |
> |       irq =3D platform_get_irq(dwc3_pdev, 0);
> |       if (irq > 0)
> |               dwc3_host_fill_xhci_irq_res(dwc, irq, NULL);
> |
> | out:
> |       return irq;
> | }
>
> Since it grabs the first interrupt, as a fallback, in order to support
> not having the interrupt-names property, the name of the first interrupt
> ultimately doesn't matter at all to this driver (and likely any other
> driver written in compliance with the bindings for the dwc3 core).
>
> I'm not here to argue about what the name for the single interrupt
> should be (keeping consistency with other devices might actually be
> good), but ignoring what a maintainer says and the seemingly providing
> an incorrect analysis is annoying. Did you perform the analysis on this
> yourself, or did it perhaps come from Gemini?
>
> Thanks,
> Conor.

Hi Conor,

My apologies for the incorrect analysis. I misinterpreted the code,
which was a big mistake. I can assure you that I do value your
feedback and take every comment seriously.
Thanks for pointing out the error and raising your concern.
This won't happen again.

Thanks,
Roy Luo

>
> > Essentially, the interrupts defined here are a mix of vendor specific
> > implementation (like "hs_pme", "ss_pme") and the DWC3 core in
> > "snps,dwc3.yaml" ("dwc_usb3").
> >
> > I don't know if there's a better way to express this implicit dependenc=
y
> > of the core DWC3 interrupt except for documenting it in the binding
> > description. Any advice would be welcome.
> >
> > [1] https://lore.kernel.org/all/20250414-dwc3-refactor-v7-0-f015b358722=
d@oss.qualcomm.com/
> >
> > Thanks,
> > Roy Luo
> >
> > >
> > > >     Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml,
> > > > unless you have a strong preference for the alternative naming.
> > >
> > > Such namings are discouraged, because they tell absolutely nothing.
> > > Also, schematics or datasheets usually do not use them, either.
> > >
> > >
> > > Best regards,
> > > Krzysztof

