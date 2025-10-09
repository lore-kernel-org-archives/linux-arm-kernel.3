Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A77CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 05:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWewaHokP8ZtNf5xV3DaenIr+l1N9Mpv+SreL8jsLig=; b=Nbf1ToLgYRF62iFqHFyv8MsIlj
	OQoLOBv3Y2+c/n5kuslX8lbrdacXOO4PrlVwO5/59J8mFZlIYejf13SGemITY+yAjrlaN9zlfaBw/
	0esa7s0niTi0MFYUHVKeijpKyQjugkDQZnnuSxe1iDRreNO0B8k3UPVi4SrjC1+G8aalyDKJ95jmN
	hfXJVq49H37tUrSloi0lSX9BB5EgKdxJdUd7Pr5cYZddOA8MSPn0h6uIbdgwKglbx7h1oFvkSATPB
	2Q5mwf2Pkv74ON+lV82tyawbjBbsNVUtUdhzJfV6LGnsty0+P3Nv33Toj/o58IigDkCOiDn7MWa7+
	lMB32JYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ixz-00000005CCO-1J0W;
	Thu, 09 Oct 2025 05:13:27 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ixw-00000005CBe-36JY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 05:13:26 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b554bb615dcso322790a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 22:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759986804; x=1760591604; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWewaHokP8ZtNf5xV3DaenIr+l1N9Mpv+SreL8jsLig=;
        b=OlrT2Q9I2d49uUwTFv3Yrv6LxXktiQH5XIXwPr9cBeUCsm0GzxCEG2W9O4JJkF2nB6
         tjSk7Nr4fSPMYfsXO1ezp0p8OQ1e2XfLrNe7BiLnk881Z2oPHV8UykjP1qctVG1ou5m5
         3F3GEdX+BXzJ5GztsajnaCgxQG6SaouMxgrwcv+euIm1RCx0HG3RGcsDKBe9taMqtBGt
         AhpK7msW4AygkQRa33MNh1Ssy+UShI3GDgllzBZMs1EXHS2Fbq4qXTQRQCjNCo7iKlGH
         s+uRuFncU6BHtnpxzw2PKK8H0/dj7uiXg035XBoH/IMvXYzRwyWA3v2ZJk6urTMPz+DW
         rCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759986804; x=1760591604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWewaHokP8ZtNf5xV3DaenIr+l1N9Mpv+SreL8jsLig=;
        b=BV5eWZdi9hSYSp7jZrRXEO1zsu3jasIQ2oQ51OAaG940czRNnwT8XcJ5fbxL5x6cO7
         IpH96eFq3Et0nPZmdv1XxV2zG0XaPyw5nqm7A0OeiYZ2UlhFmsyw3e9bw/s+I1jAba9k
         IKHX3lMw/VlV673PpWXHnhNqIzUN36keJH7goS5bYj9Hx95bbTPnICjS+DBxHRktoFOH
         TK7McfwZhL5zeA4DBNRajIXraLRankAc8McwF7J4F280U1lN6LkkG9iHrBIFg2kUwMsR
         FUwoFGzmRRVJquIixKOjAM8JnVlTkrrevnUiu+/11MgrOXmxdtESe4NBGvY0TfpM7N4i
         jOnA==
X-Forwarded-Encrypted: i=1; AJvYcCXjZtTL0J2Jq743kEKRoiXUOFPZL5+DvP5lqLKAzZDPbP32reYOHEApR8R0rl9qX5ZO3AC/uA8VBBGjUggzmwHc@lists.infradead.org
X-Gm-Message-State: AOJu0YzCF1cqtzQ4Ucxet7x/jjkWo/S1SzfMWeTaCV+poWwHMj+yYJSd
	IArXsZIusMJ6kAa0huHbmijtxG6Wk5LObvomueM8bHfOCiqZv7XYEdZhVvWcWLPpo5g1UCnVYzq
	9NUu/e39bvlmM+7m6e3terydhwZPcukPS5gqca8ul
X-Gm-Gg: ASbGncu9Wf5EGU40HJN45tDAgO89PYnpgxda9rFHqt8ZN8CgUMQyWWP8raq+8UyHdiH
	1JIzNParwJzF7ya1SP6f0+eePA3yQePQKNH0cCQzAOmlh9tvwQ+2IpiysEkY8y+qecCbPPDQoNa
	MFt+wfTiRUs/9sTnGmYz76LT2e46YFIGeRFn8baHWDV8OHC5ncBQSqzOpsFbBhjzB1HalpgwpDu
	H4g3KN7fjJm/+q+/ULuwb/Z+se6Ui7DnD4Ldl6KGjMqZA5pHFgu9gghoBp7VzWPg0mgeFW+cyJ1
	DWv6fA==
X-Google-Smtp-Source: AGHT+IHftw1sTR4jx+skzjrqSGdfm/Q0+OudIaUszRZ3Jo7Mtg1ENnay4Sa6Pgawbis09A4Kl1WSaKxYdl0Pty1Yfo8=
X-Received: by 2002:a17:903:1b46:b0:269:b65a:cbb2 with SMTP id
 d9443c01a7336-2902738685emr79503305ad.47.1759986803355; Wed, 08 Oct 2025
 22:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <20251008060000.3136021-1-royluo@google.com> <20251008060000.3136021-2-royluo@google.com>
 <8966b6a9-ff70-4833-a5c7-c6d6c13c6c8b@kernel.org>
