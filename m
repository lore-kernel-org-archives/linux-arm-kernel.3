Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D011FE5200
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 10:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3VfNarDMK9xP6dRuNlRcAIDyB/IIwDrUZDeRsfjooY=; b=crXPKClfy1+nWYzwRuFbgtwI9b
	HbUyXwJ7DEjXX+GJYYRL07tMh+FR8GJ197V9lE1mz3/HGk8G541JcWrFwc8dD0k+cqzVE1dv6RHqM
	iOZsQIiQau65dt4ShNofYify0YIjoaDmQBHRz07ZcMxZuokTHDCHZla4lPGiDixpNth73Xev7PHGK
	XTk2P1mJgNNERVs4n/gr5U03IeYwf01v5oqPAyRf8uXiOYtC9yo1DGV99edVem2rqwxGXbbfh95B8
	EExc17q8yD1yTIxZGYIzQwj6jI+vgCQ/ex8mNQDNXVQv3ke1Q8c34De0wvDpMDpNXAvB2tCDN1djp
	gHo56ssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDdE-0000000D0kA-18WY;
	Fri, 24 Apr 2026 10:19:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDd6-0000000D0c8-30qm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 10:19:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 272186001A;
	Fri, 24 Apr 2026 10:19:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF4AC2BCB6;
	Fri, 24 Apr 2026 10:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777025963;
	bh=8PZTAxPa5/UAYysgAmUIBuPOx5UFXVYyKiqDTD5O9mI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I3GZ8WNqRt1wZouvSNkhGd7vGsGdq8+PJ98nZljbs1AWHSJXtuU2Txkw3Dpm4FvMw
	 q7//Ea9mSIzSMoryL76KvK11sgL67N3pW1xtd8GeH5EisrVjOqmSQ7OVnKTzRz0PpD
	 xRxBKSIuWtPJOi0lYpPnO9jEEaMsKvor1xlRf2vWyYV/6pG/iue248R51T0fjKIxQq
	 7Xj0OwVvPRuIMOmcTZoVNb2PgGHYbLQU0rwKZrf4Gk2D+KLfnCVp9sJljm+6KZ5S9b
	 fxTSWPBRJTuZH5fqzfn7AhCKPuHdMiRVOTG4FUti2qmpVNzFhJBYIs0KoJdNYpbi9L
	 twsnhPIp9a5zA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 24 Apr 2026 12:18:48 +0200
Subject: [PATCH v3 08/20] drm/atomic-state-helper: Fix
 __drm_atomic_helper_plane_reset() doc typo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-drm-mode-config-init-v3-8-8b68d9db0d8b@kernel.org>
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365; i=mripard@kernel.org;
 h=from:subject:message-id; bh=8PZTAxPa5/UAYysgAmUIBuPOx5UFXVYyKiqDTD5O9mI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmvnXvq3cMVPeb5cNeK5/Lpvr183ySM2eHDLz+R7dkeC
 hX29b0dU1kYhDkZZMUUWZ7IhJ1e3r64ysF+5Q+YOaxMIEMYuDgFYCI1Roz1HtExXwLfX0qYW7t/
 /f1PikJNZ6bHnN1tnT09SG2xzPqoT9Xb3Bfrie1utHTmnmztfD6PsWFi4qR/1kyv16bdfui468/
 lo8xFszavV/luvGDriYOP9lWe9OBf3vvBZX2u/p9fJmvkdA4BAA==
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

A typo has slipped through in the __drm_atomic_helper_plane_reset()
documentation, probably due to copy and paste. It will not assign
drm_crtc state pointer, but rather the drm_plane's.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 875149494b00..e1f3d05ad347 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -303,11 +303,11 @@ EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
  * __drm_atomic_helper_plane_reset - reset state on plane
  * @plane: drm plane
  * @plane_state: plane state to assign
  *
  * Initializes the newly allocated @plane_state and assigns it to
- * the &drm_crtc->state pointer of @plane, usually required when
+ * the &drm_plane->state pointer of @plane, usually required when
  * initializing the drivers or when called from the &drm_plane_funcs.reset
  * hook.
  *
  * This is useful for drivers that subclass the plane state.
  */

-- 
2.53.0


