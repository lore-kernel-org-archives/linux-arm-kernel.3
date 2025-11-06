Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917CACCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 02:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrNYBY0uDogTJqDUTL8SdY3sJ+APNZYWuMmVdEToT+s=; b=PufViQpIqxuF7Woaag1Ty2jj8P
	6SUcbr00R2fntmtyRUpmbBsSVAI2X3uHrVbz/gfH0lpbIt6e4J4ylmZZRssRsaXKG3/tGrDf8oOJw
	M48j+cuC3yNGmg+eEQR1jszJhBwNqNdDmgDNSeEP6v71dmzU4YtEU66gCYlM7dG43/Wk2qi35Q5VA
	+q5ve8m0Ic6ZRmH7YSYolZ8/ToFrCIiNntuv99N6roULPdHwdh9bNXKXel2Az6Nv9BXv5V3s7z7/8
	ly6SHNYMt6OKnWtbzQ4GhqCCv5bW1mO8l8K7KS3nPru1hBqhSQzSBYaC41nbAXg1xx2qKg4hfNh1O
	UuXFUGLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpYY-0000000Ekh6-2Tpi;
	Thu, 06 Nov 2025 02:16:58 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpYV-0000000EkgD-0XN2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 02:16:56 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7a9c64dfa6eso424073b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 18:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762395413; x=1763000213; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrNYBY0uDogTJqDUTL8SdY3sJ+APNZYWuMmVdEToT+s=;
        b=TcRtaaE05bB4ldF/50oqkqIuIOxIeKrffloKzg2Ty2YsYqyzrW3ngCKlAN5Bs+QcAC
         crVj/q/PjBdhebyKwGhFO3G1V1csJVjpoJThHHHrtNCWdFbIx4zr9Yo6q+qzvY51nrBY
         f/EJkPCSNW2nH60YjrE1vONzo3wBhB6IKAWxRkMAX4P6jQXssxBMn9C4uBN/RE2wA7T0
         ibqatY8NAqLlm40hA4ayfsUMDQ8Km78VBRu+dWMilaOv5geitizgIKC1fjwSF+sFCP56
         ihiJrRpC+Y94nzrQyVy2b4u/Akqy/5/eCP1XMs+76nw6QzPEtk6+7T0QcbI9ifiQ6ISp
         FuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762395413; x=1763000213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrNYBY0uDogTJqDUTL8SdY3sJ+APNZYWuMmVdEToT+s=;
        b=mddMV2N4R00c7WJl7H99z/VkNThy2xqBEgjujDq5Utk94Ku7VKZKy13yJeldMQMRiC
         vatF4kh+z1pHdsCLNmkhG83EUhNa4UqYqzyLu9l4yJxQVmr577A+MCnjGV+xBJ/rstmv
         P9iIYof68BLtsx4cL9k7RduxMPLbo4KCy6cSfYtp+PClqnTtKgPle1CWB0pMuNAO2wlC
         46FVz+mjHCxBCfm7lLaxdtCLLZLlNSBBVeWjOdKIUCV9JPp13YxyKPOkZzUOBmvmNp+d
         Qj3ufkCgqZbhBw+bvgogE9ah8zcPHDMJVi4ahNCp2/W4MPPQt8hMpNfQjWSKMQhad/ez
         Gkog==
X-Forwarded-Encrypted: i=1; AJvYcCWf2Pb6igzhyS9bEXrxBbsSl4ILva9qHereS74StYyT3VlzZaR6ZZDjyRYTa5iKmadF8ZEapUBm3vfbbHGOykO1@lists.infradead.org
X-Gm-Message-State: AOJu0YyXwP2wqBwqmLNpBC3bjOjKS1mFvW4tIToP7i7T9fYF0J64mr/o
	puBFxioZ1gsxnPl8Zcqf4mkfAQ9rjAdn1tZRshdhvVem38yypiOWg5ICDoRCH6y6VZRUSIYhuzt
	IyiTmL00yvhLNexHpAxB6kRMUbvZBoy07Q/NJr8JV
