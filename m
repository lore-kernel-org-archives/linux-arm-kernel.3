Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC3BC624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xp2N0cOy+TiY59aqZ4rVGkxXownNoIYqVRPjYS4Hsao=; b=oTADlfY03ow67mssP/1s0AnAb7
	DBKQfO6DIqx1Nu8L4d+/kZ6mVJB0E9SBUxut39cLD3IQ7O5kkBgV8DLXNKzhz01cDTucAK72KjWAF
	+XDEl5dcXTWIvmOB9q2FFeT5yiI1HsU2odIuzQufuUqoPktIzMMFHdg7vSLHqdqkUhMtSLHhOVciq
	edWjqh8Ov2BU3pdr/7zPplmLNGy6xaUQmO6x9xLw7t5IPAVhjHrkLWHmiRsEbkaOqpI/D63rkWGQq
	gfO4WPwUg+ExMpQwErgz0EsyWdPLrybS90XKE5dcZM/Em8ZmpmwpntgJSHRU8vZx+LXmJjETyzeCC
	BhiQkJag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14er-0000000A09O-3DNI;
	Mon, 31 Aug 2026 16:14:53 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14ec-00000009zpq-1DJH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 16:14:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BAA8B4E41480;
	Mon, 31 Aug 2026 16:14:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8DD9560231;
	Mon, 31 Aug 2026 16:14:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 727E811C78AC8;
	Mon, 31 Aug 2026 18:14:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788192875; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xp2N0cOy+TiY59aqZ4rVGkxXownNoIYqVRPjYS4Hsao=;
	b=U3boEL05ounHVaCMa0GrNo8HA6zb0PrE9z/ua4r5uSz1VY5qP4yvinh4PmgV6XDjM8FXXI
	nfRsl3BGvJF81sQooGiYqhzfjhmocE4Y5OPVDksLaAtk9gvOaacmKpt6EHSNb9Gz5tDFjQ
	6oZ5LGp1ehm2vCgv/jMYU5DmD+yH309um7m8qtO4l1YC5SbmvrdnKII5J55ZgVtv8tLvIo
	aN7iv9R/VkAF8HGk0LLrEqct/7r4yyK2/v59UsEiMamUT0eMfVSQ8auYA4VqRQAppPFVBp
	n5ILacANZlsQcOm9wZflr1dYap22Bg0iQ2kxYQ2uJNLIFWY2w4be9NXIiQO6Rg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 31 Aug 2026 18:13:34 +0200
Subject: [PATCH v3 08/13] drm/bridge: parade-ps8640: select
 DRM_PANEL_BRIDGE, not DRM_PANEL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-drm-bridge-drm_panel-cleanup-v3-8-50efd8168b3e@bootlin.com>
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
 Douglas Anderson <dianders@chromium.org>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Pin-yen Lin <treapking@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_091438_549543_EF369E90 
X-CRM114-Status: GOOD (  11.52  )
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

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Jitao Shi <jitao.shi@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 85a9bd53001c..65f4d9d9b67d 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -290,7 +290,7 @@ config DRM_PARADE_PS8640
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	help
 	  Choose this option if you have PS8640 for display
 	  The PS8640 is a high-performance and low-power

-- 
2.55.0


