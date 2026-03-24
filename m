Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3C9FEC0F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 19:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIHhgYRTZYTwgPpGgsACesVAZLnr0SI2o+pjUNHNbec=; b=vThSHarLzspryxl+a00rnJBoWS
	CEk1XZF1ClbQjeihF77Fvwrdh2NV0ZbTW25YRMqf42hx+dHuEB+e2ClfWBjjWZ06VWecCgY7CLwUV
	0KMYJbNJmNulYquM7EHP+24EU9+uC+qDaefAByoDiXj4DBPEImb+UDcYZYMt5SD5RxQ7dr/6GFF+y
	/vi8JeIllkWuh1Ruq5EPIgWnojepzs4r/Kca7bjgCF1bs+6xGSUnYprDZXm59XflHqbJQ6QonsO6/
	GKuH1mvJew63mh/85sI/jwUwoBYcA7cmPHDyIdBkl7sL1X/pDReynNU2bwF/hVHbBNAKsYL1gx4vb
	GJAmF7Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w579f-000000027gR-3Sb8;
	Tue, 24 Mar 2026 19:11:07 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w579d-000000027g1-39WE;
	Tue, 24 Mar 2026 19:11:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1774379422; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JwmfU3nI64lANcTkOJ2pptWtxs1wPlS9WAKzNUHw+UmfXiMj6E76AJuUGE1dUuUB9KFdm4poJkc3/4iweEnXYg39pe+B+E0RawYrt7N+GHbSgTSPoUN0808n6nIp72tssVMND5WVVKzksaEAJqUNTa+pBJZ/JilUNrURP5JPwdQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774379422; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oIHhgYRTZYTwgPpGgsACesVAZLnr0SI2o+pjUNHNbec=; 
	b=XKnKaF7lYeRKqvW1sR5dSc3xOJtNoj8KO64AF/R2Bt7kj+XePRPL6DWo3ezLa0ifxii/Pwi6RKyqtj0MnHXIBxQBJ1H9FKHRowaC9lzDkWi62V2uixSkk/rCNrsYojyNPM+wpNEpSlCRYupfsCzcCkQBz8cjM7Uib9S/P9bUfgw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774379422;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=oIHhgYRTZYTwgPpGgsACesVAZLnr0SI2o+pjUNHNbec=;
	b=XjbgTY7MCveOU54UWyjfIY6w858uZYvJ0pY1cuI9G1qSVXsiM+jNqczIX3O+kNZr
	FezgxnSjsqcdP8RjZn8+GEt2o6KC+kfWQM5EJR0LQ8+to1BezR8iKwhkw1rFdzwfwju
	CA5g5dnFUKnLmIkgFD4Fcq0PsWPU0APg17ufDRQM=
Received: by mx.zohomail.com with SMTPS id 1774379421185170.28810178052595;
	Tue, 24 Mar 2026 12:10:21 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org, Werner Sembach <wse@tuxedocomputers.com>,
 Andri Yngvason <andri@yngvason.is>, Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v11 03/22] drm: Add new general DRM property "color format"
Date: Tue, 24 Mar 2026 20:10:11 +0100
Message-ID: <23910073.EfDdHjke4D@workhorse>
In-Reply-To: <acLDPYuaVI2-12JX@intel.com>
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
 <20260324-color-format-v11-3-605559af4fb4@collabora.com>
 <acLDPYuaVI2-12JX@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_121105_821921_C2A49A1C 
X-CRM114-Status: GOOD (  27.03  )
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

