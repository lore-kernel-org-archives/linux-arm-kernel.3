Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7000606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 16:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2s8sgdFe;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Z7YbT8oy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0sHvVumUIf4TGnOLqOCT10I1Zve7awdJe3jnmpL+CjE=; b=2s8sgdFeUIHVRL
	IerQihGDu0FWtZcnglkSOhBU9goT+IwEWkCF0Dwxu1BOUah+e1nsoO5KwtUXE8aFBr62Uj9gsrvXr
	+ZCsSunLznACTieV8R+580nsD3z4U3Jobikabx6nVXHlZxFg0MTdEmt9HX2mVLf01kEbF40urvN62
	2+kkL4FQPoEvZ3qWsqqG1x7tYUKDBzxVxvOg8aj9JxYA4KU9cRTsiPYtHwZYU8OQsI5BvvvZRkloN
	jID+BfOo3EcTWCfr99RYz52GLhzr7gMziWDyjjgdUO5vlJYQtHt3CvwKVCIG2hEwX7AlnlV8W6P12
	8uZCjNFs0inajFwslXiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvp1-0000000EW2i-276s;
	Thu, 22 Oct 2026 16:39:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvoz-0000000EW0A-166y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 16:39:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AA9D14E412B6;
	Thu, 22 Oct 2026 16:39:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 749ED60763;
	Thu, 22 Oct 2026 16:39:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42F2B10328EC8;
	Thu, 22 Oct 2026 18:39:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792687149; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0sHvVumUIf4TGnOLqOCT10I1Zve7awdJe3jnmpL+CjE=;
	b=Z7YbT8oyxLmFeIR0OQTsxd9x5eU27ov/p74km/wKKCZRylODCsGLo1r1dSi/whd6bcoJ+S
	W2S4IBPSraaUmXfbcNuFa3aexfEE0ht5t1JJIBaqeobPzZfQl0i8eQs0hSOeu795eFFVqi
	+Q0F9CokJlo1sjwuji6yUINj7+nfkZVpIsowgndS5eWpx1AGpbI+4smYzQslK62sjruC9d
	A/xNqERZwvk8Kw2QlyQwsKiqlB1tfTOIk+V5bP3AcPdDxK+CXYDTv+nY4N18SuoEjJ5puq
	xSuqrZPo6EbnfNCxx3JbC2TghhulFIeFzZb58ph2GVrmvevYexc3/IePf+XNmQ==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Thu, 22 Oct 2026 18:38:01 +0200
Subject: [PATCH v4 5/8] drm/i915/display/dp: Use dp_connector helpers to
 expose link training state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-feat_link_cap-v4-5-a4f3f6e8cad9@bootlin.com>
References: <20261022-feat_link_cap-v4-0-a4f3f6e8cad9@bootlin.com>
In-Reply-To: <20261022-feat_link_cap-v4-0-a4f3f6e8cad9@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Daniel Stone <daniels@collabora.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>, 
 Manasi Navare <navaremanasi@google.com>, 
 Drew Davenport <ddavenport@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.16.1-dev-17221
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_093917_591084_B1E9A637 
X-CRM114-Status: GOOD (  18.26  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Adopt the new DRM core DisplayPort helpers, which expose source and sink
capabilities along with the maximum and current link parameters to
userspace through the dp_link/ sysfs attributes.

Keep the sink's supported link rates unclamped in the new
dpcd_sink_rates/num_dpcd_sink_rates fields, rather than limiting them to
the rates the source supports.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Changes in v3:
- Move the call to new helpers around.
- Use real sink rates instead of the modified ones.

Changes in v2:
- Remove voltage swing and pre emphasis properties.
---
 drivers/gpu/drm/i915/display/intel_display_types.h |  2 +
 drivers/gpu/drm/i915/display/intel_dp.c            | 55 +++++++++++++++++++++-
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 14 ++++++
 3 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 5f0fe18c0614e..025523ae58e6c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1845,6 +1845,8 @@ struct intel_dp {
 	/* sink rates as reported by DP_MAX_LINK_RATE/DP_SUPPORTED_LINK_RATES */
 	int num_sink_rates;
 	int sink_rates[DP_MAX_SUPPORTED_RATES];
+	int num_dpcd_sink_rates;
+	int dpcd_sink_rates[DP_MAX_SUPPORTED_RATES];
 	bool use_rate_select;
 	/* Max sink lane count as reported by DP_MAX_LANE_COUNT */
 	int max_sink_lane_count;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index bbd76c0ff04b6..925d0ec939f55 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -167,6 +167,7 @@ static void intel_dp_set_default_sink_rates(struct intel_dp *intel_dp)
 {
 	intel_dp->sink_rates[0] = 162000;
 	intel_dp->num_sink_rates = 1;
+	intel_dp->num_dpcd_sink_rates = 0;
 }
 
 /* update sink rates from dpcd */
@@ -179,10 +180,14 @@ static void intel_dp_set_dpcd_sink_rates(struct intel_dp *intel_dp)
 						     intel_dp->lttpr_common_caps,
 						     &intel_dp->desc,
 						     intel_dp->tunnel,
-						     intel_dp->sink_rates);
+						     intel_dp->dpcd_sink_rates);
 	if (num_sink_rates < 0)
 		num_sink_rates = 0;
 
+	intel_dp->num_dpcd_sink_rates = num_sink_rates;
+	memcpy(intel_dp->sink_rates, intel_dp->dpcd_sink_rates,
+	       sizeof(int) * num_sink_rates);
+
 	intel_dp->num_sink_rates = num_sink_rates;
 }
 
