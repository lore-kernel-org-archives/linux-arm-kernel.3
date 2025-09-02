Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460B6CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKaL9Wk4WLi6c+lrZw0jzTG6+UqsebW9UGCExwatVEI=; b=fzcmps10GFKS5Y2D3nDNgoBalF
	7hiOYccqlLbPsDJTU9+4slFZW1oUWFA0neyEWN11LSfjv62B6kZNu5giPAlIQqIxpxB5jDKLj0G8K
	YFprROVDr+JAoJwhuxL8CdkmEwg9whKKGy/NKjNdLwOa0fN9wR3O4krUJ6r8oXHpGgQEY6CswQEF1
	dxxT0lzqEAkUYNiTyngBRMPd6k6iv8gloemzKnMBCTGJoTTEmJOFji3iLbNMKRyfiYJdWyOg40nh+
	yShzl5rKfD6DhgcBYariPraNvRu/KRqLbZCxqnGUCiCtxsFaIL2Md0SgZoa247wbobFQJAbcVTsN1
	myRtkLww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWPn-00000001cUu-0DkY;
	Tue, 02 Sep 2025 19:11:35 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRBp-000000005ac-0oxN;
	Tue, 02 Sep 2025 13:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756820209; x=1788356209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+O16tDhDhrBpLyMgsU885nrQA5KR/KrCl+HJfM6/ItA=;
  b=QGpsVvqNh9aGapNZWBGhM5ilynyco7uoVqgNjV0BX9+SE1ahC7W4+u0N
   quYV24wPgPRmtcWMZXgyjlrZxkIypHnlG+a3J9vUYVDmnPNN/5RgG/r7e
   y7O6ZldtFhwO6cTzDe9A5Fqs4SgojkY+puqbYS7fUAuObgn7UN+kiurHP
   NZTsJ0HqJ5M6zl2ahLFfL3E4zFN2fmvTFrcrXcVrGZNLCUn0/fojfN0IB
   AVE+o5zjmxMcJvgPWfpnaeteiNdsYR6SpKNVsl9YergavxeVpbNl/Bxnm
   23HiSLiEk8giupV3wSl64T6hD4GjCH+TS0c70eqcHuZ75mRxAwAuN40JX
   Q==;
X-CSE-ConnectionGUID: qrDcwXgKSFCZT2J16Pci3A==
X-CSE-MsgGUID: Jx6t0AzIQB2shrWNjFgTfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="62736794"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="62736794"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 06:36:47 -0700
X-CSE-ConnectionGUID: 8YzlxvkSQIC3enT5Sui24w==
X-CSE-MsgGUID: 5KRLd1wDT0iPdDWuEkyafw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="176588402"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO stinkbox) ([10.245.245.118])
  by orviesa005.jf.intel.com with SMTP; 02 Sep 2025 06:36:42 -0700
Received: by stinkbox (sSMTP sendmail emulation); Tue, 02 Sep 2025 16:36:40 +0300
Date: Tue, 2 Sep 2025 16:36:40 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>, kernel@collabora.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] drm: Add CRTC background color property
Message-ID: <aLby6OPxgubt7kd_@intel.com>
References: <20250902-rk3588-bgcolor-v1-0-fd97df91d89f@collabora.com>
 <20250902-rk3588-bgcolor-v1-1-fd97df91d89f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902-rk3588-bgcolor-v1-1-fd97df91d89f@collabora.com>
X-Patchwork-Hint: comment
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_063649_295334_FF1507ED 
X-CRM114-Status: GOOD (  42.19  )
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

