Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E757AC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 12:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZ72lF+hhXNKmCevWKcG5DoRm0RMmZ0c+B4PXvPNvtc=; b=HtjchwF/wXUB9srOb4T11mtRa7
	tlXwn1A6UyDI7UOD5/RaVOv7u8sXJqvxYh+E2iV4Y4NukNZW0COjGKpReqAa+9AcYAAxd1A5UmLWL
	90Jff5bPpYSRke0WdzWNggOCre8SwzvcgqBoESUGfnggTnP7CzJInJA74NlNlmA2Se3zCkF7FA0l1
	ySG2mpqn3rfvks+PeJ7WlfIx+C4grpvUPwn6fcsMhtY4QmQg0NOOWHMc2PEHaJm0yBZ90SOEJydDo
	n/rxc168EQgayrPuLXzH6kvy2Ho8/UAdEpcCnj35v8E70HUUk1up8Sb/wxpSFLsM134d6SXP2YBfz
	/m1xPXCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNVpD-00000000BaN-2k14;
	Fri, 06 Jun 2025 12:05:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNVn8-00000000BR4-17tr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 12:03:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 90D846000A;
	Fri,  6 Jun 2025 12:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C16BFC4CEEB;
	Fri,  6 Jun 2025 12:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749211401;
	bh=6oz9cLgBpq1+bwaTR5/JwtLIYahXmjDOpJo1Ih+IxD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SeNM+vw6o2R/VlOg+xOelhhzCXW9usTQ42ANhiV95Y2x9Zn03fWe3qeJLHG/Irx/V
	 Ql+SwV5H4mHoIKAcoaq2UwshrQHD6bGBm4u6t2zp9iHtjOBL0ZO9RabpIdByFPnF0h
	 nqzutpLb25wSNP2wH9Foo26YdAFUOUXmRhUVtbiPA3qPycHZ1fc6C8cXHnKZfVN+WK
	 xT3fOBQgnFjYwte/ANAF2HV/22aK4vTebfl33KbuQ5bPgOrZYwCk0Z72Q37FigH+8c
	 eqeO+OdQDej06AfYvflVWtrLcZWKoxbZUqoCCKaYZuYGy8Kmsvx7XGjdirdcgiNxpO
	 sdTSFPhyYXnPQ==
Date: Fri, 6 Jun 2025 14:03:18 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] drm/panel/samsung-dsicm: Keep up with refcounting
Message-ID: <20250606-radical-rigorous-buzzard-ca09cd@houat>
References: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
 <20250604-of_drm_find_panel_part1-v1-2-c632e12e131d@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="naqzmlhexuyovrm5"
Content-Disposition: inline
In-Reply-To: <20250604-of_drm_find_panel_part1-v1-2-c632e12e131d@redhat.com>
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


--naqzmlhexuyovrm5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/4] drm/panel/samsung-dsicm: Keep up with refcounting
MIME-Version: 1.0

On Wed, Jun 04, 2025 at 10:45:11PM -0500, Anusha Srivatsa wrote:
> Put the panel reference back when driver is no
> longer using it.
>=20
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 0014c497e3fe7d8349a119dbdda30d65d816cccf..3667855ff0d6d1b608c579573=
de657af7fd14388 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1748,6 +1748,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi=
_host *host,
>  			dsi->out_bridge =3D ERR_PTR(-EINVAL);
>  	}
> =20
> +	drm_panel_put(panel);
>  	of_node_put(remote);
> =20
>  	if (IS_ERR(dsi->out_bridge)) {

Explaining in your commit log why you think it's a good idea to put it
there would be really nice. In particular, it looks super odd to me that
you would put the panel reference in attach.

Also, your patch doesn't work, and you have a reference inbalance. You
have one taken by the panel driver, put in remove. You have one in
drm_panel_add, put in drm_panel_remove. Which reference do you put here?

This applies to your other patches too.

Maxime

--naqzmlhexuyovrm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaELY/wAKCRAnX84Zoj2+
diBYAXwKsnGG/hDaACTi2QF85rFrKiFaFWibUe+aygZ2K7/QBjFUhuAmCr4gs9ij
KBDYTjQBgNXlwuo0a1Tzh+JZDgdPXgj1NZYl1UppVoWcYCBkxzww5vfwCw0+YexU
o1W0BPKmpA==
=VbEd
-----END PGP SIGNATURE-----

--naqzmlhexuyovrm5--

