Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7081610A62CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 13:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWnlq3YY7P2VGUr2BUkZ+fGGbSx856WYxcxWvnN8cGU=; b=ZmYAUyKuTgql1SxDFewS+VfC/z
	NELeOzhITNLVLr2cIQQVOsR06VJekbuIUvXbBpqKQx34jZVj71c9MZrtjMadY6TT/SVhJZtjGbeo1
	jJIYQCT7UfgvLE898X6kIlQgNjtHMJRMoxG92PsqXApkYEVjOe0GNWFusb1+mBYQw9DCAEff1xhTX
	RBtTuzsIzhL150eFYD9Zge3ckYZ3j9wvIgCE4g/l20Gg+LtjCM/QqlhezLh2rp7i0TxL8eC6Qrw0c
	UBaOVELaocbN+Ga/KNn3xmcwxcoG6IP63SR6toRNZSqMXig/YHKZh/3JF/MH8t3eEL2fp+77si//X
	Zr7/OdPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kvm-00000005ZGA-02dJ;
	Thu, 26 Mar 2026 13:39:26 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kvj-00000005ZF5-3CCs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 13:39:25 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-79628fb5c05so8616707b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 06:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774532362; cv=none;
        d=google.com; s=arc-20240605;
        b=cJKT3n7TWnqxdFLISTlkdlQ5pja1hDopTANWDiNFThThv2bP9azWAgIxqy4oxvtQ0U
         7BX8/hFsmQ2h4vcUx0LuMKev++mevyty1JI/Ec/GdrAeBawclK36G7oTi5zFP8F/ruqL
         5tiV+DmnZsWTjZbjlI3tazEE/Qs3yoJjG5gGGzNQ3iYk4OMWYJjrM31GkNJL70ob+XSl
         6YpBg+uaMJyncTNJk0FHo5S2mYbSTTzlhgCwmlIluFK5FTdj4GDD613yfNGxAKbCD14q
         4L0xLPQPUtxyyjBFwa1pSI9RvKbMMnRBf0RqN0AYlRGfnyhRvVMxe1aYJM4FXO9k3un3
         YDEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IWnlq3YY7P2VGUr2BUkZ+fGGbSx856WYxcxWvnN8cGU=;
        fh=lBKCIWorvrAQ0HAI74I3X7uS98JNUFrp+IoGhT2s/oo=;
        b=S+/aHXhfZuTm5VUDIU/Xx2MKwzBsDICFFLSRoWZWduaMeLJ+9iIs+tVeAzJavZlMVZ
         ahAQv8pkyVWIPqKsNT3aR6adBJTTdppAVQEzqI1scEea1LI3vdAFGogmWAMO38EaAsy+
         0PXebTUzpXQjTD2R7Xn+GjaL7hIj4Zqeret7e4LRhg/DdcGWxQqb+f+5ps34V+dRglim
         Cv8kypWFsm4glIIyw80M7h19e+afSoGIm5KU5V3JYMCcSbISRVgPcq8z3IOUjOqjMq+q
         LsrQhrFDDWs5qX+Bh8dNGDvxNAaNCn+yroqUhlFNf7HLlWtXoTmVf/4gK1NDZKPRpaHp
         1EqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1774532362; x=1775137162; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWnlq3YY7P2VGUr2BUkZ+fGGbSx856WYxcxWvnN8cGU=;
        b=GdSESWZwVSdrJnf3L9Rk1UrQIT9n/PGR8aQ6NaifkHCMrvZGmWKlHMxHL61aFDIU2w
         6WuL16bid+aLF40QkLGdYaXpwU9ANloQftgjLWaQLruMxIOxSLYXmMjUJdhHLFf97Xqx
         /AvkqVKY5IkfEpNykhHnBHeUs41Wbk/UlJUXW4bMt3jjRRk80a0zDVPdg6XVvIVxxD+B
         A4B5xenCLWmNLcHovk7Bm146N/HqdbVhZPlE4wS28nr6LrbabphePk2BoajMVdeHarWZ
         3lDBetyBcDm4W1RaArSEUUA0GMMNp8hqNhdEe56NGWK92nkef0iHNz9Oj9+5TH24WEOy
         1EnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774532362; x=1775137162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IWnlq3YY7P2VGUr2BUkZ+fGGbSx856WYxcxWvnN8cGU=;
        b=U/okpgAle68i8WDOkv+QcnjGfYVHYU9/B8/kb9fppBsJbX0j6yK2VwDO9UmeDx+H2T
         dfSysv3ggBnJwf2ewE5snGVowgqt4Lu/h65KKm16N/8uX3/1hNWWvkbtLkqYvd7tPA+A
         kf3g+jDJ6ilrAmTrRjfujh9ShAHQNtujH1P3NYTVWR3VXGSN+6eyE0xQtD7QI64HFXxW
         L4BNKw9XS0Jp+uE1hJhv919We93V9tMIwMs7OqDCndomYSBLfasY0n2gqZ18N5GlG7Hb
         yEeWPAch5GgQAiWfgF45ZYl/V+GcjTr1rajAMaAqZ2ddmco7Dy9vE6wwiioMLJu8hO+V
         h0YA==
