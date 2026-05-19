Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2736CCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pD63PO9P9PwfR6/YIMTXN4qSDKORgOIiJPHhkAvbt4c=; b=Pu9uJ0xAvVJ01hKSzrW9pyHqE0
	grvF4pXqCGjhoRmzuK4+Li/O2iyKfi5H/041ViAxc+DRJY6YSvO5SL7ThHzXB7sudkOwqpyak7g5o
	1T5RZ5eR+3SBlvJJrPfbVz/B6Y9OZ7i0dj0PktU1EMXmGzo3Ma5qJY3pOlexAGQKrjwmzMc0eGA1v
	vK00is2dGg6xWaWBtGdW2t6HnA60yzuFoKe7fioKe0i8OH6UyDW2LppGBh2f/2igAXGGu7l1fvlCu
	34XTBv+sR2bCxHqQsGiuep4PEO6nT5XVS2vw0dbNZMKrHR4wDSBNu9gwKVDh8wUP4LKpmEeW616gV
	IkVpXShQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGLx-00000000p2v-3dYd;
	Tue, 19 May 2026 09:03:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGLX-00000000oTY-2HWM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779181359; x=1810717359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P/zUb7eaSuLgJ0Ygkd5vRer8oBCsuAGF59nPqYYO8LU=;
  b=R9cEA1OOZxh25OIfk01zT8MuRoGTSSONDKwbgUA48J5RRCmWY4NrvnbO
   pvzBQcEzZVCxMmB+97ETLG3vyYaO4jfRqlyPIEznqry1f37vI72uYKgpS
   9/8ZoKhFkWS8V/nm/unM0vF2Dju/RJ+OvgWa1YVnOGi1r7X9VR/eA1va6
   RhpDDmcBRdx88TEXLabBXkEnGuZKtLlOxQmU7P7kSKtdIpBlbd8W2KSbu
   T/SwVId3yGlIldCZ4+8nmmbidQ0tHM7KcJ0tLF5jWwoWVQn9y+QU6cWJC
   bkiGJb4i5GqvCOEqR0287LcuWs0KXFeXaW4YY9UadhGErj9AXgRdcP5RV
   Q==;
X-CSE-ConnectionGUID: hIctYe0PSYiry4BydksWDA==
X-CSE-MsgGUID: bHtQrq2rRLSqU9npjMTmkA==
X-IronPort-AV: E=Sophos;i="6.23,243,1770620400"; 
   d="scan'208";a="66488501"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 02:02:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Tue, 19 May 2026 02:02:38 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 19 May 2026 02:02:33 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH 8/8] drm: atmel-hlcdc: add LVDS output mode support
Date: Tue, 19 May 2026 14:31:35 +0530
Message-ID: <20260519090135.1188405-9-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260519090135.1188405-1-manikandan.m@microchip.com>
References: <20260519090135.1188405-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_020239_631961_B38A72AB 
X-CRM114-Status: GOOD (  14.45  )
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

Introduce atmel_xlcdc_connector_output_lvds() to map LVDS bus
formats to the appropriate output mode, and wire it into
atmel_hlcdc_connector_output_mode() for LVDS encoder types.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 44 +++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 73a8650bc9b7..9f46c368835e 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -407,6 +407,42 @@ static int atmel_xlcdc_connector_output_dsi(struct drm_encoder *encoder,
 	return supported_fmts;
 }
 
+static int atmel_xlcdc_connector_output_lvds(struct drm_encoder *encoder,
+					     struct drm_display_info *info)
+{
+	int j;
+	unsigned int supported_fmts = 0;
+
+	switch (atmel_hlcdc_encoder_get_bus_fmt(encoder)) {
+	case 0:
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+	case MEDIA_BUS_FMT_RGB666_1X18:
+		return ATMEL_HLCDC_RGB666_OUTPUT;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+		return ATMEL_HLCDC_RGB888_OUTPUT;
+	default:
+		return -EINVAL;
+	}
+
+	for (j = 0; j < info->num_bus_formats; j++) {
+		switch (info->bus_formats[j]) {
+		case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+		case MEDIA_BUS_FMT_RGB666_1X18:
+			supported_fmts |= ATMEL_HLCDC_RGB666_OUTPUT;
+			break;
+		case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+		case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+			supported_fmts |= ATMEL_HLCDC_RGB888_OUTPUT;
+			break;
+		default:
+			break;
+		}
+	}
+	return supported_fmts;
+}
+
 static int atmel_hlcdc_connector_output_mode(struct drm_connector_state *state)
 {
 	struct drm_connector *connector = state->connector;
@@ -419,12 +455,14 @@ static int atmel_hlcdc_connector_output_mode(struct drm_connector_state *state)
 	if (!encoder)
 		encoder = connector->encoder;
 	/*
-	 * atmel-hlcdc to support DSI formats with DSI video pipeline
-	 * when DRM_MODE_ENCODER_DSI type is set by
-	 * connector driver component.
+	 * Select the output format based on the encoder type.
+	 * DSI and LVDS encoders have dedicated format handlers,
+	 * while other encoder types fall through to the generic path
 	 */
 	if (encoder->encoder_type == DRM_MODE_ENCODER_DSI)
 		return atmel_xlcdc_connector_output_dsi(encoder, info);
+	if (encoder->encoder_type == DRM_MODE_ENCODER_LVDS)
+		return atmel_xlcdc_connector_output_lvds(encoder, info);
 
 	switch (atmel_hlcdc_encoder_get_bus_fmt(encoder)) {
 	case 0:
-- 
2.25.1


