Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BBCCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 23:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfR9l6DRduOmqk2saCjRPV+UB+Qm0nERAOdlSE0n2ok=; b=NeR4yPbH2+toUUoswTdv9ka+Qy
	TIV/Q7AzZF6SgXU8RA3Ncvo4FjiBNYGsfmnKFXL07PDGHiaZqIG4XaH53v7yngkj1/5jPY23GAuO4
	R/Cw9J1+TfCAZSod4l2luRtehJM7+x5a6M21Z+QRI13SKV5WUiI+SpsseocMxYEifnyzDW/0Oh0hi
	s+C0VA7Vp19WprwJLYpwaSdBW3343Elgny2n4OpfFzhT8DqV80J/iifD835/+b9nrP7/pRPQhDi5t
	E4LE7JG2JERT6uIBJtMtpWloB2lkH/zZy/nCz/4Lt76S9JU9VyuIO4Gno5oyKJTB4MO9mTcXtU3fu
	MBy/GNUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEyog-00000006uv4-1jyf;
	Fri, 31 Oct 2025 23:45:58 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEyod-00000006uuG-33ge
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 23:45:57 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so2780803b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 16:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761954354; x=1762559154; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfR9l6DRduOmqk2saCjRPV+UB+Qm0nERAOdlSE0n2ok=;
        b=Uf7bbU4gkdLzLkezijRJlR5uaLi0vtwnzXjoLDzOuzeSdmknGJdMc3TylQLIJLN42a
         s48V8wXvruSD7r0FGShXMLYdwulzWyh8biheYtncyNz4hThCv83iEkKafBsfETDNhV8b
         Q9AQUTn/f9EIyQt/hGlWntuKTU1oEWGxxegYBMU9BkHitQrVec3YM7OZzpb+12pbWM+n
         zOW8agYbSXOHbf3Ebr0qFoyTwi7JqzZtgLdX8QcBmpDVHQBIej3E3DbjsRF/Hy2riRya
         ChYSp9/3AUVhHxZ3Gdrr3k0EI7DwcaDjoL6Ar/ac9EjbGvpeMR+o3luo+AxNAUKMgjij
         ACIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761954354; x=1762559154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfR9l6DRduOmqk2saCjRPV+UB+Qm0nERAOdlSE0n2ok=;
        b=DCjEnCDe3aGord7qcJVm1mWY+wsPOE1T12u32l24YCvKdZXqOAD+laR1KlzUimwa5t
         Jgx57tQFYHrUO4kh7ymM5Uc5WYZ5S9mO/Ptm26ZU3nZTbL4puU2EGs06ECFLE/30A4tb
         r7rKONorK/Wa9MDp8G6YngmZHvcnzvIwn7KT5BK66ljn5SUrq7m5hCmh3uZzfL8zzoav
         Xk7pHi7WuioQtinu5C1WuEHcQ9uITBlfPlrscXQLO2JQGyOfPr+fEFWSutS/y9PYF4t5
         NkZSHGu99S5eDJJZ/vRCT0ygMQasLKFYK+i+XICpaVVuhlk9XlcJ5yYEtamEMOfWe8mk
         xz8w==
X-Forwarded-Encrypted: i=1; AJvYcCUNwoO4/iT+5gGCsY9hZjFsT0tsgGmAE+enu/W+nFgoTMP71y5L6pbmmLwLZc9sIvdpxtab+3FZ2HunkkzubN/M@lists.infradead.org
X-Gm-Message-State: AOJu0YxUgkRfrsotPUMomUwqWeDMjYM4A/a0YZkxM3HXL3DjHquOfS2w
	ppVDMI4gYdZTLw8i/PoFY5vC1rmonmp65HtftERgEgUS6uLhRZNIh/AzqIhUzsaIyev7rzq/eAv
	GyfYhXwem2TE8PpwPqzM/7byBJv6DYkhntktxdO4O
X-Gm-Gg: ASbGnctQ0b78T93PRQI5N0mXypQyxOUd7LH+QSP4MdT7nmWiFrtdv0y6GiCOgMrGRP3
	SRP+LmRpnUBOnorPezGz7mZIGaWtU155MDecS++gcpdBkOnlZCG/Z+W8CmPXv4WlOaoj5CG6P3/
	FkGyDfDjYM2ulYZp+J2omsyXNlC44rA7akWY6eza98sEDtBrK+wytfIWKWTkhMf6/AZuxQoHh24
	nWdxgPCLq0QA+exqSfeSIZLr/UzsEkM6gs6dH9+emLtpCYFRBD76LC21JYW/nLzDJzq4HS6xe7Q
	ci+T8+I7UA+21uey
