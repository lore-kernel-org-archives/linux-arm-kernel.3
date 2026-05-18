Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9FDCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 03:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+fphzySK5Q0k47PmP9LiZHink7B5xAvFgt6ZK11jZls=; b=KS/UegCex5ZyMg
	/J7mLMLrVDNCO5L/cydDVCBqkN81P0FH2LkUuklf7bGuRrAmwbm3gHm5IY8gkIb09/vIQulSQglTs
	qLW+gBjIIJvoJWh4EZYpUvHem4JES4fqGTMtJOMAGGVWFoMVmCLaUgqF9mUmOpc3UMzeVCyxBhTdH
	1f0eKyLfnpKV7qGqiluTWkYsVEYbK83LBMHBsbuG/RG6AD0tqXgbLi9KdRSbxUj+Lrj1Rr2fzqsKg
	cwofbIP2k5oButO2rNqbeMPbbhEEFkn4WEe0tr6QbrdUvC+jARISfAxZXpVb4u6YOOCxWeE1YGVHG
	kSpKc4cRcEoJU1bwkQow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOohE-0000000E3Vt-0db0;
	Mon, 18 May 2026 03:31:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOohD-0000000E3Va-28sO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 03:31:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 74BC560055
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 03:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B7A5C2BCF7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 03:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779075069;
	bh=PpyCpFLp+qOUo1XGzy4ti3wIBdJlEX//u0tJ4M8Klwk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=E2frLadX2voIeoBE/9x2tILtLh7EPzgyLKeG0XG62XHLDqhAHLPKbyL3O8qaO8tlk
	 Y+oNCQ9KMJBuKTRQBddO4tOeGKlGSUz84O/GGsYLpVa6gbxlWbXTjd16OjiabQqrUV
	 RwQMaZcKkKGJhMC759IxnHqU6LvaSJuZtLwwe9b8NoUIyGU6ibxnPlgzLkYKJmfPoV
	 dJstFXdBE5K/jJGB1wNnBU8Ps2w42pxK48ZvoAZDwQHyivfMX7OVaaSV03P9HIcOA7
	 sIaNJR/oLjpWuvMLrugv77WhdvB6fAikKjYBHPOEaVnPHYtU1OtuZXEOOTm57KE6O4
	 lRzB5xxnBp+2w==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38be5e86918so25424861fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 20:31:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8oY6TigEftwLRHBlAmeFGzNtcLRJDZdq/yZeF1zg1UEJIZNY/TYZvUy/RmcTPZQt+rpZesgPFcr5idanMA9TCH@lists.infradead.org
X-Gm-Message-State: AOJu0YwWjuldBNSfIoMqDA6QFu109SY49F7wIAGOObddA8ahTr7meOMp
	UWeyCMTNf0q8cM8S+8N8sJD4V7/+nE2JZRIFZdUr5nz497Z6DAWZGyvMZ2roeQiqEy0W9xEi8y6
	RfJ4EhuzgHai5txjIcJjfxKeQ4/ByEBQ=
X-Received: by 2002:a05:651c:2111:b0:393:b365:6e24 with SMTP id
 38308e7fff4ca-395619b0ac5mr35805681fa.4.1779075067487; Sun, 17 May 2026
 20:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
 <20260510201644.4143710-4-alexander.sverdlin@gmail.com> <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
 <14a7e289ff5ffed8fcd6dcb9b2e8455a1b2c9420.camel@gmail.com>
