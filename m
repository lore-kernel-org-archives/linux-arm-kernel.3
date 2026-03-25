Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9059BFEA82F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 08:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACoTl1Z6STNWcJyf+W3IIpR9O0w8A+ZqEyoH/oc065w=; b=D4qMW2xszgzh4Tdu88Xw4xUdda
	0Gra/+x9H4wU7YzQ4rO7TAo3HX8Mdc7HsD+YgBHnaREwy+f4dFpurAKvpL+dcOlTw4WpJ3qR6XiaL
	xPiWoek0HHZ5lOhDpZO+E9h7bPHWjcJSaMkzZYKXZ0ScWAYoEN5m9fz967m2so1MjJBRu7NGUpr5w
	Wg3VFfF6gqcghnZ/sZPkukzV26eNCoXfs/0MmPcimf+6ub40P5YoweY9+9AmfpRoeF8EDOn51sNzx
	xl1pObSVuZu0LBE4uhlZRFIDPJRWbdtkkrW66R/1KvG4kh8ITDbK2T0hxOsh+LZUSkdA94fMrKd1x
	BfHrQQbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JXU-00000002wWP-2h5n;
	Wed, 25 Mar 2026 08:24:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JXU-00000002wWG-02mb;
	Wed, 25 Mar 2026 08:24:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E1B15600C4;
	Wed, 25 Mar 2026 08:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A04AC4CEF7;
	Wed, 25 Mar 2026 08:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774427070;
	bh=OXpyySfKyZH4/xByTVF+CcO5Zm0m2JZxVDe7zJkMYr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kaJIRIiM3CnzwTWAxlLjWYuN0VEiT2i58200iLTs297ZcYBUEFDNIhOPVeqTiRFi/
	 1+VVucUcVSoJ8DoS1T16p7GrjEFwg83fDBOfRd7ydbm5ejQCKRihL3YvqIkN0RNeuf
	 OlUomozQwJgbcsHSEZKjsU7/eZO1VDQPNMyj7wd0g8xe4mnqKTInaen1jPjbjGo+0G
	 0GXEqRpJTGRGl3g3JUmpJxT6x2rRkXsbL4SkbpofUy3YU/SmpZL3hsTnHlkewmUNEF
	 aaDj5+h4PjxK3B4GV49wKBPVgtAxSQ7bZpGp7gUdkfeX+Vn4YzLopCgxRE9Lwm+k3K
	 DPUz5V/bvQhrw==
Date: Wed, 25 Mar 2026 09:24:27 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
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
	Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Werner Sembach <wse@tuxedocomputers.com>, Andri Yngvason <andri@yngvason.is>, 
	Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v11 03/22] drm: Add new general DRM property "color
 format"
Message-ID: <20260325-neat-elegant-raven-ebc9ab@houat>
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
 <20260324-color-format-v11-3-605559af4fb4@collabora.com>
 <acLDPYuaVI2-12JX@intel.com>
 <23910073.EfDdHjke4D@workhorse>
 <acLrv5hLyNss-Px5@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="wbwmiqkexkho5cib"
Content-Disposition: inline
In-Reply-To: <acLrv5hLyNss-Px5@intel.com>
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


--wbwmiqkexkho5cib
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v11 03/22] drm: Add new general DRM property "color
 format"
MIME-Version: 1.0

On Tue, Mar 24, 2026 at 09:53:35PM +0200, Ville Syrj=E4l=E4 wrote:
> On Tue, Mar 24, 2026 at 08:10:11PM +0100, Nicolas Frattaroli wrote:
> > On Tuesday, 24 March 2026 18:00:45 Central European Standard Time Ville=
 Syrj=E4l=E4 wrote:
> > > On Tue, Mar 24, 2026 at 05:01:07PM +0100, Nicolas Frattaroli wrote:
> > > > +enum drm_connector_color_format {
> > > > +	/**
> > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_AUTO: The driver or display protoc=
ol
> > > > +	 * helpers should pick a suitable color format. All implementatio=
ns of a
> > > > +	 * specific display protocol must behave the same way with "AUTO"=
, but
> > > > +	 * different display protocols do not necessarily have the same "=
AUTO"
> > > > +	 * semantics.
> > > > +	 *
> > > > +	 * For HDMI, "AUTO" picks RGB, but falls back to YCbCr 4:2:0 if t=
he
> > > > +	 * bandwidth required for full-scale RGB is not available, or the=
 mode
> > > > +	 * is YCbCr 4:2:0-only, as long as the mode and output both suppo=
rt
> > > > +	 * YCbCr 4:2:0.
> > > > +	 *
> > > > +	 * For display protocols other than HDMI, the recursive bridge ch=
ain
> > > > +	 * format selection picks the first chain of bridge formats that =
works,
> > > > +	 * as has already been the case before the introduction of the "c=
olor
> > > > +	 * format" property. Non-HDMI bridges should therefore either sor=
t their
> > > > +	 * bus output formats by preference, or agree on a unified auto f=
ormat
> > > > +	 * selection logic that's implemented in a common state helper (l=
ike
> > > > +	 * how HDMI does it).
> > > > +	 */
> > > > +	DRM_CONNECTOR_COLOR_FORMAT_AUTO =3D 0,
> > > > +
> > > > +	/**
> > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_RGB444: RGB output format
> > > > +	 */
> > > > +	DRM_CONNECTOR_COLOR_FORMAT_RGB444,
> > > > +
> > > > +	/**
> > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR444: YCbCr 4:4:4 output forma=
t (ie.
> > > > +	 * not subsampled)
> > > > +	 */
> > > > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR444,
> > > > +
> > > > +	/**
> > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR422: YCbCr 4:2:2 output forma=
t (ie.
> > > > +	 * with horizontal subsampling)
> > > > +	 */
> > > > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR422,
> > > > +
> > > > +	/**
> > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR420: YCbCr 4:2:0 output forma=
t (ie.
> > > > +	 * with horizontal and vertical subsampling)
> > > > +	 */
> > > > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR420,
> > >=20
> > > Seems like this should document what the quantization range
> > > should be for each format.
> > >=20
> >=20
> > I don't think so? If you want per-component bit depth values,
> > DRM_FORMAT_* defines would be the appropriate values to use. This
> > enum is more abstract than that, and is there to communicate
> > YUV vs. RGB and chroma subsampling, with bit depth being handled
> > by other properties.
> >=20
> > If you mean the factor used for subsampling, then that'd only be
> > relevant if YCBCR410 was supported where one chroma plane isn't
> > halved but quartered in resolution. I suspect 4:1:0 will never
> > be added; no digital display protocol standard supports it to my
> > knowledge, and hopefully none ever will.
>=20
> No, I mean the quantization range (16-235 vs. 0-255 etc).
>=20
> The i915 behaviour is that YCbCr is always limited range,
> RGB can either be full or limited range depending on the=20
> "Broadcast RGB" property and other related factors.

So far the HDMI state has both the format and quantization range as
different fields. I'm not sure we need to document the range in the
format field, maybe only mention it's not part of the format but has a
field of its own?

Maxime

--wbwmiqkexkho5cib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCacObuwAKCRAnX84Zoj2+
ds1XAXsG3ZPGasIIoc6AjqXiDJncnXTY0PaMBBbXGSy+Rcyhb1RiReK8zMl508aI
ahxZUfcBfAz2j3skdPxRfMkkduKBzOjrHQhv19x1nGeExVWXWq31x8ihOc0Sjroj
z0wjpE2yrQ==
=ee+x
-----END PGP SIGNATURE-----

--wbwmiqkexkho5cib--

