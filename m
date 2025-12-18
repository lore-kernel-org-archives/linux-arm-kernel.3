Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11984D6ACF5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 13:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvZXLmPzwzhm6QvSDpXn8GzT07LgcYZ5zkWt2yi5Rr0=; b=be8mBeTNY/EgupL/phvZfmR8ji
	d4k7S/LlQ1b7IoqQPr5CcxP3qaMz+dAhqUZLkhO8c+HHki3sxYNUeYUDf+NvCH61L6Nad4ypXl4+Z
	ZQ+1jtb6pSluGD3g+ZPeFpcMx8I7T4VV8LlYfXdsV9avIqxEJy4KJ0fWJNCc6CLT4sF8y6MlvR14m
	d8vTrmby0XxEGkJ/yBqG7Gz1O/obxG3UIhcSRbQxbO+xSuWTJEPvQfFNgg7vMetWsvtKmEciJ17QZ
	kz8A6pPBS5fyZPYCtwUrGd+8/xu1VM3C32yvsXSppRH7tL8NG6Ug+AuEtf/vpdv3cuDImhgPH/Pt8
	nLfvUMDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE1u-00000008WSt-0KWa;
	Thu, 18 Dec 2025 13:26:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE1r-00000008WRU-1g3Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 13:26:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1766064409; x=1797600409;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=B5OMjTtB3KvSOSitHSwKvJyc6OwPvRdH+hvUZpIHPnI=;
  b=md+Bluqgd4RSBQL21oDQNsxmI+4JLP7/LbSkrfBuOxf0HvHUh8ZbvnkL
   OvGj7wOTkLfYDLdcfX/+dGcFFyyKyMGaoOEowjsKCSXB70zmQyp1ZMDQj
   3+uZ3/B5SvUjYy1wgHmLz0gMjT75RxMmdVW85A+OiGPukI2PNzSe+UeKk
   5UUTo4qD7yrKBpz1p52uaA+pnSoZniewR9kt+oXZfsoKMXTzQUU72RGsH
   trON/VC7G/gm3JFpmz9BTE/VNn+9Ct8FeZ9rEWn7oeH9lTGlRZnaPurNk
   /9VXIDLwtfleIn9+eDSBHog7Fn2y0ZeL/CPEtl8T6UbuQU/fSMRkOGf/f
   Q==;
X-CSE-ConnectionGUID: 2/lmXmCJRTiQR6o8m97H0g==
X-CSE-MsgGUID: vqkeqlxMSF27mt6zgOc2/w==
X-IronPort-AV: E=Sophos;i="6.21,158,1763449200"; 
   d="scan'208";a="218051099"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 06:26:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Thu, 18 Dec 2025 06:26:25 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Dec 2025 06:26:21 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Thu, 18 Dec 2025 14:26:01 +0100
Subject: [PATCH v2 3/8] drm/atmel-hlcdc: use drmm_simple_encoder_alloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-lcd_cleanup_mainline-v2-3-df837aba878f@microchip.com>
References: <20251218-lcd_cleanup_mainline-v2-0-df837aba878f@microchip.com>
In-Reply-To: <20251218-lcd_cleanup_mainline-v2-0-df837aba878f@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2109;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=B5OMjTtB3KvSOSitHSwKvJyc6OwPvRdH+hvUZpIHPnI=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpRADxmkT1ZVBs1iBWhVCsdRGhMAVx0EtZocCfg
 GPMEdN15hGJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaUQA8QAKCRA+OeYT93tk
 LdtsD/4tDMttbpQ8n+8yJUQph2yvedsFtEUcrui5cfdF8Fg62QRTSyAohKRNCHXQEGmt6cGJvrp
 LDaqprYJO3e5buwhYxZbdBKLVtCIrM6LY6Ty4gN2d1iuTUf+V2jbYKR2mgBAFa7AhP7MkfjN+OZ
 5qBv8s/+4XQdUXA7VspAo+rhaPiPSNnRbokBDKdOAsNhS9EYZEfO8UTpqWUHlgoUT3rYnBJVbUO
 aLZL3DB+kmArIA0Fxi2UzJFNWVNxGq+k8z8m7wLnDaqx35MUjz1JYf20D4BYVSnKvtToDUG/Q8a
 S+VjZ4ZpBbqg9PnRJKItPX5WZppiMH2NP06fNSYGB7yHdlertS1Uw15saLln8uXvFredbNwl/gI
 yBod30u9B7eiSp56VZ2sYnLla9dyy2GziW5oRdivyStQy3XoSlHStWWlsOkmCrA0ChJUlmiB5Rp
 PCFPsdXbZK7ZQHrsxPaCQT86/AjwhBRSergVMRJluxeYTpBJUXC8X+lB+bbjGPnD8ug5xconAQa
 mikuwhuJMETYPnb60qGLexmbez4GDqcluNoggkNv8NTLE1+IOVyIgBpTaQv92lW3dQeUe3FyIUY
 4WkaBVcEC7Ni9QSKzlHwon4Cy6q+ns78z9TSRduaUbQ+A3e7X3zpxZ/vKO9eZr1p1LUFqMgFw8W
 9QnnScHv2Z91OMA==
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_052651_537166_4BC824DA 
X-CRM114-Status: GOOD (  10.50  )
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

Simplify the code using drmm_simple_encoder_alloc to handle allocation
and initialization at once.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c | 27 ++++++++----------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
index 0b8a86afb0965ca3085dd5524983a0072199ec0b..1f43e0feeedae54321a17efc266654e72e8b9d8e 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
@@ -73,22 +73,19 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 	struct drm_bridge *bridge;
 	int ret;
 
-	ep = of_graph_get_endpoint_by_regs(dev->dev->of_node, 0, endpoint);
-	if (!ep)
-		return -ENODEV;
-
 	ret = drm_of_find_panel_or_bridge(dev->dev->of_node, 0, endpoint,
 					  &panel, &bridge);
-	if (ret) {
-		of_node_put(ep);
+	if (ret)
 		return ret;
-	}
 
-	output = devm_kzalloc(dev->dev, sizeof(*output), GFP_KERNEL);
-	if (!output) {
-		of_node_put(ep);
-		return -ENOMEM;
-	}
+	output = drmm_simple_encoder_alloc(dev, struct atmel_hlcdc_rgb_output,
+					   encoder, DRM_MODE_ENCODER_NONE);
+	if (IS_ERR(output))
+		return PTR_ERR(output);
+
+	ep = of_graph_get_endpoint_by_regs(dev->dev->of_node, 0, endpoint);
+	if (!ep)
+		return -ENODEV;
 
 	output->bus_fmt = atmel_hlcdc_of_bus_fmt(ep);
 	of_node_put(ep);
@@ -97,10 +94,6 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 		return -EINVAL;
 	}
 
-	ret = drm_simple_encoder_init(dev, &output->encoder,
-				      DRM_MODE_ENCODER_NONE);
-	if (ret)
-		return ret;
 
 	output->encoder.possible_crtcs = 0x1;
 
@@ -120,8 +113,6 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 			drm_panel_bridge_remove(bridge);
 	}
 
-	drm_encoder_cleanup(&output->encoder);
-
 	return ret;
 }
 

-- 
2.51.0


