Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB1610A88D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 17:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=851x74hHK4Pr/Iieibl6R86hA8sLRhBID0WGPtdn6Aw=; b=NVinQ3OEXlwmrlMoBfrOy7rMSN
	uDQKV6BK6eQnM5s4b7G6yV3OizEH6rYTTTyz/X52PWXU0qobrwcJ64eb2d5I9ABWGASX4jl6U4rma
	is+viVwkhZxfdWkEm1PpHjVHmsK7mV9ogPEzEgLqZjpD9k59CEo1LtB0/kLaPkPKwqqLYRRLuejPR
	0+sNUNCFf9E0pMkJ0C62omjy9zd7hjbkP7VI5Di/IPgmDA0SZ9ayvtAKEDQhYNiRrRK+v1JsIYok8
	GcohmKMWrDenNXJlF0osEsLK2YVXyUeTIHbQ+m4QpmqhyWQjfgUdSWwiRFNE0YbsSHc2ekLmu8aNc
	F1rW0Drg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5o6f-00000005uWO-2qj4;
	Thu, 26 Mar 2026 17:02:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5o6e-00000005uWB-1894;
	Thu, 26 Mar 2026 17:02:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FC0B60054;
	Thu, 26 Mar 2026 17:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE36C19423;
	Thu, 26 Mar 2026 17:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774544570;
	bh=IQI/txVcFLr4SQuaJ4+73DkdYZEcK7MrNDOrGnm30ww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SYJhxnrSJGjkl2DyA0SD6tr3Iuz0bmP56WdE8RujYhI0+szob6l5AX+KDdb1uJX5g
	 ayYGOuKmnnqNtTpD+gwuEgLkSwVTdiqOD3P3kQ4J6ebtlrxK4E1kT/SqQjKPwLHh1g
	 3l2e+KWgNDsIb/C6n6qhwsAht2eaRryQtwqf6TdjCjAiINMNwxjPFU5ZXyZpVXQ0P7
	 yTHU2YwuPXXMv43NjDqgU/t/BKP8UGUJUjCl8oqNCTZdN4LjRSY7ANts9vZVHgq+h/
	 7WKFP+UzgELQY0w4DeN+tXHLPpVLp7KV7jeeV1a8rS2xXcroys7LJ8CugsHLgy1d7W
	 1BxMu+CyO6M+A==
Date: Thu, 26 Mar 2026 18:02:47 +0100
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
Message-ID: <20260326-pumpkin-goshawk-of-stamina-0ccb84@houat>
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
 <20260324-color-format-v11-3-605559af4fb4@collabora.com>
 <acLDPYuaVI2-12JX@intel.com>
 <23910073.EfDdHjke4D@workhorse>
 <acLrv5hLyNss-Px5@intel.com>
 <20260325-neat-elegant-raven-ebc9ab@houat>
 <acPA60Ci3n_t__xF@intel.com>
 <20260325-magnificent-ultraviolet-oarfish-baefbc@houat>
 <acQsw3Wi_xVlBZ8d@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="sztu7fljo7ruak3p"
Content-Disposition: inline
In-Reply-To: <acQsw3Wi_xVlBZ8d@intel.com>
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


--sztu7fljo7ruak3p
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v11 03/22] drm: Add new general DRM property "color
 format"
MIME-Version: 1.0

