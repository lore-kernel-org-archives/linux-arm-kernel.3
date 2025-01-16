Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C21C02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 14:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9vxi7kOctVVcyMXDr3GiYAGgEDhCJdQ2s1WVnIEcYQM=; b=Ulqn2D1uIeFiHJ63hPQqE3OYfz
	QPvkHZ6+s+jDEVb0u8oZnb+HH4T58CUwUJSsdHBXYbUMLQVSZj+CLR5ibvyu9F84yr78jPBR4IWbM
	Zh7MbwZMdOK7ECf1GCZmk/LzDzkJl9yv3OvhyXjkWiM418aSfL/WLS4jLA0uTMKOCraopXCpu0qUk
	FdBdQOSbcKwuZ0ehxSFsxZuwkO8pxW7uqBi35kN+oxZxl4b8xay/EEeE7ctnGX2dlC+ue93BSHifY
	ZZybuN+kLqz43MKjYQDQsEOvFRmTergQHLrIT6iyomiyBcBUVqBAO8toa4+65uuXKGrn+22IIj75n
	xkE0yapg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQQo-0000000F4o1-0F48;
	Thu, 16 Jan 2025 14:01:10 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQPI-0000000F4UG-0VVi;
	Thu, 16 Jan 2025 13:59:37 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d9b6b034easo2005314a12.3;
        Thu, 16 Jan 2025 05:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737035974; x=1737640774; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vxi7kOctVVcyMXDr3GiYAGgEDhCJdQ2s1WVnIEcYQM=;
        b=B8D5rY+LCnB2n76GinfV3rjZUHntXqZAPzBA5qMVNfOfmnSI+F0K712Y2edQSTPCVh
         xllsC1H0iKe6m0qnSaQALqBN45HpHyhP1hKM5PS70fDMs5QQpCLmBKYi39d8Yf04EdbR
         wN+P1jQcB2RO9YmpwPA0Lx6twUgENWM1u4b/SNY5UpbYrb6LtFjQn4O4nVocrIACWh0k
         YziUbbb7sJEklyWpsZnhaQeBtb4OIsX0rlPhX1gII+vuQDw0RnurnH4l+XtHaZvSVoOV
         m8eStgt8VCOTF+Htpg2Efcz5Mv9dVKszwsAU+C0EVQFEHRxK1T19LCmLoQK2UECamLIG
         q+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737035974; x=1737640774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vxi7kOctVVcyMXDr3GiYAGgEDhCJdQ2s1WVnIEcYQM=;
        b=rqEWe7FUEe3iOr6Oxv2QBVnCaQe8YV+z2gJrhmGZzy6kTGkpaqsIwH0fRt0ZOVsrF+
         AjB3mriyIrpXC42wKRB8WKiFZnU4AHOTO4K7IgwVfVKMSbenFEC4DmZY7gk3PKH15h9Z
         bXpVWtitqFloI3I6fzTK9ZnFD8kfx7zs8dw9wkPiXKU+pD64TH1GnkJ0J+Ls4b+4RwKn
         guUmYsDElF06AVS1br89R+YnL/TAXfwOzZnuRgfIECNH+SH72W1Or2fmrs77FC0ecsGR
         rfbUa5Q5xwTwdzoevUP9LTWAmZ75YrudzNY8uUY0bgG7+7x6m1U3aNRQ0EvBfgCQitiY
         7aUA==
X-Forwarded-Encrypted: i=1; AJvYcCVqm9nEaACl5Jr8ahX9FyxWXHcYtR/iZgquBZX95hXo6TSvEn8Fm+8smhByybZWLGHtIxWHK2snDfqtNfl5R/s=@lists.infradead.org, AJvYcCWhaB8i0aZa8+AB19+Bz+JTuE6JW9Yt3f3DNkE7e3j9kS/2MxCjn2zpgNj6zx4SgPMRSZYyjEP/qq1mjprFNV/4@lists.infradead.org, AJvYcCWs/wxadUToFt2RF7oGXjj/dOOE4JkzIpfJo2HR14em6n55BcIyo6FzJ+kslFTt5WPV7F9kmgNhSNxx@lists.infradead.org
X-Gm-Message-State: AOJu0YxXZGhV4/1UnLHApzsmvNWQBO7t4C8kvUB0vKQy452hJEIYbORh
	kFFojCs6eeqwKgavYCHQ7/jgd0enxaGbK0WeuXD8+3rUdaRU+pGX+HMthD4JwLZNSlZohqYxNyg
	8kIzMR5d8aCyj1hzE0Be1jBCZ5Cg=
X-Gm-Gg: ASbGncvAR5VptNeSPYYYx0OLm3lu851+wLyFxkkqyIipso0kOE8Vm1H5cnU01nR+AM7
	EVZcIkDAaTwbeuIxDUrtL5CIl0nLMIzrJvXWyKFY=
