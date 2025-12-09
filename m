Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A769D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 14:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JoYkHKkBVptzyMrFOI4jLFCkTe+D/kqhjhWd63pMIo=; b=3DVrlzpInzEL3WfO9BaqG5XVH3
	GpksDuzPWzl3HBW9AjKmTPiFzupjIAtOEpjNFlvxh7KwjZyF1k+etwfmyAe8hh+Rtqu535PqO5DLT
	H8AXeBI3O6u2CmE08qB1K/VlB3m/BPnLdMwqa2QAsRvdjQiNdz+rXa4e+gc5fkHsgrlTq8lBzFPqf
	YRaVgwak6M3wKWIpVmitJ/Q9595JBaGfKkmFJLHieU1uYx1Dxz7Jvc4A714l11Ct8og+lYt9s6Fm1
	5vE1BpLpatdGlt/WLdsvzbm4lcXIiW0aTYDCGW+nLtjRK8D+pcaaGqehXw/iDa72ubU9YNoH+kKXS
	9IsOePhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSygg-0000000EP7O-2COi;
	Tue, 09 Dec 2025 14:27:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSygd-0000000EP6s-46dv;
	Tue, 09 Dec 2025 14:27:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7476843A63;
	Tue,  9 Dec 2025 14:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0555C4CEF5;
	Tue,  9 Dec 2025 14:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765290451;
	bh=+lPRgnywG6DZojNgtg/w1EUgAWRizPCecjzEhDomM3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SRtov+UnCMmffLoCrIS4i3rDRT4jcz+QLcw3NrHCLRnXPGNf1byxWeiSl2eogVxma
	 r+raXHakZJMJsgoqW9kr6R9waCWB6qY/4XMqZcOj4R6RjgNeuWG+f2Lm9aEZlBfUCw
	 KLHcoeYAyfv8VBvC9vYuxQvaoIWXIALfwKGFIp9wbP+aZFbbiHk/6IPUm6K/i5QmoX
	 kKf3umBTwAhvT4a0ULSXFhXNQgEkVkbKlGKh2mWA+megTCQe8ul02RMn63lBaCpYrr
	 He+mCx0tE1uAYY/8j8ydJaUSmAqRiF+FASTPOsNDzACALIBR0q/Gpm7h9RqDKk1dFh
	 ZKfL+LRCT6e9A==
Date: Tue, 9 Dec 2025 15:27:28 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Dmitry Baryshkov <lumag@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v5 04/17] drm/bridge: Act on the DRM color format property
Message-ID: <20251209-smart-oarfish-of-wind-0c1c8b@houat>
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
 <20251128-color-format-v5-4-63e82f1db1e1@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="6swa32l4wvcewsqj"
Content-Disposition: inline
In-Reply-To: <20251128-color-format-v5-4-63e82f1db1e1@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_062732_077855_55EF1E5B 
X-CRM114-Status: GOOD (  22.81  )
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


--6swa32l4wvcewsqj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 04/17] drm/bridge: Act on the DRM color format property
MIME-Version: 1.0

Hi,

On Fri, Nov 28, 2025 at 10:05:40PM +0100, Nicolas Frattaroli wrote:
> The new DRM color format property allows userspace to request a specific
> color format on a connector. In turn, this fills the connector state's
> color_format member to switch color formats.
>=20
> Make drm_bridges consider the color_format set in the connector state
> during the atomic bridge check. Specifically, reject any output bus
> formats that do not correspond to the requested color format.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 45 ++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 45 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 8f355df883d8..8aac9747f35e 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1052,6 +1052,47 @@ static int select_bus_fmt_recursive(struct drm_bri=
dge *first_bridge,
>  	return ret;
>  }
> =20
> +static bool __pure bus_format_is_color_fmt(u32 bus_fmt, enum drm_color_f=
ormat fmt)
> +{
> +	if (fmt =3D=3D DRM_COLOR_FORMAT_AUTO)
> +		return true;
> +
> +	switch (bus_fmt) {
> +	case MEDIA_BUS_FMT_FIXED:
> +		return true;
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_RGB101010_1X30:
> +	case MEDIA_BUS_FMT_RGB121212_1X36:
> +	case MEDIA_BUS_FMT_RGB161616_1X48:
> +		return fmt =3D=3D DRM_COLOR_FORMAT_RGB444;
> +	case MEDIA_BUS_FMT_YUV8_1X24:
> +	case MEDIA_BUS_FMT_YUV10_1X30:
> +	case MEDIA_BUS_FMT_YUV12_1X36:
> +	case MEDIA_BUS_FMT_YUV16_1X48:
> +		return fmt =3D=3D DRM_COLOR_FORMAT_YCBCR444;
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +	case MEDIA_BUS_FMT_VYUY8_1X16:
> +	case MEDIA_BUS_FMT_YUYV8_1X16:
> +	case MEDIA_BUS_FMT_YVYU8_1X16:
> +	case MEDIA_BUS_FMT_UYVY10_1X20:
> +	case MEDIA_BUS_FMT_YUYV10_1X20:
> +	case MEDIA_BUS_FMT_VYUY10_1X20:
> +	case MEDIA_BUS_FMT_YVYU10_1X20:
> +	case MEDIA_BUS_FMT_UYVY12_1X24:
> +	case MEDIA_BUS_FMT_VYUY12_1X24:
> +	case MEDIA_BUS_FMT_YUYV12_1X24:
> +	case MEDIA_BUS_FMT_YVYU12_1X24:
> +		return fmt =3D=3D DRM_COLOR_FORMAT_YCBCR422;
> +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> +	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
> +	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
> +		return fmt =3D=3D DRM_COLOR_FORMAT_YCBCR420;
> +	default:
> +		return false;
> +	}
> +}
> +
>  /*
>   * This function is called by &drm_atomic_bridge_chain_check() just befo=
re
>   * calling &drm_bridge_funcs.atomic_check() on all elements of the chain.
> @@ -1137,6 +1178,10 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm=
_bridge *bridge,
>  	}
> =20
>  	for (i =3D 0; i < num_out_bus_fmts; i++) {
> +		if (!bus_format_is_color_fmt(out_bus_fmts[i], conn_state->color_format=
)) {
> +			ret =3D -ENOTSUPP;
> +			continue;
> +		}

Sorry, I'm struggling a bit to understand how this would work if a bridge b=
oth supports the bus
format selection and HDMI state helpers? Can you expand on it?

Maxime

--6swa32l4wvcewsqj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaTgx0AAKCRAnX84Zoj2+
dn+pAXoCEBIzb4PrpgMd2asQag4DZBJm2omA/DY2ArLCM7xiNnTD+fG+t5BxdhGx
GQRfoUIBfAgis2VsEMDW4zY+ZyEGiWuYG8gnFhPFvpM4lZ57Re+WJ6smQKDAUbwk
gtuqKr0cjA==
=HGyp
-----END PGP SIGNATURE-----

--6swa32l4wvcewsqj--

