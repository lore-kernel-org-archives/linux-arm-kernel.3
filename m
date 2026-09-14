Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4EBC88E70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+C6bJ9lSz1Jpov7bJ535G9We/yIWpPULTUgpYQ3bu4=; b=WycrGfW8fYugUANsHV8V5t6CfB
	29MWfHuzD15w//Pqam4xVTjPhAR9112XO3HEFbSaNeOdlM4ovWFWTReIomejoR7QnquTVsqMWangh
	lnQGRWEBD0DfNPOTEodeB0ccMAkk5NC2ulGXe7OkaEw2iXF1si3etPoWYvEjSiTgQo0v59VHN2i2F
	FovhthQ1x1nljm5x3FRaYl9hWdXn//2Q8blLxWuBXRbaoy5XEuiOSd6Qc22JOxVXbvAttjYOPL56n
	RBq+AjfjjcVmMyD1WaokOXDX8c0wiaiHVBkqrbnhYpfHuCW9vQbHJaSp/5dGXUGSM+4+2zCmCuE6n
	UB2WI1tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x672J-00000003qgC-0VM8;
	Mon, 14 Sep 2026 13:47:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x672I-00000003qfe-2hCG;
	Mon, 14 Sep 2026 13:47:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 26091434C7;
	Mon, 14 Sep 2026 13:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F431F00893;
	Mon, 14 Sep 2026 13:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789393674;
	bh=N+C6bJ9lSz1Jpov7bJ535G9We/yIWpPULTUgpYQ3bu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y3b6l5Sy5djH0Axzhiu2XWukfUdypi5qXIMoXVqOrigWayJq8cIShonF7uT2jWATm
	 sPpyh+M/4iWRegTgf/c7cJ8TPe0E1PgC+w/QDMmLribgTuI25QmWAsIy/KZ+DQc0M/
	 kSVRdlHbj2AzsFvGYIJK8zlTXVi8G/1gtwP9UYyoF1foMNVWouRr9j0xohnjyo9puy
	 LaBdzW3iFMoflmlxEv1t85yXhToQ6KPFqqkM9fwlMzLKN8ZsoW/3dCFOR7Mvhb/NXF
	 2vXAaETbhb2us/gfKAQVPapIDHhE4meHEU4bP50CBmqi7RS0AaQkaUDwge0Q/1SRzo
	 pbzTRF3S6BIkg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 345AF1AC52F1; Mon, 14 Sep 2026 14:47:51 +0100 (BST)
Date: Mon, 14 Sep 2026 14:47:51 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: phucduc.bui@gmail.com, Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>, cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/13] ASoC: mediatek: mt8189: Propagate APLL enable
 errors
Message-ID: <aqf7B_E7_Gv5iK2A@sirena.co.uk>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
 <20260914072842.24420-3-phucduc.bui@gmail.com>
 <07add31d-5622-40eb-9bcf-f7cb2396fee3@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P/tFBbzpIceAToQ8"
Content-Disposition: inline
In-Reply-To: <07add31d-5622-40eb-9bcf-f7cb2396fee3@collabora.com>
X-Cookie: My vaseline is RUNNING...
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


--P/tFBbzpIceAToQ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 03:22:21PM +0200, AngeloGioacchino Del Regno wrote:
> On 9/14/26 09:28, phucduc.bui@gmail.com wrote:

> > +	ret =3D regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
>=20
> Well, this is a bit of defensive programming here.
>=20
> The regmap pointer is already checked by the previous function call, and =
this is
> a regmap over MMIO... and MMIO writes can't fail.

Oh, you sweet summer child :) .  Though practically speaking the error
handling ends up being the same as if they couldn't fail since if
something goes wrong it's generally catastrophic stuff like locking the
core up completely so the end result is the same.

--P/tFBbzpIceAToQ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqn+wYACgkQJNaLcl1U
h9BSxQf9G8Xdq5Mf7AwqiSpgu3Yw8i7t/TfDP30tuFFmVeW/ZnYzfZDEBEpqtW/1
Qjmdx6+OOp1KgYt3l6QLlZbYtHEBOZBGM5eJsqTcDLSk8hVK31B8bFhIRsY5hL1d
5O6xK5ZInZA3H/PtHbkWq0aqZg3cPA4ci/SyZ4xNmDjyV4bOP6gaSm2acMzSPLXi
AkdU2FfuRVfcOMh4C2UzY5MmmKzJL2BOI+KthHTluYVZdcNQleVv/Pgrwm2hpxcy
gXJ8CB55QEgkmY+6azNck8vAbUC+RK2vXpPbvbv3pOAM7NPXvP+i1PlNXGgDMAUF
6rpD0iFE9TeOFOWBmNioVfZZJrkaWQ==
=ffDW
-----END PGP SIGNATURE-----

--P/tFBbzpIceAToQ8--

