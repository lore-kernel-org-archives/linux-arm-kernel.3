Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495ECCFC283
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 15:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Y4WpKj3gRG4tW2RqyBLT9qOG5Iptl1voIU03ws7UAs=; b=urtSIqSHPz0JbMRY7eXrULitQV
	TbU4dzws1rPkAlZjYACdkD4/5JIfF2wfCKCCV24iAy3EkJdN3rVZKVRlYYI1UGqm2rE2rgTEK39Vd
	A/VWez6FvdbptHYiJ+OqRtOQhBXLcbgRzgJWnDDOPfyuPr08ZQdMBYIZzRtNhNFcLiZQR1pIkzbIm
	rDTCMvpg2yTWfeXziQOkbQqWOHxalHcSdLqDPFQ38gdjwqvpEl0g4kpVj7h0H3+hcJbHMfeoa9CyM
	ZdPSRSH61EzsGOkHeIKI+6pG+1KTSi1TePRL/z3yV8GjE01/gjjFxpUEGH9RmVrlRtAjl8aVU6mUu
	p3ZoN39g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSiz-00000008ZaP-0xVJ;
	Fri, 21 Nov 2025 15:07:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSiw-00000008ZZ5-3PZF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 15:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763737618; x=1795273618;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=ykS7JdsTZDTvpcv0YzakxnBGh6GHP2mr6Lt81AtHCBs=;
  b=s7QGKQWdgnBlOIqAxZPB89AaBeuUQpMDTd0sh9/IbHwWuEv4bkLLs5zO
   DqUDlngMc16j91R727IzwxOsQKVxlZMIEdBb4hS2N+Bf53s0TBhJiS6Wg
   A8RfkZaXv5zJLzhmoOxhbCmYlYZw4cYtVOqnZIv/k4zh0D8qqdhVz6Mzt
   MKeQvyqcsxfh+a1c8L2OrzrwDvaoGUfACAwVMeq9tC+Layh0hXqAB8Ai+
   tcDQByQJMn4E3l6ZyExXuz5tJH3RR8uQTJpJ3QyPy7HWdPXnoEWPttRYU
   V+Ze4o09hUP54tyB+4I5qnWPsTFKQJiTulVE1IYMB5adZfCdIl9wwo0xD
   w==;
X-CSE-ConnectionGUID: ZsY1rJHWSEWAtJuR27K+Sw==
X-CSE-MsgGUID: qyzdrfUkTTWgu9IQmxnKWg==
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="280874262"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 08:06:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 21 Nov 2025 08:06:27 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 21 Nov 2025 08:06:22 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Fri, 21 Nov 2025 16:04:36 +0100
Subject: [PATCH 4/8] drm/atmel-hlcdc: use drm_crtc_mask()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251121-lcd_cleanup_mainline-v1-4-2587e6fe4d67@microchip.com>
References: <20251121-lcd_cleanup_mainline-v1-0-2587e6fe4d67@microchip.com>
In-Reply-To: <20251121-lcd_cleanup_mainline-v1-0-2587e6fe4d67@microchip.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ludovic Desroches
	<ludovic.desroches@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2760;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=ykS7JdsTZDTvpcv0YzakxnBGh6GHP2mr6Lt81AtHCBs=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpIH/Wto7t+cwIKFwcL7ixOr20oYrI6fqOiPoVu
 hN4ZiWNMryJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaSB/1gAKCRA+OeYT93tk
 LQKYD/0Wg6ViuiiaWT23b0Hu883goIyW2Gn2x0x+1Dbik+Sw5Ju7GaRkAsC2ZGwi35vbCuj/Y+b
 RJ3G65JYSs5Bdrtgtj/brCoJUwJrnOUx6QcNi1kyxqyPhekrsOOoKTTzGCo+6gRPE/AcmNRMXzZ
 rFqZZWw8JyGy6OLXHFEeAMNvli4SYn0XzHaxo+Freu1EbAj+yXIaHdzsjdG2BEU0NgLpizS5umz
 ZHLK8Y+qPROPLEZcTvxvTAkVulpmj2px6wZxq7vbsbhj4nw2Im0F4Y7QC37dH4UPWtJcEKZgAJH
 NJMLd9N+EyhLvRRLeGsjBZQZjXNwJtVxiL1bQ3hT6jcMPO9gQGGcFpZW8FaDjCEibkNyN7i49fl
 g47nNF03rR8ZYrzAFkqGHc/8XTpRfFKtvk5qkeQum4nJkw65uu51pkeBbuwq7x2z3aBq0SP7lT1
 3UXRtlZVs0E5crWpx1VnSGSAXFU1EMDbQaclf2rBeals+C2qeetefpZZp3grlKXf4MwrFMZ5EPd
 tDwH5QovWi1s2FDDoluJBdaSc05LZld463pgXp/84hxcIAhbixgXj/cp20RlQriz+UnUS5Vue4J
 FEx+wagocUitMBoZQITlYWcgSwJX+ZahZOsHyT5RJVgMT9ejTKB7QsVCCwU7b3JQVDoywcfP1RP
 4w3cnpifpsBw0XQ==
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_070658_864085_B2218C81 
X-CRM114-Status: GOOD (  12.94  )
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

Prefer using the drm_crtc_mask() helper instead of a raw value. It
involves reordering components initialization as we need a valid crtc.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c     | 12 ++++++------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c |  4 +++-
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index 8ff582a394794aacf84f9e23fd59f123445926a3..d1f5451ebfeaf81c382b49d0c1a6c3c32e44866b 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -723,12 +723,6 @@ static int atmel_hlcdc_dc_modeset_init(struct drm_device *dev)
 
 	drm_mode_config_init(dev);
 
-	ret = atmel_hlcdc_create_outputs(dev);
-	if (ret) {
-		drm_err(dev, "failed to create HLCDC outputs: %d\n", ret);
-		return ret;
-	}
-
 	ret = atmel_hlcdc_create_planes(dev);
 	if (ret) {
 		drm_err(dev, "failed to create planes: %d\n", ret);
@@ -741,6 +735,12 @@ static int atmel_hlcdc_dc_modeset_init(struct drm_device *dev)
 		return ret;
 	}
 
+	ret = atmel_hlcdc_create_outputs(dev);
+	if (ret) {
+		drm_err(dev, "failed to create HLCDC outputs: %d\n", ret);
+		return ret;
+	}
+
 	dev->mode_config.min_width = dc->desc->min_width;
 	dev->mode_config.min_height = dc->desc->min_height;
 	dev->mode_config.max_width = dc->desc->max_width;
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
index 1f43e0feeedae54321a17efc266654e72e8b9d8e..e582315f70a119f2b39057ff112bc427117b85f5 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
@@ -71,6 +71,8 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 	struct device_node *ep;
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
+	struct atmel_hlcdc_dc *dc = dev->dev_private;
+	struct drm_crtc *crtc = dc->crtc;
 	int ret;
 
 	ret = drm_of_find_panel_or_bridge(dev->dev->of_node, 0, endpoint,
@@ -95,7 +97,6 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 	}
 
 
-	output->encoder.possible_crtcs = 0x1;
 
 	if (panel) {
 		bridge = drm_panel_bridge_add_typed(panel,
@@ -103,6 +104,7 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 		if (IS_ERR(bridge))
 			return PTR_ERR(bridge);
 	}
+	output->encoder.possible_crtcs = drm_crtc_mask(crtc);
 
 	if (bridge) {
 		ret = drm_bridge_attach(&output->encoder, bridge, NULL, 0);

-- 
2.51.0


