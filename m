Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBD5C88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asHhcWK0Xqz3or0oLNmGpjADbooqi5HN3ZH3Pieglwc=; b=k0CAKrXKvve615WQrljOHkTlIc
	Ggb/dJ4GPtpJlQYph1F91KmuKxfTyntyV+ftEeXQjysKF632Ytl6FaKzC5pT4ZY8sijvawP4DKFK6
	mimuUgvacJD8dPTiMGukRoIT4HopRRRtPSpdUekJKbqFIB/VnF6X9SGm2U2+HLl3NuymRxCQpFR0C
	POgP/YrSc+LjiL9rm3+LLg5ClGPLfxpsHD6ZfAiEsLZdKHyb5AY7Oeqto5Lc6vpuslkQwDW9T9738
	+dM9KVW5Ko3xalFw8Zc2FWOja4VAdCjL/4Q4wOT3x3JiqUT+j3g3l9vaqaxxa0p5DsEzZNjP1Gq41
	miZg6/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WJz-00000007Tp2-0k94;
	Tue, 15 Sep 2026 16:47:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WJU-00000007TLZ-3ZIw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:47:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5DAA71A0815;
	Tue, 15 Sep 2026 16:47:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 312E0602B0;
	Tue, 15 Sep 2026 16:47:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3F1D11C7B005;
	Tue, 15 Sep 2026 18:47:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789490837; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=asHhcWK0Xqz3or0oLNmGpjADbooqi5HN3ZH3Pieglwc=;
	b=hme8c/ZZPHmsKAAS8YXw1tajbiCNNs97s4J3lTJs0tWwLrXp6YIx/1M2ISQPqHvDygLNY7
	ogYzCpgbOUoAsY7TNdQWujBHAOn3wZzO+cHxQ971PmB0tmihRxqboQmvgbvUOQekykEVbx
	s3WT/8h0Zl1F5wrp63HuWI9jL6F3QAU4zCbTeLGGiF0ZMvj+xVE3idbIeowrCfYyJVrRbG
	H/3XA5ASC3PVkA4+b94dUr81YbD7/xhQOPPYcEzpwsNR9cvhb1bRbsS8fjdmeBtWrC2TFI
	5JGMNdbkyBnB0aHEpAnUITdjNLaUBdR+ODPH2nNXlGQWrb3rnJ5asUActHzmQg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 15 Sep 2026 18:46:20 +0200
Subject: [PATCH v4 7/9] drm/bridge: tc358768: select DRM_PANEL_BRIDGE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-drm-bridge-drm_panel-cleanup-v4-7-30401d9406f3@bootlin.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_094721_047430_88E9C5B5 
X-CRM114-Status: UNSURE (   8.39  )
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

Leave the 'select DRM_PANEL' because it is needed for drm_panel_put() which
the driver uses.

Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index a4bc1b5401c0..73e13ad59a93 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -410,6 +410,7 @@ config DRM_TOSHIBA_TC358768
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	select DRM_MIPI_DSI
 	select VIDEOMODE_HELPERS
 	help

-- 
2.55.0


