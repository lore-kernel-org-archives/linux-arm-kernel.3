Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE9DCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 01:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0HrrIP4IFVgvTei6bJGzfuFKTrJwkNbVYBJNZOs3MY=; b=2rXy2CSyCYhhDGWA1LoDWMigVm
	B0NBsT6v/zRQuFjK0X/dXh926tBlJrZce2HKKmx5DQOp2s786qPu3v5NxqiSDoBOx28jzcOzBbFpN
	efYaxThxwKclA8iCxbdVw3yq+h61rHhWPIy/w6+4KUfqQrZXUKlsyFpocU1/jIiZIvwUT0r/viWxA
	9B3qa0CzF2B8RaXi6qi3ScOTUIhKyxhby6V0nVqVPES2bC11Rbr5uhWmYfs2SzE+NcOb6NJI7JIG+
	EMblv+A9dU7v/5dArh4uJRFLXxhPyUEePnMbVTi7qm/QZ/OXVzUrcr91w/FXG8TBAep0dMTBdQuJA
	tXwCzl9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8U1x-0000000EuZh-2vXU;
	Tue, 14 Oct 2025 01:40:49 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8U1u-0000000EuYm-3tNJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 01:40:48 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-78f3bfe3f69so4288660b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 18:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760406045; x=1761010845; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0HrrIP4IFVgvTei6bJGzfuFKTrJwkNbVYBJNZOs3MY=;
        b=HodcCrXVDqc6ScNfOtdOxZ6Zmy9/wZI8y/T+SQGDyA9sfbqjMTxOtiCVRJgaSjsFiy
         NcQQ4KXJDBFg+e8DBCpYFQfFE2wOu+2+AxvdHmQk0qyvPLgDNhAEqVaC3IVYJAxFDkR6
         rqST5UAHLukv/cmRKKo+7XRuYGh4obxz4uktq9oNsEoa2v8NwzLe/msyOEQhEQgHJCRW
         m7hmT+PmIUDKgyenZy5zqAc4nYrABr+Oif6NqGtAmcJzgsiJhwxqZ8wVdfQl8t0BtOpH
         o+EoGCYpc7Z9Uu6o4Lw8eUkecpSlg05cO5r0mdSWp0sDEZpHMrIqtq5e+wklm2wEfPpT
         cB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760406045; x=1761010845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0HrrIP4IFVgvTei6bJGzfuFKTrJwkNbVYBJNZOs3MY=;
        b=Spl3bT26L/y+DZS2RrQ3S7JsWnOGGSVNldfNGIwucykEo116i9QBwNsW8EPSQL6Vp3
         yMoxstBJ43DtJB45DF6PqSh5/szJcCGY55UMCg47UhujChtJkgvwRFBe35m/EfNDACVT
         +3Lc3KsSEnQdw4eZOd4k78J9JvCLZazp8rodrO8d00yJGQmBc6L36I53itmmFtCHv+Ai
         8HFMZTyTDOmDNpt1iru+9SmnXf0iGoH4LRrKeS08bsWKwS1HmgQ4A+A5NPScNbqD/eYD
         X4A1Y+lb/rNKoHCjHbFj7IZ7tJWzGCKui5zsD+9xLFlOTPF31SWwbpsUTIsP/DO0QSCv
         8Fyg==
X-Forwarded-Encrypted: i=1; AJvYcCUa2uiW7YMkNtZAxlRLhSnucP6Z1nwgRr5raKEzOsjzjmmeySEQ/ga68bBAoybimSlGIOIgUyO9C2kDdxMZo0fB@lists.infradead.org
X-Gm-Message-State: AOJu0YzX46b9h03GbjnNiYz3mX8jxIYmV58S0Q6HB7qj585kKnkTcStg
	eZLZoJabdGFhb5P+3RndlPMWJCaN4HGfU4l5NQMvMeljXJKkHBN/12SVQVppEMf02x36/k0/AQ/
	Yt9C2JX4BuHw9nMN9Vm9kr7Qr15It10lozo3tn33p
X-Gm-Gg: ASbGncv+PqONKkKa4E/f2dCLEuvwlwmr+wsOP8e+ys6p32RSU+kzKrBG1x0bGeY1PPf
	O+/Lb5FeFgJ97wJJ/H6MlB8WPGkqw4lbY8lR/RaRcTU4fSHe6y2GImI2ON0kagf2mDejblSWqdS
	RtDRnXaw03Mr4HtJkYIErEplD5Gm0pbctY+4zmVKuk416YB6pDrdFl3PVvXpQQ6PPTSmeejXnsl
	0uuXJLjyE/HWTs6+sfQNL9pWefq4plu9kyPqRCbGDPqGL51LMcXj3BQme2V3++r4/bBy+lFwYXX
