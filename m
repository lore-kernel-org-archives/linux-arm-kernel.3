Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4E3D41D6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 16:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbFKHDA9ilsRQlYUtfK7Ah6utAJCbFFt32uKWdhEdas=; b=lTvfXGmAwLoIlOBJEVPoVKTBG0
	MSKxnuA4WyRAEWCDw1uWxnZJW5BJL3fsEsPJ2yyBldCQc0Ra4xTkXe0wueCKHHwqtb5slXHs4ak/k
	5sqFZsLFuVFUJPsXti4hGzWRx4k6EFLzbTm/JTtTqfJ0VooZRYzksvcPvwLtWnblp9tLMtEZ4AHk8
	1X/Rlr6VJlWsCpnoF2UL5Z/b8x1qd2UE+uvHI/EgEsJB91Ng7mt2zvMtEH2l9nWsKCCcOjWe/CiqH
	UfGsdE9jK4cMSGtSdHwjynTC2uGp+MU3OPPHMnDBqGKClbmWfXVzU8cm8cxGr564YNkbLl4vcAGoQ
	xvKwGTVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjiP-0000000GxmL-1DHV;
	Thu, 11 Dec 2025 16:40:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjiN-0000000GxjI-2wp8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 11 Dec 2025 16:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZbFKHDA9ilsRQlYUtfK7Ah6utAJCbFFt32uKWdhEdas=; b=TntQqC5+qQ2ld+wMtygZ2DoV2S
	WwpzPhNs2iCJ8nAKyg8Z8fCBuWAR3AMDMxREoMxC2t9b+yPzVcpMWjvhjszxgx1QzSqWW5U495Iy0
	/gsZotwPISb9yzpC8bpZN6YHdgTqHrNVRH3VqEXp5ezu2brX+Le90Z+GLahVwIvBl43Z2zu3XpI5R
	WC1+OslIXwvtzMhNO0PyeqKWt9LZY0fehG7KkiCP6tyKyQA3RE/xE7Yg3D3gCovpRMBtORFeYtkWW
	Voxffs8zGL9XZHPrjs78Tw47VPIHOJe4+Zr+QmcgxbOe3g3D28lIbLvPP8yV0ki5LhWeTobfp/fd5
	n5wX4Vmg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTiqp-0000000FFUS-2g99
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 15:45:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8A7FCC1934E;
	Thu, 11 Dec 2025 16:39:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41A7E6073D;
	Thu, 11 Dec 2025 16:40:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27F5F103C8C93;
	Thu, 11 Dec 2025 17:40:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765471209; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZbFKHDA9ilsRQlYUtfK7Ah6utAJCbFFt32uKWdhEdas=;
	b=kEgeC7Rcrz0mOrPuvi5bxQLqzlAd+z3b5oe2YGxD8b4jaPoowOZkpcvSZGC4u/rBuFVN3y
	pE0L+419ivAm9r1unh/zR+CuweBwiSGttrwi0Y04IxERdOOaghAF1DLdjefOHblBBzQE4c
	JrK1j5VLvGF6TaiD9xa92HHaIoxG8tMff4ZMqt97IwHpsVve9iZEGxRYAd3oWJ+upXbSsv
	KsJdNDhLI2xktDX+GklGX4ekzOF2wDUF/g8W1NCIM6/5a4260RDTttmA2YSk4BTH1UE9w5
	TUuMMqNkN/+XXQHtMfuZfEPi6f3NLTbX7gwdkKA7AcZO3ZvdnIW89sZWFeKgkw==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Thu, 11 Dec 2025 17:38:54 +0100
Subject: [PATCH v2 10/20] drm/tilcdc: Remove unused encoder and connector
 tracking arrays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-feature_tilcdc-v2-10-f48bac3cd33e@bootlin.com>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_154507_742683_345A0FAE 
X-CRM114-Status: GOOD (  11.88  )
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

The num_encoders/encoders and num_connectors/connectors arrays in
tilcdc_drm_private are never populated or used by the driver.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 3 +--
 drivers/gpu/drm/tilcdc/tilcdc_drv.h | 6 ------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index d2aae731b72c6..a753cc47a59d7 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -348,8 +348,7 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 	if (ret)
 		goto unregister_cpufreq_notif;
 
-	if (!priv->external_connector &&
-	    ((priv->num_encoders == 0) || (priv->num_connectors == 0))) {
+	if (!priv->external_connector) {
 		dev_err(dev, "no encoders/connectors found\n");
 		ret = -EPROBE_DEFER;
 		goto unregister_cpufreq_notif;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index 181b9d7a515b6..717529a331009 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -75,12 +75,6 @@ struct tilcdc_drm_private {
 
 	struct drm_crtc *crtc;
 
-	unsigned int num_encoders;
-	struct drm_encoder *encoders[8];
-
-	unsigned int num_connectors;
-	struct drm_connector *connectors[8];
-
 	struct drm_encoder *external_encoder;
 	struct drm_connector *external_connector;
 

-- 
2.43.0


