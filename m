Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641C2C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/xhApXRGPn7clD8y3P5VytmDnYwowqvXHINRt7ClEc=; b=mCE6LYm7+fG+HFKD5hLEKYiphi
	61evDvhC7qVJGo7jLFEJRNWmpeocJXPyM2DVmzr1gJmtxJg3yhiCaX31lvj/72WKZG2KI4XBYqPH0
	nHLvxe3T4rUHOjBDv4irJ5Ne9sswRTryg7aMc5UiiDNsy3iMyx/is7o/aTfWd+THLGlRBe8SJsYRA
	kpyvfnPuNbiZOLR1OBnAS9MGzOVsX7kOlt4YBAj9URVHm0HtD50UDmuRkb1sD8Rqbw4/ELd0LvtTS
	lqKM173gf3q8nxEfxxFFmCpLT7he3EqB7fdV0VSUSWC7slE7QQ3ANfM2y0KwN6iklXocEY5eSyHMH
	52i9DtDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuhW-0000000E7Cl-4Awq;
	Wed, 15 Jul 2026 08:10:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuhV-0000000E7CU-3AL6;
	Wed, 15 Jul 2026 08:10:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A88840930;
	Wed, 15 Jul 2026 08:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A981B1F000E9;
	Wed, 15 Jul 2026 08:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784103041;
	bh=Z/xhApXRGPn7clD8y3P5VytmDnYwowqvXHINRt7ClEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CLbnm4YUwC8z43j7tTTc6XRdLYOM+/u0cZRfRCDGIfVZiYYnB6k3LJrtrp/nf7vJN
	 vJk7YY5t52JAshQFal8KPJsM0EWSZR4XlK+id/Rba/SjzwVqQzrRX+ZqxL67JCudeC
	 dqCuSsjvFfIimjWPFZbuJejDQh47wfMrN4A7z7b8DSOaQX6hYViVpVBWARdRkIToGw
	 QI9UJSP6BHjmDNEvCp+KbrviAIaZdDkr2Ar4zh9Jg3XnptvfGHpxzJ9UEbz4jaUit2
	 yq9pGTldNnEWWjZxNl0sefKKMjzyu14uxYAhyAroZ3TA2SW44lFt9q/w3RZ8YFyg9w
	 Ho/FRY8Gy1FIw==
Date: Wed, 15 Jul 2026 10:10:39 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Daniel Stone <daniels@collabora.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v8 10/39] drm/display: hdmi-state-helper: Sync SCDC state
 on hotplug
Message-ID: <20260715-tactful-asparagus-chameleon-ac4bce@houat>
References: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
 <20260702-dw-hdmi-qp-scramb-v8-10-d79890d00b6a@collabora.com>
 <20260707-unique-carmine-cheetah-af2cb8@penduick>
 <05de7187-a7e9-4d69-8c65-cdbc30d21d33@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="fqxfk4mvmiv3wug4"
Content-Disposition: inline
In-Reply-To: <05de7187-a7e9-4d69-8c65-cdbc30d21d33@collabora.com>
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


--fqxfk4mvmiv3wug4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 10/39] drm/display: hdmi-state-helper: Sync SCDC state
 on hotplug
MIME-Version: 1.0

On Wed, Jul 08, 2026 at 02:21:11PM +0300, Cristian Ciocaltea wrote:
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >>  drivers/gpu/drm/display/drm_bridge_connector.c  |  3 ++-
> >>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 28 ++++++++++++++++=
+--------
> >>  drivers/gpu/drm/vc4/vc4_hdmi.c                  |  2 +-
> >>  include/drm/display/drm_hdmi_state_helper.h     |  6 ++++--
> >>  4 files changed, 26 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/=
gpu/drm/display/drm_bridge_connector.c
> >> index 796069dbf1a1..46104506fe32 100644
> >> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> >> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> >> @@ -221,7 +221,8 @@ drm_bridge_connector_detect(struct drm_connector *=
connector, bool force)
> >>  		status =3D detect->funcs->detect(detect, connector);
> >> =20
> >>  		if (hdmi)
> >> -			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
> >> +			drm_atomic_helper_connector_hdmi_hotplug(connector, status,
> >> +								 NULL);
> >> =20
> >>  		drm_bridge_connector_hpd_notify(connector, status);
> >>  	} else {
> >=20
> > We should move this one to detect_ctx to get the ctx passed and avoid
> > passing NULL here.
>=20
> We do this in patch 15.  Should I try to reorder?

Yes, it would make this part more obvious

[...]

> >>  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_force);
> >> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_=
hdmi.c
> >> index 74dce4be0c00..e165f604939b 100644
> >> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> >> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> >> @@ -375,7 +375,7 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdm=
i *vc4_hdmi,
> >>  	 * the lock for now.
> >>  	 */
> >> =20
> >> -	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
> >> +	drm_atomic_helper_connector_hdmi_hotplug(connector, status, NULL);
> >=20
> > vc4_hdmi_handle_hotplug has the context passed as an argument, we shoul=
d reuse it.
>=20
> The vc4 conversion (patch 31) removes vc4_hdmi_handle_hotplug() and calls
> drm_atomic_helper_connector_hdmi_hotplug() directly in
> vc4_hdmi_connector_detect_ctx(). =20
>=20
> I used NULL here to ensure there wouldn't be any race between the two sep=
arate
> SCDC state management implementations, but that can't happen at this point
> anyway (hdmi->scrambler_enabled isn't set by the driver).  So we can pass=
 the
> context if you prefer.

We still need this to be bisectable, so yeah, please do.

Thanks!
Maxime

--fqxfk4mvmiv3wug4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaldAfgAKCRAnX84Zoj2+
duCOAX4mC2BybrS86QY5hfU/OLpiJibCUqWcnH//jku5ko531rVvYK6Ni7ZWsIii
LsVxCkcBf1jAz1Pp7niL+/QB/TBJ8azHl9FV1vMooSy6ypmwpU/JTDCTT/6/SP5l
s6Tr24ONrQ==
=tXcD
-----END PGP SIGNATURE-----

--fqxfk4mvmiv3wug4--

