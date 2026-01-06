Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F34C47BFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 16:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mg7xkbHFiTIb0EaR99sjUoEZxLHlfxayhWVLcb8JQa0=; b=UATanHT7oqCO31m+5hZgeCuR2B
	F9REJPogsQObXiaw9qbXP6HlLZFcwcdQkc80Yv1dwLsIjH/oENbLBSo4Xtjq7+uKdUaR9gBK7FFCc
	2dD58riWOFDcaCNsff1b9UdywZ0GhO/ShodOukiFN9ukXdeSlvm2kx8bpXSznVQJsLKP6IXxYcgEI
	UoEtUPC1V4Uq5fZ3nrjFbIjQit4/Sz09j3bq8zUWLHUsO5pwYA2jX2SPHqoTAmkygm+OAp6325QFQ
	HOwL6aBBEvkBhI9JOLzpyIeSnlPBBQMM2tUikOqczzl9+l6IlbZl0TUnmrwkf7g5DYojpqRtDdIKi
	H80nKqXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdA9M-0000000DVwt-0KjI;
	Tue, 06 Jan 2026 16:43:16 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdA9H-0000000DVv2-0KxU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 16:43:12 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767717787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mg7xkbHFiTIb0EaR99sjUoEZxLHlfxayhWVLcb8JQa0=;
	b=voJExWmWZY5vC6VbAcLmlBLrCr4D94NwTF9ZPM+per4kzkPBJemnjZ/LZOZuUewG61cifF
	hwkQ33GQD6sKWCDTgoMBFSoZXpjLBtL80KXNKCrGpHj5TvK3P5epXj9JBoip57EElyfbmA
	aDdzUb9jfv0CDGNdu9FwUqcGHG+qkS0=
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
Subject: [PATCH v2 1/4] drm/drm_blend: Allow specifying blend mode default
Date: Tue,  6 Jan 2026 11:42:44 -0500
Message-Id: <20260106164247.472544-2-sean.anderson@linux.dev>
In-Reply-To: <20260106164247.472544-1-sean.anderson@linux.dev>
References: <20260106164247.472544-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_084311_398760_19319D3C 
X-CRM114-Status: GOOD (  13.64  )
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

Not all devices support pre-multiplied blend mode. In these cases,
userspace cannot expect this mode to be the default, since the hardware
cannot produce it (and could not default to it before a blend mode
property existed). Therefore, add a variant of
drm_plane_create_blend_mode_property that allows specifying the default.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v2:
- New

 drivers/gpu/drm/drm_blend.c | 22 ++++++++++------------
 include/drm/drm_blend.h     | 26 ++++++++++++++++++++++++--
 2 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 6852d73c931c..fac0f1478385 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -546,12 +546,10 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
 EXPORT_SYMBOL(drm_atomic_normalize_zpos);
 
 /**
- * drm_plane_create_blend_mode_property - create a new blend mode property
+ * drm_plane_create_blend_mode_default - create a new blend mode property
  * @plane: drm plane
- * @supported_modes: bitmask of supported modes, must include
- *		     BIT(DRM_MODE_BLEND_PREMULTI). Current DRM assumption is
- *		     that alpha is premultiplied, and old userspace can break if
- *		     the property defaults to anything else.
+ * @supported_modes: bitmask of supported modes, must include BIT(@def)
+ * @def: Default blend mode
  *
  * This creates a new property describing the blend mode.
  *
@@ -571,11 +569,11 @@ EXPORT_SYMBOL(drm_atomic_normalize_zpos);
  *	pre-multiplied and will do so when blending them to the background color
  *	values.
  *
- * RETURNS:
- * Zero for success or -errno
+ * Return: Zero for success or -errno
  */
-int drm_plane_create_blend_mode_property(struct drm_plane *plane,
-					 unsigned int supported_modes)
+int drm_plane_create_blend_mode_default(struct drm_plane *plane,
+					unsigned int supported_modes,
+					unsigned int def)
 {
 	struct drm_device *dev = plane->dev;
 	struct drm_property *prop;
@@ -590,7 +588,7 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 	int i;
 
 	if (WARN_ON((supported_modes & ~valid_mode_mask) ||
-		    ((supported_modes & BIT(DRM_MODE_BLEND_PREMULTI)) == 0)))
+		    !(supported_modes & BIT(def))))
 		return -EINVAL;
 
 	prop = drm_property_create(dev, DRM_MODE_PROP_ENUM,
@@ -615,9 +613,9 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 		}
 	}
 
-	drm_object_attach_property(&plane->base, prop, DRM_MODE_BLEND_PREMULTI);
+	drm_object_attach_property(&plane->base, prop, def);
 	plane->blend_mode_property = prop;
 
 	return 0;
 }
-EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
+EXPORT_SYMBOL(drm_plane_create_blend_mode_default);
diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
index 88bdfec3bd88..244f0694d0a5 100644
--- a/include/drm/drm_blend.h
+++ b/include/drm/drm_blend.h
@@ -56,6 +56,28 @@ int drm_plane_create_zpos_immutable_property(struct drm_plane *plane,
 					     unsigned int zpos);
 int drm_atomic_normalize_zpos(struct drm_device *dev,
 			      struct drm_atomic_state *state);
-int drm_plane_create_blend_mode_property(struct drm_plane *plane,
-					 unsigned int supported_modes);
+int drm_plane_create_blend_mode_default(struct drm_plane *plane,
+					unsigned int supported_modes,
+					unsigned int def);
+
+/**
+ * drm_plane_create_blend_mode_property - create a new blend mode property
+ * @plane: drm plane
+ * @supported_modes: bitmask of supported modes, must include
+ *		     BIT(DRM_MODE_BLEND_PREMULTI). Current DRM assumption is
+ *		     that alpha is premultiplied, and old userspace can break if
+ *		     the property defaults to anything else.
+ *
+ * This creates a new property describing the blend mode. See
+ * drm_plane_create_blend_mode_default() for details.
+ *
+ * Return: Zero for success or -errno
+ */
+static inline int
+drm_plane_create_blend_mode_property(struct drm_plane *plane,
+				     unsigned int supported_modes)
+{
+	return drm_plane_create_blend_mode_default(plane, supported_modes,
+						   DRM_MODE_BLEND_PREMULTI);
+}
 #endif
-- 
2.35.1.1320.gc452695387.dirty


