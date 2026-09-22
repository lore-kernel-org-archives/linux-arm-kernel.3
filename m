Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B2FC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 09:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7DhFwXtpjqqTNg2JPXQRDOE2UKkVRNsCGtZR4eTpAc=; b=VDyDbOXaw0QW870dYPURnvXkpt
	uiarfGREfTw/nOIIgfOD/fbnBWKhLjPUF3Gc9LcERcsKFyP1EnBMSZHC0/MSFW9fV4OKhNmtgWKqJ
	N343dZGBNhX5tuvAOZM4HuTJFTLXJWV6S+sPxolETiNaam8unpk7ydCuv4IP7CDXnVNhBYar3e3o5
	xE/kXTjYodynK88peMsQpfBzvR1Oy3csn/qHaQiBEbrIFi7Ivq87GhhQbtPbt4NOxYGgtN7Ok2k4C
	xI/3rijVl8XofpKnW50RoXbJVKBYSbPvCbvfGMYTmAxMgiXl55ySZTImnY9o2dytblVrHjN46t9yv
	X9QQr/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8x2R-00000004xEP-2Qcp;
	Tue, 22 Sep 2026 09:43:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8x2Q-00000004xEA-0BIH;
	Tue, 22 Sep 2026 09:43:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C5C5441ACF;
	Tue, 22 Sep 2026 09:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 766D11F00898;
	Tue, 22 Sep 2026 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790070225;
	bh=T7DhFwXtpjqqTNg2JPXQRDOE2UKkVRNsCGtZR4eTpAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oYcMEpTH6Q5aMk4NFddrYVjZMb30tGXyn0xwoTPBRuOpTlzOUh9WGAlfr1pk5sCmi
	 7W/bEe/SfwwN2ezubsSet/YmL8QVpeOXxjgVhg1qH9asWlfcYuxtYm4qLDdItvTBn1
	 Z0OcwWX8bjqvXqzGvQn/u4kA2VQIytRiKsX+/eroj94P1tHZgYSghhIESFXB2OgXB9
	 7HH4/rUwL1j3cywBY519ogBmPI/69lmmKtSpsj48kUVicso37cL/5WJbxtd7TcsS4L
	 gwQnZG3CAHfZpvJ+gqk2T52MeifiOo2an2THeSRI7pVeFosFrsmKg2qs7n8wGMv9qj
	 TwNrJ0JlhwQ+A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C24391AC56BF; Tue, 22 Sep 2026 10:43:41 +0100 (BST)
Date: Tue, 22 Sep 2026 11:43:41 +0200
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
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 14/28] ASoC: ops: Export snd_soc_control_matches()
Message-ID: <arJNzSKdKWMsatoE@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-14-741cc20a74e5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="12Ep3rrf+qEA2PeF"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-14-741cc20a74e5@gmail.com>
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


--12Ep3rrf+qEA2PeF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 02:53:53PM +1000, James Calligeros wrote:
> From: Hector Martin <marcan@marcan.st>
>=20
> This helper is useful for drivers that want to do their own control
> lookups and matching as part of more complex logic than the existing
> operations.

>  EXPORT_SYMBOL_GPL(snd_soc_put_volsw_sx);
> =20
> -static bool soc_control_matches(struct snd_kcontrol *kctl,
> +bool snd_soc_control_matches(struct snd_kcontrol *kctl,
>  	const char *pattern)
>  {
>  	const char *name =3D kctl->id.name;
> @@ -425,6 +425,7 @@ static bool soc_control_matches(struct snd_kcontrol *=
kctl,
> =20
>  	return !strcmp(name, pattern);
>  }
> +EXPORT_SYMBOL_GPL(snd_soc_control_matches);

Please document the API now you're exporting it.

--12Ep3rrf+qEA2PeF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyTcwACgkQJNaLcl1U
h9DA4Af+K7mR3OxqTfAC67to7qEqJQQ0Ug/vN9SgZhFMBNEFP8R/bozZv5ev35ko
azZVRzd+3ZOgE+bYY+lRrLiXZBYfbvRMF7rhsE4r9gGJ4mtsjbov0B0UaQ6mlGjr
pfN8bT6WcAWq9AmZHAwpZegV6zs4446SoNgug2hxmQR79DSk/VpFnBVo6pZOw2uR
tooItCshsxcHrMtkM3lwGhfVaTJRBcu4geSbs5XDGlVvNCrdc/tnTs4k/Ye3X7bo
CiTNo7YPzCkrvn0ry/Z619SEYXOjS6ApnaKzi5WgsCB+5aWYwwSXgGrF72XDhJmV
pNbfaQ3PmLgv750rg49idZahfnqEqw==
=TlRR
-----END PGP SIGNATURE-----

--12Ep3rrf+qEA2PeF--

