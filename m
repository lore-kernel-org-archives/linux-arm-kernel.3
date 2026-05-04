Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E00CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 16:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7U22c9/WfeGG2HEFD/xbqfhLQ3x217G8zkGq3iuNhic=; b=lRLyhSJORhKvIRXTdRyOLgGp3o
	85OmhU8q6tCti0jdCTjeCzb/4e4JLx+It5E6dzEguWCW5SvAplEbUnR/bkF3tSKCV5RT9joPY1Tkf
	7xZZhC9cIHLCkwc4eFKhkPJu+BzVtwipVuSdfV5sUpirW9FUU4ypcpdq8gQrDTihx/wNcCrzubzXc
	zVwLYr7thOqg9PKg3emUYPl3mMksMx+tzD1BBi0a8UmP4WtjBTUrIidQVN+bnu/0tH49OGma+p0Vq
	gmfESEn87TXweRq3r8yXKm/xzQ7dYvu59kr2JuQ3AQFXXyEpMw0US+sx3CxaDXcAtOhDi0YyAO7o7
	Hk7ll4sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwNX-0000000DkBv-0McA;
	Mon, 04 May 2026 16:42:43 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwNU-0000000DkBF-2skg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 16:42:41 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 397059C;
	Mon,  4 May 2026 18:42:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777912957;
	bh=x92dCrtj1Xz/Y1c8aBQDwyr3IWFnuu7loZj+174mpQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R8+5/AW6TIz6Hirr1Yu5wz1VTvyFqv1PKg0Wr6VFGDp8mpOnmOZbfmT2fhBboOCz3
	 2qja54WTb8u2RRuAzEOW1EjYDv63b7FXiZEYI98YHyGz8fvDrGHXr+/h6xvwwB67vM
	 TfMvP8g7DCoGCl/5F8i9f4jtMnONzEjHaRIpHIXw=
Date: Mon, 4 May 2026 19:42:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Simon Ser <contact@emersion.fr>,
	Harry Wentland <harry.wentland@amd.com>,
	Melissa Wen <mwen@igalia.com>,
	Sebastian Wick <sebastian.wick@redhat.com>,
	Alex Hung <alex.hung@amd.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 09/20] drm/atomic-state-helper: Rename
 __drm_atomic_helper_plane_state_reset()
Message-ID: <20260504164237.GL1344263@killaraus.ideasonboard.com>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
 <20260424-drm-mode-config-init-v3-9-8b68d9db0d8b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-drm-mode-config-init-v3-9-8b68d9db0d8b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_094240_865495_3A8B59B1 
X-CRM114-Status: GOOD (  22.86  )
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

On Fri, Apr 24, 2026 at 12:18:49PM +0200, Maxime Ripard wrote:
> __drm_atomic_helper_plane_state_reset() is used to initialize a newly
> allocated drm_plane_state, and is being typically called by the
> drm_plane_funcs.reset implementation.
> 
> Since we want to consolidate DRM objects state allocation around the
> atomic_create_state callback that will only allocate and initialize a
> new drm_plane_state instance, we will need to call
> __drm_atomic_helper_plane_state_reset() from both the reset and
> atomic_create hooks.
> 
> To avoid any confusion, we can thus rename
> __drm_atomic_helper_plane_state_reset() to
> __drm_atomic_helper_plane_state_init().
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c  | 12 ++++++------
>  drivers/gpu/drm/i915/display/intel_plane.c |  2 +-
>  include/drm/drm_atomic_state_helper.h      |  2 +-
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index e1f3d05ad347..285efbf29520 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -235,19 +235,19 @@ void drm_atomic_helper_crtc_destroy_state(struct drm_crtc *crtc,
>  	kfree(state);
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_crtc_destroy_state);
>  
>  /**
> - * __drm_atomic_helper_plane_state_reset - resets plane state to default values
> + * __drm_atomic_helper_plane_state_init - Initializes the plane state
>   * @plane_state: atomic plane state, must not be NULL
>   * @plane: plane object, must not be NULL
>   *
>   * Initializes the newly allocated @plane_state with default
> - * values. This is useful for drivers that subclass the CRTC state.
> + * values. This is useful for drivers that subclass the plane state.
>   */
> -void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
> -					   struct drm_plane *plane)
> +void __drm_atomic_helper_plane_state_init(struct drm_plane_state *plane_state,
> +					  struct drm_plane *plane)
>  {
>  	u64 val;
>  
>  	plane_state->plane = plane;
>  	plane_state->rotation = DRM_MODE_ROTATE_0;
> @@ -295,11 +295,11 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
>  							   plane->hotspot_y_property,
>  							   &val))
>  			plane_state->hotspot_y = val;
>  	}
>  }
> -EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
> +EXPORT_SYMBOL(__drm_atomic_helper_plane_state_init);
>  
>  /**
>   * __drm_atomic_helper_plane_reset - reset state on plane
>   * @plane: drm plane
>   * @plane_state: plane state to assign
> @@ -313,11 +313,11 @@ EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
>   */
>  void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
>  				     struct drm_plane_state *plane_state)
>  {
>  	if (plane_state)
> -		__drm_atomic_helper_plane_state_reset(plane_state, plane);
> +		__drm_atomic_helper_plane_state_init(plane_state, plane);
>  
>  	plane->state = plane_state;
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_plane_reset);
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
> index 5390ceb21ca4..d013d9228d0b 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
> @@ -65,11 +65,11 @@
>  static void intel_plane_state_reset(struct intel_plane_state *plane_state,
>  				    struct intel_plane *plane)
>  {
>  	memset(plane_state, 0, sizeof(*plane_state));
>  
> -	__drm_atomic_helper_plane_state_reset(&plane_state->uapi, &plane->base);
> +	__drm_atomic_helper_plane_state_init(&plane_state->uapi, &plane->base);
>  
>  	plane_state->scaler_id = -1;
>  }
>  
>  struct intel_plane *intel_plane_alloc(void)
> diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
> index 900672c6ea90..44e8850aae7f 100644
> --- a/include/drm/drm_atomic_state_helper.h
> +++ b/include/drm/drm_atomic_state_helper.h
> @@ -51,11 +51,11 @@ struct drm_crtc_state *
>  drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc);
>  void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state);
>  void drm_atomic_helper_crtc_destroy_state(struct drm_crtc *crtc,
>  					  struct drm_crtc_state *state);
>  
> -void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *state,
> +void __drm_atomic_helper_plane_state_init(struct drm_plane_state *state,
>  					   struct drm_plane *plane);
>  void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
>  				     struct drm_plane_state *state);
>  void drm_atomic_helper_plane_reset(struct drm_plane *plane);
>  void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
> 

-- 
Regards,

Laurent Pinchart

