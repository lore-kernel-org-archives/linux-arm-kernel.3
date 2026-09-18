Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010A8C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 03:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toYt9rYplhPBNw8uYg7TjR1uc/+s1ghvN6xnP+MGyco=; b=mTmboWLE1hUsieGlwSwdK6+1GL
	6JBt15aN83sxopewX/IPfB8llAgUiI70h2g0L7o1hYoZENdPY0+8nPHCMWI7WkowtUck9Ir/4UTHk
	kQC+KV37CrG8sW5j86eueAFDnzkQs2+7B7U59zY3CHK5nv2q1hmFAxJGGpt9ajM96uB4t9Cfq8b11
	xieObQPKZprOPEPynnctr2qQOJlpAwTy0NbOBZb12sMxgkyh3qfbrwE1feiwRANyk+mYPg+JH4q/G
	LMe0dj10/CPSJdOFk1pL0erzec7zmiYUCOJ6zYElczV8F8EqKzs4OqLdiuN2af08MipZ399IbFZoP
	GzdM4f0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OrT-0000000DM8B-0XAx;
	Fri, 18 Sep 2026 03:02:03 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OrE-0000000DM26-33Le
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 03:01:49 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-39b5b07ec78so187308a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 20:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700508; x=1790305308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=toYt9rYplhPBNw8uYg7TjR1uc/+s1ghvN6xnP+MGyco=;
        b=lFfSmqAGgnEjkw5cDDZGLWp7z/NeiSGZ2lZEwBUu+M6LmP+auK5yD4SXJO9VXJoGOB
         8BaIEtyrJw1PGlTxQ5WzoNsS5BjZbNRPhsYNiD04Kr6Keg+n89hODOYqYPXczVz0Df0a
         AxDlU5FphRFZ9QZredCHp+UChHtQupegyiB7a/YoVU1aqAMfqMR6mtG/6CbhAcrUQuKk
         oIgS/e6fWUz4qQwlILWqSoP5BfBoA6I4nfGljLi19+gEX5SaShkSwgMsWt019uAVxZjr
         /56orj5CZp/BDlTMBUPvUesVRag4lzfqEm6ngVqe+OLNye1NqKTenv7+wWEey4Ri6Y8J
         7DYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700508; x=1790305308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=toYt9rYplhPBNw8uYg7TjR1uc/+s1ghvN6xnP+MGyco=;
        b=oa0rWESOwa3C/pjeW/yeS7qAALR0N1kaLcM92LLWzPFK7olgYxJyQ4SONmdrHm4GZZ
         kRk3T8sRQF27M05s2Tje/3SyXYsSwINQt9wSUSywHMOGh2EMsOdIzVGXqrbHYNSqwx/u
         2Z9MUOK2IbO6cWz1gJWn9no43FQpOlteGP2E9qEtuLgYSdte8JNykzTEfalBFbyXFdFE
         efdKnB2ymCPjYvlOrf/CWbPK9e/S74Tcrsyjk81d2138nF8ps91PZqng6SqbfqWI+nQa
         u/YrnGJWvwqDZyBh1kITUOOWKs8at5ZSHbqwxuQQXyew2u43SRN+HDNyEML0VWymeD95
         NZRA==
X-Forwarded-Encrypted: i=1; AKwUvBxrT48G5SiyWL4KqyJOjJTqSCFaIVExE36pROH0Tumbe2U050GFvlXb4qxrA5e3qvSWu6es4XZ3GsZF8MtNrENe@lists.infradead.org
X-Gm-Message-State: AFuF++lgGk+uYeYRfE6OucNok9gmumcZNRKEcIm6i5dE7fUmOxzH9t7c
	2yLAB6QvPVRtiI1njGMV1FTFlPEmOLRYLzlNLS7/05OVy3VNpEYrxRmh
