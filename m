Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082A4C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NmzVhnhLbLcNlB7eM5nEQlH5gSc4bZ2/+8H5Qa6R9LQ=; b=YJ1JnhQjN2sXa0trBonv0fc6bK
	lkvI1+xVEXYOkI/UlDWMXDUEGD2ZWC4aM7vXeDJMz2yTlFkWELM8dBqNdxHhqcw8m3d78BPRDuLUy
	vZUbl4sZD7DrHTL/CxIFQxJNjWihfK0e/VO6Z0cPR/zqYgeUTZ4h/B6D7XnW1NAL8RiUlk9kcMjYt
	kFeC+TNPmRMxsplVkyHyZcN4lzk2mVZ/wnunS+nraajW/+dkNfBbUpNLN+qrAgWCizp/GyxdxXsz5
	+BiclAkILR2V6RzcqiHjZoyxjC5QofLfQ3w2sxucZX6CgkJVQyrkj3WjTenE02ggdogDOOCZ5VivM
	KGR/aH4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3s8X-00000008ZcM-0qlA;
	Tue, 08 Sep 2026 09:29:05 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3s8V-00000008ZaQ-3CkN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:29:04 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2d942c7cc2fso36318475ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 02:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859743; x=1789464543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NmzVhnhLbLcNlB7eM5nEQlH5gSc4bZ2/+8H5Qa6R9LQ=;
        b=oUvwOZ/ao2Vv9z46ox9Q+l7opZS01xtK8kgDTT0roKzQB3PDg7eBHqVMa/+XBd7UHp
         PLirox/LVsgBN8FbYnwEgSZlsWqYp8SuaCr1zTvhGYPBf0QAVEg+7X/DS+jLzN//c4zI
         DM4eRa65RqaiykeGAoQof8V3oNSVvo1wu35MbHZP9lU6vf6EyvXbrqYekQ96VUU3TntM
         lnHgJ0TNvwWbf5hGTJNTzj3EdmyTrtf9y9DKTDor/tHz0TnOFs+ehdTuyJtO2a2ZaKUy
         0dLrZmzTHVyzVoUJaCdvWhNGpi3A9Ioo2TaOfpeb+roEo3tkinl/SSiJIclJhGIUpqE0
         jOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859743; x=1789464543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NmzVhnhLbLcNlB7eM5nEQlH5gSc4bZ2/+8H5Qa6R9LQ=;
        b=aXrKxehYhE/1jpeEZ/ekDYM31eqWQPiVRT/UeWseR8C0PsxAtWNn9ZduwjxIZuBkZG
         5K1zOcgZwGBnQKNizrXeV8m7Vy/CB7Ac2IN+nGlQ0ggVaV8LQ+57oWwsv/GjdP6Apo/E
         N/xw803r92DKM52C2Wgee5HDlwG+Ju8Jw3uWf/Ir54vasIJ8O/DmgO8zYaDRbvwczSdE
         eqx+hZ2IDvw3y7ldkP5LX1Hgmx5IIBZVVrpjj9enH1qFUjkZRYrTFDpq/ITPC+uiOgJk
         k9kCwiwjwGAVmjdLdvqveeCEmCx9K9YkTzEfhJALkd7dcQaK4Nv9HOeyHD7sKfZrgfCo
         LgBw==
X-Forwarded-Encrypted: i=1; AKwUvBxb9fzsG1m7ywyqpvifTAUEw16jevOU/nrBY/+KVt7a06bEEBd0d0VnNjjxVneEwnEi6DtQGEC0QXQUPkWGrz+O@lists.infradead.org
X-Gm-Message-State: AFuF++kPy3Sp9ksqufpkSRK3nHaAaLoLFNlRTLKQ1JK71qAewgEawr7w
	s0JrOwsKpr1oLqS5WbuXjLUg5ZPClxBMFoXBZL1eCu2HwwJ+ANosGG+W
X-Gm-Gg: AYBFou3xB1srss1jJWRamFqdPd0DjVeZFnitMAzpVSgNYX7rawvmGchl1i63C7iZleX
	kYVv/MKplDr7DEK3Qth9Y9UmcTwyQdIeVXldvdOeuGfhbGpOBBv8t/+chDI5iURyqt1ydh9Dezm
	09ifPOfRqqhbTdknBNshgc/aUZ1LYgr3B7Kp2KgVfBy0m863aXtvfwhiuS/mKDsnsTO3CXUoDzM
	EEMd9Ezrm44HN1D23nVqMrop/+rc448sdWXqltAftiZAnveU2a/kzM/QSHtnWNxCx/voB62bk5X
	EKbwK5+e9sRxvG3iwflNeUFYa6d5ckxj9AuhIGjXMKDB9j+1K5NPp/S0FbQDf8m6QaW5wFZpo1Q
	kIVQASlUlSeidVpxpTW4ysiFiAGBk8ENT3ALW9r+Bww1OxTXytiraMYRwuybbmQQDW7cLxF0YmQ
	PXqKmVieqRRRMXI3Ujsu3fJcSLQC6Av2mnYPi6uoifkTj/5alglGTBdVLue9hnWs1ZFYo06C9XQ
	yGnaL7b36xtBi8bSnG48eSb6NjRUv43ngUfyL7QY+7ccqAS0wlr
X-Received: by 2002:a17:90a:c10e:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39b2622b3afmr39437638a91.18.1788859742702;
        Tue, 08 Sep 2026 02:29:02 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm32109846a91.9.2026.09.08.02.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:29:02 -0700 (PDT)
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
Subject: [PATCH v6 4/6] drm/verisilicon: add DC8000 (DCUltraLite) display controller support
Date: Tue,  8 Sep 2026 17:28:38 +0800
Message-ID: <20260908092840.225220-5-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908092840.225220-1-a0987203069@gmail.com>
References: <20260908092840.225220-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_022903_813613_0B75A9A5 
X-CRM114-Status: GOOD (  22.73  )
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


