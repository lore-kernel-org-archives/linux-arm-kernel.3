Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8126CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0uRAKmoTcdWxVl0y1aWEcfZ605CPR74dshkiJ4lpGE=; b=iA5YedrVnmoHVMJs/gkCYktWP8
	WTUhGX8Zgso5TB6R8g6ma8Qj9Oao4BvUM1V768CXBD0ab5W2cf1yCWErb29+sRprK5w9YRBjtRLgW
	jwSCPzQWTXZDBLBWSDo1/2ts68JgGY02wFx0oKlbjEtRCgO/jQOSnm0lIwwOv/ByIsX24VTmcrdeO
	Qf8j0oSSdKvl06GyK9Qlrm1VcuSpPSJ7VGq5f8GfmrvSh+JtU32cw3LHGLqtZds1ol76tZgTK1o6I
	K1bQW+ncrvStAkxzaJBNJkQIPu8YdKcQN+9p4YXSb98MhZ40yhGkjVepAxPHaIhnwrq8dv6RnqMPo
	e2E0uwGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGLy-00000000p47-1pnL;
	Tue, 19 May 2026 09:03:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGLd-00000000ocE-2JIu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:02:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0BDC6021A;
	Tue, 19 May 2026 09:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 299EDC2BCF6;
	Tue, 19 May 2026 09:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779181364;
	bh=qaSP70ZhrUcMPjOf7+v4uq6SslBv0gdUuCOqJYZwmRw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DhsPAFh1HLHamNZIy+/qK6AOk3u2H5FFVxjmUrdmAw62Qf4lwLqdsDa1i+4objsVr
	 VmRKOzadgdAzYFU/Ffe7OOVhLRSUliyaeWRuti3RLGoQwCCNYYIZDghyGNRnYnHRfz
	 I7StC58LnoC99Zxkld/j+mbzWE4JUVB/PSGSwjCItpHTkujIHPO9N4vd3hh4npmVkX
	 r4/kmpJ7VsQHlMkrzAiK5id5Z/2OfFjnbd/BOqRrvv88l75aW6kYwq9c7v/77hlukk
	 vk9qlIKKVlmU5/6wZEcRbFzAyMeUM/bekeSzLDRhOKDuh84RFAdd6SjSlpZfJlqDhk
	 FaWDMisYla4RQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 19 May 2026 11:01:55 +0200
Subject: [PATCH v5 13/19] drm/atomic-state-helper: Rename
 __drm_atomic_helper_connector_state_reset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-mode-config-init-v5-13-388b03321e38@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4078; i=mripard@kernel.org;
 h=from:subject:message-id; bh=qaSP70ZhrUcMPjOf7+v4uq6SslBv0gdUuCOqJYZwmRw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFk8av8mCG4N23pu3v+oI4suc61e/9Fi+53cgEC51qXvp
 H5s9a2a3DGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmcu0QY8NFrpS+pdP2dG/5
 tbLwMd/Ch9+fKuQfrFlUJ1Yua1m8cuK1EvYpBr7PFCv4G7L3vbo3pY+x4cjkPpmTPbdNc+QnVm7
 bnMg3t0xO1lpyhaPdvGWlL28dze+w3rRqrq3ZUaEQVYdvttttAA==
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

__drm_atomic_helper_connector_state_reset() is used to initialize a
newly allocated drm_connector_state, and is being typically called by
the drm_connector_funcs.reset implementation.

Since we want to consolidate DRM objects state allocation around the
atomic_create_state callback that will only allocate and initialize a
new drm_connector_state instance, we will need to call
__drm_atomic_helper_connector_state_reset() from both the reset and
atomic_create hooks.

To avoid any confusion, we can thus rename
__drm_atomic_helper_connector_state_reset() to
__drm_atomic_helper_connector_state_init().

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 12 ++++++------
 include/drm/drm_atomic_state_helper.h     |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 8762171c9432..e2e5a1b8a820 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -474,24 +474,24 @@ void drm_atomic_helper_plane_destroy_state(struct drm_plane *plane,
 	kfree(state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_plane_destroy_state);
 
 /**
- * __drm_atomic_helper_connector_state_reset - reset the connector state
+ * __drm_atomic_helper_connector_state_init - Initialize the connector state
  * @conn_state: atomic connector state, must not be NULL
- * @connector: connectotr object, must not be NULL
+ * @connector: connector object, must not be NULL
  *
  * Initializes the newly allocated @conn_state with default
  * values. This is useful for drivers that subclass the connector state.
  */
 void
-__drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_state,
-					  struct drm_connector *connector)
+__drm_atomic_helper_connector_state_init(struct drm_connector_state *conn_state,
+					 struct drm_connector *connector)
 {
 	conn_state->connector = connector;
 }
-EXPORT_SYMBOL(__drm_atomic_helper_connector_state_reset);
+EXPORT_SYMBOL(__drm_atomic_helper_connector_state_init);
 
 /**
  * __drm_atomic_helper_connector_reset - reset state on connector
  * @connector: drm connector
  * @conn_state: connector state to assign
@@ -506,11 +506,11 @@ EXPORT_SYMBOL(__drm_atomic_helper_connector_state_reset);
 void
 __drm_atomic_helper_connector_reset(struct drm_connector *connector,
 				    struct drm_connector_state *conn_state)
 {
 	if (conn_state)
-		__drm_atomic_helper_connector_state_reset(conn_state, connector);
+		__drm_atomic_helper_connector_state_init(conn_state, connector);
 
 	connector->state = conn_state;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_connector_reset);
 
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index 213f7e298008..9634a70e0401 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -68,11 +68,11 @@ struct drm_plane_state *
 drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane);
 void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state);
 void drm_atomic_helper_plane_destroy_state(struct drm_plane *plane,
 					  struct drm_plane_state *state);
 
-void __drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_state,
+void __drm_atomic_helper_connector_state_init(struct drm_connector_state *conn_state,
 					       struct drm_connector *connector);
 void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
 					 struct drm_connector_state *conn_state);
 void drm_atomic_helper_connector_reset(struct drm_connector *connector);
 void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);

-- 
2.54.0


