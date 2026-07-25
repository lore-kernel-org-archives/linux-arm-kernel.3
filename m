Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A53C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 02:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BcLbD7rJ3HiOyl9l8N+1KjNuZIPj0rcXTuPHylZ9IHg=; b=SwAPROxlhVQCKD/H97vQSBZ7X9
	EQw+G1qxsRs8yLp5ZiCGFxYH67I6FypRSdg421sYrj1jTz0wOfMEcxFZOhI+jwvw0AgrQ9GEi9U2Z
	qX0J3Dlzh34K+8+Uc4ErwRAZiZpup6Gy1vuLUC5eUugZBbPxl6LuneBUCvJKVrzkwmXJizaJ4X7UP
	45Ud3mBEtdwfVg22/edk5VOufvYv4fctBWdB+wdLeG31lkbFhiMaixveSuvH7T5xXBWGIkw6UxF+3
	7cmhjD8P1aG9l/bsQrluaM5K3Vu9T38t68B36hXQ45/NYpKV7Qz5I+b2Sd9SVwG/mfSOW3eKaQYCO
	bRkKeg0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSby-0000000HVsJ-397Y;
	Sat, 25 Jul 2026 02:59:38 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSbw-0000000HVqn-1wGw;
	Sat, 25 Jul 2026 02:59:37 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wnSbp-0000000032V-3ApD;
	Sat, 25 Jul 2026 02:59:29 +0000
Date: Sat, 25 Jul 2026 03:59:26 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Allen Chen <allen.chen@ite.com.tw>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v6 06/13] drm/bridge: it6505: avoid division by zero in pixel
 clock calculation
Message-ID: <a9664c9ddd026a22cd246c0aac878d3c0e204d50.1784947240.git.daniel@makrotopia.org>
References: <cover.1784947240.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1784947240.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_195936_502305_A8F65D4D 
X-CRM114-Status: GOOD (  10.29  )
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

it6505_calc_video_info() checks the sum of the three pixel clock
counter samples for zero before dividing it by 3, so sums of 1 or 2
truncate to 0 and the following pixel clock calculation divides by
zero. Divide first and check the result.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v6: no changes

v5: new patch

 drivers/gpu/drm/bridge/ite-it6505.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 3806b0b96637..b7eb746c8f8e 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -751,12 +751,13 @@ static void it6505_calc_video_info(struct it6505 *it6505)
 		sum += rddata;
 	}
 
+	sum /= 3;
+
 	if (sum == 0) {
 		DRM_DEV_DEBUG_DRIVER(dev, "calc video timing error");
 		return;
 	}
 
-	sum /= 3;
 	pclk = 13500 * 2048 / sum;
 	it6505->video_info.clock = pclk;
 	it6505->video_info.hdisplay = hdew;
-- 
2.55.0

