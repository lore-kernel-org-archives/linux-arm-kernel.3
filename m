Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069B5C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 21:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuyMjwXFETGFChynAkpeAwy9XY2DzB5LoGagfznZ+W4=; b=cgrf3uAHr9Qp8L2+/5oynqb9+2
	7/TpTLs3KenKecDbSAvPhMIJvKxeIHpYiym1z8iZS7Zo80uz3bi6ISsJ3KlE64fINJPHkCGX7l4H0
	dfPerxjMfglUxnQis8ALyI7fs1tRuLnH4OsQ6R4St6qci6zelWBryJJapF1ZZlHMtVeiCJ6r9tAbJ
	X/Dfv3yz0/qoT/e7fOl77jR9fYX2bIS5dlCPqVQMwR5tbFx0NTXFetLQDk5DqTZZXXtn+dly183ua
	Wzo/oqBwVHFselbrMSJVmO5gZ0zFru10wok4fgzXC50tg504Gp1AwiSskRBq3vVNisHHqE0f3sUwm
	+SQKfTfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRKF-00000008fsZ-2pkw;
	Tue, 18 Aug 2026 21:26:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRKE-00000008fsT-0UyO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 21:26:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 40FA3601DE;
	Tue, 18 Aug 2026 21:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 625AD1F000E9;
	Tue, 18 Aug 2026 21:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787088385;
	bh=SuyMjwXFETGFChynAkpeAwy9XY2DzB5LoGagfznZ+W4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RvI+8R5k+BZBhhQpMoI2xKYFkMVpcNZKKieTAiXHVue03mKbxHiBo8iJ1GbbKZ3hb
	 gZWHjMuaH7iDJfSYZeePmN8KIEEH1UXHy/Ngdq40JsmgqfpTES7AVwhlM/eRh3Ov02
	 wpAjdIswwyejQRXComsd8JwG+/905t+RhBAwTMTeM6t2oKNAFDR9bXyf+/l69pU3JR
	 Vw//PKNvu7axbIEDhhI5GSHgEUM0oL771kqWu22S6i57iyPwwme9LQgJ0j3178qVCQ
	 vdbH46dVd97Te82BMwFqu+mzLLkhCLCRuQu7Y0pD/RYHQyQrSaDr0K2KbZy2sWQGcp
	 lUQ30Ev0DJzUw==
Date: Tue, 18 Aug 2026 23:26:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, bigunclemax@gmail.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 2/4] pwm: sun8i: Add H616 PWM support
Message-ID: <aoTMMAGbWelnjJTo@monoceros>
References: <20260703152215.192859-1-richard.genoud@bootlin.com>
 <20260703152215.192859-3-richard.genoud@bootlin.com>
 <aoQibj7sCd6o8W6h@monoceros>
 <CADvTj4r=uBJyJdmK3T+jD_Nitg2NBs7fZgtE5p6wt9zwWgj6DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aspcbffde7kziapm"
Content-Disposition: inline
In-Reply-To: <CADvTj4r=uBJyJdmK3T+jD_Nitg2NBs7fZgtE5p6wt9zwWgj6DQ@mail.gmail.com>
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


--aspcbffde7kziapm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 2/4] pwm: sun8i: Add H616 PWM support
MIME-Version: 1.0

Hello,

On Tue, Aug 18, 2026 at 08:12:43AM -0600, James Hilliard wrote:
> On Tue, Aug 18, 2026 at 5:00=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek@k=
ernel.org> wrote:
> > I didn't look at Sashiko's feedback
> > (https://lore.kernel.org/all/20260703153337.B5AFF1F000E9@smtp.kernel.or=
g)
> > but I would expect that not all 9 high-severity issues identified are
> > slop. Please look through these for the next revision.
>=20
> I sent a v8 that should have fixed all the sashiko issues along with a
> bunch of other issues:
> https://lore.kernel.org/all/20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.=
com/T/

Damn, I missed that because my usual check for newer revisions is using
the sender as key (because subjects occasionally change). You didn't
write about your patch series being coordinated with Richard, I hope it
is.

Just looking at your changelog I think most of my manual feedback still
needs addressing. Can you (or Richard?) please go through my feedback
and address the things still relevant for your v8 please?

Best regards
Uwe

--aspcbffde7kziapm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqEzfsACgkQj4D7WH0S
/k5h0gf/aSOW4cg9TnUnoNOdZBHgY2AauDIKKspn0FUqvOvhL6QTxqE8Iz8/M9uz
vYzr30cxYHuPdzQiueRB/CGxZ01AIXbLEnPdwf4JzQrzcY8WdUHq76W2urres601
Rw/isuaFFlDLZhmGpq8hFe2aYVIdBusWqkqZ7vqDT82GrI4eMdFpD+EAVp+B6RkI
TLAaQsNpiUlv1yf/XFs2CR0urSgArnABlMBt6Bmuu8NuySY6M2WzztB45U+0S7M6
j36R+K+Qa7TtYcvGEWyx7pNL5hZXDkGgsQS9GXYU8t1pgNf7azHV1iuUbbzlj6aw
YSmgcYcxyYL9dNSN8sTKnit1vmN1Qg==
=p4iJ
-----END PGP SIGNATURE-----

--aspcbffde7kziapm--

