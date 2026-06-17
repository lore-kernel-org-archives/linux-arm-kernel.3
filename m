Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B28CCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2i8AsvfkuN3+J1HtjnfzmL4zwdbdZh3Px/PkaHWtfhU=; b=CuCsD9Uptupjoxh7MSGF84HBKn
	hf9pJPXQXHvOrvRMEf5xw1Etzk2AWifpfw29Ty6nxyW3NeuE/DXtjpJ4ilAxKws+XlfVU9zLEpIGp
	9DFgFJxV5hOSECpL87QNnwd8e3WKcLbhYOp+plILfuDXNvo68nCz/xHCf7PsZVPVQ1/ZVMzrr59Zp
	Eef8fraxDNbFvr79uFl+wdas33xIVwoazKg0QAvIhpcWqdWb9IcmYkGUKGKAbiC6VO4yrz+4qhrik
	N7jNh7MuS26ICEUcsIMMXVctDsQJbJ7b63PVDIiYVGQCAbYVU70Lj3UacUHR4YR6knTtv+taZInBK
	hcBCfPgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnJR-0000000H2Ci-2OYB;
	Wed, 17 Jun 2026 10:16:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnJQ-0000000H2CW-02nO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:16:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7450F44258;
	Wed, 17 Jun 2026 10:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD88A1F00A3E;
	Wed, 17 Jun 2026 10:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781691359;
	bh=2i8AsvfkuN3+J1HtjnfzmL4zwdbdZh3Px/PkaHWtfhU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AVJT+oKWN5k5wrSY9emuWPdQyOSBlwkwyeB0B74/SyeIBlGr3nqRd/FMxLpSt2q0H
	 GGl7n5qwTKHrZH+UWIdrrSeznmvXlchbQ9Oa63LpRIjeRL6DJSyI6jsanACLFLBWlL
	 noSuEJySx2khlIw2ZqZIyy1FrZiGp6oZu8G0xvXmJvoKpb+gGVVImSEJFOm0vJGd0C
	 0UAitTH7M/rYcFp3bUgKoCSvvzZQI0zpIzPjS0CpXgwLL8VgqtQNQyK4xwgutrImyP
	 5CvCBew+hjFtb4VQhRF2vEZTdq+6iFdvxJxNSaX6kQqPHloiSxCN4pLYioxhT0HTgs
	 UJBvN1xq/v6Xw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Jun 2026 12:14:51 +0200
Subject: [PATCH 26/37] drm/exynos: mic: Switch to atomic bridge callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-drm-all-atomic-bridges-v1-26-b63e6316166b@kernel.org>
References: <20260617-drm-all-atomic-bridges-v1-0-b63e6316166b@kernel.org>
In-Reply-To: <20260617-drm-all-atomic-bridges-v1-0-b63e6316166b@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5255; i=mripard@kernel.org;
 h=from:subject:message-id; bh=uj3m2cQQQ9kgOtUjDnRvXjSVDT0eqJK+Hl7kwi5PCN4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlGxROzF/OdPvU5/8fNSTVtzreqHTavW7PcT4pr3o57k
 w9waXx81zGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAm8m86Y8Nhkb122ZN2sP/3
 XTOt67zmljuqn460bf5XP/uz2IL/uoy1zcc3Whs7lJ5ol/vu5Fwj95mxznpbuYdW50I5i29Lgs1
 tZ8spHitsv6WeFRu8NKFQbtrpQDsrp+upJy508JXb/rv1R3kmAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The mic bridge still uses the deprecated non-atomic bridge
callbacks.

Switch to their atomic counterparts, adding the bridge state
handlers if not already present.

Generated by the following Coccinelle script:

@ is_bridge @
identifier funcs;
@@

 struct drm_bridge_funcs funcs = {
	...,
 };

@ has_create_state depends on is_bridge @
identifier funcs, f;
@@

struct drm_bridge_funcs funcs = {
  ...,
  .atomic_create_state = f,
  ...,
};

@ update_struct depends on (is_bridge && !has_create_state) @
identifier is_bridge.funcs;
identifier f;
@@

 struct drm_bridge_funcs funcs = {
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	...,
 };

