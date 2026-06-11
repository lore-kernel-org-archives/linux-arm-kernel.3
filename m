Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20E1CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 15:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhFLm71X92FL118QA8FEpaxBUkL83s1nkTgYywytZos=; b=nKMvenjrHzuTc6gy6hhQe2h7hr
	3VsGGDAcC0luZ5gbwJbU5yYBlIpK6eN0s926VuOfKRPZ7RwGuKA1XthgK865hsoObzVMSlst5U/G8
	qJ5Q79Wjs3VGw73C/IHECfnSqBKorSRM6HokX1we8N3elVYmJ5ew0IbODhh2D9xmQfZOAOd1BmQfU
	zboj/p2+Thqj6yCOVKeJlZD2l3jjeV+7c9bqDmPVCEUUbXKId/WT6ooqfWXGSuzbZ8OM5kqIWRVly
	nxDqDkfdleJIg0F8J6XcTgj0vn0DUazeLmbS3XOnb3BvDwYV/K/a2yQblZu8xN/ccL1eUodIYNK2k
	+i1965sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhHy-00000009g3Z-0Gow;
	Thu, 11 Jun 2026 15:25:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhHw-00000009g3L-3EgK;
	Thu, 11 Jun 2026 15:25:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 02FB16001A;
	Thu, 11 Jun 2026 15:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B8A1F00893;
	Thu, 11 Jun 2026 15:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781191547;
	bh=mhFLm71X92FL118QA8FEpaxBUkL83s1nkTgYywytZos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FVoJktWRB4BpBFjzq6/mujqQLGVtrI0ZHlTxMtXCKnFo7w+N16/OHcMSQ8zDW2Num
	 RubUYyYFUfjqwbPXbo18frl4f/oatqGS6kKjSAE9CkmJcyuqkJyo2YOYgn5PwRYIeS
	 N1XGVvmMcSPFtKTok2tzjnCHRx95MGJuZnclqYYgHL5JqiXaqac1MAeXSx/wB4hzdg
	 2QQsFlVNxOqPfuKMeyVTGWpi2q/zZ0abw/pP4zd1fKakWuEggGKJBlq8ZjG6TNviWw
	 r6RgDGhQzvu0Omf5nGXOzNXiVO1WiVTUODo7WuC+p1Gn+9CygSg06gcNICkMGZvTqp
	 pRDEpI+v9gJtQ==
Date: Thu, 11 Jun 2026 17:25:45 +0200
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
Subject: Re: [PATCH v7 05/30] drm/display: hdmi_state_helper: Add ctx-aware
 hotplug helper for SCDC sync
Message-ID: <20260611-refined-idealistic-sunfish-3df3a4@houat>
References: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
 <20260602-dw-hdmi-qp-scramb-v7-5-445eb54ee1ed@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="gjbiabifu3smofwv"
Content-Disposition: inline
In-Reply-To: <20260602-dw-hdmi-qp-scramb-v7-5-445eb54ee1ed@collabora.com>
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


--gjbiabifu3smofwv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 05/30] drm/display: hdmi_state_helper: Add ctx-aware
 hotplug helper for SCDC sync
MIME-Version: 1.0

