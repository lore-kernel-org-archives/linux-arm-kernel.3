Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4007CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 20:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPgB9UynDfl3zmI3aakfTZKeiVVfht++/m5WoF0UhgA=; b=hfepmV4Jh3uDBm9lZYAwTR3hxo
	c2GU0y3LHrlSUML60ysaLIR822DNDuGlW6Uyoz3vC9TAAAD8Nw4or3zSFExX9JvhjbbK04hA6CTKI
	Cxpa9HP9ZqjYbOX9AMX/bUwJckGHE52yCTRYweSd3DeRX/1y/+VTb/vxX68oFRWRa0lJohcu3yDnV
	FrJeurTVrtL77LGeV2IqvQ6/xEu/vvFzwE28xxC2LhJrqy9BJ/ftdvetJreS9AD7ufJY/ZMiP5muw
	vsOjYpl483AMWEMZTyZ97VGMLRfZqf8HnbzfPrVKe9dfCikjA4lmbHSnzCz/aRbrumLdk4lBPpTvO
	kltJPLmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOiFK-0000000DQNe-2veo;
	Sun, 17 May 2026 20:37:58 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOiFH-0000000DQNA-3Zh7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 20:37:56 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so16928385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 13:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779050274; x=1779655074; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fPgB9UynDfl3zmI3aakfTZKeiVVfht++/m5WoF0UhgA=;
        b=JeM4GHtKY6lQrK2wGBJ9gDiHkOQlC04IhD8uAWGWFjNRmAcZGyYWoEayKIkPAXAf04
         A41r6eS+MEAN064kvI5SbLa0PyVEpZov9jK+sgTaKRfGEJGTc3710v3B5zGetXbg3qJR
         UDGuqjompLBVQfyw9UFHvnRgoZXS/53cEeWyTGSAPA0UK45XvvhYiGBg0QHIOQzrOkwF
         2tGGOul/VA/APocvV5t/eg2dzaoGsVZMDg1JyAUpilC6RYac7b2zGr8KzCbKUrsaiOh0
         /N6DakgOvCdz2wGH599ZV2Frz+bzsiEHb58liXjoqSewAMrh7TzJOuwL5JDFHj2Wk8/W
         l4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779050274; x=1779655074;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fPgB9UynDfl3zmI3aakfTZKeiVVfht++/m5WoF0UhgA=;
        b=tH9pbMWY7skFkyJyZ2qRHcfXVJgk1nRsFALi/QQtzcG784mCfxa8upW7mmaIIG2966
         r1SeLn4M52fRuoR0cku+01wmoeB2CMhVKQU9hNcGPaXTL4m+Dle8Qz3pz9VsGOI/oR6N
         JUjJF20JIt/vLN22AGgrYSlmILGMufw/WjyHJ1qkiO4N9e7J3cdMc6rcV68As8e0vSpq
         s2nzp5qihIgM9c8ZvVHxRT1bUags3jn+Hvm2fOmLDwdKGZOASE0qAa959w1diKAF4qEM
         IYKh4bGEMmlch9WZdJ1+Jh2WTBBrMgJhvGu6bdyJBxGqoj50yG7hZJVSQCn7CHONMOm8
         uODw==
X-Forwarded-Encrypted: i=1; AFNElJ9tnH8cOOyLnpjO4YNvCk+L7zuIGmDupbIxYFYsqhfjifuX27qj8fsLi+kAdnFc9svyAZsCmt83GJEmckq1txln@lists.infradead.org
X-Gm-Message-State: AOJu0YwnEC8Ww1tZOmhkqg3DMW0LtI4bcipSAqOhiP0rQCCUn1BL81Xs
	N9B8d5wvNuiSMalTqKQDLE7igBMxl+Lel7Q2Yc2chKoNDOPiecZccVIK
X-Gm-Gg: Acq92OFFjjYnvS/DGCUX8c+DlyVo8vkAHEfxHIUpM+4dbLozv8MCiRqsYd6d7muMOZw
	mzeuJB9YTwK66deg+/UjoKFe/ltUr+LpMJCpWJ/A/DE4pBfrXCsY8YeEZ3HMoy2mX19AzOYDrhR
	+vVzN2R9qW0sYqOgHNJrrMjmCkctQZ/xufJYvV3pQN1M9tn6x60rqK3PaGBt4WDiXk95C0clgOS
	cNbMsh+ypd1LTeKHr6E+FwSNzaa6lQ3kFh11PvMRlSRxV5URrBMMvuWWbqpIRAVYeGNxocHLTer
	WuFQWG92CfDx0FXbC5bwZWiuR8btBFQShh2QgUbAeZrHNr6PTMni8h2/vW0Vkq32PajqFCZS/wb
	XKwc4dunZ6uEGH9vWXcYkssXULp1sRGPmODp0yWuPOwwujhIcQPF9Pwr5H/OzFuYJ2QlGoiQTKP
	eUnknpy8EYob5zyyr8cHNI6XCTe2FrnAnJOxgbzpdfgGVlws0MCpeFpqlNxFmMDvJx2cDBWOTGk
	j4=
