Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66116D44145
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 09:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5Ptd65h9JKSfIpZtBkEP8N7c0X+Bol4KsR70oWA+/4=; b=esYfA8lsi5JD2i6Sfn9Zg97Ox2
	hhg7X6Rtp87/sv+WozN9Ssh9Xq+Jr6TAa03NNvRgYE1uDp5Oa+a71EZuZgVVCPK7B29KVuFZJDaRz
	4xzrjlrA+h95GRJQWjcePAHzRrCSCmI+OeXnPFcj82tDjvjl0ycdEeSTiUppODUC3KhIuGGdojVdo
	KPgCfuUSPRFhM1L7owOjfCehCJ1gSLBd5ZlBXYhhROfkAoRJErd4f2mLvuNXhfsHruua6Fpvf5pKu
	x8HQ7cpTjnG2aRxR+2pNUAmkR/z/bkMXK7pKRqXiQh3BfOHuDL/jfdbldmi1RaPn7rH4hBQmVsfSQ
	W4+sFyVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTzJm-00000000LAR-34el;
	Fri, 12 Dec 2025 09:20:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTzJl-00000000L9y-0ePz;
	Fri, 12 Dec 2025 09:20:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0386543AD3;
	Fri, 12 Dec 2025 09:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E936C4CEF1;
	Fri, 12 Dec 2025 09:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765531203;
	bh=0jGggkTCKwtF0kVeva52ypWViXDwvOez/4AOMZSnLO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PWo8ude+1IaeCJPU6TX+NPNwNH+K5tMV16mbQlpIOdidcFDF1H8T/p91IVuaE/qRC
	 5k1PrbXfpgKm9HWMHC7rGMwTV7RBzRsVju71APGLe5o91pN5q8vz+/awbEFx3Dpqsk
	 o5orZnDUAVFJPbPi0a6gQKH3E8IhyY257DKCExk6B41vUzFOjsKKWqu47kCUMl10K6
	 P+XBrrP+VX1THVjNTB51xyHFxcwlnMj/Did9HT3IAxlBcyyEatf8sQmiJu7Xno1xey
	 6ee+mnea5KGN85UrTf7OBUCHP2z85oqfbTV/9ASSukw40wSNKPmZQeodFtTCUc7aVE
	 vAa4LcArTOv8g==
Date: Fri, 12 Dec 2025 10:20:00 +0100
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
Subject: Re: [PATCH v5 05/17] drm/display: hdmi-state-helper: Act on color
 format DRM property
Message-ID: <20251212-chubby-optimistic-goldfish-aece5f@penduick>
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
 <20251128-color-format-v5-5-63e82f1db1e1@collabora.com>
 <20251209-uptight-radical-chupacabra-ac3d6d@houat>
 <3084118.iZASKD2KPV@workhorse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="vqtfr7dzkcxo5bmq"
Content-Disposition: inline
In-Reply-To: <3084118.iZASKD2KPV@workhorse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_012005_235921_7A6F4E27 
X-CRM114-Status: GOOD (  28.96  )
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


--vqtfr7dzkcxo5bmq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 05/17] drm/display: hdmi-state-helper: Act on color
 format DRM property
MIME-Version: 1.0

On Thu, Dec 11, 2025 at 08:42:00PM +0100, Nicolas Frattaroli wrote:
> On Tuesday, 9 December 2025 15:16:58 Central European Standard Time Maxim=
e Ripard wrote:
> > On Fri, Nov 28, 2025 at 10:05:41PM +0100, Nicolas Frattaroli wrote:
> > > With the introduction of the "color format" DRM property, which allows
> > > userspace to request a specific color format, the HDMI state helper
> > > should implement this.
> > >=20
> > > Implement it by checking whether the property is set and set to
> > > something other than auto. If so, pass the requested color format, and
> > > otherwise set RGB.
> > >=20
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/driver=
s/gpu/drm/display/drm_hdmi_state_helper.c
> > > index a561f124be99..5da956bdd68c 100644
> > > --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > > +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > > @@ -649,11 +649,21 @@ hdmi_compute_config(const struct drm_connector =
*connector,
> > >  	unsigned int max_bpc =3D clamp_t(unsigned int,
> > >  				       conn_state->max_bpc,
> > >  				       8, connector->max_bpc);
> > > +	enum hdmi_colorspace hdmi_colorspace =3D
> > > +		drm_color_format_to_hdmi_colorspace(conn_state->color_format);
> > >  	int ret;
> > > =20
> > >  	ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bp=
c,
> > > -				      HDMI_COLORSPACE_RGB);
> > > +				      hdmi_colorspace);
> > >  	if (ret) {
> > > +		/* If a color format was explicitly requested, don't fall back */
> > > +		if (conn_state->color_format) {
> > > +			drm_dbg_kms(connector->dev,
> > > +				    "Explicitly set color format '%s' doesn't work.\n",
> > > +				    drm_get_color_format_name(conn_state->color_format));
> > > +			return ret;
> > > +		}
> > > +
> >=20
> > I think the following would be more readable:
> >=20
> >=20
> > if (conn_state->color_format && conn_state->color_format !=3D DRM_COLOR=
_FORMAT_AUTO) {
> >     enum hdmi_colorspace hdmi_colorspace =3D
> >         drm_color_format_to_hdmi_colorspace(conn_state->color_format);
> >=20
> >     return hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc=
, hdmi_colorspace)
> > }
> >=20
> > ret =3D ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, ma=
x_bpc,
> >                                     HDMI_COLORSPACE_RGB);
> >=20
> > ...
>=20
> I think I get what you mean: if conn_state->color_format is set, return
> directly, instead of bailing out in the fallback path. I can do that.

Yes

> However, `conn_state->color_format && conn_state->color_format !=3D DRM_C=
OLOR_FORMAT_AUTO`
> is redundant now as of v5 since DRM_COLOR_FORMAT_AUTO is 0 (and
> I use its falsy nature in many other places, and don't intend to
> stop doing that).

Ok, that makes sense.

Maxime

--vqtfr7dzkcxo5bmq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaTvePwAKCRAnX84Zoj2+
dnH7AYD+IRHQlLd6znzcMwDZJlOZD7Eo9XEBr1aU4hUUiVq0JBv4veawPXcV9oAs
lx3qgqEBfjef+PFLwaPh6PmNkWj+Tw22LqtKIXZNKKeJw3bMMKnHVHfnKy7gLb5q
oKoY2V2frw==
=AdKm
-----END PGP SIGNATURE-----

--vqtfr7dzkcxo5bmq--

