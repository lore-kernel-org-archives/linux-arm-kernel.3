Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DD7CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljsxjbaWyNz7OWVslaNQIdtRCtCGcdM7OYfh7/y6g5E=; b=Xemh2eNYE8zlTxKV8fnF8TdoLL
	r33ZKgncDkIY4fD4jZjNWCufxO1LnV5G5DKSQkkeSxdmC0CiltkQhx0DSMOlcAVaGdBSstD8+nZgL
	nibx2MPLzX0cjV/f443v6IMSlGkEJXdEneTlLJRLJfohf3VPgH8R6MyTdOXtU+bmNuLIPRl8x3WFz
	vAFbvoy8GWncoohsfKt1AxNWTWwe0/nSQA3M/1NUeP9fLshYUpgvAxuoxaeC/SkTHKAsRal82uIpb
	D8KzbtvXWXNlt5IIRXPmdgkxZT4fp5UxrsID0DXKwFhubW9BzggJejd8Bee0yilLUy3iCNPB+mwJF
	aXoT6IPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHer3-00000002ZZI-0G6U;
	Fri, 16 Oct 2026 10:08:01 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHer0-00000002ZYq-2FTI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:07:59 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso24574295e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792145276; x=1792750076; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oeOC+O9trE6ZCicbgaUCo1/XxUpGsO8dMn32zaWU2cE=;
        b=TCNMjCgrQT05OilOmzESKro/qyLqW2EVHd15xpO9wxr5yXRH0/+LH47xKiK68u/WnJ
         Dvz9xx1VtI3X5oLaERZ1WD3s+FGzY4v9UEbzk0tlGwdIo2pCHmb2ufXhhx4eDuh5G4C9
         CN+iKoR+SjPfzWkTUF8GNdKWzNtwvNTg9hAdeiRNftK1pcZ24jlh2tyvPYEUNp7TQJq6
         Iq4iUJ9JppOaTZMp1uBIVJFROaVC/rSNxYm5dU7IeINfv8M3M9BUDxv8QFyBZMjKW82F
         eoSI8rnYHOcn9QF4xBDjJgx/j1SimPfYomI2D+mShFXI/EgCkTowJMZXmGJpvusXswln
         mA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145276; x=1792750076;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oeOC+O9trE6ZCicbgaUCo1/XxUpGsO8dMn32zaWU2cE=;
        b=PxPJmIm+AyBD7TQ2BjYPHj/eIB23bdGDS9w2SAI1wqbEKntW63CY7C4vGPUq4gtAtJ
         OmdrfBmb5fIihskND1IO/v29KbZVSQD6zoFxsF3gzMutnK2IswQVXn/UYGtBNb9KWHvH
         LxTqf+EKO9ZyMZa4aVYa8+m/BxgH7AWCCf7EwbMVVj6cnj5xw3IYuag73WOf0HZWK2wd
         RjIOgIhJiLB/L1I9wmDFka7fDr6Q9COB/2dsDSebReThUsfDkw/KfY78p+d0Pioo3VpJ
         aiSa+OyEK/yAT/98ZIOiz6uWtD89m+JVNCW9bkv6YubTm6pcKjGhDkBafDVkN/k+PDD1
         7juA==
X-Gm-Message-State: AFq9FYJQZyYqPGPndkZ3nDeuskIQgJo3+a8st6l5z8gk3pg6tHqQby8r
	YdlLIYm/2z+FFRS/bnLbkRE+hoc1McD5qvLYerHY7UaOpQpxIHe7G4FU
X-Gm-Gg: AYBFou1y1YF8Inzn0Dw1dkyhOD90b0iAulunSh0Q84525sqeH2s6poH9SP9KxrMWIsN
	d5sro7ET4nJjd0C9Kjy39rSA5808nkZAvbz946KqV+9gwFmlbXLT37zDemYts4Nd4skpCGoztIe
	ULN0b79lby1KsIILVdNB7fup7yp6MPfpAUERSSb2yiGxCiHLw+jNrbn/OxZROttRoRI+kTW9dVB
	BT3yvIl5O4MRszF3DACmTaLDTjtaOM6P/FesR3VR3WcDXMaoUADLBZhxt75SImsJE6PlkI/3ckd
	Nv06LIaGs84RvUe0nKWJMq9zz+dT47q5j0OH+tATW39eKY1AIQfWtN+IS5etgrhByg5VVm8sEUz
	YhjDFXIjH72IYmi+raGO3Ln9hma9N71PYwXeAgRefVDNqrbX6GSw1LdPk9fa1sDA+JBO2uRyd0g
	ifhadMOGj8Ga0LfbCnmfyXEf5RmvS4MFgjWCCuDoEku7g0/wBltwMt+RJNbm1XORrjXOb+k06Os
	172tqIvxAkKWNq65KFGJb/14JSB7wvNM5MDKP3uX9EshEZUHmyicS0Z
X-Received: by 2002:a05:600c:4e4a:b0:4a1:ac66:6ac8 with SMTP id 5b1f17b1804b1-4a1c7fa065fmr43366035e9.4.1792145276374;
        Fri, 16 Oct 2026 03:07:56 -0700 (PDT)
