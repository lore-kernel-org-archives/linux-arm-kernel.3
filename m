Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF4DCD98DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 20:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocCd5w26fdc1J8cjXCJJ44FOPQqL/aFGod/qtI7VzAQ=; b=J0PErdziZHCEGfix9zezDcX7v7
	gEjADIVY3k50ZQjumHH++yYV3GOTWOOHbDJvifk129l9zUlmoV3sHQGvFg05n134BLjt+0KrTnoGA
	hoh7/cTcZD4wU/AFRC5W0yegln8pxEBCHafqauNz/+KqteYk/xj6d7Q8jbkRWGtu4bQJJsRRSTsQX
	BN8A5gAOq5o3yazsLj0RnJN6ID4wxtUQ3QHm8hyn9MX29fHE2IAcaGAnk/2SQ2fiZCEs+Z6G5pWdt
	HYafJyjtK8DZr79W9nJmc42y+mf4MxIyATXdC7vIvAAPSTf7UQotjZOx6Tw5T41cZ4YuCZmcLE7W2
	/Krs1Ttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJe4i-0000000B5Ml-3W1w;
	Thu, 13 Nov 2025 20:37:48 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJe4c-0000000B5JM-39hv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 20:37:44 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763066260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ocCd5w26fdc1J8cjXCJJ44FOPQqL/aFGod/qtI7VzAQ=;
	b=w8X9Xq+jerxDx0SSpkQri6sf4OS6D6LncLOPZkPgFHpWLI0Y1tBCDTlAPa0MLvZSla5ZeH
	4HkuOPyiGf7h2L7hcXg1hDiLMJQye7l/8fPwykUjfmKKCQAe6Dar7aoDkyNnxMZvdfAi1f
	XpkKEre7Q2GWyU4Sjh9SCtX0e1vv2XM=
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
Subject: [PATCH 2/3] drm: zynqmp: Make the video plane primary
Date: Thu, 13 Nov 2025 15:37:13 -0500
Message-Id: <20251113203715.2768107-3-sean.anderson@linux.dev>
In-Reply-To: <20251113203715.2768107-1-sean.anderson@linux.dev>
References: <20251113203715.2768107-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_123742_939522_EFB89394 
X-CRM114-Status: GOOD (  20.52  )
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

The zynqmp has two planes: "video" and "graphics". The video plane

- Is on the bottom (zpos=0) (except when chroma keying as the master plane)
- Supports "live" input (e.g. from an external source)
- Supports RGB, YUV, and YCbCr formats, including XRGB8888
- Does not support transparency, except via chroma keying (colorkey)
- Must cover the entire screen (translation/resizing not supported)

The graphics plane

- Is on the top (zpos=1)
- Supports "live" input (e.g. from an external source)
- Supports RGB and YUV444 formats, but not XRGB8888
- Supports transparency either via
  - Global alpha channel, which disables per-pixel alpha when enabled
  - Per-pixel alpha, which cannot be used with global alpha
  - Chroma keying (colorkey)
- Must cover the entire screen (translation/resizing not supported)

Currently the graphics plane is the primary plane. Make the video plane
the primary plane:

- The video plane supports XRGB8888, which is the default 24-bit
  colorspace for X. This results in improved performance when compared
  to RGB565.
- The graphics plane can be used as an overlay because it has a higher
  z-pos and supports a per-pixel alpha channel. Unfortunately, clients
  like weston cannot currently take advantage of this because they
  expect overlay planes to support translation/resizing.

One downside to this approach could be that the graphics plane has worse
support for YUV and YCBCr, so it may be more difficult to compose video
streams into the window of a media player. However, no existing software
could rely on this because there is no way to enable the per-pixel alpha
channel when the graphics plane is enabled. This makes it impossible to
"carve out" an area in the graphics plane where the video plane shows
through. This limitation is addressed in the next patch, but it means we
do not need to worry about compatibility in this area.

An alternate approach could be to pretend that the graphics plane
supports XRGB8888 by using the supported ARGB8888 mode instead and
enabling the global alpha channel. However, this would rule out ever
using the per-pixel alpha channel.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/gpu/drm/xlnx/zynqmp_kms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index c80a2d4034f3..456ada9ac003 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -161,8 +161,8 @@ static int zynqmp_dpsub_create_planes(struct zynqmp_dpsub *dpsub)
 		if (!formats)
 			return -ENOMEM;
 
-		/* Graphics layer is primary, and video layer is overlay. */
-		type = i == ZYNQMP_DPSUB_LAYER_VID
+		/* Graphics layer is overlay, and video layer is primary. */
+		type = i == ZYNQMP_DPSUB_LAYER_GFX
 		     ? DRM_PLANE_TYPE_OVERLAY : DRM_PLANE_TYPE_PRIMARY;
 		ret = drm_universal_plane_init(&dpsub->drm->dev, plane, 0,
 					       &zynqmp_dpsub_plane_funcs,
@@ -322,7 +322,7 @@ static const struct drm_crtc_funcs zynqmp_dpsub_crtc_funcs = {
 
 static int zynqmp_dpsub_create_crtc(struct zynqmp_dpsub *dpsub)
 {
-	struct drm_plane *plane = &dpsub->drm->planes[ZYNQMP_DPSUB_LAYER_GFX];
+	struct drm_plane *plane = &dpsub->drm->planes[ZYNQMP_DPSUB_LAYER_VID];
 	struct drm_crtc *crtc = &dpsub->drm->crtc;
 	int ret;
 
-- 
2.35.1.1320.gc452695387.dirty


