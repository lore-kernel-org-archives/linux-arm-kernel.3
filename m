Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3769BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 15:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqfomFmrTA/uC7kqqM+3HZpOgzPFlpCtuZaJurBX7aU=; b=YuS/cbHvMMuUbuXgfxVdFhTrhy
	xBIvhLBQIwxzYKY7ySpHnwryZKzZTKJwvNSE0Vmv5G2HyMRKmaBFvstSBiLTuRblpNCjLP6vY1fUT
	7UyFOjkG1/1Xce2Sl8OGXbKHChI+FYtscvJp7jpMUbLYVI52vOF0mQanFf6y5w2xfJGGYRR3KthWJ
	jylS/vvSjPQou3S4kxb3hDBcIC1hUypXagJuUTr6Dk8hZEEqI03+yAOAAe7OVtZ+s2sVoNd9rmxWq
	b5JwOVba160iqyP9XUHH35t94CDzNghxFzi19rwMaRLW079XTTYO8FavTqxKJWDA6Lc/AELwESMGj
	CP4pUz+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhrg4-00000006Lx5-1o08;
	Fri, 01 Aug 2025 15:28:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhrdT-00000006Lj7-3SCE;
	Fri, 01 Aug 2025 15:25:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2420DA555E0;
	Fri,  1 Aug 2025 15:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA5EC4CEE7;
	Fri,  1 Aug 2025 15:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754061930;
	bh=UV8FDHpbNM9aWBAqfMgYeTlU8Uc7fbwEdxNlwwotWow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qjPPLucDOIqxae35F+/Af8liJe2JeEKw8JpYVIv9VJ+GahNyBO8QmPfyIUDMhctHN
	 VltQmkJ0og7V8GWxQTxrUS5OhH0URqUoMh71In1rnlhmxkN9x8nFXBencTZz9aYdWa
	 KHuH07SpDf85QiHsMBmJxxuhehcE1J9JNIMwJAdUbIo/zTUqo83PXOI7ahaCgoC25g
	 ThHR+yxRGcvMAv5nLSS5rKTEHSrEi+1U2fs3KSkmg0qEmgYE/P+oOFC/pDh1xUuQ92
	 XKMaYyi5+jCKFde9jTUTT6zIFhOaAsfmxhP70jGynyrM12F9N82mxx9+YTkidhzoM6
	 huykH2ukqHX3A==
Date: Fri, 1 Aug 2025 16:25:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Tang Bin <tangbin@cmss.chinamobile.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	parkeryang <Parker.Yang@mediatek.com>,
	YR Yang <yr.yang@mediatek.com>, Zhang Yi <zhangyi@everest-semi.com>,
	Fei Shao <fshao@chromium.org>,
	Julien Massot <julien.massot@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [RFC RESEND PATCH 2/2] ASoC: airoha: Add AFE driver for Airoha
 AN7581
Message-ID: <7068c875-189e-428c-bf29-4c58052e409f@sirena.org.uk>
References: <20250801091812.4866-1-ansuelsmth@gmail.com>
 <20250801091812.4866-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u4i6tmdHxjn6/iCa"
Content-Disposition: inline
In-Reply-To: <20250801091812.4866-3-ansuelsmth@gmail.com>
X-Cookie: Who messed with my anti-paranoia shot?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_082531_990648_274C1BFE 
X-CRM114-Status: GOOD (  13.96  )
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


--u4i6tmdHxjn6/iCa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2025 at 11:18:09AM +0200, Christian Marangi wrote:
> Add support for the Sound system present on Airoha AN7581 SoC. This is
> based on the mediatek AFE drivers.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  sound/soc/Makefile                          |   1 +
>  sound/soc/airoha/Kconfig                    |  10 +
>  sound/soc/airoha/Makefile                   |   2 +
>  sound/soc/airoha/an7581/Makefile            |   7 +
>  sound/soc/airoha/an7581/an7581-afe-common.h |  35 ++
>  sound/soc/airoha/an7581/an7581-afe-pcm.c    | 455 ++++++++++++++++++++
>  sound/soc/airoha/an7581/an7581-reg.h        |  29 ++

Commercially this might be a separate company (well, subsidiary) but
this really does look like in technical terms it's in the same family as
Mediatek so it's not clear why it's a separate directory.

--u4i6tmdHxjn6/iCa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiM3GMACgkQJNaLcl1U
h9AxQQf/cXI+oOJD0ocVccB1R1aH6Mz784IpZrG5A1J7QxDxrfQXl/E8FQArB0aR
LVB+A8JEApb5Bcu2hSB+luSv/yCoFzK+l54YVPRnZsvfE9Caa06wVenJGR9Q32nf
owvAz2th0Fy0SndV7Pz7DSxIsgaEPAE5Rf4rnb2vOqJu7GCa8GcBqyD6AeLzqRyn
fSbmTPPhQ5UsGIE8PAY0P0+TxNxT19n3HsfAKTDZ36j1fpnU4dfp5iNTMRzI3/Wq
SwWu4ylE75ivAMK9v+kicTto1bAzbmJmpNLMOdPpYxZuO0tRqrnymwQvaBdQceUr
fDJithAny9ANXVkzMKdhwXJclntdNQ==
=tZJ6
-----END PGP SIGNATURE-----

--u4i6tmdHxjn6/iCa--

