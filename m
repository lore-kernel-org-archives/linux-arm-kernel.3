Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C85CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 12:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmFg1F7stkBZtAn0NWj/38h1CH75VRKu7DzE/r76fNA=; b=07Ml99kKrA9+LJvil58SdlKda0
	2j6tfwISeYx00qvqozxzwPYOi60dtYFidnofOBktnrSj+QDUkaNeQIr/RihQMlRMeK4Mf1DmfF4QU
	rmTyvM52Na64GNJAy2tkkHbM9JJm4C8QaQJUiEWDQ0UEUCnB5XE9rmmBT72u9/+HcWS4ZVEaPXvvB
	NHnEZTwEtWJAszPEyhdiTZ8NG7hcy4SVoqyKZ4/AmGrUcQrrXOQVpG3RK+50XlHIzClyNA1/+LlXq
	728unjG8KQmSj2FkaMLbe1pf8jI+Xdytq9DDJ86wXg2AtXY+JI3kRUFKD+YTpCki+gHk1unGhsbSY
	oR/PWJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYJx-00000002P6R-3G0J;
	Fri, 19 Jun 2026 12:27:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYJw-00000002P5I-0p7X;
	Fri, 19 Jun 2026 12:27:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A1F23601E2;
	Fri, 19 Jun 2026 12:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9101F000E9;
	Fri, 19 Jun 2026 12:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781872059;
	bh=PmFg1F7stkBZtAn0NWj/38h1CH75VRKu7DzE/r76fNA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=b5SL0UfZ6gorAykE5x6ZtZ+1kPrVs1sPyRTgu6F+KTpR+UXSMZIKyLlDDLf3unIac
	 gPk2hAhFKVzrpi4AtjnkhFit0cVu9aeoRRlwlO86zFliF1/XsDH+pkyshMyBG1DFst
	 yVv2CHQBNH4udi0A+j3iYMQyfmhskrLr9r6uGGgdWU08l1KGu+dN8ugMAHdMCM/ONv
	 yBxFbazj6FNOnZ4in8NXdRqWXbu+SfGi4hCA7JIIEHVkZz4FkXzuy1+kUkRuBBGPBU
	 XrvzxNKFO4E4GXuRUa496nikHGDAywobkapO0KMPrpc4QLSPdUGVpXA26lA6Jc4Kbc
	 Li81T1F96DvOg==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:25:09 +0200
Subject: [PATCH v3 64/78] drm/rockchip: cdn-dp: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-64-ff399263111b@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1587; i=mripard@kernel.org;
 h=from:subject:message-id; bh=mH6AkWs35KuBQWOVkh00AHkgGCpu8OjsSiyDjardA9A=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmpmzqrOsqzwZ5T3ju2Fvztyzu1pvSE9c6V/xt+uuxp
 vrs4oNJHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiyW2M9RnL4p36NfIWrH6h
 PT96IseEl+IqF279fhyRmNq2eUpy2R+h7Q9Y+bl98g8YL5bn/HE2nrHerzzwXtf+rm3Xuia++JE
 Vt6Fp0p1qjre1AbMjTwnonj6lF/HGSlXsz1Uf6U+nZy/Ku9AFAA==
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

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Sandy Huang <hjc@rock-chips.com>
To: "Heiko Stübner" <heiko@sntech.de>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 190cce9530c8..e159e1627f3c 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -823,11 +823,11 @@ static int cdn_dp_audio_mute_stream(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.detect = cdn_dp_bridge_detect,
 	.edid_read = cdn_dp_bridge_edid_read,
 	.atomic_enable = cdn_dp_bridge_atomic_enable,
 	.atomic_disable = cdn_dp_bridge_atomic_disable,
 	.mode_valid = cdn_dp_bridge_mode_valid,

-- 
2.54.0


