Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45E2F54ADA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 17:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+isJQfWAsYsdQdTz9T3chlzRvG/qCLh+jFsK7/tZVE=; b=GYbAAayYP/EqIUN9AkWZebwW7P
	9BBX98l8bQ8vh+vH2Qq9fS1Drx+Q9Xk/N196latqB/A1xawT5eKL3UAjChHkOuqkZHZQ36E975/Bz
	ZqzEZ9orO41am7CVjTL4oLgV0uUPpVS+ZBqIuUVBXjpGR2SJss6BcVB3SG2G3ieqnqP5gN9Dood6/
	dsn1ZqWXHomm1q6Dc7XM5nF2H30OiqUmiTyoFVz3PEfXjfg88giDgVoU/0F06VWulp+njWcsbdTq2
	w4miIpUplFDpX+IILBdlHQl7IqEGQcK4bjViBsK1hWKoAv8lB00zjczP3iBq0qKBB6gMei5j7dIY4
	xUeotoqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w557v-00000001xYb-3cRr;
	Tue, 24 Mar 2026 17:01:11 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w557o-00000001xSk-3fOR;
	Tue, 24 Mar 2026 17:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774371665; x=1805907665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=aDKWI4cKGQKK5hVg6AfnHxki62nohW34+6dDQKvaUzA=;
  b=TrL523X9mkaqiErQOaUcRyUkdNBtE+QPuPEWrK4v0DRymib2AR5qKeke
   yKLWWwma5SVKTz3oNE6FWf8/wNsvUkMzRVdCNXztcdVW6wOuCt53f4vEQ
   OrKX68iWkrjY8bVqFM9QCo3M9L5f+7+/rDrio+LrD4yitiNEy9PBLOwnh
   RpFoKZcYtUpwAoFFHxHmjfaBbqpoyNkqx79W+IMHQL9yY7FA75QnWcbE3
   /9JlajL2CFgE6WiHONlfJK6Pjd7v6QJylm8mHg8WdhwvRBlyWqym7M2vy
   c6KHta0ZgdjVMzFobE96tZDGkxAyVwH45aTYfSfR3tbMusKFm/YF32Qg4
   g==;
X-CSE-ConnectionGUID: QufFrYzfRnCPEnLwcRmjqw==
X-CSE-MsgGUID: S1HTuNjnSH2l3hzjVAMrKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="78991857"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="78991857"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:01:00 -0700
X-CSE-ConnectionGUID: b4BAW2/ERUWoQ6r6oZykng==
X-CSE-MsgGUID: SL+/tSDtRZahvvTQl/a0tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="254912602"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.220])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:00:49 -0700
Date: Tue, 24 Mar 2026 19:00:45 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>,
	Andri Yngvason <andri@yngvason.is>,
	Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v11 03/22] drm: Add new general DRM property "color
 format"
Message-ID: <acLDPYuaVI2-12JX@intel.com>
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
 <20260324-color-format-v11-3-605559af4fb4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260324-color-format-v11-3-605559af4fb4@collabora.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_100104_978159_9703DF05 
X-CRM114-Status: GOOD (  22.93  )
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

On Tue, Mar 24, 2026 at 05:01:07PM +0100, Nicolas Frattaroli wrote:
> +enum drm_connector_color_format {
> +	/**
> +	 * @DRM_CONNECTOR_COLOR_FORMAT_AUTO: The driver or display protocol
> +	 * helpers should pick a suitable color format. All implementations of a
> +	 * specific display protocol must behave the same way with "AUTO", but
> +	 * different display protocols do not necessarily have the same "AUTO"
> +	 * semantics.
> +	 *
> +	 * For HDMI, "AUTO" picks RGB, but falls back to YCbCr 4:2:0 if the
> +	 * bandwidth required for full-scale RGB is not available, or the mode
> +	 * is YCbCr 4:2:0-only, as long as the mode and output both support
> +	 * YCbCr 4:2:0.
> +	 *
> +	 * For display protocols other than HDMI, the recursive bridge chain
> +	 * format selection picks the first chain of bridge formats that works,
> +	 * as has already been the case before the introduction of the "color
> +	 * format" property. Non-HDMI bridges should therefore either sort their
> +	 * bus output formats by preference, or agree on a unified auto format
> +	 * selection logic that's implemented in a common state helper (like
> +	 * how HDMI does it).
> +	 */
> +	DRM_CONNECTOR_COLOR_FORMAT_AUTO = 0,
> +
> +	/**
> +	 * @DRM_CONNECTOR_COLOR_FORMAT_RGB444: RGB output format
> +	 */
> +	DRM_CONNECTOR_COLOR_FORMAT_RGB444,
> +
> +	/**
> +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR444: YCbCr 4:4:4 output format (ie.
> +	 * not subsampled)
> +	 */
> +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR444,
> +
> +	/**
> +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR422: YCbCr 4:2:2 output format (ie.
> +	 * with horizontal subsampling)
> +	 */
> +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR422,
> +
> +	/**
> +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR420: YCbCr 4:2:0 output format (ie.
> +	 * with horizontal and vertical subsampling)
> +	 */
> +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR420,

Seems like this should document what the quantization range
should be for each format.

> +
> +	/**
> +	 * @DRM_CONNECTOR_COLOR_FORMAT_COUNT: Number of valid connector color
> +	 * format values in this enum
> +	 */
> +	DRM_CONNECTOR_COLOR_FORMAT_COUNT,
> +};
> +
> +/**
> + * drm_connector_color_format_valid - Validate drm_connector_color_format value
> + * @fmt: value to check against all values of &enum drm_connector_color_format
> + *
> + * Checks whether the passed in value of @fmt is one of the allowable values in
> + * &enum drm_connector_color_format.
> + *
> + * Returns: %true if it's a valid value for the enum, %false otherwise.
> + */
> +static inline bool __pure
> +drm_connector_color_format_valid(enum drm_connector_color_format fmt)
> +{
> +	switch (fmt) {
> +	case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
> +	case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
> +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR444:
> +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR422:
> +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR420:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>  const char *
>  drm_hdmi_connector_get_output_format_name(enum drm_output_color_format fmt);
>  
> @@ -1129,6 +1217,13 @@ struct drm_connector_state {
>  	 */
>  	enum drm_colorspace colorspace;
>  
> +	/**
> +	 * @color_format: State variable for Connector property to request
> +	 * color format change on Sink. This is most commonly used to switch
> +	 * between RGB to YUV and vice-versa.
> +	 */
> +	enum drm_connector_color_format color_format;
> +
>  	/**
>  	 * @writeback_job: Writeback job for writeback connectors
>  	 *
> @@ -2127,6 +2222,12 @@ struct drm_connector {
>  	 */
>  	struct drm_property *colorspace_property;
>  
> +	/**
> +	 * @color_format_property: Connector property to set the suitable
> +	 * color format supported by the sink.
> +	 */
> +	struct drm_property *color_format_property;
> +
>  	/**
>  	 * @path_blob_ptr:
>  	 *
> @@ -2610,6 +2711,9 @@ bool drm_connector_has_possible_encoder(struct drm_connector *connector,
>  					struct drm_encoder *encoder);
>  const char *drm_get_colorspace_name(enum drm_colorspace colorspace);
>  
> +int drm_connector_attach_color_format_property(struct drm_connector *connector,
> +					       unsigned long supported_color_formats);
> +
>  /**
>   * drm_for_each_connector_iter - connector_list iterator macro
>   * @connector: &struct drm_connector pointer used as cursor
> 
> -- 
> 2.53.0

-- 
Ville Syrjälä
Intel

