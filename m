Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9194C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Jun 2025 17:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvjMh6xHjfGovjYf+2MAnKPCwYWdWq/nxmY+F6jynh4=; b=YFuSZtaP5nie8n21Rrqq9ASNAG
	tYgSJ1Hy89ltLSdqlhHPXh1EEmWbsd8KoIUcY5UzpYaAf70MfIEJLgtVJPHkglxt73m5kJ97DoJph
	YEAxgSCCHTmqTGvK0TNlvrKs/kUI6NMe0hYVGeP7kXv/TVsr0aoUKORiDA/KWb32jcw8U+SuZWue3
	m5Y24iLzJs+vl2EL/ciHwFNqssptGSIGad/R3a2PyUHAsOUgrdkSnS7dOpheGEJk9C9QUYDTrbG4N
	+NUmyrZBq8stIsgSgd0/Vhek+k7qv+B6Hm3JwXFF4hcksMWSd1aUxEeo3axYD/i1gGjPJ/XONA1lw
	us89xU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTOkZ-000000013gZ-36Eb;
	Sun, 22 Jun 2025 17:45:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTOiG-000000013Zh-3Pxg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Jun 2025 17:42:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F7FF60052;
	Sun, 22 Jun 2025 17:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75315C4CEE3;
	Sun, 22 Jun 2025 17:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750614159;
	bh=iIRZerzboVHSiIdEuNt8ByZGFCKc+tjHJxcG6FpZOWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N9RqyvRmbHOVrL9UzHLi44GzJIMibY9kCJty9Jp4w/Tq0rdGgthxIbaORe2FbnRCQ
	 t2ItuP8RmzyUecXD7MluuXFQsB4T7Ulb+igBtyqIiDn413BcCHriFk3tQ2pTeKSVy8
	 Ie9avpCQwJi4/QKx4TPjzQ7cLnyVU5OPBGlL8cGfYwLM62Ri6IWHWUlZbi9YbdY69c
	 DH4shDPg6zImylYZDea7l/WyBSmJ4j3xiXA+5BhX5zGRPFdb8pR3XgGhS2jLeokDLR
	 qB0Io9/e49F2PljufBFfYg3b+glJOpAYdGSh+DiWMPfIBhDVJSlI2A934qX18Y6gyR
	 PIpmA4zgeoYBA==
Date: Sun, 22 Jun 2025 19:42:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-arm-kernel@lists.infradead.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: rpi-panel-v2: Convert to new PWM waveform ops
Message-ID: <vgtrbci4nffarwtkk4oy7tbespt3w3nvv7dgur4sq6s3bbqqsg@d5qzp5zxtc2o>
References: <20250617005059.614993-1-marek.vasut+renesas@mailbox.org>
 <jgafc7te2zotqwvetudo6c4o4nit6zi3yp4ecg4gka53hrypk5@7ypb5asrc2ct>
 <b464bc12-e921-4d98-9462-ec9d13ccb5ce@mailbox.org>
 <pb5gr65kbkokb7ybx3smqaa6vve4rkpg6qks2hdibwgrwmdzfu@6s5msb3k2p6y>
 <224fb424-6be7-455e-a2b1-f6e39e40d0d1@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="is2iys6sxmeav7qo"
Content-Disposition: inline
In-Reply-To: <224fb424-6be7-455e-a2b1-f6e39e40d0d1@mailbox.org>
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


--is2iys6sxmeav7qo
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] regulator: rpi-panel-v2: Convert to new PWM waveform ops
MIME-Version: 1.0

Hello Marek,

On Sat, Jun 21, 2025 at 06:18:01PM +0200, Marek Vasut wrote:
> On 6/17/25 4:13 PM, Uwe Kleine-K=F6nig wrote:
> > > > /* The actual value isn't known, so this is made up. */
> > > > #define RPI_PANEL_V2_FIXED_PERIOD_NS 100000
> > > >=20
> > > >=20
> > > > static int rpi_panel_v2_pwm_round_waveform_tohw(...)
> > > > {
> > > > 	...
> > > >=20
> > > > 	if (wf->duty_length_ns > RPI_PANEL_V2_FIXED_PERIOD_NS)
> > > > 		*wfhw =3D 100;
> > > > 	else
> > > > 		*wfhw =3D mul_u64_u64_div_u64(wf->duty_length_ns * 100, RPI_PANEL=
_V2_FIXED_PERIOD_NS);
> > > >=20
> > > > 	return 0;
> > > > }
> > >=20
> > > This fixed period specified in driver has one problem -- what if the =
period
> > > is also specified in DT by the consumer, e.g. pwm-backlight pwms prop=
erty,
> > > and it does not match RPI_PANEL_V2_FIXED_PERIOD_NS ?
> >=20
> > If it's off by only a little amount you will hardly notice. If it's
> > further off that's less optimal. I don't think this is a problem. If the
> > device tree is wrong, the machine doesn't work optimally. That's quite
> > expected.
>=20
> Before this rework, the DT period and duty cycle were scaled to match, so
> the period mismatch problem never occurred no matter what period was set =
in
> DT. I suspect with this rework, such a behavior is no longer possible, or=
 is