X-Google-Smtp-Source: AGHT+IFPdvFe/pMPUJplv+X0Jq5mOmKEcydS82p+NTasUHTcfiqahbrVRLGJQ3FKbcWUmKbkOdLRKW3c4LwYcpzwoXQ=
X-Received: by 2002:a17:902:d2cd:b0:290:b92d:907 with SMTP id
 d9443c01a7336-2951a511475mr66921545ad.53.1761954353589; Fri, 31 Oct 2025
 16:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20251029214032.3175261-1-royluo@google.com> <20251029214032.3175261-2-royluo@google.com>
 <20251030-cunning-copper-jellyfish-1b5f3b@kuoka>
In-Reply-To: <20251030-cunning-copper-jellyfish-1b5f3b@kuoka>
From: Roy Luo <royluo@google.com>
Date: Fri, 31 Oct 2025 16:45:15 -0700
X-Gm-Features: AWmQ_bmO0vWs_gLnS0Ww23izAMQNvvQgDrOF0xipRHiQf9rQ8XlagmQ9EzJ_9xY
Message-ID: <CA+zupgxV7SH8Jmghg7HUkWi63dN3m6KLQNBbf+BOQPFbRsiKiw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Doug Anderson <dianders@google.com>, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_164555_782855_EB9BD91E 
X-CRM114-Status: GOOD (  41.83  )
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

On Thu, Oct 30, 2025 at 12:37=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Wed, Oct 29, 2025 at 09:40:31PM +0000, Roy Luo wrote:
> > Document the device tree bindings for the USB PHY interfaces integrated
> > with the DWC3 controller on Google Tensor SoCs, starting with G5
> > generation. The USB PHY on Tensor G5 includes two integrated Synopsys
> > PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo PHY IP.
> >
> > Due to a complete architectural overhaul in the Google Tensor G5, the
> > existing Samsung/Exynos USB PHY binding for older generations of Google
> > silicons such as gs101 are no longer compatible, necessitating this new
> > device tree binding.
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  .../bindings/phy/google,gs5-usb-phy.yaml      | 127 ++++++++++++++++++
> >  1 file changed, 127 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-us=
b-phy.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.y=
aml b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> > new file mode 100644
> > index 000000000000..8a590036fbac
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> > @@ -0,0 +1,127 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (C) 2025, Google LLC
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/google,gs5-usb-phy.yaml#
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
> > +
> > +properties:
> > +  compatible:
> > +    const: google,gs5-usb-phy
> > +
> > +  reg:
> > +    items:
> > +      - description: USB3.2/DisplayPort combo PHY core registers.
> > +      - description: USB3.2/DisplayPort combo PHY Type-C Assist regist=
ers.
> > +      - description: USB2 PHY configuration registers.
> > +      - description: USB3.2/DisplayPort combo PHY top-level registers.
> > +
> > +  reg-names:
> > +    items:
> > +      - const: usb3_core
> > +      - const: usb3_tca
> > +      - const: usb2_cfg
> > +      - const: usb3_top
>
> These prefixes are redundant. Also, you are still referencing here
> completely different devices. MMIO of IP blocks do not have size of 0xc
> and they do not span over other blocks (0x0c410000 and then next one is
> 0x0c637000).

I'd like to explain why MMIO of IP blocks looks discontinuous.
As outlined in the description, this device contains two SNPS PHY IPs
including eUSB2 PHY and USB3.2/DP combo PHY, and is integrated
with the SNPS DWC3 USB controller. A top-level subsystem wrapper
sits above the PHYs and controller. This wrapper integrates these IPs
and is where the Tensor-specific implementation resides. It's essential
to touch these wrapper registers to control the underlying SNSP IPs.
Unfortunately, the top-level wrapper's MMIO space lacks a clear
boundary between these IPs. Specifically, the registers required to
configure a particular IP are not always adjacent to that IP, and in
some cases, multiple IPs may even share the same address space.

The following is the register layout overview:
- 0xc400000: Dedicated address space for DWC3 controller IP.
- 0xc410000: Dedicated address space for USB3.2/DP combo PHY IP.
- 0cc440000: Dedicated address space for the eUSB2 PHY IP.
                      While this is not in use, it should perhaps be
called out in
                      the binding for completeness.
- 0xc450000: This address range contains top-level wrapper registers
                      and its space is shared by two devices: the DWC3
                      controller and the eUSB2 PHY.
                      It includes control registers for the DWC3 controller
                      (e.g. hibernation control and interrupt registers) an=
