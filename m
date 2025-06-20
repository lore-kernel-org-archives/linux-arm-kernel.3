Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FDFC71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 10:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9YnKQDX07WskdiWxCnaxVYrraAyBh/lKpKV+PkuLwc=; b=tHJD5A0ZfLcQ+VYcC6gOAVmqIh
	GHP0VvTFcXc0ckV6/RJVYfd4ZSbEpkg3+3ZyWVrLj3eq3pCntB3pA3elpBmbxGoj6fD1/drN8z0Dz
	A/ty0dOIYdQrkvPpYbTsgEHgG//gL1ul8gezG+9e45+x053cjTukW3Jp4kdlIUz7Hc2fJM7M7yEF2
	djEU3DFjzSFphAJuP2zdrVJ7CsYCa+fb+Uua8UrwKWLgKucu3RsjS2JWdRANfNWLarYdAfVz/i8UD
	3NK6f3h6HUxEDDIeuYSbZnCAwJQ3BvDaS8Rlr5dl02vrhvUZmE9MKWyMrpYfmBwcq6uKT3bkRhuF+
	LRcoaOqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYr4-0000000FJpi-3vK9;
	Fri, 20 Jun 2025 10:20:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSXlz-0000000FA1c-28yy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 09:10:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E06D61786;
	Fri, 20 Jun 2025 09:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC72C4CEE3;
	Fri, 20 Jun 2025 09:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750410658;
	bh=ubDse/6nWJd5Iv7Enf1Qe9halXvlhEPQotOXpmNQr8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VFoufkfWVmvGR4hpJY/Al8zDV+pMjqU8S5KnlZZKKJDa+rK9gYXqFeLUgp5fJIXxM
	 DTmr9OKNMcUw0wR9zJ9Jj28NicciZS5MKLx7yx2/iSBjP1WhedbgYAGGBU9JDigM3I
	 p8kPiHFdQTqSkjwqC2+wv5zvhrmodaZjLV18969Ze4x7EE4pF661yutbWN5h1b+fgw
	 e7+zaf/5B9peqzp23Ofqy4cJ6q/MgrPph2bvjYL7HoUE1+OEmUC4xWtxqXmfayoSjq
	 4ntOhmYVwaSkqYEbGgLL80n+jCAsLZAhdiA3vzi5modEq5+BSascCUngTnJslellWe
	 EZ69uAy38cQmw==
Date: Fri, 20 Jun 2025 11:10:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 01/16] drm/panel: get/put panel reference in
 drm_panel_add/remove()
Message-ID: <20250620-conscious-purring-ant-b0a64e@houat>
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
 <20250619-b4-of_drm_find_panel_part1-v2-1-0df94aecc43d@redhat.com>
 <20250620103353.5b43b86f@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ayfn3kll3fl323i3"
Content-Disposition: inline
In-Reply-To: <20250620103353.5b43b86f@booty>
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


--ayfn3kll3fl323i3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 01/16] drm/panel: get/put panel reference in
 drm_panel_add/remove()
MIME-Version: 1.0

On Fri, Jun 20, 2025 at 10:33:53AM +0200, Luca Ceresoli wrote:
> Hello Anusha,
>=20
> On Thu, 19 Jun 2025 14:15:53 -0500
> Anusha Srivatsa <asrivats@redhat.com> wrote:
>=20
> > Take the panel reference and put it back as required.
> > drm_panel_add() and drm_panel_remove() add a panel to
> > the global registry and removes a panel respectively.
> > Use get() and put() helpers to keep up with refcounting.
> >=20
> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
>=20
> This patch is good.
>=20
> I'd just point out that this must be applied only after all drivers
> have been converted to the the _alloc API, otherwise with the following
> sequence:
>=20
>   panel =3D devm_kzalloc();
>   drm_panel_init(panel);
>   drm_panel_add(panel);
>   ...
>   drm_panel_remove(panel); <-----
>=20
> at the drm_panel_remove() you'd have a warning:
>=20
>   refcount_t: addition on 0; use-after-free.
>=20
> So, if all panel drivers are converted:

Not all panels are yet:
$ rg -l drm_panel_init -- drivers/gpu/drm/panel/ | wc -l
20

Maxime

--ayfn3kll3fl323i3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFUlmgAKCRAnX84Zoj2+
dkiPAYCIte+2tBryJpZRpT6kkEN41Ec91k+s449YnA84pL1ey4OrFgVdTNOesLxw
e9unZSUBf2dd1SlD3wpyZKqM8nylg4Tzep9Jj6nmiEtL32rA/nKwRv5XVAdwV+o6
JgigwCZp3A==
=nfps
-----END PGP SIGNATURE-----

--ayfn3kll3fl323i3--