X-Forwarded-Encrypted: i=1; AJvYcCVbEri5b6gHD31SM6YDUKW6Jox/Q0eGpbSdjeFchQ7b6WIFelTsYplMOpKfrByAU3giRXoWjzQIEk7YgqrLQaht@lists.infradead.org
X-Gm-Message-State: AOJu0YxAUfCvh+fzU7HXCZGtpsT37GiTBEhxslefUWn4JcqgP1/jH30i
	Cj3QMtUvoDT2O6Aypb0UxzxtJZsuIJOD4M8HrXg5HOrkeC4jAzUTlRPWmKV/qkg48tOjkWSAZN5
	IJCr+IklNhD24hNHb4HIK6jxr1A7gTyTmaTkd2zMT0Q==
X-Gm-Gg: ATEYQzx539Wd4OtG96B7MEbblql8EVkO+eeIKxqI3bUi1duYq3pfugaFs4uohocE+4K
	N+vKCCxRMV6EcfaZzhFZBYhRwDQpIFWZo6WMJiPHn4ELQu7s/ugyNr/DrgbLtgibCKm6DJQDnAm
	bH3ERX1cvDSYxbDYArA35NoLYsw6B+CRFb3M4w+U0tCSU7f4Jj8XZSZVhEHaGDhD2Q0tAuf5XHY
	ODbK0/FsIB3e7rYgi2flpY6nQwGXLR/Bj/o6YlhdziXXFg7b8NvZw9wW+mcZXvtXV2fUJuh9edW
	vmxKD8bdx0upmNDe3dQETsX+OHkLtsLbm1HkBwg=
X-Received: by 2002:a05:690c:6086:b0:799:1d0a:aca8 with SMTP id
 00721157ae682-79acf391fcamr83445117b3.19.1774532361939; Thu, 26 Mar 2026
 06:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
 <20260324-color-format-v11-3-605559af4fb4@collabora.com> <CAPY8ntB9f_=f5kru=8w9BpTuqQR+93maGpT61EKU28Uay2vq8Q@mail.gmail.com>
 <acPmcMbUvzWMzC-Q@intel.com> <CAPY8ntCRPgN_ayHMGXFv9OrJrdyakUcUT0rvgY5J=FvdCFb6eA@mail.gmail.com>
 <acUi6NEPJ0p48a3U@intel.com>
