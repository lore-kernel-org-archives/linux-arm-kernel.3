Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A3EEDEBE3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 18:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99+E/o+rehKByZNMGkoqrHtCPCgKf1D5I5aYLob73kE=; b=PCFIw8dbuoFIctceKNz2Qe0Rn1
	RmEtrIa3ZTWcdj62tydTwc5He45FFtotcDAI+uWN7Zo65qsnjkLmvatm8MC7muW7EYn/aXPkUSoJk
	x8sLGMrYC1v38RXfoSgl/3iLGDU2wNa+HkVJOPQLjWz6ocdsKWkrRElN7OgNBNMkct5x8eLYYgTK2
	VtZMRBfqaivmpLmHJ1LzfAYQHJ8ExMhvBG2NXSKQC9vwloss7wGr3UDdBMJdpYCYBNnq5WuZM4N3A
	/DyW84diLf0fcD1aj/vBnwNgjH089Jij+vN5WwKNPGHE1/bBcBzS8sRzj/Daor7dwoj96Z+nAB03X
	L53n520A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxUJY-0000000FhOE-4A2D;
	Tue, 03 Mar 2026 18:17:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxUJV-0000000FhNX-1xrc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 18:17:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA67242E2C;
	Tue,  3 Mar 2026 18:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F0EC116C6;
	Tue,  3 Mar 2026 18:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772561864;
	bh=RRSAF7Cbn+Y7/qFbIiFd50NDJ3b2Hsk6Fs1KYlOpjjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AFmnpksVfSIPe8qCt/hkyH5cbrYtt39OP5Dd9AY32ahzBq/SfLssswMsrvhiZRR/0
	 THUs+C/sfmMEfBQ3aTu06jlY3qRA3M2qpVNVOIco91EKL0ooeTPTsmD2PhdGZdNSAC
	 /HUblPl8vVEFgHnRUcjE8ArtRxPgBw6cNho4didjxHeBzd5lijRUQHXIs3KtRFRLY5
	 pK91xQHZ62j+GzG/i0sVJ/cBF9K/guf93KYaZj1/R2GpLN0zvUF65JurCgymnNYEfX
	 bUnyPAtYBhR2G/ik3yzTQFf0ZrdfA+LBkoXtVvzyTTfzjaveRUubMSKbi6DIEYSiNP
	 ZWZvArNOwxdlQ==
Date: Tue, 3 Mar 2026 18:17:37 +0000
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Frank Li <Frank.Li@nxp.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH v3 5/7] ASoC: soc-dai: add common operation to set TDM
 idle mode
Message-ID: <0478f3d0-4b96-41f6-a69a-818255463203@sirena.org.uk>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
 <20260301-tdm-idle-slots-v3-5-c6ac5351489a@gmail.com>
 <877brtacgp.wl-kuninori.morimoto.gx@renesas.com>
 <4716405.LvFx2qVVIh@setsuna>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R4THYWriuVzE2xcg"
Content-Disposition: inline
In-Reply-To: <4716405.LvFx2qVVIh@setsuna>
X-Cookie: Use the Force, Luke.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_101745_527823_46251D3F 
X-CRM114-Status: GOOD (  16.13  )
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


--R4THYWriuVzE2xcg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 07:10:49PM +1000, James Calligeros wrote:
> On Tuesday, 3 March 2026 12:11:50=E2=80=AFpm Australian Eastern Standard =
Time Kuninori=20
> Morimoto wrote:

> > > +int snd_soc_dai_set_tdm_idle(struct snd_soc_dai *dai,
> > > +			     unsigned int tx_mask, unsigned int rx_mask,
> > > +			     int tx_mode, int rx_mode);

> > Do we need "rx_mode" ?
> > Only "tx_mode" is enough if my understanding was correct.

> For our (Asahi) purposes yes, we only require TX. However, TAS2770 also
> has a bus keeper on SDIN, and I suspect other hardware may too. Rather th=
an
> break the API later on should the need to configure this arise,
> I decided to add the capability now. I am happy to get rid of it if
> we think it is superfluous at this time though.

I do think it's reasonable to keep things symmetric, it's probably
better to have an API that's consistent even if some of the code doesn't
currently get used.

--R4THYWriuVzE2xcg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmnJcAACgkQJNaLcl1U
h9DTSAf8D0G8Yi1rPXU5owawPsaqcagcoZ+c0UhX0QTxFfnDUvvp1d5jHbmNGo9m
ZWx0C0/ZFmCimlRnGHpyt4YEhenuHsyN8/oqKUsy1Txgo3ix21CkQY5bPPetoZp3
QX+0g0TRFVIkz9SSddjj26w5rZ9QYwQhZDNv//HsXSHpCTOjCM5gjDyNYIbOz76M
N7gxBwo+HvyeR6kBXpNJAISqQNBJOK/9n4Cg3RxQfwz9UIooBBfzzGIirpbPJl2G
uJxs/9pk1MDUivxcR6CEVjexjRn3GhZFrQ4UQLoW3fuiRvbgJ7yEJlEHh1URHr1B
n9BDBFv0uM3a9yipyoTLWwzG6NOX0Q==
=12yo
-----END PGP SIGNATURE-----

--R4THYWriuVzE2xcg--

