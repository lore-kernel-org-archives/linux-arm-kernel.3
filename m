Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D510CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 00:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pys06/P8lbZQqKUpds+GbSIWbUdLNbX77jOCPrn7W20=; b=LE2iYmXmYvwUMap/ZzFAxvU7ga
	2jDY7paxdXTSgZw3iCKmuWO73pt+iHLrWUpYZEWp7m/St+6mzZR5Xav2d6KJqYUxtkRlzKz7g9H50
	UNbsGsmR5HVptosOBeBTz59PnzHKNrmU5TSl4prAbOsTkgy2rdjeRSFr02uaPOoRl1+cQs+HPju6S
	R7I2SGeecadQQ7jb3MaUlcf/UuUlqbezgt6f+yBXOUieg6gtmwRscNVJUKpTHP9SvXAeY46ij7d56
	/rlb6svwAE/DY0npIyOQP2Wy3zAeTihaUvOyJmWfd0sXYqdPGH4feudXZlksqfSzW5jZv93Iql+Og
	6Wdk6/8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8pjH-000000007Dy-0qc6;
	Wed, 15 Oct 2025 00:50:59 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8pjD-000000007Ct-1s1d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 00:50:57 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-339d53f4960so6228120a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 17:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760489454; x=1761094254; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pys06/P8lbZQqKUpds+GbSIWbUdLNbX77jOCPrn7W20=;
        b=ugfoCyrkjA7pQ/X99qkbUu3+zovm5KP9RZeqKalLlFAwtXmVCbNYH/tEZrnxVn8FOR
         yh3W9iYCgh9YM70y38ZIN1S8WcNqddd/GNXnxAUZEVRG51ZmbdVPIi2X6yUhxQ667OFK
         mX6XpmBCAzN4Ghpq2VsO14LspAGYmWu6wngmhxnSLRlpEBlSnaiIQx7E1CJkrAFyr5pr
         /UOLEF2I1Ce9LTvDC5siTtabmz7dZKvAdxk1kvyqYaJXCWRW+fHgMV9XqF/APzOYo2Bt
         W0BRrJ6uk4oeggVCuBHJ52QTJS4rlsU5sfoyUXk9Mh3l+9AhoxDkeq+xZmuAXWvxa/PI
         a0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760489454; x=1761094254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pys06/P8lbZQqKUpds+GbSIWbUdLNbX77jOCPrn7W20=;
        b=IwOWQjx+JdZJ/rKD5111XJoWmVdlmhUkXj2TMglDhGwAum1BkvTPCKaOByYjf8rS2f
         bprXa7AXlmg2dHiZj16qfn+8+VZ8cNfstCguyJAo+0A+4ECSH1x8bUJ3uKGYqdjOwpVS
         RkVASqoVpIP4v87bvRMukbo5aPY9+rfPkDAN3MBR2MKpMUIrocfWwsx4D3bCdHQv74WQ
         UKxKv1wThIpeFHrUrwXrwUr2imnP4OHilLq61M5qX0TM/JhLkW0o2+Ru3ZbqIx0kWkvf
         0r03M/SJ38ewbcSDwnMKa9ln/xyGj+hzEvytBnI0dbgaUrprigSGUQHK517zA5UUNV9I
         g+oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr9tETVfWLuyev04JUocZ1OY0QU3M3kO53L22s45XvPqUoOXSsbH7lyicZ/yLDMhlDLwl7b/DzzdCwh7dtGtpc@lists.infradead.org
X-Gm-Message-State: AOJu0YxZmKATxheB3vpCPUXPVODqWHclSmRiCJ40tyRgGDyK03DGaGAW
	3TF/w/9LvFNyp027dhRPFhDYE2xSzGthsBDjM1mWV2CiZLS9JvlL4OYV4/mWKYgulivY+9y6v3K
	oPN1X3nppY3C3MXYog8dY+0NcGdDGOiVf0W5H1DQd
X-Gm-Gg: ASbGncuafq3EfYtmAxE0q4CXG/EQ42a8y8/fmgDAtgc+9MxKiYk8hbYp13Rc3j37kgj
	juNDZCyGAJN3gU1DXMTMIM/d84MCG+HoBmzMX0Z/NpD4rzOBqmPW7VflGWNHmSkD7TriktzREoY
	eK5th9fqsoceWsniEKz4EIZIppe5k8FU/V4p0MNifpo6Yj51YqMvZuLzB9ercFWLevLMJkNglQe
	XhZynI71TGnpzM7VgRj+co25NXZfX7CePM93TB6aJGmnA==
X-Google-Smtp-Source: AGHT+IEdFC1oV2FCOk9D1OoKHtXpkscHEpfnoY4gL665jCzwvs2Cq1As6WI2zTWR3UXhYVWN4AQjO/wbTMtNWWION3M=
X-Received: by 2002:a17:90b:3804:b0:336:bfce:3b48 with SMTP id
 98e67ed59e1d1-33b51169060mr35644309a91.9.1760489453987; Tue, 14 Oct 2025
 17:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20251010201607.1190967-1-royluo@google.com> <20251010201607.1190967-2-royluo@google.com>
 <066a9598-ad30-4327-be68-87299bba6fda@kernel.org> <CA+zupgwc7b51pNRLWRy2CX=n4=FTm=AP7J0dRP2RLjyK5LxGtw@mail.gmail.com>
 <b7b3de64-c656-4a84-8ba4-2d5c7eda9783@kernel.org>
