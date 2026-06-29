Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD4BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 18:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72JIEoLKx37OHH8fZ3TP/h3pK5BaK4rA7WRI0tmZ6Ug=; b=N+EFc7mMVYDSV3zQFzlNnHlgps
	V/oFW/lmjvEk+I+KlZo4OLrY2H6FDXhbxuCT6AtKmfyBrVUTkthe8V+ZlqIwa7HMYzs6dmAb5ywKZ
	nCl9LUKrl2MGYnS0/3FV7bNRFBRBmnT4AsT+/o5Lco4yxOX8M5k4+Iqy0yJLUpCZrookkKzJYr4dX
	lH/xqm8d4wZucR55uZpczIn7AJ8XDYy2VMR2rm/Ycofrbhu8WkZeoZIVPYg291Uu7Z0ZOLMdyRO0c
	QRHnvuK5dF7TPOLKg041BT2KI00XA2hgq0SfFPpSURk5vaSHh92eI8Bh4KC37BsU8MRrRe/28wFMn
	09YMZHqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weGRZ-0000000FKx0-0wpD;
	Mon, 29 Jun 2026 18:10:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weGRY-0000000FKwr-0lnB;
	Mon, 29 Jun 2026 18:10:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E83F60123;
	Mon, 29 Jun 2026 18:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1D361F000E9;
	Mon, 29 Jun 2026 18:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782756650;
	bh=72JIEoLKx37OHH8fZ3TP/h3pK5BaK4rA7WRI0tmZ6Ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=o09ITYZh4w9HQLdMETw+RbyLYPuUij1cj0zZ+iwiboHf9/qkxSY4F9C5ELJ7dyu72
	 o5JEqiENhkhRTwcJ7yRX8u2oaprTSetcoZWgaXevNg5+jnVB3xEne84oBzfw7/ZA+6
	 GJJBLzP/x6sFRC2VlXEl9ybfay7RkZuUFP3SjwX6yzBK3kTfUPB9XAT3ZHKipH2ONq
	 OuZDNKBnhdWNZaiSJAkCjnpffuLaE7t9Si50I+eupzMtepAUijN5ZroA/Tt7hoU52A
	 I12dE6+o1Uulj8RlMga1YLRG4uxqdbL0WZjXs5e5uOyCrdekVvZ81AHy68vuqegjdx
	 qQb6n+QGBYGHA==
Date: Mon, 29 Jun 2026 19:10:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Woodrow Douglass <wdouglass@carnegierobotics.com>,
	linux-kernel@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Saravanan Sekar <sravanhome@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 0/2] regulator: Rework i2c_device_id initialisation
Message-ID: <d1e9fb06-893e-44dd-8231-ecddbbfe242e@sirena.org.uk>
References: <cover.1781888370.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pT/lO1kZRus4BcJI"
Content-Disposition: inline
In-Reply-To: <cover.1781888370.git.u.kleine-koenig@baylibre.com>
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


--pT/lO1kZRus4BcJI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2026 at 07:17:07PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> Hello,
>=20
> v2 is available at https://lore.kernel.org/lkml/cover.1779184320.git.u.kl=
eine-koenig@baylibre.com .
>=20
> The only change is that I rebased to next-20260619 and dropped the
> adaptions to the of_regulator_match arrays that Laurent pointed out to
> not belong into this patch set.

This needs rebasing against current code.

--pT/lO1kZRus4BcJI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpCtSQACgkQJNaLcl1U
h9AWPwf/ZoeFDRo86smT9VFPfcgi57D21M5dPfxTBTc05y3kPdFeXMlMbdURSfE5
oVJ1RpgGSq1JLLz1XbfGdNiAtgfQ5jjXUf0/WXnaY8vE3GAPmWdmiITQ93eoQbDq
KZHD13wuGD44/gj67Xit6UYhslEzK0uwMKcks3san1EQK1+qpVP6/fe34W4EfNMT
m39cXQ0HCgYkwM+nkFhQ5jY+lrm+W8wA+GlVE6hngeodmGxh+rmHm4aN4FU3g1l9
6vp1psv+p7BZnX/CD++phWOB81kWjtErDYO749WgnFs5vjylPne0w8+h+gTNVXh1
YOOl47yQsKhzdPsrjE5LGihrpxbCwg==
=1RUD
-----END PGP SIGNATURE-----

--pT/lO1kZRus4BcJI--