@@ -4598,10 +4603,14 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp)
 
 	num_sink_rates = drm_dp_read_edp_sink_rates(&intel_dp->aux,
 						    intel_dp->edp_dpcd[0],
-						    intel_dp->sink_rates);
+						    intel_dp->dpcd_sink_rates);
 	if (num_sink_rates < 0)
 		num_sink_rates = 0;
 
+	intel_dp->num_dpcd_sink_rates = num_sink_rates;
+	memcpy(intel_dp->sink_rates, intel_dp->dpcd_sink_rates,
+	       sizeof(int) * num_sink_rates);
+
 	intel_dp->num_sink_rates = num_sink_rates;
 
 	/*
@@ -6141,6 +6150,20 @@ void intel_dp_dpcd_set_probe(struct intel_dp *intel_dp, bool force_on_external)
 			      intel_dp_needs_dpcd_probe(intel_dp, force_on_external));
 }
 
+static void intel_dp_set_sink_caps(struct intel_connector *connector,
+				   struct intel_dp *intel_dp)
+{
+	struct drm_connector_dp_link_caps link_caps;
+
+	link_caps.nlanes = drm_dp_get_max_lane_count(intel_dp->dpcd,
+						     intel_dp->lttpr_common_caps);
+	link_caps.link_rates = intel_dp->dpcd_sink_rates;
+	link_caps.nlink_rates = intel_dp->num_dpcd_sink_rates;
+	link_caps.dsc = drm_dp_sink_supports_dsc(connector->dp.dsc_dpcd);
+
+	drm_dp_sink_set_caps(&connector->base, &link_caps);
+}
+
 static int
 intel_dp_detect(struct drm_connector *_connector,
 		struct drm_modeset_acquire_ctx *ctx,
@@ -6212,6 +6235,8 @@ intel_dp_detect(struct drm_connector *_connector,
 
 		intel_dp_tunnel_uhbr_lanes_wa_reset(intel_dp);
 
+		drm_dp_sink_reset_caps(_connector);
+
 		goto out_unset_edid;
 	}
 
@@ -6243,6 +6268,8 @@ intel_dp_detect(struct drm_connector *_connector,
 
 	intel_dp_print_rates(intel_dp);
 
+	intel_dp_set_sink_caps(connector, intel_dp);
+
 	if (intel_dp->is_mst) {
 		/*
 		 * If we are in MST mode then this connector
@@ -6990,11 +7017,14 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
 			struct intel_connector *connector)
 {
 	struct intel_display *display = to_intel_display(dig_port);
+	struct drm_connector_dp_link_caps link_caps;
 	struct intel_dp *intel_dp = &dig_port->dp;
 	struct intel_encoder *encoder = &dig_port->base;
 	struct drm_device *dev = encoder->base.dev;
 	enum port port = encoder->port;
+	int *rates;
 	int type;
+	int ret;
 
 	if (drm_WARN(dev, dig_port->max_lanes < 1,
 		     "Not enough lanes (%d) for DP on [ENCODER:%d:%s]\n",
@@ -7069,6 +7099,27 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
 	intel_dp_set_common_link_params(intel_dp);
 	intel_dp_reset_link_params(intel_dp);
 
+	rates = kmemdup_array(intel_dp->source_rates,
+			      intel_dp->num_source_rates,
+			      sizeof(*rates),
+			      GFP_KERNEL);
+	if (!rates) {
+		intel_dp_aux_fini(intel_dp);
+		goto fail;
+	}
+
+	link_caps.nlanes = dig_port->max_lanes;
+	link_caps.nlink_rates = intel_dp->num_source_rates;
+	link_caps.link_rates = rates;
+	link_caps.dsc = HAS_DSC(display);
+
+	ret = drm_dp_source_set_caps(&connector->base, &link_caps);
+	if (ret)
+		drm_dbg_kms(display->drm,
+			    "failed to set source link rates, skipping.\n");
+
+	kfree(rates);
+
 	/* init MST on ports that can support it */
 	intel_dp_mst_encoder_init(dig_port, connector->base.base.id);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index cb92cff906146..c77cb124f1419 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1758,6 +1758,18 @@ static void link_recovery_reset(struct intel_dp_link_training *link_training)
 	link_training->recovery_state = INTEL_DP_LINK_RECOVERY_IDLE;
 }
 
+static void intel_dp_report_link_train(struct intel_dp *intel_dp)
+{
+	struct intel_connector *connector = intel_dp->attached_connector;
+
+	if (!connector)
+		return;
+
+	drm_dp_set_cur_link_params(&connector->base, intel_dp->link_rate,
+				   intel_dp->lane_count,
+				   connector->dp.dsc_decompression_enabled);
+}
+
 /**
  * intel_dp_stop_link_train - stop link training
  * @intel_dp: DP struct
@@ -1787,6 +1799,8 @@ void intel_dp_stop_link_train(struct intel_dp *intel_dp,
 	intel_dp_program_link_training_pattern(intel_dp, crtc_state, DP_PHY_DPRX,
 					       DP_TRAINING_PATTERN_DISABLE);
 
+	intel_dp_report_link_train(intel_dp);
+
 	if (intel_dp_is_uhbr(crtc_state)) {
 		ret = poll_timeout_us(ret = intel_dp_128b132b_intra_hop(intel_dp, crtc_state),
 				      ret == 0,

-- 
2.43.0


