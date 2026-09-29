Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0BECA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 13:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/u2IVc7tSJf7NbmOW9WzJ1BHxJ9bpJ55rD9CrGLTZTs=; b=4uKM8rpOMTBVKnmSxw7sQnd7BJ
	yS1EVdJgncM3VALUwbQuXtBBkjitU04qN3bz/3ueUgH9lYuVg4WBkjHvOPgodt1gdnC0WzGPyKHdF
	jXV2ARWV8nPMTLLmZCQj8OGhjaQbWG7FZjyLbDus9GLpshpSqFIl+dZZydFaHr8vP42Ij4HGdxXM7
	l0OP0dXifknpp+bDAd2CJHCLbe2z75L0VwH7wLf15ju5HZckBznc6IwM+wrc4fjFLSFvs/3ZQwWuD
	4T33vxNG2Pk6GUTKWwS+YRDeWP/DmDwgtQqiKPINqQ4vQbpa5EFe6vV4tSlLlE0OTrQ4Nit+lkZbf
	b4+SKP6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBY4W-00000003h4b-3Qs0;
	Tue, 29 Sep 2026 13:40:40 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBY4N-00000003h0s-23Is
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 13:40:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4E60D1A1065;
	Tue, 29 Sep 2026 13:40:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CD57601BD;
	Tue, 29 Sep 2026 13:40:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0126E10328265;
	Tue, 29 Sep 2026 15:40:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790689223; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/u2IVc7tSJf7NbmOW9WzJ1BHxJ9bpJ55rD9CrGLTZTs=;
	b=O/xDzm0e2Ld0N89eYmFRCY5RGC0hoWfe0SNaq4egy+h7cGscBQ+ntv9fhm2CvSHmoh97xZ
	Wnv5qdUOW68kfLcSc0zszyYe6CZBPyYYBWYwLiAAbjAXQzpth66rBwD/ytvqYrK1JEeQoY
	bsaWSPHO4t8JqYqx8ZebBejS+9eGTC9hbS8+E/DKbC7/fEaJySf1MEnJM6YgmpB3ROiQBT
	ImL4wzBx46e2wXSnb0QwIzIpy4rc6S5a1zvaV/GxkoTJesKIj3GuXR2lAN0Rr3/y2X67bt
	Hl6GoIKzWgFEpD4KeNL8hA0bSa0d1TmnBVPPkhZyoZDg70f3n9nu7XYy3DqsiA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 29 Sep 2026 15:39:51 +0200
Subject: [PATCH v2 2/7] drm: verisilicon: stop using deprecated
 devm_drm_of_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-drm-fix-of_get_bridge-build-regression-v2-2-6da431d8f180@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com>
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@kernel.org>, Doug Anderson <dianders@chromium.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_064031_680411_20E92A92 
X-CRM114-Status: GOOD (  14.53  )
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

devm_drm_of_get_bridge() is deprecated, switch to
of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() returns
a refcounted bridge, ensure it is put by using bridge.next_bridge.

Fixes build failure when CONFIG_OF is disabled.

Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code to drm_panel.c")
Reported-by: Arnd Bergmann <arnd@kernel.org>
Closes: https://lore.kernel.org/r/20260928161605.2271412-1-arnd@kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609291109.OIsGTysr-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202609290408.BOs7sk55-lkp@intel.com/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:
- fix bridge reference leak on attach error path
- mention lkp report
---
 drivers/gpu/drm/verisilicon/vs_bridge.c | 11 ++++++-----
 drivers/gpu/drm/verisilicon/vs_bridge.h |  1 -
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c b/drivers/gpu/drm/verisilicon/vs_bridge.c
index dc7c85b07fe3..3a5091c0ac2c 100644
--- a/drivers/gpu/drm/verisilicon/vs_bridge.c
+++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
@@ -29,7 +29,7 @@ static int vs_bridge_attach(struct drm_bridge *bridge,
 {
 	struct vs_bridge *vbridge = drm_bridge_to_vs_bridge(bridge);
 
-	return drm_bridge_attach(encoder, vbridge->next_bridge,
+	return drm_bridge_attach(encoder, vbridge->base.next_bridge,
 				 bridge, flags);
 }
 
@@ -303,8 +303,7 @@ struct vs_bridge *vs_bridge_init(struct drm_device *drm_dev,
 		return NULL;
 	}
 
-	next = devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev->of_node,
-				      output, intf);
+	next = of_drm_get_bridge_by_endpoint(drm_dev->dev->of_node, output, intf);
 	if (IS_ERR(next)) {
 		ret = PTR_ERR(next);
 		if (ret != -EPROBE_DEFER)
@@ -321,12 +320,14 @@ struct vs_bridge *vs_bridge_init(struct drm_device *drm_dev,
 
 	bridge = devm_drm_bridge_alloc(drm_dev->dev, struct vs_bridge, base,
 				       bridge_funcs);
-	if (IS_ERR(bridge))
+	if (IS_ERR(bridge)) {
+		drm_bridge_put(next);
 		return ERR_PTR(PTR_ERR(bridge));
+	}
 
 	bridge->crtc = crtc;
 	bridge->intf = intf;
-	bridge->next_bridge = next;
+	bridge->base.next_bridge = next;
 
 	if (intf == VSDC_OUTPUT_INTERFACE_DPI)
 		enctype = DRM_MODE_ENCODER_DPI;
diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.h b/drivers/gpu/drm/verisilicon/vs_bridge.h
index 70fee1749699..2b0ed94e4520 100644
--- a/drivers/gpu/drm/verisilicon/vs_bridge.h
+++ b/drivers/gpu/drm/verisilicon/vs_bridge.h
@@ -25,7 +25,6 @@ struct vs_bridge {
 	struct drm_connector *conn;
 
 	struct vs_crtc *crtc;
-	struct drm_bridge *next_bridge;
 	enum vs_bridge_output_interface intf;
 };
 

-- 
2.55.0


