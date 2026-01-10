Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3B0D277F3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 17:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/pWu63fv2X4piZLVw/R8K7A4ZYtCKrF3gKuywcnCCi8=; b=HURbkyxNPjPRWIzk0RbbZvlVg1
	Y3FjWGbasnn2b67NAgq7zAsCc9OJE+f8LfZDx1at+CygexhBfSFIGONUSNISdUUd0J0N3aVsKRa8r
	l3zXq5d5eOHr6VFSGAx+/DIcE9KhBZhUIU/ECbQDRPYSLxmW4punWW2Z0RBVfTVsKgYsVDshwUMtr
	3mWsaGynOhVwZjxZV09GxCGaHk6C3PZTkAXLaxXMPY4Y2U6ypUEctQX7xiGgrRAF7P8zXox73s6DK
	Kl26zqN1pLEJtPFQR2vpNsNGhqS/3A9qItfJvU+RwhhPQGZEt+vuLgs1DF4A9naEtFnlKPxfNLQiS
	BSe/Kq7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vecYi-00000003ZM4-3XXR;
	Sat, 10 Jan 2026 17:15:28 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vecYg-00000003ZLH-3sCA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 17:15:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 22211103463;
	Sat, 10 Jan 2026 18:15:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1768065316; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=/pWu63fv2X4piZLVw/R8K7A4ZYtCKrF3gKuywcnCCi8=;
	b=Yr6K9PYnDF/mEE6bWMrY80V6pFaQJ0SQ6YrofMdeF8PCmrBfH3rcEVqrpMaxH8Twd8M78U
	yTmPH9VnpCwe/xGB9ZKajxGf28ZF+IcozRLWchF7ZduT9zLA5XIziXUun30n20RZzdRNIQ
	dBIGMqy9PGhmlRz/vB143x+SXjAtUIPnLLiauFUIiQq9PSZHoXY233sqcpgjZuRrMIpyQq
	KoFAkr0SWlirPQ18xHIkjDQQVDKpgfSL+0F/74murXa2NeTExpBBvlJYlTtV2szq65wOa8
	9rTRVCVVpOi9ghCDweD1zfLkikmPBE7vrSuee5HKdeN8aETQIxU8Q0CjmFkCHw==
From: Marek Vasut <marex@nabladev.com>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@nabladev.com>,
	stable@vger.kernel.org,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/imx: parallel-display: Prefer bus format set via legacy "interface-pix-fmt" DT property
Date: Sat, 10 Jan 2026 18:14:10 +0100
Message-ID: <20260110171510.692666-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_091527_180688_22F9C2FC 
X-CRM114-Status: GOOD (  14.50  )
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

Prefer bus format set via legacy "interface-pix-fmt" DT property
over panel bus format. This is necessary to retain support for
DTs which configure the IPUv3 parallel output as 24bit DPI, but
connect 18bit DPI panels to it with hardware swizzling.

This used to work up to Linux 6.12, but stopped working in 6.13,
reinstate the behavior to support old DTs.

Cc: stable@vger.kernel.org
Fixes: 5f6e56d3319d ("drm/imx: parallel-display: switch to drm_panel_bridge")
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 6fbf505d2801d..02bb38a1ee4eb 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -110,8 +110,7 @@ imx_pd_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 		output_fmt = imxpd->bus_format ? : MEDIA_BUS_FMT_RGB888_1X24;
 
 	/* Now make sure the requested output format is supported. */
-	if ((imxpd->bus_format && imxpd->bus_format != output_fmt) ||
-	    !imx_pd_format_supported(output_fmt)) {
+	if (!imx_pd_format_supported(output_fmt)) {
 		*num_input_fmts = 0;
 		return NULL;
 	}
@@ -121,7 +120,17 @@ imx_pd_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	if (!input_fmts)
 		return NULL;
 
-	input_fmts[0] = output_fmt;
+	/*
+	 * Prefer bus format set via legacy "interface-pix-fmt" DT property
+	 * over panel bus format. This is necessary to retain support for
+	 * DTs which configure the IPUv3 parallel output as 24bit, but
+	 * connect 18bit DPI panels to it with hardware swizzling.
+	 */
+	if (imxpd->bus_format && imxpd->bus_format != output_fmt)
+		input_fmts[0] = imxpd->bus_format;
+	else
+		input_fmts[0] = output_fmt;
+
 	return input_fmts;
 }
 
-- 
2.51.0


