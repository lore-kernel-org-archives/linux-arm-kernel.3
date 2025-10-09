Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FD0CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 05:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktzba1DKI99kYPMwl1srTlE2mog9+B/vdYobPJ4WgxM=; b=L6RLB9FcgVMA8yMUW8HmVSXnTe
	tJviwLdbFH7J1iLoMKMqADBbguP24ODiO+F+bkFlOAtT7ASezto3iZ7bdgytte+U2rKuV0DrmWve0
	g3Jx4ddw7dt4mJUOfo9ZwmcbcGvpzmrKR+HGvOkWFAzKOAq5rcVoaksZFJRQ1UHj4e0G9fBVktoBT
	4l913mPGX5jiXe+2BTyb4Io3/3N+kCya9HU9QVICdDoX1XQYc3ulAskwXrIZlkvGy589rasAWB9oQ
	IUfkW4G6VhF5fWl+7euoainFlMAwm8AleNzyUOA9qGccsJChOzztsVZdgWhmXIdo+O1+EFBA9Uhg7
	IXX75e1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6jGu-00000005DPR-0NqF;
	Thu, 09 Oct 2025 05:33:00 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6jGq-00000005DOe-4Asb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 05:32:58 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b60971c17acso454839a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 22:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759987976; x=1760592776; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktzba1DKI99kYPMwl1srTlE2mog9+B/vdYobPJ4WgxM=;
        b=O1Pxp+WFlyZUnloyFzQShywE1HotDGiGoy9FFU3W45UAdnz/NCF8FDVth6dCsxHSMw
         E4Eu9MTM63kEbJwrCgxYufg2vigUy8gD5y5afHNOsjyQOjw81txlTfCeM/802EqbeOiU
         UnbULrFo1rmqMOAm2tIPFd4WSm7Po7T8YhnyMayQJi46jyrUkmidZNvs5cHDmUK5DnOl
         YJZtGmqLNgMYIGkuvid2xAEjyf5WK6gZGvuYBQXVltPe0BcOlrATYWIQ3bhbi9nwXHS4
         L3ruc4JzCx9fjYYCThLJe0RLqFPshMd6+hLR0V2eDRCNaU0t9H89ckhdee01QBbtbHa3
         3SsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759987976; x=1760592776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktzba1DKI99kYPMwl1srTlE2mog9+B/vdYobPJ4WgxM=;
        b=qzt8TBsmAyylvOiOfq/4pDACVkfslL76AfUEdIxG1U5GxuxCeXfh+LAILwntL/Ev6f
         KwvIvGRww3gAcV7Kv75G8PVCPHJNLUZTjlu9gJ4IsfItiOZ9TDfaGGTckFcTqNkeAW1n
         npAV1bVmhi3J6TpRTi6AKggLi7cXpuMkptd25NzSetLjdGns/EPgAdpy+jzsjJWnDYkG
         rzZRO5mQSJ0v6MaoQvDK7PEvbRQn1pJo9zX/TkD1acUTTPRqAfMF0miaSygOprnPCKs7
         ZI9MA4yv5W2vZw4qujsTVJjQQIXenay8yMkctvrEmCpIgGNng563y0rzK4/bRTCW6bNe
         zD4g==
X-Forwarded-Encrypted: i=1; AJvYcCVOMzTIYGUhtg6b6zqHShpNr5K+foMPE6emvIyTDNj3NtuumY6fhDRl2DyLHQ4lPuMmI67T5Lgbxf744Eo3ljNz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7oS3+clX7eATMwVx5pcVQxZ7Nz/NpOKmpW5Skpfz/+52ywD90
	tFa+UoF6v/A3P0gvvwuQAUAL2iR98klyCec9NRkBgba3c6dlWgm/xtnHvSwOYZ6Yyy+n60eOri4
	hn9WekdpxDFWyrgP2UOzbSe/lNk499q7o5WNM+y44
X-Gm-Gg: ASbGncsrlVYn8Uo0Ws0srdmvCdIuzofvpZ+1QOyprulBHxRioDAkX/JPmoxAqqKFr8U
	nXgxz23AWgJih5wS45+6KhnDrQqGm25j93qBl40yj85X+S21NCKqEVrZ+kGnVdA1MsTR5LPzeyV
	qrrNyHXwVA2T2mriIQ+kX9V6q0GrGQs7VpRIHytztkUYhX3bRz4qDaRZm7jM3mkESlZHq/Xv/Jx
	9UKObLL+/FGk8tFdEk6GhXAlz4gPNABP02sQ0e4zXGrZgBhzXQso7tcmUODJmqw94V0LhQq09HF
	rBy9fA==
