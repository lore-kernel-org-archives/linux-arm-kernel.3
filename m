Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96682CFC28C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 15:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvZXLmPzwzhm6QvSDpXn8GzT07LgcYZ5zkWt2yi5Rr0=; b=U9IV324IkvOp3Fkk73iRCiCkCj
	yHHnaSih+9TXcqolkgu7CwYGXk11LIPs5B/CZf8MYhUgkZdDTnn3DKz0zaneJIGAG7miIkQZqE8sZ
	iU41ZYbqlcT283hkfL1YF47aSKqiq2tMzez213FqWVz++wZtRtnroLC3Mhv1Vlz/qnXLvLoZ8Of/X
	GXfb4anAm7SuW/rdQA9sUHiV4cnUdesJ5yvcnUv/qtI6qj4CpuwCI4rqsJBUxQWksIrlvyb765ssD
	+4ZK6NxLgQuMrnSoeTyCApCw7N26GJRKQ6ht/a8AzX8q3yW2NJ+vIksXin7V/INzpoc58zBRN+SdM
	w9Gijtgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSiZ-00000008ZOm-3ody;
	Fri, 21 Nov 2025 15:06:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSiT-00000008ZM6-3nWg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 15:06:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763737589; x=1795273589;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=B5OMjTtB3KvSOSitHSwKvJyc6OwPvRdH+hvUZpIHPnI=;
  b=t1ebvH7rIDnVhPA+OFtXIsltr4rxo2iZ78AmJpzTdpac2bXwAdjFvHWg
   2rtIGfWeB9PaLXTC+ZpXl71pd7KHfaU18HUNx267tvu38PRlyXuJVWTgA
   owL8VfSAdZCyKyTDjpRqrTHkW17j7kuGSO+w/lnBVYNicqOtRn9I5qefc
   jADcdE+Gm0ksG8pmJNKmo6YWd0RMC8UdFdB7/lCa0PxIR7I24mqDkEWay
   GlVKpBHMqnv7015Nc2rOI/7neuxPxxdZnlgRnMAYkgJHgTqIctTUKuv3T
   ry94Mg4lvLOlts5kYpTvS8uJPlo7lkR5zRrYnaDEnBEqFvL9xWLR3qcDz
   w==;
X-CSE-ConnectionGUID: Ubo8wtofT1S9f5fCNZ+Rrw==
X-CSE-MsgGUID: g4LF2+ioTUiA4vtG7Q8JpA==
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="56053150"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Nov 2025 08:06:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 21 Nov 2025 08:06:21 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 21 Nov 2025 08:06:17 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Fri, 21 Nov 2025 16:04:35 +0100
Subject: [PATCH 3/8] drm/atmel-hlcdc: use drmm_simple_encoder_alloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251121-lcd_cleanup_mainline-v1-3-2587e6fe4d67@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2109;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=B5OMjTtB3KvSOSitHSwKvJyc6OwPvRdH+hvUZpIHPnI=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpIH/WAcQuo7Hgt4L59frM6s6uPhpepMvIVGwjA
 wngCTtUKpSJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaSB/1gAKCRA+OeYT93tk
 LbjmD/0U/W8SnPLpZ3AacgQf/X++EdIxaLPSqNaRprjSPoBQYv3cwL/inKrefkFcq5nP7RGIF6z
 2N9u2TaEbXxjmmkhlWiZCjCS+M0drepYHLRPgfacVB++6MZwD1eP2n+WS0wS34bNPSrAv2Y282P
 49kr6YeXe81iexpbzUj4SjB0gEFupC8b0gcF2Xv69qfh6DhZ9xYlsGJ44liLSHSwaTmAmklPN76
 6MLyX8yZCaUDRTWr3g7/aFA3dIeSojg+g53lFn9UkpJ30WhBUR3xnimUV1YpQUetprbueOSwOxL
 rnoczMML1Wue7kpJ4aFIFk+JsAXD3UCq9unihXIA1DN3vO92S5MOexHDZR17biWPL4ct8XfqMnG
 /7D+WPdos5i/V03gP0PA3qbxSdGAm2JwWS1xPd1ZbbHRRY4rIy3b/ImGoKYfvzJMAW+LlIS+rau
 qVreRuxCUkgeYkCWW1Gl9eC1nraap29z2n5KFWhjAgH2AMNKNMdaK/wXpS8wHJE84QOkMiOvm2h
 G+w6a1wGT4tqeW2C4zLsR9zZAA+JKA5Gd8AG88h7Z7JPCuW3reQbbJhGPiEW0tEqGNPI48/epcS
 PKtjBc6FFuxAzRluPil0rlUrgVNYuOVeHXwjv+fHhilfXdKN/HWKNXlnzdmCU+ltarb2rmPvvlg
 QskfThUnRSANNGg==
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_070629_986470_B4FC0A73 
X-CRM114-Status: GOOD (  10.92  )
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


