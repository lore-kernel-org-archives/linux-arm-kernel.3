Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CBBF531C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 19:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZk+k8czwhWctFC5p9R1EXgSDmxRoBPmUGhzPw9xSaI=; b=IZbUkJ3xePEKnVIMFWn4Eqsxaz
	Ggxo3xH1t112DRI1+zKfvZhaXMoyfk0fwYgTe8Ti1vnRMGiPXdM9yJgcNjoNo3FPEZqjlLAfh0/dv
	RCezQSIj8lFWi0DAABigkljUc8rmU0Efpf3ycj/qctZqknUCHf53fDFFG2UqShuLIXoWop+pRYKm9
	ya1SeFbF+8C6qkpp6G8WSGjGBz3LLEy4mZJkiWmoF5Y4c3/SB3Qmxz6EJKhQuKc7EeAFeExW+sJHM
	tArW2R3UgrJ/buc7x9H2ML8ok+KVUA/stCoKSgEFnYHViC6PZHvdliyD0WbovNp80MKnNWHVR3nAV
	SNXRd1ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMr4-0000000GI5m-42gc;
	Mon, 13 Apr 2026 19:21:54 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMr2-0000000GI5F-24qF;
	Mon, 13 Apr 2026 19:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776108112; x=1807644112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/yuxMwENnIRcCPgqrASXBDil5WGzLxAiS5rqQNABMkc=;
  b=mhWDaI0I7cJ5yFifeIbMeI8Uljwsh62V7tDJvQGXYYm7HpfeJ5kijB+a
   b+4wWfbdtz35NYfXAlflvibYx8IuTzzlYwM01q0KYUeoUxaObZzyZhkbr
   M5gHPaCln/qsDTxd21W5TCsWKpldfw+6HeibfLCXX+gcBlSLwejZ7ayh2
   uJdMqlG3rR6DWId5CIm2eQcwMeSxVKdsuoFKI42YPusdz1BAn2n9U4l3J
   wXbevvjbj4SEpe9vh46Yk5hASUANA8NV7CJTkODz98neLHTUy9HLEOieC
   Wrk9JYLljgJG/mUDG84OMeJBROh7HZp5tbB+V7MxmGxO4E9+RdMTcNikU
   A==;
X-CSE-ConnectionGUID: cU4b2wB9S1Oxv+dv5Stf0Q==
X-CSE-MsgGUID: pV8yOkeeQXGwn7AJmYs1rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88435223"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="88435223"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 12:21:50 -0700
X-CSE-ConnectionGUID: +JW6UgNqSJaplS0n3VHDFQ==
X-CSE-MsgGUID: bC1tA4TnQ3+K75+6KoFutQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="225569953"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 12:21:40 -0700
Date: Mon, 13 Apr 2026 22:21:31 +0300
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
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v13 13/27] drm/i915: Implement the "color format" DRM
 property
Message-ID: <ad1CO9-nlaskZQM7@intel.com>
References: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
 <20260413-color-format-v13-13-ab37d4dfba48@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413-color-format-v13-13-ab37d4dfba48@collabora.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_122152_601485_32AAEBF6 
X-CRM114-Status: GOOD (  30.48  )
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

