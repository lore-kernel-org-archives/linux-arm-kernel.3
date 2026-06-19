Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73C3CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 12:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJjZc0IhgnYrKyF82EVcvBptKZA3RjfKUz5eV2PYOaU=; b=5Gj5NYrQiy5SIEjkKyT8OhDmPn
	ibxYnDpy+fM1BCRaPXfIaEbZOOUXY6+eNMlQTLYHGoDpsZ4xeF4+QYsYL9xL5T61CcBqkGMWIBYm2
	n6d+2+Ws4yolKiwJaEOuTd1jj4u+KnD187qejqAN4H9AgxSFQxRI/hXsXHoN5VWtWoJqplNMiJ6tN
	1hPcKqo7yLiZ41bD0+aYkH3EV2veNJIYJk9dVk/TF4evjQBUGqxT2a8DYVXL70jnwpf3vyQ/5JYCR
	SkfcJwiRxdUoqpbQFYXzGUrWT1o26FijMdbjjJ3xHhkMvb/11lYU4emk+Yo06LcyjFNcvKA3xg3kV
	wjYC9mDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYJe-00000002OoZ-2hjs;
	Fri, 19 Jun 2026 12:27:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYJa-00000002Ohn-1M25;
	Fri, 19 Jun 2026 12:27:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E4BE24018A;
	Fri, 19 Jun 2026 12:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C771F000E9;
	Fri, 19 Jun 2026 12:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781872037;
	bh=rJjZc0IhgnYrKyF82EVcvBptKZA3RjfKUz5eV2PYOaU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Vv2gBPvOyyFkU0YOmjAqDkKFSiqGCn/+/RHdDpC5GPMrSlfpmK9KNEACp/8TEvohB
	 iLP3ADjw+j6uYU/6x0JyeJXypveut2DiEXGU4V/AaDpKR4+BXOwFtt3m06atcqls5r
	 kLe1zkp6o4b7RgKVPECQU3wCQ6rdG38aa9W8bYC+UBvvvFglsAQ4XjBQ8w0VbQhlxg
	 gzIamWjPkehHRiwOol2QWIfFRyJD4KyFgu0hA2jhcctDhpF6rwFzlix5j8D4Y1c9XR
	 EEq8DJHlfCT2AMLMR4rmZMKU3qnss2vwtlmJhERG+9Xg3ucRCH33qtDu6GffXYEuRw
	 /Q/Xrqjt/+XzA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:25:01 +0200
Subject: [PATCH v3 56/78] drm/meson: encoder_hdmi: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-56-ff399263111b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1649; i=mripard@kernel.org;
 h=from:subject:message-id; bh=gtmH4lt8SDlqOlNBQJ9TmUX1oA8MT9jRtDBh19zvA/8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmpkzRu39PPs0XUrwuOLA8/k/qw7d5j3IkXhUcMfRUc
 XevK3XtmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABORbWOsr2/dd0W5YonZ4RWR
 X5uOHPL+euZK9C//970zJj+RO+Jj9j0sZ2Vr+97er606JlWXVF7sYayVy0yYrPy5QXzR1lwPGbu
 4Xuvrfx9vOetc8/PNZy7nNU/nS3bw2MacVs9b96TthcVah2MA
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
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 55c0601df3c6..0c7a72cb514a 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -364,11 +364,11 @@ static const struct drm_bridge_funcs meson_encoder_hdmi_bridge_funcs = {
 	.atomic_disable = meson_encoder_hdmi_atomic_disable,
 	.atomic_get_input_bus_fmts = meson_encoder_hdmi_get_inp_bus_fmts,
 	.atomic_check = meson_encoder_hdmi_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 };
 
 int meson_encoder_hdmi_probe(struct meson_drm *priv)
 {
 	struct meson_encoder_hdmi *meson_encoder_hdmi;

-- 
2.54.0