X-Google-Smtp-Source: AGHT+IH/gaVhehz3sRp9VrrzaU79D/o/NZJP8CN7/dl/fC68uxDpeqnl6j3qA8EnLxqoVUctH31vKw6FBzQox/YYs6w=
X-Received: by 2002:a17:903:2408:b0:28e:7fce:667e with SMTP id
 d9443c01a7336-2902723f51emr324260245ad.17.1760406045183; Mon, 13 Oct 2025
 18:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251010201607.1190967-1-royluo@google.com> <20251010201607.1190967-2-royluo@google.com>
 <066a9598-ad30-4327-be68-87299bba6fda@kernel.org>
In-Reply-To: <066a9598-ad30-4327-be68-87299bba6fda@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Mon, 13 Oct 2025 18:40:08 -0700
X-Gm-Features: AS18NWCf063mHzWv1lf5a6FraaWgtqWiANzRpv6KaU2cy8h_cSvnS3pGamEVoLc
Message-ID: <CA+zupgwc7b51pNRLWRy2CX=n4=FTm=AP7J0dRP2RLjyK5LxGtw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251013_184046_994754_254FDC90 
X-CRM114-Status: GOOD (  28.50  )
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

On Fri, Oct 10, 2025 at 5:09=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 10/10/2025 22:16, Roy Luo wrote:
> > Document the device tree bindings for the DWC3 USB controller found in
> > Google Tensor SoCs, starting with the G5 generation.
> >
> > The Tensor G5 silicon represents a complete architectural departure fro=
m
> > previous generations (like gs101), including entirely new clock/reset
> > schemes, top-level wrapper and register interface. Consequently,
> > existing Samsung/Exynos DWC3 USB bindings are incompatible, necessitati=
ng
> > this new device tree binding.
> >
> > The USB controller on Tensor G5 is based on Synopsys DWC3 IP and featur=
es
> > Dual-Role Device single port with hibernation support.
>
> You still mix, completely unnecessarily, subsystems. For Greg this is
> actually even undesired, but regardless don't do this for any cases
> because it just makes everything slower or more difficult to apply.
>
> Really, think how maintainers should deal with your patches.
>

Understood, I will separate the patches into two distinct series: one for
the controller and one for the PHY.
Appreciate the feedback and the explanation.

> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  .../bindings/usb/google,gs5-dwc3.yaml         | 141 ++++++++++++++++++
> >  1 file changed, 141 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/google,gs5-dw=
c3.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml=
 b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> > new file mode 100644
> > index 000000000000..6fadea7f41e8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> > @@ -0,0 +1,141 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (c) 2025, Google LLC
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/google,gs5-dwc3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Tensor Series (G5+) DWC3 USB SoC Controller
> > +
> > +maintainers:
> > +  - Roy Luo <royluo@google.com>
> > +
> > +description:
> > +  Describes the DWC3 USB controller block implemented on Google Tensor=
 SoCs,
> > +  starting with the G5 generation. Based on Synopsys DWC3 IP, the cont=
roller
> > +  features Dual-Role Device single port with hibernation add-on.
> > +
> > +properties:
> > +  compatible:
> > +    const: google,gs5-dwc3
> > +
> > +  reg:
> > +    items:
> > +      - description: Core DWC3 IP registers.
> > +      - description: USB host controller configuration registers.
> > +      - description: USB custom interrrupts control registers.
> > +
> > +  reg-names:
> > +    items:
> > +      - const: dwc3_core
> > +      - const: host_cfg
> > +      - const: usbint_cfg
> > +
> > +  interrupts:
> > +    items:
> > +      - description: Core DWC3 interrupt.
> > +      - description: High speed power management event for remote wake=
up from hibernation.
> > +      - description: Super speed power management event for remote wak=
eup from hibernation.
>
> Wrap at 80 (see coding style) or just shorten these.

Ack, will fix it in the next patch.

>
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: dwc_usb3
>
> So just "core"?

I'd prefer to stick to "dwc_usb3" as that's
1. more expressive by referring to the underlying IP name,
2. consistent with established dwc3 bindings such as
    Documentation/devicetree/bindings/usb/snps,dwc3.yaml,
    Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml,
unless you have a strong preference for the alternative naming.

>
> > +      - const: hs_pme
> > +      - const: ss_pme
> > +
> > +  clocks:
> > +    items:
> > +      - description: Non-sticky module clock.
> > +      - description: Sticky module clock.
> > +      - description: USB2 PHY APB clock.
>
> This looks wrong. This is not the USB2 phy, so how can it consume APB clo=
ck?

That's a fair point, I'll look into the necessity and placement of this spe=
cific
clk/reset and get back.

Thanks,
Roy Luo

>
> > +
> > +  clock-names:
> > +    items:
> > +      - const: non_sticky
> > +      - const: sticky
> > +      - const: u2phy_apb
> > +
> > +  resets:
> > +    items:
> > +      - description: Non-sticky module reset.
> > +      - description: Sticky module reset.
> > +      - description: USB2 PHY APB reset.
>
> This as well.
>
> > +      - description: DRD bus reset.
> > +      - description: Top-level reset.
> > +
> > +  reset-names:
> > +    items:
> > +      - const: non_sticky
> > +      - const: sticky
> > +      - const: u2phy_apb
> > +      - const: drd_bus
> > +      - const: top
>
>
> Best regards,
> Krzysztof

