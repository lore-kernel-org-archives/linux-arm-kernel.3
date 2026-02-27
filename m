Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83937FD530E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 08:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rk4WPF5PpjLK6SljcO6BaUJqFLdiU1iwRrL0bQv77zQ=; b=0ShTUvmHSHOFAZD+QHQc2KvCh9
	ADXP2PSLR7GM1Gg+JmxNBP9uHRkSUc9k9b+R/7ejDs2XI4pmDAcHW4UEuG1QDVgVbjoEQbqF8c+Mz
	wQ2ckNy3t/T52L47I2DlFT6pRk7WN/W0eKojIi8tihN+77J9dXt+Ym3r2qDCti6ys1RCLVvajTjJX
	X8K49Owy6QjG/6jqdSX7tVwWQzTovFjOEbDaNfYmtYRywm3WzWAOkxsTPM9sn7K322SpPX9Mlp4yD
	ytzn5ji9SWtwMYp1lpW2Eleiud09DMfhxQpsD/+43taXYNEk+Lw5tgx7gwqfMetjsUHtAVPWHks3I
	cGemamjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtDj-00000007z0j-44dy;
	Fri, 27 Feb 2026 08:29:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtDi-00000007z09-10Ri;
	Fri, 27 Feb 2026 08:29:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DFA3944097;
	Fri, 27 Feb 2026 08:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A915C116C6;
	Fri, 27 Feb 2026 08:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772180948;
	bh=c8kyPUTfjiKvPIqR7TvbHjiIxKrmJz6TvW1tdw40CNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofDzrsEvFziU5bJCQJenBgUdKWnvapcui45AO8WukPJ3C9nQEaqTbw1jSWXTaUZ46
	 HG/tGLR9AcxzdFzsTNVv3ajsQdEXgN5kMvPtSDE9fcCxQtEf10Z008H+x/yBqdTCw2
	 sgPxqSuOA8RtD4gziJbnHpaldmrJ4JrqN7xLYEMiBvmWuWQwX4KgG1bsPHOtkfmhjt
	 jxPVdBGCheLMsHu/ZUUPH95AEu1xJZltS3OzdsWkbRURN9sL3TqfJT2Rqu/yIT6+Cp
	 c1Oppfx9pWVq1P4PXrEi9mbiZqrFicJCaTFtBKbKOdz7d9eFl6D49xnZcJAJrWfEHq
	 8/JLcJhgDMYIQ==
Date: Fri, 27 Feb 2026 09:29:05 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Yan <andy.yan@rock-chips.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 14/14] drm/display: hdmi: Use drm_output_color_format
 instead of hdmi_colorspace
Message-ID: <20260227-dramatic-agouti-of-brotherhood-416e19@houat>
References: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
 <20260224-drm-rework-color-formats-v1-14-bebc76604ada@kernel.org>
 <5558942.31r3eYUQgx@workhorse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="loc25nvmfl5t2czh"
Content-Disposition: inline
In-Reply-To: <5558942.31r3eYUQgx@workhorse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_002910_320184_6E96FCF5 
X-CRM114-Status: GOOD (  25.97  )
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


--loc25nvmfl5t2czh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 14/14] drm/display: hdmi: Use drm_output_color_format
 instead of hdmi_colorspace
MIME-Version: 1.0

Hi

On Thu, Feb 26, 2026 at 05:24:05PM +0100, Nicolas Frattaroli wrote:
> On Tuesday, 24 February 2026 11:58:53 Central European Standard Time Maxi=
me Ripard wrote:
> > The hdmi_colorspace enum was defined to represent the colorspace value
> > of the HDMI infoframes. It was later used by some HDMI drivers to
> > express the output format they should be setting up.
> >=20
> > During the introduction of the HDMI helpers, it then was used to
> > represent it in the drm_connector_hdmi_state structure.
> >=20
> > However, it's always been somewhat redundant with the DRM_COLOR_FORMAT_*
> > defines, and now with the drm_output_color_format enum. Let's
> > consolidate around drm_output_color_format in drm_connector_hdmi_state
> > to facilitate the current effort to provide a global output format
> > selection mechanism.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/bridge/inno-hdmi.c                 |   6 +-
> >  drivers/gpu/drm/bridge/ite-it6263.c                |   2 +-
> >  drivers/gpu/drm/display/drm_hdmi_helper.c          |   7 +-
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  52 ++++--
> >  drivers/gpu/drm/drm_bridge.c                       |   2 +-
> >  drivers/gpu/drm/drm_connector.c                    |  14 +-
> >  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             |   8 +-
> >  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   2 +-
> >  drivers/gpu/drm/tests/drm_connector_test.c         |  80 ++++-----
> >  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 182 ++++++++++---=
--------
> >  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  18 +-
> >  drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 +-
> >  include/drm/display/drm_hdmi_helper.h              |   3 +-
> >  include/drm/drm_connector.h                        |   7 +-
> >  14 files changed, 205 insertions(+), 180 deletions(-)
> >=20
> > [... snip ...]
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conn=
ector.c
> > index 4f5b27fab475c7c733622eb8727927571f3fb8fe..171cd495976a3e16f201fd3=
39d3d42a09dc3b63f 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -589,14 +589,14 @@ int drmm_connector_hdmi_init(struct drm_device *d=
ev,
> > =20
> >  	if (!(connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
> >  	      connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB))
> >  		return -EINVAL;
> > =20
> > -	if (!supported_formats || !(supported_formats & BIT(HDMI_COLORSPACE_R=
GB)))
> > +	if (!supported_formats || !(supported_formats & BIT(DRM_OUTPUT_COLOR_=
FORMAT_RGB444)))
> >  		return -EINVAL;
> > =20
> > -	if (connector->ycbcr_420_allowed !=3D !!(supported_formats & BIT(HDMI=
_COLORSPACE_YUV420)))
> > +	if (connector->ycbcr_420_allowed !=3D !!(supported_formats & BIT(DRM_=
OUTPUT_COLOR_FORMAT_YCBCR420)))
> >  		return -EINVAL;
>=20
> I don't think this will work as-is. drm_bridge_connector_init calls this
> function assuming hdmi_colorspace bitmasks in supported_formats.

Yeah, you're right I missed the conversion in drm_bridge_connector_init.
It should be fixed now.

> This may have slipped through the conversion; the synopsys dw-hdmi-qp core
> (separate from synopsys dw-hdmi) also assumes hdmi_colorspace, see e.g.
> dw_hdmi_qp_plat_data::supported_formats in include/drm/bridge/dw_hdmi_qp.h
>=20
> So should be a simple fix I hope.

For this one, did you identify anything more than the comment in
dw_hdmi_qp_plat_data? I couldn't find any user of HDMI_COLORSPACE_* left
for the dw_hdmi_qp_plat_data.supported_formats users.

Maxime

--loc25nvmfl5t2czh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaFV0QAKCRAnX84Zoj2+
dvCEAYDaGC/59F9atETzuzgChsYLcJVNJgdGWjU1NRJZAQyUqV3NtgL5f6q6GBTD
pJd6kloBfiNvk4tOHoJdLuYHcXKOHPexZHHDkJhCCZcQq5xaZ4nI/2u9TG4/zvD0
jRPv06q3tQ==
=uKAU
-----END PGP SIGNATURE-----

--loc25nvmfl5t2czh--

