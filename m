Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B296CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 17:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H4TFhfNSMGwjPeNsOXmb9yvPjIjSNQAAAb7A6Zv0Aas=; b=ajWP67PphBxdR44BYrmkUkiXnK
	s9tO+Sn2Nrz+5e7utT3lvbZX+qnwgH5esvBPEw4+dPEsHheRU82ApcnOBlzDyX2JlXrZu4LBUpWot
	bJGsmxdetmpm2FEdSoWoccBFUoLEcNcsh7DcvHons1A6OPx3WBqOD7U2fPrTo07osxufWAJaGYw87
	/vT/848fcFzI8F/6CcAv9vO27hM7OSza0uNGITwxR7WbJMs5INl14x7cC/r8j88ZmEQYEx82FLdEi
	OuWUshVne3yXv/jglsayqiJOHhQbAVbB2ut56RbPthXdycnBLPC+IJ4oSIvH9OMPQB2by6IWnJDTr
	BrLIbS8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJx7m-0000000DrIt-21v8;
	Mon, 04 May 2026 17:30:30 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJx7j-0000000DrHn-47yj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 17:30:29 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62952175;
	Mon,  4 May 2026 19:30:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777915824;
	bh=oTaUra+bG4LJjX8r95V5qmyr/EwumZmZ6vDS43GTKWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=saXpTw/cq+2cDG19nhWqSEzOT/A0uky1r/147CTZajVngYuq/6kB9hlWPqAqsj15V
	 JXaFQigz4g2A8QcgROUDLYMBLJ+kwwnCyknFVenHDN4bpS0d9hPujSdIVaxkiHD01X
	 mcHQKV4Y7dGJ6nf7pixCwPfGonYrRi3iBV6LFREg=
Date: Mon, 4 May 2026 20:30:25 +0300
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
Subject: Re: [PATCH v3 13/20] drm/atomic-state-helper: Rename
 __drm_atomic_helper_connector_state_reset()
Message-ID: <20260504173025.GP1344263@killaraus.ideasonboard.com>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
 <20260424-drm-mode-config-init-v3-13-8b68d9db0d8b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-drm-mode-config-init-v3-13-8b68d9db0d8b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_103028_176741_9F1E1272 
X-CRM114-Status: GOOD (  22.21  )
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

On Fri, Apr 24, 2026 at 12:18:53PM +0200, Maxime Ripard wrote:
> __drm_atomic_helper_connector_state_reset() is used to initialize a
> newly allocated drm_connector_state, and is being typically called by
> the drm_connector_funcs.reset implementation.
> 
> Since we want to consolidate DRM objects state allocation around the
> atomic_create_state callback that will only allocate and initialize a
> new drm_connector_state instance, we will need to call
> __drm_atomic_helper_connector_state_reset() from both the reset and
> atomic_create hooks.
> 
> To avoid any confusion, we can thus rename
> __drm_atomic_helper_connector_state_reset() to
> __drm_atomic_helper_connector_state_init().
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 12 ++++++------
>  include/drm/drm_atomic_state_helper.h     |  2 +-
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index b7da134c8c50..f67aacaa3b6e 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -496,24 +496,24 @@ void drm_atomic_helper_plane_destroy_state(struct drm_plane *plane,
>  	kfree(state);
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_plane_destroy_state);
>  
>  /**
> - * __drm_atomic_helper_connector_state_reset - reset the connector state
> + * __drm_atomic_helper_connector_state_init - Initializes the connector state

s/Initializes/Initialize/

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>   * @conn_state: atomic connector state, must not be NULL
> - * @connector: connectotr object, must not be NULL
> + * @connector: connector object, must not be NULL
>   *
>   * Initializes the newly allocated @conn_state with default
>   * values. This is useful for drivers that subclass the connector state.
>   */
>  void
> -__drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_state,
> -					  struct drm_connector *connector)
> +__drm_atomic_helper_connector_state_init(struct drm_connector_state *conn_state,
> +					 struct drm_connector *connector)
>  {
>  	conn_state->connector = connector;
>  }
> -EXPORT_SYMBOL(__drm_atomic_helper_connector_state_reset);
> +EXPORT_SYMBOL(__drm_atomic_helper_connector_state_init);
>  
>  /**
>   * __drm_atomic_helper_connector_reset - reset state on connector
>   * @connector: drm connector
>   * @conn_state: connector state to assign
> @@ -528,11 +528,11 @@ EXPORT_SYMBOL(__drm_atomic_helper_connector_state_reset);
>  void
>  __drm_atomic_helper_connector_reset(struct drm_connector *connector,
>  				    struct drm_connector_state *conn_state)
>  {
>  	if (conn_state)
> -		__drm_atomic_helper_connector_state_reset(conn_state, connector);
> +		__drm_atomic_helper_connector_state_init(conn_state, connector);
>  
>  	connector->state = conn_state;
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_connector_reset);
>  
> diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
> index 129762b99de6..e7c097e6dfe3 100644
> --- a/include/drm/drm_atomic_state_helper.h
> +++ b/include/drm/drm_atomic_state_helper.h
> @@ -70,11 +70,11 @@ struct drm_plane_state *
>  drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane);
>  void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state);
>  void drm_atomic_helper_plane_destroy_state(struct drm_plane *plane,
>  					  struct drm_plane_state *state);
>  
> -void __drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_state,
> +void __drm_atomic_helper_connector_state_init(struct drm_connector_state *conn_state,
>  					       struct drm_connector *connector);
>  void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
>  					 struct drm_connector_state *conn_state);
>  void drm_atomic_helper_connector_reset(struct drm_connector *connector);
>  void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);

-- 
Regards,

Laurent Pinchart

