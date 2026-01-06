Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3C1C47BE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 16:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZw3WZZYm28dE9HQYeQea/Sbj/eWbFcqNoZFr1t7j3E=; b=QR3mh2I6LHFRBkHOMHNo+eD+3A
	/TwCJ78IyODLRUGzijDdGNum6h6VmMvYPd5yITugoiJU9fENCBPuUpv93byEj+Brkit6S/4b/C+Pv
	SfQyEqKzQJeYCIozeuT2/tVKZgZVduZgYrcY3pTUoqxvF20tNJDEG1tZEzt5RN7gStZAHqAQSX89c
	WlHig1AoEEwg4UBIPiAzp1s3NnQ/fVn0HQ6oiXk0PcOaSovV/jp/VnbaYN/+xrorVIZrfL+fzuHMW
	vSZWCX9aGDNRGZJb5hcmcjKFSe4oi0u3nJfZ5x5FEtOkf6Q/wRMl/kcFzi71bBZxar+p8euCq6ITv
	45dxWEUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdA9Q-0000000DW1D-2BIy;
	Tue, 06 Jan 2026 16:43:20 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdA9O-0000000DVws-1Hws
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 16:43:19 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767717795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yZw3WZZYm28dE9HQYeQea/Sbj/eWbFcqNoZFr1t7j3E=;
	b=hYQwyQJjaehQX638QU04nMw0O9SL2XsmknEL14fxotw0BZ3t3e+XOY3BH1fsGpjNFO0Str
	IPvjbMHyGLvtebPz1PlLPivalacV6q0vdrGhxivOTUkKasCLwF9rZ9tm3a7ZGNreG035jc
	4cf0bwTKuv2f1bph4miWnuaA2s5HuYg=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Cc: Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>,
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 4/4] drm: zynqmp: Add blend mode property to graphics plane
Date: Tue,  6 Jan 2026 11:42:47 -0500
Message-Id: <20260106164247.472544-5-sean.anderson@linux.dev>
In-Reply-To: <20260106164247.472544-1-sean.anderson@linux.dev>
References: <20260106164247.472544-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_084318_485170_2FADB913 
X-CRM114-Status: GOOD (  17.11  )
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

When global alpha is enabled, per-pixel alpha is ignored. Allow
userspace to explicitly specify whether to use per-pixel alpha by
exposing it through the blend mode property. The reference manual
doesn't say whether the per-pixel alpha is pre-multiplied or not, but
Anatoliy created a test case that shows alpha is not pre-multiplied [1].
By default alpha is disabled, since this matches the behavior before
this patch.

[1] https://lore.kernel.org/dri-devel/MW4PR12MB7165CDDB17CF0855EA19AACDE6A6A@MW4PR12MB7165.namprd12.prod.outlook.com/

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v2:
- Advertise coverage instead of premulti, since that's what the hardware
  supports.
- Set default blend mode to none since that's what the default was
  before this series.

 drivers/gpu/drm/xlnx/zynqmp_kms.c | 35 ++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 284acb23c53e..aadba00921c1 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -62,6 +62,13 @@ static int zynqmp_dpsub_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->crtc)
 		return 0;
 
+	if (new_plane_state->pixel_blend_mode != DRM_MODE_BLEND_PIXEL_NONE &&
+	    new_plane_state->alpha >> 8 != 0xff) {
+		drm_dbg_kms(plane->dev,
+			    "Plane alpha must be 1.0 when using pixel alpha\n");
+		return -EINVAL;
+	}
+
 	crtc_state = drm_atomic_get_crtc_state(state, new_plane_state->crtc);
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
@@ -118,9 +125,13 @@ static void zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
 
 	zynqmp_disp_layer_update(layer, new_state);
 
-	if (plane->index == ZYNQMP_DPSUB_LAYER_GFX)
-		zynqmp_disp_blend_set_global_alpha(dpsub->disp, true,
+	if (plane->index == ZYNQMP_DPSUB_LAYER_GFX) {
+		bool blend = plane->state->pixel_blend_mode ==
+			     DRM_MODE_BLEND_PIXEL_NONE;
+
+		zynqmp_disp_blend_set_global_alpha(dpsub->disp, blend,
 						   plane->state->alpha >> 8);
+	}
 
 	/*
 	 * Unconditionally enable the layer, as it may have been disabled
@@ -137,11 +148,18 @@ static const struct drm_plane_helper_funcs zynqmp_dpsub_plane_helper_funcs = {
 	.atomic_disable		= zynqmp_dpsub_plane_atomic_disable,
 };
 
+void zynqmp_dpsub_plane_atomic_reset(struct drm_plane *plane)
+{
+	drm_atomic_helper_plane_reset(plane);
+	if (plane->state)
+		plane->state->pixel_blend_mode = DRM_MODE_BLEND_PIXEL_NONE;
+}
+
 static const struct drm_plane_funcs zynqmp_dpsub_plane_funcs = {
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
 	.destroy		= drm_plane_cleanup,
-	.reset			= drm_atomic_helper_plane_reset,
+	.reset			= zynqmp_dpsub_plane_atomic_reset,
 	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
 };
@@ -180,9 +198,20 @@ static int zynqmp_dpsub_create_planes(struct zynqmp_dpsub *dpsub)
 			return ret;
 
 		if (i == ZYNQMP_DPSUB_LAYER_GFX) {
+			unsigned int blend_modes =
+				BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+				BIT(DRM_MODE_BLEND_COVERAGE);
+			unsigned int def = DRM_MODE_BLEND_COVERAGE;
+
 			ret = drm_plane_create_alpha_property(plane);
 			if (ret)
 				return ret;
+
+			ret = drm_plane_create_blend_mode_default(plane,
+								  blend_modes,
+								  def);
+			if (ret)
+				return ret;
 		}
 	}
 
-- 
2.35.1.1320.gc452695387.dirty


