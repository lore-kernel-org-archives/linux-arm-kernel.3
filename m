Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CA5D6ACF5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 13:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=goplYJ31MJta2agakikc4AbJPDWhZtFNJoq8MKPkDOI=; b=x4QSXeYHK5NvtsQZ9Ca2ek2VqW
	mc8aGh7Ph2byHckR/MnTzqahy1Gs3n9C9A2bvEo5Q2uMEzz5G48akZzSBWvjoXRujiN6wDjsG5nFO
	2RGaNHewFPkU3ND1H7GHjy64jMNWeny4N4DbqbCID68pXY4fq0Md9zFPUOT6GjqNPXNzioF8cfBvI
	drTFaqTMaQeSw17sXXrYovDQoKZ3UuroGFTz4IkDRAAEJHnjEMMw6qfb8/WdV8ieFN37/dhDQx6/7
	jqXJYRE82JKGsgAYBu2KV+R72YoMQpERJw859zQzUeb8iAVQr9VQtV1XE1G40RFXew3MsKV9hdtF0
	XG4rTU6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE2I-00000008WjM-09uu;
	Thu, 18 Dec 2025 13:27:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE20-00000008WVY-3EQB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 13:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1766064419; x=1797600419;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=aemOi5IutzwP6lzpzpNVxlpvX5r89JXmAras5OUfufs=;
  b=AJJ1sttmcdSSm1gJK01cT28xRD2TWWr0fbfYf/85L5pIAYWLg0JsH+QV
   oPElGMPWRgv/5TBnXjFk1YuGjclNw91qtbXeyGWv28XcCctNopPugxAL5
   oct1xz6WXZfQunINo/3d7HUYJHa9f8Gbar5QrWvZ63KPjjYeyJDA/+QmH
   eCUQzYxJowpe06pzcMQv6e9NP4s1xjxfpY1nibm4bbu0pnsXHa5GBTZbJ
   jeSdmd/PUJUhnKED9oMWazDjT87othzuUDM7OUvulYcKvQ7s9kBV9nZhT
   n120pmVBLyl7Vw15JbAW0c0JyzjlkRcV5H1uSl0Bkid3qV2gKOnsMxVjD
   g==;
X-CSE-ConnectionGUID: Lg3y3LbkSzGyFPXGFP98mg==
X-CSE-MsgGUID: z7LVbWcKRm2KQ7t1eMjcjw==
X-IronPort-AV: E=Sophos;i="6.21,158,1763449200"; 
   d="scan'208";a="50046772"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Dec 2025 06:26:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Dec 2025 06:26:17 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Dec 2025 06:26:13 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Thu, 18 Dec 2025 14:25:59 +0100
Subject: [PATCH v2 1/8] drm/atmel-hlcdc: use managed device resources for
 the display controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-lcd_cleanup_mainline-v2-1-df837aba878f@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3275;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=aemOi5IutzwP6lzpzpNVxlpvX5r89JXmAras5OUfufs=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpRADxD2mOmOLcjoZAScPDgMH8yZoRCwCc2wQIF
 FtOI+W/6tCJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaUQA8QAKCRA+OeYT93tk
 LZrpEADFqpD68JK3n2UfJP7k1dEld/VBlI+1Bn7f+42+131qcXhnOWUS+4Y1up634zqkGi3x+Wf
 LfUyx88Nv4DCo83OzztNsUFJf2oUAiY2UHKCf/OqreAKwHM2VbIuWeZL2YeUVirQmGRshkKSTUW
 Vw2gmP4HhCrr9w+gcqD4HmSz9FrqwKZFj+H1CSCaYIksbOiVccKVIBowv2nic8HpaZ16VGMU02Q
 WBIyGzK3iNNmBnW+eNEkHgmeq/RCEyPHcQuI9GnRjpaIzT7J2nYylI/puSLECaUhq6cqS1zoGi2
 Ikx4LqvxvJ1GsBG9HSil/hiZWGXbPeiFWxV+ec2em7MSpAl/X5JTtSSk1izNglqIKPv7tDQn7ok
 yCs/hCRMf1lgzrAkqEpSYfnAON0fcyG533u2+CRzjnPM56+5O+lmgqXI24y4Y0STWVfMm11XB/b
 lxoPmVsaC3giqPyFkl/rs2ZYV/bULyZwpl5y8iW4tikEcKepG/cOjHoMcOgVyhSzMapYxHnLu73
 krr/pBcAy6fLoEtbjF/Su3IKTWPje+rI728Uhe3edxXCdya9TpQRMjJhi5lZ5EUPS207eXUr5J7
 PADkseHx+SeN6YC1p+1lAwOgy4ey9vCOzmiVOBsB0pwDH4EamuzXoPnDOT1raP3vEBxFHyybcok
 S+kisep92P2Y1AQ==
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_052701_876886_DD93F011 
X-CRM114-Status: GOOD (  15.22  )
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