X-Received: by 2002:a05:600c:a293:b0:48f:e6de:1cc6 with SMTP id 5b1f17b1804b1-48fe6de1e03mr114181345e9.32.1779050273455;
        Sun, 17 May 2026 13:37:53 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694fbfsm363386665e9.6.2026.05.17.13.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 13:37:52 -0700 (PDT)
Message-ID: <14a7e289ff5ffed8fcd6dcb9b2e8455a1b2c9420.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Sun, 17 May 2026 22:38:13 +0200
In-Reply-To: <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_133755_922741_A1303814 
X-CRM114-Status: GOOD (  37.90  )
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

Hi Andre,

thanks for the quick feedback!

On Mon, 2026-05-11 at 13:44 +0200, Andre Przywara wrote:
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> > @@ -0,0 +1,162 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (c) 2025 Arm Ltd.
>=20
> Please put your own copyright here, even if that has been largely copied=
=20
> from an existing file.
>=20
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-a100.dtsi"
> > +#include "sun50i-a100-cpu-opp.dtsi"
> > +
> > +/{
> > +	compatible =3D "baijie,helper-a133-core",
> > +		=C2=A0=C2=A0=C2=A0=C2=A0 "allwinner,sun50i-a100";
> > +
> > +	aliases {
> > +		serial1 =3D &uart1;	/* BT module */
>=20
> Do we really need an alias for the BT UART? And is the BT module=20
> supported already? Then please add a child node to the UART node.

That's the only thing I can do currently regarding BT: stabilize the
serial enumeration, because UART1 cannot be used for anything else
except BT module, because this is soldered inside "core" module.
We can avoid different tty enumeration, should the support for
BT be implemented in the future...

> Isn't the WiFi/BT module on the SoM? Then please mention and enable MMC1=
=20
> here. Provide the child node for the WiFi chip, even if there is no=20
> upstream support in the kernel for it yet.

So both the above BT and the WiFi is AW869A/AIC8800 combo chip, which
has neither upstream driver, nor [upstream] DT bindings. Even github
driver for AIC8800 doesn't seem to use DT, therefore it looks quite
pointless to me at this point to specify anything in the DT for the
chip which doesn't have the bindings idea even theoretically.

Nothing in the current DT shall block any future work on the AW869A
support though and the above "aliases" entry shall even guarantee
unchanged serial enumeration shall such support arise.

> > +&reg_aldo1 {
>=20
> What is aldo1 used for, actually? I don't see this referenced anywhere.=
=20
> I guess the kernel turns that off after booting?
> If you have access to the schematic, please check that. If that's for=20
> some peripheral not yet supported, please note the user anyway, ideally=
=20
> by an explaining regulator-name, or by a comment. Also if it's used for=
=20
> any of the required SoC VDD pins. See the Liontron .dts for comparison.
>=20
> > +	regulator-always-on;
        ^^^^^^^^^^^^^^^^^^^
I suppose it's not being switcdhed of because of the above.
It's used for both PLL supply for the whole SoC + as analog voltage referen=
ce
for LRADC (the buttons you've noticed on the board are connected to
this ADC via a resistor ladder).

>=20
> > +&reg_aldo2 {
> > +	regulator-always-on;
>=20
> For always-on regulators we definitely need an explanation. Does the=20
> board stop booting if you remove this line?
> Maybe it's for DRAM? Can you say what voltage it is, either from the=20
> reset default, or set by the bootloader?

Thanks for the hint! I'll put proper voltages into all regulators +
comment all the always-on regulators.

>=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dt=
s b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
> > new file mode 100644
> > index 000000000000..ccbca5d0a40c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts

> And you should provide a top level 5V regulator here, to be the root of=
=20
> the regulator tree. Look at reg_vcc5v in the Liontron .dts.

It doesn't look to me as if Liontron had reg_vcc5v as its 5V "root" regulat=
or.
It seems to be only used for reg_usb1_vbus, while HelperBoard A133 doesn't
have USB power control. The second issue with Helper/Core split is that
all PMIC story is inside Core board which has 5V input rail, while HelperBo=
ard
around it has indeed 12V->5V DCDC regulator (similar to Liontron), but
putting it in the DT would introduce wierd dependency of the core to the
HelperBoard which carries it. Do you think it would make sense?

> So from the pictures I found online it looks like there is an USB-C port=
=20
> labelled "OTG", so can you please add an &usbotg reference here and=20
> describe that port.

Nice catch! I've missed the fact usbphy 0 has to be in peripheral mode,
not host mode. Will rework!

> > +&usbphy {
>=20
> Are the two USB ports always powered?
>=20
> And anyway, I see a *dual* USB-A socket on the pictures online, in=20
> addition to the USB-OTG port. So where does the third USB come from? The=
=20
> A133 only supports one host USB port plus the one OTG port. So is there=
=20
> an USB hub chip on the board?

There are two hubs, one on each usbphy. OTG side hub is even bus-powered,
two USB-A ports are always powered from the board's 12V->5V DCDC, no USB
load switches.
>=20

--=20
Alexander Sverdlin.

