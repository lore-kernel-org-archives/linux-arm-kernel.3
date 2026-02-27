Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CA1FD5310
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 08:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVCcfwtAMoulozX0GhmWyuLyGfUUdKtlWPUtcenImII=; b=goMx4EsDfh4s433VuIAyp5MT7d
	tg+F/P69WotRf9C5fq2cus3l1IQtDz4m82bR78FofZlAxH+C24311vFNYJpam4sa2HDmN3/41r03s
	a//2s0U8M/SMVOO3JANGO+xSjmHqjGc8qK+EDIPOcv7QTvEZ1ESPXAa6mLX4TDW7iVkuyOjlgIjay
	1EUyTb6tyO3YsvKcBHW4JWKvUQCoI6R1kw/4vW5itdyw73khyF76R7UOZRbEvQhKZ7MJUI1r1SiCx
	sWgouOhUTURlrOYyCuJUgnpR0ZlMuGKtWpAqE/CIMQq60/0v8UStUEmfaC1eBoRXD4VoSVeq9AVfl
	Lsk6FeGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtN1-000000080DQ-3E1d;
	Fri, 27 Feb 2026 08:38:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtMX-00000007zf4-3twZ;
	Fri, 27 Feb 2026 08:38:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E753644498;
	Fri, 27 Feb 2026 08:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D05C116C6;
	Fri, 27 Feb 2026 08:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772181496;
	bh=JxFRQuyAOAtMYqF/3/WfzrGOV/lulPZh3R/a6BPJ3vU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h2SN9TPW9+50N0x4JTYDj0MPTo3reFNOXXZeruZ+d0HOF5CtwriLkf9ctOzcUy60t
	 13Feqf/5Npq87ed9DNpqG9guPAWnIAmlD16H7f7SeY6Q69svSmdcBaXIhh6rhSyUIt
	 uc0J5aRplddQ7ExJ9QC3a+DkscYbtDYEZ01johDHFF2z5IXT2geVk2iJ+h6wiIt6Gk
	 ceDmlX7k2ActitGzwsNBQMueaa05EMQ4QbGNtTh1FRVmQt7f8JwhxmsfwDq8YJ7A6G
	 Z4tzkS0lq+PsoWpZ/z8LWj/fjGxcTPtLRYGb8b3cWISUtpDUSuK0Lf2WdXEzs8Jmx2
	 ww7eZk+XsqYcQ==
Date: Fri, 27 Feb 2026 09:38:13 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 01/14] drm/connector: Introduce drm_output_color_format
 enum
Message-ID: <20260227-overjoyed-glaring-dogfish-89effa@houat>
References: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
 <20260224-drm-rework-color-formats-v1-1-bebc76604ada@kernel.org>
 <4ea869750681f5eee3bbb2978f4ff0ace70310a9.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="4g2ghndtsljakowa"
Content-Disposition: inline
In-Reply-To: <4ea869750681f5eee3bbb2978f4ff0ace70310a9.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_003818_014000_BD086AAD 
X-CRM114-Status: GOOD (  32.86  )
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


--4g2ghndtsljakowa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 01/14] drm/connector: Introduce drm_output_color_format
 enum
MIME-Version: 1.0

Hi Philipp

