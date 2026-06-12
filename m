Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0664CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 08:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPkdhlgzPHHsct9ezuzkSQahztwh9VczlulLvUBbC1M=; b=OOMzMmEtvZ79mDULw+Z0Wbj6VW
	vUTiIYam6bAJJF7DjHkT+4xwur1nNJr/bvi3CAlLLDbyOSIDSjKTWkQDnBkU2f7dNDtHnX6aWwyFu
	wPvGLYSR17KgInT7cGvIdrjgKHTzTEDVhl4c9rxq1AcHaSh0a9RRT+7sK1qxXxbm7EZ/M5IRCCpU5
	PVnELxFG7vRUlt7tcUgTRQLf9mQzIoWksBBZKEKxI7QRSno3wpDjtkY2HBIacMcIeazraiWc6PFNc
	hGahO3NcVHup+pncz21g8pFOA9zNrNCZmYQKKv2WDdnVbtVStys452EC2WeY7cnKQ/k8aoM1cfPKa
	R6ZV/CVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxd6-0000000AcZv-0gGF;
	Fri, 12 Jun 2026 08:52:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxd5-0000000AcZg-2Mzq;
	Fri, 12 Jun 2026 08:52:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BF1B66001D;
	Fri, 12 Jun 2026 08:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0521F1F000E9;
	Fri, 12 Jun 2026 08:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781254362;
	bh=TPkdhlgzPHHsct9ezuzkSQahztwh9VczlulLvUBbC1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fnzI4Pi50orwHTMhV/ElwoVGbT2CuXdGZbLIbpI2f2mYiWzkBxxKgvbrGDKyxKfQz
	 B+xAoWfzeGMboDHMW51JUXHnS9xXolBzAP2iP0tE/CX3pBqA1qIJ1sheqwYbcjY8iN
	 IBLlE0ReenW2dD5tk1xezEq2z4OujuFVyVk4m1+YUMERXvrRPwLLcawPZAuEydThf+
	 LbRTb8470Ps0M2GyzLNIGBuh4EHF4QdBhPuzZdfsa5MRaMqcY254TTinnx/D906VTL
	 XfhmZupO8q0JKg+I60oQCrFwPnKHxUtoLRzgvjaEf6Qiv7toDcyUe50LH1uHi+MKZr
	 +ZZI/hhHKMEwg==
Date: Fri, 12 Jun 2026 10:52:38 +0200
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
Subject: Re: [PATCH v7 11/30] drm/display: bridge_connector: Wire up HDMI 2.0
 scrambler callbacks
Message-ID: <20260612-attractive-dashing-mule-309598@houat>
References: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
 <20260602-dw-hdmi-qp-scramb-v7-11-445eb54ee1ed@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="n3vxqpt35grsghxl"
Content-Disposition: inline
In-Reply-To: <20260602-dw-hdmi-qp-scramb-v7-11-445eb54ee1ed@collabora.com>
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


--n3vxqpt35grsghxl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 11/30] drm/display: bridge_connector: Wire up HDMI 2.0
 scrambler callbacks
MIME-Version: 1.0