In-Reply-To: <b7b3de64-c656-4a84-8ba4-2d5c7eda9783@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Tue, 14 Oct 2025 17:50:17 -0700
X-Gm-Features: AS18NWACCqT3kxFlbATNFzqFu_XOiDjmmd9pdcyMxo1Erfx1Ha14-MwEazkZAV4
Message-ID: <CA+zupgzo9zRO2GHR2Np0Tm4M5_h8y0GF2JGGqE_S0BxSR_ZbqQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
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
X-CRM114-CacheID: sfid-20251014_175055_510100_0E8CCAD1 
X-CRM114-Status: GOOD (  34.07  )
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

On Tue, Oct 14, 2025 at 1:22=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 14/10/2025 03:40, Roy Luo wrote:
> > On Fri, Oct 10, 2025 at 5:09=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 10/10/2025 22:16, Roy Luo wrote:
> >>> Document the device tree bindings for the DWC3 USB controller found i=
n
> >>> Google Tensor SoCs, starting with the G5 generation.
> >>>
> >>> The Tensor G5 silicon represents a complete architectural departure f=
rom
> >>> previous generations (like gs101), including entirely new clock/reset
> >>> schemes, top-level wrapper and register interface. Consequently,
> >>> existing Samsung/Exynos DWC3 USB bindings are incompatible, necessita=
ting
> >>> this new device tree binding.
> >>>
> >>> The USB controller on Tensor G5 is based on Synopsys DWC3 IP and feat=
ures
> >>> Dual-Role Device single port with hibernation support.
> >>
> >> You still mix, completely unnecessarily, subsystems. For Greg this is
> >> actually even undesired, but regardless don't do this for any cases
> >> because it just makes everything slower or more difficult to apply.
> >>
> >> Really, think how maintainers should deal with your patches.
> >>
> >
> > Understood, I will separate the patches into two distinct series: one f=
or
> > the controller and one for the PHY.
> > Appreciate the feedback and the explanation.
> >
> >>>
> >>> Signed-off-by: Roy Luo <royluo@google.com>
> >>> ---
> >>>  .../bindings/usb/google,gs5-dwc3.yaml         | 141 ++++++++++++++++=
++
> >>>  1 file changed, 141 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/usb/google,gs5-=
dwc3.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/usb/google,gs5-dwc3.ya=
ml b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> >>> new file mode 100644
> >>> index 000000000000..6fadea7f41e8
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> >>> @@ -0,0 +1,141 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>> +# Copyright (c) 2025, Google LLC
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/usb/google,gs5-dwc3.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Google Tensor Series (G5+) DWC3 USB SoC Controller
> >>> +
> >>> +maintainers:
> >>> +  - Roy Luo <royluo@google.com>
> >>> +
> >>> +description:
> >>> +  Describes the DWC3 USB controller block implemented on Google Tens=
or SoCs,
> >>> +  starting with the G5 generation. Based on Synopsys DWC3 IP, the co=
ntroller
> >>> +  features Dual-Role Device single port with hibernation add-on.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: google,gs5-dwc3
> >>> +
> >>> +  reg:
> >>> +    items:
> >>> +      - description: Core DWC3 IP registers.
> >>> +      - description: USB host controller configuration registers.
> >>> +      - description: USB custom interrrupts control registers.
> >>> +
> >>> +  reg-names:
> >>> +    items:
> >>> +      - const: dwc3_core
> >>> +      - const: host_cfg
> >>> +      - const: usbint_cfg
> >>> +
> >>> +  interrupts:
> >>> +    items:
> >>> +      - description: Core DWC3 interrupt.
> >>> +      - description: High speed power management event for remote wa=
keup from hibernation.
> >>> +      - description: Super speed power management event for remote w=
akeup from hibernation.
> >>
> >> Wrap at 80 (see coding style) or just shorten these.
> >
> > Ack, will fix it in the next patch.
> >
> >>
> >>> +
> >>> +  interrupt-names:
> >>> +    items:
> >>> +      - const: dwc_usb3
> >>
> >> So just "core"?
> >
> > I'd prefer to stick to "dwc_usb3" as that's
> > 1. more expressive by referring to the underlying IP name,
>
>
> But that's completely redundant name.
>
> > 2. consistent with established dwc3 bindings such as
> >     Documentation/devicetree/bindings/usb/snps,dwc3.yaml,
>
> If you use only one interrupt. You don't use one interrupt here.

After looking into it further, I found that the interrupt name "dwc_usb3"
must be used here to adhere to the interrupt naming defined in
"snps,dwc3.yaml".

This requirement stems from the device's corresponding glue driver
utilizing a so-called "flattened" model (see [1] for context). This model
causes the glue driver to probe an underlying "snps,dwc3" device.
Consequently, the core DWC3 interrupt defined here is consumed by
the driver handling the "snps,dwc3" device, making it mandatory to
follow the interrupt naming established in "snps,dwc3.yaml".
Essentially, the interrupts defined here are a mix of vendor specific
implementation (like "hs_pme", "ss_pme") and the DWC3 core in
"snps,dwc3.yaml" ("dwc_usb3").

I don't know if there's a better way to express this implicit dependency
of the core DWC3 interrupt except for documenting it in the binding
description. Any advice would be welcome.

[1] https://lore.kernel.org/all/20250414-dwc3-refactor-v7-0-f015b358722d@os=
s.qualcomm.com/

Thanks,
Roy Luo

>
> >     Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml,
> > unless you have a strong preference for the alternative naming.
>
> Such namings are discouraged, because they tell absolutely nothing.
> Also, schematics or datasheets usually do not use them, either.
>
>
> Best regards,
> Krzysztof

