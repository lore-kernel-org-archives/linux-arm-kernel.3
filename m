Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4295EF459F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 16:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3EJ/j8Y3xGgtauux/V3MgdxrEh+Kftczt7PkY6FEJgs=; b=UMaDbf1eauSIvxV2lUyU7G1ZXL
	z3cVPs5xe6HRMrjKEh0cykcDK70Jym6MKhP8Sk/y9r0zR0Sm8XnR6XPCenBwlpRKWQzDp4GG87imq
	94zHXCEBMM84Vz1wTGFqaA1knZz6O1YFFs2q23uKKmJhs8o5cRspngPXOS0HoIOapznGNpq8lsE+j
	aQNiNdSW61VZRR0Lc8fE2IRfcbGPMXbyuIutq7fMLDT7Thf7Scg8wfjbCVmbHD2xPMb5k+p3z9sTO
	Y1wT9nkvBbP1ao/9tr8/piVb6r+VN8QsHPfBnMzr2e4gb6UsT1939tRKqvHS4xOmun9nGn6udNjbg
	WcvqwZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBEhq-0000000CXcj-0fM1;
	Fri, 10 Apr 2026 16:27:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBEho-0000000CXcR-256U;
	Fri, 10 Apr 2026 16:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3EJ/j8Y3xGgtauux/V3MgdxrEh+Kftczt7PkY6FEJgs=; b=EKv30UgHaMvKc5ySPmvaX58xLx
	91t4AMbQwLe1LB+YldkBDksu5a4gpdmMgePXNi+1/4u5cIG0nmZEl/Jn12dzaUS7YE+Dz7hX0lqTG
	zNeKXoRAwlf7iliHSSGv6PHNt8zW8KS58b7Z9FsOcbp8Gr2kBHtwQntzit2FClKZ6CfFdDBAYsO7W
	cLRDrAdgPpFbVLMwxGNDuawSqRhxnqfUilHYv6NKf3DXxpPkc1rOqmM+n+0zOcFfPrqJfbqi9aRue
	40C+KJktscSXt/GYJEIUEHE6icdRM56YCexbp0VeF66249YC1PjXUbspuWncSnH3jxq+EFjRh+2YV
	U6k1qq7g==;
Received: from mgamail.intel.com ([192.198.163.14])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBEhl-0000000DuZM-1ByF;
	Fri, 10 Apr 2026 16:27:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775838457; x=1807374457;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=IHrh+GDST0ffvb9fJgkO4xud4pnrUR86nT8oGDk1Bxw=;
  b=R1zI9KREbmZajlDlygeKyTeTD+sC6jdFmqB+tOxWPU6ej7k3nbXzfYVD
   K1w/b62hQEQ5jdgnJdrSG97WqCSCsqBYolcN0SDcwZCMTX4wBcQen7t8v
   HCZFuV4Mlj7fFRodSSCmTWeCnQLT7LV/xkO/kOSThG06f7dcrHtsCI5jq
   OkuQec73wuFasgRcskYIZmzOV72OPCWkk11tbEwfUZKKgyZy+GPxccu3k
   4knbv8qiCsEK4wqXmdwBHPf8VL1TXJf8cvzTi55sDi1rxjmeOVgDVS6gq
   trP0ss0RNSchZ8GKIsCbuI4PFTCtj9kSLxGJhgkRLNACU061NdxgD+Gtu
   A==;
X-CSE-ConnectionGUID: t7/d8dn6QfWSBHpE2U3yGw==
X-CSE-MsgGUID: OSL6dvK0RMqYQmtJIKjb/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76933465"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76933465"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 09:27:07 -0700
X-CSE-ConnectionGUID: 4/fIzqdnQ+CpUdSv9Sm0GA==
X-CSE-MsgGUID: eGq97sFQSFWZyxYa7Ez6/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="225962466"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.149])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 09:26:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kory Maincent <kory.maincent@bootlin.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave
 Airlie <airlied@redhat.com>, Jesse Barnes <jbarnes@virtuousgeek.org>, Eric
 Anholt <eric@anholt.net>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chris Wilson
 <chris@chris-wilson.co.uk>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Mark Yacoub
 <markyacoub@google.com>, Sean Paul <seanpaul@google.com>, Louis Chauvet
 <louis.chauvet@bootlin.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Simona Vetter
 <simona.vetter@ffwll.ch>, Kory Maincent <kory.maincent@bootlin.com>
