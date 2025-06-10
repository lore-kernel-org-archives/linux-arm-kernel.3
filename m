Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A724C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 19:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrQDm3bTvACPTHvwuCsxVo9qXhMwwWP/nQ+7LQcdKe0=; b=gzEzk92u9Oz5Qzb4EXw2omotyz
	bt9OFEr3RSav/+mp/RRkwYQ6VgHe0ii8KMhomXcpA2nk6sIMTpASpGhAgGaXdME5XzWdQ5jLFAyYy
	SHBRmcSiAuZE1KwmVyDh8Wr4DZJfm3kShXz0XUpsf4HpY4xGX/s7Wbo+gEajcELoFsAekQoPRikZL
	tr5YwCpIJG0D4Ro1ywnTUSHumNm8zuKUd+cgY8Ut6F3S6KkBAVRovUCZsjemvbx7DTVzta1IiObHw
	UeruizA2Am7fECIX9sYtJk+owIDkPtipD3Cpd7hQS8KCqUe3Xq+9ko/e0k6sYtKivGDFRymts/ssK
	hB5v0RkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4bb-00000007uu6-3fB9;
	Tue, 10 Jun 2025 19:25:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP16x-00000007M8B-1j0T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 15:42:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71B53629F9;
	Tue, 10 Jun 2025 15:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98718C4CEF0;
	Tue, 10 Jun 2025 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749570122;
	bh=OCX+PMXOnofivFIKf5B4TrKIDiVPaorIpAV/YEeu6NA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qpKPn/hXTpMKHurpAOYuvdyFWF2RKykP22wfL62XAqvyfVhTvhhhMjdqLh86MKBzM
	 JtDc746E9N3lbyUvO5In6rn6/5TGFozVl7pVSYHRPsJwz43uiPjAF3JUndZjDUveFS
	 z8hqpNCY9qB2XTPAjvralMFelri/ZJ8VgM/WYYhXSxmSPMUVYRetzMTsT7s74pcmYt
	 Eq/3qMMYZCHJw6AZtA0XRU4yPu0mItmnCjO8oM4aAwKcRnOH2xitVfbWl+khIC03wH
	 WQvj/oWSLTyBY3dOQmsnDZNAdVDUQAGcSSzjtWkOsAicYMlI82HyyDlE3nioLc068R
	 W4Flwz4eYubFw==
Date: Tue, 10 Jun 2025 17:41:59 +0200
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
Message-ID: <20250610-wildcat-of-marvelous-modernism-e4ce27@houat>
References: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
 <20250604-of_drm_find_panel_part1-v1-2-c632e12e131d@redhat.com>
 <20250606-radical-rigorous-buzzard-ca09cd@houat>
 <CAN9Xe3Si6XwsGOesNKOx9M8PjBkMG2paWXV5gvAnujWih6sqtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="zwi57rvdrnu4faa3"
Content-Disposition: inline
In-Reply-To: <CAN9Xe3Si6XwsGOesNKOx9M8PjBkMG2paWXV5gvAnujWih6sqtA@mail.gmail.com>
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


--zwi57rvdrnu4faa3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/4] drm/panel/samsung-dsicm: Keep up with refcounting
MIME-Version: 1.0

On Mon, Jun 09, 2025 at 10:45:35AM -0500, Anusha Srivatsa wrote:
> On Fri, Jun 6, 2025 at 7:03=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
>=20
> > On Wed, Jun 04, 2025 at 10:45:11PM -0500, Anusha Srivatsa wrote:
> > > Put the panel reference back when driver is no
> > > longer using it.
> > >
> > > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > > ---
> > >  drivers/gpu/drm/bridge/samsung-dsim.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> > b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > index
> > 0014c497e3fe7d8349a119dbdda30d65d816cccf..3667855ff0d6d1b608c579573de65=
7af7fd14388
> > 100644
> > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > @@ -1748,6 +1748,7 @@ static int samsung_dsim_host_attach(struct
> > mipi_dsi_host *host,
> > >                       dsi->out_bridge =3D ERR_PTR(-EINVAL);
> > >       }
> > >
> > > +     drm_panel_put(panel);
> > >       of_node_put(remote);
> > >
> > >       if (IS_ERR(dsi->out_bridge)) {
> >
> > Explaining in your commit log why you think it's a good idea to put it
> > there would be really nice. In particular, it looks super odd to me that
> > you would put the panel reference in attach.
> >
> > Also, your patch doesn't work, and you have a reference inbalance. You
> > have one taken by the panel driver, put in remove. You have one in
> > drm_panel_add, put in drm_panel_remove. Which reference do you put here?
> >
> > This applies to your other patches too.
>
> Yes, I should get the ref in of_drm_find_panel() to put it here. With
> that said, all callers of of_drm_find_panel() should be converted
> instead of the small batch that this series addresses.

Then do the of_drm_find_panel() conversion before, because here you will
free up the structure despite some callers still having a reference on
it.

Maxime

--zwi57rvdrnu4faa3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJQEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaEhSRwAKCRAnX84Zoj2+
dhb2AXd6k/XL3u9/OK5zj97VWmDQziONGHEsb3bDL6hJZj6l6EtMtZ9IDIPocg8T
0UuXCwGA01sHkSg3AqDJPDYt8mzstpL8wcd8zKh9oy1niBidaedsQ6I+2mKYzaTS
VdThoLbe
=nzew
-----END PGP SIGNATURE-----

--zwi57rvdrnu4faa3--

