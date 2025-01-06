Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF91BE77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 18:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQz1rlAiEbS+P7P623N3jaq6DQBwTOdY6kRPu1sNoTU=; b=nF4jHaSuIkMF5G3nf9SZv2fgdp
	rB/N+UxeCBZNjf3eEQVgpAUj30mxDnt4ZbLBolYm26PXxxPdedNV3eyecJ2I0JZlypwccc7qNhfqV
	uSqHfZGUh6/NuXZJD0WNtWu+mCiro6l0SccoZhEEiB6dAcpWnGet6Xd1juzmkEaaHWbmgkF6593fh
	j3wnDoabCOhR6zsyQ3lMunZXAYPaWK3nqqdGnFrcjWbl3yUjYGo9pHGouyGFyQ6w6BMg5LZGnwp8o
	KTc7Ga/eofjUPkd3Oq+AV3/0rXFC7hMAWKWzrjCyUBnPgNHerAJ9Fo/pUNQFeKyBAixfDflWQV9K8
	ADuIcwAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUrtJ-00000002IZV-2ebb;
	Mon, 06 Jan 2025 18:31:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUrs7-00000002ITA-3qnm;
	Mon, 06 Jan 2025 18:30:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 025885C5CFF;
	Mon,  6 Jan 2025 18:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A04C4CED2;
	Mon,  6 Jan 2025 18:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736188238;
	bh=EQz1rlAiEbS+P7P623N3jaq6DQBwTOdY6kRPu1sNoTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ux39bESTXPdPkbwuHaPQG/Z9MTB7ZcQZQURnqios6qWW/4JNq0uP06epVp9oL5ZDD
	 KWUFnVFUVTT3mSYavfnRubSzQ7PcFzt//lGpnn82Ff+qk7tjxZlIQ9FhoQw5KIFIFE
	 a4N1XlMVCYE3xr/Fyn4UfsRq1YgtBDTLJLSmDjg2JIete+cphn4e4o8IrmsRxL6rXr
	 mvmAs6yTrDIL6UzlZmh8JYi1S4QWJHUqP+4Zl1NTnBv6GbZRYjjSryC5WQLZz9NuG7
	 Ez5fasVFrfG7kyPaNiLby5vZVO6mT+RKd4WMYOKnh1Gawo6jHQlcCYP0EfJvY+DSTl
	 w7xGsiT0TUebA==
Date: Mon, 6 Jan 2025 18:30:33 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Trevor Wu <trevor.wu@mediatek.com>, kernel@collabora.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Fei Shao <fshao@chromium.org>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Remove hardcoded dmic
 codec
Message-ID: <e375b833-2ec9-498d-9042-f18c3b5536f8@sirena.org.uk>
References: <20241203-mt8188-6359-unhardcode-dmic-v1-1-346e3e5cbe6d@collabora.com>
 <CAGXv+5EG8LbgaWc-Lp_KQc8Yf+m_4TRo8R7B0S7-rXYpnak+7g@mail.gmail.com>
 <f60f4242-9e4e-4846-b1f0-949daf68f6f5@notapiano>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5a+Se7219/TOLYZo"
Content-Disposition: inline
In-Reply-To: <f60f4242-9e4e-4846-b1f0-949daf68f6f5@notapiano>
X-Cookie: Do not pick the flowers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_103040_009264_2E6A8E2C 
X-CRM114-Status: GOOD (  11.37  )
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


--5a+Se7219/TOLYZo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2025 at 02:33:10PM -0300, N=EDcolas F. R. A. Prado wrote:

> My understanding is that the dmic codec was added simply to allow the usa=
ge of
> the wakeup-delays. From [1] it appears that DAI connections between two c=
odecs
> are possible, though rare. So the PMIC -> DMic connection description mig=
ht be
> possible in that way, although I'm not sure it brings any benefits besides
> closer resembling the hardware topology.

> [1] https://www.kernel.org/doc/html/latest/sound/soc/codec-to-codec.html

That's quite widely used in phones FWIW.

--5a+Se7219/TOLYZo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd8IUgACgkQJNaLcl1U
h9BvbAf/b3aJl/ynw/PxKc1fDmig+T+I1qsslScnfq4MyKgtUZQxCx5dkWd4++/8
0IkOBnNcsDqpEyQwxnHynROIdh20WqaZWmmgDdvMIcd50xsyfOuqatBRrevQkdM0
Tdfzog/8igzJNW4d1G2WaNeim4uqo3b4ROsu07MTwsEk5a2C1e73R3ULS5BktZMJ
MB38Fdd/wxNb7LrxXFNi6uOY/flKCwtpfNZoM0cknOVOlqLR0wYD1GnMNIYIWK9a
vjw8JxA5mIVRpl+pxl5e93KoGoCN8bN3x5OpsRhsvZRihZHG9U4kznmiCq5MxkRh
isSbRFEiltWwpAwI/r1SXOzW+ZZ1rw==
=FekA
-----END PGP SIGNATURE-----

--5a+Se7219/TOLYZo--

