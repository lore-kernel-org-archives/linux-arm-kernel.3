Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FD6E9D402
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 15:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrFryuW4d7CuTJXIuTi1E44LTJvPuOdvKgCGVsZCTHo=; b=ALQoBQBWN5htwK7XQEnoyrtnkN
	V2bS55ol/4MnTIUn0joyzuL5joKiNoI+Hmsp9QzZN5uY4VgOEC23DqnUxSd2FZQY05333CrvAevoF
	1S2LIft3UcsycFILtXWklq0HfoXvyU4x0nOupMF/yIlpBKUY1UzBmhXZSWrnO6FBsFUWhRssbx2ql
	cMM846YzN3ZmKRDAhSJxwgQTvWCbTDitKRhXNFHoQHyEf5O10veqxvOfW86HVByHA+G24kNPjJzC8
	ISk24ww2uob6ORMgTEe90l6LZWzic5T8Y4vDrCsTzq1SSFJFSTaQQO1cU3cZHmlS1U1gFwuBtzPq3
	CaGZZrhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnf8r-00000008hWi-2bv2;
	Wed, 04 Feb 2026 15:50:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnf8q-00000008hWT-0z1Z;
	Wed, 04 Feb 2026 15:50:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 27A5660010;
	Wed,  4 Feb 2026 15:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86582C4CEF7;
	Wed,  4 Feb 2026 15:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770220206;
	bh=BkSI3qiEojYI8+NzCD4MDyb+3HYV8iO+aXk8/0PY62A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tEe1CAKP8Y8XSy/J7G/sC04hC6wxZ8ItlE4TpsoSJnpoWJteovAhfcNOCqvgNzCPA
	 3hfh4ALD7yaYaoPoIbj7Ms5UMVq2pzrFIX1xEzC8KZzXY9QxbgThQBGUhhiPrILmQ8
	 iL3+FNGBcFmujTrQOAeSf3Xj2Xzq1rCZbnicW7fBd39EXoqEDEoqyBfrYhg1mBhntZ
	 WK96L9+QgkhFY8sTrR5Y2zYMYq7fnZX/txvfkObOTBMOHDUcRxXk3/Tssee8g25XlB
	 o8xtBily4FLYHzP0cWVrQRailpcR9W+wznqjHaTXtpIQ91ClpEZ8tVseaktrNHz0Dp
	 iQXEgpTmtJPVQ==
Date: Wed, 4 Feb 2026 15:50:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux()
 to amlogic-am4 driver
Message-ID: <20260204-credit-precinct-5424c122a79f@spud>
References: <20260203-craftsman-battered-3491ff68f462@spud>
 <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
 <aYL9zgEyCarrluvP@black.igk.intel.com>
 <20260204-crawlers-nacho-d7c9021cdb6f@spud>
 <aYNWMndBWxxoPABG@smile.fi.intel.com>
 <aYNXFdxZiO2TMwSy@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0OF1cuAwrOP+OMTg"
Content-Disposition: inline
In-Reply-To: <aYNXFdxZiO2TMwSy@smile.fi.intel.com>
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


--0OF1cuAwrOP+OMTg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2026 at 04:26:29PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 04, 2026 at 04:22:47PM +0200, Andy Shevchenko wrote:
> > On Wed, Feb 04, 2026 at 02:15:10PM +0000, Conor Dooley wrote:
> > > On Wed, Feb 04, 2026 at 09:05:34AM +0100, Andy Shevchenko wrote:
> > > > On Wed, Feb 04, 2026 at 12:34:36AM +0100, Linus Walleij wrote:
> > > > > On Tue, Feb 3, 2026 at 5:17=E2=80=AFPM Conor Dooley <conor@kernel=
=2Eorg> wrote:
>=20
> ...
>=20
> > > > Note, please, remove extra '.' (dot) in the Subject.o
> > >=20
> > > fwiw, the .. was intentional cos I was truncating the pinconf_generic
> > > from the function since the subject was really long, not referring to
> > > a member of an ops struct.
> >=20
> > Yes, and that's how we refer to the callbacks =E2=80=94 with a single d=
ot and parentheses:
> >=20
> > 	.my_cool_cb()
> >=20
> > Alternatively
> >=20
> > 	->my_cool_cb()
> >=20
> > but it one character longer and TBH it slightly less readable (I person=
ally
> > used the latter and then switched to the former in the recent years).
>=20
> Hmm... My memory tricked me, it seems I switched to ->cb() notation, at l=
east
> there are patches with that from October last year. Whatever, choose one =
and
> use it :-)

I think you missed my point, I was /not/ trying to refer to an ops struct
member. For those I follow the first of the two notations you listed.

--0OF1cuAwrOP+OMTg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYNqqgAKCRB4tDGHoIJi
0ukoAQDQ5ViLSFJMmy4xkPoDHm7OnAxc0QA0ACxcwp9yajZXNwEA5bi3lRwEWQJE
bgZDkqX/k8lTJggwpwzD3KHAzo9ndAw=
=mP0U
-----END PGP SIGNATURE-----

--0OF1cuAwrOP+OMTg--