X-Gm-Gg: ASbGncub1f6s/VZoKYC38ZxMmRRRfbTTdClpxIYLHWOKJ9sr/U5MgV+RMFFVQxaogam
	XOj05EQ0s6gq3zXuHunAou589QXaHKlfcU8HnACjOTlBRbJCpbGbjry9+VrkB4peUkvNYtEJM74
	gAureKMSNXw/4KEDOTwKMLpd6VEw5R19Ct4/+BhLxTy4apgWYOJ60Est2QkN2o2EVPleWViJ87h
	LNDSOE+Kx9UdQ39FJ7LkLLzK9RKoM7c7onGGQBMTDOL31U+7XYS3/EoBbCRY/HQBKvKFQo=
X-Google-Smtp-Source: AGHT+IFYUtRUnq5Tlp2AO4zwtJX03OzLHRNivbEQJDmktuqmlXs8Cal9wRhNwuoZpTtabe8XyDCfLQP2a9LsycDuD/s=
X-Received: by 2002:a05:6a20:a126:b0:32d:a91a:7713 with SMTP id
 adf61e73a8af0-34f85b0e96bmr7217192637.40.1762395412805; Wed, 05 Nov 2025
 18:16:52 -0800 (PST)
MIME-Version: 1.0
References: <20251029214032.3175261-1-royluo@google.com> <20251029214032.3175261-2-royluo@google.com>
 <20251030-cunning-copper-jellyfish-1b5f3b@kuoka> <CA+zupgxV7SH8Jmghg7HUkWi63dN3m6KLQNBbf+BOQPFbRsiKiw@mail.gmail.com>
 <89733ddf-8af3-42d0-b6e5-20b7a4ef588c@kernel.org>
In-Reply-To: <89733ddf-8af3-42d0-b6e5-20b7a4ef588c@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Thu, 6 Nov 2025 10:16:15 +0800
X-Gm-Features: AWmQ_bkHoYFyaQeybc5UvezN4EWqbJT4bKEyxsgJMFmGBzo51vQ6CZ14ESkjq80
Message-ID: <CA+zupgwwKS=FJxXaW9n1=W2V8hSdQ_y5zw1FcC4Gm4sgo-4PRA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251105_181655_201551_E5A9F271 
X-CRM114-Status: GOOD (  63.98  )
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