On Tue, Sep 02, 2025 at 12:27:56PM +0300, Cristian Ciocaltea wrote:
> Some display controllers can be hardware programmed to show non-black
> colors for pixels that are either not covered by any plane or are
> exposed through transparent regions of higher planes.  This feature can
> help reduce memory bandwidth usage, e.g. in compositors managing a UI
> with a solid background color while using smaller planes to render the
> remaining content.
> 
> To support this capability, introduce the BACKGROUND_COLOR standard DRM
> mode property, which can be attached to a CRTC through the
> drm_crtc_attach_background_color_property() helper function.
> 
> Additionally, define a 64-bit ARGB format value to be built with the
> help of a dedicated drm_argb64() utility macro.  Individual color
> components can be extracted with desired precision using the
> corresponding DRM_ARGB64_*() macros.
> 
> Co-developed-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>  drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++++
>  drivers/gpu/drm/drm_blend.c               | 37 +++++++++++++++++++++++++++----
>  drivers/gpu/drm/drm_mode_config.c         |  6 +++++
>  include/drm/drm_blend.h                   |  4 +++-
>  include/drm/drm_crtc.h                    | 12 ++++++++++
>  include/drm/drm_mode_config.h             |  5 +++++
>  include/uapi/drm/drm_mode.h               | 30 +++++++++++++++++++++++++
>  8 files changed, 94 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 7142e163e618ea0d7d9d828e1bd9ff2a6ec0dfeb..359264cf467c5270b77f0b04548073bc92cb812e 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -75,6 +75,7 @@ __drm_atomic_helper_crtc_state_reset(struct drm_crtc_state *crtc_state,
>  				     struct drm_crtc *crtc)
>  {
>  	crtc_state->crtc = crtc;
> +	crtc_state->background_color = drm_argb64(0xffff, 0, 0, 0);
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_crtc_state_reset);
>  
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 85dbdaa4a2e25878c953b9b41539c8566d55c6d9..a447cb119aaa6cd11348be77b39f342a1386836d 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -407,6 +407,8 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>  					&replaced);
>  		state->color_mgmt_changed |= replaced;
>  		return ret;
> +	} else if (property == config->background_color_property) {
> +		state->background_color = val;
>  	} else if (property == config->prop_out_fence_ptr) {
>  		s32 __user *fence_ptr = u64_to_user_ptr(val);
>  
> @@ -452,6 +454,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
>  		*val = (state->ctm) ? state->ctm->base.id : 0;
>  	else if (property == config->gamma_lut_property)
>  		*val = (state->gamma_lut) ? state->gamma_lut->base.id : 0;
> +	else if (property == config->background_color_property)
> +		*val = state->background_color;
>  	else if (property == config->prop_out_fence_ptr)
>  		*val = 0;
>  	else if (property == crtc->scaling_filter_property)
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 6852d73c931ce32e62062e2b8f8c5e38612d5210..5a287d12685b007a2732f510f62675f500e53727 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -191,10 +191,6 @@
>   *		 plane does not expose the "alpha" property, then this is
>   *		 assumed to be 1.0
>   *
> - * Note that all the property extensions described here apply either to the
> - * plane or the CRTC (e.g. for the background color, which currently is not
> - * exposed and assumed to be black).
> - *
>   * SCALING_FILTER:
>   *     Indicates scaling filter to be used for plane scaler
>   *
> @@ -207,6 +203,23 @@
>   *
>   * Drivers can set up this property for a plane by calling
>   * drm_plane_create_scaling_filter_property
> + *
> + * The property extensions described above all apply to the plane.  Drivers
> + * may also expose the following crtc property extension:
> + *
> + * BACKGROUND_COLOR:
> + *	Background color is set via drm_crtc_attach_background_color_property().
> + *	It controls the ARGB color of a full-screen layer that exists below all
> + *	planes.  This color will be used for pixels not covered by any plane and
> + *	may also be blended with plane contents as allowed by a plane's alpha
> + *	values.  The background color defaults to black, and is assumed to be
> + *	black for drivers that do not expose this property.  Although background
> + *	color isn't a plane, it is assumed that the color provided here
> + *	undergoes the same pipe-level degamma/CSC/gamma transformations that
> + *	planes undergo.  Note that the color value provided here includes an
> + *	alpha channel, hence non-opaque background color values are allowed, but
> + *	are generally only honored in special cases (e.g. when a memory
> + *	writeback connector is in use).
>   */
>  
>  /**
> @@ -621,3 +634,19 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
> +
> +/**
> + * drm_crtc_attach_background_color_property - attach background color property
> + * @crtc: drm crtc
> + *
> + * Attaches the background color property to @crtc.  The property defaults to
> + * solid black and will accept 64-bit ARGB values in the format generated by
> + * drm_argb64().
> + */
> +void drm_crtc_attach_background_color_property(struct drm_crtc *crtc)
> +{
> +	drm_object_attach_property(&crtc->base,
> +				   crtc->dev->mode_config.background_color_property,
> +				   drm_argb64(0xffff, 0, 0, 0));
> +}
> +EXPORT_SYMBOL(drm_crtc_attach_background_color_property);
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 25f376869b3a41d47bbe72b0df3e35cad142f3e6..6d70bfab45ca2bb81ed3ca1940fd1cd85e8cc58e 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -375,6 +375,12 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
>  		return -ENOMEM;
>  	dev->mode_config.gamma_lut_size_property = prop;
>  
> +	prop = drm_property_create_range(dev, 0,
> +					 "BACKGROUND_COLOR", 0, U64_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	dev->mode_config.background_color_property = prop;
> +
>  	prop = drm_property_create(dev,
>  				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
>  				   "IN_FORMATS", 0);
> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
> index 88bdfec3bd8848acd1ef5742aaaa23483b332a2e..c7e888767c81c2745cd3cce88c10db4bbe305d1e 100644
> --- a/include/drm/drm_blend.h
> +++ b/include/drm/drm_blend.h
> @@ -31,8 +31,9 @@
>  #define DRM_MODE_BLEND_COVERAGE		1
>  #define DRM_MODE_BLEND_PIXEL_NONE	2
>  
> -struct drm_device;
>  struct drm_atomic_state;
> +struct drm_crtc;
> +struct drm_device;
>  struct drm_plane;
>  
>  static inline bool drm_rotation_90_or_270(unsigned int rotation)
> @@ -58,4 +59,5 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
>  			      struct drm_atomic_state *state);
>  int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>  					 unsigned int supported_modes);
> +void drm_crtc_attach_background_color_property(struct drm_crtc *crtc);
>  #endif
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index caa56e039da2a748cf40ebf45b37158acda439d9..4653dacc1077b9ed8fb4cf27cc84530ba1706f6a 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -274,6 +274,18 @@ struct drm_crtc_state {
>  	 */
>  	struct drm_property_blob *gamma_lut;
>  
> +	/**
> +	 * @background_color:
> +	 *
> +	 * RGB value representing the pipe's background color.  The background
> +	 * color (aka "canvas color") of a pipe is the color that will be used
> +	 * for pixels not covered by a plane, or covered by transparent pixels
> +	 * of a plane.  The value here should be built using drm_argb64(), while
> +	 * the individual color components can be extracted with desired
> +	 * precision via the DRM_ARGB64_*() macros.
> +	 */
> +	u64 background_color;
> +
>  	/**
>  	 * @target_vblank:
>  	 *
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 2e848b816218584eb077ed887bf97705f012a622..ea422afec5c4108a223dc872e1b6835ffc596cc3 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -814,6 +814,11 @@ struct drm_mode_config {
>  	 * gamma LUT as supported by the driver (read-only).
>  	 */
>  	struct drm_property *gamma_lut_size_property;
> +	/**
> +	 * @background_color_property: Optional CRTC property to set the
> +	 * background color.
> +	 */
> +	struct drm_property *background_color_property;
>  
>  	/**
>  	 * @suggested_x_property: Optional connector property with a hint for
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index a122bea2559387576150236e3a88f99c24ad3138..4bd6a8ca8868109bcbe21f9f6e9864519c9d03ec 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -1363,6 +1363,36 @@ struct drm_mode_closefb {
>  	__u32 pad;
>  };
>  
> +/*
> + * Put 16-bit ARGB values into a standard 64-bit representation that
> + * can be used for ioctl parameters, inter-driver communication, etc.
> + */
> +static inline __u64
> +drm_argb64(__u16 alpha, __u16 red, __u16 green, __u16 blue)
> +{
> +	return (__u64)alpha << 48 | (__u64)red << 32 | (__u64)green << 16 | blue;
> +}
> +
> +/*
> + * Extract the specified number of least-significant bits of a specific
> + * color component from a standard 64-bit ARGB value.

Why would you ever want the least significant bits?

> + */
> +#define DRM_ARGB64_COMP(c, shift, numlsb) \
> +	((__u16)(((c) >> (shift)) & ((1UL << (numlsb) % 17) - 1)))
> +#define DRM_ARGB64_ALPHA_LSB(c, numlsb) DRM_ARGB64_COMP(c, 48, numlsb)
> +#define DRM_ARGB64_RED_LSB(c, numlsb)   DRM_ARGB64_COMP(c, 32, numlsb)
> +#define DRM_ARGB64_GREEN_LSB(c, numlsb) DRM_ARGB64_COMP(c, 16, numlsb)
> +#define DRM_ARGB64_BLUE_LSB(c, numlsb)  DRM_ARGB64_COMP(c, 0, numlsb)
> +
> +/*
> + * Convenience wrappers to extract all 16 bits of a specific color
> + * component from a standard 64-bit ARGB value.
> + */
> +#define DRM_ARGB64_ALPHA(c)		DRM_ARGB64_ALPHA_LSB(c, 16)
> +#define DRM_ARGB64_RED(c)		DRM_ARGB64_RED_LSB(c, 16)
> +#define DRM_ARGB64_GREEN(c)		DRM_ARGB64_GREEN_LSB(c, 16)
> +#define DRM_ARGB64_BLUE(c)		DRM_ARGB64_BLUE_LSB(c, 16)
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> 
> -- 
> 2.51.0

-- 
Ville Syrjälä
Intel

