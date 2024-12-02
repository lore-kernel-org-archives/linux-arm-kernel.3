Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110B1D7831B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 13:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Bs2gmzI61vXNTySLLBELCZ6xPM2Ob2Cd1w6oJspTio=; b=JSL5Rfy34GVO49zLHHIRhtGe7W
	J8uek2Jfeg+5/VP9QmU2J3CR9CGY46c7HRcT87KSF8dMltj+n43/y0GMmQQXZ05R6Gbzi3I/SvXBN
	+ABaP9Er3/RU3RPvR6JHspuZmf+vKaQh9fnHFqHkGQ/w/5pKg1jz0TKRxgdZMro3j26NoKF+YsAau
	frUe9IAjoRJSHbw99X1sgAvRh1GU2kar3Qf2jaSSFqtDPPCFZ0lo394mWz82M37Ae65/iKOvv8N4z
	758Ehf6Yhu65EYkrvdKRlnsa+6D6yCz6m7a9D7Yc4udkCtHoKmA4vH5arOUipOkgs73CiBAXt2Q9k
	plC+xoAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6NK-00000006Dz2-2nyh;
	Mon, 02 Dec 2024 13:22:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6LQ-00000006DZv-24LU;
	Mon, 02 Dec 2024 13:20:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 30F96A40CDD;
	Mon,  2 Dec 2024 13:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1A8C4CED1;
	Mon,  2 Dec 2024 13:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733145607;
	bh=cuZbfqLYHQS/1GAYDtMRKOLhWIMgYEMtvry7OBgUlJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ja5YJfKEpMZVqAcOsS9VwFVxwUPlCtxVzQl7ZDIXMcG5Uy68wX2q1TO2zHiwZoQFL
	 sRrfDQnF5zYJ0gHNjVcRFjWI/RnxfDTcpDBBmQLctpbWmYRKw8ULXNPvoUg3Oqb0kU
	 6hDfNE4K9dlvEMuybzZuqcYUB0zUguLdKl1WYSw8JqR4KE3ddWPCyk6yn8CvNEUJG7
	 IX2wJi4MAwL6VD0MV7GUCkuK6LCHXZnVHQqt/gV5E8fyfqojj0Q65QrLyTFYK5SCC0
	 mwuj+l01dIHDSqYN3IDMM+mXb0cZibWBU9+v3hRepcooVifZKL5QSpm2Aaa38U5TVb
	 sNdiloTWDun/g==
Date: Mon, 2 Dec 2024 14:20:04 +0100
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
Subject: Re: [PATCH v5 8/9] drm/vc4: hdmi: switch to using generic HDMI Codec
 infrastructure
Message-ID: <20241202-industrious-unnatural-beagle-7da5d4@houat>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-8-b5316e82f61a@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="vbtgu33lsjanu5xg"
Content-Disposition: inline
In-Reply-To: <20241201-drm-bridge-hdmi-connector-v5-8-b5316e82f61a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_052008_657626_0C020124 
X-CRM114-Status: GOOD (  20.12  )
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


--vbtgu33lsjanu5xg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 8/9] drm/vc4: hdmi: switch to using generic HDMI Codec
 infrastructure
MIME-Version: 1.0

Hi,

Sorry, I've been drowning under work and couldn't review that series before.

I'll review the driver API for now, and we can focus on the exact
implementation later on.

On Sun, Dec 01, 2024 at 02:44:12AM +0200, Dmitry Baryshkov wrote:
> Drop driver-specific implementation and use the generic HDMI Codec
> framework in order to implement the HDMI audio support.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 68 ++++++++++--------------------------=
------
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  2 --
>  2 files changed, 15 insertions(+), 55 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 7295834e75fb1ab0cd241ed274e675567e66870b..d0a9aff7ad43016647493263c=
00d593296a1e3ad 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -595,6 +595,9 @@ static int vc4_hdmi_connector_init(struct drm_device =
*dev,
>  	if (vc4_hdmi->variant->supports_hdr)
>  		max_bpc =3D 12;
> =20
> +	connector->hdmi_codec.max_i2s_channels =3D 8;
> +	connector->hdmi_codec.i2s =3D 1;
> +

I guess it's a similar discussion than we had with HDMI2.0+ earlier
today, but I don't really like initializing by structs. Struct fields
are easy to miss, and can be easily uninitialized by mistake.

I think I'd prefer to have them as argument to the init function. And if
they are optional, we can explicitly mark them as unused.

Like, it looks like the get_dai_id implementation relies on it being set
to < 0 for it to be ignored, but it's not here, so I'd assume it's used
with an ID of 0, even though the driver didn't support get_dai_id so
far?

Maxime

--vbtgu33lsjanu5xg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ02z/QAKCRAnX84Zoj2+
dpzbAYDixtv7TbkB/8hZMKjc8sAQyzE2ixGhzfLm1/mizfxI+p8zsxyz2xkCmeAU
CvjfI6UBgKALmNU3qiLez7ENeyLRh+cvBGhV2M7F3LMKGHgUca3NdOUGKZ2Ss9j2
Qw//3ctIIw==
=RzH8
-----END PGP SIGNATURE-----

--vbtgu33lsjanu5xg--