X-Gm-Gg: AYBFou1QdlEuZSXyPm93Q2ijfPOIjPwDapmeoGDGulWyxr7nrwvl/eDH71JOOXBTrtA
	NBz+zzcI1Tit0v4WaVV2/jOsOrWyLh7GNnmsFy3maNIBoIHQ7eLZbRadhcehxJGWVQKd6bazfE2
	8jfo9dMPztEbzAo6fu7TC6lBhg9o0YnPF+X2Hjs/kBml/YlZEGB21CINGhhxjhgy1d6j8tHpBHA
	jCeoBrwUg1CqEM2h48z33g6d5cjzPtvqzQiLRUpVjLjyt5rQRPVvQXiK7gfSnBynSy1sXtoZ6W2
	lV2zTiY4pC9hrQmgkofZpZDWvZGKfcKnsb4O0kYmUgVpDBWiEd/aRTF9idEm7K91pVHD2XfqgyK
	Z785yIWA52dwvmoQsPd2x4q1tUO0Htj7gRRbaByhk+rjNyPJmhp/CPgPgZ+uctq7yarFCjLGToZ
	Ql5ZBNF70XEHDa4PcPguYpXhtwbXk3tItTRQc1dJnVOPRW0OtT/k7a4reoGusOQotKJTvwEShGA
	OztBRQJjbkgAajHuEkw+N2sdqOJ43iqLO7FbImLdpf4DrYyENqOF0Yvs74zvVM=
X-Received: by 2002:a17:90b:52cf:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-39e54bd0941mr2537352a91.15.1789700508027;
        Thu, 17 Sep 2026 20:01:48 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362e9402sm7969141a91.15.2026.09.17.20.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:01:47 -0700 (PDT)
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
Subject: [PATCH v7 4/7] drm/verisilicon: add DC8000 (DCUltraLite) display controller support
Date: Fri, 18 Sep 2026 11:01:22 +0800
Message-ID: <20260918030125.315978-5-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918030125.315978-1-a0987203069@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_200148_846124_9E137117 
X-CRM114-Status: GOOD (  21.90  )
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

The Verisilicon DC IP family also ships in a DCUltraLite (DC8000
generation) configuration that lacks the DC8200's CONFIG_EX staging
registers and PANEL_START sync register, and exposes its VSYNC
interrupt through a differently laid out status/enable register pair.

Add a vs_dc_funcs implementation for the DC8000 generation in
vs_dc8000.c: framebuffer updates are latched directly through
FB_CONFIG's enable/reset/valid bits instead of a staging commit, panel
output starts as soon as PANEL_CONFIG.RUNNING is set with no separate
sync register to arm, and the VSYNC interrupt is acknowledged through
DISP_IRQ_STA/DISP_IRQ_EN.  Select this vtable in the probe path based
on the chip identity's generation field.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/Makefile    |  2 +-
 drivers/gpu/drm/verisilicon/vs_dc.c     |  5 +-
 drivers/gpu/drm/verisilicon/vs_dc.h     |  1 +
 drivers/gpu/drm/verisilicon/vs_dc8000.c | 92 +++++++++++++++++++++++++
 4 files changed, 98 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8000.c

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index 9d4cd16452fa1..d2fd8e4dff242 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o vs_drm.o vs_hwdb.o \
+verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o vs_dc8000.o vs_drm.o vs_hwdb.o \
 	vs_plane.o vs_primary_plane.o vs_cursor_plane.o
 
 obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c b/drivers/gpu/drm/verisilicon/vs_dc.c
index 9729b693d360e..3e9e2c0264f5d 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc.c
+++ b/drivers/gpu/drm/verisilicon/vs_dc.c
@@ -134,7 +134,10 @@ static int vs_dc_probe(struct platform_device *pdev)
 	dev_info(dev, "Found DC%x rev %x customer %x\n", dc->identity.model,
 		 dc->identity.revision, dc->identity.customer_id);
 
