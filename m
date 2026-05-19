Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236E6CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 03:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Djdiv4Vto2J6dw+SLyMd4Ddbo7EpMG2rn/QzqSFfqY8=; b=oITTGjnXxw9e1I
	zACGjok4TJ4dhXV5CzAqAyuRAt65L7xpIaGWcQJVaicI9UzfMVV2e2mi/IspOULZfg22U3CVRUZa/
	9WPeZlrrg053hmFPgcEemvufBpMt6XiLk46n/kQBpOQZhAtzKkbsKfWv/tU7dMPaZu+DiPwM4DAJe
	Ddcu3h9HFR3pf08+wriNAgdLQpqeJxdMmSTylP3syUdXK+NtaFcD3b2EP2NKqUSssQldqLZVWQTEE
	kU/Il1kQvsAa0mm4aR7F/5CqYx1zdbBxd7bgkl+HDgd79qBeD2we8otK/PMc6A3DuXVjfY+AZXFWk
	BuXjOagQiIqo5vLN5+cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBDa-0000000Ha40-2CCb;
	Tue, 19 May 2026 03:34:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBDW-0000000Ha3Y-1iKD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 03:34:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F5F6442AD
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 03:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812DFC2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 03:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779161641;
	bh=nqKg2vNqhpGy8mWBUrH5n648k2I71k6MfxdNSF69OdA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=SjonHy3/Bl4JhFw48DynnSqz6PqlQC615bV+ELzdICsUebCLPeMjylDSbyEjSd+2R
	 svvVgacwmgrWRH67NtJwCJPm7HhU+JSPuJ5jh+reA0mqhD+AhrD9IQJpZc6ZOBNKPz
	 5XB9ShRumxfrAmHbhrBsE0mtlyzMx/tL9NO+4FMz0xs93WEFI5UqQyUdh36wZyV/jy
	 yrTUSD/u6ZFvY320Dss8T4ynJOCUYfVGvLZkV5hub5MPZCSlMrwT15CErgx/ANGRyo
	 Byghh8prXWAvBT9JO5JZ54QgKxm+u5tWxEdBdAPuhWKjfnENxRVIAD3PerwK4pAlTb
	 ikyOEMBDaaqNw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-393d07e8938so27568501fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 20:34:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/46pH3SQJUpJW7KXyX0KEW6NQMhBWLnUk3v63p2zW8Tn2aFmDelvExdqLzvoCimaGz/018ehfi4QWGZ66hSjOT@lists.infradead.org
X-Gm-Message-State: AOJu0YwwqLB9bFSsM0npdc6Tf57r/ajBPhiDSn+SBnn5JrEFRMvCGqI7
	Ymq71+LuGhmkz7ZwS0V+thPeU5/w6A1PW80GU3vjlP3XZ5D5fZHDp7khbsi9CKYNoobPBKRhFi2
	CiCfecvNpEywFmZV5gSdwl7cG8HDHAH8=
X-Received: by 2002:a2e:9854:0:b0:394:472e:e430 with SMTP id
 38308e7fff4ca-39561c124d8mr40219351fa.18.1779161639815; Mon, 18 May 2026
 20:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
 <20260510201644.4143710-4-alexander.sverdlin@gmail.com> <agr9m_tidBr6Cu2h@collins>
 <04da68168f92b196cce4d49c766fc62702bf6472.camel@gmail.com> <aguIvpKQM18kX97T@shepard>
In-Reply-To: <aguIvpKQM18kX97T@shepard>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 19 May 2026 11:33:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v66C4o020Wj979O9Ms1yGrQ9mxTppex7L+i8F2=HobktCA@mail.gmail.com>
X-Gm-Features: AVHnY4LLydhSeTMxsbAa_7rikkTlCp_XrE-66uJsZgTVHv70SiGFx9AM4k7da9Q
Message-ID: <CAGb2v66C4o020Wj979O9Ms1yGrQ9mxTppex7L+i8F2=HobktCA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
To: Paul Kocialkowski <paulk@sys-base.io>, Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_203402_495030_A6A706ED 
X-CRM114-Status: GOOD (  44.14  )
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

