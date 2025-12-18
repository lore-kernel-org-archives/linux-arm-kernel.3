Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54350D6ACFE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 13:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ms7drADWOhp5FF+YlrwB/RQPKWikgg0c4Q91oo4VjTE=; b=DGkglpttARv9MGg6MBYJ1fL9tF
	ChC6u0FW+kHxuB05rCdvxYJYUrDo+Txrx59F2Tq2in3bFX29cbpwYrtElmvjiipfugLRbKF+uSsVJ
	Nqp1Cr+jlOkrUsQozW/EqH4RGDmgK0lc/z7JoDaQLJY6KxhYEkYnT0w9nQoeIeuCxX9ts3DCDksJc
	3Xl2/EO0xJ70WfCp/RMrQzemQNoWsAOhoMTrEDWzYQARekb+ENG04GosAG7Bb69V5duBiGXsrwmRB
	EhfuCIIxuXVFP+pdtJfxJS9qvO6gdsoZC1iLb1x+E0HGrXrPG6HO6L1Izh7DVmaiJ4jJ5WA/b7rjB
	u/UmJN/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE22-00000008WX1-2JmR;
	Thu, 18 Dec 2025 13:27:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE1t-00000008WS7-1BVv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 13:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1766064411; x=1797600411;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=H4lz9IzPucH+8/psNxpuZMlk/rvyrt76Wj+dwW/qyMk=;
  b=kDVRQZf1m7HD9A9Y4qzMa+u+T9iprp4kkFBMKflVzmac/R9HqunaAGHu
   Ke8o82RLNeULLXq31ylbN99QqK1eSPvFsk3GF2+QUH3aJofx0EH3n5uZ3
   24k0lNANz+oNPX7Ea/P5AtiLHqHH+C0nReCzLIdgSV8rvlqWUmaDfBHFh
   0H80G7IA7xEDZhTmieqXeUSSmUv8C1YwuMVxMIn9O2sSJpgBlrdHzt204
   FaIAKm8TnIg+HspAka27+vMpyCo83g6VCDd8BfuQmbCojLP1lXHGrctmR
   PGM0x8v2rLmUMBFSqdntJPB4nWw7Koaa1GAhz9Y84eUU6EzacH0H6ny5g
   Q==;
X-CSE-ConnectionGUID: 2/lmXmCJRTiQR6o8m97H0g==
X-CSE-MsgGUID: 2G7U0F7qSrejLDKfYF/h8A==
X-IronPort-AV: E=Sophos;i="6.21,158,1763449200"; 
   d="scan'208";a="218051102"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 06:26:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Thu, 18 Dec 2025 06:26:35 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Dec 2025 06:26:32 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Thu, 18 Dec 2025 14:26:04 +0100
Subject: [PATCH v2 6/8] drm/atmel-hlcdc: use drmm_crtc_alloc_with_planes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-lcd_cleanup_mainline-v2-6-df837aba878f@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2868;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=H4lz9IzPucH+8/psNxpuZMlk/rvyrt76Wj+dwW/qyMk=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpRADxtrpSY4xe5mXFiCi30OuU2WXVgrLPk8OV2
 2OPMMOSKyKJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaUQA8QAKCRA+OeYT93tk
 LS3ND/0WWZx3nxRsawY1DkE7jRoOUUN9YS7ELjs0+OXTRGywegRnTNxx9PDlorjWA9qpiaIDnM2
 bZS3LTTByn30RYHLRCoHLYCxK2aCN9Hy8iPKH6qGZ4u9HsG1e0DR5uBQr2ngbrHhuwjDoLlnFLc
 +H+XDUI8ggRHJXA16QriEj1/vT8W8lvzNkRPxXdBEiSujA2CTIgPDtX5Jj4ON4rj1DaqhRz/3Vh
 AyHd/eIGMS1KMSi8j5ME9KePibIcgldjFKR1sBFys8r2+LguNCRHhUgUZd/nKpjj6d/E4safDlq
 d2KHXZ6JGUznJkPqItiQlxKvkeHsMldXFxf9lyh884DojJEw7zkhStqUiH75f7N5UbLzzqNJcuF
 l9ssCUXhjpL8JFUTSUYUAARKgkxtOsVfwAi9V0ByDYNnO6sQ92smGhg11kQrqjcneBsFfEnzw/J
 rjyZywV5vLfeDeNWHJtCvfuy71l6zOMEXO4smycWRRdb9hWMXSEirB67MoKRluuhfSOdZi575JR
 gbt7E03+4p1q1syjxwXn92+bNW6r6uP6CIxaLukqydURO+lk4+yvkzMdSXUc9haE+0xYGvQ6PsY
 7+l43whavLtaoTgWLaHLumQQbyNsq0U7QHrnQ2FyNkImC1UwPR+ctZm+uVaV3fmzSfCAx24a5ji
 uQH7dRrOckQKwNg==
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_052653_393702_0A80AD14 
X-CRM114-Status: GOOD (  14.65  )
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

