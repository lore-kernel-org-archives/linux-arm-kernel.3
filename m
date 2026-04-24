Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D592FE5206
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 10:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gs5nMI3fu6nGTZpxtYO1CRgwOlabxmzLEqGGLDrXETI=; b=dQAHXMdMUKg+4PBM0cbnkXmAN5
	iK6nAVM4JPS/shWpBy98mHCHn3WurmR6gVxZaRaEr60KVbikIWW7V1pP7UPkWe/L4H22SUErQfUxE
	Iff9j1CVcoZetvRhqBFHAQkcYQfNc8qKLKx8RdgA2owYP4gmF9yhy3yYbo4D328lqDVhoDcRvSntE
	up+e0C+wnAVs/vPUf+SnCLXZFgy2r+aDDcleP7CmpItRuZFLi1lDsRWLcXvvLyMCBQwN1t16JFNDS
	sXeMIAJeMu7UKr+hxoCK3a11Y5sbAjzde8CmRq6OlpfqS7TSV5nLJMzAZkjWItWu9qfNft1jxTk+s
	CFKFZU9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDdE-0000000D0kf-2fiL;
	Fri, 24 Apr 2026 10:19:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDd9-0000000D0eP-0SKq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 10:19:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BEBE0445AA;
	Fri, 24 Apr 2026 10:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1673EC2BCB8;
	Fri, 24 Apr 2026 10:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777025966;
	bh=rE/WZBw6Q0jt5fysoRp8YLFy3Df9deHa3egfMVbBxqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=earn/RZSBwV/l63lQ4u7mNAiwGPbXk3SXuK5/WYoeiHs1o66deeo0Ivkqg4JjS3a6
	 62/FAWJ+0YV7A1llFLYowW8O/LwdYsY6HSuwwgyzthGoMOaeJNdKCDUPqNGNzlEiYd
	 7oVhvUkaYzsplPkXz+PxS7E5S0rUcqiUdHar0k+UVICQmViGYoPC7E4XdXr8RXAc1t
	 H7SQ/5QYkwRUE3aB9Oqbk97pTEpgfYugpyeSeudpIaGgm4UJtNCdZ5lswmt868DWon
	 POuc6ZLGS063Nc9JYtx6iBPdWOzsIb7hj54T+6C7IBY1wl1XeLJDVv0l8NAPUFJ+OL
	 VznFvbUJYXR5A==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 24 Apr 2026 12:18:49 +0200
Subject: [PATCH v3 09/20] drm/atomic-state-helper: Rename
 __drm_atomic_helper_plane_state_reset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-drm-mode-config-init-v3-9-8b68d9db0d8b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4722; i=mripard@kernel.org;
 h=from:subject:message-id; bh=rE/WZBw6Q0jt5fysoRp8YLFy3Df9deHa3egfMVbBxqY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmvnXvSd/dOmeDHpP9H5ZD/k38/FdZpz7rAHMh6fOmj/
 8VLllis6JjCwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATefKNsVTsutn7Ky9DlhlI
 bNkq6LFb+GL8HuGjKwQvTY+cI3P8+fXPmh9ZV+ZO716izNrMbPWIjbFhzn8r78+LAx7wcqtuypx
 lqTDxruPDh/v72qOuX/aTe72164qL0abuMvauS8tLSx7frakHAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_031927_234485_14228B29 
X-CRM114-Status: GOOD (  15.29  )
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

__drm_atomic_helper_plane_state_reset() is used to initialize a newly
allocated drm_plane_state, and is being typically called by the
drm_plane_funcs.reset implementation.

Since we want to consolidate DRM objects state allocation around the
atomic_create_state callback that will only allocate and initialize a
new drm_plane_state instance, we will need to call
__drm_atomic_helper_plane_state_reset() from both the reset and
atomic_create hooks.

To avoid any confusion, we can thus rename
__drm_atomic_helper_plane_state_reset() to
__drm_atomic_helper_plane_state_init().

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c  | 12 ++++++------
 drivers/gpu/drm/i915/display/intel_plane.c |  2 +-
 include/drm/drm_atomic_state_helper.h      |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index e1f3d05ad347..285efbf29520 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -235,19 +235,19 @@ void drm_atomic_helper_crtc_destroy_state(struct drm_crtc *crtc,
 	kfree(state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_crtc_destroy_state);
 
 /**
- * __drm_atomic_helper_plane_state_reset - resets plane state to default values
+ * __drm_atomic_helper_plane_state_init - Initializes the plane state
  * @plane_state: atomic plane state, must not be NULL
  * @plane: plane object, must not be NULL
  *
  * Initializes the newly allocated @plane_state with default
- * values. This is useful for drivers that subclass the CRTC state.
+ * values. This is useful for drivers that subclass the plane state.
  */
-void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
-					   struct drm_plane *plane)
+void __drm_atomic_helper_plane_state_init(struct drm_plane_state *plane_state,
+					  struct drm_plane *plane)
 {
 	u64 val;
 
 	plane_state->plane = plane;
 	plane_state->rotation = DRM_MODE_ROTATE_0;
@@ -295,11 +295,11 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
 							   plane->hotspot_y_property,
 							   &val))
 			plane_state->hotspot_y = val;
 	}
 }
-EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
+EXPORT_SYMBOL(__drm_atomic_helper_plane_state_init);
 
 /**
  * __drm_atomic_helper_plane_reset - reset state on plane
  * @plane: drm plane
  * @plane_state: plane state to assign
@@ -313,11 +313,11 @@ EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
  */
 void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
 				     struct drm_plane_state *plane_state)
 {
 	if (plane_state)
-		__drm_atomic_helper_plane_state_reset(plane_state, plane);
+		__drm_atomic_helper_plane_state_init(plane_state, plane);
 
 	plane->state = plane_state;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_reset);
 
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index 5390ceb21ca4..d013d9228d0b 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -65,11 +65,11 @@
 static void intel_plane_state_reset(struct intel_plane_state *plane_state,
 				    struct intel_plane *plane)
 {
 	memset(plane_state, 0, sizeof(*plane_state));
 
-	__drm_atomic_helper_plane_state_reset(&plane_state->uapi, &plane->base);
+	__drm_atomic_helper_plane_state_init(&plane_state->uapi, &plane->base);
 
 	plane_state->scaler_id = -1;
 }
 
 struct intel_plane *intel_plane_alloc(void)
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index 900672c6ea90..44e8850aae7f 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -51,11 +51,11 @@ struct drm_crtc_state *
 drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state);
 void drm_atomic_helper_crtc_destroy_state(struct drm_crtc *crtc,
 					  struct drm_crtc_state *state);
 
-void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *state,
+void __drm_atomic_helper_plane_state_init(struct drm_plane_state *state,
 					   struct drm_plane *plane);
 void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
 				     struct drm_plane_state *state);
 void drm_atomic_helper_plane_reset(struct drm_plane *plane);
 void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,

-- 
2.53.0


