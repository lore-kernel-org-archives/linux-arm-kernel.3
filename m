Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACB2CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dY2Qy1oLXlncM2wbx0m303ejw+R9m2mSN34h1ZTvrBw=; b=3gZ8aKdmNaneBniKYO1FVFUoGL
	8PZMpn+zDKcJ58Wc+lXVD2oxC6amUIbCYIbM5w/dVVW00XmLnTe9D6KSGWaRKgPJ9Z5b3GzdP46T/
	7WnWloY+cYpzdkC7sMIvI1Lyyyhj64mLuwY2Xc94B0DksvkzmbVcyyvE21PaYWBSq7JE1tn2W1qh/
	C/le3uYQC2HdIeewvhtEqnuENDwSTHpQJLxrHW9eflaamScAUb5h+JyiQnkoaO4BABtZUVTh7dL+m
	NFvkuiQ8dNYe/kVtkbx07zx2zb8VflbnOB7U5lbe9n3GM0hutiIIiJ/+a8MJgEV3t9Rxf07u5ZoUT
	iDp6Cnzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dQR-0000000G8H4-0Lfp;
	Tue, 14 Oct 2025 11:42:43 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dQO-0000000G8Eu-2rxX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 11:42:41 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cmC4f2p9pz9sw8;
	Tue, 14 Oct 2025 13:42:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760442146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dY2Qy1oLXlncM2wbx0m303ejw+R9m2mSN34h1ZTvrBw=;
	b=Fppc6H5d6pdqcHIUDwhsxOwv1CbX7/UYT0rbz2HKqP/MjIhnzDFbB4wEqmQ/EDu+BeTPT4
	8+IDE3iyU09AQORDYuO+xbvvNyHkuM4tnSd/5LFdBdmmrnGvi9YBzR9/z0OUIgrsdbHHEs
	21vUh7AMILYnIDBPSbYH6U+Fn30+sBxUXl3g+QrZbU2g19CV9gzH+aUv/vRwWM6XRKGUtA
	rQh1XOJLvPI5nLOsMgmNWTms0mg8HIg/kF4E1DMrMMcVaG8m5Trdp7IAhe01av26q+eyli
	tJSTy+wWSZS3Y627wqR4a6RFaZdNxnLrU+a6Qn4rqndvR08Jbtd/yN0ZK5hwjA==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760442144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dY2Qy1oLXlncM2wbx0m303ejw+R9m2mSN34h1ZTvrBw=;
	b=eetYmZCPvTO+RPdeMGlNc/7HypD71CxFY8LXL8pKJdDXv3aB03rTH62QUqByCeHvsVxMle
	6J1k6CcUcUBQh39CI3uEFbW77PhU3iwamQjAJK9abJt6JPaJA/17W///Cnq5dcrHY2DWF2
	djUzBH+w/TORzddIES1jz87tix5wmmptwgH+5ZSHqzUmgOaX2Br2vuLhA8yIHzr5FPuF1e
	eoc4ptn6RRn0oNdHYuFUOIZJkmt+HaTAzat0lT7M++MSYDiW3PNqabIdS13OyFix6dB9g5
	oEnlA74r8nAXDopKls+Atvx+nbys12fuxloyMqj/eCbCzMmafd2LcEkOXLOaXQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Liu Ying <victor.liu@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/imx: dc: Sort bits and bitfields in descending order
Date: Tue, 14 Oct 2025 13:41:07 +0200
Message-ID: <20251014114148.43922-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 8e1b822faf7e4e01bb0
X-MBO-RS-META: k8cwxg7ug5w56m6nr4towkfpi7asn9rf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_044240_857414_5E792597 
X-CRM114-Status: GOOD (  11.85  )
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

Consistently sort bits and bitfields from highest to lowest bits.
No functional change.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/imx/dc/dc-ed.c |  8 ++++----
 drivers/gpu/drm/imx/dc/dc-fg.c |  4 ++--
 drivers/gpu/drm/imx/dc/dc-fu.c | 10 +++++-----
 drivers/gpu/drm/imx/dc/dc-fu.h |  4 ++--
 drivers/gpu/drm/imx/dc/dc-lb.c | 28 ++++++++++++++--------------
 5 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
index 86ecc22d0a554..d42f33d6f3fcc 100644
--- a/drivers/gpu/drm/imx/dc/dc-ed.c
+++ b/drivers/gpu/drm/imx/dc/dc-ed.c
@@ -15,12 +15,12 @@
 #include "dc-pe.h"
 
 #define PIXENGCFG_STATIC	0x8
