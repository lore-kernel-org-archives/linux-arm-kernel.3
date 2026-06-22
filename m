Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E35CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 07:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oP3EC6sgK7zJ7xWtXJcDnj3pgjRmu/060XGMI0EwiSE=; b=sWYvFZIx9pPY/+zg4ZWOqaehd/
	ddf365K+iENnDh9hujHBtZUrYB/z/YJhkq71gh3veuzpnE+vSb0k5zd4gjfkuzqv5F7+JyLJ/jHN3
	Mj+TFGpZitLNG3k444rxdO+Ahlk3oE447bbDNGAAVCKhNUl1US6w8uVorbtO5XNC5rmVrfcLVPxyf
	gRLoLe5uY7oYKVIZLKcjwima9oBHBMvq3ikLg5ZxggPK2yggYkVnXl6KhRYGueaT6+2ry55Kq/wOw
	BHSklDvcYidU/sES0Xvd0dRLpDRJf7TMEOkr6a01uYCFSiTvkZUMG30pSwoW5xZCLHuKnO7vB9Trb
	/E3fDhjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZ5D-00000004XWo-0nR5;
	Mon, 22 Jun 2026 07:28:39 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZ59-00000004XWM-3GDa;
	Mon, 22 Jun 2026 07:28:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782113316; x=1813649316;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=oYpjZdXEXlbswEz5tTfmaOPHrTKzTbw/rXrTF2N68Cg=;
  b=Xqr53oWiyJ+8OaNGM3KdEqX6VTIYBWknae6QVC82h/EPGW8ZXj7CKtDT
   1lgHVVRp5weS6inkTdk++QG807V0SAotyAjySLLrPucrPVhi6puRzz09e
   6eJveL1DgODXQo7B80Kbk6FgoF/pyMn8Y369qZ7AtUEJJSTsVeEZJgeoB
   fXJqafjOKLjHBUgPLMYsLJA605Xjgp0iL9TL0dJpGgP48n9rljXAhu8vu
   5SCleDHAk0nEUDRcoieOsPY3VQmqWzi4e50FAdjNZO98lsoXtpsQf78VG
   dt7TeCCg1ElCDfQqp82S9rXTqkveHmHm/NU72qOOPbil7qlexiKBgzNC3
   Q==;
X-CSE-ConnectionGUID: 29uADRrzTG2UgvklxfRDnQ==
X-CSE-MsgGUID: PVvkTO2eR32+ngiGKbQKUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="86680477"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="86680477"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 00:28:35 -0700
X-CSE-ConnectionGUID: hM89HPSTQcyrm42Ee4Purw==
X-CSE-MsgGUID: XAqf2eLXTHaUZkYmxE5gcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="254150821"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.82])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 00:28:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kory Maincent <kory.maincent@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Daniel Stone <daniels@collabora.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Mark Yacoub
 <markyacoub@google.com>, Sean Paul <seanpaul@google.com>, Manasi Navare
 <navaremanasi@google.com>, Drew Davenport <ddavenport@google.com>, Louis
 Chauvet <louis.chauvet@bootlin.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Kory Maincent
 <kory.maincent@bootlin.com>
Subject: Re: [PATCH RFC v2 2/4] drm/i915/display/dp: Adopt dp_connector
 helpers to expose link training state
In-Reply-To: <20260619-feat_link_cap-v2-2-a3dec4c02ad9@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260619-feat_link_cap-v2-0-a3dec4c02ad9@bootlin.com>
 <20260619-feat_link_cap-v2-2-a3dec4c02ad9@bootlin.com>
Date: Mon, 22 Jun 2026 10:28:19 +0300
Message-ID: <97cb159654547b937a882c67bc9986dfd77eb620@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_002835_886886_A2C300C9 
X-CRM114-Status: GOOD (  24.61  )
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

