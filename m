Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A01CFE5200
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 10:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CrtJHhfSilzRN4QPu+RN4iMv/2iOi5JVUMDjyY6qGGY=; b=e0KDOsDsMGztFqnvxfriubpmGP
	byhE5NqTSBXApDqI3jWgLTWgyB3oZBP7JDpuzkniGjVrScuZbifbWd7cjxTH8KFaKhgyt0TJ+23N6
	EjZYNspRy1qjHiFowmQSaMPUvubtNFTbPAh6SN02eMViJ92buyAjHymh7r7WEgyyABXnPhQyTWKMy
	yKBr0wxh8rD8/kvF0BffABc2/eTFbAEyXGYY5D8sJB19HJVk3Ubo1h2EhH3kcIQiD/kmBLsuec/Ek
	cvDUQDUZlr2XyZC8kbQejN3ZS99ONLv11GC+fA3sgfz/kmvM4S57fGCCTABgoPfyp66bP/++vyjq3
	p70Z7UmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDdO-0000000D0xN-4826;
	Fri, 24 Apr 2026 10:19:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDdF-0000000D0kz-0cwc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 10:19:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D1B860128;
	Fri, 24 Apr 2026 10:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA6DC2BCB5;
	Fri, 24 Apr 2026 10:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777025972;
	bh=kEOJGo5NyE+zPc4t+KDjqy4fVmtP15kb/ncYDU1I/sM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=orTLBezIgPXU1YDfv9jtSYzaYaz1tRaCz/ilOckrk3MTIvasySkl53JhBEUSGiJmG
	 VXs3hm4B2MNQ5txGZ80gukAypi6j3C9cqBI1hmXNwW4cGZjIk2B2mkOC5g4ewb7epU
	 dm6kofdsITrx1vHNArackQcsq08d7KG7ovA23L5kZOB5LHE01zc/ur0sJ4D8m2px1m
	 coR5x3Vz7tPwqKLPyiw3qE3jgbYDJklXqyi+hxOvXcezhT1Wr+Pw1BcOt0xeZu5MDT
	 oQCu1L2HqZtNac1Hk1EFw6HZ44w2LA07gva1DXXvjDOzfq5IdlOKMGtDlZypwxOjL/
	 nG/329kWebK6Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 24 Apr 2026 12:18:51 +0200
Subject: [PATCH v3 11/20] drm/atomic-state-helper: Rename
 __drm_atomic_helper_crtc_state_reset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-drm-mode-config-init-v3-11-8b68d9db0d8b@kernel.org>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
In-Reply-To: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>, 
 Melissa Wen <mwen@igalia.com>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Alex Hung <alex.hung@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4378; i=mripard@kernel.org;
 h=from:subject:message-id; bh=kEOJGo5NyE+zPc4t+KDjqy4fVmtP15kb/ncYDU1I/sM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmvnXsVOf/scVzHnseicaP/bqg6W/yvY5sjNmlt9DlzL
 itBY/nzjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARoZuMDdObK5Zl/Be7+HfB
 QeODfUH8iWeY026st3DYUegxh/vjYju+irtr6s0bvuad3XD8RaCfA2PDxokx/fbWrSc9Y8R1lH/
 P9nqx0Ohth+iFWZXSkU7Rz9+y+qh6WIef80izS5ASaJxtUwIA
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

__drm_atomic_helper_crtc_state_reset() is used to initialize a newly
allocated drm_crtc_state, and is being typically called by the
drm_crtc_funcs.reset implementation.

Since we want to consolidate DRM objects state allocation around the
atomic_create_state callback that will only allocate and initialize a
new drm_crtc_state instance, we will need to call
__drm_atomic_helper_crtc_state_reset() from both the reset and
atomic_create hooks.

To avoid any confusion, we can thus rename
__drm_atomic_helper_crtc_state_reset() to
__drm_atomic_helper_crtc_state_init().

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 10 +++++-----
 drivers/gpu/drm/i915/display/intel_crtc.c |  2 +-
 include/drm/drm_atomic_state_helper.h     |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 50fe4eec41a8..9cd8550cabb7 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -61,25 +61,25 @@
  * For other drivers the building blocks are split out, see the documentation
  * for these functions.
  */
 
 /**
- * __drm_atomic_helper_crtc_state_reset - reset the CRTC state
+ * __drm_atomic_helper_crtc_state_init - Initializes the CRTC state
  * @crtc_state: atomic CRTC state, must not be NULL
  * @crtc: CRTC object, must not be NULL
  *
  * Initializes the newly allocated @crtc_state with default
  * values. This is useful for drivers that subclass the CRTC state.
  */
 void
-__drm_atomic_helper_crtc_state_reset(struct drm_crtc_state *crtc_state,
-				     struct drm_crtc *crtc)
+__drm_atomic_helper_crtc_state_init(struct drm_crtc_state *crtc_state,
+				    struct drm_crtc *crtc)
 {
 	crtc_state->crtc = crtc;
 	crtc_state->background_color = DRM_ARGB64_PREP(0xffff, 0, 0, 0);
 }
-EXPORT_SYMBOL(__drm_atomic_helper_crtc_state_reset);
+EXPORT_SYMBOL(__drm_atomic_helper_crtc_state_init);
 
 /**
  * __drm_atomic_helper_crtc_reset - reset state on CRTC
  * @crtc: drm CRTC
  * @crtc_state: CRTC state to assign
@@ -94,11 +94,11 @@ EXPORT_SYMBOL(__drm_atomic_helper_crtc_state_reset);
 void
 __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
 			       struct drm_crtc_state *crtc_state)
 {
 	if (crtc_state)
-		__drm_atomic_helper_crtc_state_reset(crtc_state, crtc);
+		__drm_atomic_helper_crtc_state_init(crtc_state, crtc);
 
 	if (drm_dev_has_vblank(crtc->dev))
 		drm_crtc_vblank_reset(crtc);
 
 	crtc->state = crtc_state;
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index b8189cd5d864..a2ed4a76e061 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -179,11 +179,11 @@ struct intel_crtc_state *intel_crtc_state_alloc(struct intel_crtc *crtc)
 void intel_crtc_state_reset(struct intel_crtc_state *crtc_state,
 			    struct intel_crtc *crtc)
 {
 	memset(crtc_state, 0, sizeof(*crtc_state));
 
-	__drm_atomic_helper_crtc_state_reset(&crtc_state->uapi, &crtc->base);
+	__drm_atomic_helper_crtc_state_init(&crtc_state->uapi, &crtc->base);
 
 	crtc_state->cpu_transcoder = INVALID_TRANSCODER;
 	crtc_state->master_transcoder = INVALID_TRANSCODER;
 	crtc_state->hsw_workaround_pipe = INVALID_PIPE;
 	crtc_state->scaler_state.scaler_id = -1;
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index df371b2eef3e..e7fbbfdc5d69 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -38,11 +38,11 @@ struct drm_connector_state;
 struct drm_private_obj;
 struct drm_private_state;
 struct drm_modeset_acquire_ctx;
 struct drm_device;
 
-void __drm_atomic_helper_crtc_state_reset(struct drm_crtc_state *state,
+void __drm_atomic_helper_crtc_state_init(struct drm_crtc_state *state,
 					  struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
 				    struct drm_crtc_state *state);
 void drm_atomic_helper_crtc_reset(struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,

-- 
2.53.0


