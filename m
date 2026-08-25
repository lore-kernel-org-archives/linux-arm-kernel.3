Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DA9C61CE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 10:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2rOaW/QHVsj+NIJbAzRqpEoQI5WtPvnZxConc5MgFQ=; b=d0nuDlgs2r+xT/noSmRoYTLK00
	wvEDfYiv/wQ3yoAuKVKAtK8XEO1g8DxxLe/m6S/CE73seEjdMe+LpUEDLKntPdap5lQYB8jTUK8fQ
	rBpcIl43rRjwe8Cyq1hFetmcZBaoIgA8I8IGwsh9bX8Uj1XpPk2UHRemPUeKz1w+nJcjsGXR7y9oX
	1oYrQtNfAcDOV8wGUA0KlhrPFnvYFNvRy26NHyF4FLi4vfTgdvvt7/PkjhIkhfpOKOtKehsBR0g9Q
	8AmTq17eQ/a8YNZZRc+FxYbpkTS+Iwryx/NLZvH3e2iISIWavfPaDZF4E57yXNQ9bksQR2D2voEq7
	NJcZJOuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyo8U-00000000ZOK-0mpd;
	Tue, 25 Aug 2026 10:12:11 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyo8A-00000000Z7s-0lOr;
	Tue, 25 Aug 2026 10:11:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8DEBE1A1814;
	Tue, 25 Aug 2026 10:11:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6113E604C4;
	Tue, 25 Aug 2026 10:11:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 34DD811C7A3CA;
	Tue, 25 Aug 2026 12:11:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787652702; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W2rOaW/QHVsj+NIJbAzRqpEoQI5WtPvnZxConc5MgFQ=;
	b=gWkRSTPEqxoNDDdVfrYTLDAOJoHIL8z31zuV3NAhiN3JcfD2QVQ9INWWZ4alYfKUTydE4h
	hUtt7mXcd5e6emmf+sFRDuEPeFIuv5m6G0m4QNrJwzBDAdsbktGidYNqlaRSk4gqe4BbDS
	42sM6g2Ft2tSghdSE5gOgPkEuk/4Hflf7BYuZNbFpGfv0W+xpq55BeZjRR/uL7XbiQOJTO
	whXebnMFCFyUhtDHdAoiOY9YZZGxwFw14DncUL/Ua3BuH3p1aU1LU32JyVtr/IzJo7nLSf
	KYW3xtHJohfWAGil3QOqfAnKeKWPhDSD3187I1XrC4m/kGkVYTVdp7ROmgom4A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 25 Aug 2026 12:09:41 +0200
Subject: [PATCH v2 08/12] drm/bridge: parade-ps8640: select
 DRM_PANEL_BRIDGE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-drm-bridge-drm_panel-cleanup-v2-8-c6c88ba7ffd2@bootlin.com>
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
 Douglas Anderson <dianders@chromium.org>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Pin-yen Lin <treapking@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_031150_907324_D7D47420 
X-CRM114-Status: GOOD (  11.45  )
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

This driver uses the drm_panel_bridge API and not the drm_panel API so it
should select DRM_PANEL_BRIDGE and not DRM_PANEL.

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Jitao Shi <jitao.shi@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 8bb5612a0ff5..0f9ca869237b 100644
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