On Fri, 19 Jun 2026, Kory Maincent <kory.maincent@bootlin.com> wrote:
> Switch the i915 DP connector initialization from
> drm_connector_init_with_ddc() to drm_connector_dp_init_with_ddc(),
> providing the source link capabilities (supported lane counts, link rates
> and DSC support).
>
> Add intel_dp_report_link_train() to collect the negotiated link
> parameters (rate, lane count and DSC enable) and report them via
> drm_dp_set_max_link_params() and drm_dp_set_cur_link_params() once
> link training completes successfully.
>
> Reset the link properties via drm_dp_reset_link_params()
> when the connector is reported as disconnected or when the display device
> is disabled, so the exposed state always reflects the current link status.
>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>
> Changes in v2:
> - Remove voltage swing and pre emphasis properties.
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c            | 26 ++++++++++++++++++----
>  .../gpu/drm/i915/display/intel_dp_link_training.c  | 17 ++++++++++++++
>  2 files changed, 39 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index f01a6eed38395..46c06c76952e0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -6414,8 +6414,10 @@ intel_dp_detect(struct drm_connector *_connector,
>  	drm_WARN_ON(display->drm,
>  		    !drm_modeset_is_locked(&display->drm->mode_config.connection_mutex));
>  
> -	if (!intel_display_device_enabled(display))
> +	if (!intel_display_device_enabled(display)) {
> +		drm_dp_sink_reset_link_caps(_connector);

Gut feeling is that the sprinkling of these around is error prone.

>  		return connector_status_disconnected;
> +	}
>  
>  	if (!intel_display_driver_check_access(display))
>  		return connector->base.status;
> @@ -6465,6 +6467,8 @@ intel_dp_detect(struct drm_connector *_connector,
>  
>  		intel_dp_tunnel_disconnect(intel_dp);
>  
> +		drm_dp_sink_reset_link_caps(_connector);
> +
>  		goto out_unset_edid;
>  	}
>  
> @@ -7240,10 +7244,12 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
>  			struct intel_connector *connector)
>  {
>  	struct intel_display *display = to_intel_display(dig_port);
> +	struct drm_connector_dp_link_caps link_caps;
>  	struct intel_dp *intel_dp = &dig_port->dp;
>  	struct intel_encoder *encoder = &dig_port->base;
>  	struct drm_device *dev = encoder->base.dev;
>  	enum port port = encoder->port;
> +	u32 *rates;
>  	int type;
>  
>  	if (drm_WARN(dev, dig_port->max_lanes < 1,
> @@ -7291,8 +7297,21 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
>  		    type == DRM_MODE_CONNECTOR_eDP ? "eDP" : "DP",
>  		    encoder->base.base.id, encoder->base.name);
>  
> -	drm_connector_init_with_ddc(dev, &connector->base, &intel_dp_connector_funcs,
> -				    type, &intel_dp->aux.ddc);
> +	intel_dp_set_source_rates(intel_dp);
> +	link_caps.nlanes = 4;
> +	link_caps.nlink_rates = intel_dp->num_source_rates;
> +	rates = kmemdup_array(intel_dp->source_rates, intel_dp->num_source_rates,
> +			      sizeof(*rates), GFP_KERNEL);
> +	if (!rates)
> +		goto fail;
> +
> +	link_caps.link_rates = rates;
> +	link_caps.dsc = HAS_DSC(display);
> +
> +	drm_connector_dp_init_with_ddc(dev, &connector->base, &intel_dp_connector_funcs,
> +				       &link_caps, type, &intel_dp->aux.ddc);
> +	kfree(rates);
> +

All of the above feels a bit clumsy in the middle of an already too long
function.

>  	drm_connector_helper_add(&connector->base, &intel_dp_connector_helper_funcs);
>  
>  	if (!HAS_GMCH(display) && DISPLAY_VER(display) < 12)
> @@ -7315,7 +7334,6 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
>  		goto fail;
>  	}
>  
> -	intel_dp_set_source_rates(intel_dp);
>  	intel_dp_set_common_rates(intel_dp);
>  	intel_dp_reset_link_params(intel_dp);
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index a26094223f780..25e0e957fe36d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -1231,6 +1231,18 @@ intel_dp_128b132b_intra_hop(struct intel_dp *intel_dp,
>  	return sink_status & DP_INTRA_HOP_AUX_REPLY_INDICATION ? 1 : 0;
>  }
>  
> +static void intel_dp_report_link_train(struct intel_dp *intel_dp)
> +{
> +	struct intel_connector *connector = intel_dp->attached_connector;
> +
> +	drm_dp_set_max_link_params(&connector->base, intel_dp->link_rate,
> +				   intel_dp->lane_count);
> +
> +	drm_dp_set_cur_link_params(&connector->base, intel_dp->link_rate,
> +				   intel_dp->lane_count,
> +				   connector->dp.dsc_decompression_enabled);
> +}
> +
>  /**
>   * intel_dp_stop_link_train - stop link training
>   * @intel_dp: DP struct
> @@ -1259,6 +1271,9 @@ void intel_dp_stop_link_train(struct intel_dp *intel_dp,
>  	intel_dp_program_link_training_pattern(intel_dp, crtc_state, DP_PHY_DPRX,
>  					       DP_TRAINING_PATTERN_DISABLE);
>  
> +	if (!intel_dp->is_mst)
> +		intel_dp_report_link_train(intel_dp);
> +
>  	if (intel_dp_is_uhbr(crtc_state)) {
>  		ret = poll_timeout_us(ret = intel_dp_128b132b_intra_hop(intel_dp, crtc_state),
>  				      ret == 0,
> @@ -1772,6 +1787,8 @@ void intel_dp_start_link_train(struct intel_atomic_state *state,
>  	 */
>  	int lttpr_count;
>  
> +	drm_dp_sink_set_link_caps(&intel_dp->attached_connector->base, &intel_dp->aux);

This is not okay.

We've already figured out all the information needed, and this call goes
ahead and reads the same information out again.

Moreover, some sinks are fragile when it comes to reading the info and
starting link training. The CTS might complain about redundant reads as
well.

drm_dp_sink_set_link_caps() as a name implies something about link,
i.e. the thing between the source and the sink. But this only sets sink
capabilities. Which also means it should not happen at link training
time at all. We figure the information out at detect, which means it's
available *before* modeset.

The more I think about the function, the more I question it. Like, if
the source doesn't support UHBR at all, or not on this connector, what's
the point of reading the sink UHBR rates?

> +
>  	intel_hpd_block(encoder);
>  
>  	lttpr_count = intel_dp_init_lttpr_and_dprx_caps(intel_dp);

-- 
Jani Nikula, Intel

