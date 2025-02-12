Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAAAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0/pOGJNL993DPyoMevAgdGrHFiNsXmQDI8AHiFFQmMs=; b=vli3gEFmx/jmROxJxlO5PTih/k
	ZLe9qBKikyT37TaJxHcU17psdyOAyS/sI1dGit5eY1etkrNuE6V6KVhedH2rBA+P2kh2e8BGzLibk
	M5cc1+CFc3EY/zNvhHCuRn20erN4baY9fF+OqnWRDTL8bDnNKKDeSLOdWvXSAzIiUqKKT3hv11+VW
	6WPdoLyHMBaJgtNMXPLX6DtJPbX39HnkneuOrUocL5z7yxwIrayzzl/LEbi4pWspGFHrdojCjgtdK
	3yFzPw+XLLqKqOqHB8+alLDc66Zj7TgSp70IYws7HFTdPU6YxlnCJ58QcOPXAWB+CCOo9gECCeK8S
	7cjV1fPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9df-00000006vSJ-16oA;
	Wed, 12 Feb 2025 10:06:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9Im-00000006qDk-1cSr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 09:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739353504; x=1770889504;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Sa8bPFHTaj9aW+dktFBUNt2YyId16vwK369IXtQxnwo=;
  b=tT16+YuiFYjNEgtSRGy4URKPusCEq2iZzb/lUjIzVuwLhKONAL3CLWMk
   eF+7u64aPn5F8JCOzU98yAIQ3lJx3Uj6NYRY7eqPEMnOnhokKiWicpX+A
   qGYgrzrPwWRvaAMweTDBH2xpLFdAy5HX1BCEDYlU4SkEjE67bB0qaAYRv
   MPtFqqZiau9KIhTvHbo7YZfqK9SLe2UECAnUTKtZ+JH/O1juUScX9nqjD
   aOImANhO13+aXLd0Yand4LokxsigXalLS37/z2kGiltsdzmBTplxRJlH7
   l1/7iOEmZE5QQQoAu9j8GUhLyB8on/vqDm2pA9YCgokEOAfcdA/cUDGLX
   g==;
X-CSE-ConnectionGUID: hX8HeKjRTlCEQQ9RkVLg4A==
X-CSE-MsgGUID: BJci5WDbS2KJ5oBT4WqMpQ==
X-IronPort-AV: E=Sophos;i="6.13,279,1732604400"; 
   d="scan'208";a="38002164"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Feb 2025 02:45:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 12 Feb 2025 02:45:01 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 12 Feb 2025 02:44:55 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Dharma Balasubiramani <dharma.b@microchip.com>, Manikandan Muralidharan
	<manikandan.m@microchip.com>
Subject: [PATCH v2 1/3] drm: atmel-hlcdc: add support for LVDS encoder type
Date: Wed, 12 Feb 2025 15:14:47 +0530
Message-ID: <20250212094449.109622-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_014504_489813_E677884F 
X-CRM114-Status: GOOD (  11.64  )
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

From: Dharma Balasubiramani <dharma.b@microchip.com>

Add support for encoder type "DRM_MODE_ENCODER_LVDS" with the following
bus formats:
	- RGB888_1X7X4_SPWG
	- RGB888_1X7X4_JEIDA
	- RGB666_1X7X3_SPWG
	- RGB666_1X18

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
[manikandan.m@microchip.com: move modifications inside the
atmel_xlcdc_connector_output_lvds fn]
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 0f7ffb3ced20..0e709047369a 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -356,6 +356,42 @@ static int atmel_xlcdc_connector_output_dsi(struct drm_encoder *encoder,
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
@@ -374,6 +410,8 @@ static int atmel_hlcdc_connector_output_mode(struct drm_connector_state *state)
 	 */
 	if (encoder->encoder_type == DRM_MODE_ENCODER_DSI)
 		return atmel_xlcdc_connector_output_dsi(encoder, info);
+	else if (encoder->encoder_type == DRM_MODE_ENCODER_LVDS)
+		return atmel_xlcdc_connector_output_lvds(encoder, info);
 
 	switch (atmel_hlcdc_encoder_get_bus_fmt(encoder)) {
 	case 0:
-- 
2.25.1