On Tue, Jun 02, 2026 at 01:44:11AM +0300, Cristian Ciocaltea wrote:
> Connect the bridge connector's .scrambler_{enable|disable} callbacks to
> the underlying bridge's .hdmi_scrambler_{enable|disable} funcs when
> DRM_BRIDGE_OP_HDMI_SCRAMBLER is advertised.
>=20
> This completes the bridge connector plumbing so that the SCDC
> scrambling helpers can control source-side scrambling through the
> bridge chain.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 41 ++++++++++++++++++++=
+++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> index 9d21b1b57b0d..d048ab49eade 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -555,6 +555,32 @@ static int drm_bridge_connector_write_spd_infoframe(=
struct drm_connector *connec
>  	return bridge->funcs->hdmi_write_spd_infoframe(bridge, buffer, len);
>  }
> =20
> +static int drm_bridge_connector_scrambler_enable(struct drm_connector *c=
onnector)
> +{
> +	struct drm_bridge_connector *bridge_connector =3D
> +		to_drm_bridge_connector(connector);
> +	struct drm_bridge *bridge;
> +
> +	bridge =3D bridge_connector->bridge_hdmi;
> +	if (!bridge)
> +		return -EINVAL;
> +
> +	return bridge->funcs->hdmi_scrambler_enable(bridge);
> +}
> +
> +static int drm_bridge_connector_scrambler_disable(struct drm_connector *=
connector)
> +{
> +	struct drm_bridge_connector *bridge_connector =3D
> +		to_drm_bridge_connector(connector);
> +	struct drm_bridge *bridge;
> +
> +	bridge =3D bridge_connector->bridge_hdmi;
> +	if (!bridge)
> +		return -EINVAL;
> +
> +	return bridge->funcs->hdmi_scrambler_disable(bridge);
> +}
> +
>  static const struct drm_edid *
>  drm_bridge_connector_read_edid(struct drm_connector *connector)
>  {
> @@ -580,7 +606,7 @@ static const struct drm_connector_hdmi_funcs drm_brid=
ge_connector_hdmi_funcs =3D {
>  		.clear_infoframe =3D drm_bridge_connector_clear_hdmi_infoframe,
>  		.write_infoframe =3D drm_bridge_connector_write_hdmi_infoframe,
>  	},
> -	/* audio, hdr_drm and spd are set dynamically during init */
> +	/* scrambler, audio, hdr_drm and spd are set dynamically during init */
>  };
> =20
>  static const struct drm_connector_infoframe_funcs drm_bridge_connector_h=
dmi_audio_infoframe =3D {
> @@ -886,6 +912,11 @@ struct drm_connector *drm_bridge_connector_init(stru=
ct drm_device *drm,
>  			     !bridge->funcs->hdmi_clear_spd_infoframe))
>  				return ERR_PTR(-EINVAL);
> =20
> +			if (bridge->ops & DRM_BRIDGE_OP_HDMI_SCRAMBLER &&
> +			    (!bridge->funcs->hdmi_scrambler_enable ||
> +			     !bridge->funcs->hdmi_scrambler_disable))
> +				return ERR_PTR(-EINVAL);
> +
>  			bridge_connector->bridge_hdmi =3D drm_bridge_get(bridge);
> =20
>  			if (bridge->supported_formats)
> @@ -990,6 +1021,14 @@ struct drm_connector *drm_bridge_connector_init(str=
uct drm_device *drm,
>  			bridge_connector->hdmi_funcs.spd =3D
>  				drm_bridge_connector_hdmi_spd_infoframe;
> =20
> +		if (bridge_connector->bridge_hdmi->ops & DRM_BRIDGE_OP_HDMI_SCRAMBLER)=
 {
> +			bridge_connector->hdmi_funcs.scrambler_enable =3D
> +				drm_bridge_connector_scrambler_enable;
> +			bridge_connector->hdmi_funcs.scrambler_disable =3D
> +				drm_bridge_connector_scrambler_disable;
> +			connector->hdmi.scrambler_supported =3D true;
> +		}
> +

I think we're taking this backwards. The scrambler support isn't
optional: either the controller supports HDMI < 2.0, and then it doesn't
exist, or it supports >=3D 2.0 and then it's mandatory.

You're considering it optional here, when it's never actually optional
(unlike YUV420 for example)

I still think we should list, somehow, the capabilities of the
controller to the helpers, like max tmds rate supported, formats, etc.
We've so far put everything as an argument to drmm_connector_hdmi_init
but it becomes a bit overloaded, and I wonder if introducing a callback
wouldn't solve this, kind of like what we have for planes and formats.

Maxime

--n3vxqpt35grsghxl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaivI1gAKCRAnX84Zoj2+
djIfAX4gl/jF11O1U0ipeE3tq/q2Sw/0AAkRlpfSHPqNctwzsSxvOTiUiwPjtCQz
g6B1o6cBgIlXb4HKuDws04ZRr/4a69WIrsit4rx0g7J3HAYwwOScp4GwzYIKWTP0
ePF52hyZCw==
=gRuq
-----END PGP SIGNATURE-----

--n3vxqpt35grsghxl--

