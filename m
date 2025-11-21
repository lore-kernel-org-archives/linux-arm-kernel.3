Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBD5CFC28A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 15:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BshzHLpOFgoUDPOCp+BTY20EAwhN1EpgsMrL/u7nQY=; b=dGRgWef8pQi3hxA7pgOpaKSt9A
	8uTnfQXjt6uyfmW+5ZG+WILHHglwSk0HL3TumxRMOuKv0e1pxL2Loev52VfzPVebpafMxn9mdAULJ
	I7tCkVRqt9+ax3aYa04j7KqC4RVI0b3Kigrkr84TH9aCkGZwmowBaO99b0luQ3P9oNGAMNjvVOM93
	YO4n/uPwLIse4/lJAqXsrR9miClYXAywYSzRfC6SLg6cghR+/ByLMxuvyowkjgGOFze3jhX2qtKi0
	3lXkP+y1C3LDljPAohrDUmVT82MB868SM9+U5eaKu0b2/eTtsWC/4ahJpGAew9Dxx7LL9RvgcmZTW
	j3X6+9lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSim-00000008ZUg-3eX2;
	Fri, 21 Nov 2025 15:06:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSik-00000008ZTh-2Ltc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 15:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763737606; x=1795273606;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=LrFGjF1cQ/xx2DanwIh3lkueUOjcNFt4oFeE1YjJwXw=;
  b=x83esdHixMpi3hNx4cT71v5LJi6n0UEJAYdQE6DrD/jB9KeTiMsHCcxI
   mAZzTfMM73vRlflX/7qigRmDTsPlowMaDH4LXOlaWGUmkE9/UQr2nh6Ff
   Xrq9g6vn+3E7a4F3iT6eGM533aSPSKT7RfkgYr4G4ELZ7ezM3xaQBkqvk
   oz6Avg9UWHVSjlhnaYskg4wSpd9estqtKoOurVDKpZmZIfJEPKWfa+Rbm
   TB7kpHcol8cLHzlcL/seuiziUxNiVb4gLsawF9wZOQPSeTDSqSCnAtTQX
   24Am1FOEExBBXTUzH5pJd4bYA0jzFtAi19iZcMSDRFI5eGj/KOES3Ix6D
   w==;
X-CSE-ConnectionGUID: QYOCTpQMSWiHPKM8DKtIjA==
X-CSE-MsgGUID: nlhkiNAZT/23BwN+3qdrHw==
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="280874243"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Nov 2025 08:06:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 21 Nov 2025 08:06:32 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 21 Nov 2025 08:06:28 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Fri, 21 Nov 2025 16:04:37 +0100
Subject: [PATCH 5/8] drm/atmel-hlcdc: use devm_drm_of_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251121-lcd_cleanup_mainline-v1-5-2587e6fe4d67@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1939;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=LrFGjF1cQ/xx2DanwIh3lkueUOjcNFt4oFeE1YjJwXw=;
 b=kA0DAAoBPjnmE/d7ZC0ByyZiAGkgf9ahRGYugbEKVpcEF6f1xnKpL6KcNeh6c8Yl9ls/2CBq1
 okCMwQAAQoAHRYhBAAwS8mJaaxbjW01TT455hP3e2QtBQJpIH/WAAoJED455hP3e2Qtfd8QAIpQ
 fB1clOh9Edtn7HnGd+yrG+lG/iJL3qBmUnh5rw/46p5uVkIvepwzhqFXEttkL9Mi+5huV0t9dKb
 joBRLyYnNqJFbkLIFsHCQCCduPowHMjWQAPaQvZqCFw5KERw+eW/JAZMAS0A/51gqHpKvhw2Iu1
 YGIe8LI4Vv/sff5BCeUl8tTC6qp04eVYV28tqjaUCGb3htppBpadnSvkQ2P4giJqi3axxH3Guve
 W3pmANEceOE++rQN4IBRaOdDgRFmRaBzaEjKDd/t+oV1EVGc0/T2LVLj96jC7M5NPgV+E6iblp9
 n8shgrZdxMWKo+Gx//ugIigTuPgopVfjVMguqwvi+gHoS9q3YIIeZS9blK9YRffP+CZObGYuu5/
 0FaRHIkAz0BZVBA9mgKlkZ1HVvg6SaeaSfT8ESNE+r3p8OSA6FbdjSOkgo68Zp2yhyP7mxAPApR
 kn1pL+dFUIjxIqoAc0N+Yep4n2WhkWgLa4+bgfpXooYtbfjwYQTgHrHirASPJl0zkvQ0HlvXVMh
 RubAouFhv0B3ObX9A6vCngnCmE+5WqIs5wG+lIeqvMnNaGhkxJ97fYqvDNyi+IKGTj0et/UDGsO
 k0zL9fr9Z9yN8vTmXyuXRgqfehoCNSenbdl+zY7Q2a9njppQ1kQFPwsUAA84lk/mPDxE0gYwsaL
 QtLI6
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_070646_621445_879DE224 
X-CRM114-Status: GOOD (  12.16  )
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
Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
index e582315f70a119f2b39057ff112bc427117b85f5..99bc7790d47ffc7e6df26768559407df0184565b 100644
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
 	int ret;
 
-	ret = drm_of_find_panel_or_bridge(dev->dev->of_node, 0, endpoint,
-					  &panel, &bridge);
-	if (ret)
-		return ret;
+	bridge = devm_drm_of_get_bridge(dev->dev, dev->dev->of_node, 0, endpoint);
+	if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
 
 	output = drmm_simple_encoder_alloc(dev, struct atmel_hlcdc_rgb_output,
 					   encoder, DRM_MODE_ENCODER_NONE);
@@ -97,22 +95,12 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 	}
 
 
-
-	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_Unknown);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
-	}
 	output->encoder.possible_crtcs = drm_crtc_mask(crtc);
 
 	if (bridge) {
 		ret = drm_bridge_attach(&output->encoder, bridge, NULL, 0);
 		if (!ret)
 			return 0;
-
-		if (panel)
-			drm_panel_bridge_remove(bridge);
 	}
 
 	return ret;

-- 
2.51.0


