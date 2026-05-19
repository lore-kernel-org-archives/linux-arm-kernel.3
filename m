Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A9FCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 05:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEmisENzXac0DHZ2ZcRrG+bgkW9GIlfNwVxwtE7zIsY=; b=e4tQYnSzEUdb+z5tSXlzoml+Ik
	EIpGkDtQmzOa6MO4/aN5m9rDYeZloiwnUlX/tMqANnJ/YQRzj7nJaMdL2CEZTrMz8vr4VhAIkByfG
	pawZ/YcLoWAXW7SzuibFB2lvTcltghSL5UW1qRK31Zt5XLLec9qQAbLa0PUz8yR/6An9MfZhpsxhT
	WXVlDIRZf6/wT3B1PrHeddj3giSvCqhZanTf1iCaVQjOL79mPu5fzjCVGFqvhIimaqv0+rQEyE6Io
	OXEGpoRXyKf6BsOt+ieMQcvl/5MNFGdSH8bbGtxxizFja9AitYwbM9x11e4iZ7loOEBmoA9TxWy6X
	ReBKerFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDNG-00000000F59-32or;
	Tue, 19 May 2026 05:52:14 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDNB-00000000F20-1aE6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 05:52:10 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-835399c11e0so1366032b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 22:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779169928; x=1779774728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEmisENzXac0DHZ2ZcRrG+bgkW9GIlfNwVxwtE7zIsY=;
        b=kfsLGk+5u34jqPAYlw2aDUFbIcbq5XSMYfRdkupaBSacCV2oMURaf60lja834AQXI/
         eHZuyOyBkxdJgRMelf38+nFbyqr+JOkgwbH0UuyC64fQod5wX4Fx/eAxnTOcTzuswGPt
         +rKtH3Sk0CeaEGlE8Tg536VSSgXNcbsPMjKm0g3SpE1QWMwdkPBg7k3DtxenGuHm0br9
         zBiYgfuMdxjVBt4o+BIOoMuMHGV4Npze8JrA0gZvAttpF+Y8+9iGELcIbCa71ovXXsZw
         cuyAOIdVAU5f3taANXgQeMV0lhTYj3NQMAtTLRiTNt4t4QbcEEVPS6TZP/uOAj/28clz
         RXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169928; x=1779774728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CEmisENzXac0DHZ2ZcRrG+bgkW9GIlfNwVxwtE7zIsY=;
        b=B/xbi0yMmyXpoxMxMB1jcvV3WmHd0YnOwHAUudZLlyrgq9OIin7PqptZaeFoKWYOqj
         x+JTj8Kj1rYwJjScX2gk4xYqHo+WL4QgzkGzeAz/yvYzUlpuL+z114fc6NrpoL61mn3F
         6g1cvG8sRaceVqonjhegdOEX3BtJ27IVLMCPE3qAzoNK8LRybQA3Iver7VDyuTMkiUFU
         MfyzcISuUF4UVjsizMeqB/hnKjGjFs2L2/djKFchL41c75V0R1Fjjc0r+5AmDcpc7qhZ
         /TuQj3VJGrSxcLtV/3yneKm+F2qMrdNoovxMpbn+c5D8pIxUFjYXCNnuxjCamP3HJX/T
         tieQ==
X-Forwarded-Encrypted: i=1; AFNElJ9CbAnD0I7OD1O7k/KY6noq4hrgApVOIg2JD2NPQ7/twZUgbnO7Zo+g2VbwJLQA30A2fU0NfGL6XFhTD4kA9k26@lists.infradead.org
X-Gm-Message-State: AOJu0YwOXxDL3ZzDAHXFH/etB1qwzF4nD0/qpFiyCNFHLteGLbzWArMv
	04CpzL7l+zdpuQ9E6ToxfFJP9e0P6BIIS1yGm/v/VQuQvgm6B0gGF66g
