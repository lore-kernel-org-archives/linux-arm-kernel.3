Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F6DC4452F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GEPDHEaRDKqZ6dNu/J9CK7yq+4aTB7MUn/lfU2U1p6k=; b=AxG7OAD396HOAfl6eOfsA117mm
	F4unHHMECpmvzATlrwMgGcg9hBLvrP1wUlCBJ4kj8Abfr71BVJk5PoigIAFSErVWAO7zxhfody0Yr
	k3D/qYZfJYEdl4sPioa53MokdloDqDJfv/E5IfROc84iS0siLIaNOrK/mSZtGsACI520FFuDXlcSS
	vbgL2RWtlRvZXliuPlI1IHhr8fSOfAYnRDz5y0V0uh1oWAMzluSkZ2VDItAPSWDGxfNSdSBLE9rH6
	QCz0u3a8CjzojQIodfOtXvlQ+jENU6PgR96pk9sN9dko4ZQWhzLcBkEP4FPz2OcsZG2t/BX7I3IhD
	d6Rc5Y5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAOM-00000009Va4-01Z6;
	Tue, 21 Jul 2026 13:20:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAOK-00000009VZr-2Vcu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:20:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BFCE405AC;
	Tue, 21 Jul 2026 13:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82A31F000E9;
	Tue, 21 Jul 2026 13:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784640012;
	bh=GEPDHEaRDKqZ6dNu/J9CK7yq+4aTB7MUn/lfU2U1p6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f2GrUSkQ+dYENYlClXT0M2kBcCpxk1B46HnSHBgkfXdy0QW8AcHrD2wIrH+KPrmcv
	 cwwlD1IMG5bN/4zAIw0vhD2qgfq4w17HYUOxBKBc7nvXa80jlBg+GwDM+QTA+ah+Xd
	 fwI9OcS4ury3cowlUEW6G3gODpzvksrTSSDPREzBAP9aLB71P4XyxXXzC7hjbEFInZ
	 73zf1OjYqdwBhKFnK3hYdTIuWOC6+ILefEgXA1bjrH+zaK0XpM8vXdhZf7f3Z+2Fj4
	 +xpGnHuE8Jy6ytglrp1E6iu4CgUhmOTFy2SceYSogq5Sac23cMK9hQQR2qzUmJe4E9
	 OWrYGue9pH2pQ==
Date: Tue, 21 Jul 2026 15:20:09 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Daniel Stone <daniel@fooishbar.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v7 2/5] drm/scdc-helper: Add scdc_status debugfs entry
Message-ID: <20260721-wooden-placid-bumblebee-73360c@houat>
References: <20260721-scdc-link-health-v7-0-92df1b6ad5fc@collabora.com>
 <20260721-scdc-link-health-v7-2-92df1b6ad5fc@collabora.com>
 <20260721-angelic-gay-caiman-26f7ab@houat>
 <Ds65RxhYQNiDhRyjzYaHhw@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="llbbhttkpl4ptwgh"
Content-Disposition: inline
In-Reply-To: <Ds65RxhYQNiDhRyjzYaHhw@collabora.com>
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


--llbbhttkpl4ptwgh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 2/5] drm/scdc-helper: Add scdc_status debugfs entry
MIME-Version: 1.0

On Tue, Jul 21, 2026 at 03:01:12PM +0200, Nicolas Frattaroli wrote:
> On Tuesday, 21 July 2026 14:41:42 Central European Summer Time Maxime Rip=
ard wrote:
> > On Tue, Jul 21, 2026 at 10:58:58AM +0200, Nicolas Frattaroli wrote:
> > > SCDC provides status information on the current display link. At the
> > > very least, it may be useful to expose this info through debugfs.
> > >
> > > Add a debugfs entry for it under the connector, which displays a few
> > > more details parsed out of the SCDC registers. A new
> > > drm_scdc_debugfs_init function can be called by the connector
> > > implementation to initialise the debugfs file.
> > >
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  drivers/gpu/drm/display/drm_scdc_helper.c | 184 ++++++++++++++++++++=
++++++++++
> > >  include/drm/display/drm_scdc_helper.h     |  32 ++++++
> > >  2 files changed, 216 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/display/drm_scdc_helper.c b/drivers/gpu/=
drm/display/drm_scdc_helper.c
> > > +/**
> > > + * drm_scdc_debugfs_init - Initialize scdc files in connector debugfs
> > > + * @connector: pointer to &struct drm_connector to operate on
> > > + * @root: debugfs &struct dentry for the debugfs root of @connector
> > > + *
> > > + * Creates SCDC-related debugfs files for @connector. Must be called=
 after
> > > + * @root is already created.
> > > + */
> > > +void drm_scdc_debugfs_init(struct drm_connector *connector, struct d=
entry *root)
> > > +{
> > > +	struct scdc_debugfs_priv *priv;
> > > +
> > > +	if (!root || !connector)
> > > +		return;
> > > +
> > > +	priv =3D drmm_kzalloc(connector->dev, sizeof(*priv), GFP_KERNEL);
> > > +	if (!priv)
> > > +		return;
> > > +
> > > +	priv->connector =3D connector;
> >=20
> > You need to take a reference to the connector pointer here with
> > drm_connector_get()
> >=20
> > With this fixed,
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> >=20
> > Maxime
> >=20
>=20
> I think sashiko is onto something here with the memleak and the
> entirety of the priv thing should go, which is fairly easy to do.
> We don't reuse the state anymore anyways.
>=20
> I'll then just pass the connector as the priv, which will be valid
> for the lifetime of the debugfs entry. This means there's no cleanup.

Connectors can be hotplugged, so they have a shorter (or equal) lifetime
than what drmm_kzalloc provides.

Maxime

--llbbhttkpl4ptwgh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCal9yBQAKCRAnX84Zoj2+
djbVAYDohBqoOi6dEtLX0bqbl0aljhsUfHcZC3fb1TYOgKURiRy5KZAGugxyJU5z
298gN1kBfiaVDF/Xr+lM6KrsiLuapmElClTOMC4p9EsWGzz4+YFIiSurQylDLoP7
p4g1IkjsHg==
=Tmw5
-----END PGP SIGNATURE-----

--llbbhttkpl4ptwgh--