On Wed, Mar 25, 2026 at 08:43:15PM +0200, Ville Syrj=E4l=E4 wrote:
> On Wed, Mar 25, 2026 at 03:56:58PM +0100, Maxime Ripard wrote:
> > On Wed, Mar 25, 2026 at 01:03:07PM +0200, Ville Syrj=E4l=E4 wrote:
> > > On Wed, Mar 25, 2026 at 09:24:27AM +0100, Maxime Ripard wrote:
> > > > On Tue, Mar 24, 2026 at 09:53:35PM +0200, Ville Syrj=E4l=E4 wrote:
> > > > > On Tue, Mar 24, 2026 at 08:10:11PM +0100, Nicolas Frattaroli wrot=
e:
> > > > > > On Tuesday, 24 March 2026 18:00:45 Central European Standard Ti=
me Ville Syrj=E4l=E4 wrote:
> > > > > > > On Tue, Mar 24, 2026 at 05:01:07PM +0100, Nicolas Frattaroli =
wrote:
> > > > > > > > +enum drm_connector_color_format {
> > > > > > > > +	/**
> > > > > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_AUTO: The driver or displa=
y protocol
> > > > > > > > +	 * helpers should pick a suitable color format. All imple=
mentations of a
> > > > > > > > +	 * specific display protocol must behave the same way wit=
h "AUTO", but
> > > > > > > > +	 * different display protocols do not necessarily have th=
e same "AUTO"
> > > > > > > > +	 * semantics.
> > > > > > > > +	 *
> > > > > > > > +	 * For HDMI, "AUTO" picks RGB, but falls back to YCbCr 4:=
2:0 if the
> > > > > > > > +	 * bandwidth required for full-scale RGB is not available=
, or the mode
> > > > > > > > +	 * is YCbCr 4:2:0-only, as long as the mode and output bo=
th support
> > > > > > > > +	 * YCbCr 4:2:0.
> > > > > > > > +	 *
> > > > > > > > +	 * For display protocols other than HDMI, the recursive b=
ridge chain
> > > > > > > > +	 * format selection picks the first chain of bridge forma=
ts that works,
> > > > > > > > +	 * as has already been the case before the introduction o=
f the "color
> > > > > > > > +	 * format" property. Non-HDMI bridges should therefore ei=
ther sort their
> > > > > > > > +	 * bus output formats by preference, or agree on a unifie=
d auto format
> > > > > > > > +	 * selection logic that's implemented in a common state h=
elper (like
> > > > > > > > +	 * how HDMI does it).
> > > > > > > > +	 */
> > > > > > > > +	DRM_CONNECTOR_COLOR_FORMAT_AUTO =3D 0,
> > > > > > > > +
> > > > > > > > +	/**
> > > > > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_RGB444: RGB output format
> > > > > > > > +	 */
> > > > > > > > +	DRM_CONNECTOR_COLOR_FORMAT_RGB444,
> > > > > > > > +
> > > > > > > > +	/**
> > > > > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR444: YCbCr 4:4:4 outp=
ut format (ie.
> > > > > > > > +	 * not subsampled)
> > > > > > > > +	 */
> > > > > > > > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR444,
> > > > > > > > +
> > > > > > > > +	/**
> > > > > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR422: YCbCr 4:2:2 outp=
ut format (ie.
> > > > > > > > +	 * with horizontal subsampling)
> > > > > > > > +	 */
> > > > > > > > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR422,
> > > > > > > > +
> > > > > > > > +	/**
> > > > > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR420: YCbCr 4:2:0 outp=
ut format (ie.
> > > > > > > > +	 * with horizontal and vertical subsampling)
> > > > > > > > +	 */
> > > > > > > > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR420,
> > > > > > >=20
> > > > > > > Seems like this should document what the quantization range
> > > > > > > should be for each format.
> > > > > > >=20
> > > > > >=20
> > > > > > I don't think so? If you want per-component bit depth values,
> > > > > > DRM_FORMAT_* defines would be the appropriate values to use. Th=
is
> > > > > > enum is more abstract than that, and is there to communicate
> > > > > > YUV vs. RGB and chroma subsampling, with bit depth being handled
> > > > > > by other properties.
> > > > > >=20
> > > > > > If you mean the factor used for subsampling, then that'd only be
> > > > > > relevant if YCBCR410 was supported where one chroma plane isn't
> > > > > > halved but quartered in resolution. I suspect 4:1:0 will never
> > > > > > be added; no digital display protocol standard supports it to my
> > > > > > knowledge, and hopefully none ever will.
> > > > >=20
> > > > > No, I mean the quantization range (16-235 vs. 0-255 etc).
> > > > >=20
> > > > > The i915 behaviour is that YCbCr is always limited range,
> > > > > RGB can either be full or limited range depending on the=20
> > > > > "Broadcast RGB" property and other related factors.
> > > >=20
> > > > So far the HDMI state has both the format and quantization range as
> > > > different fields. I'm not sure we need to document the range in the
> > > > format field, maybe only mention it's not part of the format but ha=
s a
> > > > field of its own?
> > >=20
> > > I think we only have it for RGB (on some drivers only?). For YCbCr
> > > I think the assumption is limited range everywhere.
> > >=20
> > > But I'm not really concerned about documenting struct members.
> > > What I'm talking about is the *uapi* docs. Surely userspace
> > > will want to know what the new property actually does so the
> > > uapi needs to be documented properly. And down the line some
> > > new driver might also implement the wrong behaviour if there
> > > is no clear specification.
> >=20
> > Ack
> >=20
> > > So I'm thinking (or perhaps hoping) the rule might be something like:
> > > - YCbCr limited range=20
> > > - RGB full range if "Broadcast RGB" property is not present
> >=20
> > Isn't it much more complicated than that for HDMI though? My
> > recollection was that any VIC but VIC1 would be limited range, and
> > anything else full range?
>=20
> Do we have some driver that implements the CTA-861 CE vs. IT mode
> logic but doesn't expose the "Broadcast RGB" property? I was hoping
> those would always go hand in hand now.

I'm not sure. i915 and the HDMI state helpers handle it properly (I
think?) but it looks like only vc4 registers the Broadcast RGB property
and uses the HDMI state helpers.

And it looks like amdgpu registers Broadcast RGB but doesn't use
drm_default_rgb_quant_range() which seems suspicious?

Maxime

--sztu7fljo7ruak3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCacVmrwAKCRAnX84Zoj2+
djmKAXsEmUptwl0y0uTt0hUtaZxnRjjESVJQSddNJJtwkngvSvLKrVU57NG4oOLY
OT9kC7ABgJp0yaEoRAtymIjzcn0p0cg7ukDU4WiKAyXKh4xAWn3poLiUScARRszO
IyTM52RBAA==
=jTyX
-----END PGP SIGNATURE-----

--sztu7fljo7ruak3p--

