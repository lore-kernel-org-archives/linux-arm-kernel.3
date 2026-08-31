Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A979C624C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EjicvGqkSrsJUQu/V2bDvrATSZ5gFUEV+GL7szDeTF8=; b=Uq5h8hbV2kqch/TYLYsTthS8Yv
	upvjBy8SLvt/05zSMK0n0ZwYVX0iaN22uO3ujEp0a24DA2aRkfDVFaq5CrkhPD61K/EsgwSZW2ha9
	4oAU6jJsPu3TecVU7IjWEMHRjT1PHugk6bpI3srn12+Pt4G4dswsb3gSGEu11hxVTkjoSl5ZzJZ6E
	wJQcK6KPgluxFefBQs4b76wCRTnyVHfVcyDV/QZ+srLpQFdwQiBWCpIrLYAoXRBhQO5AUHgAt0W2W
	0tDILNxL2g8LdKltPtloC0xXEr8QcJXOzpFzo/spNdpIjI2bbW16qU6BL+6fl81nxikIOKAo+wf5V
	MJg3hKgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14er-0000000A09d-41v8;
	Mon, 31 Aug 2026 16:14:53 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14ef-00000009zua-46aU;
	Mon, 31 Aug 2026 16:14:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4C7FC4E4147F;
	Mon, 31 Aug 2026 16:14:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F9CD60231;
	Mon, 31 Aug 2026 16:14:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8743E11C791C9;
	Mon, 31 Aug 2026 18:14:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788192878; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EjicvGqkSrsJUQu/V2bDvrATSZ5gFUEV+GL7szDeTF8=;
	b=xE67WfKLRRbD8I360HFIk94vzVFZ72x7twqcKJ5pxbwr6HmbKItSHGx2QBcgD76wnn6jk6
	Avbo/pvhjeAOZFpK5AGBMgKpG39nExZPT1rsflfLOeME4KUJiwquSwTA3s5NO3wnJCg2hK
	bnfyFhMSnPoCwF2tpGhSs2sS9tKDFlPM7H7ZIAcOeFF/ImfqwCt5Q9yg64+rfYw0TLgaTx
	GvYXbUGHDYaTSRd6e0AuFx1NE2lEk6228bYjewsU6ddTLHjrZ3Q/YPCnADNFo+o5wGbIhO
	vJ5AfoqYLKks2SPsyQ0eyOJFGascF9GP68nDQSMv56JyA7EKFs8znqAjQQAGdw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 31 Aug 2026 18:13:35 +0200
Subject: [PATCH v3 09/13] drm/bridge: tc358775: select DRM_PANEL_BRIDGE,
 not DRM_PANEL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-drm-bridge-drm_panel-cleanup-v3-9-50efd8168b3e@bootlin.com>
References: <20260831-drm-bridge-drm_panel-cleanup-v3-0-50efd8168b3e@bootlin.com>
In-Reply-To: <20260831-drm-bridge-drm_panel-cleanup-v3-0-50efd8168b3e@bootlin.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Tony Lindgren <tony@atomide.com>, 
 Michael Walle <mwalle@kernel.org>, Vinay Simha BN <simhavcs@gmail.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_091442_168851_F74F0461 
X-CRM114-Status: GOOD (  10.81  )
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

Cc: Tony Lindgren <tony@atomide.com>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Vinay Simha BN <simhavcs@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 65f4d9d9b67d..e2ee76899468 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -421,7 +421,7 @@ config DRM_TOSHIBA_TC358775
 	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	select DRM_MIPI_DSI
 	help
 	  Toshiba TC358775 DSI/LVDS bridge chip driver.

-- 
2.55.0


