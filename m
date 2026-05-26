Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18359CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 16:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aok21Jimg5K+CRRrvi34dp1Ge7LzhylE4juyhOlqmIY=; b=BjSY3rI/KdfBHvJm270hjdYfSW
	eiEDP/EEGgMAY3eOCFw6Hb5tYVMg/tAlXPKwttCoprKMqrR1EkV6Q906Z9lGjwSlSx+zBFZKJcB0r
	Faf4Xi8LPYqQHRxE37XWMikNZ7dcj3BopCi7J2ETb7hpaC9QjawqonFJ/SYcWIzLepiRvhWM1OWyj
	3U0JNMMpBZiyJeeCzG3k05tFi6+RxeuuzvmceNCfAaLSCbFJnxCICXU6dQsEa/5zCbVlkhUbhDHoB
	1IcT8mU5hkq2WYNfjPTbXsD+dw+G2ZXFd3K052wNR5xndDi7SzcDg04W08XVqPzOS9ZomYWZwgxqz
	NV7WBmpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuwN-00000002a15-3RAT;
	Tue, 26 May 2026 16:47:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuvl-00000002ZOh-0a7E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 16:47:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 893BC600CB;
	Tue, 26 May 2026 16:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8926B1F000E9;
	Tue, 26 May 2026 16:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779814020;
	bh=Aok21Jimg5K+CRRrvi34dp1Ge7LzhylE4juyhOlqmIY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=R1836xlykbZjHopvBMoUp6FDH1BusOxBGcWRNjgUmExb14AX/JtlCZdaH6KN3nUbr
	 v4XuRi8ira22xYSNmvw6ZBcfa8wOpXbgmM4SLvAaRdh9zpVgrG4hV4NMQfaQE53Dh2
	 nhjUJ6QUZ/PEMJ7byeAnS5sqCOKcYbiU5/33+IUn991X8dDG/EnINtQQ9xbb5LCXDP
	 g7Y5LYzz+O0XeLeSdi4vrZ4tXoWVoQhJaD4XaEihmuu4mkewhm17s85Cx8T6EVF/Fq
	 zHruyQPDO8N7WsxNw63TPG8vRqNWrpKpZR6Qc2aAMl690gY4muxZHx0oTz7rN2kJZT
	 lpgOmg23SPwGw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 May 2026 18:46:24 +0200
Subject: [PATCH v6 12/19] drm/crtc: Add new atomic_create_state callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-drm-mode-config-init-v6-12-852346394200@kernel.org>
References: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
In-Reply-To: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6880; i=mripard@kernel.org;
 h=from:subject:message-id; bh=amWXpgsA4utS9dVICamvf7R/VzGkoKjmktf87eNjxEI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmi56L5zn/NeFmgcfJNerf4lfQlfLPFP4SdPHu9j6dbT
 c3T5Yp5x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIp6mMDU9u90TNufp2Cbfp
 7F/GPgktO/afEJtlK/q16vibpxl5tk8OO53jrndveXa1tTTx4F6hPsaGR2sn7r9ZaSoieDR6XXr
 fzGX2Sqc9713qe/ktNTjpbVqjxVEmtvN7fKbWKvm9mO2mOyEKAA==
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

reset() also isn't fallible, which makes it harder to handle
initialization errors properly. This is only really relevant for some
drivers though, since all the helpers for reset only create a new
state, and don't touch the hardware at all.

It was thus decided to create a new hook that would allocate and
initialize a pristine state without any side effect:
atomic_create_state to untangle a bit some of it, and to separate the
initialization with the actual reset one might need during a
suspend/resume.

Continue the transition to the new pattern with CRTCs.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 25 +++++++++++++++++++++++
 drivers/gpu/drm/drm_mode_config.c         | 34 ++++++++++++++++++++++++++++++-
 include/drm/drm_atomic_state_helper.h     |  2 ++
 include/drm/drm_crtc.h                    | 16 +++++++++++++++
 4 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index b277f92f4532..8762171c9432 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -122,10 +122,35 @@ void drm_atomic_helper_crtc_reset(struct drm_crtc *crtc)
 
 	__drm_atomic_helper_crtc_reset(crtc, crtc_state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_crtc_reset);
 
