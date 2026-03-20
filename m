Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE1F10987A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=accSL1vv+OHzErV97R7qfHI0X18Ua/+UJVzG4F8D7g8=; b=HL7NyAzzY7UoezAY8YViaIQ8QB
	E18h+pvU9BZ9SvXbm3BqLHiw1QhmnWJB4EHaKM2grORYNyRLrjl6Ci7aSo4TP9fF7Cuy3l7tVTaq8
	jMSv++rcvKinLrMgJrkcCfwj0xxAAcIfjWo+GDI+kKezzpXLGLQ3ZT8+VtjJAUkU6VsCGG6y7mvFT
	nAEGl+2Cb4IEyY13mh6yhwkcsFUkUWksBGwavtB7/sye68UWiqMJuHgKKYX+hAGKuyS672r/O49W5
	H9vrSu2Wj7zq/SycAj3ubTncl+aI2o1f31a2MA5b3tMo7tiEoM7+CllcMwGf16OZA76ZygPB/SffF
	fs3VXABw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3chX-0000000D7sK-0oD5;
	Fri, 20 Mar 2026 16:27:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3chT-0000000D7om-1274
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:27:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A2FD16014C;
	Fri, 20 Mar 2026 16:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC7BC4CEF7;
	Fri, 20 Mar 2026 16:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024070;
	bh=PqsB2RkCa3QvLCcQsrbNql5Tpc2ViDnOBzVDeVnK5+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V8N5xB8fWgzIV/wvvGWMu5wiPk47S0tclDbbQD3QZre9gW1tVU9DrbdTEuHibE+xN
	 0ahEA5cRSH+k+S/dEUVw06niuEJK3isbeHMpQMpCVFATybGOflEJaTP68QH2p2f9jb
	 4mZlKaoX6xYsYi/qmK9w2420DzaM/q5aOpiPeB9sX6M+sskK26khZ7L3+4bgLjbFMb
	 1kJi37NAQjE17hblh9rmDiIQ5V/ByIpm+eiByZR2DJwFuDr3jKaWTRLqdtK4MSJfPq
	 bcKpdNr6ggNKNT5JlfxdEhxXoe7HK3uYY3aYJd9Dw1e70mouu3WpZIJUaJCgMIc7ar
	 bzvwHP5RtG5tg==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:15 +0100
Subject: [PATCH v2 08/20] drm/plane: Add new atomic_create_state callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-8-c63f1134e76c@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7550; i=mripard@kernel.org;
 h=from:subject:message-id; bh=PqsB2RkCa3QvLCcQsrbNql5Tpc2ViDnOBzVDeVnK5+A=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7S9Nf2fekS4S8cdA35pGoFkx7EFB7VUrR4/p21WWJK
 aUqNm0dU1kYhDkZZMUUWZ7IhJ1e3r64ysF+5Q+YOaxMIEMYuDgFYCI98xnrM95/3rorqjpU5c/l
 nyqy7Mv0M6JZRBbJrlKWTVZgu8Umz8y0NMXdZsGja6odgkGfvscw1sqvMnk6leld+W2eU0wLC39
 WpxycdjDc1rVf7pjM3bWzX/8Wjf+4hu/AueI/c2+VN++Y8xUA
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

And reset() isn't fallible, which makes it harder to handle
initialization errors properly.

And this is only really relevant for some drivers, since all the helpers
for reset only create a new state, and don't touch the hardware at all.

It was thus decided to create a new hook that would allocate and
initialize a pristine state without any side effect:
atomic_create_state to untangle a bit some of it, and to separate the
initialization with the actual reset one might need during a
suspend/resume.

Let's continue the transition to the new pattern with planes.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 44 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_mode_config.c         | 21 ++++++++++++++-
 include/drm/drm_atomic_state_helper.h     |  4 +++
 include/drm/drm_plane.h                   | 13 +++++++++
 4 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 2548d6da13675f63304dc92423c5d225de0447a8..f4ce9d3573cbecf216904db54335e0cf84a01c39 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -319,10 +319,29 @@ void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
 
 	plane->state = plane_state;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_reset);
 
