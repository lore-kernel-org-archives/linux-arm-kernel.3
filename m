Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CFFCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 05:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGibKSdQf3IcDSU8T6R8Cil+pcTsme1TCnBNNHxsWpo=; b=0pD9LLlAxVA/eH1tw7ZSJ14qaA
	Uqf0d8SvU2+xoHlKe0QHp7leJRQdWRLcQW3aDgjM9UOrPogucP9NVSsxvmueQrLp50CmeE0bAmReO
	Ij3Eek8rkVP4p8juENvVScBmX2V9kGRuiqqeqC3Ez6aOzPO7avBwW2i2t8iJIkO4ugZP3z5Ogg9IF
	znoa3bC7C4RXH3HNtkdJbHST+o2cE5xa5kt2OtmcI+cdRROQchvR3rXOzZVVeL6rvnWem/L7Ux0bI
	jY7BBD/ceGT2/7FD3EC10WDGqx91boocX3v9ACZZtxeedlYqIbXdy/KkYJnzmWqJjYJmdq6HzRknM
	Xw2flr7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDNK-00000000F6w-3vM4;
	Tue, 19 May 2026 05:52:18 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDNF-00000000F3r-1Aiz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 05:52:14 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-83ea84df1d0so870327b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 22:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779169931; x=1779774731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGibKSdQf3IcDSU8T6R8Cil+pcTsme1TCnBNNHxsWpo=;
        b=FNCeUJeRlHgGcg0M+1mfmCBVq0fltHf4qR/Pq63vlMj9h7Ljlbpb3b8x/hf9AdImul
         UwSuIQSkA+ARBjIVoXwM3+pI27uGGQet1e7fh5zaO4okR8BtKdj8jCIyWfeqY3lHc63F
         NQnfxj3e+yttf93Gu3yJXzcNaIV7YFw1yN5cyRSBT+LZf33gWFoZaIt7EfxFxm9z7/td
         bGHqwoWQU4HyP6VHqY+B10FzkFG7nYw8yP34B2tFAnJBRy7O/T2AripniTH9mGiAorD9
         mLdUs5h0OrsDrGD1f+sDUADIftv3eNfMXpbLq1PBvjL0K+3mmyMEWoUYIPi1zDL+C2LH
         ko7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169931; x=1779774731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VGibKSdQf3IcDSU8T6R8Cil+pcTsme1TCnBNNHxsWpo=;
        b=pe3a3GeKQWoQ3HnH/1WZOXHlIEflKBlcEacvB5ZmSMYgnhOOtu22snnWYEBARUKJa1
         69BOe2mIkVByM4J8+j0xJArYFkn44sPC2KRea+WSJrhmkk4+jPYbVHWs+FR8FN/tV3JH
         8a2KyVuN2yglQTn+CGpgBR4CJimPKDo/ivyvYhH6SPjSJ7wT/XkRcJoxRe6mFaijg6fh
         89Lg0V86X99obf+SmIO5azM9bu42hPrZLArDERi19YN9ie9k2Bb40vkDWZ3T/MZA1gaa
         Bf4kEdYbLVOuDQ/SPzrb0E900miHKU9sIUaXYR/NhQUnFRM/iqbiQH4KLBrrnsInTlMw
         wx8w==
X-Forwarded-Encrypted: i=1; AFNElJ/X/Q25MfbPOEzfJSuelxdbPW9aTNIA1Ky/wQS//Bvoc/XVsiBIUho3qVYPTzCbdbiJgYV/Z6MYDwa5gG5GWK1u@lists.infradead.org
X-Gm-Message-State: AOJu0YwmoIEGCE9qyXUrpBPkI+bdeuYk8cLvuZGazpZ/vwZS4Pod10pb
	IWXMAKWaMg2TOg5GwGKRAf6zjRQT/q8u9ncCqgXCaxm8N0GH99Mgl56w
X-Gm-Gg: Acq92OG5eCdSDVhuSTyJAAiYkHOul1kRFTXJMVv0uIDIvjb0iE7LWzqHjQ93aoDd8oB
	1uZLo9l137dlxiVwjf7n8STXmDT7BT00kO1l0izM5b8xYRb+tjP7zcSvXhY3twFERFim9Tt4Ntz
	D+5gGrqB/WYrU7kSNBAnoIUzYnSW8vK1y0YGMQ5ILSEf2quqxze27JkwJnBayBTNrXKYGDhC8Mg
	kBmoVgjTfXShxJgSqa4OXq8PYwzpHAqw8T759prNLdfK4kIjnoSzRtqxmmh2guodamzXW4bHD4M
	w9TVLPQ7s4Jc8ZGeDpILj/x30qSOcpdga4+gEL+5QiWKr861LoS3UnMrbgQpAV4MxcZWi0sCkhX
	UPUawWC2UrVpYfyr8mxlvJQGp4T/0WFUqfwwBu2TRE8e10X5K+/A78P/KYbyXLrlumflNGtvvvu
	2mLHMKKRZhC/EIaFgP6mJ5wMjvYl+DAH+BxZYMAwfO2CDBNE09YGmwl1q86y152FBzHZrBYVCcW
	oYaycNBESxt