In-Reply-To: <8966b6a9-ff70-4833-a5c7-c6d6c13c6c8b@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Wed, 8 Oct 2025 22:12:46 -0700
X-Gm-Features: AS18NWAeUlPdfPhpwSxxFxgtGGF4Sy9E3bq34jSmHpsPo17xNshrcbYfSpJ1QNc
Message-ID: <CA+zupgwLu-y26X9eiENyC28i9ZxCkuhb0X8X9H6HBpqkqJ7O3w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
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
X-CRM114-CacheID: sfid-20251008_221324_806048_417D5D04 
X-CRM114-Status: GOOD (  33.07  )
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

On Wed, Oct 8, 2025 at 4:56=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 08/10/2025 14:59, Roy Luo wrote:
> > Document the device tree bindings for the DWC3 USB controller found in
> > Google Tensor SoCs, starting with the G5 generation.
> >
> > The Tensor G5 silicon represents a complete architectural departure fro=
m
>
>
> G5 does not have a model number like G1-G4?

There's no model number for G5, I'm sticking to the existing "gs" prefix
as they're still in the same SoC family.  Please let me know if you have an=
y
concerns.

>
> > previous generations (like gs101), including entirely new clock/reset
> > schemes, top-level wrapper and register interface. Consequently,
> > existing Samsung/Exynos DWC3 USB bindings and drivers are incompatible,
>
> Do not reference drivers. Explain the hardware.

Ack, all mentions of "driver" will be removed in the next patch.

>
> > necessitating this new device tree binding.
> >
> > The USB controller on Tensor G5 is based on Synopsys DWC3 IP and featur=
es
> > Dual-Role Device single port with hibernation support.
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  .../bindings/usb/google,gs-dwc3.yaml          | 145 ++++++++++++++++++
> >  1 file changed, 145 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/google,gs-dwc=
3.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml =
b/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml
> > new file mode 100644
> > index 000000000000..9eb0bf726e8d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml
> > @@ -0,0 +1,145 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (c) 2025, Google LLC
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/google,gs-dwc3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Tensor Series (G5+) DWC3 USB SoC Controller
> > +
> > +maintainers:
> > +  - Roy Luo <royluo@google.com>
> > +
> > +description: |
>
>
> Do not need '|' unless you need to preserve formatting.

Ack, will fix this in the next patch.

>
> > +  Describes the DWC3 USB controller block implemented on Google Tensor=
 SoCs,
> > +  starting with the G5 generation. Based on Synopsys DWC3 IP, the cont=
roller
> > +  features Dual-Role Device single port with hibernation add-on.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - google,gs5-dwc3
> > +
> > +  reg:
> > +    minItems: 3
>
> Drop
>
> > +    maxItems: 3
> > +
> > +  reg-names:
> > +    description: |
> > +      The following memory regions must present:
> > +        - dwc3_core: Core DWC3 IP registers.
> > +        - host_cfg_csr: Hibernation control registers.
> > +        - usbint_csr: Hibernation interrupt registers.
>
> Drop description or move it to items in reg. See other bindings.

Ack, will use an item list in reg instead.

>
> > +    items:
> > +      - const: dwc3_core
> > +      - const: host_cfg_csr
> > +      - const: usbint_csr
> > +
> > +  interrupts:
> > +    minItems: 3
>
> Drop

Ack, will use an item list instead.

>
> > +    maxItems: 3
> > +
> > +  interrupt-names:
> > +    description: |
> > +      The following interrupts must present:
> > +        - dwc_usb3: Core DWC3 interrupt.
> > +        - hs_pme_irq: High speed remote wakeup interrupt for hibernati=
on.
> > +        - ss_pme_irq: Super speed remote wakeup interrupt for hibernat=
ion.
>
> From where did you get this style? Don't write bindings with chat gpt or
> whatever other tool. it is a waste of our time.

I referenced the style from a recent dt binding change [1] that adds
"Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml".
I thought it would be a good reference because it's relatively new
and is also a binding for SNPS dwc3 glue logic. Perhaps that style
doesn't apply here because qcom,snps-dwc3.yaml supports
multiple compatible and here we have only one?

Just to clarify, I'm a Gemini user and this patch is 100% organic,
hand-crafted by a living human brain :)

[1] https://lore.kernel.org/all/20250414-dwc3-refactor-v7-2-f015b358722d@os=
s.qualcomm.com/

Thanks,
Roy Luo

>
> > +    items:
> > +      - const: dwc_usb3
> > +      - const: hs_pme_irq
> > +      - const: ss_pme_irq
> > +
> > +  clocks:
> > +    minItems: 3
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    minItems: 3
> > +    maxItems: 3
>
> From where did you get such syntax?
>
> > +
> > +  resets:
> > +    minItems: 5
> > +    maxItems: 5
> > +
> > +  reset-names:
> > +    items:
> > +      - const: usbc_non_sticky
> > +      - const: usbc_sticky
> > +      - const: usb_drd_bus
> > +      - const: u2phy_apb
> > +      - const: usb_top_csr
> > +
> > +  power-domains:
> > +    minItems: 2
> > +    maxItems: 2
> > +
> > +  power-domain-names:
> > +    description: |
> > +      The following power domain must present:
> > +          - usb_psw_pd: The child power domain of usb_top_pd. Turning =
it on puts the controller
> > +                         into full power state, turning it off puts th=
e controller into power
> > +                         gated state.
> > +          - usb_top_pd: The parent power domain of usb_psw_pd. Turning=
 it on puts the controller
> > +                         into power gated state, turning it off comple=
tely shuts off the
> > +                         controller.
>
> Same comments.
>
>
> > +    items:
> > +      - const: usb_psw_pd
> > +      - const: usb_top_pd
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> Best regards,
> Krzysztof