+/**
+ * __drm_atomic_helper_plane_create_state - initializes plane state
+ * @plane: plane object
+ * @state: new state to initialize
+ *
+ * Initializes the newly allocated @state, usually required when
+ * initializing the drivers.
+ *
+ * @state is assumed to be zeroed.
+ *
+ * This is useful for drivers that subclass @drm_plane_state.
+ */
+void __drm_atomic_helper_plane_create_state(struct drm_plane *plane,
+					    struct drm_plane_state *state)
+{
+	__drm_atomic_helper_plane_state_init(state, plane);
+}
+EXPORT_SYMBOL(__drm_atomic_helper_plane_create_state);
+
 /**
  * drm_atomic_helper_plane_reset - default &drm_plane_funcs.reset hook for planes
  * @plane: drm plane
  *
  * Resets the atomic state for @plane by freeing the state pointer (which might
@@ -338,10 +357,35 @@ void drm_atomic_helper_plane_reset(struct drm_plane *plane)
 	if (plane->state)
 		__drm_atomic_helper_plane_reset(plane, plane->state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_plane_reset);
 
+/**
+ * drm_atomic_helper_plane_create_state - default &drm_plane_funcs.atomic_create_state hook for planes
+ * @plane: plane object
+ *
+ * Initializes a pristine @drm_plane_state.
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
+	__drm_atomic_helper_plane_create_state(plane, state);
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
index cba527571ca66d3aa6dc652c87e03a19815d1d41..09b8292195ba5eb5d96735aee5506407bd32ade3 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -180,10 +180,26 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
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
 /**
  * drm_mode_config_reset - call ->reset callbacks
  * @dev: drm device
  *
  * This functions calls all the crtc's, encoder's and connector's ->reset
@@ -204,13 +220,16 @@ void drm_mode_config_reset(struct drm_device *dev)
 	struct drm_connector_list_iter conn_iter;
 
 	drm_for_each_colorop(colorop, dev)
 		drm_colorop_reset(colorop);
 
-	drm_for_each_plane(plane, dev)
+	drm_for_each_plane(plane, dev) {
 		if (plane->funcs->reset)
 			plane->funcs->reset(plane);
+		else if (plane->funcs->atomic_create_state)
+			drm_mode_config_plane_create_state(plane);
+	}
 
 	drm_for_each_crtc(crtc, dev)
 		if (crtc->funcs->reset)
 			crtc->funcs->reset(crtc);
 
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index 44e8850aae7fd6390f4b58188a9c677b8389702f..6a3a2feb3dff1f2fbdf2a6e63d8d7317c7d6ead6 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -53,10 +53,14 @@ void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state);
 void drm_atomic_helper_crtc_destroy_state(struct drm_crtc *crtc,
 					  struct drm_crtc_state *state);
 
 void __drm_atomic_helper_plane_state_init(struct drm_plane_state *state,
 					   struct drm_plane *plane);
+void __drm_atomic_helper_plane_create_state(struct drm_plane *plane,
+					    struct drm_plane_state *state);
+struct drm_plane_state *
+drm_atomic_helper_plane_create_state(struct drm_plane *plane);
 void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
 				     struct drm_plane_state *state);
 void drm_atomic_helper_plane_reset(struct drm_plane *plane);
 void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
 					       struct drm_plane_state *state);
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 703ef4d1bbbcf084c43aa5e127d28691878061c4..4d4d511b681d50c17fbc593cce9f706d63e04a52 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -386,10 +386,23 @@ struct drm_plane_funcs {
 	 * 0 on success or a negative error code on failure.
 	 */
 	int (*set_property)(struct drm_plane *plane,
 			    struct drm_property *property, uint64_t val);
 
+	/**
+	 * @atomic_create_state:
+	 *
+	 * Allocates a pristine, initialized, state for the plane object
+	 * and returns it.
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
2.53.0


