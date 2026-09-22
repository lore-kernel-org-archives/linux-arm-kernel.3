Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE80C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 09:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nARjhrFD1a4uFrGP/wTAfcQAeQqUTGrmqUP9jR7qHek=; b=qR3H6e/50nWNf43kjwPRgwNhdM
	uokc/WcLVqsQKBaDXJz0yPKQrIj/Yy3QTAy5Em4hq4XyUFuSEn+ebR539HYXLc0/sNf9VgoBvSvWN
	UU9j6L6KVKyOxQVnXTW0c2uUAhfJB2SNMZ1Pc/CIKte4J5hRCifN4sjJlkkmEkDITAoq3f0Fe6FAL
	WoPz2OYvVBn9VeyfPYTQgAyGPMlbIgZP+U7yTiuLTo8mI6j0f5odqWwL03h8GzJk/kTzh7Talj1Kg
	0uWOZ/d3V1P94bTWubZFVY3X0vA3GGvCXpT8uvCyR5VL0vi2cH730MMwrJbIK6b1jOiWWPkfv2slC
	wmX/5Cfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xBS-00000004ylF-2PaK;
	Tue, 22 Sep 2026 09:53:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xBR-00000004yko-1KLK;
	Tue, 22 Sep 2026 09:53:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BD1C360DEE;
	Tue, 22 Sep 2026 09:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338E11F000FF;
	Tue, 22 Sep 2026 09:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790070784;
	bh=nARjhrFD1a4uFrGP/wTAfcQAeQqUTGrmqUP9jR7qHek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nEitEp8XesXa66ohsqaPXQhbL3xF2VPi5jxpeHfvNKIelbcU57N2LlISpDXR4evDD
	 vWNbSH91JwOgPgmdtya5yFo+mSJVrjLJj3A465KYYbP/dN41QMpwIvWzr/Z4EaQVLB
	 FI8W5AaB7aug9wFKd8IDgPQ92g22Dd8mLQPvHEQO83K4yoViaHkQjKh5wBmUZZcTlw
	 OsKFoOoHj9WgXWXEk/y+PFkIsojPUo8YD3iG/fp4lJ7AwCXb5e9Y6Cs/GfQ4KhWley
	 dl84p0fnYpc9aSNLr5eovi55Wa8ABpuLhiZK7BdLN8Ig9pzkyA13/USzmDMzuA4Djp
	 6PITUPc2KwKiA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E17FB1AC56BF; Tue, 22 Sep 2026 10:53:00 +0100 (BST)
Date: Tue, 22 Sep 2026 11:53:00 +0200
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
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 11/28] ASoC: ops: Introduce 'snd_soc_deactivate_kctl'
Message-ID: <arJP_AjGtyaIOg6m@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-11-741cc20a74e5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mNc7H9Mf9fLW1Byg"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-11-741cc20a74e5@gmail.com>
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


--mNc7H9Mf9fLW1Byg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 02:53:50PM +1000, James Calligeros wrote:
> From: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>=20
> The new function can be used to deactivate controls -- either a single
> one or in bulk by pattern. It is something a machine driver may call in
> fixup_controls.

> + * Return number of matching controls on success, else error.
> + * No controls need to match.
> + */
> +int snd_soc_deactivate_kctl(struct snd_soc_card *card,
> +	const char *name, int active)

> +	if (!hits)
> +		return -EINVAL;

The comment says no controls need to match, but we return an error in
that case.

--mNc7H9Mf9fLW1Byg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyT/wACgkQJNaLcl1U
h9Bvewf+Iop+x5OZDye45hxw6ccSgPW7Odu2Npcda77dIryeRPAjpXLVz6dcrc8K
4TJrQC+WG0m5H635RmrywLTgJyupe4kIfVxZ/86xfmqvkRBrDFRpSeb/scudUuRp
zoa9hMGNFAw3qTIa+ppM7BLfb9zrs/ykSC3r+c+fwXEFrh/fnRBbbLtmRbN5rnkD
OLbvOykV5l8HTXUrB1duSzCZS9dWNoHd9Dyg8b3fFhE1cIXNYbcUUaJ8Yv4Jplx9
Jfz8kxonRvN8YUbcAL60O7PNAGtFdzOCr02Qv9/d5jrDQi9Ae4UXm63i4/umUXRg
3gUTHLNhDGEH2e8PtdKXh5uH43Ww/Q==
=khxA
-----END PGP SIGNATURE-----

--mNc7H9Mf9fLW1Byg--

