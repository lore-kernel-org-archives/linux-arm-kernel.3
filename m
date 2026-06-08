Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E322CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 02:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCTTyDg8O+LYe31dsdYUzuGSGbt3ApYha6QKkmglNt4=; b=crVgByOSOIr0CgbRoRZh6gH90C
	M6SoAQR3pfq8zmcEqM4mwHHk2gQ04Gc2s817paqRO87h6C9vvlco7IOVIQatr1b/WesflU9SFzx2J
	twLvX0fasKGVQ2n/jU/qHanMPb6cihsLiPCjD+AWLMuUSEXwUE8njlKavsFYf9vbhEUoJM17vd5OM
	wRe8B4dM3bLERe0+ee8AB8F9vRoCBQ6w6qmiI/cGiEig+sPXjzMSx+yNFyvJG8JfSMyCFKh3Zx2v3
	m2oYfLkZ2+jY7XlOPJAFD38u/rY7kyv4qYhmD2N2gbNMlxali0H0GHjTCu1Tk1ZtG3dOJtO+/9j9q
	BPr5Vxcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPnQ-00000002j7v-37CK;
	Mon, 08 Jun 2026 02:33:00 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPnO-00000002j6K-2fhS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 02:32:59 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2bf114b0cf9so32330975ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 19:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780885978; x=1781490778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCTTyDg8O+LYe31dsdYUzuGSGbt3ApYha6QKkmglNt4=;
        b=XXydpm7trnyZSLBb1yzfODdci/jWTUAZRvh2UKUscKkkxi09qHjuVMukO5Ctbil4fC
         Gzx6zECmzxDAW7jBx0B3zJB/4IDjJo8CRCrfovV91edqso2qn2oo4i3hjWS/mQuhbUHt
         SfCm+zIHYdYRlQadZkbJi4UXfs+WbvQUZU0VVLFrqhHfbEHXNT6qsGMGdEIdt3F9hLrn
         7JzpmvFyXUQW3N5/7DymUylFvBCuTvQUPOVu5Wzf34vyZSk6IrSHjq/RkD9o8GU0dnsB
         vG5bCfbZ4pZthvZDeqzh4u8s1mJ2dq4Ip26MGYllXyVxwCQJ87yNSCO4xJYcXfXc8bCo
         bS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780885978; x=1781490778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rCTTyDg8O+LYe31dsdYUzuGSGbt3ApYha6QKkmglNt4=;
        b=lgpQt/HOViQCMHONAbNrlQmtEi5pfyd/LZEB0Toj9+YnbA0XrB4KxWE4BzazF6oJ1l
         Cbi2XIS0GmDNnfbCuvckUee3aIRUcebK0bXd5907+vLpi9DTIoU72xa99JsAsRSDsNJj
         DA5IS8Pr4xOhJ9OsdvA6nFH6Y53hwcZHck3X4k78OKD1Z7k2f6aF4q+pAFElurTD1TWs
         mGk8Xev31YuUMXU9QuyaYn5pra924abSYa0WISwtDKXt5IYRlcq9sttpJ4HxjqKPwsUt
         e1RPZP3p81uvZHWUcggJAyPcMkC53vMoQlEllmr9XJGnFW97kjfQ3rSHzF093ICi4MKQ
         W0HQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0gMsM9ujf891QUktL3yazR7nd7ypDc2XaqUvWg0buCGd0bSzSTlPeqsHvDVb3ch0X3SBWsLTaWXu+kSlRPc68@lists.infradead.org
X-Gm-Message-State: AOJu0YyAFV6p7by5beFhX3UG18uyxXcBYgwwQFli0jlD476AGoF4YpUt
	2wINGc/fYIIIC4hRnKjJGZY5eR+4ctqeGtN1akfCWwLBl6bUpeoaLICx