Use drmm_crtc_alloc_with_planes() to simplify the code. As we no longer
have to take care about cleanup, we can get rid of
atmel_hlcdc_crtc_destroy().

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 32 +++++---------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index e0efc7309b1b256520eff29462431476f8589255..b075f291847f9eb91e07b7844382871f38ed5f81 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -509,14 +509,6 @@ static const struct drm_crtc_helper_funcs lcdc_crtc_helper_funcs = {
 	.atomic_disable = atmel_hlcdc_crtc_atomic_disable,
 };
 
-static void atmel_hlcdc_crtc_destroy(struct drm_crtc *c)
-{
-	struct atmel_hlcdc_crtc *crtc = drm_crtc_to_atmel_hlcdc_crtc(c);
-
-	drm_crtc_cleanup(c);
-	kfree(crtc);
-}
-
 static void atmel_hlcdc_crtc_finish_page_flip(struct atmel_hlcdc_crtc *crtc)
 {
 	struct drm_device *dev = crtc->base.dev;
@@ -607,7 +599,6 @@ static void atmel_hlcdc_crtc_disable_vblank(struct drm_crtc *c)
 static const struct drm_crtc_funcs atmel_hlcdc_crtc_funcs = {
 	.page_flip = drm_atomic_helper_page_flip,
 	.set_config = drm_atomic_helper_set_config,
-	.destroy = atmel_hlcdc_crtc_destroy,
 	.reset = atmel_hlcdc_crtc_reset,
 	.atomic_duplicate_state =  atmel_hlcdc_crtc_duplicate_state,
 	.atomic_destroy_state = atmel_hlcdc_crtc_destroy_state,
@@ -620,15 +611,8 @@ int atmel_hlcdc_crtc_create(struct drm_device *dev)
 	struct atmel_hlcdc_plane *primary = NULL, *cursor = NULL;
 	struct atmel_hlcdc_dc *dc = dev->dev_private;
 	struct atmel_hlcdc_crtc *crtc;
-	int ret;
 	int i;
 
-	crtc = kzalloc(sizeof(*crtc), GFP_KERNEL);
-	if (!crtc)
-		return -ENOMEM;
-
-	crtc->dc = dc;
-
 	for (i = 0; i < ATMEL_HLCDC_MAX_LAYERS; i++) {
 		if (!dc->layers[i])
 			continue;
@@ -646,13 +630,13 @@ int atmel_hlcdc_crtc_create(struct drm_device *dev)
 			break;
 		}
 	}
+	crtc = drmm_crtc_alloc_with_planes(dev, struct atmel_hlcdc_crtc, base,
+					   &primary->base, &cursor->base, &atmel_hlcdc_crtc_funcs,
+					   NULL);
+	if (IS_ERR(crtc))
+		return PTR_ERR(crtc);
 
-	ret = drm_crtc_init_with_planes(dev, &crtc->base, &primary->base,
-					&cursor->base, &atmel_hlcdc_crtc_funcs,
-					NULL);
-	if (ret < 0)
-		goto fail;
-
+	crtc->dc = dc;
 	crtc->id = drm_crtc_index(&crtc->base);
 
 	for (i = 0; i < ATMEL_HLCDC_MAX_LAYERS; i++) {
@@ -674,8 +658,4 @@ int atmel_hlcdc_crtc_create(struct drm_device *dev)
 	dc->crtc = &crtc->base;
 
 	return 0;
-
-fail:
-	atmel_hlcdc_crtc_destroy(&crtc->base);
-	return ret;
 }

-- 
2.51.0


