Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93318C61DB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 10:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJuqSrwY1ArsfRalmYHF7ZBMJ/yzPizQVtJFPcCggqQ=; b=aBM5XqQvxfXXIBhHGq811bunpN
	1DvJ781ctHHlnt2YdCC/NrHkDUAsF2wzWee0lG9fjLRWbEs7emFEvi/s96+ApwWj9kl8GBDz+vEqi
	Y/dYNKDV6HmETl4tT27o7QUzZ+MLvI2bqaLAMTEXrhZV74xCTatlTsdMP5pnD4d4g5jb0/zVa7uIo
	XCoWPVUTRDtjKZUaV8ucwylAOuqMOehGH0N6MMxxYq8KspPnVMo0FG4ORfksf0tgjUBNacz5HvOAa
	AtQg9ydpgqhRFP9iYr56vw2YocRP/AMMkWBhR9cRh0icsRn/T23eVHprLfyk3bR7coKUCeQFncy03
	ZaFFcEyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyo8a-00000000ZRA-1vSh;
	Tue, 25 Aug 2026 10:12:12 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyo8I-00000000ZDq-2nQH;
	Tue, 25 Aug 2026 10:11:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 026D64E412E9;
	Tue, 25 Aug 2026 10:11:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8822604C4;
	Tue, 25 Aug 2026 10:11:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 117D911C7A3CF;
	Tue, 25 Aug 2026 12:11:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787652711; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uJuqSrwY1ArsfRalmYHF7ZBMJ/yzPizQVtJFPcCggqQ=;
	b=NB5JlrLsJmFWrvk7Wz2CJUwcp2zjxVhQmEv56RWczgZp/+bGypqR9o8DhWmCBpZLEVcuYv
	oeKxodM9fCOKi2XFgObzDxLQaGzb8Qfmehx+3cgCO/Csf4xe/+rYVlxldBZhA4HVqXI0fR
	xFQ2oWY2kGYhheK9Ps29471eTtVlmoZc11w4ACTIz+Cn2OEFCrORwrRyVpcr2WCGxtqjLp
	AyRS6sqK+6656OIM/YUarjBpolj4eMzulrJcIX3auFW1d0KQCIcGVs/l/7WXu0f7LhJMNn
	7DtueAs4/w2TOcJY+HfLxCvvY0Vp9E9Sg50YiEVe53L7IHF5xyWDW2hiuiNwhA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 25 Aug 2026 12:09:42 +0200
Subject: [PATCH v2 09/12] drm/bridge: tc358775: select DRM_PANEL_BRIDGE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-drm-bridge-drm_panel-cleanup-v2-9-c6c88ba7ffd2@bootlin.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Tony Lindgren <tony@atomide.com>, 
 Michael Walle <mwalle@kernel.org>, Vinay Simha BN <simhavcs@gmail.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_031155_462727_C7CDED17 
X-CRM114-Status: GOOD (  10.91  )
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

Cc: Tony Lindgren <tony@atomide.com>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Vinay Simha BN <simhavcs@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 0f9ca869237b..7874d3b1e760 100644
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


