Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58BCC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1vpA9Vu/anVUkgqQq6JZrIZF54n9p7jw4+5ezh/lQY=; b=yClhypdxwKv4MosLlqFb+uvlbO
	+nJjN9sk1mB4fKRwj4tQiyp/zX7sZHGAUfuSUZt9+7UVbipveUWSvKlaggbGVlKgVuoC/NWrba1CZ
	2cMdA8WBIgfdFTKofQHUEVhpuc4VsQS+zntv/U7C03+H65fFAlzg+3Y0k9R5A4zvxh1lf8xQnBzKn
	s7i2dOUEoFkU5OJoxHfLYSUXkOcfQT4K6UzKsbSbT4yAVTJ38WhabSwE211avqcaaumBchTZ2sUiT
	dVRjtEVD9fqNplbbg1q39GNKBhTjLuTBgJnRJbFlOdbtvGCHp+0F3vSblQ/I3X84YDl3RHwZReheg
	O8vrPGFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fih-00000002Zc8-3VeB;
	Mon, 21 Sep 2026 15:14:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fig-00000002Zbj-2b3q;
	Mon, 21 Sep 2026 15:14:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D23F260142;
	Mon, 21 Sep 2026 15:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9121F000FF;
	Mon, 21 Sep 2026 15:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790003653;
	bh=A1vpA9Vu/anVUkgqQq6JZrIZF54n9p7jw4+5ezh/lQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RCxq22/+ukarhuU4fLef1DBuO4WHwye2i/enhDbY/fN5vk+yc2q8glQdtTR4ar+R4
	 kpaMNBUNGuZ2D9F7anJo8Tc7jUFessC92tZxVWklyiekG+W3GLDrLW80AZc4gMsvO8
	 F1m0hqtosUiriuVusd21Dt9o31B5JZSVyrosgeImxruP1y7EXTOX3z3gam7EzpER3H
	 z0Wcet/tUJg/ft7kI5gfVs//vOKXF69BeEsw6tJu8u7I5VNU37z9OJeWUJlLvNafDM
	 ot7CzGLz37k3RgxiKDycEa/R/E80OkP5L0jlyZpjZRxgTAKetXHsS+LVitSS+VLOrv
	 G3p3Ha4HzcvCQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 010351AC56A7; Mon, 21 Sep 2026 16:14:09 +0100 (BST)
Date: Mon, 21 Sep 2026 17:14:09 +0200
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
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik@protonmail.com>,
	Hector Martin <marcan@marcan.st>,
	Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH 00/28] Add speaker and headset jack support for Apple
 Silicon Macs
Message-ID: <arFJwcfSWqyawDYp@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jhwW/VhgT1w2TOjQ"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
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


--jhwW/VhgT1w2TOjQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 02:53:39PM +1000, James Calligeros wrote:
> Hi folks,
>=20
> This series finalises support for the main
> audio subsystem on Apple Silicon Macs. It adds a machine driver
> called macaudio, which is based on an RFC sent many years ago
> by Martin Povi=C5=A1er[1]. The driver uses the DPCM model to dynamically
> glue a backend DAI (combination of MCA ports and codecs) to a
> frontend PCM. While this theoretically allows us to route any
> backend to any frontend, this is not used in practice; the "Primary"
> frontend is always used for the headset codec and the "Secondary"
> is always used for the speakers.

This has got a lot of different stuff in it, there's several different
sets of fixes, a number of framework features, as well as the new driver
and a huge pile of DT updates.  It would be a lot more digestable were
these things to be split out, especially the fixes.

--jhwW/VhgT1w2TOjQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxSb4ACgkQJNaLcl1U
h9ApuAf/ZwCUmddLEXrzSNnteIkRCaFhvQG/Ig3/Uo79xixZgarNV9EQrRh0cr/+
wF4WqgVixB1t/yQr/ZvXeb2E1cuVxIY5MnqrXVqnFDxy0gZmr3kd1mKGvub6VstW
E1auraBBQFDoz4/mBlBstM8YiWqmdgerxvqEGsHkjWMagDD/d8YG618XoY668mGW
jn/w9JtTv9eyrrO3SX4N+MlVvLii06XTCi9Oegvjdo/uvF5tcICk9fZRY7bqXLGF
KE1vXeSEdwr2ivDAjwMvYd1fjdBx1Ew+UL2mvTO3F1lAeA7o3zVieczdoP97C98C
XEk5G4Q7u56Q1J2d8Vo0C0yXTyTVCg==
=6yVp
-----END PGP SIGNATURE-----

--jhwW/VhgT1w2TOjQ--

