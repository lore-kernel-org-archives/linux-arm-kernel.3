Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85702CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 11:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMB7tWfV0C03DccxxFO+6RhLHPxbPH51bsQ2TVLSInY=; b=q0fpN2GOiDHTzEJidLyjMyQ0BR
	+JwVyvKs6YXV942nD/m7e9R+hFGqRKfNCIsLBBw+Kuy7gGeauwVt3CIdth/hLFDXoH/CMWCLdxoBl
	F9H2XA9VcsYrSOIYoKkABDF8jaaZMXmA8canGNTvviQM+MOFmVArEa4vM7ISxuT0DR7EI/qdavan1
	AU4scxEpZguOXqaGKqQk/Thr1BIA+Re26Vtqxgrr/aAY/xDPzpqXCvlGGBFWkSrPSxNeD0Sar7+v0
	wkGau9QWgrT7N4jLSficPHlOZpRnwLQ0Qq13ycwJvJCBehtN9tLTcd7iJobvSIEQIIsmGMXylcT7u
	7qwQkoIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYMh-00000003RgX-0rfN;
	Mon, 08 Jun 2026 11:41:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYMg-00000003Rfk-0INp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 11:41:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A0A1640A8F;
	Mon,  8 Jun 2026 11:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1131E1F00893;
	Mon,  8 Jun 2026 11:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780918917;
	bh=qMB7tWfV0C03DccxxFO+6RhLHPxbPH51bsQ2TVLSInY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X4WIAWnINCLKLyP5AFDRs7lj8iJxd2A5fuRlmE+r9q+6lYDGidYpPpbaAmSxa1S1W
	 KSq0anONPawIBT9vC5ZpvOE4iQ2r3rTw2mDNz97HFDXc9NSjF1Ja5zcE5VJ+X7LGrL
	 ECwGHVFYazggIaxx/s2mAi6z0Zei9oLEnpMdelvvRuEnNROsBaJGQQikNrQwzor7um
	 iyOjBEC8Nq/a1hkMLR3CqVc3CcPO967TAEZdf5g0J6tFd5PHiVXelGkNt44fv3361e
	 rHU/6SkNIyfBLj5W8gNREYXNFy7XPLzz2QJglKhoJk4RNswW6e5SUWqWANl9otfgJw
	 8PcJKGAq5o+Yg==
Date: Mon, 8 Jun 2026 13:41:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/37] drm/display: bridge-connector: use a
 drm_bridge_connector internally, not a drm_connector
Message-ID: <20260608-little-lyrebird-of-competition-c25f7d@houat>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-6-45e2bdb3dfb4@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="fhyd5lz3ke6h65oh"
Content-Disposition: inline
In-Reply-To: <20260519-drm-bridge-hotplug-v1-6-45e2bdb3dfb4@bootlin.com>
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


--fhyd5lz3ke6h65oh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 06/37] drm/display: bridge-connector: use a
 drm_bridge_connector internally, not a drm_connector
MIME-Version: 1.0

On Tue, May 19, 2026 at 12:37:23PM +0200, Luca Ceresoli wrote:
> Currently drm_bridge_connector_init() always returns the added connector =
or
> errors out. When adding bridge hotplug the bridge-connector can be
> successfully initialized without creating a connector, which can be added
> later when the pipeline will be complete.
>=20
> For this the internal function drm_bridge_connector_add_connector() must =
be
> able to return a valid drm_bridge_connector even without any drm_connecto=
r.
>=20
> In preparation to support bridge hotplug, change its return value to be t=
he
> same drm_bridge_connector pointer it gets as input, or a PTR_ERR.
>=20
> No functional changes, just changing an internal API.
>=20
> Note the return value could now become an int (0 or negative error) becau=
se
> returning the same value received as input does not carry any added
> value. However this would be change a lot of lines, so leave such change =
as
> a future cleanup.

You just created that function and changed "a lot of lines" already, so
I'm not sure that argument holds.

Maxime

--fhyd5lz3ke6h65oh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaiaqggAKCRAnX84Zoj2+
dvlgAYD3UUr7c3goHHKtCxi2SQ81QH+lj0pgDu+t6mBYW/c8gJWsZHGcSUJhcB1b
D2OjIy4BgIyG6BehTdRWyVru5aHe/B51ZTvcYO++iqcsuVtE+c/aWp298FwVdKli
eZ1e6k1t7A==
=er1l
-----END PGP SIGNATURE-----

--fhyd5lz3ke6h65oh--

