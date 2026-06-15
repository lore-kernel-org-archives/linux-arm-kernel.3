Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBABACD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 06:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCnGy4eyt7vZGs3J5YesXgpvuGxv5PNGr2RCRubwVqI=; b=s+qZKjIvf+TAGx55Re19Wkc/HF
	7jooMKpI9KIzQbzS9dh8YUu/D/SaBH1/wtH7j7gjs/ZGSv1kCJLuDRFFIy6jHHH78ErQdqvDK/bmg
	o3Gnt/ZRBTEV4Gw9QFfH1Um1fSilkt7WZRSOG9c3IlGhS72quXr5C2AvlBuMWxOJcvEkJG45kj8Dp
	WoWltVKuA+fkDxcG5xgaIQCx/ALqd6/nSWijYAPuEV1vTB85Uvp5Wbu7tAjl5CT7h32DP4K3tDfNz
	nLakAUQDvJhbT9q4BVN8ichuwOUPbEHdEsnHOJj7G0k96Al9r69oJahTJRQXNmscNyOyIb4tu2Tuc
	pkg/JhuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ19R-0000000Di5F-14IU;
	Mon, 15 Jun 2026 06:50:29 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ19O-0000000Di2e-1lHq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 06:50:27 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-304cf518c9dso4665157eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 23:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781506225; x=1782111025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCnGy4eyt7vZGs3J5YesXgpvuGxv5PNGr2RCRubwVqI=;
        b=RNj5vrlxfKrh0QFfzlNIoQTZbYsis9nZGLOmPrv3ZTCIp0cWRXlAkHzwxrUgvRRcoV
         ou5X0TgKveNZ8yuiRdFzFvQFy1OiMjGY8hdIedXKf6DXdILvQFHYuclsHWIF/JsLv4/f
         xwYyW6RPvJuom6gAwNhOKWuk875oophItUjdTcFqqMN9oDTnxoQN+SyMJ7MoYrnrD/CK
         xAsZXo3snb/dkcllxZ5g3ut21TKyjoUTu1yQCneFeq8ARCIsoTwa7NrHQIzkynAInC1q
         svQf/7qwYPmLkOYQH+dbm94hUBYfEaWtgiXseJlr9hPSlOEqLYxNh1XWEAHvMCq6MUR1
         eoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781506225; x=1782111025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RCnGy4eyt7vZGs3J5YesXgpvuGxv5PNGr2RCRubwVqI=;
        b=oFuF9ROWrI7porBTnpLJGGh0WFXY73nEomPJb/SSXhc6rHHIf1pNOsDDZi0cL9LIAt
         wk+YK70q5quCnaW/s7A4Owufg9jUnID7bHgLN1yjK1LY1gJLO18WXVzIVJuSik/1b7VN
         dRizltFLrJBQwwI/SyU4aZlk9IxD/AOAvLEzGPtZm4KGvkZU9OvnU4wSqxqhFG30A/xy
         WA6Qu9IgoEgRgaWyliUxQ2S7uPObfPWoenwZNyxY6rKWV+2LQj7dn6kUxMC6sEQumCuK
         Tut9VOR8a7V4wE+BKxEVlRErcb0h4aEPSKqSWMU0A9SEjU2rEAzdqX3IgHKvYWnxWMbf
         Hcrw==
X-Forwarded-Encrypted: i=1; AFNElJ/5VohWsfLZqLVQiQBBdG4+5+tfrKMEM5sJZWFH+hE9jhPbcllyEr51Y5DNNftl8b67Ki73ZwsikefAUEGEaRiZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzowVD56zanpENV1AMy0IbE0gIPWXQStZML12P4rfTLs+Z1fwtc
	wxy04V3vUUXGuxBoKqxjqLUfxSB5xYaZ45Z4OEEUSGZ3dAUfPqflNSnp
X-Gm-Gg: Acq92OGs5OSvzTldTbr2swYS4SHjHS9kriZNLnALs/8MgvOPlwzfVqAyLpvdAavOrYs
	QrT/2S8hZCqUCqTTBmd1IJQ/t7KU/8EtCgkA24nZKLI7C8LBnETgpvWQ/D6L0Ju8VWP28kIcpPp
	OlzOEYZd27Zq3IQj+6cGL8lQinoFERZ21+nXw+y/rO5Kj0jP8cXZanoRjNiIM+S1xu+ptd8BsK4
	SfoR7DEIw00NvoKY8iZ8DGlr9dAR+WZa6VS/fE+65X+86XiyVssnoly2pEaXW+lD3baWbF0WTvo
	65Sf0pLpZR0ZUW2l/zj/hatjwGglN0BV5RvcW1iyfP9DG/FUfz/coZZzr9ttsNEw9bi48G0QcJ7
	cgn1I0so7Y1GlO2JPS+cbeWNG6GqumT6qIe9XGnmIctv8rsgzy0XJABuD+eDu2DiwNKFrAHpzGb
	FosSvEe39xeDUaTvBiADYEm9YL72iVpxlc8BTgupfrsIDt7pqYpsMrnrxFEpksLxHEJJLcfhfNw
	tEBChe8wy9t