On Wed, Nov 5, 2025 at 3:35=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 01/11/2025 00:45, Roy Luo wrote:
> > On Thu, Oct 30, 2025 at 12:37=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> On Wed, Oct 29, 2025 at 09:40:31PM +0000, Roy Luo wrote:
> >>> Document the device tree bindings for the USB PHY interfaces integrat=
ed
> >>> with the DWC3 controller on Google Tensor SoCs, starting with G5
> >>> generation. The USB PHY on Tensor G5 includes two integrated Synopsys
> >>> PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo PHY IP=
.
> >>>
> >>> Due to a complete architectural overhaul in the Google Tensor G5, the
> >>> existing Samsung/Exynos USB PHY binding for older generations of Goog=
le
> >>> silicons such as gs101 are no longer compatible, necessitating this n=
ew
> >>> device tree binding.
> >>>
> >>> Signed-off-by: Roy Luo <royluo@google.com>
> >>> ---
> >>>  .../bindings/phy/google,gs5-usb-phy.yaml      | 127 ++++++++++++++++=
++
> >>>  1 file changed, 127 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-=
usb-phy.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/phy/google,gs5-usb-phy=
.yaml b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> >>> new file mode 100644
> >>> index 000000000000..8a590036fbac
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> >>> @@ -0,0 +1,127 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +# Copyright (C) 2025, Google LLC
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/phy/google,gs5-usb-phy.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Google Tensor Series (G5+) USB PHY
> >>> +
> >>> +maintainers:
> >>> +  - Roy Luo <royluo@google.com>
> >>> +
> >>> +description: |
> >>> +  Describes the USB PHY interfaces integrated with the DWC3 USB cont=
roller on
> >>> +  Google Tensor SoCs, starting with the G5 generation.
> >>> +  Two specific PHY IPs from Synopsys are integrated, including eUSB =
2.0 PHY IP
> >>> +  and USB 3.2/DisplayPort combo PHY IP.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: google,gs5-usb-phy
> >>> +
> >>> +  reg:
> >>> +    items:
> >>> +      - description: USB3.2/DisplayPort combo PHY core registers.
> >>> +      - description: USB3.2/DisplayPort combo PHY Type-C Assist regi=
sters.
> >>> +      - description: USB2 PHY configuration registers.
> >>> +      - description: USB3.2/DisplayPort combo PHY top-level register=
s.
> >>> +
> >>> +  reg-names:
> >>> +    items:
> >>> +      - const: usb3_core
> >>> +      - const: usb3_tca
> >>> +      - const: usb2_cfg
> >>> +      - const: usb3_top
> >>
> >> These prefixes are redundant. Also, you are still referencing here
> >> completely different devices. MMIO of IP blocks do not have size of 0x=
c
> >> and they do not span over other blocks (0x0c410000 and then next one i=
s
> >> 0x0c637000).
> >
> > I'd like to explain why MMIO of IP blocks looks discontinuous.
> > As outlined in the description, this device contains two SNPS PHY IPs
> > including eUSB2 PHY and USB3.2/DP combo PHY, and is integrated
> > with the SNPS DWC3 USB controller. A top-level subsystem wrapper
> > sits above the PHYs and controller. This wrapper integrates these IPs
> > and is where the Tensor-specific implementation resides. It's essential
> > to touch these wrapper registers to control the underlying SNSP IPs.
> > Unfortunately, the top-level wrapper's MMIO space lacks a clear
> > boundary between these IPs. Specifically, the registers required to
> > configure a particular IP are not always adjacent to that IP, and in
> > some cases, multiple IPs may even share the same address space.
> >
> > The following is the register layout overview:
> > - 0xc400000: Dedicated address space for DWC3 controller IP.
> > - 0xc410000: Dedicated address space for USB3.2/DP combo PHY IP.
> > - 0cc440000: Dedicated address space for the eUSB2 PHY IP.
> >                       While this is not in use, it should perhaps be
> > called out in
> >                       the binding for completeness.
> > - 0xc450000: This address range contains top-level wrapper registers
> >                       and its space is shared by two devices: the DWC3
> >                       controller and the eUSB2 PHY.
> >                       It includes control registers for the DWC3 contro=
ller
> >                       (e.g. hibernation control and interrupt registers=
) and
> >                       the eUSB2 PHY (e.g. registers for USB2 PHY
> >                       frequency configuration).
> >                       Because the space is shared, the MMIO range for t=
he
> >                       PHY becomes fragmented and is only allocated a si=
ze
> >                       of 0xc, as the remaining registers in this range =
are
> >                       assigned to the DWC3 controller.
> > - 0xc460000: This address range contains registers for other blocks
> >                       within the same top-level wrapper (such as PCIe P=
HY
> >                       and DP controller) which are not relevant to USB.
> > - 0xc637000: Another region of top-level wrapper registers.
> >                       This area is relevant to both the eUSB2 PHY IP
> >                       (e.g. control register for vbus valid) and USB3.2=
/DP
> >                       combo PHY (e.g. registers relevant to PHY firmwar=
e).
>
> To me it all feels like you pick up individual registers from the
> common, miscellaneous register region aka syscon.
>
> And if that's the case then you create a narrowly constrained binding
> which won't work with next generations where hardware engineers decide
> to make that shared region a bigger syscon.

Ack. Will go with syscon.

>
> >
> > Thanks for taking the time to go through this wall of text.
> > This is definitely not an ideal register layout, but I'm open
> > to any suggestions on how best to address this fragmentation.
> > If discontinuous MMIO space is a concern, does it make sense to
> > make the wrapper registers a syscon node so that it can be
> > shared by multiple devices?
>
> 0xc450014 looks like that. 0x0c637000, depends how other devices really
> use it.

Agree it makes sense to make region 0xc450000 a syscon node provided
it's shared by two distinct devices (the controller and the PHY). I will
implement this change in the next version.
A heads up, I will also need to send a new version for the corresponding
dwc3 controller binding patch that has already been reviewed [1] to reflect
this syscon change.

As for region 0x0c637000, this range is exclusive to this PHY device, which
includes both eUSB2 PHY and USB3.2/DP combo PHY. (It would be a
different story if the USB2 PHY and the USB3 PHY were to be treated as
two distinct devices.) Therefore, I'm hesitant to convert this region to a
syscon node. I recommend keeping the region as-is and add a more
detailed description for this reg entry to clarify that this is top-level
subsystem wrapper registers distinct from the core IP's register space.

[1] https://lore.kernel.org/linux-usb/20251017233459.2409975-2-royluo@googl=
e.com/

