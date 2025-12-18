Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7685CD6ACF5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 13:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Y4WpKj3gRG4tW2RqyBLT9qOG5Iptl1voIU03ws7UAs=; b=XRMuiU5+ykqlrSEr+PCTiLkKrp
	SbYlsDjR8lAVD9ddVbHY2Qm5uoy3zIvW1jrd4KtxbFi6kEi5L0uOUti/tfURMGJ9pdk/7L1EHwTf/
	Eo2ZaSO83bKP2UlhdLjkUJpwuxHmBIn9vbqv4NjE0ikht23Yt1v92jS38fx8uuuXbkBecEHtZQna1
	IqEZILVKLzHjLSnhzL+C+1zDqWr4hlvDUCcD+PPAYIVG/x3B6m/KckS+YCQrxxdiympXs1v4ZvIAv
	eqH1LwS9LIuetSxnReJT45pub+kEJDoYShEZXZk4aNfoEH/BtSsSGcTabyzfwQtn3xsy+3voeUQVa
	/PKRw/Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE1z-00000008WVX-3Ndt;
	Thu, 18 Dec 2025 13:27:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE1t-00000008WRU-01IO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 13:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1766064411; x=1797600411;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=ykS7JdsTZDTvpcv0YzakxnBGh6GHP2mr6Lt81AtHCBs=;
  b=G/vV9Xn66CX9wCeoyntYSTqqxk7LKCluTosfbCuh1SOt237zQfRemkrj
   fxpjZ/alEFV07ZXiGK9UvF4NEkDlffnUEMDeHxdn87NMNnfljGJSdbduy
   KJJWs2ODtlp70l+jARxKYmazmUEOLDiQLzvWEcopXQVonfZje2/DrZ6mb
   HLQzEDvPiIZ36FlexPDpe9dNL2M19tHMD4yFVdrQYXtgJanFZCOJv28f3
   eCByA5hyGkSwqKONeSZ9Ugs+CIkUjLQLUAvKCQVMSEfQVBcI9NoM53M18
   SPCMKYPJBf1CZQUowuRZLWfzqBwjZlbn4wKtSQ+7Ys5O1ucIx9a2+F5dv
   w==;
X-CSE-ConnectionGUID: 2/lmXmCJRTiQR6o8m97H0g==
X-CSE-MsgGUID: PhUthTZ0Raq5orPdfntDFQ==
X-IronPort-AV: E=Sophos;i="6.21,158,1763449200"; 
   d="scan'208";a="218051100"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 06:26:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Thu, 18 Dec 2025 06:26:29 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Dec 2025 06:26:25 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Thu, 18 Dec 2025 14:26:02 +0100
Subject: [PATCH v2 4/8] drm/atmel-hlcdc: use drm_crtc_mask()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-lcd_cleanup_mainline-v2-4-df837aba878f@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2760;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=ykS7JdsTZDTvpcv0YzakxnBGh6GHP2mr6Lt81AtHCBs=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpRADxRbWuT2hrcX6yP1BWK5UPErl8Wdu+60zVH
 DPtxvh9+XyJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaUQA8QAKCRA+OeYT93tk
 LWBzEACSRyjecbrWJOgRkgaRknQr4y87xN9b40XBCceydVJdxFtlZHN2955/Mapd/6mWtKaPROc
 2+7fwAM1hm7oTOiMCRIPoZwVoDocTJo1sk6HTSFeotA+oDPGsAnXCU+Q6jWOULBse9cLGJB+qEt
 eFhOnbmjBRLeeoje0o6LMucCs1+DPWUlJpA8R7sNms8KJz0aPd0Breec9ksjCrH2AuTpbC/yRPY
 YtIg6GJVuOyz59e+kLB9G0V65bxbvS6zxPyJwNxaUVO3jqxIdi8unELts7G3HlEWrt/oAsChXrG
 /+YCWVwh6bEG3jEKhA628FYUpwEMUysECds+LGYTqbuxWX5tnpDSyEZEq6tLPZPR6MTIrAYZ9HQ
 BX3Pv3AJRI9+VQwJZSCm1z+uuy8QfXVQx8eC1nck0mGXYZoFJuZ+Zy5QH1Y0PwSax18fS66ZAEK
 5elHcp3QOqmel4zUxY/W5C8L/6pmiOI+IQX/XadVP2skDe+gi7hFqIPW9FVLq7Enb225kE8mcmz
 0lkFy1QOAaJsgHNy099zFIzuYFkpCHOOs3D/qeHxfY7Kes0qRdbnseUA/nWiHzI/Js/diAPsson
 RMeCJFx8bXDGc8XrGt5NxZ15OSi2PH3DZ3MpgHUhMrAd5gdkV6Wa9HhbSLuyOyLYtXUM24WEYB4
 dPnTmhxMJm+uv2g==
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_052653_111884_2B0C8D78 
X-CRM114-Status: GOOD (  12.65  )
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


