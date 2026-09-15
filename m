Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E844C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLrtm4PjnIPMZjGOBkD2GjpIeV2schSUM6vZ//r0E74=; b=G2w+f2X9p+hZtdWI47ZJs4rk2U
	Ou8T6kTCHosGG7areKtCiN06pbySpVB5Ym5kBLZBTRqdIo4zdr4EDwxeiChbmjnHWLNT2DrUiSMtw
	j1hLdsM/WSCigwrDe3Dx1l6TjFRjsvINIcST+Hz3FzUZLPToWdWaqzzOyu0ggL6GCg1hwQ2xSYYTn
	T00r6+4sjVK0KtEQeT6hSzeOZWDvjqamMrsdFvGgaHMLTLG6vz4ebruMInPL3NfzyG6mH6BqKNRpK
	EOVYfymqPCP/fLHxLQ/eJ6QW5zJyGiDQd23ljzTgCtuIahEOsyKXa6f/ZDb8oC1ndWMbpbR5Z6yW/
	jK0jqcJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WJz-00000007TpJ-19AP;
	Tue, 15 Sep 2026 16:47:51 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WJc-00000007TUJ-3OIT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:47:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F01BEC5CD55;
	Tue, 15 Sep 2026 16:48:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F22C602B0;
	Tue, 15 Sep 2026 16:47:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D673511C7B00C;
	Tue, 15 Sep 2026 18:47:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789490845; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QLrtm4PjnIPMZjGOBkD2GjpIeV2schSUM6vZ//r0E74=;
	b=QlR7xGA0SR7IFusFax4e3FDV6qmFQu+PNxp9X+RgTz1BMOlzesuWy/vD3YQQjrlDJz2daJ
	O+GfFpbKaFxVPD/oshrRI3u6ZU+EgqQDFuC8eoPGrg/kaax80yACZ/IiQAJQXqMfaUEonI
	kuN1pO3igr3PgYb8l03Le1Hoc52apF5xRYCRd6WNQPAiHLHNHFPQpnXDEavmV2F0zCLhls
	xF1bKKa1zURCwTrq5dxWnZY9BEYu2lKYbgCB8lu0FjzGOb0jc1z4Fjxe0jDioMBxWv78vR
	sA3S0+/vIXQodNlwk0TIfos/TQTyPqW536rMXK+eWw0vC0a0pbsJoPtd+5jSxw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 15 Sep 2026 18:46:22 +0200
Subject: [PATCH v4 9/9] drm/bridge: tc358764: select DRM_PANEL_BRIDGE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-drm-bridge-drm_panel-cleanup-v4-9-30401d9406f3@bootlin.com>
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
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>, 
 sashiko-bot@kernel.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_094729_008699_26518CEE 
X-CRM114-Status: UNSURE (   9.40  )
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

This driver uses devm_drm_of_get_bridge(), which is enabled by
DRM_PANEL_BRIDGE.

Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Suggested-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/all/20260825103234.3F2B71F000E9@smtp.kernel.org/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch is new in v3.
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 92938df3b747..f2db7f60d40f 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -389,6 +389,7 @@ config DRM_TOSHIBA_TC358764
 	depends on OF
 	select DRM_MIPI_DSI
 	select DRM_KMS_HELPER
+	select DRM_PANEL_BRIDGE
 	help
 	  Toshiba TC358764 DSI/LVDS bridge driver.
 

-- 
2.55.0


