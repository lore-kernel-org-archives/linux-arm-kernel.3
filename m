Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA71EC624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QcBWaaEQKdZzuohrRvD5zKSPSt1kcAuIgFhNTdGC4k=; b=J31HQxc7M+3fhA+N3q6zM9TPKI
	ssiqPJMv9QJ9A2ypgSKwYU7Hlubt/Z4RIjQlREsTuLkBziHsOqtnwwFUMo/Gq0EWoCBROMySBnU8A
	HN8TBQpPRP552tzaG9WT/FJvzVuyq/iIICld/1SPvUy/2ABB13009+NdlqyWR+FKUINGNzt+RPzh/
	eSY2K0QavDA+141R0re68HBhpSSsEI4DCXJJM0dgGfcFod/7977b6QOZNxij5SksqB9z7S9rUxHoT
	v28IFI0zo8+D82CtKAjZYtTbN7jEknlkad1iuFBDdx52wJqbhFbgmR1mCPa5ZCERyfZyKmy1oA8jM
	rpTmsSEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14fI-0000000A0aC-0VGh;
	Mon, 31 Aug 2026 16:15:20 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14f4-0000000A0Lt-1N3P;
	Mon, 31 Aug 2026 16:15:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AEC534E41480;
	Mon, 31 Aug 2026 16:15:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8321F60231;
	Mon, 31 Aug 2026 16:15:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E700211C7922A;
	Mon, 31 Aug 2026 18:14:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788192899; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7QcBWaaEQKdZzuohrRvD5zKSPSt1kcAuIgFhNTdGC4k=;
	b=ZCjmWfKzLnRzpCdJ/mJs1ymsbnwN6n4x1GxEt4jX6mw7bn0muFOF9TshCdtxe5fOCVUWLY
	3vy8bDnX1Km4g2at1QGkuVHfj8otKneROHukhWzZGJ5Vo71xMeTx9nqW+eB5UR5IKochAS
	iIksApnZ0Fibs+Mj4qrf1YuFlLMDlEYmTWP/HntIp31uiULAlJ8dhMhKqqvWnYNmtQWXQH
	DUeZL6IBvoASQbX/Y52mWxoAX5E1hYhfm6F7oI9Qf31m9tlGrer2Zc8s9DUc0Bwc/h/8Dr
	w8c+RaRTC5JRHyr5dk503HvdSlrbJyA4BsBJ8MF4DxpaIQGmQfqKP6hnvESKsA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 31 Aug 2026 18:13:38 +0200
Subject: [PATCH v3 12/13] drm/bridge: ssd2825: select DRM_PANEL_BRIDGE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-drm-bridge-drm_panel-cleanup-v3-12-50efd8168b3e@bootlin.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_091506_533699_7FD6C9FD 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
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

This driver uses drm_panel_bridge_add_typed() and
drm_panel_bridge_remove(), which are enabled by DRM_PANEL_BRIDGE.

Leave the 'select DRM_PANEL' because it is needed for drm_panel_put() and
drm_panel_enable() which the driver uses.

Cc: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 73e13ad59a93..92938df3b747 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -351,6 +351,7 @@ config DRM_SOLOMON_SSD2825
 	select DRM_MIPI_DSI
 	select DRM_KMS_HELPER
 	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	help
 	  Say Y here if you want support for the Solomon SSD2825 RGB/DSI
 	  SPI bridge driver.

-- 
2.55.0


