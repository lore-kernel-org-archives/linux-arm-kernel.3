Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D06E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjo6g0AkvNUOlyYjXBaQDqnzWjCUgSNKMxLQ025JeNc=; b=FGKP6Q22SSoxbGLEntcJQz8HJD
	VOzo+JvujsgvB6aAL89jfWAsktbmaZtD/MoSq3cthb8aBosdQwa0nxIZMulH9LIxeg4gffTy3bvtP
	4VoRn/wW284wzjt+3eVFtr+B/MUgDTtR4QowFsA8EoA9wNYwrSgNg3jzZXpXUNXJz/WbOrdhiJsvO
	yn8v1TZqQ9wCnegHr9AN242OTQ0CK3J9h/GA+BS/cEFc48yYpOyDJT6zsNqtaGGNjo46StWHJiNWf
	csXjGUj/I6h2tdBifHq/ZJtxPr91+8Kbb5K03gwBzXHa3sBJdYJjE84AZHNVPbl42Skz8MW7WQRrS
	uQV7nuDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFlz-0000000AxXh-1rJC;
	Mon, 16 Dec 2024 18:24:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEgA-0000000Ajh9-3CLm;
	Mon, 16 Dec 2024 17:14:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06AFEA418F4;
	Mon, 16 Dec 2024 17:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C81C4CED0;
	Mon, 16 Dec 2024 17:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734369285;
	bh=gSmxdiZIDJu8BiwcPOPmdFwY35K+Q89CNQo+hWjcaBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hQHCHQzd7ZPIab39Ofnd+yXIC4ls5Sg800JevG7+xsIAlI5/TSS8iZD8gBLSm+9C2
	 JYycOcmN5xNLB6YWaiULVIf49/1INTM9Yy3QYPrJ0f2XaiRWXOJtBeHR96T7ar1k9m
	 MQTAKU0UkGhpNiwmODYRvxOxjF0c7YdtvUSpMtswW0Ap4N3E0Gb02OS0ftC986pvEM
	 gT6r2hlcQQWyNBsLSkCXJMIsUlm7UEoD2d+l8a8zVS2NlhjBa0Tr087/RROUBQRtp6
	 j8cO5tnt5lwpEAfKOGfC2QNiqlfdta5JMk/eS/+3crxOYye9wiuiNZ5M896vJYb1+M
	 qumZBJPpZFwmA==
Date: Mon, 16 Dec 2024 18:14:43 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Phong LE <ple@baylibre.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 04/10] drm/bridge: connector: add support for HDMI
 codec framework
Message-ID: <20241216-benign-amiable-grebe-e0b3e1@houat>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-4-50dc145a9c06@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="h3bq7alicyplnrqd"
Content-Disposition: inline
In-Reply-To: <20241206-drm-bridge-hdmi-connector-v6-4-50dc145a9c06@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_091446_945709_3B5C3A02 
X-CRM114-Status: GOOD (  22.41  )
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


--h3bq7alicyplnrqd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 04/10] drm/bridge: connector: add support for HDMI
 codec framework
MIME-Version: 1.0

On Fri, Dec 06, 2024 at 12:15:58PM +0200, Dmitry Baryshkov wrote:
> Add necessary glue code to be able to use new HDMI codec framework from
> the DRM bridge drivers. The drm_bridge implements a limited set of the
> hdmi_codec_ops interface, with the functions accepting both
> drm_connector and drm_bridge instead of just a generic void pointer.
>=20
> This framework is integrated with the DRM HDMI Connector framework, but
> can also be used for DisplayPort connectors.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 100 +++++++++++++++++++=
+++++-
>  include/drm/drm_bridge.h                       |  38 ++++++++++
>  2 files changed, 134 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> index 512ced87ea18c74e182a558a686ddd83de891814..4fa1bb73d430d02d5b79a1a18=
4c203ec9e9c66e7 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -21,6 +21,8 @@
>  #include <drm/display/drm_hdmi_helper.h>
>  #include <drm/display/drm_hdmi_state_helper.h>
> =20
> +#include <sound/hdmi-codec.h>
> +
>  /**
>   * DOC: overview
>   *
> @@ -368,10 +370,80 @@ static int drm_bridge_connector_write_infoframe(str=
uct drm_connector *connector,
>  	return bridge->funcs->hdmi_write_infoframe(bridge, type, buffer, len);
>  }
> =20
> +static int drm_bridge_connector_audio_startup(struct drm_connector *conn=
ector)
> +{
> +	struct drm_bridge_connector *bridge_connector =3D
> +		to_drm_bridge_connector(connector);
> +	struct drm_bridge *bridge;
> +
> +	bridge =3D bridge_connector->bridge_hdmi;
> +	if (!bridge)
> +		return -EINVAL;
> +
> +	if (bridge->funcs->hdmi_codec_audio_startup)
> +		return bridge->funcs->hdmi_codec_audio_startup(connector, bridge);
> +	else
> +		return 0;
> +}

Nit: it looks like you return in other cases, and there's no need for
that else.

I'd remove the else.

Looks good otherwise, once fixed
Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--h3bq7alicyplnrqd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2BgAgAKCRAnX84Zoj2+
diFoAYCKbrWMG5n+5jqP+LBnOpHQztpGr0fb/9SiSABc8x5qqhuNZ2mnrkin14cR
DBnqLSoBgLO7VEPgbZZDR4NjbELbuh+1PGlUqiaaajox0mSG5OXJFXoEo+liaS9G
zmiTmODHlw==
=LiWN
-----END PGP SIGNATURE-----

--h3bq7alicyplnrqd--