-#define  POWERDOWN		BIT(4)
-#define  SYNC_MODE		BIT(8)
-#define  SINGLE			0
 #define  DIV_MASK		GENMASK(23, 16)
 #define  DIV(x)			FIELD_PREP(DIV_MASK, (x))
 #define  DIV_RESET		0x80
+#define  SYNC_MODE		BIT(8)
+#define  SINGLE			0
+#define  POWERDOWN		BIT(4)
 
 #define PIXENGCFG_DYNAMIC	0xc
 
@@ -28,9 +28,9 @@
 #define  SYNC_TRIGGER		BIT(0)
 
 #define STATICCONTROL		0x8
+#define  PERFCOUNTMODE		BIT(12)
 #define  KICK_MODE		BIT(8)
 #define  EXTERNAL		BIT(8)
-#define  PERFCOUNTMODE		BIT(12)
 
 #define CONTROL			0xc
 #define  GAMMAAPPLYENABLE	BIT(0)
diff --git a/drivers/gpu/drm/imx/dc/dc-fg.c b/drivers/gpu/drm/imx/dc/dc-fg.c
index 7f6c1852bf724..28f372be92472 100644
--- a/drivers/gpu/drm/imx/dc/dc-fg.c
+++ b/drivers/gpu/drm/imx/dc/dc-fg.c
@@ -56,9 +56,9 @@
 
 #define FGINCTRL		0x5c
 #define FGINCTRLPANIC		0x60
-#define  FGDM_MASK		GENMASK(2, 0)
-#define  ENPRIMALPHA		BIT(3)
 #define  ENSECALPHA		BIT(4)
+#define  ENPRIMALPHA		BIT(3)
+#define  FGDM_MASK		GENMASK(2, 0)
 
 #define FGCCR			0x64
 #define  CCGREEN(x)		FIELD_PREP(GENMASK(19, 10), (x))
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
index f94c591c81589..1d8f74babef8a 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.c
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -18,11 +18,11 @@
 #define BASEADDRESSAUTOUPDATE(x)	FIELD_PREP(BASEADDRESSAUTOUPDATE_MASK, (x))
 
 /* BURSTBUFFERMANAGEMENT */
+#define LINEMODE_MASK			BIT(31)
 #define SETBURSTLENGTH_MASK		GENMASK(12, 8)
 #define SETBURSTLENGTH(x)		FIELD_PREP(SETBURSTLENGTH_MASK, (x))
 #define SETNUMBUFFERS_MASK		GENMASK(7, 0)
 #define SETNUMBUFFERS(x)		FIELD_PREP(SETNUMBUFFERS_MASK, (x))
-#define LINEMODE_MASK			BIT(31)
 
 /* SOURCEBUFFERATTRIBUTES */
 #define BITSPERPIXEL_MASK		GENMASK(21, 16)
@@ -31,20 +31,20 @@
 #define STRIDE(x)			FIELD_PREP(STRIDE_MASK, (x) - 1)
 
 /* SOURCEBUFFERDIMENSION */
-#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
 #define LINECOUNT(x)			FIELD_PREP(GENMASK(29, 16), (x))
+#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
 
 /* LAYEROFFSET */
-#define LAYERXOFFSET(x)			FIELD_PREP(GENMASK(14, 0), (x))
 #define LAYERYOFFSET(x)			FIELD_PREP(GENMASK(30, 16), (x))
+#define LAYERXOFFSET(x)			FIELD_PREP(GENMASK(14, 0), (x))
 
 /* CLIPWINDOWOFFSET */
-#define CLIPWINDOWXOFFSET(x)		FIELD_PREP(GENMASK(14, 0), (x))
 #define CLIPWINDOWYOFFSET(x)		FIELD_PREP(GENMASK(30, 16), (x))
+#define CLIPWINDOWXOFFSET(x)		FIELD_PREP(GENMASK(14, 0), (x))
 
 /* CLIPWINDOWDIMENSIONS */
-#define CLIPWINDOWWIDTH(x)		FIELD_PREP(GENMASK(13, 0), (x) - 1)
 #define CLIPWINDOWHEIGHT(x)		FIELD_PREP(GENMASK(29, 16), (x) - 1)
