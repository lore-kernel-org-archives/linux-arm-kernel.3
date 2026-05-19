Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8FFCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYXAqFoRcEkL95wvM12DGr8bfZeA6ccV/22CG4tnCnw=; b=1HCorfyZDc4JU9mbaLp1kp5eZD
	12ZNvi4pj5044O1hfoLuaaoH5O+N/k/MW8kmtELwghaJRrMbHssmE4rXxl/Mx61/cIi+V82KmB76Y
	0jySX6I5nH2mt4LBz3h+XB5q5fotsuzgRuc3SQHO7az7Ga7jG6kxfyYwS/scK3BDqoiiHnV2yXFP6
	usDDiOOvYsMVj2FjoHZ0yMpCuXr2WhFRXLGl4ZBVmcTh00+cuG5LG2YsNlXdixTp1prtwlqfegHWk
	zgXep5UqwMRXazu5qiUck9hjwA4kSuXe2VXFp3p04o5l8ddZK5mZudKc65nUfrcqtVL/R3V/PvMf5
	evN4uWuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGLW-00000000oPr-0Wfe;
	Tue, 19 May 2026 09:02:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGLR-00000000oKE-2dwT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:02:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1791F600AE;
	Tue, 19 May 2026 09:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46725C2BCB3;
	Tue, 19 May 2026 09:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779181352;
	bh=4hBvEGtlh5O19lqmxUP9acB4Jq06dsATivmTySgizkk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jJctsw4xJyMfsWIMgGZD13jSiLdFojln2K18WNNoHMrSxFdE3u0SHO2lWTeRgU6IW
	 CjSNbKM8v8SUjjLWmfxGy1Jy+T9icOTPfZ69vawHF2Mf/OkOSAZlvkiIS2/spVMuU8
	 Siu/zgqmdxcvr2T3TV2VI5mw9KbDuOOKWnoHZuCUWCq+vyI9k7Dsbrd9wd0jlLveV2
	 Y2lwoqId4mj76qfDOlupayiEi9+34l6+mVedWlOzHSWFAeT8iY8uoDsI4+5HBKf6xV
	 j9uF4l49ENAjbwHjNRnYTDDtayu1qDzNC1xbVwLPXeT067x6zz2GCPtsg6uyZkM/37
	 7txRKQvobe7eQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 19 May 2026 11:01:51 +0200
Subject: [PATCH v5 09/19] drm/atomic-state-helper: Rename
 __drm_atomic_helper_plane_state_reset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-mode-config-init-v5-9-388b03321e38@kernel.org>
References: <20260519-drm-mode-config-init-v5-0-388b03321e38@kernel.org>
In-Reply-To: <20260519-drm-mode-config-init-v5-0-388b03321e38@kernel.org>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4781; i=mripard@kernel.org;
 h=from:subject:message-id; bh=4hBvEGtlh5O19lqmxUP9acB4Jq06dsATivmTySgizkk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFk8an8tamPK53/mC750WWprpNA0BqvW8zLvlVZ3hQoac
 ubsu7WkYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzk1X7Ghre/f01wKn/eomN+
 tkXn3go+wcr8FOWT4sdvyz5gW6eoMof3n4++97Nc0/CSifnPNZjTGRv231qk3Ht3d68kA6uTeHO
 02RWuOTMLL67gmcj1Ma2Nxf9Y1CyLe4FLZya/KtyxQY3h2ikA
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c  | 12 ++++++------
 drivers/gpu/drm/i915/display/intel_plane.c |  2 +-
 include/drm/drm_atomic_state_helper.h      |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index c8ccf8be5074..ee01700d4ca7 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -235,19 +235,19 @@ void drm_atomic_helper_crtc_destroy_state(struct drm_crtc *crtc,
 	kfree(state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_crtc_destroy_state);
 
 /**
- * __drm_atomic_helper_plane_state_reset - resets plane state to default values
+ * __drm_atomic_helper_plane_state_init - Initialize the plane state
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
index c181a7d063ec..11467d19399d 100644
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
 	plane_state->fence_id = -1;
 }
 
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index 61a3b38ad49f..691c1ccfa4e0 100644
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
2.54.0


