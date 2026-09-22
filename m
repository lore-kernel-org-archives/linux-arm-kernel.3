Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF98C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 09:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSGIPShcgFy3rov5FPMVkhjLmCaiM9komiyZM5pu8Gw=; b=1HLB3Pd3H2HfqmpQejb4v1z4fn
	XtpZzMn5bw45PK+TofRBtVReihK+EQKOtWa/Aakdr7njtQkET1DJi0WOaweqYDoJmyUk5KSIgBQWs
	1xiF5DIkbwm6zIYjaTOQbCjJlUfEEgqDVZGMVtRaW/4B+tSi3l1WUjrasLB+8+xXOfhAM8RYHK7+j
	TRcTOz7PkarVhUAnjSb84lErAGrewI/SOhlv7ycWRLVugrHztU3LJ2Ojq/SCDuPW96K4BqRKyBce/
	9EL85aoODmz1BOtQc/JeL86/3vMbdBhKO45CMgoehvjviCnmfn3gHlbbkxCYvb0TO8FwN6BmnEtm3
	ncgL2W3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8x9A-00000004yEV-2Agm;
	Tue, 22 Sep 2026 09:50:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8x99-00000004yEB-1kd0;
	Tue, 22 Sep 2026 09:50:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9746C60DEE;
	Tue, 22 Sep 2026 09:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED171F000FF;
	Tue, 22 Sep 2026 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790070642;
	bh=sSGIPShcgFy3rov5FPMVkhjLmCaiM9komiyZM5pu8Gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MZTxaVWOeA4+lBd0O7j3wh13UHgZzUVdlLoDzWZdL5uwv6VQ2zb2xL5frLJHwBHYa
	 b9otouh3/xIKb8wmOMqy9D7ls0GqVZRM4qTTijT1LUvQVelib/kcDF6pqjtlXR/O0u
	 M0Ieyyyi9K8RIyOV2AHbnDm7pWIS2074LDjp7I/b0ExEzStz2toVkYYFoC5EGsUi5O
	 2q72xu5s2zQzOohx+bAegYEBzYpT+49nRejVB1G2sD8Kf+2MjfOW7hKFRdNW1sfz/W
	 cCcFoNNZhuLTlW1DPFQNBRZxvmNrNfpGd3q2moyh7f2s35dAZxrA5AfFoE51rY0b9c
	 gBA/Szb1uHNKw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A887D1AC56BF; Tue, 22 Sep 2026 10:50:38 +0100 (BST)
Date: Tue, 22 Sep 2026 11:50:38 +0200
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
Subject: Re: [PATCH 12/28] ASoC: ops: Introduce 'soc_set_enum_kctl'
Message-ID: <arJPbqGxMrc5mGvI@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-12-741cc20a74e5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Rmff83hTxLA41JR"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-12-741cc20a74e5@gmail.com>
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


--/Rmff83hTxLA41JR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 02:53:51PM +1000, James Calligeros wrote:
> From: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>=20
> The new function is to be used to set enumerated controls to desired
> values -- either a single control or many controls in bulk by pattern.
> It is something a machine driver may call in fixup_controls.

> +static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *strv=
al)
> +{
> +	struct snd_ctl_elem_value value;
> +	struct snd_ctl_elem_info info;

Probably best to fully initialise the value, in particular while I don't
think anything currently does it we can have multiple enums in one
control like with stereo volume controls.

> +	for (i =3D 0; i < info.count; i++)
> +		value.value.enumerated.item[i] =3D sel;
> +
> +	return kctl->put(kctl, &value);

Should check that put exists.

> +/**
> + * snd_soc_set_enum_kctl - Set enumerated controls matching a pattern
> + *
> + * @card: where to look for the controls
> + * @name: name pattern
> + * @value: string value to set the controls to
> + *
> + * Return number of matching and set controls on success, else error.
> + * No controls need to match.
> + */
> +int snd_soc_set_enum_kctl(struct snd_soc_card *card,
> +	const char *name, const char *value)

We have both value and strval in different places.

--/Rmff83hTxLA41JR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyT20ACgkQJNaLcl1U
h9AhGQf+JVR+bwYYZADyxQTTS9vyQAjf+9I5HvHJnkKvFLUB1NZHijso2jQyMRZd
Hy69TXkZH0NSH/oZnMUwSDVCZbhI5Wo8W/KClkb/jSQKbnO/3fQZqryxL5cr0OYf
2Z76hVHIqmDZbmJgGX5SHF41yfCSO1ZW8YBvZuqwKzWa44XhOQVhl4FjkN+FMO4m
yWqcsJS+Qmea0DVnEstz+oXCcUEUSbDnZ6bDJLTYuCjejHGarHVbhse2vCN2RrTF
RX1UuF5Zbn9PJse8AmjxdKK+pGLw/uw2oEq4TMGGl5U1DJhmwurppOZ2HsxAcTQx
4yikF8686OVfT+i5/PeT87Ii4biDSw==
=Aec8
-----END PGP SIGNATURE-----

--/Rmff83hTxLA41JR--

