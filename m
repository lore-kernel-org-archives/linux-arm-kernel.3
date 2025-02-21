Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5CFC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 18:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=veHeZGAsIMfeo9MJB9NRykJz3c6tbQQyeQEGIEl/Nmc=; b=iAmddcdzSayxoV9+ogYs+rvsZ+
	FotiavBDAjDVO+Pa7/59UoFmrcx9fPnayJHT1d4YEdRW32f/EwZqIH4xEb9RnYJaw+RJP1U4Vo9JC
	0R7xainX1g/S5RlBXL7YFnFzvpH3UC5bfaiuTcgLKAAAI4t1dAsBU8huohuqhekmdDp6OMicpA3lK
	jxYKH8Qo+3EP5qp0rca8xtkL/NYNO87w6e5dbfEOtmZYuMMhrghrKj+hN3RMvTBZZGwhCzpP+4OkY
	1kTtX6dyuHPhqBHP3kOtvrakAn3WdQBd3q5WlKpna6o6qmaPSXjOGfi/JfYgDHMCghZ6mwbCZwT/Y
	mImIUVkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXpH-00000006XiI-1Rot;
	Fri, 21 Feb 2025 18:32:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXdQ-00000006VKh-1LgG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 18:20:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-439946a49e1so15999495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 10:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740162023; x=1740766823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veHeZGAsIMfeo9MJB9NRykJz3c6tbQQyeQEGIEl/Nmc=;
        b=awzsKGpdpisyEXoFz98JLCbH3+U0eMVpTZMTnEpJR+syJJMzpMUqiobQg9D61EFqjZ
         t1EO9/UEF0UemO0vhgJmkzFQxdZGs/wqdrLV//b1Mb5k1EckYmS690r0DQhj1cumwlai
         S1Q9tu93NSjUDb50h1yVlVTdzJLwwxOU0MTnVmlaPoy6jDsgL+LMjTuzArIQ+YvZ5Zoi
         HolA3zKbfWXMiB9Vs813TwSroqatn5Nw3gvXk68JUVgEu7YpJNoDthaVgQdw1vJIEPiv
         1QvCB2cApy+orNWI2EgJiELDZa03bPSvShDNWjqugVWCpxvk82U55ZHaH7JDYaHsssBf
         qfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740162023; x=1740766823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=veHeZGAsIMfeo9MJB9NRykJz3c6tbQQyeQEGIEl/Nmc=;
        b=D8OBeGHo7RDAlDWTbPNMtDFLSVLq4nQ9BG1hN4FHg90Mj5f006kb3n+RAe6e9yvsgy
         NI8x2Odir+ROY4qk2UUGKZr0HH+8htNRbkPQXjE07ux8bKHVIUT87CGBGfrLmbZvobzP
         lKYkOvjZ8Kp6OPWqngvTYhp/BEI52546s5OZ/+yNqIQH1OGRVwNwPNZ4d7iL5JsuVlpE
         6/MRYQls8AABEz8wVhUVQX/nBeqfMd3VNvriDTu0juRu+PTGG2jPfSPdzuTim0OvyV9y
         zKYyGYhHZii69iNpj0CG6JwPRZnN7/0gw6Lamo0mi1DignvjvuQ1UR7EBSFZayr6Mgpg
         wLLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVztU204Vx24GdrhY3ZbooppQP5ThOpyilZEY2oE3xkD3gQbT2CL5erMv+Y5I79LX49GgUaTy9Qd7j/iwxOXBEy@lists.infradead.org
X-Gm-Message-State: AOJu0YzEiz+cCd73PWjLMABw2NBI8OM/WxnyfFS26N2MObZiwuhTdXGF
	/AUs0ZOWlrJRfT6i22biyE9HB18FdpnroEFXbz5cqMaB3OR67ubS
X-Gm-Gg: ASbGnctz3bdyMWDm0tGD7/2ltj15KSqr/9FH+w3kNspE3k3u/FPGNrw7jLkK19RoVRz
	U5h38s5IOt6xZ536q6E1u1SveT3nw5nOM0Kh8oI39YAs/IFJ2BKg9REXqIoGDKCJbDHvYO+rY6O
	3n2CPDJw2K6bWJrFpNNR0UK/zCFsosnQCQwYr1rHR1po7SKgzO4BHoKiLttpHRmTipA9kO95Tpz
	NJ3jUKOsA+C4Am2ZuivOPzkm9gnyi6U+tiZx/F1lYdSCaVgzIGVNoZrVMjT3njdJHAJTXrJv+cp
	A1uu6Xi2hduNQ6GNvyV4NL3QYqQgIh2DCYFs2TnZ3kmrkzZPBUkUgLk8/7WGU58RpY13043YE0G
	jKg==
