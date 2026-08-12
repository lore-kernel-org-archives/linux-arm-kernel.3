Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7F3C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 18:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uz27fRQbmLZ3xcxLxL3E+lR1tIUbt6V3Gu1RoS5Srs4=; b=zQmvAJM9xWdi6hMfvx0liwYxiT
	Kd4rL0BPi128sQ9dPY/f63rIzyK4Xh2/xiH9zehRtUENNnLsGCtWJZj/M8ueWOo0/8kDzIPnx6mTO
	Np7Y33gaCmpn2EZQXLxfuToNthhBi6xBHgkT+2GUboken/iv47fpal2H9D0aYDVtgV2jlXMHOObMc
	k8lVMR5yke0MX+bpmjNglkf9O8TCB5Wc1qayrodQzMw+/jwYElyD5hPAV/UVG1YYD6EoJYGxeUF8Z
	qNBFimM6FczbMqOng1GOFHuikBGHhMCQipEJA1eo7qb+rORme7ZXQbyZNe/IaOecOglMggPT/EgoT
	9ajkwDPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDHd-0000000Gk1n-2UGk;
	Wed, 12 Aug 2026 18:02:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDHc-0000000Gk1b-0M7t;
	Wed, 12 Aug 2026 18:02:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6448840278;
	Wed, 12 Aug 2026 18:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666F81F000E9;
	Wed, 12 Aug 2026 18:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786557751;
	bh=uz27fRQbmLZ3xcxLxL3E+lR1tIUbt6V3Gu1RoS5Srs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ocomHOSxOmZSJCeI5nxJuoqhAhytsq3r9cJjlIsVsHbDvLUe+DB7jbdTJa7d88sjd
	 m4pvknxfMPyLosyg+6KdokWt/qmg+e4yVNmU9JE+S5ZpfW1YlU7CxmQaUE8zYU1bRW
	 WWRqVUHK3yBJndI+PzfNMb4p8mvK5RCzmBxLV1t4Fdnf+pYellKIpxLnh1ZqbAzbIJ
	 5Guz1PvzSLP1H1+0amt58f6bMdcctlNxbgECiShUKMNo4TURA717QpgGtiZxojSBuc
	 0P9IqUCKO9oqritMgalAXEJDzVFRdSQu9p2ec08lrcfBMhi0TJJT07ILInpp1ssJW5
	 N7H160o46ZxxQ==
Date: Wed, 12 Aug 2026 19:02:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/9] regulator: core: Add "enable and wait" functions
Message-ID: <93fe2e3e-7a2a-4aa3-ad27-9e99c602c495@sirena.org.uk>
References: <20260811122011.3539250-1-wenst@chromium.org>
 <20260811122011.3539250-2-wenst@chromium.org>
 <99ad23ba-f8f2-404b-960e-1c22a20c9ac4@sirena.org.uk>
 <CAGXv+5EeEQM6O8Vb8e8fGjRzMe1icmz=cPm3GoKLxvEO=weVcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3qPAsn7wmCMfZq5C"
Content-Disposition: inline
In-Reply-To: <CAGXv+5EeEQM6O8Vb8e8fGjRzMe1icmz=cPm3GoKLxvEO=weVcA@mail.gmail.com>
X-Cookie: !07/11 PDP a ni deppart m'I  !pleH
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


--3qPAsn7wmCMfZq5C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 12:39:42PM +0800, Chen-Yu Tsai wrote:
> On Tue, Aug 11, 2026 at 8:43=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:

> > Just take a timestamp during registration if the regulator is enabled,
> > we check if it's enabled anyway so we may as well take that as the last
> > time the enable happened.

> Yeah, I just haven't figured out where exactly in regulator_register() to
> put it. I think it should be after the supplies are resolved, so maybe
> I could do this in the "final setup" part in regulator_resolve_supply()?

Makes sense I think.  The other place would be while doing the
constraints but they're optional so might not happen.  Perhaps make the
one at the end of registration skip if there's a timestamp already?

--3qPAsn7wmCMfZq5C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8tTEACgkQJNaLcl1U
h9B2FAf8D1M22Grx18J9/WwNFIOC9lobobrOEs3T/vwO7/gO1L2DkkIIJ+O6giFE
pVSJK0jvB/6bFVrLlTTFUvMLxE+WxD/G/kpriivyU1quihyIkp1hVbsCmVQlKcTx
4gWcO383CQneVfUhZTcFpXFBT8l6pzLP4nT/6El14xC0nf6L2nX1me4vgBSlNhsX
1vVrWMkUDh7nORWr3MBRcbVICD/95yzWD6uUq64zT2yX8QBFACOGWzt4w5dooGFO
grAcJyH7t0K0WlFBSogUFX05QKN0eLiAuMEfCuVkpXf5phImv/MiaPaIlEZUxMC+
lPVvKyLFNzRuafb6rYrFUuevW9Ibaw==
=gO+2
-----END PGP SIGNATURE-----

--3qPAsn7wmCMfZq5C--