X-Received: by 2002:a05:6a00:4304:b0:82c:d7c4:4c5c with SMTP id d2e1a72fcca58-83f33d0399bmr17632560b3a.20.1779169931435;
        Mon, 18 May 2026 22:52:11 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f8b9c2ea5sm2641252b3a.13.2026.05.18.22.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:52:11 -0700 (PDT)
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
Subject: [PATCH v2 4/4] drm/verisilicon: add Nuvoton MA35D1 DCU Lite display controller support
Date: Tue, 19 May 2026 13:51:09 +0800
Message-ID: <20260519055114.1886525-5-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519055114.1886525-1-a0987203069@gmail.com>
References: <20260519055114.1886525-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_225213_331960_3A574F41 
X-CRM114-Status: GOOD (  23.00  )
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

The Nuvoton MA35D1 SoC integrates a Verisilicon DCU Lite display
controller.  While its register layout is broadly similar to the DC8200,
several differences require dedicated hardware ops:

1. No CONFIG_EX commit path: framebuffer updates use enable (bit 0) and
   reset (bit 4) bits in FB_CONFIG instead of the DC8200 staging registers
   (FB_CONFIG_EX, FB_TOP_LEFT, FB_BOTTOM_RIGHT, FB_BLEND_CONFIG,
   PANEL_CONFIG_EX).

2. No PANEL_START register: panel output starts when
   PANEL_CONFIG.RUNNING is set; no multi-display sync start register
   is used.

3. Different IRQ registers: DCU Lite uses DISP_IRQ_STA (0x147C) /
   DISP_IRQ_EN (0x1480) versus DC8200's TOP_IRQ_ACK (0x0010) /
   TOP_IRQ_EN (0x0014).

4. Per-frame commit cycle: DCU Lite requires the VALID bit in FB_CONFIG
   to be set at the start of each atomic commit (crtc_begin) and cleared
   after (crtc_flush).

5. Simpler clock topology: only "core" (bus gate) and "pix0" (pixel
   divider) clocks; no axi or ahb clocks.  Make axi_clk and ahb_clk
   optional (devm_clk_get_optional_enabled) so DCU Lite nodes without
   those clocks are handled gracefully.

Add vs_dcu_lite.c implementing the vs_dc_funcs vtable for the above
differences.  After chip identity detection, vs_dc_probe() now selects
vs_dcu_lite_funcs when the identified model is VSDC_MODEL_DCU_LITE
(model register reads 0, revision 0x5560, customer_id 0x305).

Extend Kconfig to allow building on ARCH_MA35 platforms.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/Kconfig       |  2 +-
 drivers/gpu/drm/verisilicon/Makefile      |  2 +-
 drivers/gpu/drm/verisilicon/vs_dc.c       |  9 ++-
 drivers/gpu/drm/verisilicon/vs_dc.h       |  1 +
 drivers/gpu/drm/verisilicon/vs_dcu_lite.c | 78 +++++++++++++++++++++++
 5 files changed, 87 insertions(+), 5 deletions(-)
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
index f4fbd9f7d6a2..bf88f627e65c 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o vs_drm.o vs_hwdb.o vs_plane.o vs_primary_plane.o
+verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o vs_dcu_lite.o vs_drm.o vs_hwdb.o vs_plane.o vs_primary_plane.o
 
 obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c b/drivers/gpu/drm/verisilicon/vs_dc.c
index c94957024189..77bc63c629f7 100644
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
+	if (dc->identity.model == VSDC_MODEL_DC8200)
+		dc->funcs = &vs_dc8200_funcs;
+	else
+		dc->funcs = &vs_dcu_lite_funcs;
 
 	if (port_count > dc->identity.display_count) {
 		dev_err(dev, "too many downstream ports than HW capability\n");
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h b/drivers/gpu/drm/verisilicon/vs_dc.h
index 45172c1a525c..d77d4a1babdf 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc.h
+++ b/drivers/gpu/drm/verisilicon/vs_dc.h
@@ -66,5 +66,6 @@ struct vs_dc {
 };
 
 extern const struct vs_dc_funcs vs_dc8200_funcs;
+extern const struct vs_dc_funcs vs_dcu_lite_funcs;
 
 #endif /* _VS_DC_H_ */
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


