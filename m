Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D14DC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52tNeDu8Sx+QHd6wEVEFM9NUN84pRBXq3nOTjLgEzE8=; b=mmGd6Hh5cEzTqvaafgFDOBByHj
	F5lKlSIR2ylWyKht4ZvqdJToOcT8FQfWmSOcY7o63wJG7S3G08cOIYB4Tu2VoJ21TIb+f6S6KL/kw
	yWakCwtJX4F5YboX2Dcx2w9cu0NzX4J3zS/XbuX5DLJ232n5Cfb8ChnHHkqP60ED/eoFSOhyMFKOp
	Za60H7PeTLS6+Md3MWWmANDyLI1k5ubziFT9wDqtdJxJmTfSjRGEvz/XvGfUTWlWwCbBMFCAWfcOM
	tI88i6aR2NYr/g/TazFuecJNozgGaLfb+SEyto/OEsm0X4Xz3F3kY+hAhq675yl/2bNNmC0VeHmgV
	aGrC7mCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ftv-00000002bMd-0hFa;
	Mon, 21 Sep 2026 15:25:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ftu-00000002bM5-1PXs;
	Mon, 21 Sep 2026 15:25:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A02F40A50;
	Mon, 21 Sep 2026 15:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B221F000FF;
	Mon, 21 Sep 2026 15:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790004349;
	bh=52tNeDu8Sx+QHd6wEVEFM9NUN84pRBXq3nOTjLgEzE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lx18RnvPmerMwYKQBdZc24TN0CA72fv1PlKnIN7fmREb7z4DLrOzWNxX0v1AfkThT
	 2on/RpJJUThi4V13fYJKL2Orrx5UD2dx4E38CnNYuvwOUU6bgjsNJ5hsuzm1zwAxCl
	 01DDbFqnAHOV56oV49xPxn5toCEHk2gjkb/Po/jisxflIq8qlh9vxjUCN4PvcR9tKe
	 XoOIXln291MBXqB0BLKdNEl0l33QzQpmeM8f0MGLf5uWGgFXm17X6RzdeQu0PIE/AY
	 ptaH/kTFHjN9PS16mhnjg0DVXQ9gvdsqIBHBm/l1M+CRzO4v+FQwld92QZOSh1R6g4
	 RLll6pDrbXqjg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 569CB1AC56A7; Mon, 21 Sep 2026 16:25:46 +0100 (BST)
Date: Mon, 21 Sep 2026 17:25:46 +0200
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Amit Kucheria <amit.kucheria@linaro.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
	linux-mediatek@lists.infradead.org,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik@protonmail.com>
Subject: Re: [PATCH 02/28] ASoC: cs42l42: Fix typo
Message-ID: <arFMetXGoogEAwmJ@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-2-741cc20a74e5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G0JcrUZHHYSZL8sl"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-2-741cc20a74e5@gmail.com>
X-Cookie: Too clever is dumb.
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


--G0JcrUZHHYSZL8sl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 02:53:41PM +1000, James Calligeros wrote:
> From: Martin Povi=C5=A1er <povik@protonmail.com>
>=20
> Fixes: 2c394ca79604 ("ASoC: Add support for CS42L42 codec")

This one is a very clear example of something that should have been
split out, it's unrelated to the rest of the series.

--G0JcrUZHHYSZL8sl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxTGAACgkQJNaLcl1U
h9Caewf+N5iufxYFZ1liCvBd7fhltp9ck3djJSBs5D9F/V24SiXkujxzDT8AQdtt
gcgzgX64NeQHbmgXRupfcESD2zeVGOOzSmbL9Kp3ohp8j5YqYey3hJEerIOlWxw0
ZXWOY0jdi4I3A3PE0Y5H4R6jO044TTmVVNeOFHTHXIN+zxhAVNvnjfuZImzoI8R9
dpGasJ1qTw75x1hZbryAhBcS7ho28ZT9t6kPhehrfRP3iXUinwItU8yiFBghmVvM
FrcKdFdM1AvZjLiIE/rqudAdqlpszUVWDjluAnWdJb0w4onBKbbMgjmsE2KAygHC
75lcoKFZI0G6SoaytCypAVZ/dAJeMA==
=I6dw
-----END PGP SIGNATURE-----

--G0JcrUZHHYSZL8sl--

