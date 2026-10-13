Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA2BCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 17:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlBOcrHV7Ks8zjh/VxrmRvdVhbz0DfHdxmu+gmL+0kw=; b=WgCKOQtBjI2tO5IIwCY8xE8tjv
	wwM94ofsIbvO+mF1S/YiXaZPHpnF+IZfLIq/9FxK6e2Qvk1Rxg4CftqP1aQfwG8RtSzvmGozdHse+
	dK1UIY7rEdivy7Nkc3nPAY19Mi1UE377FaaSMIc/AkHfo/n5P4b3l0O+WV4tE+gzJk1kPM/ohkApc
	RAwu1JS7fKtphzPgv4jB9k+MgbzJsccBvSl4DbAFIB6p+zCMk8wDZJ2Igjhyirh7+J8qMwLkrWT8x
	SLYylWe4QAhvsCdRPVZiqfD+WdoGM7Y88O9zz/Ecxps1qovNa44wBQyhjn6dQCPMrMXokr7A/Zp/5
	nMkiepsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgeY-0000000Dl8N-2AXC;
	Tue, 13 Oct 2026 17:51:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgeW-0000000Dl7m-4ACZ;
	Tue, 13 Oct 2026 17:51:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4912660A56;
	Tue, 13 Oct 2026 17:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B91D1F00893;
	Tue, 13 Oct 2026 17:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791913864;
	bh=TlBOcrHV7Ks8zjh/VxrmRvdVhbz0DfHdxmu+gmL+0kw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a64bBD0r0JJvyP+4075Pb++iBLDZ0ukmGa7jx7kSafkLoOS1mJGwANamvreSD7ZDl
	 OQkPYrx28wtrdCcJifhd6QpjxJictI5PMD9i3BQ/wKqbGkAxrsBVCzc+fygCVlyaEU
	 lK3n6Ag0uVeQvPWpmqi4U7cvCBOkLoxm0+xNhzAO0ob9zUmUIlTR8qiAVVtiIKa4D6
	 Mvatl3v7wqWkFVibXWwZhTEKVBHCLc69uAlquyQJvXrfsmG9VJr65FjZ9lPk/+hoa0
	 1N09ozYCqAJTGjkQKIpXxtoYe3yozRXP0ZMi+nVturmde2UGe4aqXLAMWH4K9fkFIx
	 eBPxAHPG3IxCQ==
Date: Tue, 13 Oct 2026 18:50:56 +0100
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 06/21] ASoC: ops: Introduce 'snd_soc_deactivate_kctl'
Message-ID: <ae2b9848-c8d6-425c-893e-ab2656158908@sirena.org.uk>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-6-7b47ed6335a8@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vbtYYCCIpz/5OgCu"
Content-Disposition: inline
In-Reply-To: <20261004-macaudio-v2-6-7b47ed6335a8@gmail.com>
X-Cookie: Some equipment shown is optional.
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


--vbtYYCCIpz/5OgCu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 04, 2026 at 04:03:33PM +1000, James Calligeros wrote:

> + * Return 0 for success, else error.
> + */
> +int snd_soc_deactivate_kctl(struct snd_soc_card *card,
> +	const char *name, int active)
> +{

> +	if (kctl) {
> +		ret = snd_ctl_activate_id(card->snd_card, &kctl->id, active);
> +		if (ret < 0)
> +			return ret;

snd_ctl_activate_id() returns 1 on change, 0 on no change, which doesn't
match the documentation there.

--vbtYYCCIpz/5OgCu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOb4AACgkQJNaLcl1U
h9AYLwf/aQMd1A49AVVWSLal+oUhDhb+u+eE2UCj4TlvTucP2SjZBbIiudT1v3DH
Oa7vH82cpqNojB3T3P9lrxMV74PuaL/qQmErb9aCE0oS2dd+98jYmbIBcWY6GAcH
mpa7g4ufbQe4oHBnKKLffYcxQjn1Hs+u026oRVbOpox4gVi65973qHFCliEWFTSo
k79JtJ4LzX578YmyKLl/szQ+UCa+xpuV8+4yyhMQx2SOyzPFEbSBkTyULnePqmtM
rw/j993aXN6aYygCL7YvXp2Lr9FSNT2DMItFvXVXqGFgR5ZEd6wa4stS/WMLbAYh
8Io75MNDaQCnqUV6b5/CjzjD5d9OLw==
=Eq2Y
-----END PGP SIGNATURE-----

--vbtYYCCIpz/5OgCu--