On Tue, May 19, 2026 at 5:46=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Hi Alexander,
>
> On Mon 18 May 26, 22:05, Alexander Sverdlin wrote:
> > Hi Paul,
> >
> > thanks for the review!
> >
> > On Mon, 2026-05-18 at 13:52 +0200, Paul Kocialkowski wrote:
> > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.d=
tsi b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> > > > new file mode 100644
> > > > index 000000000000..65b094f30bf5
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> >
> > []
> >
> > > You should add:
> > >
> > >     chosen {
> > >             stdout-path =3D "serial0:115200n8";
> > >     };
> >
> > I actually have it in .dts, but it's theoretically possible to deploy
> > the core board in a way that serial0 is *not* a console, so the above
> > probably will not be valid in all cases in .dtsi.
>
> Yes I figured out later that it was in the board dts file and I initially
> assumed it was missing entirely.
>
> In practice both options are fine, although the reference software does
> hardcode UART0 as debug serial.
>
> > > > +&reg_dcdc2 {
> > > > + regulator-always-on;
> > > > + regulator-min-microvolt =3D <500000>;
> > > > + regulator-max-microvolt =3D <1300000>;
> > >
> > > Should be:
> > >     regulator-min-microvolt =3D <900000>;
> > >     regulator-max-microvolt =3D <1300000>;
> >
> > 0.81..1.2v according to A133 Datasheet Revision 1.1 Jul.14, 2020?
>
> I guess the initial values are taken from the allwinner-perf1 board dts.
>
> The 900 mV-1.3 V range matches the CPU OPPs (although it really only goes=
 up
> to 1.13 V). Maybe down to 810 mV does work, but we don't have an OPP for =
it.
> I think I took these values from the reference BSP for the board.
>
> Also it would be good to add:
>
>         regulator-name =3D "vdd-cpux";
>
> > >
> > > > +&reg_dcdc4 {
> > > > + regulator-always-on;
> > > > + regulator-min-microvolt =3D <500000>;
> > > > + regulator-max-microvolt =3D <1300000>;
> > > > + regulator-name =3D "vdd-sys";
> > >
> > > Should be:
> > >     regulator-min-microvolt =3D <810000>;
> > >     regulator-max-microvolt =3D <990000>;
> > >     regulator-name =3D "vcc-usb-sys";
> >
> > I'm a bit puzzled here: datasheet says 0.9..1.0v
> > and it has no "Typ" value, similar to VDD_CPU, but
> > VDD_SYS is not part of OPP tables, so who is going
> > to adjust this? Or shall it be just

No one really. As long as the current voltage is within the range,
the kernel will be happy. But ideally the DT just describes the
acceptable range, and the bootloader programs the correct recommended
voltage.

> > regulator-min-microvolt =3D <950000>;
> > regulator-max-microvolt =3D <950000>;
> >
> > ?
>
> Yes the reference BSP runs it at 950 mV, LGTM.
>
> >
> > >
> > > > +};
> > > > +
> > > > +&reg_dcdc5 {
> > > > + regulator-always-on;
> > > > + regulator-min-microvolt =3D <800000>;
> > > > + regulator-max-microvolt =3D <1840000>;
> > > > + regulator-name =3D "vcc-dram";
> > >
> > > Should be:
> > >     regulator-min-microvolt =3D <1100000>;
> > >     regulator-max-microvolt =3D <1100000>;
> > >     regulator-name =3D "vcc-dram-2";
> > >
> > > ALDO2 is the main DRAM supply, this is the second one.
> >
> > Core schematics mentions 1.1V/1.2/1.35/1.5 on this rail...
> > Currently U-Boot has CONFIG_AXP_DCDC5_VOLT=3D1100, but potentially
> > this is adjustable, right? At some point LPDDR4 chips they
> > are soldering today will be unavailable. And in the current
> > market it will happen rather sooner than later...
>
> It is part of the LPDDR4 spec that the main voltage should be 1.8 V and
> the second and I/O buffer ones should be 1.1 V. See JESD209-4D Table 180 =
=E2=80=94
> Recommended DC Operating Conditions.
>
> Maybe they jsut copied this comment from a reference design that allows f=
or
> other types of DRAM too. In any case their BSP hardcodes 1.1 V anyway.
>
> > >
> > > > +};
> > > > +
> > > > +/* DCDC6 unused */
> > > > +
> > > > +&reg_dldo1 {
> > > > + regulator-min-microvolt =3D <700000>;
> > > > + regulator-max-microvolt =3D <3300000>;
> > > > + regulator-enable-ramp-delay =3D <1000>;
> > >
> > > Should be:
> > >     regulator-min-microvolt =3D <1800000>;
> > >     regulator-max-microvolt =3D <1800000>;
> > >     regulator-name =3D "vcc-pg";
> >
> > Do suggest to drop vendor's
> >
> > regulator-enable-ramp-delay =3D <1000>;
> >
> > in all cases?
>
> Well we generally don't have the delays in the axp regulator definitions =
and
> it works well without them, but I guess they don't hurt either.

We should probably keep them if we know that they are properly measured
values, and not just cargo-culted.

> In practice many drivers will have a delay after a regulator power on any=
way
> because we generally expect that hardware needs some time to power up,
> in addition to the regulator. So all in all it's rarely critical.

Those are two different things. Devices generally say "wait x ms" after
power rail is at full voltage. The enable ramp delay is the time it
takes the rail to get to full voltage. The latter depends on board
design (capacitor rating) and PMIC settings.


ChenYu

> >
> > > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helpe=
r.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
> > > > new file mode 100644
> > > > index 000000000000..ccbca5d0a40c
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
> >
> > []
> >
> > > > + aliases {
> > > > +         serial0 =3D &uart0;
> > >
> > > The is best added to the core dtsi.
> > >
> > > > + };
> > > > +
> > > > + chosen {
> > > > +         stdout-path =3D "serial0:115200n8";
> > >
> > > Ditto.
> >
> > But it only physically materializes in Helperboard, the carrier.
> > Potentially this one can be left floating or used for something else.
>
> Yes fair enough, I'm happy with having it on the helperboard dts file.
>
> All the best,
>
> Paul
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.

