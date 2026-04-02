Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83944D6AAF7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 18:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1ql6/+xYyt93ullHE2rXbTUluLkQZ/r313Mu63UomA=; b=BoNf8/cwYk4ZlExFocFQHJJzlc
	/MOjGhF46Vc8zMGqLzQvA/rdYIct7uxlSBrnvZt/h4Pdix/7nCQbtsXIZOvEvFHrnYQ6YYyz6aiaZ
	btSXU5lpSsMmU+bJG1HjYFHAq+J66D3rVwCszcOmI0gZuBlMNMZH6t4fV/QyDHBeDqPht8vh3XGUA
	o0wNyUC2EESlY/JOo5Muh3YJHFjc+p70mEcNOdftQ+igHJMKxQvOiRaBC/hPPrfYUnA3ZdkPTPijh
	436vwF6HL11a2H/r2e7rSGooZm1N4bf6jTkrGlU20YVcu3HHbNSWx/+EuPm6RC61DMseUlEIMRnHk
	QqI4Qo6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Mu3-00000000fh3-3DLJ;
	Thu, 02 Apr 2026 18:36:27 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Mu1-00000000fgN-096q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 18:36:26 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id DD5E61F80041
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Apr 2026 18:36:22 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 37EF8B40129; Thu,  2 Apr 2026 18:36:22 +0000 (UTC)
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id F1C86B40128;
	Thu,  2 Apr 2026 18:33:52 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	=?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH v2 2/2] drm: lcdif: Wait for vblank before disabling DMA
Date: Thu,  2 Apr 2026 20:33:51 +0200
Message-ID: <20260402183351.3281123-3-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402183351.3281123-1-paulk@sys-base.io>
References: <20260402183351.3281123-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_113625_239205_FD4AE416 
X-CRM114-Status: GOOD (  15.54  )
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

It is necessary to wait for the full frame to finish streaming
through the DMA engine before we can safely disable it by removing
the DISP_PARA_DISP_ON bit. Disabling it in-flight can leave the
hardware confused and unable to resume streaming for the next frame.

This causes the FIFO underrun and empty status bits to be set and
a single solid color to be shown on the display, coming from one of
the pixels of the previous frame. The issue occurs sporadically when
a new mode is set, which triggers the crtc disable and enable paths.

Setting the shadow load bit and waiting for it to be cleared by the
DMA engine allows waiting for completion.

The NXP BSP driver addresses this issue with a hardcoded 25 ms sleep.

Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
Co-developed-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index a00c4f6d63f4..0d04a0028671 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -375,14 +375,23 @@ static void lcdif_disable_controller(struct lcdif_drm_private *lcdif)
 	int ret;
 
 	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
+	/* Disable the layer for DMA. */
 	reg &= ~CTRLDESCL0_5_EN;
+	/*
+	 * It is necessary to wait for the full frame to finish streaming
+	 * through the DMA engine before we can safely disable it by removing
+	 * the DISP_PARA_DISP_ON bit. Disabling it in-flight can leave the
+	 * hardware confused and unable to resume streaming for the next frame.
+	 */
+	reg |= CTRLDESCL0_5_SHADOW_LOAD_EN;
 	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
 
+	/* Wait for the frame to finish or timeout after 50 ms. */
 	ret = readl_poll_timeout(lcdif->base + LCDC_V8_CTRLDESCL0_5,
-				 reg, !(reg & CTRLDESCL0_5_EN),
-				 0, 36000);	/* Wait ~2 frame times max */
+				 reg, !(reg & CTRLDESCL0_5_SHADOW_LOAD_EN),
+				 200, 50000);
 	if (ret)
-		drm_err(lcdif->drm, "Failed to disable controller!\n");
+		drm_err(lcdif->drm, "Timed out waiting for final vblank!\n");
 
 	reg = readl(lcdif->base + LCDC_V8_DISP_PARA);
 	reg &= ~DISP_PARA_DISP_ON;
-- 
2.53.0