-	dc->funcs = &vs_dc8200_funcs;
+	if (dc->identity.generation == VSDC_GEN_DC8200)
+		dc->funcs = &vs_dc8200_funcs;
+	else
+		dc->funcs = &vs_dc8000_funcs;
 
 	if (port_count > dc->identity.display_count) {
 		dev_err(dev, "too many downstream ports than HW capability\n");
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h b/drivers/gpu/drm/verisilicon/vs_dc.h
index 825f5dd6bf174..ac96ad7011994 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc.h
+++ b/drivers/gpu/drm/verisilicon/vs_dc.h
@@ -66,5 +66,6 @@ struct vs_dc {
 };
 
 extern const struct vs_dc_funcs vs_dc8200_funcs;
+extern const struct vs_dc_funcs vs_dc8000_funcs;
 
 #endif /* _VS_DC_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_dc8000.c b/drivers/gpu/drm/verisilicon/vs_dc8000.c
new file mode 100644
index 0000000000000..df7bd5bdd7f2a
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_dc8000.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Joey Lu <yclu4@nuvoton.com>
+ */
+
+#include <linux/regmap.h>
+
+#include <drm/drm_print.h>
+
+#include "vs_crtc_regs.h"
+#include "vs_dc.h"
+#include "vs_drm.h"
+#include "vs_primary_plane_regs.h"
+
+static void vs_dc8000_panel_enable_ex(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
+			VSDC_FB_CONFIG_RESET);
+}
+
+static void vs_dc8000_panel_disable_ex(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
+			  VSDC_FB_CONFIG_RESET);
+}
+
+static void vs_dc8000_crtc_begin(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
+			VSDC_FB_CONFIG_VALID);
+}
+
+static void vs_dc8000_crtc_flush(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
+			  VSDC_FB_CONFIG_VALID);
+}
+
+static void vs_dc8000_crtc_enable_ex(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
+			VSDC_FB_CONFIG_ENABLE);
+}
+
+static void vs_dc8000_crtc_disable_ex(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
+			  VSDC_FB_CONFIG_ENABLE);
+}
+
+static void vs_dc8000_enable_vblank(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_DISP_IRQ_EN,
+			VSDC_DISP_IRQ_VSYNC(output));
+}
+
+static void vs_dc8000_disable_vblank(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_DISP_IRQ_EN,
+			  VSDC_DISP_IRQ_VSYNC(output));
+}
+
+static u32 vs_dc8000_irq_ack(struct vs_dc *dc)
+{
+	u32 hw_irqs, unified = 0, known = 0;
+	unsigned int i;
+
+	regmap_read(dc->regs, VSDC_DISP_IRQ_STA, &hw_irqs);
+
+	for (i = 0; i < VSDC_MAX_OUTPUTS; i++) {
+		known |= VSDC_DISP_IRQ_VSYNC(i);
+		if (hw_irqs & VSDC_DISP_IRQ_VSYNC(i))
+			unified |= VSDC_IRQ_VSYNC(i);
+	}
+
+	drm_WARN_ONCE(&dc->drm_dev->base, hw_irqs & ~known,
+		      "Unknown hardware IRQ bits: %#x\n", hw_irqs & ~known);
+
+	return unified;
+}
+
+const struct vs_dc_funcs vs_dc8000_funcs = {
+	.panel_enable_ex	= vs_dc8000_panel_enable_ex,
+	.panel_disable_ex	= vs_dc8000_panel_disable_ex,
+	.crtc_begin		= vs_dc8000_crtc_begin,
+	.crtc_flush		= vs_dc8000_crtc_flush,
+	.crtc_enable_ex		= vs_dc8000_crtc_enable_ex,
+	.crtc_disable_ex	= vs_dc8000_crtc_disable_ex,
+	.enable_vblank		= vs_dc8000_enable_vblank,
+	.disable_vblank		= vs_dc8000_disable_vblank,
+	.irq_ack		= vs_dc8000_irq_ack,
+};
-- 
2.43.0


