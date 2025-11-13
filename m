Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8453CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 20:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpum9vm04MMfFjjX9uvR2U04f3Rh475IoGXXdM3y9yo=; b=tfcRdR1z92rbiHzTyI7250CCPg
	NDDjhC2A+V++F7BT21lyRyEPDyl06TPnIciNBM1kUI1I742ysqQCgEzRGTmouQkewE3ishw6HLJNM
	anaaILUSTUuW3bCfyQFceI8XJ8RNCQWEYg8QSSKH6wWjTaPuU6k49WBRTbidY3qXw4LQoweQs7S2/
	jCyoYdK3TggfsPoU4fBRLCVuvQIvn/oMYbx8Kk/LW1TsYzCCuJgvZkzCKEnv0zsJkEVKOb0l0Ekfs
	uaw1WZCz5SNilpAnLDxC3QYlr34PkgNj/rQu6oui/xy+LLSdKk41O9OuDjmRnbNlCO10h4z2hoqQH
	j15mHM3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJe4j-0000000B5NE-0XCc;
	Thu, 13 Nov 2025 20:37:49 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJe4e-0000000B5K5-3dXW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 20:37:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763066262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qpum9vm04MMfFjjX9uvR2U04f3Rh475IoGXXdM3y9yo=;
	b=uSKmSG49Q/hKO3b5cWvFs+1/o2C+vgWvVvlyp7DI7AFAUQLkV8WSrH/7LDIdUvoIBk3TOD
	lQqwz6WXeZRtPhXY3TZXDuHxCvJ1MVKKNw0gIRj9Oloij+FNhutsbS3ZAZ+hEVZraq2YVN
	dS/UbOaZgYvzeL1KBgygqEinumm7PmE=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	Mike Looijmans <mike.looijmans@topic.nl>,
	David Airlie <airlied@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics plane
Date: Thu, 13 Nov 2025 15:37:14 -0500
Message-Id: <20251113203715.2768107-4-sean.anderson@linux.dev>
In-Reply-To: <20251113203715.2768107-1-sean.anderson@linux.dev>
References: <20251113203715.2768107-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_123745_072023_FD5169B4 
X-CRM114-Status: GOOD (  13.56  )
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
exposing it through the blend mode property. I'm not sure whether the
per-pixel alpha is pre-multiplied or not [1], but apparently it *must* be
pre-multiplied so I guess we have to advertise it.

[1] All we get is "The alpha value available with the graphics stream
    will define the transparency of the graphics."

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/gpu/drm/xlnx/zynqmp_kms.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 456ada9ac003..fa1cfc16db36 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -61,6 +61,13 @@ static int zynqmp_dpsub_plane_atomic_check(struct drm_plane *plane,
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
@@ -117,9 +124,13 @@ static void zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
 
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
@@ -179,9 +190,18 @@ static int zynqmp_dpsub_create_planes(struct zynqmp_dpsub *dpsub)
 			return ret;
 
 		if (i == ZYNQMP_DPSUB_LAYER_GFX) {
+			unsigned int blend_modes =
+				BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+				BIT(DRM_MODE_BLEND_PREMULTI);
+
 			ret = drm_plane_create_alpha_property(plane);
 			if (ret)
 				return ret;
+
+			ret = drm_plane_create_blend_mode_property(plane,
+								   blend_modes);
+			if (ret)
+				return ret;
 		}
 	}
 
-- 
2.35.1.1320.gc452695387.dirty