X-Google-Smtp-Source: AGHT+IESVUNCkk4qmxVAx9LJph/+dlWojTCH2hUrbcfDKEG7HjEaHHrdoMtO6Rsw83EBp0EQAopUJwb8ZBCKUnW4eIk=
X-Received: by 2002:a17:903:3c30:b0:270:ea84:324a with SMTP id
 d9443c01a7336-290272c1898mr84726695ad.38.1759987975870; Wed, 08 Oct 2025
 22:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20251008060000.3136021-1-royluo@google.com> <20251008060000.3136021-4-royluo@google.com>
 <fa743412-d9f1-43fd-95e8-3b2a58cd6c25@kernel.org>
In-Reply-To: <fa743412-d9f1-43fd-95e8-3b2a58cd6c25@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Wed, 8 Oct 2025 22:32:19 -0700
X-Gm-Features: AS18NWBygRM42KHUCeYjOx9jxiQbWPiyFalWSXt9KQT6EVktBFe8TaXkrSn7-PI
Message-ID: <CA+zupgyjkyr-zfnecvL5i572q-S2BPSz9w-ue+OmyGoj7EtW_A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
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
X-CRM114-CacheID: sfid-20251008_223257_038929_91CA45F8 
X-CRM114-Status: GOOD (  29.73  )
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

On Wed, Oct 8, 2025 at 4:58=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 08/10/2025 14:59, Roy Luo wrote:
> > Document the device tree bindings for the USB PHY interfaces integrated
> > with the DWC3 controller on Google Tensor SoCs, starting with G5
> > generation.
> >
> > Due to a complete architectural overhaul in the Google Tensor G5, the
> > existing Samsung/Exynos USB PHY driver and binding for older generation=
s
> > of Google silicons such as gs101 are no longer compatible.
> >
> > The USB PHY on Tensor G5 includes two integrated Synopsys PHY IPs: the
> > eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo PHY IP. Currently onl=
y
> > USB high-speed is described and supported.
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  .../bindings/phy/google,gs-usb-phy.yaml       | 96 +++++++++++++++++++
> >  1 file changed, 96 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/google,gs-usb=
-phy.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/phy/google,gs-usb-phy.ya=
ml b/Documentation/devicetree/bindings/phy/google,gs-usb-phy.yaml
> > new file mode 100644
> > index 000000000000..22961e2da6ef
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/google,gs-usb-phy.yaml
> > @@ -0,0 +1,96 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (C) 2025, Google LLC
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/google,gs-usb-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Tensor Series (G5+) USB PHY
> > +
> > +maintainers:
> > +  - Roy Luo <royluo@google.com>
> > +
> > +description: |
> > +  Describes the USB PHY interfaces integrated with the DWC3 USB contro=
ller on
> > +  Google Tensor SoCs, starting with the G5 generation.
> > +  Two specific PHY IPs from Synopsys are integrated, including eUSB 2.=
0 PHY IP
> > +  and USB 3.2/DisplayPort combo PHY IP.
> > +  The first phandle argument within the PHY specifier is used to ident=
ify the
> > +  desired PHY. The currently supported value is::
>
> Currently supported as hardware will change? You describe here hardware
> ONLY.

I wanted to explain the PHY specifier as I saw other bindings are also doin=
g it,
e.g. "Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml".
Theoretically the hardware supports 3 PHY interfaces: high-speed, super-spe=
ed
and DP, however, the corresponding driver only supports high-speed at the
moment.
I can still document all the 3 PHY interfaces and assign them with
a theoretical specifier value here as that's what the hardware is capable o=
f,
and then make it clear that only high-speed is currently supported on the d=
river
side. Does this make sense to you?

>
> > +    0 - USB high-speed.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - google,gs5-usb-phy
> > +
> > +  reg:
> > +    minItems: 3
> > +    maxItems: 3
> > +
> > +  reg-names:
> > +    items:
> > +      - const: usb2_cfg_csr
> > +      - const: dp_top_csr
> > +      - const: usb_top_cfg_csr
>
> Drop csr
>

Ack, will fix it in the next patch.

> > +
> > +  "#phy-cells":
> > +    const: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: usb2_phy_clk
>
> Drop names, pointless for one entry.
>

Ack, will fix it in the next patch.

> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  reset-names:
> > +    items:
> > +      - const: usb2_phy_reset
>
> Drop names, pointless for one entry.
>

Ack, will fix it in the next patch.

> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  orientation-switch:
> > +    type: boolean
> > +    description:
> > +      Indicates the PHY as a handler of USB Type-C orientation changes
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - "#phy-cells"
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +  - reset-names
> > +
> > +unevaluatedProperties: false
> > +
>
>
> additionalProps instead. Read writing schema or example schema.
>

Ack, will fix this in the next patch.
Appreciate the review!

Thanks,
Roy Luo

>
> Best regards,
> Krzysztof