X-Google-Smtp-Source: AGHT+IG5DSiVWK86jS+eT9SXqpVSAsqf+fVk2fzSBX+ycmlA1PLgE8RCGQ9E1+kLqZ2oPVb+Mg5AIg==
X-Received: by 2002:a5d:5f83:0:b0:38f:4e6e:22 with SMTP id ffacd0b85a97d-38f6f0d1c7emr4036180f8f.48.1740162021124;
        Fri, 21 Feb 2025 10:20:21 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d65dfsm24489778f8f.64.2025.02.21.10.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 10:20:20 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Philippe Simons <simons.philippe@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 3/3] arm64: dts: allwinner: h700: Enable USB OTG
Date: Fri, 21 Feb 2025 19:20:19 +0100
Message-ID: <8490202.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <CADomA4_yMUS_S-YDrQdSKmZrDMwPeakkJBix-r08UFQejTYYcw@mail.gmail.com>
References: <20250118102207.9339-1-simons.philippe@gmail.com>
 <3229934.fEcJ0Lxnt5@jernej-laptop>
 <CADomA4_yMUS_S-YDrQdSKmZrDMwPeakkJBix-r08UFQejTYYcw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_102024_357839_1EDC789A 
X-CRM114-Status: GOOD (  23.47  )
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

Dne petek, 21. februar 2025 ob 10:54:27 Srednjeevropski standardni =C4=8Das=
 je Philippe Simons napisal(a):
> On Thu, Feb 20, 2025 at 9:38=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrab=
ec@gmail.com> wrote:
> >
> > Dne sobota, 18. januar 2025 ob 11:22:06 Srednjeevropski standardni =C4=
=8Das je Philippe Simons napisal(a):
> > > RG35XX have a GPIO controlled regulator for phy0 vbus, add it.
> > > Enable HCI0s controllers and otg for dr_mode.
> > > Add phy0 properties to descrive id_det, external vbus, and internal v=
bus
> > >
> > > Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> >
> > This could work without previous two patches, right?
>=20
> While this correctly describes the board, it currently doesn't works
> as expected.
> HCIs will enable the 5v on PHY and will never disable it.
> Resulting in a blown regulator on the board if plugged with another host.
> I managed to get this working by removing the PHY ref from the HCI,
> but this is wrong.

Ok, so this patch shouldn't be merged until USB patches are in.

Best regards,
Jernej

>=20
> >
> > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > Best regards,
> > Jernej
> >
> > > ---
> > >  .../sun50i-h700-anbernic-rg35xx-2024.dts      | 25 +++++++++++++++++=
=2D-
> > >  1 file changed, 23 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35x=
x-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024=
=2Edts
> > > index 80ccab7b5..5a6ae42de 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.=
dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.=
dts
> > > @@ -175,6 +175,16 @@ reg_vcc5v: regulator-vcc5v { /* USB-C power inpu=
t */
> > >               regulator-min-microvolt =3D <5000000>;
> > >               regulator-max-microvolt =3D <5000000>;
> > >       };
> > > +
> > > +     reg_usb0_vbus: regulator-usb0-vbus {
> > > +             compatible =3D "regulator-fixed";
> > > +             enable-active-high;
> > > +             gpio =3D <&pio 8 16 GPIO_ACTIVE_HIGH>; /* PI16 */
> > > +             regulator-min-microvolt =3D <5000000>;
> > > +             regulator-max-microvolt =3D <5000000>;
> > > +             regulator-name =3D "usb0-vbus";
> > > +             vin-supply =3D <&reg_boost>;
> > > +     };
> > >  };
> > >
> > >  &cpu0 {
> > > @@ -337,12 +347,23 @@ &uart0 {
> > >       status =3D "okay";
> > >  };
> > >
> > > -/* the AXP717 has USB type-C role switch functionality, not yet desc=
ribed by the binding */
> > > +/* the AXP717 has USB type-C role switch functionality */
> > >  &usbotg {
> > > -     dr_mode =3D "peripheral";   /* USB type-C receptable */
> > > +     dr_mode =3D "otg";   /* USB type-C receptable */
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&ehci0 {
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&ohci0 {
> > >       status =3D "okay";
> > >  };
> > >
> > >  &usbphy {
> > > +     usb0_id_det-gpios =3D <&pio 8 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP=
)>; /* PI4 */
> > > +     usb0_vbus_power-supply =3D <&usb_power>;
> > > +     usb0_vbus-supply =3D <&reg_usb0_vbus>;
> > >       status =3D "okay";
> > >  };
> > >
> >
> >
> >
> >
>=20