On Tuesday, 24 March 2026 18:00:45 Central European Standard Time Ville Syr=
j=C3=A4l=C3=A4 wrote:
> On Tue, Mar 24, 2026 at 05:01:07PM +0100, Nicolas Frattaroli wrote:
> > +enum drm_connector_color_format {
> > +	/**
> > +	 * @DRM_CONNECTOR_COLOR_FORMAT_AUTO: The driver or display protocol
> > +	 * helpers should pick a suitable color format. All implementations o=
f a
> > +	 * specific display protocol must behave the same way with "AUTO", but
> > +	 * different display protocols do not necessarily have the same "AUTO"
> > +	 * semantics.
> > +	 *
> > +	 * For HDMI, "AUTO" picks RGB, but falls back to YCbCr 4:2:0 if the
> > +	 * bandwidth required for full-scale RGB is not available, or the mode
> > +	 * is YCbCr 4:2:0-only, as long as the mode and output both support
> > +	 * YCbCr 4:2:0.
> > +	 *
> > +	 * For display protocols other than HDMI, the recursive bridge chain
> > +	 * format selection picks the first chain of bridge formats that work=
s,
> > +	 * as has already been the case before the introduction of the "color
> > +	 * format" property. Non-HDMI bridges should therefore either sort th=
eir
> > +	 * bus output formats by preference, or agree on a unified auto format
> > +	 * selection logic that's implemented in a common state helper (like
> > +	 * how HDMI does it).
> > +	 */
> > +	DRM_CONNECTOR_COLOR_FORMAT_AUTO =3D 0,
> > +
> > +	/**
> > +	 * @DRM_CONNECTOR_COLOR_FORMAT_RGB444: RGB output format
> > +	 */
> > +	DRM_CONNECTOR_COLOR_FORMAT_RGB444,
> > +
> > +	/**
> > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR444: YCbCr 4:4:4 output format (i=
e.
> > +	 * not subsampled)
> > +	 */
> > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR444,
> > +
> > +	/**
> > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR422: YCbCr 4:2:2 output format (i=
e.
> > +	 * with horizontal subsampling)
> > +	 */
> > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR422,
> > +
> > +	/**
> > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR420: YCbCr 4:2:0 output format (i=
e.
> > +	 * with horizontal and vertical subsampling)
> > +	 */
> > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR420,
>=20
> Seems like this should document what the quantization range
> should be for each format.
>=20

I don't think so? If you want per-component bit depth values,
DRM_FORMAT_* defines would be the appropriate values to use. This
enum is more abstract than that, and is there to communicate
YUV vs. RGB and chroma subsampling, with bit depth being handled
by other properties.

If you mean the factor used for subsampling, then that'd only be
relevant if YCBCR410 was supported where one chroma plane isn't
halved but quartered in resolution. I suspect 4:1:0 will never
be added; no digital display protocol standard supports it to my
knowledge, and hopefully none ever will.

> > +
> > +	/**
> > +	 * @DRM_CONNECTOR_COLOR_FORMAT_COUNT: Number of valid connector color
> > +	 * format values in this enum
> > +	 */
> > +	DRM_CONNECTOR_COLOR_FORMAT_COUNT,
> > +};
> > +
> > +/**
> > + * drm_connector_color_format_valid - Validate drm_connector_color_for=
mat value
> > + * @fmt: value to check against all values of &enum drm_connector_colo=
r_format
> > + *
> > + * Checks whether the passed in value of @fmt is one of the allowable =
values in
> > + * &enum drm_connector_color_format.
> > + *
> > + * Returns: %true if it's a valid value for the enum, %false otherwise.
> > + */
> > +static inline bool __pure
> > +drm_connector_color_format_valid(enum drm_connector_color_format fmt)
> > +{
> > +	switch (fmt) {
> > +	case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
> > +	case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
> > +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR444:
> > +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR422:
> > +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR420:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> >  const char *
> >  drm_hdmi_connector_get_output_format_name(enum drm_output_color_format=
 fmt);
> > =20
> > @@ -1129,6 +1217,13 @@ struct drm_connector_state {
> >  	 */
> >  	enum drm_colorspace colorspace;
> > =20
> > +	/**
> > +	 * @color_format: State variable for Connector property to request
> > +	 * color format change on Sink. This is most commonly used to switch
> > +	 * between RGB to YUV and vice-versa.
> > +	 */
> > +	enum drm_connector_color_format color_format;
> > +
> >  	/**
> >  	 * @writeback_job: Writeback job for writeback connectors
> >  	 *
> > @@ -2127,6 +2222,12 @@ struct drm_connector {
> >  	 */
> >  	struct drm_property *colorspace_property;
> > =20
> > +	/**
> > +	 * @color_format_property: Connector property to set the suitable
> > +	 * color format supported by the sink.
> > +	 */
> > +	struct drm_property *color_format_property;
> > +
> >  	/**
> >  	 * @path_blob_ptr:
> >  	 *
> > @@ -2610,6 +2711,9 @@ bool drm_connector_has_possible_encoder(struct dr=
m_connector *connector,
> >  					struct drm_encoder *encoder);
> >  const char *drm_get_colorspace_name(enum drm_colorspace colorspace);
> > =20
> > +int drm_connector_attach_color_format_property(struct drm_connector *c=
onnector,
> > +					       unsigned long supported_color_formats);
> > +
> >  /**
> >   * drm_for_each_connector_iter - connector_list iterator macro
> >   * @connector: &struct drm_connector pointer used as cursor
> >=20
>=20
>=20





