Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DCFC624D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=noXi8KkwXvKTIf9gKovPhUzGvCJ7DGZHeX2oJodEpL0=; b=eVghDaV2r6Vj8io1LdGMedLj0Q
	v5+IebJJZl4xa9ujRnPYmy53ydXWHyvwx3zG2NQW+lT1hCIHgsv9Z7Mwzmlb7Xlfi7/Fz+lqHwjAz
	UTlhL1OVUesY7Qx8PRlpa93eRrDdQD36FXsiXqvmiEzvXcuSK4UGJ4Vk3+CUvGMeQvoE13Lc4H56S
	/QP16hYv8Y6lzywh6ptwVrtNKf+vKO+3iEyAiHRboaYkiz4WIblXF3Ld0F1u+dBHneAicOplEpNuR
	YrHVSaEkyxRoN9eoHpb/Fw68jMkYWoz3Z7Xd4gW/FCm88cHbhUNzpaA4/q3jGPP26boKRLkm6OfST
	PYJYaP9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TaL-0000000D285-2DMN;
	Tue, 01 Sep 2026 18:51:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZN-0000000D0gM-1t5v;
	Tue, 01 Sep 2026 18:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288651;
	bh=52SHubet5SaV+kKQFBzjZ5yUZtnU6pyMnCC+4rJZhmM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NU9A6WWB7lYdDPYIV5473m3R90EYjTPIjLXjeLT+KwovqBxkmrwX6oHis/lPhvEpu
	 uskrtsdpg/pextGZ5G1riFS7DLnoPH014Dh+nm1KGWstpCTWPipwnhCXKvDWMDpgPP
	 pdSa/lUvyPE/TAQDY1ptzJQBc/d4NTzx7fSIuIjk3Ft/ntQIPmeUKw/Ux+lFMMTqXl
	 2tEPMz/JxLUMjm8NJvqsRCKBM/AvroJ0upw13Rg9/SM0hLB/kVpK3es5De7DL/tafO
	 8BMIrDteCOqpNPmvkFZKC7SVjfMWuX+Hih85tDZnVp8xBS02PjUut0gn6uvFfJytaR
	 38Yp+wbS87m9A==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 782EB17E3622;
	Tue, 01 Sep 2026 20:50:51 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:50:38 +0300
Subject: [PATCH v11 14/74] drm/bridge: Fix unlocked list access in
 drm_bridge_attach()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-14-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Helge Deller <deller@gmx.de>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-fbdev@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_115056_055378_036B170A 
X-CRM114-Status: GOOD (  11.32  )
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

drm_bridge_attach() inspects bridge->list to warn about bridges being
attached without a previous drm_bridge_add() call, but it does so
without holding bridge_lock.

The list head can be concurrently written by drm_bridge_add(),
drm_bridge_remove() and __drm_bridge_free() while they operate on
neighbouring entries of bridge_list or bridge_lingering_list, all of
them under bridge_lock.  Hence the unlocked read is a data race, even
though it is unlikely to change the outcome of list_empty() in practice.

Perform the check with bridge_lock held.

Fixes: 76f1a9711b83 ("drm/bridge: add warning for bridges attached without being added")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_bridge.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index a8b6df5c13ea..10dde3600c70 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -606,8 +606,10 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	if (!bridge->container)
 		DRM_WARN("DRM bridge corrupted or not allocated by devm_drm_bridge_alloc()\n");
 
-	if (list_empty(&bridge->list))
-		DRM_WARN("Missing drm_bridge_add() before attach\n");
+	scoped_guard(mutex, &bridge_lock) {
+		if (list_empty(&bridge->list))
+			DRM_WARN("Missing drm_bridge_add() before attach\n");
+	}
 
 	drm_bridge_get(bridge);
 

-- 
2.55.0