In-Reply-To: <acUi6NEPJ0p48a3U@intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 26 Mar 2026 13:39:04 +0000
X-Gm-Features: AQROBzC-fzB7pltEtFba3kfrVDmyhycx0P3xOtZmVXy7A1SvRy2ZJPGwTUQXf-A
Message-ID: <CAPY8ntDZ30NWmYaptMQzOuXPoi8wzEObzAL=oqhxuq8jSvv2mQ@mail.gmail.com>
Subject: Re: [PATCH v11 03/22] drm: Add new general DRM property "color format"
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Werner Sembach <wse@tuxedocomputers.com>, Andri Yngvason <andri@yngvason.is>, 
	Marius Vlad <marius.vlad@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_063923_944011_DBFA7F8C 
X-CRM114-Status: GOOD (  32.16  )
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

On Thu, 26 Mar 2026 at 12:13, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Thu, Mar 26, 2026 at 11:16:12AM +0000, Dave Stevenson wrote:
> > On Wed, 25 Mar 2026 at 13:43, Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Wed, Mar 25, 2026 at 12:49:19PM +0000, Dave Stevenson wrote:
> > > > On Tue, 24 Mar 2026 at 16:02, Nicolas Frattaroli
> > > > <nicolas.frattaroli@collabora.com> wrote:
> > > > >
> > > > > Add a new general DRM property named "color format" which can be =
used by
> > > > > userspace to request the display driver to output a particular co=
lor
> > > > > format.
> > > > >
> > > > > Possible options are:
> > > > >     - auto (setup by default, driver internally picks the color f=
ormat)
> > > > >     - rgb
> > > > >     - ycbcr444
> > > > >     - ycbcr422
> > > > >     - ycbcr420
> > > > >
> > > > > Drivers should advertise from this list which formats they suppor=
t.
> > > > > Together with this list and EDID data from the sink we should be =
able
> > > > > to relay a list of usable color formats to users to pick from.
> > > > >
> > > > > Co-developed-by: Werner Sembach <wse@tuxedocomputers.com>
> > > > > Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> > > > > Co-developed-by: Andri Yngvason <andri@yngvason.is>
> > > > > Signed-off-by: Andri Yngvason <andri@yngvason.is>
> > > > > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > > > > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > > > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.c=
om>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_atomic_helper.c |   5 ++
> > > > >  drivers/gpu/drm/drm_atomic_uapi.c   |  11 ++++
> > > > >  drivers/gpu/drm/drm_connector.c     | 108 ++++++++++++++++++++++=
++++++++++++++
> > > > >  include/drm/drm_connector.h         | 104 ++++++++++++++++++++++=
++++++++++++
> > > > >  4 files changed, 228 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/dr=
m/drm_atomic_helper.c
> > > > > index 26953ed6b53e..b7753454b777 100644
> > > > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > > > @@ -737,6 +737,11 @@ drm_atomic_helper_check_modeset(struct drm_d=
evice *dev,
> > > > >                         if (old_connector_state->max_requested_bp=
c !=3D
> > > > >                             new_connector_state->max_requested_bp=
c)
> > > > >                                 new_crtc_state->connectors_change=
d =3D true;
> > > > > +
> > > > > +                       if (old_connector_state->color_format !=
=3D
> > > > > +                           new_connector_state->color_format)
> > > > > +                               new_crtc_state->connectors_change=
d =3D true;
> > > > > +
> > > > >                 }
> > > > >
> > > > >                 if (funcs->atomic_check)
> > > > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/=
drm_atomic_uapi.c
> > > > > index 5bd5bf6661df..dee510c85e59 100644
> > > > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > > > @@ -935,6 +935,15 @@ static int drm_atomic_connector_set_property=
(struct drm_connector *connector,
> > > > >                 state->privacy_screen_sw_state =3D val;
> > > > >         } else if (property =3D=3D connector->broadcast_rgb_prope=
rty) {
> > > > >                 state->hdmi.broadcast_rgb =3D val;
> > > > > +       } else if (property =3D=3D connector->color_format_proper=
ty) {
> > > > > +               if (val > INT_MAX || !drm_connector_color_format_=
valid(val)) {
> > > > > +                       drm_dbg_atomic(connector->dev,
> > > > > +                                      "[CONNECTOR:%d:%s] unknown=
 color format %llu\n",
> > > > > +                                      connector->base.id, connec=
tor->name, val);
> > > > > +                       return -EINVAL;
> > > > > +               }
> > > > > +
> > > > > +               state->color_format =3D val;
> > > > >         } else if (connector->funcs->atomic_set_property) {
> > > > >                 return connector->funcs->atomic_set_property(conn=
ector,
> > > > >                                 state, property, val);
> > > > > @@ -1020,6 +1029,8 @@ drm_atomic_connector_get_property(struct dr=
m_connector *connector,
> > > > >                 *val =3D state->privacy_screen_sw_state;
> > > > >         } else if (property =3D=3D connector->broadcast_rgb_prope=
rty) {
> > > > >                 *val =3D state->hdmi.broadcast_rgb;
> > > > > +       } else if (property =3D=3D connector->color_format_proper=
ty) {
> > > > > +               *val =3D state->color_format;
> > > > >         } else if (connector->funcs->atomic_get_property) {
> > > > >                 return connector->funcs->atomic_get_property(conn=
ector,
> > > > >                                 state, property, val);
> > > > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/dr=
m_connector.c
> > > > > index 47dc53c4a738..e848374dee0b 100644
> > > > > --- a/drivers/gpu/drm/drm_connector.c
> > > > > +++ b/drivers/gpu/drm/drm_connector.c
> > > > > @@ -1388,6 +1388,18 @@ static const u32 hdmi_colorspaces =3D
> > > > >         BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65) |
> > > > >         BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER);
> > > > >
> > > > > +static const u32 hdmi_colorformats =3D
> > > > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
> > > > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
> > > > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
> > > > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
> > > > > +
> > > > > +static const u32 dp_colorformats =3D
> > > > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
> > > > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
> > > > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
> > > > > +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
> > > > > +
> > > > >  /*
> > > > >   * As per DP 1.4a spec, 2.2.5.7.5 VSC SDP Payload for Pixel Enco=
ding/Colorimetry
> > > > >   * Format Table 2-120
> > > > > @@ -2940,6 +2952,102 @@ int drm_connector_attach_colorspace_prope=
rty(struct drm_connector *connector)
> > > > >  }
> > > > >  EXPORT_SYMBOL(drm_connector_attach_colorspace_property);
> > > > >
> > > > > +/**
> > > > > + * drm_connector_attach_color_format_property - create and attac=
h color format property
> > > > > + * @connector: connector to create the color format property on
> > > > > + * @supported_color_formats: bitmask of bit-shifted &enum drm_ou=
tput_color_format
> > > > > + *                           values the connector supports
> > > > > + *
> > > > > + * Called by a driver to create a color format property. The pro=
perty is
> > > > > + * attached to the connector automatically on success.
> > > > > + *
> > > > > + * @supported_color_formats should only include color formats th=
e connector
> > > > > + * type can actually support.
> > > > > + *
> > > > > + * Returns:
> > > > > + * 0 on success, negative errno on error
> > > > > + */
> > > > > +int drm_connector_attach_color_format_property(struct drm_connec=
tor *connector,
> > > > > +                                              unsigned long supp=
orted_color_formats)
> > > > > +{
> > > > > +       struct drm_device *dev =3D connector->dev;
> > > > > +       struct drm_prop_enum_list enum_list[DRM_CONNECTOR_COLOR_F=
ORMAT_COUNT];
> > > > > +       unsigned int i =3D 0;
> > > > > +       unsigned long fmt;
> > > > > +
> > > > > +       if (connector->color_format_property)
> > > > > +               return 0;
> > > > > +
> > > > > +       if (!supported_color_formats) {
> > > > > +               drm_err(dev, "No supported color formats provided=
 on [CONNECTOR:%d:%s]\n",
> > > > > +                       connector->base.id, connector->name);
> > > > > +               return -EINVAL;
> > > > > +       }
> > > > > +
> > > > > +       if (supported_color_formats & ~GENMASK(DRM_OUTPUT_COLOR_F=
ORMAT_COUNT - 1, 0)) {
> > > > > +               drm_err(dev, "Unknown color formats provided on [=
CONNECTOR:%d:%s]\n",
> > > > > +                       connector->base.id, connector->name);
> > > > > +               return -EINVAL;
> > > > > +       }
> > > > > +
> > > > > +       switch (connector->connector_type) {
> > > > > +       case DRM_MODE_CONNECTOR_HDMIA:
> > > > > +       case DRM_MODE_CONNECTOR_HDMIB:
> > > > > +               if (supported_color_formats & ~hdmi_colorformats)=
 {
> > > > > +                       drm_err(dev, "Color formats not allowed f=
or HDMI on [CONNECTOR:%d:%s]\n",
> > > > > +                               connector->base.id, connector->na=
me);
> > > > > +                       return -EINVAL;
> > > > > +               }
> > > > > +               break;
> > > > > +       case DRM_MODE_CONNECTOR_DisplayPort:
> > > > > +       case DRM_MODE_CONNECTOR_eDP:
> > > > > +               if (supported_color_formats & ~dp_colorformats) {
> > > > > +                       drm_err(dev, "Color formats not allowed f=
or DP on [CONNECTOR:%d:%s]\n",
> > > > > +                               connector->base.id, connector->na=
me);
> > > > > +                       return -EINVAL;
> > > > > +               }
> > > > > +               break;
> > > > > +       }
> > > > > +
> > > > > +       enum_list[0].name =3D "AUTO";
> > > > > +       enum_list[0].type =3D DRM_CONNECTOR_COLOR_FORMAT_AUTO;
> > > > > +
> > > > > +       for_each_set_bit(fmt, &supported_color_formats, DRM_OUTPU=
T_COLOR_FORMAT_COUNT) {
> > > > > +               switch (fmt) {
> > > > > +               case DRM_OUTPUT_COLOR_FORMAT_RGB444:
> > > > > +                       enum_list[++i].type =3D DRM_CONNECTOR_COL=
OR_FORMAT_RGB444;
> > > > > +                       break;
> > > > > +               case DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
> > > > > +                       enum_list[++i].type =3D DRM_CONNECTOR_COL=
OR_FORMAT_YCBCR444;
> > > > > +                       break;
> > > > > +               case DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
> > > > > +                       enum_list[++i].type =3D DRM_CONNECTOR_COL=
OR_FORMAT_YCBCR422;
> > > > > +                       break;
> > > > > +               case DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
> > > > > +                       enum_list[++i].type =3D DRM_CONNECTOR_COL=
OR_FORMAT_YCBCR420;
> > > > > +                       break;
> > > > > +               default:
> > > > > +                       drm_warn(dev, "Unknown supported format %=
ld on [CONNECTOR:%d:%s]\n",
> > > > > +                                fmt, connector->base.id, connect=
or->name);
> > > > > +                       continue;
> > > > > +               }
> > > > > +               enum_list[i].name =3D drm_hdmi_connector_get_outp=
ut_format_name(fmt);
> > > > > +       }
> > > > > +
> > > > > +       connector->color_format_property =3D
> > > > > +               drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,=
 "color format",