Subject: Re: [PATCH RFC 10/12] drm/i915/display/dp: Adopt dp_connector
 helpers to expose link training state
In-Reply-To: <20260409-feat_link_cap-v1-10-7069e8199ce2@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260409-feat_link_cap-v1-0-7069e8199ce2@bootlin.com>
 <20260409-feat_link_cap-v1-10-7069e8199ce2@bootlin.com>
Date: Fri, 10 Apr 2026 19:26:53 +0300
Message-ID: <e253ca4fa0b493032a7b35a0a20689b9d9e0c4e7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_172737_697581_8121B984 
X-CRM114-Status: GOOD (  22.81  )
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

On Thu, 09 Apr 2026, Kory Maincent <kory.maincent@bootlin.com> wrote:
> Switch the i915 DP connector initialization from drmm_connector_init()
> to drmm_connector_dp_init(), providing the source link capabilities
> (supported lane counts, link rates, DSC support, voltage swing and
> pre-emphasis levels).
>
> Add intel_dp_report_link_train() to collect the negotiated link
> parameters (rate, lane count, DSC enable, per-lane voltage swing and
> pre-emphasis) and report them via drm_connector_dp_set_link_train_properties()
> once link training completes successfully.
>
> Reset the link training properties via
> drm_connector_dp_reset_link_train_properties() when the connector is
> reported as disconnected or when the display device is disabled, so
> the exposed state always reflects the current link status.
>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c            | 31 +++++++++++++++++++---
>  .../gpu/drm/i915/display/intel_dp_link_training.c  | 25 +++++++++++++++++
>  2 files changed, 52 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 2af64de9c81de..641406bdc0cc9 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -45,6 +45,7 @@
>  #include <drm/display/drm_hdmi_helper.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
> +#include <drm/drm_dp_connector.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_fixed.h>
>  #include <drm/drm_managed.h>
> @@ -6337,8 +6338,10 @@ intel_dp_detect(struct drm_connector *_connector,
>  	drm_WARN_ON(display->drm,
>  		    !drm_modeset_is_locked(&display->drm->mode_config.connection_mutex));
>  
> -	if (!intel_display_device_enabled(display))
> +	if (!intel_display_device_enabled(display)) {
> +		drm_connector_dp_reset_link_train_properties(_connector);
>  		return connector_status_disconnected;
> +	}
>  
>  	if (!intel_display_driver_check_access(display))
>  		return connector->base.status;
> @@ -6388,6 +6391,8 @@ intel_dp_detect(struct drm_connector *_connector,
>  
>  		intel_dp_tunnel_disconnect(intel_dp);
>  
> +		drm_connector_dp_reset_link_train_properties(_connector);
> +
>  		goto out_unset_edid;
>  	}
>  
> @@ -7162,10 +7167,12 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
>  			struct intel_connector *connector)
>  {
>  	struct intel_display *display = to_intel_display(dig_port);
> +	struct drm_connector_dp_link_train_caps link_caps;
>  	struct intel_dp *intel_dp = &dig_port->dp;
>  	struct intel_encoder *encoder = &dig_port->base;
>  	struct drm_device *dev = encoder->base.dev;
>  	enum port port = encoder->port;
> +	u32 *rates;
>  	int type;
>  
>  	if (drm_WARN(dev, dig_port->max_lanes < 1,
> @@ -7213,8 +7220,25 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
>  		    type == DRM_MODE_CONNECTOR_eDP ? "eDP" : "DP",
>  		    encoder->base.base.id, encoder->base.name);
>  
> -	drmm_connector_init(dev, &connector->base, &intel_dp_connector_funcs,
> -			    type, &intel_dp->aux.ddc);
> +	intel_dp_set_source_rates(intel_dp);
> +	link_caps.nlanes = DRM_DP_1LANE | DRM_DP_2LANE | DRM_DP_4LANE;
> +	link_caps.nrates = intel_dp->num_source_rates;
> +	rates = kzalloc_objs(*rates, intel_dp->num_source_rates);
> +	if (!rates)
> +		goto fail;
> +
> +	for (int i = 0; i < intel_dp->num_source_rates; i++)
> +		rates[i] = intel_dp->source_rates[i];
> +
> +	link_caps.rates = rates;
> +	link_caps.dsc = true;

You have a source, you have a sink, and you have a link between the two.

Source rates do not reflect the link rates common between source and
sink.

DSC depends on source and sink, and it's not statically "true" for
either, and depends on a bunch of things.

BR,
Jani.

> +	link_caps.v_swings = DRM_DP_VOLTAGE_SWING_LEVEL_MASK;
> +	link_caps.pre_emphs = DRM_DP_PRE_EMPH_LEVEL_MASK;
> +
> +	drmm_connector_dp_init(dev, &connector->base, &intel_dp_connector_funcs,
> +			       &link_caps, type, &intel_dp->aux.ddc);
> +	kfree(rates);
> +
>  	drm_connector_helper_add(&connector->base, &intel_dp_connector_helper_funcs);
>  
>  	if (drmm_add_action_or_reset(dev, intel_connector_destroy, connector)) {
> @@ -7240,7 +7264,6 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
>  	if (!intel_edp_init_connector(intel_dp, connector))
>  		goto fail;
>  
> -	intel_dp_set_source_rates(intel_dp);
>  	intel_dp_set_common_rates(intel_dp);
>  	intel_dp_reset_link_params(intel_dp);
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index 54c585c59b900..c2fd46a323650 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -25,6 +25,7 @@
>  #include <linux/iopoll.h>
>  
>  #include <drm/display/drm_dp_helper.h>
> +#include <drm/drm_dp_connector.h>
>  #include <drm/drm_print.h>
>  
>  #include "intel_display_core.h"
> @@ -1116,6 +1117,27 @@ intel_dp_128b132b_intra_hop(struct intel_dp *intel_dp,
>  	return sink_status & DP_INTRA_HOP_AUX_REPLY_INDICATION ? 1 : 0;
>  }
>  
> +static void intel_dp_report_link_train(struct intel_dp *intel_dp)
> +{
> +	struct intel_connector *connector = intel_dp->attached_connector;
> +	struct drm_connector_dp_link_train dp_link_train;
> +
> +	dp_link_train.rate = intel_dp->link_rate;
> +	dp_link_train.nlanes = intel_dp->lane_count;
> +	dp_link_train.dsc_en = connector->dp.dsc_decompression_enabled;
> +
> +	for (int i = 0; i < intel_dp->lane_count; i++) {
> +		int v_swing_level = (intel_dp->train_set[i] &
> +				     DP_TRAIN_VOLTAGE_SWING_MASK) >> DP_TRAIN_VOLTAGE_SWING_SHIFT;
> +		int pre_emph_level = (intel_dp->train_set[i] &
> +				      DP_TRAIN_PRE_EMPHASIS_MASK) >> DP_TRAIN_PRE_EMPHASIS_SHIFT;
> +		dp_link_train.v_swing[i] = 1 << v_swing_level;
> +		dp_link_train.pre_emph[i] = 1 << pre_emph_level;
> +	}
> +
> +	drm_connector_dp_set_link_train_properties(&connector->base, &dp_link_train);
> +}
> +
>  /**
>   * intel_dp_stop_link_train - stop link training
>   * @intel_dp: DP struct
> @@ -1144,6 +1166,9 @@ void intel_dp_stop_link_train(struct intel_dp *intel_dp,
>  	intel_dp_program_link_training_pattern(intel_dp, crtc_state, DP_PHY_DPRX,
>  					       DP_TRAINING_PATTERN_DISABLE);
>  
> +	if (!intel_dp->is_mst)
> +		intel_dp_report_link_train(intel_dp);
> +
>  	if (intel_dp_is_uhbr(crtc_state)) {
>  		ret = poll_timeout_us(ret = intel_dp_128b132b_intra_hop(intel_dp, crtc_state),
>  				      ret == 0,

-- 
Jani Nikula, Intel

