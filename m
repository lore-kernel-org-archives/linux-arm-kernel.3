Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E024C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 14:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhqxWd1s+jRdNMazcVBt3s8WZZldzk9M3UGf3N+7mvQ=; b=lFwC92umKa99g5xyAatNpMSgvM
	OTAtMJiep4ex8ok50ckXzLu8dvSxCyQ6CBFS2B7tPgo6nFPWRDX/fpvLxCiJxkWhdqWHfvu9I5d7I
	rQL5VtzLfr6Bjwe373JAb7wWVWYmNXPMXS2Up1BZgjbvL2/KRHCZXHZHKdpH8kf7pbIaEmVz49h/5
	XsONx4wJvePfzRNEvdUHr4UwSjiu9N8CaDqutWPwgKPlv3UtUYj0tsFHBgFsycOCcepRPXJkUyteM
	GLIP9C/egLUugaR1cwhpMn7ZQeBOxawnaMz6XxNlAH6XVr6kf/cpxUWmdP58SwnfbvfnqvqG87m5W
	tJP2AjMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJH8-00000009zmE-4B7Y;
	Fri, 25 Jul 2025 14:19:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJCq-00000009zEE-0d2L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 14:15:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E67E7A5659F;
	Fri, 25 Jul 2025 14:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086CEC4CEE7;
	Fri, 25 Jul 2025 14:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753452926;
	bh=klj31ndNyAWRbK84pKxL4JoG8gx4CjB4V3j2sfODoUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jmtd1oVzWi1NM63TDozl7apju5daWm6U3OWjyBWY29WQR6kAljjan0nSZI+9J3mIh
	 XekGDZvq8Rl3GzVNxEseDghIuBpxtvatGakpY0BIThktlCaQZx8l1CUBYttjp/YRUr
	 0DPuB3mfNOJ504RorGftZcbTTiT/nifETC+S/G1BUwZhzUQ/85Rw6KIqYx43X/5Q+K
	 BaoelOTWIX/M4gZQJJtF8OuSDsLtdTxugSCyEbV6IXkmVaG5AfH2b9SG0iI6CWsO4v
	 gDBG/ZaqBK7mxij7XPn1LTzEPd1HjM0fhWHuTnVhXZ/GvCclzVDa4/NQS01oxbpFEV
	 5J+CNfLss2LVg==
Date: Fri, 25 Jul 2025 16:15:23 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/9] drm/omapdrm: use drm_bridge_chain_get_last_bridge()
Message-ID: <20250725-holistic-ambrosial-jellyfish-f41f6b@houat>
References: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-0-48920b9cf369@bootlin.com>
 <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-4-48920b9cf369@bootlin.com>
 <20250710-daffy-mini-booby-574fca@houat>
 <20250714123240.16d8dcb1@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ujxl4547qfzdg32k"
Content-Disposition: inline
In-Reply-To: <20250714123240.16d8dcb1@booty>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_071528_322153_60671D88 
X-CRM114-Status: GOOD (  25.91  )
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


--ujxl4547qfzdg32k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/9] drm/omapdrm: use drm_bridge_chain_get_last_bridge()
MIME-Version: 1.0

On Mon, Jul 14, 2025 at 12:32:40PM +0200, Luca Ceresoli wrote:
> Hi Maxime,
>=20
> On Thu, 10 Jul 2025 09:13:46 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Wed, Jul 09, 2025 at 06:48:03PM +0200, Luca Ceresoli wrote:
> > > Use drm_bridge_chain_get_last_bridge() instead of open coding a loop =
with
> > > two invocations of drm_bridge_get_next_bridge() per iteration.
> > >=20
> > > Besides being cleaner and more efficient, this change is necessary in
> > > preparation for drm_bridge_get_next_bridge() to get a reference to the
> > > returned bridge.
> > >=20
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > ---
> > >  drivers/gpu/drm/omapdrm/omap_drv.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/oma=
pdrm/omap_drv.c
> > > index 054b71dba6a75b8c42198c4b102a093f43a675a2..3bbcec01428a6f290afdf=
a40ef6f79629539a584 100644
> > > --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> > > +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> > > @@ -378,12 +378,12 @@ static int omap_display_id(struct omap_dss_devi=
ce *output)
> > >  	struct device_node *node =3D NULL;
> > > =20
> > >  	if (output->bridge) {
> > > -		struct drm_bridge *bridge =3D output->bridge;
> > > -
> > > -		while (drm_bridge_get_next_bridge(bridge))
> > > -			bridge =3D drm_bridge_get_next_bridge(bridge);
> > > +		struct drm_bridge *bridge =3D
> > > +			drm_bridge_chain_get_last_bridge(output->bridge->encoder);
> > > =20
> > >  		node =3D bridge->of_node;
> > > +
> > > +		drm_bridge_put(bridge); =20
> >=20
> > Any reason you're not using __free(drm_bridge_put) here?
>=20
> Just because the code is simple enough that an explicit
> drm_bridge_put() is clearly sufficient.
>=20
> Do you think __free() should be used even in such trivial cases?

It's a matter of opinion at this point :)

It' makes it a bit easier and consistent so that's why I raised it, but
if you feel like it's too much, that's fine by me as well.

Maxime

--ujxl4547qfzdg32k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaIORdwAKCRAnX84Zoj2+
dkjMAX9SOg3FKwN1N8vMVORyYMoULmzu5wxDDXKKuSFHlgdamHXhi0r6BnbBR3mn
Sr9UCrgBgJp8VMm91YNpmrlTp7YUpyrHZ7jGDOzb9ZihsYt9H+HB4JkLsHM6RPAL
oj/UGiAoCw==
=jgOt
-----END PGP SIGNATURE-----

--ujxl4547qfzdg32k--