In-Reply-To: <14a7e289ff5ffed8fcd6dcb9b2e8455a1b2c9420.camel@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 18 May 2026 11:30:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v67tjOCE=Xk=pD84wBG4WTt1nYhDoW3gu_xfx4J0Ooc_VQ@mail.gmail.com>
X-Gm-Features: AVHnY4JnqjbSr91YLBIoafpQYqqOubR36k-t-pMBLxLwXavZnAaD9k9U7zSyI3s
Message-ID: <CAGb2v67tjOCE=Xk=pD84wBG4WTt1nYhDoW3gu_xfx4J0Ooc_VQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, May 18, 2026 at 4:37=E2=80=AFAM Alexander Sverdlin
<alexander.sverdlin@gmail.com> wrote:
>
> Hi Andre,
>
> thanks for the quick feedback!
>
> On Mon, 2026-05-11 at 13:44 +0200, Andre Przywara wrote:
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> > > @@ -0,0 +1,162 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +/*
> > > + * Copyright (c) 2025 Arm Ltd.
> >
> > Please put your own copyright here, even if that has been largely copie=
d
> > from an existing file.
> >
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include "sun50i-a100.dtsi"
> > > +#include "sun50i-a100-cpu-opp.dtsi"
> > > +
> > > +/{
> > > +   compatible =3D "baijie,helper-a133-core",
> > > +                "allwinner,sun50i-a100";
> > > +
> > > +   aliases {
> > > +           serial1 =3D &uart1;       /* BT module */
> >
> > Do we really need an alias for the BT UART? And is the BT module
> > supported already? Then please add a child node to the UART node.
>
> That's the only thing I can do currently regarding BT: stabilize the
> serial enumeration, because UART1 cannot be used for anything else
> except BT module, because this is soldered inside "core" module.
> We can avoid different tty enumeration, should the support for
> BT be implemented in the future...
>
> > Isn't the WiFi/BT module on the SoM? Then please mention and enable MMC=
1
> > here. Provide the child node for the WiFi chip, even if there is no
> > upstream support in the kernel for it yet.
>
> So both the above BT and the WiFi is AW869A/AIC8800 combo chip, which
> has neither upstream driver, nor [upstream] DT bindings. Even github
> driver for AIC8800 doesn't seem to use DT, therefore it looks quite
> pointless to me at this point to specify anything in the DT for the
> chip which doesn't have the bindings idea even theoretically.
>
> Nothing in the current DT shall block any future work on the AW869A
> support though and the above "aliases" entry shall even guarantee
> unchanged serial enumeration shall such support arise.
>
> > > +&reg_aldo1 {
> >
> > What is aldo1 used for, actually? I don't see this referenced anywhere.
> > I guess the kernel turns that off after booting?
> > If you have access to the schematic, please check that. If that's for
> > some peripheral not yet supported, please note the user anyway, ideally
> > by an explaining regulator-name, or by a comment. Also if it's used for
> > any of the required SoC VDD pins. See the Liontron .dts for comparison.
> >
> > > +   regulator-always-on;
>         ^^^^^^^^^^^^^^^^^^^
> I suppose it's not being switcdhed of because of the above.
> It's used for both PLL supply for the whole SoC + as analog voltage refer=
ence
> for LRADC (the buttons you've noticed on the board are connected to
> this ADC via a resistor ladder).
>
> >
> > > +&reg_aldo2 {
> > > +   regulator-always-on;
> >
> > For always-on regulators we definitely need an explanation. Does the
> > board stop booting if you remove this line?
> > Maybe it's for DRAM? Can you say what voltage it is, either from the
> > reset default, or set by the bootloader?
>
> Thanks for the hint! I'll put proper voltages into all regulators +
> comment all the always-on regulators.

Please also give them proper names. If you have the schematics, then use
the names from that; otherwise just make up names matching their use.

> >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.=
dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
> > > new file mode 100644
> > > index 000000000000..ccbca5d0a40c
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
>
> > And you should provide a top level 5V regulator here, to be the root of
> > the regulator tree. Look at reg_vcc5v in the Liontron .dts.
>
> It doesn't look to me as if Liontron had reg_vcc5v as its 5V "root" regul=
ator.
> It seems to be only used for reg_usb1_vbus, while HelperBoard A133 doesn'=
t
> have USB power control. The second issue with Helper/Core split is that
> all PMIC story is inside Core board which has 5V input rail, while Helper=
Board
> around it has indeed 12V->5V DCDC regulator (similar to Liontron), but
> putting it in the DT would introduce wierd dependency of the core to the
> HelperBoard which carries it. Do you think it would make sense?

In that case I would probably put a 5v "fake root" regulator in the core
dtsi. And in combined dts, I'd then add the 12v "real root", and use that
as the supply for the 5v fake root.

Does that make sense?


ChenYu

> > So from the pictures I found online it looks like there is an USB-C por=
t
> > labelled "OTG", so can you please add an &usbotg reference here and
> > describe that port.
>
> Nice catch! I've missed the fact usbphy 0 has to be in peripheral mode,
> not host mode. Will rework!
>
> > > +&usbphy {
> >
> > Are the two USB ports always powered?
> >
> > And anyway, I see a *dual* USB-A socket on the pictures online, in
> > addition to the USB-OTG port. So where does the third USB come from? Th=
e
> > A133 only supports one host USB port plus the one OTG port. So is there
> > an USB hub chip on the board?
>
> There are two hubs, one on each usbphy. OTG side hub is even bus-powered,
> two USB-A ports are always powered from the board's 12V->5V DCDC, no USB
> load switches.
> >
>
> --
> Alexander Sverdlin.

