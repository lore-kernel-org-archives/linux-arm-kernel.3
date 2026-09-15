Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA449C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8oxrJgI4DlQCKYb+mTgrYUPdm2is++2ExLzzDokFSQ=; b=qEZ5w3yVmQgm6f2/q6LvbZ/Jdj
	B6Holx7bPE3WOHpRaaQ1R3s9+6/0CMEl8hAql8brNahmFlaq3msEo134wbDYbf/EoguVXVd7z/pCI
	+GLOIkEhFEpV8mtwgQx0TeWNaB5r526Uc7b5ZYytGl8+juB5ay94gmIi07NVJoZU5UTrHv2VS8TZU
	/3mkG4Az1l7R/XU3TJ6yGpxI60ixgB7s42nmYM9Skr8qWqC3alhnem7Aa2xzq35xfRmB/5izsquW3
	BIgdAK9MK08tcC79QhLhJwqDIkfzsSRWn4ty5PAWO0a5lkLBatpaKL8HnXeSGK1AVRPkhIlvmgTjR
	gGdODJJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WJO-00000007TFG-2NyH;
	Tue, 15 Sep 2026 16:47:14 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WJI-00000007TBK-1Pff;
	Tue, 15 Sep 2026 16:47:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BCACC1A0827;
	Tue, 15 Sep 2026 16:47:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FDC5602B0;
	Tue, 15 Sep 2026 16:47:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 331BF11C7AFDA;
	Tue, 15 Sep 2026 18:47:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789490825; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=g8oxrJgI4DlQCKYb+mTgrYUPdm2is++2ExLzzDokFSQ=;
	b=2OdrkAYbByzuEX8pxvEC7fssdfI480zw8qGLV71m5d+RRl1Iyr8Tn2M4Xw585Lqm3YiaM9
	ktInnXZZX2sYq+Lv5ij9DejURg8UKH+t3XnG6Uxy3px/HIb1QRaPULHasPOcDibgxbmpN6
	hQ+iGX61w2RKvyesAz5StmKdjm/Y+lsLsTKBIIP9pL8SxGabsY7PzC1frgKiF2YBmu+wyI
	qtATH+qzcHyWGr4/VI9qJCdqi9YaAhGBVJad8cPeTACZvIB5+/Rx8PzYUBJQMm0sRBDxLk
	zH8zQy/4SWSeVgbiVbCJ4tsCBs1PtVLLzvXkApti4e5RqcJl61d5YlU/y8vByA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 15 Sep 2026 18:46:17 +0200
Subject: [PATCH v4 4/9] drm/bridge: parade-ps8622: select DRM_PANEL_BRIDGE,
 not DRM_PANEL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-drm-bridge-drm_panel-cleanup-v4-4-30401d9406f3@bootlin.com>
References: <20260915-drm-bridge-drm_panel-cleanup-v4-0-30401d9406f3@bootlin.com>
In-Reply-To: <20260915-drm-bridge-drm_panel-cleanup-v4-0-30401d9406f3@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Vincent Palatin <vpalatin@chromium.org>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_094709_903091_0EE2CEDF 
X-CRM114-Status: GOOD (  10.58  )
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

This driver does not use the drm_panel APIs at all, so no need to select
DRM_PANEL.

But it uses devm_drm_of_get_bridge(), which is enabled by DRM_PANEL_BRIDGE.

Cc: Vincent Palatin <vpalatin@chromium.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 1d4db73bd760..65f4d9d9b67d 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -276,7 +276,7 @@ config DRM_OF_DISPLAY_MODE_BRIDGE
 config DRM_PARADE_PS8622
 	tristate "Parade eDP/LVDS bridge"
 	depends on OF
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
 	select BACKLIGHT_CLASS_DEVICE
 	help

-- 
2.55.0


