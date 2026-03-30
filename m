Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB721061B18
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 22:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgPEPKjl+dgCkREviEyy4l4V8ipt4R2OgWG5L8y0YmQ=; b=Jf8zMZ9dsYeWXM7rJhPx3UisRd
	SotmBOCopgjWElc5MXfNjiWuTj4RcwfAopgbFyxvh/QYojiSlniAoKFsGsKpQVzZCP7FEAsl4CSXP
	Gwsa9mR32dv0EXQU1nn3hO9xv9rKpWj6m1mC7xvJ7G1NauOcoHfzqOnfmWLntEA399OpWKccxa7/m
	jpkUIkTD/MUWPehvC5rnN+6skjCS7oli0si7v8QKWckztcrfN2gwk+WZsudbGwcDwAVeuXbTF8JGc
	cXInRKnbgT36eCUymj1BCw3N70/7w/opYfsSmQP8ky1N5Opgx8b6QJz8SfAf12PpRyuYa6ALF/VDJ
	MpJDxorQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7LPY-0000000BzjG-1VoO;
	Mon, 30 Mar 2026 22:48:44 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7LPW-0000000BziL-2E8m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 22:48:43 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 608291F8004D
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 22:48:40 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id C92EBB2EBCC; Mon, 30 Mar 2026 22:48:39 +0000 (UTC)
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id E60CAB2EBC4;
	Mon, 30 Mar 2026 22:46:31 +0000 (UTC)
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
Subject: [PATCH 2/3] drm: lcdif: Use dedicated set/clr registers for polarity/edge
Date: Tue, 31 Mar 2026 00:46:18 +0200
Message-ID: <20260330224619.2620782-3-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330224619.2620782-1-paulk@sys-base.io>
References: <20260330224619.2620782-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_154842_734089_88A5DAEA 
X-CRM114-Status: GOOD (  13.04  )
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

The lcdif v3 hardware comes with dedicated registers to set and clear
polarity bits in the CTRL register. It is unclear if there is a
difference with writing to the CTRL register directly.

Follow the NXP BSP reference by using these registers, in case there is
a subtle difference caused by using them.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index a00c4f6d63f4..1aac354041c7 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -296,18 +296,27 @@ static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
 static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
 {
 	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
-	u32 ctrl = 0;
+	u32 ctrl;
 
 	if (m->flags & DRM_MODE_FLAG_NHSYNC)
-		ctrl |= CTRL_INV_HS;
+		writel(CTRL_INV_HS, lcdif->base + LCDC_V8_CTRL + REG_SET);
+	else
+		writel(CTRL_INV_HS, lcdif->base + LCDC_V8_CTRL + REG_CLR);
+
 	if (m->flags & DRM_MODE_FLAG_NVSYNC)
-		ctrl |= CTRL_INV_VS;
+		writel(CTRL_INV_VS, lcdif->base + LCDC_V8_CTRL + REG_SET);
+	else
+		writel(CTRL_INV_VS, lcdif->base + LCDC_V8_CTRL + REG_CLR);
+
 	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
-		ctrl |= CTRL_INV_DE;
-	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
-		ctrl |= CTRL_INV_PXCK;
+		writel(CTRL_INV_DE, lcdif->base + LCDC_V8_CTRL + REG_SET);
+	else
+		writel(CTRL_INV_DE, lcdif->base + LCDC_V8_CTRL + REG_CLR);
 
-	writel(ctrl, lcdif->base + LCDC_V8_CTRL);
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
+		writel(CTRL_INV_PXCK, lcdif->base + LCDC_V8_CTRL + REG_SET);
+	else
+		writel(CTRL_INV_PXCK, lcdif->base + LCDC_V8_CTRL + REG_CLR);
 
 	writel(DISP_SIZE_DELTA_Y(m->vdisplay) |
 	       DISP_SIZE_DELTA_X(m->hdisplay),
-- 
2.53.0