Received: from silicon.doe.home (194-118-146-41.hdsl.highway.telekom.at. [194.118.146.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9c001dsm134822975e9.12.2026.10.16.03.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:07:54 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, arnd@arndb.de, linux@armlinux.org.uk,
 robh@kernel.org, krzk@kernel.org
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Fri, 16 Oct 2026 12:07:45 +0200
Message-ID: <S2D2gSguRBGYM2GtGr5CkA@gmail.com>
In-Reply-To: <CAD++jL=TeOkPDq+xwGdUHdvJx31VtvGR9X53wJS0r0J9s2yLqw@mail.gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <aV_PM_GzRW6aLmK6NF7ttw@gmail.com>
 <CAD++jL=TeOkPDq+xwGdUHdvJx31VtvGR9X53wJS0r0J9s2yLqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartW3qWXJSyTHGnhsggtEkzAg";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_030758_606193_486991C4 
X-CRM114-Status: GOOD (  26.90  )
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

--nextPartW3qWXJSyTHGnhsggtEkzAg
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Fri, 16 Oct 2026 12:07:45 +0200
Message-ID: <S2D2gSguRBGYM2GtGr5CkA@gmail.com>
In-Reply-To:  <CAD++jL=TeOkPDq+xwGdUHdvJx31VtvGR9X53wJS0r0J9s2yLqw@mail.gmail.com>
MIME-Version: 1.0

Hi Linus,

Am Freitag, 16. Oktober 2026, 11:07:48 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb=20
Linus Walleij:
> I don't believe that the hardware block inside the SoC actually
> has a single inverted direction bit. Prove it =F0=9F=98=80
>=20
> This sounds much more like someone using open drain to drive
> the line high when setting it to input mode and has hacked
> their way around that behaviour instead of just asking the
> GPIOlib core to do the right thing:
>=20
> gpios =3D <&gpio 0 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;

I read up a bit on open drain configurations and I can't rule out your theo=
ry,=20
but I think it is unlikely. The following is from memory of my testing two=
=20
months ago or so:

On all GPIOs of my zx29 board except GPIO 24, direction=3D1 means output,=20
direction=3D0 means input.

=46or GPIO 24, if I set direction=3D1 and use the pull-up or pull-down, I c=
an read=20
back the bias state via the GPIO input register. The GPIO output register i=
s=20
ignored. So it is behaving very input-y. Bias on this gpio defaults to no=20
bias. Both pull-down (reads 0) and pull-up (reads 1) work that way.

With direction=3D0, the gpio output gets read back on the gpio input regard=
less=20
of bias. I.e. the GPIO overpowers the bias as it should for output.

The GPIO in question is used to keep the device enabled when running on=20
battery. ZTE's code calls it "PSHOLD". My best guess is that they wired it =
up=20
in that way so that the default hardware state, direction=3D0, value=3D0, d=
rives=20
it low and shuts off the device unless the software takes action to keep th=
e=20
device powered. The practical outcome is that the user has to hold the powe=
r=20
button for ~1 second until ZTE's U-Boot sets direction=3D0, value=3D1 to ke=
ep the=20
device running.

Do you have any other ideas I could try?

I do need GPIO 27 or so for the SPI display D/C pin, which sits in the same=
=20
byte, so I can't just declare GPIO 24 with a "dirin" reg.

> It does sounds a bit like churn if we remove a driver from the kernel
> and then add it back after some years...
>=20
> However if this is using GENERIC_GPIO (regmap is something else)
> this is a better base.
>=20
> I think it's easy for an LLM to port over the IRQ support from the
> old driver to this new one, given the code is already there and
> this way keep the best of both worlds?

You probably mean GPIO_GENERIC, which afaiu is implemented in gpio-mmio.c.=
=20
That's what I am actually using (I guess I confused this with gpio-regmap i=
n=20
my previous email). But my hardware (unlike Navid's) has no GPIO IRQs.

(The SoC kinda has GPIO IRQs, but those are handled via pinmux. A few lines=
=20
can be connected to the GIC, bypassing GPIO entirely)
--nextPartW3qWXJSyTHGnhsggtEkzAg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrR93EbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiBzAP/1ykkzCJwCbwgPs/FUNX
xmGgnG7GEJ4GJQsMQ4lYE3QGDJx2t8HVRktvHmx+q0ucU06omkIFEXOcOrjkc/S5
Wx/haqVPug7uaaBhzelRIaNTMi1AMxwC8pYTBTmzqaHP7X+daV2CkqZD9JHrL4wf
oZ7Y1D1pXjdYMdnbDj+Wg9GbA639UU14Wz7/D0wuy5RafLiAmwD1UL4Ekf4pe8p8
h3JKNBMBv/IoA1O3djNSrKA0UIjAVYKEezbMEwWAJHx1yPgYziASngIx/8wdnpmA
GBzZzwj7zXblzPs0zuOjZmMLopbZW9DrO/78wfDACPV/roHZeUHCrRyM+IZsbbS8
/w/CTYmRHU0pCM877KxwPzIO7a3TSTQpLdxsrGEIUebxHr2F5z0jBhpFvChsi/YK
brhUFeB09dPYtHbbdXt+nhvoTgssu9wWrtEh0My2AJOylWkfE8kLQhvfVshGgtXv
siCBFKybpbk7qhAzGyMQuMWpT93apin4vcAqqO3KhXcxiX3N3OBXjlUzboef6qgA
coTye5CgUBL/wiz5X84ALIkauXCWKetZwRRl6QWUkDZ1x+VhmaRJQeYgWntmF7sD
uMph3DawUGiqVL3N5TLS7lNoYN2As5Lh3zhVd2lDr+YIZTn/Oukdv/7Lg0RGBd/T
ceGZyF+asXjXP5i+MEMtevc/
=XJIA
-----END PGP SIGNATURE-----

--nextPartW3qWXJSyTHGnhsggtEkzAg--