>
> You should post somewhere full DTS for clarity. It's not a requirement
> but it actually can answer several questions.

Yes, I can definitely share the DTS I'm using to test this PHY and controll=
er
patch series. Could you recommend the most appropriate way to do so?
I came across a previous patch thread [2] that used gist link for sharing c=
ode
snippets and logs. Is that generally considered acceptable?

[2] https://lore.kernel.org/all/20240715120936.1150314-1-s-vadapalli@ti.com=
/

>
> >
> >>
> >>
> >>> +            reg =3D <0 0x0c410000 0 0x20000>,
> >>> +                  <0 0x0c430000 0 0x1000>,
> >>> +                  <0 0x0c450014 0 0xc>,
> >>> +                  <0 0x0c637000 0 0xa0>;
> >>> +
> >>> +  "#phy-cells":
> >>> +    description: |
> >>> +      The phandle's argument in the PHY specifier selects one of the=
 three
> >>> +      following PHY interfaces.
> >>> +      - 0 for USB high-speed.
> >>> +      - 1 for USB super-speed.
> >>> +      - 2 for DisplayPort.
> >>> +    const: 1
> >>> +
> >>> +  clocks:
> >>> +    minItems: 2
> >>> +    items:
> >>> +      - description: USB2 PHY clock.
> >>> +      - description: USB2 PHY APB clock.
> >>> +      - description: USB3.2/DisplayPort combo PHY clock.
> >>> +      - description: USB3.2/DisplayPort combo PHY firmware clock.
> >>> +    description:
> >>> +      USB3 clocks are optional if the device is intended for USB2-on=
ly
> >>> +      operation.
> >>
> >> No, they are not. SoCs are not made that internal wires are being
> >> disconnected when you solder it to a different board.
> >>
> >> I stopped reviewing here.
> >>
> >> You are making unusual, unexpected big changes after v4. At v4 you
> >> received only few nits because the review process was about to finish.
> >>
> >> Now you rewrite everything so you ask me to re-review from scratch.
> >
> > Apologies for the trouble, my intent was to address your feedback on v4
> > by describing the USB3/DP PHY block for completeness.
> > Like mentioned earlier, this device contains two underlying IPs: eUSB2
> > PHY and USB3.2/DP combo PHY. The device can operate in USB2-only
> > mode by initializing just the eUSB2 block without touching the USB3
> > PHY block - but not the other way around. The v4 patch reflected this
> > USB2-only configuration.
>
> You describe the device in your SoC. This SoC either has both or has
> not. The case of "can operate in USB2-only mode" is simply not real.

Ack.

>
> > I tried to support the USB 2.0-only configuration in the binding by
> > making the USB 3.0 clocks and resets optional. However, if I
> > understand your comment correctly, the binding should describe
> > FULL hardware capability. I will make USB3 resources mandatory
> > in the next version, please let me know if I've misunderstood it.
>
> Yes, binding should describe complete hardware picture, so with USB3 and
> all wires/signals being required.

Ack.

>
> >
> >>
> >>> +
> >>> +  clock-names:
> >>> +    minItems: 2
> >>> +    items:
> >>> +      - const: usb2
> >>> +      - const: usb2_apb
> >>> +      - const: usb3
> >>> +      - const: usb3_fw
> >>
> >> Again, what's with the prefixes? apb is bus clock, so how you could ha=
ve
> >> bus clock for usb2 and usb3? This means you have two busses, so two
> >> devices.
> >
> > The prefixes are to differentiate the clocks and resets for the
> > underlying two SNPS IP as outlined in the device description.
> > - eUSB2 PHY IP needs clocks and resets for the phy itself
> >   and its apb bus.
> > - USB3.2/DP combo PHY has its own clocks and resets for
> >   the phy, plus it needs a clock for its PHY firmware.
>
> If you have two bus clocks I think you have two separate devices...
>
> > Technically these are two separate IPs, but they're deeply
> > integrated together so that they share top-level wrapper
> > register space (see the register layout above), and they
> > have implicit hardware dependency like mentioned earlier
> > (USB2 PHY can work without USB3 PHY, but not vice-versa),
> > hence I'm describing them in the same device.
>
> But okay, if that's the case naming is fine.

Thanks,
Roy Luo

>
>
> Best regards,
> Krzysztof