+#define CLIPWINDOWWIDTH(x)		FIELD_PREP(GENMASK(13, 0), (x) - 1)
 
 enum dc_linemode {
 	/*
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
index e016e1ea5b4e0..f678de3ca8c0a 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.h
+++ b/drivers/gpu/drm/imx/dc/dc-fu.h
@@ -33,13 +33,13 @@
 #define A_SHIFT(x)			FIELD_PREP_CONST(GENMASK(4, 0), (x))
 
 /* LAYERPROPERTY */
+#define SOURCEBUFFERENABLE		BIT(31)
 #define YUVCONVERSIONMODE_MASK		GENMASK(18, 17)
 #define YUVCONVERSIONMODE(x)		FIELD_PREP(YUVCONVERSIONMODE_MASK, (x))
-#define SOURCEBUFFERENABLE		BIT(31)
 
 /* FRAMEDIMENSIONS */
-#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
 #define FRAMEHEIGHT(x)			FIELD_PREP(GENMASK(29, 16), (x))
+#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
 
 /* CONTROL */
 #define INPUTSELECT_MASK		GENMASK(4, 3)
diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
index 38f966625d382..ca1d714c8d6e6 100644
--- a/drivers/gpu/drm/imx/dc/dc-lb.c
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -17,12 +17,12 @@
 #include "dc-pe.h"
 
 #define PIXENGCFG_DYNAMIC			0x8
-#define  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK	GENMASK(5, 0)
-#define  PIXENGCFG_DYNAMIC_PRIM_SEL(x)		\
-		FIELD_PREP(PIXENGCFG_DYNAMIC_PRIM_SEL_MASK, (x))
 #define  PIXENGCFG_DYNAMIC_SEC_SEL_MASK		GENMASK(13, 8)
 #define  PIXENGCFG_DYNAMIC_SEC_SEL(x)		\
 		FIELD_PREP(PIXENGCFG_DYNAMIC_SEC_SEL_MASK, (x))
+#define  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK	GENMASK(5, 0)
+#define  PIXENGCFG_DYNAMIC_PRIM_SEL(x)		\
+		FIELD_PREP(PIXENGCFG_DYNAMIC_PRIM_SEL_MASK, (x))
 
 #define STATICCONTROL				0x8
 #define  SHDTOKSEL_MASK				GENMASK(4, 3)
@@ -37,24 +37,24 @@
 #define BLENDCONTROL				0x10
 #define  ALPHA_MASK				GENMASK(23, 16)
 #define  ALPHA(x)				FIELD_PREP(ALPHA_MASK, (x))
-#define  PRIM_C_BLD_FUNC_MASK			GENMASK(2, 0)
-#define  PRIM_C_BLD_FUNC(x)			\
-		FIELD_PREP(PRIM_C_BLD_FUNC_MASK, (x))
-#define  SEC_C_BLD_FUNC_MASK			GENMASK(6, 4)
-#define  SEC_C_BLD_FUNC(x)			\
-		FIELD_PREP(SEC_C_BLD_FUNC_MASK, (x))
-#define  PRIM_A_BLD_FUNC_MASK			GENMASK(10, 8)
-#define  PRIM_A_BLD_FUNC(x)			\
-		FIELD_PREP(PRIM_A_BLD_FUNC_MASK, (x))
 #define  SEC_A_BLD_FUNC_MASK			GENMASK(14, 12)
 #define  SEC_A_BLD_FUNC(x)			\
 		FIELD_PREP(SEC_A_BLD_FUNC_MASK, (x))
+#define  PRIM_A_BLD_FUNC_MASK			GENMASK(10, 8)
+#define  PRIM_A_BLD_FUNC(x)			\
+		FIELD_PREP(PRIM_A_BLD_FUNC_MASK, (x))
+#define  SEC_C_BLD_FUNC_MASK			GENMASK(6, 4)
+#define  SEC_C_BLD_FUNC(x)			\
+		FIELD_PREP(SEC_C_BLD_FUNC_MASK, (x))
+#define  PRIM_C_BLD_FUNC_MASK			GENMASK(2, 0)
+#define  PRIM_C_BLD_FUNC(x)			\
+		FIELD_PREP(PRIM_C_BLD_FUNC_MASK, (x))
 
 #define POSITION				0x14
-#define  XPOS_MASK				GENMASK(15, 0)
-#define  XPOS(x)				FIELD_PREP(XPOS_MASK, (x))
 #define  YPOS_MASK				GENMASK(31, 16)
 #define  YPOS(x)				FIELD_PREP(YPOS_MASK, (x))
+#define  XPOS_MASK				GENMASK(15, 0)
+#define  XPOS(x)				FIELD_PREP(XPOS_MASK, (x))
 
 enum dc_lb_blend_func {
 	DC_LAYERBLEND_BLEND_ZERO,
-- 
2.51.0


