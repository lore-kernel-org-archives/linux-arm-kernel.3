Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091DECD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 12:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JMMUJnOZpTITDM6oIihe3vGgCV3w7ccCufoOcsZaU4=; b=sTPv1op/GUvzobH7ieHfVrqWbO
	M/ZWPlg4GV/aLX+rc8/0W6m7f8XzayCkVBHuBzq7P/KrU0uyZGVZyPJRSBRAvMU3PUxnQQ4Jin7Ei
	FgVnM84aKVEeHhXMfwSv7PHQyUcxJRCfrxi16Pl86hBLk6JDNrGORwoJMZDx7bad0xAIZke4XOxip
	559UXU3KiLUOo8GdEzcFVM+cKq3v0OQ6Z6qb1JdEV1aeY950f3sLTGZw8KfGxWdRe3l7izHMXZcAA
	3OCksyKDHc2RRze/9wXJI8+yZHsu1u2jNx3I8KKwffeTLnQZWa8KtY1GJn31d78Lf5FVO5VdP+9Aj
	A0IsJJaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYJa-00000002OiD-1Qki;
	Fri, 19 Jun 2026 12:27:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYJX-00000002OfV-4C3V;
	Fri, 19 Jun 2026 12:27:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 70B93601E1;
	Fri, 19 Jun 2026 12:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2D21F00A3D;
	Fri, 19 Jun 2026 12:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781872035;
	bh=+JMMUJnOZpTITDM6oIihe3vGgCV3w7ccCufoOcsZaU4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bVY78EMLIWwV2el30svT582BNPF2NO/zatc3iZbE7EWjCC8IxuWd5veLS4Doa5T82
	 unelp5yiDsesXdQQOsAhE60/MQRX6m5oLGGZ0QqKH8b+PNTU20w4qwaSKQFnSZDsqF
	 +MTymy83U0fNku71dcTEdHpe7tn/waBEdd38sMDZoKZeA1c0dTTtSAWz0A2ZfsfdFD
	 qOlUynjWxMyKjSHdqEJ/0Oj3F4m7RTnxfhB3TwLng4Noa0RgG9pZh5dWorWHSndpIF
	 IAS3ZSEFxzFlS1D+GQqVthYU0ZAAH//9zojQSg2VrumYDkyk/Cp/fLyHuMbcZzlwjC
	 odINjw9Gzh8MA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:25:00 +0200
Subject: [PATCH v3 55/78] drm/meson: encoder_dsi: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-55-ff399263111b@kernel.org>
References: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
In-Reply-To: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608; i=mripard@kernel.org;
 h=from:subject:message-id; bh=sXx0wMZeYzHhXbB0JWwNwadgHy4wy9yVO5hFwPLtWHk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmpkzvuXb/Shb+3vLfvJJnzbwlq7juaG3dHXRL3VDYM
 6VVS6+2YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExk6mvGegfX03801pv5bVy1
 7fRXt1kKZ5ex5IlcWfZ8xg3/+XIlU91OGtr3C4iynLv2atlcwaWNuxkbJne8l5Oskp7Ld1Hqlnv
 pnFvf+bRd+YtmtNS++qkVqn3OwvGKqdUs1/Zd34p7T0kWyG0HAA==
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

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/meson/meson_encoder_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index c1f4685073bb..3e422b612f74 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -94,11 +94,11 @@ static const struct drm_bridge_funcs meson_encoder_dsi_bridge_funcs = {
 	.attach	= meson_encoder_dsi_attach,
 	.atomic_enable = meson_encoder_dsi_atomic_enable,
 	.atomic_disable	= meson_encoder_dsi_atomic_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 };
 
 int meson_encoder_dsi_probe(struct meson_drm *priv)
 {
 	struct meson_encoder_dsi *meson_encoder_dsi;

-- 
2.54.0