X-Google-Smtp-Source: AGHT+IHy0ptsnu2e6RlogPAAJ7l54BvT5YyNsToPY+dFvbttxz8qyeBXoo38j5kBA9ckwZHuatxWeT6X4JGUPkkzFiE=
X-Received: by 2002:a50:c88a:0:b0:5d9:856c:9a08 with SMTP id
 4fb4d7f45d1cf-5d9856c9cf3mr23776315a12.18.1737035974045; Thu, 16 Jan 2025
 05:59:34 -0800 (PST)
MIME-Version: 1.0
References: <20250115012628.1035928-1-pgwipeout@gmail.com> <20250115012628.1035928-3-pgwipeout@gmail.com>
 <fe006de3-16eb-4c20-8e8e-da5ff5531c6f@kernel.org> <CAMdYzYoB-wFGcmDNYrOMKTb0XSseBd7btLarKBB5+TUB-11KjA@mail.gmail.com>
In-Reply-To: <CAMdYzYoB-wFGcmDNYrOMKTb0XSseBd7btLarKBB5+TUB-11KjA@mail.gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Thu, 16 Jan 2025 08:59:20 -0500
X-Gm-Features: AbW1kvaWCthn0CA3HTWG-smgk2ZaVZDFO0klEe8ZJZC-0X4faHPfG6VS2QsDNEw
Message-ID: <CAMdYzYqeEFN4B-Q-Sidrfyo6uVRYKW6kApVvvRaH+ciLeWSFww@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/6] dt-bindings: phy: rockchip: add rk3328 usb3 phy
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, zyw@rock-chips.com, kever.yang@rock-chips.com, 
	frank.wang@rock-chips.com, william.wu@rock-chips.com, wulf@rock-chips.com, 
	linux-rockchip@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_055936_162218_72276EB3 
X-CRM114-Status: GOOD (  36.55  )
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

On Thu, Jan 16, 2025 at 8:32=E2=80=AFAM Peter Geis <pgwipeout@gmail.com> wr=
ote:
>
> On Thu, Jan 16, 2025 at 8:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On 15/01/2025 02:26, Peter Geis wrote:
> > > Add documentation for the usb3 phy as implemented on the rk3328 SoC.
> > >
> > > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > > ---
> > >
> > >  .../bindings/phy/rockchip,inno-usb3phy.yaml   | 166 ++++++++++++++++=
++
> > >  1 file changed, 166 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/rockchip,in=
no-usb3phy.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb3=
phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb3phy.yaml
> > > new file mode 100644
> > > index 000000000000..cde489ca87ab
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb3phy.yam=
l
> > > @@ -0,0 +1,166 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> >
> > Wrong license.
> >
> > Please run scripts/checkpatch.pl and fix reported warnings. After that,
> > run also `scripts/checkpatch.pl --strict` and (probably) fix more
> > warnings. Some warnings can be ignored, especially from --strict run,
> > but the code here looks like it needs a fix. Feel free to get in touch
> > if the warning is not clear.
>
> Checkpatch literally told me to change this. Ran against my original
> dev binding:
> ./scripts/checkpatch.pl --strict
> Documentation/devicetree/bindings/phy/rockchip,inno-usb3phy.yaml
> CHECK: DT binding documents should be licensed (GPL-2.0-only OR BSD-2-Cla=
use)
> #1: FILE: Documentation/devicetree/bindings/phy/rockchip,inno-usb3phy.yam=
l:1:
> +# SPDX-License-Identifier: GPL-2.0

I understand now, thank you. Perhaps checkpatch could put that in
quotes, instead saying ("GPL-2.0-only OR BSD-2-Clause") to make it
clear it's one thing.

