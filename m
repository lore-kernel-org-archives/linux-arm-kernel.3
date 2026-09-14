Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0DDC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 14:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DL+4G6Acg94ISi+DE163+7kN27YE1IqIr+s7EV8FG5c=; b=iSeQfL1sdRoqtdHStkyzUIHOn/
	3DbqhTBpbITGTjpBKhHw4EPldSkvPxP9WAxj4qSkYMdxNmiY8bzWyiwfYLx09Ao3KT5tgE559GtX2
	+rVbBbs1P3w0YoMjFytMBwYTZtI9iQRnJEz5nCiATPOBBHMrdOPROXbGXbXpl2H49dUsbrSHsXspb
	AEVbGpL3s042CgjSXobL4lNZbeo+XskbijPI3101cG8S6IawreSNhs86EXvKJAXrK33f4dbSe0cuH
	M60IP1o0iJvgAcIZfYj6XcUl2MTMpWtyIQS55I2v9lbbLYGE+4EWhZCo429W/gjZxEUHUQB07d7fX
	UPAtjA6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67HH-00000003uUl-0Z4v;
	Mon, 14 Sep 2026 14:03:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67HF-00000003uUI-3hyM;
	Mon, 14 Sep 2026 14:03:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5573E601FA;
	Mon, 14 Sep 2026 14:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0B61F000FF;
	Mon, 14 Sep 2026 14:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789394601;
	bh=DL+4G6Acg94ISi+DE163+7kN27YE1IqIr+s7EV8FG5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bf7gBv/x4x/3XpbK4YwTjNJp1ghIEMrn+A0L+oL2e5vzKc0GuRxW1/OIAJ+2eGnZ9
	 1luJCDPX0nLz+ZUfKYnvyUo5BPW7kUmWidaqurbigeuaVVS3nD7KDWOU29280Jp33l
	 BMst1FepH5gttyo3z+5rRzp/xzMNL9NPefeYwkkaXPfQCiKS3PjFiWkOSVfPLcVPvT
	 jjmbjuUXsDLNrkh3t6tcmSHXNpY2eYC+uu4NvA4r32+PBBCPHqNiRscGYSa1vUm7Ii
	 fYRDJmyxzDcUS0y/USrZtgOQV1w8lRNSJjlrVQ+PbWyvdIbxWGLSHOMetLdA1v42eN
	 JBJNA+D22Gk/w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 3124A1AC52F1; Mon, 14 Sep 2026 15:03:18 +0100 (BST)
Date: Mon, 14 Sep 2026 15:03:18 +0100
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
Message-ID: <aqf-pqvBNQ21EQZx@sirena.co.uk>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
 <20260914072842.24420-3-phucduc.bui@gmail.com>
 <07add31d-5622-40eb-9bcf-f7cb2396fee3@collabora.com>
 <aqf7B_E7_Gv5iK2A@sirena.co.uk>
 <8f1ea5c4-d85a-43eb-8b10-3f80f8343b27@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GXuwere7a8FKIrgP"
Content-Disposition: inline
In-Reply-To: <8f1ea5c4-d85a-43eb-8b10-3f80f8343b27@collabora.com>
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


--GXuwere7a8FKIrgP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 14, 2026 at 03:58:28PM +0200, AngeloGioacchino Del Regno wrote:
> On 9/14/26 15:47, Mark Brown wrote:

> >  Though practically speaking the error
> > handling ends up being the same as if they couldn't fail since if
> > something goes wrong it's generally catastrophic stuff like locking the
> > core up completely so the end result is the same.

> That was also an implicit point (that should've been explicit from me): if anything
> goes horribly wrong here, it means that it already went horribly wrong "some
> function calls ago", and the platform likely already locked up as you suggested.

> In any case, I'm not against doing error checking, it's just about not doing it
> when it's really useless (I'm sure you understand my reasons), and I believe this
> specific case is one of those.

> That said, should you prefer having error checks in such places... it's not a
> performance path, so I don't really have strong opinions really.

Yeah, I think it's fine and sensible to skip the error checks in cases
where we can't really do anything constructive about the error.

--GXuwere7a8FKIrgP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqn/qUACgkQJNaLcl1U
h9BGFwf+LZVRHjhM7Nyt8/mV1pd/nUeH1UxU9/++n9Z3LlOZ670g07YD9SuYOfud
JqZzC5fxhObTL9cZtZDRjzXUyLW475E0JPlyiFo2Ikp9tz2yQ8fpgowKCsdPu26C
zNqqAtMewvt3WhaEg/cUitd2ud8jMvFcmWlQ1f0VtKahB1qZtdtwCF01RaJ7juyZ
2jWOORbnrraSfmhPZMSr9JLSaq4miasH5OkUqDGCTsRBERLGG5y61KnFf9zwSyZY
eDxsuo7zD/c99xXevtcRNDnIDMgoZFRrEHrfM39N3Kosi3Vur5Fng4dommcO3osy
fbQJLFrr/RbKz7tPNCdJJhyC9zJ6UQ==
=ZB27
-----END PGP SIGNATURE-----

--GXuwere7a8FKIrgP--

