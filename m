Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4B0CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 04:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qfg2KUrH0ld2loH5dM6+owKjkO3ztYQAbVtuXjduw8k=; b=mIJG8KG8qnOAVqlNHQLrrx0GwZ
	4IBJx+1Ngmg6LThbVyVawI9JSSAKOgH/b6plDmpReqCQf54G3+62nZ1pdcVTb/FwtXwpBHWWjsqVh
	zpbWk0BQ45gvgbjUqk1sy0f19HJ8i1ram4SR3TRNRhEDfbZE/3EK/+7mgWCGFW/gyb1CN6/lelIyB
	zUf2tdlkfY4aztpvkKIo3MF0+bq4DNtKvMVV75AYu9XP/RmH47U67KPeuNU+99qhG/4YxRogEW2sC
	diDz+avrjMmk40toymKR/RsoS5LeNCjNOuk0/axWSyR5KeMVBsHBO9zwzuNjXhGzdWDx9MkcOuQzb
	ibHynExQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6iTC-00000005Aky-0Nzt;
	Thu, 09 Oct 2025 04:41:38 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6iT9-00000005AkJ-3B06
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 04:41:37 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-27eceb38eb1so5538825ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 21:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759984894; x=1760589694; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qfg2KUrH0ld2loH5dM6+owKjkO3ztYQAbVtuXjduw8k=;
        b=jX3xUWdDQZ5u4Xg330WQZ2PNw3T0DBxdlgM27X8ViLg9ZBzCr9+VW8fss5O/qiMmA5
         jwU5s63AdRECFma/d7m74K0Og8NtarLpeYfft/Zdw1ZuWPJJJ8pI3omyhweg23vuw0IN
         8+EZsp4u+/jCYpGcJ6QXqJoGiTe10NDAwFy0l7ZBAnIUIrGxYQQ2wpInvJpx3B3vEjJ4
         g7z4Y+veI3YoV7BU8AKGMG4k91tRgDpUyRF1pkDb/1wFjq+/1q5nfNEXdpPrNiN8jtSQ
         pgvK2VBtZomqQwiBREEaTGfhAjOV6QIRVLgJGN6tGCADW5UdN2veno2Gpl4MpVFmdi/W
         8F+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759984894; x=1760589694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qfg2KUrH0ld2loH5dM6+owKjkO3ztYQAbVtuXjduw8k=;
        b=dg9oQR6OmLboOhuGwTurIIo6SL9+7xUX0GCJ8gvM2Hh8II9usrFT64xF1KA37c8ybQ
         s7SH3srfQnV9KXxswCt9xFLpsY2k760lL8uZDIq8WUs/qjzx1WqLh6Yk2hyNiFKRq3M9
         aqn06z4YFq8gfPRCgEGmur6uXYeg4S4tHFeoZBViBJB/fmnmfGANzwIiPrP3uJ1kvVkR
         Z5sNFUeZaR6p6+WTw0PNbdZm2zjz64nDP8NRE+9kf2eW6DPb2QR1uW1aL+76kBu95Vj3
         ZjoNotZqZ7EEGhwLqaBgJYmA1qaYE16RvSn03M6X4kQURBqyg8IeY0kRRn21bB9k5LOv
         NorA==
X-Forwarded-Encrypted: i=1; AJvYcCVubyWp+zI8U5UUkMJYUtClUE7h2lbHz5Jd4xy8y13LLlHzoWoKbGpK3uhI1a0MXimODbyeQnkUsOQTwKBGVt0W@lists.infradead.org
X-Gm-Message-State: AOJu0YySWKivi9d9yPo7SmKF6NXk5CU6Gp7GyFJX7UG6IgjXo06ymxGm
	POxVf4KfkPpTtilAy5iVc0mYioaMdXA+P2mewJn1GtFrw0oXIgy22oyBrUk2nMTSommQ05oVsnJ
	AlocJjh6AWNNX0LULq/kcGzUyaqcfnH5gwxQ74ua4
X-Gm-Gg: ASbGncv++c5/vLOCEN6zMDiWddInDz0VYJoi4Mw6aETqV6arYEjjuZXp+Vc+D66ZHqM
	9KgD5FNPiMQ1DNFgKRvVZ4qhOErewYx3AcLXfBozM0OZAll9BYEiTejg9HIDYuqn6wvSD7YZPDx
	xBLmuCThlfpOCdHYUZiT2Z1gwFZeGe4k4jw10VySVTumKqhyVTvM4fYepnmTApIVDnw+I+4WSDq
	j8fTqn1qhAYkZCginTPg5+qOGfAiLVdED7gnrAJ18Rgirv3savN2qIYzon2bL4jle01y30=
X-Google-Smtp-Source: AGHT+IHq7WMGknZC9D22TiuSJobcSs2r+0inHJ0URZqm945Ibpmj/rMeznufzslM6ZAVx62ePKO1/By8R2qOoulx2p4=
X-Received: by 2002:a17:903:240e:b0:25c:b1d6:c41a with SMTP id
 d9443c01a7336-290273568efmr77605215ad.11.1759984894045; Wed, 08 Oct 2025
 21:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20251008060000.3136021-1-royluo@google.com> <20251008060000.3136021-2-royluo@google.com>
 <20251008-slider-uncombed-66790ea92ea0@spud>
