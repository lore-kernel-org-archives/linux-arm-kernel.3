Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC0910987A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDbpQ5Hi1srwFEa7NgxJvlGtNgiSMeIdpttE2kbBpok=; b=nn8hLno9fVnxYuBTaCDLRAiF33
	RYdMSjKk+DSiu+PhgqUbMbAHOWV2ryCQ0CUjiPMC3h7YRvehUGPHhzNBDzmG5xrQdOqEr6NchvpzD
	VfZmJZyuSisrvcaO+yDA4X+ejGsxMBl9244tMWsk06iiZVXapM3BOQJu5F24srF43FGoAWutXtsi/
	5FRVaVROeCWMSBU8WU/7pRAQ9j0oX9r2cMLZay2p035mcab3TPtJj6HJgUJ2iaF77ovEBN7nECPhO
	1gX2ARygaqXiIYjvybk6bFB3cOeA0vc0Ag9ECD2YJySdmbQnkLEgRGEeGxiu4s06HwPREy0DcUSr/
	x+hJN7Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3chq-0000000D88z-0ROi;
	Fri, 20 Mar 2026 16:28:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3chW-0000000D7q8-07MN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:27:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6DB8F60180;
	Fri, 20 Mar 2026 16:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973E5C2BCB0;
	Fri, 20 Mar 2026 16:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024073;
	bh=OYt8JWbC+U6q/3y2//UayFFXZtrcd5X4C504StwyqRQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DwIbUBtvumaLwZ1WZdcLDF7TptZ16+RxASwEbQzNQpnjPpfEltfnvFBUdcHDwhmRU
	 Zmsqq3OG5Q2SFpa3movm/BWdLKo2EggXovikorC9vOk96UaWu92ojVxbTXeHOYdOzG
	 wAHoHz24J9WyRCo6+uBt/LVXtTBxUM8zTD7m9r5j4q4SEMG7pY1nEiF9WMyrBvIMqN
	 Xdk9nVHiXsIuwvrBGlzMWUVNRZ0cMPzUb/GUrk4vrKNe/l2/UMj+9NI10iSLWyD2Wg
	 MgXDhMm2abVNz/uFjMyyKaklV7Kol+SV6Uarkf4NvQCzj/55IUxTkUlrIAFzM4worI
	 /p7hbIdVexT+A==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:16 +0100
Subject: [PATCH v2 09/20] drm/atomic-state-helper: Rename
 __drm_atomic_helper_crtc_state_reset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-9-c63f1134e76c@kernel.org>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
In-Reply-To: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4492; i=mripard@kernel.org;
 h=from:subject:message-id; bh=OYt8JWbC+U6q/3y2//UayFFXZtrcd5X4C504StwyqRQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7S9MDOHvnzzj21Ncr7+PaI8x37rqcnKR0roKvNzVr+
 pUg4ekXO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBE7mkyVrNNmca1aWdeg/3B
 fx8rz0zmYdmfz/NsptErdZ4Lju8ufBMx45T5xLM52mKeo+3DkpJtzIwNrdYf8pi8z7nfWaS1qu3
 J1IsP1s/Y1vVnYbfiybV/ru//59KSWGyaaBH1aUlr8IFuvqAFAA==
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
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 10 +++++-----
 drivers/gpu/drm/i915/display/intel_crtc.c |  2 +-
 include/drm/drm_atomic_state_helper.h     |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index f4ce9d3573cbecf216904db54335e0cf84a01c39..b87cc3cd5b0021699ac57a33739d172a5706e2e1 100644
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
index 53378d2dcbec867e7973cb3b874802f2ada01d41..b57a59a5f7786f1029d576b0f3d564e77b7060e4 100644
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
index 6a3a2feb3dff1f2fbdf2a6e63d8d7317c7d6ead6..161cd1f6b8266e882eb1fd128b403cba350be3d2 100644
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