> > > > > +                                        enum_list, i + 1);
> > > > > +
> > > > > +       if (!connector->color_format_property)
> > > > > +               return -ENOMEM;
> > > > > +
> > > > > +       drm_object_attach_property(&connector->base, connector->c=
olor_format_property,
> > > > > +                                  DRM_CONNECTOR_COLOR_FORMAT_AUT=
O);
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_connector_attach_color_format_property);
> > > > > +
> > > > >  /**
> > > > >   * drm_connector_atomic_hdr_metadata_equal - checks if the hdr m=
etadata changed
> > > > >   * @old_state: old connector state to compare
> > > > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connec=
tor.h
> > > > > index af8b92d2d5b7..bd549f912b76 100644
> > > > > --- a/include/drm/drm_connector.h
> > > > > +++ b/include/drm/drm_connector.h
> > > > > @@ -571,14 +571,102 @@ enum drm_colorspace {
> > > > >   *   YCbCr 4:2:2 output format (ie. with horizontal subsampling)
> > > > >   * @DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
> > > > >   *   YCbCr 4:2:0 output format (ie. with horizontal and vertical=
 subsampling)
> > > > > + * @DRM_OUTPUT_COLOR_FORMAT_COUNT:
> > > > > + *   Number of valid output color format values in this enum
> > > > >   */
> > > > >  enum drm_output_color_format {
> > > > >         DRM_OUTPUT_COLOR_FORMAT_RGB444 =3D 0,
> > > > >         DRM_OUTPUT_COLOR_FORMAT_YCBCR444,
> > > > >         DRM_OUTPUT_COLOR_FORMAT_YCBCR422,
> > > > >         DRM_OUTPUT_COLOR_FORMAT_YCBCR420,
> > > > > +       DRM_OUTPUT_COLOR_FORMAT_COUNT,
> > > > >  };
> > > > >
> > > > > +/**
> > > > > + * enum drm_connector_color_format - Connector Color Format Requ=
est
> > > > > + *
> > > > > + * This enum, unlike &enum drm_output_color_format, is used to s=
pecify requests
> > > > > + * for a specific color format on a connector through the DRM "c=
olor format"
> > > > > + * property. The difference is that it has an "AUTO" value to sp=
ecify that
> > > > > + * no specific choice has been made.
> > > > > + */
> > > > > +enum drm_connector_color_format {
> > > > > +       /**
> > > > > +        * @DRM_CONNECTOR_COLOR_FORMAT_AUTO: The driver or displa=
y protocol
> > > > > +        * helpers should pick a suitable color format. All imple=
mentations of a
> > > > > +        * specific display protocol must behave the same way wit=
h "AUTO", but
> > > > > +        * different display protocols do not necessarily have th=
e same "AUTO"
> > > > > +        * semantics.
> > > > > +        *
> > > > > +        * For HDMI, "AUTO" picks RGB, but falls back to YCbCr 4:=
2:0 if the
> > > > > +        * bandwidth required for full-scale RGB is not available=
, or the mode
> > > > > +        * is YCbCr 4:2:0-only, as long as the mode and output bo=
th support
> > > > > +        * YCbCr 4:2:0.
> > > >
> > > > Is there a reason you propose dropping back to YCbCr 4:2:0 without
> > > > trying YCbCr 4:2:2 first? Minimising the subsampling is surely
> > > > beneficial, and vc4 for one can do 4:2:2 but not 4:2:0.
> > >
> > > On HDMI 4:2:2 is always 12bpc, so it doesn't save any bandwidth
> > > compared to 8bpc 4:4:4.
> >
> > It does save bandwidth against 10 or 12bpc RGB 4:4:4.
> >
> > Or is the implication that max_bpc =3D 12 and
> > DRM_CONNECTOR_COLOR_FORMAT_AUTO should drop bpc down to 8 and select
> > RGB in preference to selecting 4:2:2?
>
> Yeah, YCbCr has all kinds of extra complications compared to RGB, so
> the policy is to use RGB if possible, and only fall back to YCbCr as a
> last resort. And in that case 4:2:0 is the only thing that can help.

So a media player wanting to do 12bpc HDR playback at 4k60 over HDMI
2.0 ends up with 8bpc RGB regardless. That sucks.
I guess at least an override is being added so userspace can take control.

I'd missed that vc4 had its behaviour changed with the
drm_hdmi_state_helper update :-(

  Dave

