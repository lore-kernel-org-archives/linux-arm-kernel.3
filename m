Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B168CCD4F3F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 13:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QR/jGVZD1YjY6X/DBy2ysIMWMOu3L7402vP6ItxTJG4=; b=kmuavUa479tC8AVqbqOl1RibcO
	nTmrVFOI83voKvjBWTY2/pD9FPNyl0Oc7UmJUq7f8kPDbSS1a9Vb+GWOiOgrqnP9UmnZTnAyJxHwu
	z9rh+kvrxa3fOLo59xpv4j0vmaWeLKtV0nsdj8xmnFbXo+WKd6/DEqo+u5R8TBUmu/97VlWLQDlDQ
	LLXHSgBuiq05i1yhz3EcgatwhIKIG0k8AybhzYhtSLxfUrcQTcJeCX3tUGeKqo171YBf6cce2AUEg
	jiVxEKUiHvms54hra7YOMQsps5ymABY4vAsisD1UMn+pA8a3a3GNBg0Pc49LAtIeQT6gYtDXFWTqo
	m/Fn7zsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmox-0000000Gkrj-1Eyu;
	Tue, 12 May 2026 13:06:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmos-0000000Gkn8-3cxd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 13:06:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F98C41827;
	Tue, 12 May 2026 13:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EAEC2BCFD;
	Tue, 12 May 2026 13:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778591202;
	bh=ws84eVBkBuBXcteGS1ly6aYWO3fPLpn5a4wl+4ygSks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Sw+IE2ImXY9bgoBKJXpdL+KH5ocAcVHDkYK+C2M+TAC/buaCNfQtJKRjz9FB4hWEe
	 wPTpX9pNct+DIYtHk0db3qZp+EGsWHwO302il5s1IB4jWPmJ7ncCWERmprPLKp7bpw
	 ztNm2q4/zEW+n8rblytow9zmjcHYZe6GIrgpUzbpDRYiNAvxcF7RjGQkQrI5gG9ZLs
	 1kqcXvaemNXlcoXBPPvN0S1Eu/nq0ZagTTYyivknvrc81fjk7Ibs4Qi5Oj6TB/Y0XM
	 8Mm1ZEy1Sx97TTxVrbWlCHDNRVCMPY/7mU8E6C7OM1+qD/F7mQLso7kzdGij9YXRz+
	 rhxn1L50hne1Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 12 May 2026 15:06:08 +0200
Subject: [PATCH v4 10/20] drm/plane: Add new atomic_create_state callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-drm-mode-config-init-v4-10-591dfdcc1bf9@kernel.org>
References: <20260512-drm-mode-config-init-v4-0-591dfdcc1bf9@kernel.org>
In-Reply-To: <20260512-drm-mode-config-init-v4-0-591dfdcc1bf9@kernel.org>
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6799; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ws84eVBkBuBXcteGS1ly6aYWO3fPLpn5a4wl+4ygSks=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnMqvs5vjxIjWKT/re2YeXLlptBB94INre2t817381nu
 ifRizeyYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzkpABjw4awxGhXFZWJ9TKr
 Jc1+uncdTVga1M513U96qviP1LrOXx9+ZYs43HEuTXxgpbf34szfjA0vnixQT/vm5rLoZiXzzab
 3bh1CXru3JOw5lvx12p3UOfq7ZCdeLvLYKbPwmvxefi91GQkA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_060643_410923_BCEEDBE2 
X-CRM114-Status: GOOD (  21.86  )
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

