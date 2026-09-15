Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5FFC88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLOehHTQ/WXK8R/pVOQvKNT+LOYuNe8gT3lU0A2hNAI=; b=GB6uJeZmFc2pqq13XT3HZH1tPt
	fJdJy6RBs3csdXK1kMIcRDjS54F35stBFA5py9/AezMessKhoiqbPuIix3cV1yFpUF27hc9awroKF
	VZdwFm4n1H22MFBCHsF9DdYKzqxM3rno5mXOHp/yNNj09mZ4hro/LNa/ilX15YoZkDhsQK/YSZ/f4
	8qnrM03x9RVDif0m8EYbFlY/Bb5uYI64DzF2B89Z+xmFXhM6MVEUJv6xetMWAUVuS7gABksmDe0y8
	AN3vORq7t9FBZJjMkuYBmleB1YPVWcIVwx5ISp+ac3G/XPlCPjbrrZNtpS56wUQREEnRco1SYiUQk
	bPzzwdAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WJO-00000007TED-0cJg;
	Tue, 15 Sep 2026 16:47:14 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WJC-00000007T6V-3Zur
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:47:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3E3BD4E40639;
	Tue, 15 Sep 2026 16:46:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10D56602B0;
	Tue, 15 Sep 2026 16:46:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 355F411C7B005;
	Tue, 15 Sep 2026 18:46:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789490813; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jLOehHTQ/WXK8R/pVOQvKNT+LOYuNe8gT3lU0A2hNAI=;
	b=A5MjBa5cR9xc2yipHATr8nuVDYZYmVEir4RubUZZzc0QE8clih0wrwgx1gGvy8EDWJ4tWm
	B+Zc7NM4P8Qt61MddUfsvLLLiRhwE3IRq6+3eXT6dZCaYPpEPI7RXU2GR1t61bMCmb3L3+
	rLvvE090VNz8Q4+LkoOqC6UgFcf8Wlot6/TFNV56h7xP6zsvKKTho7tYmKZJo5bhfIx/X9
	qfQTVwsBkza4aqwobgpsD+lLYE78XcaG2IFSelVRcLwJqAClOErG8DtlOVPmZjWdMGT4w6
	fVyalGWv7mVTDJIC+j9Fcg5Lko4QEGnbuqGAqc12NOK7kveR+kJb3XbVCGeWGg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 15 Sep 2026 18:46:15 +0200
Subject: [PATCH v4 2/9] drm/bridge: ti-dlpc3433: don't depend on DRM_PANEL,
 select DRM_PANEL_BRIDGE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-drm-bridge-drm_panel-cleanup-v4-2-30401d9406f3@bootlin.com>
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
 Jagan Teki <jagan@amarulasolutions.com>, 
 Christopher Vollo <chris@renewoutreach.org>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_094703_050765_E691772F 
X-CRM114-Status: GOOD (  11.06  )
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

Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Christopher Vollo <chris@renewoutreach.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index a402f8c5b321..c98f62b23b1d 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -428,9 +428,10 @@ config DRM_TOSHIBA_TC358775
 
 config DRM_TI_DLPC3433
 	tristate "TI DLPC3433 Display controller"
-	depends on DRM && DRM_PANEL
+	depends on DRM
 	depends on OF
 	select DRM_MIPI_DSI
+	select DRM_PANEL_BRIDGE
 	help
 	  TI DLPC3433 is a MIPI DSI based display controller bridge
 	  for processing high resolution DMD based projectors.

-- 
2.55.0