X-Gm-Gg: Acq92OHPzaMNOKvGg5+pvpIdef4L5VoNtaCx7VMN2XV+tGbIE8QgEOJnxRuA7FWwo8F
	8q5jGrEnHHvHnb0yqwWxXkWeKdEK73ijodeqNYMaSiXaGLKnmpj0JSDnDNkPlmlpQtrio7zUyBe
	YUWtSEm4h0ZvMufODKlfJnl7VjoyZn7Vg7p94zJXL1+A9w9gZBDhne7RrkA12vm9ci4J0dRz+h1
	mkaHSMBGSIlnMY0tUjhLO1iIBQCTxMrlHJM9GGPrfe48kcWjFHU87MrzDsGVQ9WzwA/lWHouTlW
	EDxhC5lvloTi5+Fc46xibG3pvkd9yHyGDnEWjk9AB3cqdOMhCHS9WLMo5CVIRiRZTRV+c8C/tqe
	MlPlJPCsCB2h1FS0e/kpdNJch7/XWkbtsYKfX8eeKIxfOST/0awqx/pOgl2fokZ1pKyXWQ5CClR
	h+3OmvgU5y1r69VVIpDDw/CoUvvx5KeLtAeoiRBcf/oVZ8zEeXceVkFBubKSx937+zuFGMB0gV8
	SQj3KXJ1TKH
X-Received: by 2002:a05:6a00:3921:b0:83c:de0e:bac5 with SMTP id d2e1a72fcca58-83f33f3d3c7mr17473259b3a.49.1779169928330;
        Mon, 18 May 2026 22:52:08 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f8b9c2ea5sm2641252b3a.13.2026.05.18.22.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:52:07 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v2 3/4] drm/verisilicon: introduce per-variant hardware ops table
Date: Tue, 19 May 2026 13:51:08 +0800
Message-ID: <20260519055114.1886525-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519055114.1886525-1-a0987203069@gmail.com>
References: <20260519055114.1886525-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_225209_444397_4627690F 
X-CRM114-Status: GOOD (  24.93  )
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

The DC driver directly calls DC8200-specific register sequences from
vs_bridge.c, vs_crtc.c and vs_primary_plane.c.  Supporting a second IP
variant with a different register layout would require scattering
if/else branches throughout those files.

Instead, introduce struct vs_dc_funcs, a small vtable of function
pointers covering every hardware-specific operation:

  bridge_enable/disable     - panel output start/stop sequence
  crtc_begin/flush          - per-frame commit begin/end hooks
  crtc_enable/disable       - display output power on/off
  enable_vblank/disable_vblank - IRQ mask for vsync events
  plane_enable_ex/disable_ex - framebuffer enable/disable
  plane_update_ex           - variant-specific plane update registers
  irq_handler               - read and acknowledge pending IRQs

Extract all DC8200-specific register operations from vs_bridge.c,
vs_crtc.c, vs_primary_plane.c and vs_dc.c into a new vs_dc8200.c
source file that implements the full vs_dc_funcs vtable and exposes
vs_dc8200_funcs.

Add atomic_begin and atomic_flush hooks in vs_crtc.c to dispatch to
crtc_begin/crtc_flush; these are optional (NULL-checked) so that
variants without a per-frame commit cycle can leave them unimplemented.

After vs_fill_chip_identity() confirms a DC8200 (or compatible)
identity, vs_dc_probe() assigns dc->funcs = &vs_dc8200_funcs so all
callers automatically dispatch to the correct implementation.

No functional change for DC8200 platforms.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/Makefile          |   2 +-
 drivers/gpu/drm/verisilicon/vs_bridge.c       |  20 +---
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  38 ++++++-
 drivers/gpu/drm/verisilicon/vs_dc.c           |   6 +-
 drivers/gpu/drm/verisilicon/vs_dc.h           |  32 ++++++
 drivers/gpu/drm/verisilicon/vs_dc8200.c       | 107 ++++++++++++++++++
 .../gpu/drm/verisilicon/vs_primary_plane.c    |  32 +-----
 7 files changed, 186 insertions(+), 51 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8200.c

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index fd8d805fbcde..f4fbd9f7d6a2 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_drm.o vs_hwdb.o vs_plane.o vs_primary_plane.o
+verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o vs_drm.o vs_hwdb.o vs_plane.o vs_primary_plane.o
 
 obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c b/drivers/gpu/drm/verisilicon/vs_bridge.c