On Thu, Feb 26, 2026 at 10:12:02AM +0100, Philipp Zabel wrote:
> On Di, 2026-02-24 at 11:58 +0100, Maxime Ripard wrote:
> > The EDID parsing code initially introduced the DRM_COLOR_FORMAT_*
> > defines to represent the sink capabilities. Since a given sink could
> > support multiple formats, it was first defined as a bitmask.
> >=20
> > However, the core and drivers have since leveraged those defines to
> > represent both the supported formats but also the current format being
> > used.
> >=20
> > Considering the latter case, the more natural, and consistent, thing to
> > do would be to create an enum of all the possible formats, and then list
> > the supported formats using a bitmask of the individual enum values.
> >=20
> > Let's create a new enum following that pattern, drm_output_color_format,
> > while maintaining the DRM_COLOR_FORMAT_* compatibility to make the
> > transition easier.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  include/drm/drm_connector.h | 42 ++++++++++++++++++++++++++++++++++---=
-----
> >  1 file changed, 34 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index 7eaec37ae1c735334afa7dad15a38cf0c8b761b8..c67539708f636ae3905bb84=
24c63799bd1811f28 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -554,10 +554,35 @@ enum drm_colorspace {
> >  	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT	=3D 14,
> >  	DRM_MODE_COLORIMETRY_BT601_YCC		=3D 15,
> >  	DRM_MODE_COLORIMETRY_COUNT
> >  };
> > =20
> > +/**
> > + * enum drm_output_color_format - Output Color Format
> > + *
> > + * This enum is a consolidated color format list supported by
> > + * connectors. It's only ever really been used for HDMI and DP so far,
> > + * so it's not exhaustive and can be extended to represent other forma=
ts
> > + * in the future.
> > + *
> > + *
> > + * @DRM_OUTPUT_COLOR_FORMAT_RGB444:
> > + *   RGB output format
> > + * @DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
> > + *   YCbCr 4:4:4 output format (ie. not subsampled)
> > + * @DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
> > + *   YCbCr 4:2:2 output format (ie. with horizontal subsampling)
> > + * @DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
> > + *   YCbCr 4:2:0 output format (ie. with horizontal and vertical subsa=
mpling)
> > + */
> > +enum drm_output_color_format {
> > +	DRM_OUTPUT_COLOR_FORMAT_RGB444 =3D 0,
> > +	DRM_OUTPUT_COLOR_FORMAT_YCBCR444,
> > +	DRM_OUTPUT_COLOR_FORMAT_YCBCR422,
> > +	DRM_OUTPUT_COLOR_FORMAT_YCBCR420,
> > +};
> > +
> >  /**
> >   * enum drm_bus_flags - bus_flags info for &drm_display_info
> >   *
> >   * This enum defines signal polarities and clock edge information for =
signals on
> >   * a bus as bitmask flags.
> > @@ -697,14 +722,14 @@ struct drm_display_info {
> >  	/**
> >  	 * @subpixel_order: Subpixel order of LCD panels.
> >  	 */
> >  	enum subpixel_order subpixel_order;
> > =20
> > -#define DRM_COLOR_FORMAT_RGB444		(1<<0)
> > -#define DRM_COLOR_FORMAT_YCBCR444	(1<<1)
> > -#define DRM_COLOR_FORMAT_YCBCR422	(1<<2)
> > -#define DRM_COLOR_FORMAT_YCBCR420	(1<<3)
> > +#define DRM_COLOR_FORMAT_RGB444		(1 << DRM_OUTPUT_COLOR_FORMAT_RGB444)
> > +#define DRM_COLOR_FORMAT_YCBCR444	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR4=
44)
> > +#define DRM_COLOR_FORMAT_YCBCR422	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR4=
22)
> > +#define DRM_COLOR_FORMAT_YCBCR420	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR4=
20)
>=20
> Can we move this? Either up, directly after drm_output_color_format, or
> down, directly before color_formats.
>
> I think 8d70f395e6cb ("drm: Add support for a panel-orientation
> connector property, v6") didn't separate the two on purpose.

I'm not sure it's worth it, the last patch in this series will remove
these so it's not going to stick around either.

> >  	/**
> >  	 * @panel_orientation: Read only connector property for built-in pane=
ls,
> >  	 * indicating the orientation of the panel vs the device's casing.
> >  	 * drm_connector_init() sets this to DRM_MODE_PANEL_ORIENTATION_UNKNO=
WN.
> > @@ -712,14 +737,15 @@ struct drm_display_info {
> >  	 * fb to compensate and gets exported as prop to userspace.
> >  	 */
> >  	int panel_orientation;
> > =20
> >  	/**
> > -	 * @color_formats: HDMI Color formats, selects between RGB and YCrCb
> > -	 * modes. Used DRM_COLOR_FORMAT\_ defines, which are _not_ the same o=
nes
> > -	 * as used to describe the pixel format in framebuffers, and also don=
't
> > -	 * match the formats in @bus_formats which are shared with v4l.
> > +	 * @color_formats: HDMI Color formats, selects between RGB and
> > +	 * YCrCb modes. Uses a bitmask of DRM_OUTPUT_COLOR_FORMAT\_
>=20
> Maybe s/YCrCb/YCbCr/ for consistency?

Yep, definitely. I'll update it.

Maxime

--4g2ghndtsljakowa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaFX9QAKCRAnX84Zoj2+
dmxcAYCTnPEWQk0d2T09EPqIDncreEtsxUKKkoZBhMXxCZHvYGuTLjKpiG5d9DVP
bimDyVcBf1TU/oK/YyoR5WUGp2e2wBBKJslWjyZOy1Ng07mJWV9f+13k42kP7JzN
5oCetRCy+w==
=Anpu
-----END PGP SIGNATURE-----

--4g2ghndtsljakowa--

