Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B188C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLrtm4PjnIPMZjGOBkD2GjpIeV2schSUM6vZ//r0E74=; b=MZUAiXO0KgrA8e5mDpYvLLAO4J
	ToDshh2Od+VDXGOoW1WiKIR5HTBxsspOFqE9jyfcgCnpOHXkmM/PwEfOVv/n6/IVl0yobLumI/Cwo
	5XdEgce1RgxmkPVtM8Tt4fhrPXbGzcvjp5V5XoO4iybQtH0hgEzFhyrTbJpjHjKJvzUetEJCDqrfV
	dl3uyLneTqicg6ERWVgKAFGLGupBlWinyHqP0tVOYVcNJjwAMzmZySuiVYa1E749R7RyxsgHvZ2lL
	B0nfpPxxw3aHBBFmFVHirXvD8yjusMCf/xChxLhlZeq99Ds515JJmbnDdYufvlnCwSBoc2P9nn+RG
	LDJ+AxsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14fV-0000000A0ju-34LF;
	Mon, 31 Aug 2026 16:15:33 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14f9-0000000A0RC-2vqg;
	Mon, 31 Aug 2026 16:15:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0C7814E4147F;
	Mon, 31 Aug 2026 16:15:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D151360231;
	Mon, 31 Aug 2026 16:15:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86CCF11C7922B;
	Mon, 31 Aug 2026 18:15:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788192907; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QLrtm4PjnIPMZjGOBkD2GjpIeV2schSUM6vZ//r0E74=;
	b=Ej6u9ZW9pubc1ChmjbF1r7gwKgdbCx8SMZe+c9nMLnjyROr8ln2hFeT8KSNWRnyaGIeCuF
	hZcu6UjYnhuk63QAB87l4NRBR6LQLOSoLTdOl32t2npOxnMxKkDG1bmbYmbr+HtBXJe+/+
	2SfVffkTEXLY/dM10s69O7aEImdOsUASybouxPzMUE03CO9jJHjM45FZ99uR3f1U7ZMoDJ
	fQHl/WJxsX5VDPonJsdgVNtLGKORGy9iBOv8yqC/lJec4mRdIiVU7DzlMHLHNMJqZIE42d
	/u+MF0gIbk8HKkp8asbNBls6CpIq10blHXkB9t303KwMfqKhoRsH2slyNtNxnw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 31 Aug 2026 18:13:39 +0200
Subject: [PATCH v3 13/13] drm/bridge: tc358764: select DRM_PANEL_BRIDGE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-drm-bridge-drm_panel-cleanup-v3-13-50efd8168b3e@bootlin.com>
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
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>, 
 sashiko-bot@kernel.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_091511_912216_5B6507C2 
X-CRM114-Status: UNSURE (   8.91  )
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