Take benefit of managed device resources to reduce the risk of memory
leak and to simplify error paths.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 25 ++++++++++++-------------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h |  1 +
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index dd70894c8f38e7303e06167594ac289cb345b510..8ed029381c555db10d596efc8d52753c47767633 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -751,11 +751,16 @@ static int atmel_hlcdc_dc_modeset_init(struct drm_device *dev)
 	return 0;
 }
 
+static struct atmel_hlcdc_dc *atmel_hlcdc_dc_of_dev(struct drm_device *dev)
+{
+	return container_of(dev, struct atmel_hlcdc_dc, dev);
+}
+
 static int atmel_hlcdc_dc_load(struct drm_device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev->dev);
 	const struct of_device_id *match;
-	struct atmel_hlcdc_dc *dc;
+	struct atmel_hlcdc_dc *dc = atmel_hlcdc_dc_of_dev(dev);
 	int ret;
 
 	match = of_match_node(atmel_hlcdc_of_match, dev->dev->parent->of_node);
@@ -769,10 +774,6 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
 		return -EINVAL;
 	}
 
-	dc = devm_kzalloc(dev->dev, sizeof(*dc), GFP_KERNEL);
-	if (!dc)
-		return -ENOMEM;
-
 	dc->desc = match->data;
 	dc->hlcdc = dev_get_drvdata(dev->dev->parent);
 	dev->dev_private = dc;
@@ -853,16 +854,18 @@ static const struct drm_driver atmel_hlcdc_dc_driver = {
 
 static int atmel_hlcdc_dc_drm_probe(struct platform_device *pdev)
 {
+	struct atmel_hlcdc_dc *dc;
 	struct drm_device *ddev;
 	int ret;
 
-	ddev = drm_dev_alloc(&atmel_hlcdc_dc_driver, &pdev->dev);
-	if (IS_ERR(ddev))
-		return PTR_ERR(ddev);
+	dc = devm_drm_dev_alloc(&pdev->dev, &atmel_hlcdc_dc_driver, struct atmel_hlcdc_dc, dev);
+	if (IS_ERR(dc))
+		return PTR_ERR(dc);
+	ddev = &dc->dev;
 
 	ret = atmel_hlcdc_dc_load(ddev);
 	if (ret)
-		goto err_put;
+		return ret;
 
 	ret = drm_dev_register(ddev, 0);
 	if (ret)
@@ -875,9 +878,6 @@ static int atmel_hlcdc_dc_drm_probe(struct platform_device *pdev)
 err_unload:
 	atmel_hlcdc_dc_unload(ddev);
 
-err_put:
-	drm_dev_put(ddev);
-
 	return ret;
 }
 
@@ -887,7 +887,6 @@ static void atmel_hlcdc_dc_drm_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(ddev);
 	atmel_hlcdc_dc_unload(ddev);
-	drm_dev_put(ddev);
 }
 
 static void atmel_hlcdc_dc_drm_shutdown(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
index 53d47f01db0bd4d906b73f9f2a46f2ef7326d8c6..26b26185cf34ac1678f385982caabd2dbbc22630 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
@@ -350,6 +350,7 @@ struct atmel_hlcdc_dc {
 	struct dma_pool *dscrpool;
 	struct atmel_hlcdc *hlcdc;
 	struct drm_crtc *crtc;
+	struct drm_device dev;
 	struct atmel_hlcdc_layer *layers[ATMEL_HLCDC_MAX_LAYERS];
 	struct {
 		u32 imr;

-- 
2.51.0