+/**
+ * drm_atomic_helper_crtc_create_state - default &drm_crtc_funcs.atomic_create_state hook for crtcs
+ * @crtc: crtc object
+ *
+ * Allocates and  initializes pristine @drm_crtc_state.
+ *
+ * This is useful for drivers that don't subclass @drm_crtc_state.
+ *
+ * RETURNS:
+ * Pointer to new crtc state, or ERR_PTR on failure.
+ */
+struct drm_crtc_state *drm_atomic_helper_crtc_create_state(struct drm_crtc *crtc)
+{
+	struct drm_crtc_state *state;
+
+	state = kzalloc_obj(*state);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_crtc_state_init(state, crtc);
+
+	return state;
+}
+EXPORT_SYMBOL(drm_atomic_helper_crtc_create_state);
+
 /**
  * __drm_atomic_helper_crtc_duplicate_state - copy atomic CRTC state
  * @crtc: CRTC object
  * @state: atomic CRTC state
  *
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index fa609357858f..2e2cd18a14b4 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -206,10 +206,39 @@ static int drm_mode_config_plane_reset_with_create_state(struct drm_plane *plane
 	}
 
 	return drm_mode_config_plane_create_state(plane);
 }
 
+static int drm_mode_config_crtc_create_state(struct drm_crtc *crtc)
+{
+	struct drm_crtc_state *crtc_state;
+
+	if (!crtc->funcs->atomic_create_state)
+		return 0;
+
+	crtc_state = crtc->funcs->atomic_create_state(crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	if (drm_dev_has_vblank(crtc->dev))
+		drm_crtc_vblank_reset(crtc);
+
+	crtc->state = crtc_state;
+
+	return 0;
+}
+
+static int drm_mode_config_crtc_reset_with_create_state(struct drm_crtc *crtc)
+{
+	if (crtc->state) {
+		crtc->funcs->atomic_destroy_state(crtc, crtc->state);
+		crtc->state = NULL;
+	}
+
+	return drm_mode_config_crtc_create_state(crtc);
+}
+
 /**
  * drm_mode_config_reset - call ->reset callbacks
  * @dev: drm device
  *
  * This functions calls all the crtc's, encoder's and connector's ->reset
@@ -237,13 +266,16 @@ void drm_mode_config_reset(struct drm_device *dev)
 			plane->funcs->reset(plane);
 		else if (plane->funcs->atomic_create_state)
 			drm_mode_config_plane_reset_with_create_state(plane);
 	}
 
-	drm_for_each_crtc(crtc, dev)
+	drm_for_each_crtc(crtc, dev) {
 		if (crtc->funcs->reset)
 			crtc->funcs->reset(crtc);
+		else if (crtc->funcs->atomic_create_state)
+			drm_mode_config_crtc_reset_with_create_state(crtc);
+	}
 
 	drm_for_each_encoder(encoder, dev)
 		if (encoder->funcs && encoder->funcs->reset)
 			encoder->funcs->reset(encoder);
 
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index 0bb72453464a..213f7e298008 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -43,10 +43,12 @@ struct drm_device;
 void __drm_atomic_helper_crtc_state_init(struct drm_crtc_state *state,
 					  struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
 				    struct drm_crtc_state *state);
 void drm_atomic_helper_crtc_reset(struct drm_crtc *crtc);
+struct drm_crtc_state *
+drm_atomic_helper_crtc_create_state(struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
 					      struct drm_crtc_state *state);
 struct drm_crtc_state *
 drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index c6dbe8b7db9e..152349f973e3 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -636,10 +636,26 @@ struct drm_crtc_funcs {
 	 * 0 on success or a negative error code on failure.
 	 */
 	int (*set_property)(struct drm_crtc *crtc,
 			    struct drm_property *property, uint64_t val);
 
+	/**
+	 * @atomic_create_state:
+	 *
+	 * Allocate a pristine, initialized, state for the CRTC object
+	 * and return it. This callback must have no side effects: in
+	 * particular, the returned state must not be assigned to the
+	 * object's state pointer and it must not affect the hardware
+	 * state.
+	 *
+	 * RETURNS:
+	 *
+	 * A new, pristine, CRTC state instance or an error pointer
+	 * on failure.
+	 */
+	struct drm_crtc_state *(*atomic_create_state)(struct drm_crtc *crtc);
+
 	/**
 	 * @atomic_duplicate_state:
 	 *
 	 * Duplicate the current atomic state for this CRTC and return it.
 	 * The core and helpers guarantee that any atomic state duplicated with

-- 
2.54.0