X-Received: by 2002:a05:7300:542:b0:2ea:e93a:ff9b with SMTP id 5a478bee46e88-30936a4b1bfmr5180127eec.13.1781506225470;
        Sun, 14 Jun 2026 23:50:25 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb9a2e7sm13516812eec.30.2026.06.14.23.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:50:25 -0700 (PDT)
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
Subject: [PATCH v4 4/6] drm/verisilicon: add DC8000 (DCUltraLite) display controller support
Date: Mon, 15 Jun 2026 14:50:01 +0800
Message-ID: <20260615065003.76661-5-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615065003.76661-1-a0987203069@gmail.com>
References: <20260615065003.76661-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_235026_465539_365727E9 
X-CRM114-Status: GOOD (  20.51  )
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
   ahb_clk optional (devm_clk_get_optional_enabled) so DC8000 nodes
   without those clocks are handled gracefully.

Add vs_dc8000.c implementing the vs_dc_funcs vtable for the above
differences.  The probe now selects vs_dc8000_funcs when the identified
generation is VSDC_GEN_DC8000 (DCUltraLite reads model 0x0,
revision 0x5560, customer_id 0x305).

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/Makefile    |  2 +-
 drivers/gpu/drm/verisilicon/vs_dc.c     |  9 ++-
 drivers/gpu/drm/verisilicon/vs_dc.h     |  1 +
 drivers/gpu/drm/verisilicon/vs_dc8000.c | 78 +++++++++++++++++++++++++
 4 files changed, 86 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8000.c

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index 9d4cd16452fa..d2fd8e4dff24 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o vs_drm.o vs_hwdb.o \
+verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o vs_dc8000.o vs_drm.o vs_hwdb.o \
 	vs_plane.o vs_primary_plane.o vs_cursor_plane.o
 
 obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c b/drivers/gpu/drm/verisilicon/vs_dc.c
index 9729b693d360..9499fffbca58 100644
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
+		dc->funcs = &vs_dc8000_funcs;
 
 	if (port_count > dc->identity.display_count) {
 		dev_err(dev, "too many downstream ports than HW capability\n");
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h b/drivers/gpu/drm/verisilicon/vs_dc.h
index 544e1a37065b..5218e8cf63e2 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc.h
+++ b/drivers/gpu/drm/verisilicon/vs_dc.h
@@ -66,5 +66,6 @@ struct vs_dc {
 };
 
 extern const struct vs_dc_funcs vs_dc8200_funcs;
+extern const struct vs_dc_funcs vs_dc8000_funcs;
 
 #endif /* _VS_DC_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_dc8000.c b/drivers/gpu/drm/verisilicon/vs_dc8000.c
new file mode 100644
index 000000000000..be0c0d7baf52
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_dc8000.c
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
+static void vs_dc8000_crtc_enable(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
+			VSDC_FB_CONFIG_ENABLE);
+}
+
+static void vs_dc8000_crtc_disable(struct vs_dc *dc, unsigned int output)
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
+	u32 irqs;
+
+	regmap_read(dc->regs, VSDC_DISP_IRQ_STA, &irqs);
+	return irqs;
+}
+
+const struct vs_dc_funcs vs_dc8000_funcs = {
+	.panel_enable_ex	= vs_dc8000_panel_enable_ex,
+	.panel_disable_ex	= vs_dc8000_panel_disable_ex,
+	.crtc_begin		= vs_dc8000_crtc_begin,
+	.crtc_flush		= vs_dc8000_crtc_flush,
+	.crtc_enable		= vs_dc8000_crtc_enable,
+	.crtc_disable		= vs_dc8000_crtc_disable,
+	.enable_vblank		= vs_dc8000_enable_vblank,
+	.disable_vblank		= vs_dc8000_disable_vblank,
+	.irq_ack		= vs_dc8000_irq_ack,
+};
-- 
2.43.0


