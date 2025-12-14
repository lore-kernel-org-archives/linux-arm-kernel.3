Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E686ED3E787
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 10:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4ofKMSBk8Wgqhh1BdCxHfMYilkWDKmIFT+x47M+gjI=; b=HpESXA5hTC2sClQU1HUyc7B8pf
	YXV3p5FHwj6INd8Xdv+sWcwxggKBsf09Prsdw+gwKSPygs4yUTHv2nRBTnX++SgbA4eEPd4rnMd44
	/OC/E9frWtKcK6gITCEl9bRXIekbf60mOMJOXX3sNxS355yJHd+j+tTniAUwl9QB7zx0CYgKpGVSH
	NV6PcQzMPZExLkfvWV2FsPyuwX16HR5X90fn9OaGPGtbM8wODJ6FAoxtqbPRXe9KOfB8ml1rd9RCX
	pZXCoIGc/JnizpLbpgRG6DXEtHi2U+yNuPvvPE8Ygl7Pr+RoocvoyOQg8Iz0o0dozLEDrQFhfAgiy
	QDLToH4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUjQt-00000002LWl-1meJ;
	Sun, 14 Dec 2025 10:34:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUjQr-00000002LWa-3yka;
	Sun, 14 Dec 2025 10:34:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E1E8B600AE;
	Sun, 14 Dec 2025 10:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B2DC4CEF5;
	Sun, 14 Dec 2025 10:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765708468;
	bh=i4ofKMSBk8Wgqhh1BdCxHfMYilkWDKmIFT+x47M+gjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mqTS3k6YR/sogV8ka6V0v2B7Fx3hMH6A8fkO+cb+ve8o9IVQF2Mv1UtLV7Ca2EhmC
	 HJZvqgwqFMgK6xPuHsasPpgLbo6162/BJez1eFJisSdXjX8IfvE8dhEOGyeyYiWzfB
	 v9DUvg3SLxQXbqg6MqdEZDur4T8gzKXPg23XHmnPAE9P7TQvOGMsnEQuzGXK78Zcwg
	 nUR1rHufD/NEBQJKppwc8RDF7pPnk5Dbu/QQFwbeEbnNg+EfYuiVMItkkHVKYrN5Mq
	 Z9XL1d8GA0WhfaBnZdAQFc1oAWOqdB79pDjjmEpUUzvm+db+qbcCjRnpONxbLkZpbh
	 1rFpkHKUuFMAQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E38171AC5685; Sun, 14 Dec 2025 19:34:24 +0900 (JST)
Date: Sun, 14 Dec 2025 19:34:24 +0900
From: Mark Brown <broonie@kernel.org>
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 07/10] ASoC: mediatek: mt8196: add platform driver
Message-ID: <aT6SsKEGK553Xg5i@sirena.co.uk>
References: <20250822125301.12333-1-darren.ye@mediatek.com>
 <20250822125301.12333-8-darren.ye@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FooSzIoE8/IvdhAD"
Content-Disposition: inline
In-Reply-To: <20250822125301.12333-8-darren.ye@mediatek.com>
X-Cookie: VMS is like a nightmare about RXS-11M.
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


--FooSzIoE8/IvdhAD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 08:52:36PM +0800, Darren.Ye wrote:
> From: Darren Ye <darren.ye@mediatek.com>
>=20
> Add mt8196 platform driver.

This doesn't apply against current code, please check and resend.

--FooSzIoE8/IvdhAD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmk+krAACgkQJNaLcl1U
h9CA1wf+K9nyWibGgTGxTOYC3pIeLvcG/zmQiJ95Dop5yRay8Sty6uHAiqafCSdT
tYhHyCNHAHXsyanb2fmXZHM2pTyUbcTuYuQAnl8ysbI4LsG+8/KL9c9T36ZmOSlc
ZQeLXHScoEoE9B+AfBwUa44h0djTkl/iwqiyAOeub+JRxFA9o+RSmdQ+WB86DEqS
Ve9yvm0dTxiGDvEY1dm7Y1Y+qIuTRhZzgxmUVvueOLx87/+tb7LtOrdzNvgMpL9E
QUqVSNc2aqUQQkoyprTPcE+jC6I35TD2R5nubOG452PXbMsoPaevD1a4ZiHQUGkM
1azxMKqxp/eHe9IP1kvlU+933sT9gQ==
=K4Vp
-----END PGP SIGNATURE-----

--FooSzIoE8/IvdhAD--

