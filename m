Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E9AC61DB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 10:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6qYirW4OpCupRe2MIN2vR3wasf7rSJNvi+d3ii1Uuc=; b=BawuE5Qy7BrOlAen9ZOyhDxQIA
	cmQMJXmSRIauEKTjgReL1/1mLgf4rHaqv//uFx6tCubITIDRVfkcFViiS+Qn60axFDkE9gK7BpB2/
	ae7qhRX9HQJBxjvbjJlfG3A0KfdLTfFTJsKC4HcH/2a5fm5zXDWc4JrmQ4m+gOG7pzd6APrxjwL5g
	huMn/Li5wbjDRBi6IDcgIAeBu/LShdOIRQ/PT/gjTJ7l7XRfLhxoSKPkauUHLdaKvPSmywQDs+WeX
	vFBMXkFfZl+AY/ClKUhlgl/2DuewguAdHoqCC2nqy9SU0a88R0gWQm/xky2IbkkQM8+xovHRuoWtr
	197hC6VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyo8F-00000000ZBE-2RoE;
	Tue, 25 Aug 2026 10:11:51 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyo7u-00000000Yub-0yYe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 10:11:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B6EC84E412E9;
	Tue, 25 Aug 2026 10:11:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8435B604C4;
	Tue, 25 Aug 2026 10:11:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD0F611C7A3CB;
	Tue, 25 Aug 2026 12:11:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787652687; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W6qYirW4OpCupRe2MIN2vR3wasf7rSJNvi+d3ii1Uuc=;
	b=giNYbvW+K78s1DeEkGjAwXy4y3l1DYVoSjBN6vBeYLg1Eb1PHWyfTBrJBBw2r2SagqRIfO
	7tVF4syVSTfM8jn2pr/u7btyom/zhMXcDyPxNokGgaEN2ns1ZhGYR7gz/rwpKOKCQWktZO
	o24Ct3t4BSOTVYB/EzxQPDe4O8JWcXEDrirXfVg1Im+D6JVvsTMQE1I390zEXVFs3P0i5q
	rKnU3VdKqdr25t2zdjo3bxZSO007xJ/DG68MJujRCX81K2znIB/6eFzuthZtcitRRDYr87
	T6br/9lfQKuBVzE962VP9OOspHTTer50Ctr4EpQhzN4J1cqbW9BTK9wtgyDu9g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 25 Aug 2026 12:09:39 +0200
Subject: [PATCH v2 06/12] drm/bridge: nxp-ptn3460: select DRM_PANEL_BRIDGE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-drm-bridge-drm_panel-cleanup-v2-6-c6c88ba7ffd2@bootlin.com>
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
 Sean Paul <seanpaul@chromium.org>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_031130_453762_FB80AF26 
X-CRM114-Status: GOOD (  10.67  )
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

Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 03f52dcbba6f..e59b6689ced3 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -259,7 +259,7 @@ config DRM_NXP_PTN3460
 	tristate "NXP PTN3460 DP/LVDS bridge"
 	depends on OF
 	select DRM_KMS_HELPER
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	help
 	  NXP PTN3460 eDP-LVDS bridge chip driver.
 

-- 
2.55.0


