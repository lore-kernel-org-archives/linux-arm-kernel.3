Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF52C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 08:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMTmIVVAV0WmbjCuxhFNMHkuv6fXx2hzsnZMAGVvYWQ=; b=TILRWWFAKot7mKaihNC2qoIz6t
	R23WW5rD1XFnLPHhsN5ECT/KwLY3mrouMl1Fgu8cagGFN/NUP3NYJNZEdziWPxXqKXdBIz5DrnJlS
	qPlqrJ3GcoxwdMdQ9o2Swro8OYMlkKPfIh5CUC05YBFnw3LNyK2Bs+AXuan+4rwOyj5szi5Ps1gNN
	zatixCIuGX0QMeL7owlEZmx7UnGftv0YE+HTBHE+/3wdfIKxWiVGTO76VPzn/+xDNpHGoISYg/ugI
	Ty2VJW+GcHO5MSVf8CNl0xde1Ga2eCTcj965pl7mawoTKMMgRVysqXvVYH0AMdUEFiDs6m4DJ5i0q
	PwGcJe8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyWa-0000000BCKY-3v1s;
	Thu, 20 Aug 2026 08:53:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyWZ-0000000BCKO-1kj2;
	Thu, 20 Aug 2026 08:53:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8230960A6E;
	Thu, 20 Aug 2026 08:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD541F000E9;
	Thu, 20 Aug 2026 08:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787216002;
	bh=pMTmIVVAV0WmbjCuxhFNMHkuv6fXx2hzsnZMAGVvYWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ebpoa054yVk5qC6s1kUafg5ihJLbX7Uxj7uDom86w6i63STFYV901vYQYM+ScP7nO
	 GiQA1XYKUcfOdwvPAWD5rbJ/jZTaT6llynKFG+d2Rs9pXDfR/6QH5mmliOS4GbQ5Qm
	 0sJOJCeyaKjZRbsUD4dskD/SXM/E53W57J4H+TOTyU73gy8wdEVCD2GROGJ7PtJ7lw
	 CoQPv0Uza6w6P4RhX8W+wO6WR/A1EgSw8HkyQ8l/M87Uwxo4mmvLDp1qx0kgKP+WYc
	 wUt7Cu9g88ooxpeCopWIDwc5xwBoU64IRzXdUrh0YczmZ4wLddkq4nuKrTY4anXJip
	 U1uWB3EF2QE9A==
Date: Thu, 20 Aug 2026 10:53:19 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
	Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, Phong LE <ple@baylibre.com>, 
	kernel@collabora.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	Maud Spierings <maud_spierings@hotmail.com>, Diederik de Haas <diederik@cknow-tech.com>
Subject: Re: [PATCH v10 22/69] drm/display: hdmi-state-helper: Sync SCDC
 state on hotplug
Message-ID: <20260820-accomplished-curly-bandicoot-cc36ba@houat>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
 <20260731-dw-hdmi-qp-scramb-v10-22-294364b2cf15@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3vbhipdczwkvmxnj"
Content-Disposition: inline
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-22-294364b2cf15@collabora.com>
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


--3vbhipdczwkvmxnj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 22/69] drm/display: hdmi-state-helper: Sync SCDC
 state on hotplug
MIME-Version: 1.0

On Fri, Jul 31, 2026 at 07:19:29PM +0300, Cristian Ciocaltea wrote:
> drm_atomic_helper_connector_hdmi_hotplug() does not currently
> synchronize SCDC status on hotplug events, leaving the scrambler state
> potentially inconsistent after (re)connect.
>=20
> Hook drm_connector_hdmi_sync_scdc() into both the connect and disconnect
> paths, replacing the existing TODOs around missing scrambler handling.
>=20
> Tested-by: Maud Spierings <maud_spierings@hotmail.com>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, R=
ock 5B
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 23 ++++++++++++++-----=
----
>  1 file changed, 14 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 4a93c279c9a7..3377ea936120 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -1205,13 +1205,16 @@ drm_atomic_helper_connector_hdmi_update(struct dr=
m_connector *connector,
>  					enum drm_connector_status status)
>  {
>  	const struct drm_edid *drm_edid;
> +	int ret =3D 0;
> =20
>  	if (status =3D=3D connector_status_disconnected) {
> -		// TODO: also handle scramber, HDMI sink disconnected.
> -		drm_connector_hdmi_audio_plugged_notify(connector, false);
> -		drm_edid_connector_update(connector, NULL);
> -		drm_connector_cec_phys_addr_invalidate(connector);
> -		return 0;
> +		ret =3D drm_connector_hdmi_sync_scdc(connector, false, ctx);
> +		if (ret !=3D -EDEADLK) {
> +			drm_connector_hdmi_audio_plugged_notify(connector, false);
> +			drm_edid_connector_update(connector, NULL);
> +			drm_connector_cec_phys_addr_invalidate(connector);
> +		}

If there's a deadlock, shouldn't we restart the whole sequence there?
Ie, we should return ret all the time anyway? And if we do that, we
should return ret for drm_edid_connector_update() too.

Either way, a comment on why we're doing it this way would be nice.

Maxime

--3vbhipdczwkvmxnj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaobAewAKCRAnX84Zoj2+
dsmXAX9ZDU9lPiTQM27i5k7mRJDVntMtGwshaDMSDOnYE2AAllfcjI+ZdG0n6mHZ
R8zCkiIBfRWAvboi0YPym8+kt7BmG5tIQeVj0csBP/DfUERW2sf6oKOJGu9EZTzz
Mx2ECE+5xg==
=ZQWH
-----END PGP SIGNATURE-----

--3vbhipdczwkvmxnj--