> it ?

I see your point. But looking at it from the other side (which is the
official one) the duty_cycle was set very inconsistently before. I'm
aware that whatever policy is the one that you should base the hardware
settings on has strange corner cases. The one that was chosen is one
that typically is easy to implement. And with the waveform API the
consumers that would benefit from a "implement a setting that minimizes
the difference in the relative duty_cycles" policy can cope now. But
that only works if the drivers implement the promise this API gives.

> > > This is easy to solve for this tohw function, but what about the from=
hw
> > > which assigns period_ns ?
> >=20
> > If you only write waveforms to the hardware (probably using
> > pwm_apply_might_sleep()), the fromhw callback isn't involved (apart from
> > debugging). And all fromhw callbacks are supposed to assign
> > period_length_ns. I suspect we don't have the same understanding of the
> > PWM abstraction.
>=20
> The core does check whether the fromhw is implemented alongside
> .write_waveform , so how should the fromhw behave in such a case ?
>=20
> See this drivers/pwm/core.c :
>=20
> 1633 static bool pwm_ops_check(const struct pwm_chip *chip)
> 1634 {
> 1635         const struct pwm_ops *ops =3D chip->ops;
> 1636
> 1637         if (ops->write_waveform) {
> 1638                 if (!ops->round_waveform_tohw ||
> 1639                     !ops->round_waveform_fromhw || // <------ HERE
> 1640                     !ops->write_waveform)
> 1641                         return false;
>=20
> Maybe this should be patched out of the core.c and fromhw removed from th=
is
> driver ?

Most drivers can read out the current setting and those benefit from a
=66romhw callback, as it's needed to interpret the read settings. Every
driver can implement fromhw. Additionally I find it usually easier to
understand the fromhw callback than the tohw one. And it's needed for
the PWM_DEBUG checks. So no, I don't want to make it optional.

> > > > > +static int rpi_panel_v2_pwm_write_waveform(struct pwm_chip *chip,
> > > > > +					   struct pwm_device *pwm,
> > > > > +					   const void *_wfhw)
> > > > > +{
> > > > > +	struct regmap *regmap =3D pwmchip_get_drvdata(chip);
> > > > > +	const u8 *wfhw =3D _wfhw;
> > > > > -	duty =3D pwm_get_relative_duty_cycle(state, PWM_BL_MASK);
> > > > > -	return regmap_write(regmap, REG_PWM, duty | PWM_BL_ENABLE);
> > > > > +	return regmap_write(regmap, REG_PWM, *wfhw | (*wfhw ? PWM_BL_EN=
ABLE : 0));
> > > >=20
> > > > How does the PWM behave without PWM_BL_ENABLE set?
> > > The display stays dark.
> >=20
> > So you cannot distinguish writing `0` (or any other value) and
> > `PWM_BL_ENABLE | 0` I guess?
>=20
> I think no.
>=20
> > I ask because for some hardware's it makes a difference, the output
> > might e.g go High-Z on disable.
>=20
> Maybe Dave can clarify this, although I suspect this is also some third
> party hardware with no documentation.

Maybe this question is better directed to the vendor of the device?

Best regards
Uwe

--is2iys6sxmeav7qo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhYQIgACgkQj4D7WH0S
/k6IlQgApyBy3MqoO0IlaUgXGRjQJBQtryuuPzPG1/6iN6rcu5qs1U9XGEExUgBg
Ezdqsq20+vGROKAXX2w/6lNGzgcsD8VtCteOoYt4/3lkG+CyTGM1/A+gdfWulj13
WhoxfOWorXTaM9KwDilDttaeJy7ujZe3UJlVkhobfFVGbkK9wAnSUHo3IV1SNz9e
Rz8z1tCV7ohlzrmhcucG4ULN/Ua1xY818sm4vi5dpxloJoyFA6aqZ6kuVbbJO6at
+c4lLENNQLGvzpdrwogHpRTMS6HADtcHYCTezQHxytsfp13O6SzrgfJKyMyx0prR
e4CCrqsI3845KVZ5KuV5HuDNE3UgFA==
=JdaO
-----END PGP SIGNATURE-----

--is2iys6sxmeav7qo--

