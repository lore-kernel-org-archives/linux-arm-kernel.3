Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E097606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 16:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ktxpcsqu;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gg4WcNUb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aLnxQe0t6sB76CvRXIDzrDWIY/E+K/QEFm3Rehma14M=; b=KtxpcsquPi6ipk
	QNtUEfPFw9yUzLocy2A7JuoH8N7AEGG7d10FPjEW2AdBpOFT7u7JqcJfwIWvGwypCiART4Vi21ii2
	87nQ0nwEzX6gCsWiIu+GUpMc1RR+0CYzjK+zMh1Xq6qynV+MWNWCgDQ8czxwX1YC6L68IevGKdQot
	7lHrZwcCgkwjDEg0AByphSXbQFLeQmE4jR7MoJTbYlmc033+u5hjStmszY1DwpMesfyEmty+FZf0o
	WWF62g0zjPJ+s7yPjJwWQxuSWkxwRVmiQYHHnGznEG/44JUC0jAoQG6cft7m4aLRGLaZssF2sq3bQ
	g41dGl0dVFJnGcXNj5Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvoc-0000000EVkZ-1gv9;
	Thu, 22 Oct 2026 16:38:54 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvoZ-0000000EVhD-0f78
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 16:38:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 934E14E412BB;
	Thu, 22 Oct 2026 16:38:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F0DA60763;
	Thu, 22 Oct 2026 16:38:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A66A10328F94;
	Thu, 22 Oct 2026 18:38:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792687123; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aLnxQe0t6sB76CvRXIDzrDWIY/E+K/QEFm3Rehma14M=;
	b=gg4WcNUbW4hlk4/nbzNubX6LJYNCTI4HLbAi5uChzGwtzVP5tqPvhMMjomE+LRaVFsCuxJ
	vBXK81VvopK2OOfl5M42ySn9ChqfBeGSx/4efvu/IDwlxE11LJAf0Og228RIYQ7j2yW5yy
	2aFiAy3gJRjLEpi5u8HHYmLc/DYVuz45EArTboC00oYIZZ3LQg9r/7vMdeVmEm9B7LIn5c
	DNfMwdhiaSCsps36QW3hlUnqJCn03BVJ0TXhsSvNab565lJWYzDPAu7hCCNZQjf6XumcRZ
	J0WR5jFaZ5ZCr07a6l6HmMwYvWuW0738D3JYlKtIZXcrkmiktSru1sjCVCafQg==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Thu, 22 Oct 2026 18:37:58 +0200
Subject: [PATCH v4 2/8] drm: Move DSC capability reading helper out of i915
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-feat_link_cap-v4-2-a4f3f6e8cad9@bootlin.com>
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
X-CRM114-CacheID: sfid-20261022_093851_559907_497BDA0B 
X-CRM114-Status: GOOD (  15.17  )
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

In preparation for adding generic DRM properties to report source and
sink capabilities, move the DSC capability reading helper out of the
i915 driver into the generic DRM helpers.

No functional change intended.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Change in v3:
- New patch
---
 drivers/gpu/drm/display/drm_dp_helper.c | 30 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c | 28 ++++------------------------
 include/drm/display/drm_dp_helper.h     |  2 ++
 3 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 3988da0a01fac..8473dbcd8808a 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -5166,3 +5166,33 @@ int drm_dp_read_edp_sink_rates(struct drm_dp_aux *aux, u8 edp_dpcd_rev,
 	return num_sink_rates;
 }
 EXPORT_SYMBOL_GPL(drm_dp_read_edp_sink_rates);
+
+/**
+ * drm_dp_read_dsc_dpcd() - read the DSC capabilities from the DPCD
+ * @aux: DisplayPort AUX channel
+ * @dsc_dpcd: Buffer to store the DSC capabilities read from the DPCD
+ *
+ * Attempts to read the sink DSC capabilities from the DPCD of @aux.
+ *
+ * Returns: 0 on success or a negative error code on failure.
+ */
+int drm_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
+			 u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
+{
+	int ret;
+
+	ret = drm_dp_dpcd_read_data(aux, DP_DSC_SUPPORT, dsc_dpcd,
+				    DP_DSC_RECEIVER_CAP_SIZE);
+	if (ret) {
+		drm_dbg_kms(aux->drm_dev,
+			    "Could not read DSC DPCD register 0x%x Error: %pe\n",
+			    DP_DSC_SUPPORT, ERR_PTR(ret));
+		return ret;
+	}
+
+	drm_dbg_kms(aux->drm_dev, "DSC DPCD: %*ph\n",
+		    DP_DSC_RECEIVER_CAP_SIZE,
+		    dsc_dpcd);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_dp_read_dsc_dpcd);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 087afcea5395f..89d4b3d348fa8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4382,26 +4382,6 @@ static bool intel_dp_get_sst_split_sdp_status(u8 dprx)
 	return dprx & DP_SST_SPLIT_SDP_CAP;
 }
 
-static int intel_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
-				  u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
-{
-	int ret;
-
-	ret = drm_dp_dpcd_read_data(aux, DP_DSC_SUPPORT, dsc_dpcd,
-				    DP_DSC_RECEIVER_CAP_SIZE);
-	if (ret) {
-		drm_dbg_kms(aux->drm_dev,
-			    "Could not read DSC DPCD register 0x%x Error: %pe\n",
-			    DP_DSC_SUPPORT, ERR_PTR(ret));
-		return ret;
-	}
-
-	drm_dbg_kms(aux->drm_dev, "DSC DPCD: %*ph\n",
-		    DP_DSC_RECEIVER_CAP_SIZE,
-		    dsc_dpcd);
-	return 0;
-}
-
 static void init_dsc_overall_throughput_limits(struct intel_connector *connector, bool is_branch)
 {
 	u8 branch_caps[DP_DSC_BRANCH_CAP_SIZE];
@@ -4450,8 +4430,8 @@ void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
 	if (dpcd_rev < DP_DPCD_REV_14)
 		return;
 
-	if (intel_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
-				   connector->dp.dsc_dpcd) < 0)
+	if (drm_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
+				 connector->dp.dsc_dpcd) < 0)
 		return;
 
 	if (drm_dp_dpcd_readb(connector->dp.dsc_decompression_aux, DP_FEC_CAPABILITY,
@@ -4482,8 +4462,8 @@ static void intel_edp_get_dsc_sink_cap(u8 edp_dpcd_rev, struct intel_connector *
 	if (edp_dpcd_rev < DP_EDP_14)
 		return;
 
-	if (intel_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
-				   connector->dp.dsc_dpcd) < 0)
+	if (drm_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
+				 connector->dp.dsc_dpcd) < 0)
 		return;
 
 	if (connector->dp.dsc_dpcd[0] & DP_DSC_DECOMPRESSION_IS_SUPPORTED)
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index d7f4c6f2ba4c7..7bc3b36f38b82 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -215,6 +215,8 @@ drm_dp_is_branch(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 }
 
 /* DP/eDP DSC support */
+int drm_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
+			 u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
 u8 drm_dp_dsc_sink_bpp_incr(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
 u32 drm_dp_dsc_slice_count_to_mask(int slice_count);
 u32 drm_dp_dsc_sink_slice_count_mask(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],

-- 
2.43.0