X-Gm-Gg: Acq92OGrwi1KqPspWADHkdbTLgDa0xaJtqBtjxQIxenAnFiXkdhXt0I7AltU+WqVEsK
	pMyqYijpKTaebUB2nb+zeqyJa0Smtd/3mMYBFYEh+y/4iTasoz9O5wnh4zbgRcd5UCWMM9TWuld
	xZ6N87JM+I8BAFF+BcNO8t34pWDr/aA3oyO6NmF5rJRHcb7qVQ95eUdp+P8L5w7oHU3rt8H8Uer
	e/4f/209WHXkLf81Qsw95pll/iMp3wtD8IOVPjdKogfofPhPBg0kGzArDEO+n7CsTnZRP/icKqf
	MSXopKgaY915ntJmyXXu7Iu+N/7a1ag/xW/qGLYxdYE5XvcouTteFpc3U3G5CArOUgUfKAYw+xM
	UeR0J/VLrDJkLeoT6F1n7hBT91e5Dsl2MGNkdS6QO/Q8rsJdlRkYP3r1PS67LvOjfjFPv0krbJN
	FFJRsAe+xmK275iNQtD3bi50W2eqIEKevXjYXBjxYFpPgW9YjmZuQNUj2czKr85lqZnVcLsTSFE
	w0EvF508mL22snjUiRxeJ8=
X-Received: by 2002:a17:903:3885:b0:2c2:245a:336c with SMTP id d9443c01a7336-2c2245a3654mr104856695ad.14.1780885977664;
        Sun, 07 Jun 2026 19:32:57 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c245dd3b5dsm38143485ad.81.2026.06.07.19.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:32:57 -0700 (PDT)
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
Subject: [PATCH v3 4/5] drm/verisilicon: add Nuvoton MA35D1 DCU Lite display controller support
Date: Mon,  8 Jun 2026 10:32:36 +0800
Message-ID: <20260608023237.305036-5-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608023237.305036-1-a0987203069@gmail.com>
References: <20260608023237.305036-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_193258_695554_0B006678 
X-CRM114-Status: GOOD (  20.49  )
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

The Nuvoton MA35D1 SoC integrates a Verisilicon DCUltraLite display
controller whose register layout differs from the DC8200 in several
important ways:

1. No CONFIG_EX commit path: framebuffer updates use the enable (bit 0)
   and reset (bit 4) bits in FB_CONFIG instead of the DC8200 staging
   registers (FB_CONFIG_EX, FB_TOP_LEFT, FB_BOTTOM_RIGHT,
   FB_BLEND_CONFIG, PANEL_CONFIG_EX).

2. No PANEL_START register: panel output starts when
   PANEL_CONFIG.RUNNING is set; there is no multi-display sync start
   register.

3. Different IRQ registers: DCUltraLite uses DISP_IRQ_STA (0x147C) /
   DISP_IRQ_EN (0x1480) versus DC8200's TOP_IRQ_ACK (0x0010) /
   TOP_IRQ_EN (0x0014).

4. Per-frame commit cycle: DCUltraLite requires the VALID bit in
   FB_CONFIG to be set at the start of each atomic commit (crtc_begin)
   and cleared after (crtc_flush).

5. Simpler clock topology: only 'core' (bus gate) and 'pix0' (pixel
   divider) clocks; no axi or ahb clocks required.  Make axi_clk and
   ahb_clk optional (devm_clk_get_optional_enabled) so DCUltraLite
   nodes without those clocks are handled gracefully.

Add vs_dcu_lite.c implementing the vs_dc_funcs vtable for the above
differences.  The probe now selects vs_dcu_lite_funcs when the
identified generation is VSDC_GEN_DC8000 (DCUltraLite reads model 0x0,
revision 0x5560, customer_id 0x305).

Extend Kconfig to allow building on ARCH_MA35 platforms.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/Kconfig       |  2 +-
 drivers/gpu/drm/verisilicon/Makefile      |  2 +-
 drivers/gpu/drm/verisilicon/vs_dc.c       |  9 ++-
 drivers/gpu/drm/verisilicon/vs_dcu_lite.c | 78 +++++++++++++++++++++++
 4 files changed, 86 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dcu_lite.c

diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisilicon/Kconfig
index 7cce86ec8603..295d246eb4b4 100644
--- a/drivers/gpu/drm/verisilicon/Kconfig
+++ b/drivers/gpu/drm/verisilicon/Kconfig
@@ -2,7 +2,7 @@
 config DRM_VERISILICON_DC
 	tristate "DRM Support for Verisilicon DC-series display controllers"
 	depends on DRM && COMMON_CLK
-	depends on RISCV || COMPILE_TEST
+	depends on RISCV || ARCH_MA35 || COMPILE_TEST
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_CLIENT_SELECTION
 	select DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index 9d4cd16452fa..960af0861dfa 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o vs_drm.o vs_hwdb.o \
+verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o vs_dcu_lite.o vs_drm.o vs_hwdb.o \
 	vs_plane.o vs_primary_plane.o vs_cursor_plane.o
 
 obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c b/drivers/gpu/drm/verisilicon/vs_dc.c
index c94957024189..81a8d9bf85bd 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc.c
+++ b/drivers/gpu/drm/verisilicon/vs_dc.c
@@ -90,13 +90,13 @@ static int vs_dc_probe(struct platform_device *pdev)
 		return PTR_ERR(dc->core_clk);
 	}
 
-	dc->axi_clk = devm_clk_get_enabled(dev, "axi");
+	dc->axi_clk = devm_clk_get_optional_enabled(dev, "axi");
 	if (IS_ERR(dc->axi_clk)) {
 		dev_err(dev, "can't get axi clock\n");
 		return PTR_ERR(dc->axi_clk);
 	}
 
-	dc->ahb_clk = devm_clk_get_enabled(dev, "ahb");
+	dc->ahb_clk = devm_clk_get_optional_enabled(dev, "ahb");
 	if (IS_ERR(dc->ahb_clk)) {
 		dev_err(dev, "can't get ahb clock\n");
 		return PTR_ERR(dc->ahb_clk);
@@ -134,7 +134,10 @@ static int vs_dc_probe(struct platform_device *pdev)
 	dev_info(dev, "Found DC%x rev %x customer %x\n", dc->identity.model,
 		 dc->identity.revision, dc->identity.customer_id);
 
-	dc->funcs = &vs_dc8200_funcs;
+	if (dc->identity.generation == VSDC_GEN_DC8200)
+		dc->funcs = &vs_dc8200_funcs;
+	else
+		dc->funcs = &vs_dcu_lite_funcs;
 
 	if (port_count > dc->identity.display_count) {
 		dev_err(dev, "too many downstream ports than HW capability\n");
diff --git a/drivers/gpu/drm/verisilicon/vs_dcu_lite.c b/drivers/gpu/drm/verisilicon/vs_dcu_lite.c
new file mode 100644
index 000000000000..11ef57d5ebaa
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_dcu_lite.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Joey Lu <yclu4@nuvoton.com>
+ */
+
+#include <linux/regmap.h>
+
+#include "vs_crtc_regs.h"
+#include "vs_dc.h"
+#include "vs_primary_plane_regs.h"
+
+static void vs_dcu_lite_bridge_enable(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
+			VSDC_FB_CONFIG_RESET);
+}
+
+static void vs_dcu_lite_bridge_disable(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
+			  VSDC_FB_CONFIG_RESET);
+}
+
+static void vs_dcu_lite_crtc_begin(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
+			VSDC_FB_CONFIG_VALID);
+}
+
+static void vs_dcu_lite_crtc_flush(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
+			  VSDC_FB_CONFIG_VALID);
+}
+
+static void vs_dcu_lite_crtc_enable(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
+			VSDC_FB_CONFIG_ENABLE);
+}
+
+static void vs_dcu_lite_crtc_disable(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
+			  VSDC_FB_CONFIG_ENABLE);
+}
+
+static void vs_dcu_lite_enable_vblank(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_DISP_IRQ_EN,
+			VSDC_DISP_IRQ_VSYNC(output));
+}
+
+static void vs_dcu_lite_disable_vblank(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_DISP_IRQ_EN,
+			  VSDC_DISP_IRQ_VSYNC(output));
+}
+
+static u32 vs_dcu_lite_irq_handler(struct vs_dc *dc)
+{
+	u32 irqs;
+
+	regmap_read(dc->regs, VSDC_DISP_IRQ_STA, &irqs);
+	return irqs;
+}
+
+const struct vs_dc_funcs vs_dcu_lite_funcs = {
+	.bridge_enable		= vs_dcu_lite_bridge_enable,
+	.bridge_disable		= vs_dcu_lite_bridge_disable,
+	.crtc_begin		= vs_dcu_lite_crtc_begin,
+	.crtc_flush		= vs_dcu_lite_crtc_flush,
+	.crtc_enable		= vs_dcu_lite_crtc_enable,
+	.crtc_disable		= vs_dcu_lite_crtc_disable,
+	.enable_vblank		= vs_dcu_lite_enable_vblank,
+	.disable_vblank		= vs_dcu_lite_disable_vblank,
+	.irq_handler		= vs_dcu_lite_irq_handler,
+};
-- 
2.43.0