On Tue, Jun 02, 2026 at 01:44:05AM +0300, Cristian Ciocaltea wrote:
> Introduce drm_atomic_helper_connector_hdmi_hotplug_ctx(), a variant of
> drm_atomic_helper_connector_hdmi_hotplug() that accepts a
> drm_modeset_acquire_ctx.
>=20
> This enables SCDC status synchronization on hotplug events, which
> requires lock acquisition context for performing the CRTC reset
> triggered by drm_scdc_sync_status().
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 40 +++++++++++++++++++=
+-----
>  include/drm/display/drm_hdmi_state_helper.h     |  4 +++
>  2 files changed, 37 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index a331ebdd65af..a96d81cbf94f 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -12,6 +12,7 @@
>  #include <drm/display/drm_hdmi_cec_helper.h>
>  #include <drm/display/drm_hdmi_helper.h>
>  #include <drm/display/drm_hdmi_state_helper.h>
> +#include <drm/display/drm_scdc_helper.h>
> =20
>  /**
>   * DOC: hdmi helpers
> @@ -1150,18 +1151,20 @@ drm_atomic_helper_connector_hdmi_clear_audio_info=
frame(struct drm_connector *con
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
> =20
> -static void
> +static int
>  drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
> -					enum drm_connector_status status)
> +					enum drm_connector_status status,
> +					struct drm_modeset_acquire_ctx *ctx)
>  {
>  	const struct drm_edid *drm_edid;
> +	int ret =3D 0;
> =20
>  	if (status =3D=3D connector_status_disconnected) {
> -		// TODO: also handle scramber, HDMI sink disconnected.
> +		ret =3D drm_scdc_sync_status(connector, false, ctx);
>  		drm_connector_hdmi_audio_plugged_notify(connector, false);
>  		drm_edid_connector_update(connector, NULL);
>  		drm_connector_cec_phys_addr_invalidate(connector);
> -		return;
> +		return ret;
>  	}
> =20
>  	if (connector->hdmi.funcs->read_edid)
> @@ -1174,10 +1177,12 @@ drm_atomic_helper_connector_hdmi_update(struct dr=
m_connector *connector,
>  	drm_edid_free(drm_edid);
> =20
>  	if (status =3D=3D connector_status_connected) {
> -		// TODO: also handle scramber, HDMI sink is now connected.
> +		ret =3D drm_scdc_sync_status(connector, true, ctx);
>  		drm_connector_hdmi_audio_plugged_notify(connector, true);
>  		drm_connector_cec_phys_addr_set(connector);
>  	}
> +
> +	return ret;
>  }
> =20
>  /**
> @@ -1191,10 +1196,31 @@ drm_atomic_helper_connector_hdmi_update(struct dr=
m_connector *connector,
>  void drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *conn=
ector,
>  					      enum drm_connector_status status)
>  {
> -	drm_atomic_helper_connector_hdmi_update(connector, status);
> +	drm_atomic_helper_connector_hdmi_update(connector, status, NULL);
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug);
> =20
> +/**
> + * drm_atomic_helper_connector_hdmi_hotplug_ctx - Handle the hotplug eve=
nt for the HDMI connector
> + * @connector: A pointer to the HDMI connector
> + * @status: Connection status
> + * @ctx: Lock acquisition context to be used for resetting CRTC
> + *
> + * This function should be called as a part of the .detect() / .detect_c=
tx()
> + * callbacks for all status changes.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + * If @ctx is set, it might also return -EDEADLK.
> + */
> +int drm_atomic_helper_connector_hdmi_hotplug_ctx(struct drm_connector *c=
onnector,
> +						 enum drm_connector_status status,
> +						 struct drm_modeset_acquire_ctx *ctx)
> +{
> +	return drm_atomic_helper_connector_hdmi_update(connector, status, ctx);
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug_ctx);
> +
>  /**
>   * drm_atomic_helper_connector_hdmi_force - HDMI Connector implementatio=
n of the force callback
>   * @connector: A pointer to the HDMI connector
> @@ -1206,6 +1232,6 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotp=
lug);
>   */
>  void drm_atomic_helper_connector_hdmi_force(struct drm_connector *connec=
tor)
>  {
> -	drm_atomic_helper_connector_hdmi_update(connector, connector->status);
> +	drm_atomic_helper_connector_hdmi_update(connector, connector->status, N=
ULL);
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_force);
> diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/di=
splay/drm_hdmi_state_helper.h
> index 13375bd0f4ae..75fedd4a3ba8 100644
> --- a/include/drm/display/drm_hdmi_state_helper.h
> +++ b/include/drm/display/drm_hdmi_state_helper.h
> @@ -7,6 +7,7 @@ struct drm_atomic_commit;
>  struct drm_connector;
>  struct drm_connector_state;
>  struct drm_display_mode;
> +struct drm_modeset_acquire_ctx;
>  struct hdmi_audio_infoframe;
> =20
>  enum drm_connector_status;
> @@ -24,6 +25,9 @@ int drm_atomic_helper_connector_hdmi_update_infoframes(=
struct drm_connector *con
>  						       struct drm_atomic_commit *state);
>  void drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *conn=
ector,
>  					      enum drm_connector_status status);
> +int drm_atomic_helper_connector_hdmi_hotplug_ctx(struct drm_connector *c=
onnector,
> +						 enum drm_connector_status status,
> +						 struct drm_modeset_acquire_ctx *ctx);

There's not a lot of users, so I'd prefer if we were just changing the
prototype of drm_atomic_helper_connector_hdmi_hotplug()

Maxime

--gjbiabifu3smofwv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCairTagAKCRAnX84Zoj2+
dsYXAX9HanpXkiMI5tOPJUZC7je0MQw3xTc6fBIEQJvGlvqrcMcKcMe8FoWPDcgx
94KD2aoBgOPv4oXQWtkqDBZedZI5wKgHmkMBRWVz/5E+nvZwPFbJ+olpEqBo4c3w
IAVzRl2XUg==
=tkXr
-----END PGP SIGNATURE-----

--gjbiabifu3smofwv--