Commit 47b5ac7daa46 ("drm/atomic: Add new atomic_create_state callback
to drm_private_obj") introduced a new pattern for allocating drm object
states.

Instead of relying on the reset() callback, it created a new
atomic_create_state hook. This is helpful because reset is a bit
overloaded: it's used to create the initial software state, reset it,
but also reset the hardware.

It can also be used either at probe time, to create the initial state
and possibly reset the hardware to an expected default, but also during
suspend/resume.

Both these cases come with different expectations too: during the
initialization, we want to initialize all states, but during
suspend/resume, drm_private_states for example are expected to be kept
around.

reset() also isn't fallible, which makes it harder to handle
initialization errors properly. This is only really relevant for some
drivers though, since all the helpers for reset only create a new
state, and don't touch the hardware at all.

It was thus decided to create a new hook that would allocate and
initialize a pristine state without any side effect:
atomic_create_state to untangle a bit some of it, and to separate the
initialization with the actual reset one might need during a
suspend/resume.

Continue the transition to the new pattern with planes.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/drm_mode_config.c         | 31 ++++++++++++++++++++++++++++++-
 include/drm/drm_atomic_state_helper.h     |  2 ++
 include/drm/drm_plane.h                   | 16 ++++++++++++++++
 4 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index ee01700d4ca7..ab171bfe6e86 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -338,10 +338,35 @@ void drm_atomic_helper_plane_reset(struct drm_plane *plane)
 	if (plane->state)
 		__drm_atomic_helper_plane_reset(plane, plane->state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_plane_reset);
 
+/**
+ * drm_atomic_helper_plane_create_state - default &drm_plane_funcs.atomic_create_state hook for planes
+ * @plane: plane object
+ *
+ * Allocates and initializes pristine @drm_plane_state.
+ *
+ * This is useful for drivers that don't subclass @drm_plane_state.
+ *
+ * RETURNS:
+ * Pointer to new plane state, or ERR_PTR on failure.
+ */
+struct drm_plane_state *drm_atomic_helper_plane_create_state(struct drm_plane *plane)
+{
+	struct drm_plane_state *state;
+
+	state = kzalloc_obj(*state);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_plane_state_init(state, plane);
+
+	return state;
+}
+EXPORT_SYMBOL(drm_atomic_helper_plane_create_state);
+
 /**
  * __drm_atomic_helper_plane_duplicate_state - copy atomic plane state
  * @plane: plane object
  * @state: atomic plane state
  *
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index c33382a38191..fa609357858f 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -180,10 +180,36 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
 	drm_connector_list_iter_end(&conn_iter);
 
 	return ret;
 }
 
+static int drm_mode_config_plane_create_state(struct drm_plane *plane)
+{
+	struct drm_plane_state *plane_state;
+
+	if (!plane->funcs->atomic_create_state)
+		return 0;
+
+	plane_state = plane->funcs->atomic_create_state(plane);
+	if (IS_ERR(plane_state))
+		return PTR_ERR(plane_state);
+
+	plane->state = plane_state;
+
+	return 0;
+}
+
+static int drm_mode_config_plane_reset_with_create_state(struct drm_plane *plane)
+{
+	if (plane->state) {
+		plane->funcs->atomic_destroy_state(plane, plane->state);
+		plane->state = NULL;
+	}
+
+	return drm_mode_config_plane_create_state(plane);
+}
+
 /**
  * drm_mode_config_reset - call ->reset callbacks
  * @dev: drm device
  *
  * This functions calls all the crtc's, encoder's and connector's ->reset
@@ -204,13 +230,16 @@ void drm_mode_config_reset(struct drm_device *dev)
 	struct drm_connector_list_iter conn_iter;
 
 	drm_for_each_colorop(colorop, dev)
 		drm_colorop_reset(colorop);
 
-	drm_for_each_plane(plane, dev)
+	drm_for_each_plane(plane, dev) {
 		if (plane->funcs->reset)
 			plane->funcs->reset(plane);
+		else if (plane->funcs->atomic_create_state)
+			drm_mode_config_plane_reset_with_create_state(plane);
+	}
 
 	drm_for_each_crtc(crtc, dev)
 		if (crtc->funcs->reset)
 			crtc->funcs->reset(crtc);
 
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index 691c1ccfa4e0..8d1ef268fdef 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -53,10 +53,12 @@ void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state);
 void drm_atomic_helper_crtc_destroy_state(struct drm_crtc *crtc,
 					  struct drm_crtc_state *state);
 
 void __drm_atomic_helper_plane_state_init(struct drm_plane_state *state,
 					   struct drm_plane *plane);
+struct drm_plane_state *
+drm_atomic_helper_plane_create_state(struct drm_plane *plane);
 void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
 				     struct drm_plane_state *state);
 void drm_atomic_helper_plane_reset(struct drm_plane *plane);
 void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
 					       struct drm_plane_state *state);
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 419c88c873a6..2c5a5a70a71b 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -386,10 +386,26 @@ struct drm_plane_funcs {
 	 * 0 on success or a negative error code on failure.
 	 */
 	int (*set_property)(struct drm_plane *plane,
 			    struct drm_property *property, uint64_t val);
 
+	/**
+	 * @atomic_create_state:
+	 *
+	 * Allocate a pristine, initialized, state for the plane object
+	 * and return it. This callback must have no side effects: in
+	 * particular, the returned state must not be assigned to the
+	 * object's state pointer and it must not affect the hardware
+	 * state.
+	 *
+	 * RETURNS:
+	 *
+	 * A new, pristine, plane state instance or an error pointer
+	 * on failure.
+	 */
+	struct drm_plane_state *(*atomic_create_state)(struct drm_plane *plane);
+
 	/**
 	 * @atomic_duplicate_state:
 	 *
 	 * Duplicate the current atomic state for this plane and return it.
 	 * The core and helpers guarantee that any atomic state duplicated with

-- 
2.54.0


