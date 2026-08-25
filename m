Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71075C61DB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L47f4WHA0oklyqWY/79F9ARDY2+1ZW1V7S/l3+FjfBE=; b=xMhP1hwJnmgQ9dwN/bGKaSYMog
	as9muXiwSM6ipGIfqf+qZH2ngj7poO8PXbF8S0nL8KcXlQ8EK74U+DPOE8aZXfXK8pTDAwYe2ZA5P
	3maslgEjuozdMqZgCEbfNuQTxzrsynXHx5HoJJN84ZY6KYJuO8panPbwGVuVuxzgTGj3SKZH6mhjl
	JTjttuCaSWUNhjpcDs4gW+oIad6RR4/P7dLE6be26wmq2CYart3cRJ7yoSeZYnk2gRuxdll/f5bEo
	JbJjR7LcDbWBhL2u3iHEE1RYRSU0EV40B59a8EIzhApKrIHzSA4mSLzizGWChnLMO4vvBP9Jw1fLb
	jP5HnK9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyo77-00000000YTj-1VZZ;
	Tue, 25 Aug 2026 10:10:41 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyo74-00000000YSQ-1D5U;
	Tue, 25 Aug 2026 10:10:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ACB8B1A1813;
	Tue, 25 Aug 2026 10:10:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8047A604C4;
	Tue, 25 Aug 2026 10:10:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5087F11C7A3C5;
	Tue, 25 Aug 2026 12:10:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787652635; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=L47f4WHA0oklyqWY/79F9ARDY2+1ZW1V7S/l3+FjfBE=;
	b=c/hVuDAI0Vg2hS48ZzrR2d+54YEZ6GoNhoD/QoV5wRrd6xTKtzDqZZBrt05s3+npjGISzu
	A6Ibcx3HCXrIvUT3hCHz73P8a42jZC33OtgaOldeatn37ssS58xvzD9DVQd3iZy/h/JENC
	pGLSQAfLpAQaXhALIWvx5Zkr5GRnL6Ls5UfROTfCdlFTYl6azZO8dz9yqhc3iE2ROkQ5tG
	Zw4eRrGlWC6vdGlJIGeKE04Cg+wXbR+IGNdjVEJYSw6cFkMd+/hq312YCfZTY023C7RW/3
	xKEGjA0tI1Hf9Gb+shs2z+cT/8XlT+PVaTDXR6MxvTdLEKKnBWb2kn8kLCUWjw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 25 Aug 2026 12:09:34 +0200
Subject: [PATCH v2 01/12] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw:
 don't select unused DRM_PANEL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-drm-bridge-drm_panel-cleanup-v2-1-c6c88ba7ffd2@bootlin.com>
References: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com>
In-Reply-To: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com>
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
 Peter Senna Tschudin <peter.senna@gmail.com>, 
 Martyn Welch <martyn.welch@collabora.co.uk>, Andy Yan <andyshrk@163.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_031038_478798_FDDA66CC 
X-CRM114-Status: GOOD (  10.01  )
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

Cc: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Andy Yan <andyshrk@163.com>
Reviewed-by: Ian Ray <ian.ray@gehealthcare.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 4a57d49b4c6d..a999e57d0cc1 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -225,7 +225,6 @@ config DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW
 	tristate "MegaChips stdp4028-ge-b850v3-fw and stdp2690-ge-b850v3-fw"
 	depends on OF
 	select DRM_KMS_HELPER
-	select DRM_PANEL
 	help
 	  This is a driver for the display bridges of
 	  GE B850v3 that convert dual channel LVDS

-- 
2.55.0