On Mon, Apr 13, 2026 at 12:07:27PM +0200, Nicolas Frattaroli wrote:
> Implement the "color format" DRM property for both DP and HDMI.  The
> values of the property include RGB, YCbCr420, YCbCr444 and Auto. Auto
> will pick RGB, with a fallback to YCbCr420.
> 
> The mask of supported formats by the source exposed by the property is
> an optimistic scenario, as specific DFP-related caveats can't be
> established before an EDID is present.
> 
> Should the explicitly requested color format not be supported by the
> sink (or by the source in combination with the sink), then an error is
> returned to userspace, so that it can make a better choice.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/i915/display/intel_connector.c | 10 +++++++
>  drivers/gpu/drm/i915/display/intel_connector.h |  1 +
>  drivers/gpu/drm/i915/display/intel_dp.c        | 38 +++++++++++++++++++++++---
>  drivers/gpu/drm/i915/display/intel_hdmi.c      | 38 +++++++++++++++++++++++---
>  4 files changed, 79 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
> index 7ef9338d67ab..b1a21dd77af6 100644
> --- a/drivers/gpu/drm/i915/display/intel_connector.c
> +++ b/drivers/gpu/drm/i915/display/intel_connector.c
> @@ -338,3 +338,13 @@ intel_attach_scaling_mode_property(struct drm_connector *connector)
>  
>  	connector->state->scaling_mode = DRM_MODE_SCALE_ASPECT;
>  }
> +
> +void
> +intel_attach_color_format_property(struct drm_connector *connector)
> +{
> +	const unsigned long fmts = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
> +				   BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
> +				   BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);

We're going to need different formats for different platforms, and 
for DP vs. HDMI.

For HDMI it should be fairly simple if we have the
ycbcr420_allowed and ycbcr444_allowed things to consult.

For DP I'm not sure if we want to advertise YCbCr output support
for platforms that can't produce it without help from the PCON.
If we know there is an on board PCON that can do it, then the answer
is probably yes. But without that it might be best to not advertise
the relevant formats unless source_can_output() tells us that it can
be directly output. We could at least start with that, and revisit
it later if some situations arise where eg. having explicit 4:2:0
output on older platforms is beneficial.

I think you want to split this to separate DP vs. HDMI patches since
the two require quite different logic.

