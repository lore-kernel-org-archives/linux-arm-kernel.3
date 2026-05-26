Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1A2CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 16:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRUQ7VRBHVaVxbbAttWXyHjOTDYSaT6tyGmviBcmO54=; b=CzvRpFkhXzkaRZZep5Y9HxQJws
	keDjDjWoxXL+bRunRxCPmHrJ2bHgHA2c5h1ujYxT5EX4COjFEiJRi6mvKttXbq+UA8nG8mmw9+Tsx
	U6+bIN/HVVv5hnV77UOjaLOvaBpve0eOlp0BbSnOPy7prJmZxpN2h+QaTyJDkL3C1v3kJ9ZD8INUr
	cEUbM8LDuaKQ3As7nPdntXumA7JYxgjMgm+q/+/UmreTAa3Q5/OoXnTEgPQT1B4FW14AJZRJ2FfAk
	AKfRl42XPQrExX8dJeH0NfoOHRTcAmO4kEZMlSFkkgtfljaWBC4aN+kfkbGFRJViuBimsK84eX8+e
	67dGSx+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuwR-00000002a5G-0MLp;
	Tue, 26 May 2026 16:47:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuw2-00000002Zkn-25p5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 16:47:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E3593600AB;
	Tue, 26 May 2026 16:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E388D1F000E9;
	Tue, 26 May 2026 16:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779814037;
	bh=TRUQ7VRBHVaVxbbAttWXyHjOTDYSaT6tyGmviBcmO54=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AoP8XAOyuJBTC63xV4E2FvD0BRz+TQxAh9AbHbcxZx+8brUKbTDGTd8Xg9pz2fBc3
	 dQ7z68tSmzRR4W82bCLaqoaUfVQVsiXZpDybNHS2OHkYuF0AjyYiWmJHKt5F3wr7xj
	 3jwLOHyFggvGbeRzsENQFLoU5v3W2EcGR0YhRK6hDLdu4C2zSG3G4vkYZNsrpj7diF
	 E+CBQfDmQ14yR54FN/8ExAndssFTOX+Qam1y71lUo3p03mu5vnXDh4nzL8oirif3Ew
	 NO8XFELru7gZ2vTlwehF9yuq9vQj53hDwrhdg4VddhCqwsSQUNoRyr2AaHu2J9fVCk
	 RkSJx4OBhR//g==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 May 2026 18:46:30 +0200
Subject: [PATCH v6 18/19] drm/tidss: Convert to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-drm-mode-config-init-v6-18-852346394200@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3091; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ol7ZxJRFzPU3goqwZsKdhnIW4o0nEjdILT7N6tLltxI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmi5+LW6KoEezDblxwLfnKj7/sUGcNu2T7miYu2Ojn7d
 9bsYo3smMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABN595+xzsJeuvLKxa6GlG2n
 S5omXlHxFoxOn3f/yqKwTU52bVPvfc1o3jLj0q0H/o9uVty9OE1tKmPDNqm+Bfpq6rOE9Ofq2oi
 eNtc5L3g9ta49c//mb8u2nQ/ieSsQ6bVEO1X8Rot3B4cQczoA
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

Our driver uses reset to create the various object states, but only
calls the helper that allocate a new state. They are thus strictly
equivalent to the new atomic_create_state helpers, so let's switch to
these.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_crtc.c  | 17 +++++++----------
 drivers/gpu/drm/tidss/tidss_plane.c |  2 +-
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index acab9307bdf3..400329aa2200 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -355,24 +355,21 @@ static void tidss_crtc_destroy_state(struct drm_crtc *crtc,
 
 	__drm_atomic_helper_crtc_destroy_state(&tstate->base);
 	kfree(tstate);
 }
 
-static void tidss_crtc_reset(struct drm_crtc *crtc)
+static struct drm_crtc_state *tidss_crtc_create_state(struct drm_crtc *crtc)
 {
 	struct tidss_crtc_state *tstate;
 
-	if (crtc->state)
-		tidss_crtc_destroy_state(crtc, crtc->state);
-
 	tstate = kzalloc_obj(*tstate);
-	if (!tstate) {
-		crtc->state = NULL;
-		return;
-	}
+	if (!tstate)
+		return ERR_PTR(-ENOMEM);
 
-	__drm_atomic_helper_crtc_reset(crtc, &tstate->base);
+	__drm_atomic_helper_crtc_state_init(&tstate->base, crtc);
+
+	return &tstate->base;
 }
 
 static struct drm_crtc_state *tidss_crtc_duplicate_state(struct drm_crtc *crtc)
 {
 	struct tidss_crtc_state *state, *current_state;
@@ -403,14 +400,14 @@ static void tidss_crtc_destroy(struct drm_crtc *crtc)
 	drm_crtc_cleanup(crtc);
 	kfree(tcrtc);
 }
 
 static const struct drm_crtc_funcs tidss_crtc_funcs = {
-	.reset = tidss_crtc_reset,
 	.destroy = tidss_crtc_destroy,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
+	.atomic_create_state = tidss_crtc_create_state,
 	.atomic_duplicate_state = tidss_crtc_duplicate_state,
 	.atomic_destroy_state = tidss_crtc_destroy_state,
 	.enable_vblank = tidss_crtc_enable_vblank,
 	.disable_vblank = tidss_crtc_disable_vblank,
 };
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index 1a8b44fb45f8..6d82976c2db1 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -176,12 +176,12 @@ static const struct drm_plane_helper_funcs tidss_primary_plane_helper_funcs = {
 };
 
 static const struct drm_plane_funcs tidss_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.reset = drm_atomic_helper_plane_reset,
 	.destroy = drm_plane_destroy,
+	.atomic_create_state = drm_atomic_helper_plane_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 };
 
 struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,

-- 
2.54.0