d
                      the eUSB2 PHY (e.g. registers for USB2 PHY
                      frequency configuration).
                      Because the space is shared, the MMIO range for the
                      PHY becomes fragmented and is only allocated a size
                      of 0xc, as the remaining registers in this range are
                      assigned to the DWC3 controller.
- 0xc460000: This address range contains registers for other blocks
                      within the same top-level wrapper (such as PCIe PHY
                      and DP controller) which are not relevant to USB.
- 0xc637000: Another region of top-level wrapper registers.
                      This area is relevant to both the eUSB2 PHY IP
                      (e.g. control register for vbus valid) and USB3.2/DP
                      combo PHY (e.g. registers relevant to PHY firmware).

Thanks for taking the time to go through this wall of text.
This is definitely not an ideal register layout, but I'm open
to any suggestions on how best to address this fragmentation.
If discontinuous MMIO space is a concern, does it make sense to
make the wrapper registers a syscon node so that it can be
shared by multiple devices?

>
>
> > +            reg =3D <0 0x0c410000 0 0x20000>,
> > +                  <0 0x0c430000 0 0x1000>,
> > +                  <0 0x0c450014 0 0xc>,
> > +                  <0 0x0c637000 0 0xa0>;
> > +
> > +  "#phy-cells":
> > +    description: |
> > +      The phandle's argument in the PHY specifier selects one of the t=
hree
> > +      following PHY interfaces.
> > +      - 0 for USB high-speed.
> > +      - 1 for USB super-speed.
> > +      - 2 for DisplayPort.
> > +    const: 1
> > +
> > +  clocks:
> > +    minItems: 2
> > +    items:
> > +      - description: USB2 PHY clock.
> > +      - description: USB2 PHY APB clock.
> > +      - description: USB3.2/DisplayPort combo PHY clock.
> > +      - description: USB3.2/DisplayPort combo PHY firmware clock.
> > +    description:
> > +      USB3 clocks are optional if the device is intended for USB2-only
> > +      operation.
>
> No, they are not. SoCs are not made that internal wires are being
> disconnected when you solder it to a different board.
>
> I stopped reviewing here.
>
> You are making unusual, unexpected big changes after v4. At v4 you
> received only few nits because the review process was about to finish.
>
> Now you rewrite everything so you ask me to re-review from scratch.

Apologies for the trouble, my intent was to address your feedback on v4
by describing the USB3/DP PHY block for completeness.
Like mentioned earlier, this device contains two underlying IPs: eUSB2
PHY and USB3.2/DP combo PHY. The device can operate in USB2-only
mode by initializing just the eUSB2 block without touching the USB3
PHY block - but not the other way around. The v4 patch reflected this
USB2-only configuration.
I tried to support the USB 2.0-only configuration in the binding by
making the USB 3.0 clocks and resets optional. However, if I
understand your comment correctly, the binding should describe
FULL hardware capability. I will make USB3 resources mandatory
in the next version, please let me know if I've misunderstood it.

>
> > +
> > +  clock-names:
> > +    minItems: 2
> > +    items:
> > +      - const: usb2
> > +      - const: usb2_apb
> > +      - const: usb3
> > +      - const: usb3_fw
>
> Again, what's with the prefixes? apb is bus clock, so how you could have
> bus clock for usb2 and usb3? This means you have two busses, so two
> devices.

The prefixes are to differentiate the clocks and resets for the
underlying two SNPS IP as outlined in the device description.
- eUSB2 PHY IP needs clocks and resets for the phy itself
  and its apb bus.
- USB3.2/DP combo PHY has its own clocks and resets for
  the phy, plus it needs a clock for its PHY firmware.
Technically these are two separate IPs, but they're deeply
integrated together so that they share top-level wrapper
register space (see the register layout above), and they
have implicit hardware dependency like mentioned earlier
(USB2 PHY can work without USB3 PHY, but not vice-versa),
hence I'm describing them in the same device.

Thanks,
Roy Luo

>
> > +
> > +  resets:
> > +    minItems: 2
> > +    items:
> > +      - description: USB2 PHY reset.
> > +      - description: USB2 PHY APB reset.
> > +      - description: USB3.2/DisplayPort combo PHY reset.
> > +    description:
> > +      USB3 clocks are optional if the device is intended for USB2-only
> > +      operation.
> > +
> > +  reset-names:
> > +    minItems: 2
> > +    items:
> > +      - const: usb2
> > +      - const: usb2_apb
> > +      - const: usb3
>
> And here?
>
> This all looks like downstream code.
>
> Best regards,
> Krzysztof
>