> +
> +	drm_connector_attach_color_format_property(connector, fmts);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_connector.h b/drivers/gpu/drm/i915/display/intel_connector.h
> index 0aa86626e646..c77b7aac02cb 100644
> --- a/drivers/gpu/drm/i915/display/intel_connector.h
> +++ b/drivers/gpu/drm/i915/display/intel_connector.h
> @@ -34,5 +34,6 @@ void intel_attach_dp_colorspace_property(struct drm_connector *connector);
>  void intel_attach_scaling_mode_property(struct drm_connector *connector);
>  void intel_connector_queue_modeset_retry_work(struct intel_connector *connector);
>  void intel_connector_cancel_modeset_retry_work(struct intel_connector *connector);
> +void intel_attach_color_format_property(struct drm_connector *connector);
>  
>  #endif /* __INTEL_CONNECTOR_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 47bd3d59ea93..3b2293415b55 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3398,10 +3398,10 @@ intel_dp_compute_output_format(struct intel_encoder *encoder,
>  }
>  
>  static int
> -intel_dp_compute_formats(struct intel_encoder *encoder,
> -			 struct intel_crtc_state *crtc_state,
> -			 struct drm_connector_state *conn_state,
> -			 bool respect_downstream_limits)
> +intel_dp_compute_formats_auto(struct intel_encoder *encoder,
> +			      struct intel_crtc_state *crtc_state,
> +			      struct drm_connector_state *conn_state,
> +			      bool respect_downstream_limits)
>  {
>  	struct intel_display *display = to_intel_display(encoder);
>  	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
> @@ -3437,6 +3437,34 @@ intel_dp_compute_formats(struct intel_encoder *encoder,
>  	return ret;
>  }
>  
> +static int
> +intel_dp_compute_formats(struct intel_encoder *encoder,
> +			 struct intel_crtc_state *crtc_state,
> +			 struct drm_connector_state *conn_state,
> +			 bool respect_downstream_limits)
> +{
> +	switch (conn_state->color_format) {
> +	case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
> +		return intel_dp_compute_output_format(encoder, crtc_state, conn_state,
> +						      respect_downstream_limits,
> +						      INTEL_OUTPUT_FORMAT_RGB);
> +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR444:
> +		return intel_dp_compute_output_format(encoder, crtc_state, conn_state,
> +						      respect_downstream_limits,
> +						      INTEL_OUTPUT_FORMAT_YCBCR444);
> +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR420:
> +		return intel_dp_compute_output_format(encoder, crtc_state, conn_state,
> +						      respect_downstream_limits,
> +						      INTEL_OUTPUT_FORMAT_YCBCR420);
> +	case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
> +		return intel_dp_compute_formats_auto(encoder, crtc_state, conn_state,
> +						     respect_downstream_limits);
> +	default:
> +		MISSING_CASE(conn_state->color_format);
> +		return -EINVAL;
> +	}
> +}
> +
>  void
>  intel_dp_audio_compute_config(struct intel_encoder *encoder,
>  			      struct intel_crtc_state *pipe_config,
> @@ -7025,6 +7053,8 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *_connec
>  
>  	if (HAS_VRR(display))
>  		drm_connector_attach_vrr_capable_property(&connector->base);
> +
> +	intel_attach_color_format_property(&connector->base);
>  }
>  
>  static void
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 5ab5b5f85cde..632498e3702b 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2307,10 +2307,10 @@ static int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
>  	return intel_hdmi_compute_clock(encoder, crtc_state, respect_downstream_limits);
>  }
>  
> -static int intel_hdmi_compute_formats(struct intel_encoder *encoder,
> -				      struct intel_crtc_state *crtc_state,
> -				      const struct drm_connector_state *conn_state,
> -				      bool respect_downstream_limits)
> +static int intel_hdmi_compute_formats_auto(struct intel_encoder *encoder,
> +					   struct intel_crtc_state *crtc_state,
> +					   const struct drm_connector_state *conn_state,
> +					   bool respect_downstream_limits)
>  {
>  	struct intel_display *display = to_intel_display(encoder);
>  	struct intel_connector *connector = to_intel_connector(conn_state->connector);
> @@ -2345,6 +2345,35 @@ static int intel_hdmi_compute_formats(struct intel_encoder *encoder,
>  	return ret;
>  }
>  
> +static int intel_hdmi_compute_formats(struct intel_encoder *encoder,
> +				      struct intel_crtc_state *crtc_state,
> +				      const struct drm_connector_state *conn_state,
> +				      bool respect_downstream_limits)
> +{
> +	struct intel_connector *connector = to_intel_connector(conn_state->connector);
> +
> +	switch (conn_state->color_format) {
> +	case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
> +		return intel_hdmi_compute_output_format(encoder, crtc_state, connector,
> +							respect_downstream_limits,
> +							INTEL_OUTPUT_FORMAT_RGB);
> +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR444:
> +		return intel_hdmi_compute_output_format(encoder, crtc_state, connector,
> +							respect_downstream_limits,
> +							INTEL_OUTPUT_FORMAT_YCBCR444);
> +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR420:
> +		return intel_hdmi_compute_output_format(encoder, crtc_state, connector,
> +							respect_downstream_limits,
> +							INTEL_OUTPUT_FORMAT_YCBCR420);
> +	case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
> +		return intel_hdmi_compute_formats_auto(encoder, crtc_state, conn_state,
> +						       respect_downstream_limits);
> +	default:
> +		MISSING_CASE(conn_state->color_format);
> +		return -EINVAL;
> +	}
> +}
> +
>  static bool intel_hdmi_is_cloned(const struct intel_crtc_state *crtc_state)
>  {
>  	return crtc_state->uapi.encoder_mask &&
> @@ -2729,6 +2758,7 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *_
>  
>  	intel_attach_hdmi_colorspace_property(&connector->base);
>  	drm_connector_attach_content_type_property(&connector->base);
> +	intel_attach_color_format_property(&connector->base);
>  
>  	if (DISPLAY_VER(display) >= 10)
>  		drm_connector_attach_hdr_output_metadata_property(&connector->base);
> 
> -- 
> 2.53.0

-- 
Ville Syrjälä
Intel