In-Reply-To: <20251008-slider-uncombed-66790ea92ea0@spud>
From: Roy Luo <royluo@google.com>
Date: Wed, 8 Oct 2025 21:40:57 -0700
X-Gm-Features: AS18NWDwvHFFVwwFF0xyUsh6hOplsl-LTeW3KNkkNIVFS6G7WbYp6KqWo-pnIz8
Message-ID: <CA+zupgxnBK_k2X0_KKX9pUMMTwY4VhsyTEEVz6v+__u=2xR8Ow@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
To: Conor Dooley <conor@kernel.org>
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
X-CRM114-CacheID: sfid-20251008_214135_846360_48D185AE 
X-CRM114-Status: GOOD (  31.12  )
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

On Wed, Oct 8, 2025 at 1:58=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Wed, Oct 08, 2025 at 05:59:57AM +0000, Roy Luo wrote:
> > Document the device tree bindings for the DWC3 USB controller found in
> > Google Tensor SoCs, starting with the G5 generation.
> >
> > The Tensor G5 silicon represents a complete architectural departure fro=
m
> > previous generations (like gs101), including entirely new clock/reset
> > schemes, top-level wrapper and register interface. Consequently,
> > existing Samsung/Exynos DWC3 USB bindings and drivers are incompatible,
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
>
> filename matching the compatible please.
>
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
>
> items is redundant here.
>
> > +
> > +  reg:
> > +    minItems: 3
> > +    maxItems: 3
> > +
> > +  reg-names:
> > +    description: |
> > +      The following memory regions must present:
> > +        - dwc3_core: Core DWC3 IP registers.
> > +        - host_cfg_csr: Hibernation control registers.
> > +        - usbint_csr: Hibernation interrupt registers.
>
> Put this into reg as an items list, and you can drop the min/max items
> from there.
> Same applies to interrupts and power-domains.
>
> > +    items:
> > +      - const: dwc3_core
> > +      - const: host_cfg_csr
> > +      - const: usbint_csr
> > +
> > +  interrupts:
> > +    minItems: 3
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
> > +    items:
> > +      - const: dwc_usb3
> > +      - const: hs_pme_irq
> > +      - const: ss_pme_irq
>
> s/_irq//
>
> > +
> > +  clocks:
> > +    minItems: 3
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    minItems: 3
> > +    maxItems: 3
> > +
> > +  resets:
> > +    minItems: 5
> > +    maxItems: 5
>
> For clocks and resets, please provide descriptions. For clock-names, you
> provided no names and therefore cannot use the property since anything
> is valid!
>
> > +
> > +  reset-names:
> > +    items:
> > +      - const: usbc_non_sticky
> > +      - const: usbc_sticky
> > +      - const: usb_drd_bus
> > +      - const: u2phy_apb
> > +      - const: usb_top_csr
>
> "csr" is an odd thing to have in a reset name, since it usually means
> "control and status register". Why is it here.
>
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
> > +    items:
> > +      - const: usb_psw_pd
> > +      - const: usb_top_pd
>
> s/_pd// at the very least, but I would question the need to put "usb" in
> any of the names given that this is a usb device.
>
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - interrupt-names
> > +  - clocks
> > +  - resets
> > +  - reset-names
> > +  - power-domains
> > +  - power-domain-names
> > +
> > +allOf:
> > +  - $ref: snps,dwc3-common.yaml#
> > +
> > +unevaluatedProperties: false
>
> So every property from snps,dwc3-common.yaml is valid here, with any of
> the permitted values?

Conor,

Appreciate the review.
Ack to all the comments, will fix them in the next patch.
And yes, every property from snps,dwc3-common.yaml is valid here.
You can find more context here [1], essentially the dwc3 glue would be
operating on the same platform device as the dwc3 core, hence all
properties are allowed.

[1] https://lore.kernel.org/all/20250414-dwc3-refactor-v7-0-f015b358722d@os=
s.qualcomm.com/

Thanks,
Roy Luo

> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    soc {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        usb@c400000 {
> > +            compatible =3D "google,gs5-dwc3";
> > +            reg =3D <0 0x0c400000  0 0xd060>, <0 0x0c450000 0 0x14>, <=
0 0x0c450020 0 0x8>;
> > +            reg-names =3D "dwc3_core", "host_cfg_csr", "usbint_csr";
> > +            interrupts =3D <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH 0>,
> > +                         <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH 0>,
> > +                         <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH 0>;
> > +            interrupt-names =3D "dwc_usb3", "hs_pme_irq", "ss_pme_irq"=
;
> > +            clocks =3D <&hsion_usbc_non_sticky_clk>,  <&hsion_usbc_sti=
cky_clk>,
> > +                     <&hsion_u2phy_apb_clk>;
> > +            clock-names =3D "usbc_non_sticky", "usbc_sticky", "u2phy_a=
pb";
> > +            resets =3D <&hsion_resets_usbc_non_sticky>, <&hsion_resets=
_usbc_sticky>,
> > +                     <&hsion_resets_usb_drd_bus>, <&hsion_resets_u2phy=
_apb>,
> > +                     <&hsion_resets_usb_top_csr>;
> > +            reset-names =3D "usbc_non_sticky", "usbc_sticky",
> > +                     "usb_drd_bus", "u2phy_apb",
> > +                     "usb_top_csr";
> > +            power-domains =3D <&hsio_n_usb_psw_pd>, <&hsio_n_usb_pd>;
> > +            power-domain-names =3D "usb_psw_pd", "usb_top_pd";
> > +            phys =3D <&usb_phy 0>;
> > +            phy-names =3D "usb2-phy";
> > +            snps,quirk-frame-length-adjustment =3D <0x20>;
> > +            snps,gfladj-refclk-lpm-sel-quirk;
> > +            snps,incr-burst-type-adjustment =3D <4>;
> > +        };
> > +    };
> > +...
>
> pw-bot: cr

