Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C593D6D220
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 13:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxtgWMH9a1UPB1ItFLJ1TT3GpnkJdAz0y68Sq+NqCQg=; b=uUymtwYRs8Rwv5nlZ2uBhqKrQu
	TzmK/zswD4wH9uzTv/RGhnv1Q/1BipvjYZ7qSr61vTCfCgXyITd4m/ip/i/Cl4G13idPW3r/m9mN2
	CFZ2XgwPSHZSY1oMGCME93CUfruyKaP7M7v573dAELDimPmRhONNmXaWUah3KvNsuQJq22oadf90u
	vved5kctwO15wJubYbIu/0igNz2gDcE58F8vRXHODvSR21osbobjA8ZeuwzM/mrgZs7jEMG/2FH3j
	VInmb2KZzzlIgiZRK9KuWvAYWrbK/OGMBwmGX3VLAciMqt3Ep2ceVoOilynQnF8L0QnL3LyhHSgRv
	TLJ8g92A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE22-00000008WXV-3ZAu;
	Thu, 18 Dec 2025 13:27:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE1u-00000008WRU-14tD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 13:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1766064412; x=1797600412;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=6+fNHOwf5B3Mr/H+++1aDzYmBahYT1JXyEW9NioMyYc=;
  b=FnOtx5+ZR3QGW+WkhvGtfe6FgyH1k+jEokDbiUvNBcDnxVQJsNnSUtoK
   Kg/kQkD2LzdbGZMde0nswQsLtOAoIsusX6MDEhNKChJKRicT7J+0o97zP
   BW0DnWzdCITu00i5dZ1/2rF619RehuuypZJnSDhw0Hf6a6Ba6vx94TmL/
   GCTitMsMD+MonTZdXqnMwlNINwWsZva2lCS4CtFe+1MW/31NAXPFTGY0Z
   yRboXW6MiEztExpZVUvcB2MWp85MtVTkoafFaV78I2TSxifveQqqvETNw
   rnZLv0HlxqGWH1/Uz/YfoOkgaLe432XXozaNfXD4O/POrdk+oUoQc204v
   Q==;
X-CSE-ConnectionGUID: 2/lmXmCJRTiQR6o8m97H0g==
X-CSE-MsgGUID: HoMX2EtATVqNcLM7kPIctg==
X-IronPort-AV: E=Sophos;i="6.21,158,1763449200"; 
   d="scan'208";a="218051103"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 06:26:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Thu, 18 Dec 2025 06:26:39 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Dec 2025 06:26:36 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Thu, 18 Dec 2025 14:26:05 +0100
Subject: [PATCH v2 7/8] drm/atmel-hlcdc: use drmm_universal_plane_alloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-lcd_cleanup_mainline-v2-7-df837aba878f@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2406;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=6+fNHOwf5B3Mr/H+++1aDzYmBahYT1JXyEW9NioMyYc=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpRADxJCeXN8wMoRK2QGik2s1K3uFzsLStzA6lP
 /4JG0ZMm5iJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaUQA8QAKCRA+OeYT93tk
 LWPOD/9cwXbDaLa7/EexwyQcOYwedjwilzyuTyYKw0vMYSwVRe4hQEk/FOlSLaM7y+CY5YttyrH
 CCS5vcLriLlQdpugbtCa+Q4MuTRFDEV70QQk/qYLf57xXrfnE7kn3qZN7xTwaLpWC2rCdz52wFG
 /7oGvkHjwirMPQZUOoG2C+vB4BDDmtNjMIJq4zQmY2e7n2lK4taKwWuCRObnjww0vJsZGLEfmhu
 LdaEGmVzWz/3YHD8PzfmhxKIjN2V9OgIP8lNTpqCdpBA6cmct4Pc/Li5Uzk8dYVIx4xng939wBf
 dt+9Bb42/HeYbsgl1PefiwY4tk203PSAa95KrmkjuaTUT2jmfPbGHDqY39UBHcAVh+DmCCME7XB
 aP1rW71Dc2Ws8Ngz3wDtGS5qeiVhDA0ja5A1ddtSWLcGkrZ6rycBr7PYxmpNuIZxNECV2tFAusT
 o7ad5MEMpl6s8iqDjqGbe8Zz+x3KAyX5/oIwSqIdCkQosAPu44lcsNtOTEhR3zct4hRyH9O27mi
 kWlLivDekNnE09Gku1IVp1q2IpQuMaQ/tI5Pg1Y7o1kkGjd9u5ox/ZgibeOoKEuHa+NIs9NLK5v
 DKgGgveipKautIMsUIkKwvRUho9pEdWCNUv9q+9RIWvtlMaJxpzodwkgUDFwiJcB0U4VWUD+h2a
 /1E1MVDS0p8joOw==
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_052654_366129_57FA49D7 
X-CRM114-Status: GOOD (  12.35  )
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

Use the drmm_universal_plane_alloc() helper to simplify the code. Using
it, we no longer need to register the destroy callback for
drm_plane_funcs.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 92132be9823f1e705d266f9547702ea9530bd043..c1f3aaae29fb9f6b947f81e2fb4e7a61e10ac5d9 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -1225,7 +1225,6 @@ static void atmel_hlcdc_plane_atomic_destroy_state(struct drm_plane *p,
 static const struct drm_plane_funcs layer_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = drm_plane_cleanup,
 	.reset = atmel_hlcdc_plane_reset,
 	.atomic_duplicate_state = atmel_hlcdc_plane_atomic_duplicate_state,
 	.atomic_destroy_state = atmel_hlcdc_plane_atomic_destroy_state,
@@ -1239,12 +1238,6 @@ static int atmel_hlcdc_plane_create(struct drm_device *dev,
 	enum drm_plane_type type;
 	int ret;
 
-	plane = devm_kzalloc(dev->dev, sizeof(*plane), GFP_KERNEL);
-	if (!plane)
-		return -ENOMEM;
-
-	atmel_hlcdc_layer_init(&plane->layer, desc, dc->hlcdc->regmap);
-
 	if (desc->type == ATMEL_HLCDC_BASE_LAYER)
 		type = DRM_PLANE_TYPE_PRIMARY;
 	else if (desc->type == ATMEL_HLCDC_CURSOR_LAYER)
@@ -1252,13 +1245,13 @@ static int atmel_hlcdc_plane_create(struct drm_device *dev,
 	else
 		type = DRM_PLANE_TYPE_OVERLAY;
 
-	ret = drm_universal_plane_init(dev, &plane->base, 0,
-				       &layer_plane_funcs,
-				       desc->formats->formats,
-				       desc->formats->nformats,
-				       NULL, type, NULL);
-	if (ret)
-		return ret;
+	plane = drmm_universal_plane_alloc(dev, struct atmel_hlcdc_plane, base, 0,
+					   &layer_plane_funcs, desc->formats->formats,
+					   desc->formats->nformats, NULL, type, NULL);
+	if (IS_ERR(plane))
+		return PTR_ERR(plane);
+
+	atmel_hlcdc_layer_init(&plane->layer, desc, dc->hlcdc->regmap);
 
 	drm_plane_helper_add(&plane->base,
 			     &atmel_hlcdc_layer_plane_helper_funcs);

-- 
2.51.0


