Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8450BC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4UVAeTU1JJaiw4t/Qj/n7SDGMX+yxvPEzMCHsSdNF0=; b=U6xGdf20hJWn9JLRV1mqAvJpv8
	10KKu7HrnZUSo39vo4jcz2XkJuxMAvrt96McgyIsFoxUGhoSpmOahEXT1afRwhFLxvlsOatZe/RuB
	FpOxJN2Ydf5lTVmDNm+i0To8RaqJtezPQ2O6pljQtWySLM4uCj1h85bIbMu9YYiJn5HVY8nsOedHc
	4r0cXV+YPWjrXbp7AzSAufSyt3xhkFGMC/0W9+c6fF6OYPx+Jo6KtkhXaCpWAqR2xxFFRcPJO23uy
	FojmPdo4Xp2zm7zlPXxdKKvdwuq7v2BQZx3aUCW4gumbtoc7Ebt89SldwBbWbp8S9pE66x7RGukuY
	5pmbthnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fXE-00000002WlR-0xZ5;
	Mon, 21 Sep 2026 15:02:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fXC-00000002WkS-2bC1;
	Mon, 21 Sep 2026 15:02:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AAB760A6F;
	Mon, 21 Sep 2026 15:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5E91F00893;
	Mon, 21 Sep 2026 15:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790002940;
	bh=v4UVAeTU1JJaiw4t/Qj/n7SDGMX+yxvPEzMCHsSdNF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CVSpmy71UmB2ms8Rjz8minaI4YrhlvUAq/hKG21gKu5n5xyDm5fsQW8CZ2JM3NuMJ
	 JhfkZ/BG2dYqYExJdfI56O4f6W/zamyRSG2c0P6fQQaUUz9omjbvee6GFxe9M6Z79N
	 g/IVuovmT/fyf9DsTWq7xtHxuCAHg9JbnckZYYOKoNVswX0rNP3d7xsiKNR0FExLqs
	 LD0v5GA0KX+gJyCUw8hogylsV/F8FMEhJE4N3ZweV/dc0HVrspkxn1m9EJBW4jC2S0
	 17XVnA8L8KAJ9KzOp+kYbVYmYklvat1VXWsEJT38xNGNDnjkckDAmfkinUZSfnWgmy
	 FnXzF3NE0sv9g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 198661AC56A7; Mon, 21 Sep 2026 16:02:16 +0100 (BST)
Date: Mon, 21 Sep 2026 17:02:16 +0200
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
Subject: Re: [PATCH 01/28] dt-bindings: sound: Add Apple Macs sound
 peripherals
Message-ID: <arFG-KXA9aGlXQ27@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-1-741cc20a74e5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mBqIcINAN3k6lMdu"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-1-741cc20a74e5@gmail.com>
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


--mBqIcINAN3k6lMdu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 02:53:40PM +1000, James Calligeros wrote:
> From: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>=20
> Add binding for Apple Silicon Macs machine-level integration of sound
> peripherals.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--mBqIcINAN3k6lMdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxRvcACgkQJNaLcl1U
h9Bnswf5Aa0Iwjwij4bsZ+RZaKJ4PAN5qntk+PDpED8uFPRsFPjxayfQQpln/+YE
sDuji25SQZ7OypbShQhRshvEwun3ovaP2m+Ha4hMrWdOFbsyUBT4/IYUaK7iGUF8
QU58uLXPlqNSj8Ea7cgKSEcnMMhcIYcvgDKxpbWcugCdpoJEWwLEpSGeRjQNHlzA
0PMiHY2MlW7mTys8yaPlq0b4N41vHWxzZN+zOD0pRWLf4K33boQziryFUy3K9wfH
mPY+XVYWGwsPVEq9P/9zFHg9GbLNDIx4LoMBDC1zOgK05uuGRrM5QVgtWp5jqWR8
G5J4yfk6TU1ORHvckcmhQbBuP1KTsw==
=Gras
-----END PGP SIGNATURE-----

--mBqIcINAN3k6lMdu--