index 7a93049368db..6a9af10c64e6 100644
--- a/drivers/gpu/drm/verisilicon/vs_bridge.c
+++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
@@ -162,15 +162,8 @@ static void vs_bridge_enable_common(struct vs_crtc *crtc,
 			VSDC_DISP_PANEL_CONFIG_DE_EN |
 			VSDC_DISP_PANEL_CONFIG_DAT_EN |
 			VSDC_DISP_PANEL_CONFIG_CLK_EN);
-	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
-			VSDC_DISP_PANEL_CONFIG_RUNNING);
-	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
-			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
-	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
-			VSDC_DISP_PANEL_START_RUNNING(output));
-
-	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(crtc->id),
-			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
+
+	dc->funcs->bridge_enable(dc, output);
 }
 
 static void vs_bridge_atomic_enable_dpi(struct drm_bridge *bridge,
@@ -228,14 +221,7 @@ static void vs_bridge_atomic_disable(struct drm_bridge *bridge,
 	struct vs_dc *dc = crtc->dc;
 	unsigned int output = crtc->id;
 
-	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
-			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC |
-			  VSDC_DISP_PANEL_START_RUNNING(output));
-	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
-			  VSDC_DISP_PANEL_CONFIG_RUNNING);
-
-	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(crtc->id),
-			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
+	dc->funcs->bridge_disable(dc, output);
 }
 
 static const struct drm_bridge_funcs vs_dpi_bridge_funcs = {
diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.c b/drivers/gpu/drm/verisilicon/vs_crtc.c
index 9080344398ca..a87caa6f73ba 100644
--- a/drivers/gpu/drm/verisilicon/vs_crtc.c
+++ b/drivers/gpu/drm/verisilicon/vs_crtc.c
@@ -16,10 +16,33 @@
 #include "vs_crtc_regs.h"
 #include "vs_crtc.h"
 #include "vs_dc.h"
-#include "vs_dc_top_regs.h"
 #include "vs_drm.h"
 #include "vs_plane.h"
 
+static void vs_crtc_atomic_begin(struct drm_crtc *crtc,
+				  struct drm_atomic_commit *state)
+{
+	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
+	struct vs_dc *dc = vcrtc->dc;
+	unsigned int output = vcrtc->id;
+
+	if (dc->funcs->crtc_begin)
+		dc->funcs->crtc_begin(dc, output);
+}
+
+static void vs_crtc_atomic_flush(struct drm_crtc *crtc,
+				  struct drm_atomic_commit *state)
+{
+	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
+	struct vs_dc *dc = vcrtc->dc;
+	unsigned int output = vcrtc->id;
+
+	if (dc->funcs->crtc_flush)
+		dc->funcs->crtc_flush(dc, output);
+
+	drm_crtc_vblank_atomic_flush(crtc, state);
+}
+
 static void vs_crtc_atomic_disable(struct drm_crtc *crtc,
 				   struct drm_atomic_commit *state)
 {
@@ -30,6 +53,9 @@ static void vs_crtc_atomic_disable(struct drm_crtc *crtc,
 	drm_crtc_vblank_off(crtc);
 
 	clk_disable_unprepare(dc->pix_clk[output]);
+
+	if (dc->funcs->crtc_disable)
+		dc->funcs->crtc_disable(dc, output);
 }
 
 static void vs_crtc_atomic_enable(struct drm_crtc *crtc,
@@ -42,6 +68,9 @@ static void vs_crtc_atomic_enable(struct drm_crtc *crtc,
 	drm_WARN_ON(&dc->drm_dev->base,
 		    clk_prepare_enable(dc->pix_clk[output]));
 
+	if (dc->funcs->crtc_enable)
+		dc->funcs->crtc_enable(dc, output);
+
 	drm_crtc_vblank_on(crtc);
 }
 
@@ -119,7 +148,8 @@ static bool vs_crtc_mode_fixup(struct drm_crtc *crtc,
 }
 
 static const struct drm_crtc_helper_funcs vs_crtc_helper_funcs = {
-	.atomic_flush	= drm_crtc_vblank_atomic_flush,
+	.atomic_begin	= vs_crtc_atomic_begin,
+	.atomic_flush	= vs_crtc_atomic_flush,
 	.atomic_enable	= vs_crtc_atomic_enable,
 	.atomic_disable	= vs_crtc_atomic_disable,
 	.mode_set_nofb	= vs_crtc_mode_set_nofb,
@@ -132,7 +162,7 @@ static int vs_crtc_enable_vblank(struct drm_crtc *crtc)
 	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
 	struct vs_dc *dc = vcrtc->dc;
 
-	regmap_set_bits(dc->regs, VSDC_TOP_IRQ_EN, VSDC_TOP_IRQ_VSYNC(vcrtc->id));
+	dc->funcs->enable_vblank(dc, vcrtc->id);
 
 	return 0;
 }
@@ -142,7 +172,7 @@ static void vs_crtc_disable_vblank(struct drm_crtc *crtc)
 	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
 	struct vs_dc *dc = vcrtc->dc;
 
-	regmap_clear_bits(dc->regs, VSDC_TOP_IRQ_EN, VSDC_TOP_IRQ_VSYNC(vcrtc->id));
+	dc->funcs->disable_vblank(dc, vcrtc->id);
 }
 
 static const struct drm_crtc_funcs vs_crtc_funcs = {
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c b/drivers/gpu/drm/verisilicon/vs_dc.c
index dad9967bc10b..c94957024189 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc.c
+++ b/drivers/gpu/drm/verisilicon/vs_dc.c
@@ -8,9 +8,7 @@
 #include <linux/of.h>
 #include <linux/of_graph.h>
 
-#include "vs_crtc.h"
 #include "vs_dc.h"
-#include "vs_dc_top_regs.h"
 #include "vs_drm.h"
 #include "vs_hwdb.h"
 
@@ -33,7 +31,7 @@ static irqreturn_t vs_dc_irq_handler(int irq, void *private)
 	struct vs_dc *dc = private;
 	u32 irqs;
 
-	regmap_read(dc->regs, VSDC_TOP_IRQ_ACK, &irqs);
+	irqs = dc->funcs->irq_handler(dc);
 
 	vs_drm_handle_irq(dc, irqs);
 
@@ -136,6 +134,8 @@ static int vs_dc_probe(struct platform_device *pdev)
 	dev_info(dev, "Found DC%x rev %x customer %x\n", dc->identity.model,
 		 dc->identity.revision, dc->identity.customer_id);
 
+	dc->funcs = &vs_dc8200_funcs;
+
 	if (port_count > dc->identity.display_count) {
 		dev_err(dev, "too many downstream ports than HW capability\n");
 		ret = -EINVAL;
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h b/drivers/gpu/drm/verisilicon/vs_dc.h
index ed1016f18758..45172c1a525c 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc.h
+++ b/drivers/gpu/drm/verisilicon/vs_dc.h
@@ -14,6 +14,7 @@
 #include <linux/reset.h>
 
 #include <drm/drm_device.h>
+#include <drm/drm_plane.h>
 
 #include "vs_hwdb.h"
 
@@ -22,6 +23,34 @@
 
 struct vs_drm_dev;
 struct vs_crtc;
+struct vs_dc;
+
+struct vs_dc_funcs {
+	/* Bridge: atomic_enable, atomic_disable */
+	void (*bridge_enable)(struct vs_dc *dc, unsigned int output);
+	void (*bridge_disable)(struct vs_dc *dc, unsigned int output);
+
+	/* CRTC: atomic_begin, atomic_flush */
+	void (*crtc_begin)(struct vs_dc *dc, unsigned int output);
+	void (*crtc_flush)(struct vs_dc *dc, unsigned int output);
+
+	/* CRTC: atomic_enable, atomic_disable */
+	void (*crtc_enable)(struct vs_dc *dc, unsigned int output);
+	void (*crtc_disable)(struct vs_dc *dc, unsigned int output);
+
+	/* CRTC: enable_vblank, disable_vblank */
+	void (*enable_vblank)(struct vs_dc *dc, unsigned int output);
+	void (*disable_vblank)(struct vs_dc *dc, unsigned int output);
+
+	/* Primary plane: atomic_enable, atomic_disable, atomic_update */
+	void (*plane_enable_ex)(struct vs_dc *dc, unsigned int output);
+	void (*plane_disable_ex)(struct vs_dc *dc, unsigned int output);
+	void (*plane_update_ex)(struct vs_dc *dc, unsigned int output,
+				struct drm_plane_state *state);
+
+	/* IRQ handler */
+	u32 (*irq_handler)(struct vs_dc *dc);
+};
 
 struct vs_dc {
 	struct regmap *regs;
@@ -33,6 +62,9 @@ struct vs_dc {
 
 	struct vs_drm_dev *drm_dev;
 	struct vs_chip_identity identity;
+	const struct vs_dc_funcs *funcs;
 };
 
+extern const struct vs_dc_funcs vs_dc8200_funcs;
+
 #endif /* _VS_DC_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_dc8200.c b/drivers/gpu/drm/verisilicon/vs_dc8200.c
new file mode 100644
index 000000000000..db9e1b3cd903
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_dc8200.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ */
+
+#include <linux/regmap.h>
+
+#include "vs_bridge_regs.h"
+#include "vs_dc.h"
+#include "vs_dc_top_regs.h"
+#include "vs_plane.h"
+#include "vs_primary_plane_regs.h"
+
+static void vs_dc8200_bridge_enable(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
+			VSDC_DISP_PANEL_CONFIG_RUNNING);
+	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
+			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
+	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
+			VSDC_DISP_PANEL_START_RUNNING(output));
+
+	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(output),
+			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
+}
+
+static void vs_dc8200_bridge_disable(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
+			  VSDC_DISP_PANEL_CONFIG_RUNNING);
+	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
+			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC |
+			  VSDC_DISP_PANEL_START_RUNNING(output));
+
+	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(output),
+			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
+}
+
+static void vs_dc8200_enable_vblank(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_TOP_IRQ_EN,
+			VSDC_TOP_IRQ_VSYNC(output));
+}
+
+static void vs_dc8200_disable_vblank(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_TOP_IRQ_EN,
+			  VSDC_TOP_IRQ_VSYNC(output));
+}
+
+static void vs_dc8200_plane_commit(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+			VSDC_FB_CONFIG_EX_COMMIT);
+}
+
+static void vs_dc8200_plane_enable_ex(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+			VSDC_FB_CONFIG_EX_FB_EN);
+	regmap_update_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+			   VSDC_FB_CONFIG_EX_DISPLAY_ID_MASK,
+			   VSDC_FB_CONFIG_EX_DISPLAY_ID(output));
+
+	vs_dc8200_plane_commit(dc, output);
+}
+
+static void vs_dc8200_plane_disable_ex(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+			VSDC_FB_CONFIG_EX_FB_EN);
+
+	vs_dc8200_plane_commit(dc, output);
+}
+
+static void vs_dc8200_plane_update_ex(struct vs_dc *dc, unsigned int output,
+				       struct drm_plane_state *state)
+{
+	regmap_write(dc->regs, VSDC_FB_TOP_LEFT(output),
+		     VSDC_MAKE_PLANE_POS(state->crtc_x, state->crtc_y));
+	regmap_write(dc->regs, VSDC_FB_BOTTOM_RIGHT(output),
+		     VSDC_MAKE_PLANE_POS(state->crtc_x + state->crtc_w,
+					 state->crtc_y + state->crtc_h));
+	regmap_write(dc->regs, VSDC_FB_BLEND_CONFIG(output),
+		     VSDC_FB_BLEND_CONFIG_BLEND_DISABLE);
+
+	vs_dc8200_plane_commit(dc, output);
+}
+
+static u32 vs_dc8200_irq_handler(struct vs_dc *dc)
+{
+	u32 irqs;
+
+	regmap_read(dc->regs, VSDC_TOP_IRQ_ACK, &irqs);
+	return irqs;
+}
+
+const struct vs_dc_funcs vs_dc8200_funcs = {
+	.bridge_enable		= vs_dc8200_bridge_enable,
+	.bridge_disable		= vs_dc8200_bridge_disable,
+	.enable_vblank		= vs_dc8200_enable_vblank,
+	.disable_vblank		= vs_dc8200_disable_vblank,
+	.plane_enable_ex	= vs_dc8200_plane_enable_ex,
+	.plane_disable_ex	= vs_dc8200_plane_disable_ex,
+	.plane_update_ex	= vs_dc8200_plane_update_ex,
+	.irq_handler		= vs_dc8200_irq_handler,
+};
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
index 1f2be41ae496..75bc36a078f7 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
@@ -53,12 +53,6 @@ static int vs_primary_plane_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
-static void vs_primary_plane_commit(struct vs_dc *dc, unsigned int output)
-{
-	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
-			VSDC_FB_CONFIG_EX_COMMIT);
-}
-
 static void vs_primary_plane_atomic_enable(struct drm_plane *plane,
 					   struct drm_atomic_commit *atomic_state)
 {
@@ -69,13 +63,8 @@ static void vs_primary_plane_atomic_enable(struct drm_plane *plane,
 	unsigned int output = vcrtc->id;
 	struct vs_dc *dc = vcrtc->dc;
 
-	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
-			VSDC_FB_CONFIG_EX_FB_EN);
-	regmap_update_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
-			   VSDC_FB_CONFIG_EX_DISPLAY_ID_MASK,
-			   VSDC_FB_CONFIG_EX_DISPLAY_ID(output));
-
-	vs_primary_plane_commit(dc, output);
+	if (dc->funcs->plane_enable_ex)
+		dc->funcs->plane_enable_ex(dc, output);
 }
 
 static void vs_primary_plane_atomic_disable(struct drm_plane *plane,
@@ -88,10 +77,8 @@ static void vs_primary_plane_atomic_disable(struct drm_plane *plane,
 	unsigned int output = vcrtc->id;
 	struct vs_dc *dc = vcrtc->dc;
 
-	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
-			VSDC_FB_CONFIG_EX_FB_EN);
-
-	vs_primary_plane_commit(dc, output);
+	if (dc->funcs->plane_disable_ex)
+		dc->funcs->plane_disable_ex(dc, output);
 }
 
 static void vs_primary_plane_atomic_update(struct drm_plane *plane,
@@ -133,18 +120,11 @@ static void vs_primary_plane_atomic_update(struct drm_plane *plane,
 	regmap_write(dc->regs, VSDC_FB_STRIDE(output),
 		     fb->pitches[0]);
 
-	regmap_write(dc->regs, VSDC_FB_TOP_LEFT(output),
-		     VSDC_MAKE_PLANE_POS(state->crtc_x, state->crtc_y));
-	regmap_write(dc->regs, VSDC_FB_BOTTOM_RIGHT(output),
-		     VSDC_MAKE_PLANE_POS(state->crtc_x + state->crtc_w,
-					 state->crtc_y + state->crtc_h));
 	regmap_write(dc->regs, VSDC_FB_SIZE(output),
 		     VSDC_MAKE_PLANE_SIZE(state->crtc_w, state->crtc_h));
 
-	regmap_write(dc->regs, VSDC_FB_BLEND_CONFIG(output),
-		     VSDC_FB_BLEND_CONFIG_BLEND_DISABLE);
-
-	vs_primary_plane_commit(dc, output);
+	if (dc->funcs->plane_update_ex)
+		dc->funcs->plane_update_ex(dc, output, state);
 }
 
 static const struct drm_plane_helper_funcs vs_primary_plane_helper_funcs = {
-- 
2.43.0