>
> >
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/phy/rockchip,inno-usb3phy.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Rockchip USB 3.0 phy with Innosilicon IP block
> >
> > > +
> > > +maintainers:
> > > +  - Heiko Stuebner <heiko@sntech.de>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - rockchip,rk3328-usb3phy
> >
> > Why is this binding entirely different than existing usb2 phy? Nothing
> > in common? This looks like made for driver and both - driver and bindin=
g
> > - duplicating a lot.
>
> Hmm, I hadn't considered merging it into the usb2 binding as it is a
> unique (and uniquely broken) device. I'd like Heiko's thoughts on
> this.
>
> >
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    minItems: 3
> >
> > Drop
> >
> > > +    maxItems: 3
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: refclk-usb3otg
> >
> > ref
> >
> > > +      - const: usb3phy-otg
> >
> > otg
> >
> > > +      - const: usb3phy-pipe
> >
> > pipe
> >
> > > +
> > > +  interrupts:
> > > +    minItems: 4
> >
> > You code here randomly. reg has only maxItems, clocks have both and thi=
s
> > have only minItems. Does not make sense. If you get it wrong, I would
> > assume you repeat the same mistake but here it is like randomly chosen
> > pieces. And this is making me wonder whether this was not sent too fast=
.
>
> I admit, I dread writing bindings as even now I'm weak in YAML and it
> seems to pick and choose what rules it wants to follow.
>
> >
> > Anyway: only maxItems.
> >
> >
> > > +
> > > +  interrupt-names:
> > > +    items:
> > > +      - const: bvalid
> > > +      - const: id
> > > +      - const: linestate
> > > +      - const: rxdet
> > > +
> > > +  resets:
> > > +    minItems: 6
> >
> > maxItems instead
> >
> > > +
> > > +  reset-names:
> > > +    items:
> > > +      - const: usb3phy-u2-por
> > > +      - const: usb3phy-u3-por
> > > +      - const: usb3phy-pipe-mac
> > > +      - const: usb3phy-utmi-mac
> > > +      - const: usb3phy-utmi-apb
> > > +      - const: usb3phy-pipe-apb
> > > +
> > > +  "#address-cells":
> > > +    const: 2
> > > +
> > > +  "#size-cells":
> > > +    const: 2
> > > +
> > > +  ranges: true
> > > +
> > > +patternProperties:
> > > +
> >
> > Drop blank line
> >
> > > +  utmi-port@[0-9a-f]+$:
> >
> > This wasn't tested. Missing quotes, missing starting anchor.
>
> make W=3D1 dt_binding_check didn't complain about it, using the
> dt-schema from pip3 from about a week ago.
>
> >
> > > +    type: object
> >
> > Explain what are the children here - description.
>
> Fair, will do.
>
> >
> >
> > > +    additionalProperties: false
> > > +
> > > +    properties:
> > > +      compatible:
> > > +        enum:
> > > +          - rockchip,rk3328-usb3phy-utmi
> > > +
> > > +      reg:
> > > +        maxItems: 1
> > > +
> > > +      "#phy-cells":
> > > +        const: 0
> >
> > Does not look correct. Your parent device is the phy, not child. Why do
> > you create children per each type of phy?
>
> Because that's how it's done elsewhere in Rockchip's phys [1]. How
> should it be done?
>
> >
> > > +
> > > +      phy-supply:
> > > +        description:
> > > +          Phandle to a regulator that provides power to VBUS.
> > > +          See ./phy-bindings.txt for details.
> > > +
> > > +    required:
> > > +      - compatible
> > > +      - reg
> > > +      - "#phy-cells"
> > > +
> > > +  pipe-port@[0-9a-f]+$:
> > > +    type: object
> > > +    additionalProperties: false
> > > +
> > > +    properties:
> > > +      compatible:
> > > +        enum:
> > > +          - rockchip,rk3328-usb3phy-pipe
> > > +
> > > +      reg:
> > > +        maxItems: 1
> > > +
> > > +      "#phy-cells":
> > > +        const: 0
> > > +
> > > +      phy-supply:
> > > +        description:
> > > +          Phandle to a regulator that provides power to VBUS.
> > > +          See ./phy-bindings.txt for details.
> >
> > Drop "see ....".
>
> I was tempted to convert phy-bindings.txt over but as above I dread
> writing bindings. Will drop.
>
> >
> > > +
> > > +    required:
> > > +      - compatible
> > > +      - reg
> > > +      - "#phy-cells"
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - interrupts
> > > +  - interrupt-names
> > > +  - resets
> > > +  - reset-names
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/rk3328-cru.h>
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +    soc {
> > > +      #address-cells =3D <2>;
> > > +      #size-cells =3D <2>;
> > > +
> > > +      usb3phy: usb3-phy@ff460000 {
> > > +        compatible =3D "rockchip,rk3328-usb3phy";
> > > +        reg =3D <0x0 0xff460000 0x0 0x10000>;
> > > +        clocks =3D <&cru SCLK_REF_USB3OTG>, <&cru PCLK_USB3PHY_OTG>,=
 <&cru PCLK_USB3PHY_PIPE>;
> >
> > That's way over the limit. Wrapping is at 80.
>
> Will correct.
>
> >
> > > +        clock-names =3D "refclk-usb3otg", "usb3phy-otg", "usb3phy-pi=
pe";
> > > +        interrupts =3D <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 76=
 IRQ_TYPE_LEVEL_HIGH>,
> > > +                     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 78 I=
RQ_TYPE_LEVEL_HIGH>;
> > > +        interrupt-names =3D "bvalid", "id", "linestate", "rxdet";
> >
> >
> >
>
> I appreciate all the feedback, I'll incorporate the changes you've recomm=
ended.
>
> Very Respectfully,
> Peter Geis
>
> >
> > Best regards,
> > Krzysztof
>
> [1] https://elixir.bootlin.com/linux/v6.13-rc3/source/arch/arm64/boot/dts=
/rockchip/rk3328.dtsi#L887

