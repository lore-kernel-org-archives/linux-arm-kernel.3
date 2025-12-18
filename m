Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECCDD6ACFB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 13:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qt/T8SarTB62uWR6Zh5QYOgUPB8QsZlINeBIvEmJEG0=; b=eWFiPQKBOjSAXSQp2j895PygQ0
	81lvWBVnMR+Wm0p7bYe5RsNr+1ajStYgHRWJeYagOY7+hExiEdweBKDNh6Wjo6nDwWwW7f3bpbSWz
	VOsqwfmNjWGVNc3eJ/pyWk1AtnKV7IQR+Wj8Hy3j6Ge8/pyuj+RBKoH25EbxQ8fWBOwtAEzF6OpGQ
	LzNCaZnuUyJ+bOqK4i8CX2uepCIXtU/H6sEyzM4ZKY0c1JaeJXloHWUXYwtvdsnmGZg6t+qER18W+
	YJwkiArbggLk4YGBp5KsZSKzptA2++/FooEn0qW/kurUZFbYpkbmHKI67LZKGYKalnwIC+EKrG+r7
	ILm3gv6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE22-00000008WWZ-0xsh;
	Thu, 18 Dec 2025 13:27:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE1t-00000008WRT-0xSa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 13:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1766064411; x=1797600411;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=xRwp+SmcFl0i1ir4hFOL+t6xAhLCJH5Boq1BrwL91lU=;
  b=qiGj6RDa5+Tc/KUSLTmF5S58+NiLUFuXuKbNOCQH87/mLmrI5SSv1Hiy
   AU0u6kd60f2kmz8D3JxjGFofEooxAB/XkAcy7bZE54EvoSAfmOfNCRfJf
   Ck58Opx8mRcm4G0CLsvSduRaj2xzTRmXWyS4s7aGf5B0zSaE/a/ca4FT9
   BoTuJ9HhYemgG1zdNVWKQ7czFWbhdOqwN4pGLh8e4gk6Cef111hfC6fJP
   GngeyvYBVcrpP9Iq/o/jzuj/y6ChPZ5m84sQIq5z4f0bcENAlkmD2/Y3r
   fqnW+IbJNL1W+/OUehbmNBY0WOULmVTCimnh88SIYlCfZqDqceyPh7pPx
   A==;
X-CSE-ConnectionGUID: 2/lmXmCJRTiQR6o8m97H0g==
X-CSE-MsgGUID: UkCg9icLTZyOnYwvYJc1dA==
X-IronPort-AV: E=Sophos;i="6.21,158,1763449200"; 
   d="scan'208";a="218051101"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 06:26:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Thu, 18 Dec 2025 06:26:32 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Dec 2025 06:26:29 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Thu, 18 Dec 2025 14:26:03 +0100
Subject: [PATCH v2 5/8] drm/atmel-hlcdc: use devm_drm_of_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-lcd_cleanup_mainline-v2-5-df837aba878f@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1913;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=xRwp+SmcFl0i1ir4hFOL+t6xAhLCJH5Boq1BrwL91lU=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpRADxmWEmk7pBWwjYYJUn7Pn08RfdRdLnt1Clz
 /ADt6lPlluJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaUQA8QAKCRA+OeYT93tk
 LU7nEACoTZ2nVbPYZ85txpqa2NtPydkLOs1XtsXLEe1BhH6sudMH2XU9PaAwfeUfuIMiPVSIn1P
 ZhZXE1HsWlTBZC0M0GYL53cr9FW6X28ax95CwZ97Uh4Tq0408pS5KooHAr7Dako2LXulUwXMh80
 VzUhbgoVI0dNUiT72kfBF14x/1IjdfPY3p4Quk2+Uer4Kyn+rhQv4MGUwBC74kdqe3fqIqlPPWs
 ejQ96dKDX2i9YfN7rIvpHrkUkbDF6atIfQsfFDY6DIWN6F+ZK31ii5RsorLhF33OyIcQDiMBqlB
 N+wBXUy0YlMBpiICP2jgJRoIlo9sXO/mzb7y9IlWAQNAnv1fvliYMuWtr5N4VDKm2A1iKyvm22O
 cM/bpQWSayAryn3nl8wftJ/19ZmZK0Zeb72SRlR7J6xk6t4m4oi1JWUnp7pfkvsq8hk3ba3wdfQ
 OtVAcFV/4FuviOZDQJ1zNw/yBPtcs6tV2D2Z3UEvnu4WAXOFXQquXA5Tzr08ul6OnEdayUvculb
 qbzYsVomgIplSvTZs9dm3EFALTpjiYoCMASxtN/V7U6tJ9Hp2Ks9JUDfqmv9FyDKmaqYpsCA/oM
 VbWzG2IFH9b9PyfgJspMr3eEVu0nNveoMTTz4CJBQCMQk6PaM8PoCjqDY9ga2AVwxbMXIy+KCBf
 OFdwsyLghORuhcQ==
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_052653_332662_168F7AED 
X-CRM114-Status: GOOD (  12.29  )
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

Get rid of drm_of_find_panel_or_bridge() as it is deprecated and use
devm_drm_of_get_bridge() instead.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c | 25 +++++-------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
index e582315f70a119f2b39057ff112bc427117b85f5..e8aea905fb10d20d89c0cfd7937039b44d8a55b7 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
@@ -69,16 +69,14 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 {
 	struct atmel_hlcdc_rgb_output *output;
 	struct device_node *ep;
-	struct drm_panel *panel;
 	struct drm_bridge *bridge;
 	struct atmel_hlcdc_dc *dc = dev->dev_private;
 	struct drm_crtc *crtc = dc->crtc;
-	int ret;
+	int ret = 0;
 
-	ret = drm_of_find_panel_or_bridge(dev->dev->of_node, 0, endpoint,
-					  &panel, &bridge);
-	if (ret)
-		return ret;
+	bridge = devm_drm_of_get_bridge(dev->dev, dev->dev->of_node, 0, endpoint);
+	if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
 
 	output = drmm_simple_encoder_alloc(dev, struct atmel_hlcdc_rgb_output,
 					   encoder, DRM_MODE_ENCODER_NONE);
@@ -97,23 +95,10 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 	}
 
 
-
-	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_Unknown);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
-	}
 	output->encoder.possible_crtcs = drm_crtc_mask(crtc);
 
-	if (bridge) {
+	if (bridge)
 		ret = drm_bridge_attach(&output->encoder, bridge, NULL, 0);
-		if (!ret)
-			return 0;
-
-		if (panel)
-			drm_panel_bridge_remove(bridge);
-	}
 
 	return ret;
 }

-- 
2.51.0