@ update_pre_enable_struct depends on (is_bridge && !has_create_state) @
identifier is_bridge.funcs;
identifier f;
@@

 struct drm_bridge_funcs funcs = {
 	...,
-	.pre_enable = f,
+	.atomic_pre_enable = f,
 	...,
 };

@ update_pre_enable_impl depends on update_pre_enable_struct @
identifier update_pre_enable_struct.f;
identifier b;
@@

-void f(struct drm_bridge *b)
+void f(struct drm_bridge *b, struct drm_atomic_commit *commit)
 {
	...
 }

@ update_enable_struct depends on (is_bridge && !has_create_state) @
identifier is_bridge.funcs;
identifier f;
@@

 struct drm_bridge_funcs funcs = {
 	...,
-	.enable = f,
+	.atomic_enable = f,
 	...,
 };

@ update_enable_impl depends on update_enable_struct @
identifier update_enable_struct.f;
identifier b;
@@

-void f(struct drm_bridge *b)
+void f(struct drm_bridge *b, struct drm_atomic_commit *commit)
 {
	...
 }

@ update_disable_struct depends on (is_bridge && !has_create_state) @
identifier is_bridge.funcs;
identifier f;
@@

 struct drm_bridge_funcs funcs = {
 	...,
-	.disable = f,
+	.atomic_disable = f,
 	...,
 };

@ update_disable_impl depends on update_disable_struct @
identifier update_disable_struct.f;
identifier b;
@@

-void f(struct drm_bridge *b)
+void f(struct drm_bridge *b, struct drm_atomic_commit *commit)
 {
	...
 }

@ update_post_disable_struct depends on (is_bridge && !has_create_state) @
identifier is_bridge.funcs;
identifier f;
@@

 struct drm_bridge_funcs funcs = {
 	...,
-	.post_disable = f,
+	.atomic_post_disable = f,
 	...,
 };

@ update_post_disable_impl depends on update_post_disable_struct @
identifier update_post_disable_struct.f;
identifier b;
@@

-void f(struct drm_bridge *b)
+void f(struct drm_bridge *b, struct drm_atomic_commit *commit)
 {
	...
 }

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Inki Dae <inki.dae@samsung.com>
To: Seung-Woo Kim <sw0312.kim@samsung.com>
To: Kyungmin Park <kyungmin.park@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
---
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index e68c954ec3e6..3069f958137f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -19,10 +19,11 @@
 #include <linux/regmap.h>
 
 #include <video/of_videomode.h>
 #include <video/videomode.h>
 
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_print.h>
 
 #include "exynos_drm_drv.h"
@@ -226,11 +227,12 @@ static void mic_set_reg_on(struct exynos_mic *mic, bool enable)
 
 	reg |= MIC_UPD_REG;
 	writel(reg, mic->reg + MIC_OP);
 }
 
-static void mic_post_disable(struct drm_bridge *bridge)
+static void mic_post_disable(struct drm_bridge *bridge,
+			     struct drm_atomic_commit *commit)
 {
 	struct exynos_mic *mic = bridge->driver_private;
 
 	mutex_lock(&mic_mutex);
 	if (!mic->enabled)
@@ -255,11 +257,12 @@ static void mic_mode_set(struct drm_bridge *bridge,
 	drm_display_mode_to_videomode(mode, &mic->vm);
 	mic->i80_mode = to_exynos_crtc(bridge->encoder->crtc)->i80_mode;
 	mutex_unlock(&mic_mutex);
 }
 
-static void mic_pre_enable(struct drm_bridge *bridge)
+static void mic_pre_enable(struct drm_bridge *bridge,
+			   struct drm_atomic_commit *commit)
 {
 	struct exynos_mic *mic = bridge->driver_private;
 	int ret;
 
 	mutex_lock(&mic_mutex);
@@ -293,13 +296,16 @@ static void mic_pre_enable(struct drm_bridge *bridge)
 unlock:
 	mutex_unlock(&mic_mutex);
 }
 
 static const struct drm_bridge_funcs mic_bridge_funcs = {
-	.post_disable = mic_post_disable,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_post_disable = mic_post_disable,
 	.mode_set = mic_mode_set,
-	.pre_enable = mic_pre_enable,
+	.atomic_pre_enable = mic_pre_enable,
 };
 
 static int exynos_mic_bind(struct device *dev, struct device *master,
 			   void *data)
 {

-- 
2.54.0


