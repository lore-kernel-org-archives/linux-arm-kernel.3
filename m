Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BC0CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 10:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0dxj0A552w7ubsF/6UDVTgs5P4hm62XQTlAEP8tTXI=; b=YK+12AfyduQeGPGTTIUzttdQAV
	gIcUwI6e4XCyyG/WFtA5Gudml0BLOSCjKkj2WVM5YFGsL2hUcrnD0Fi2MoWjZjt2lttbRcd5ZLauz
	MmrpeP2VhO9N+eqGVeUZTyO2Wdt/Qdyf5WmJDpxlgeewXMK9c5odhbuwplyf6V1IaUcB5F41KN3zh
	J16FmV61TV872jArqyCLMxMhkHNetfFDzlGwKorAKhBINnwvyOAZkUxf5FYPw7+dWN8mCrU4yh3MX
	uOkkUpAWaNMJMC7L7S5ecBAMpefOZtuxl/8G0rQ4Yb0wC7/5eOKGDLVKlwApZQK5/0kVQyNtR9i2L
	aMT+3w+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgeB-00000008vvZ-2I2x;
	Thu, 25 Jun 2026 09:45:23 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcge3-00000008vpt-3tL9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 09:45:17 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-37cab825ec9so1573619a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 02:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782380715; x=1782985515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0dxj0A552w7ubsF/6UDVTgs5P4hm62XQTlAEP8tTXI=;
        b=F3T/K2g9qHMjHBeyq9m1qDWEPzlG3bQarhnbv02UwkHuhpbcoc9mlp4WZXAic0UUJO
         Ic/zm1nEJp9rV4JQ/ZdxAuhUsk71aZ7NcA/OgYEUUhJq8Emr62nMn52syFr1Hda4cZaO
         cp0+qnwtPf6MtvzOLa4mJlZdzf0hDclAbDsIAmiYwraQa9cG7jYsoHpSUohh3CX1Rn3L
         5NmWAAECmbrakKdPC0iPyFodjK+oaVoG/sYU7PVCO9cCD0J0i9Zpq0P/D5Rd6wb1odOJ
         1T9CNTCv6+uLhKYtS5+lZ3H2OaHHQAmx7gYMQJXSVLrte3ezKI5YkIB+uG5H4hXcFi5c
         5hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380715; x=1782985515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o0dxj0A552w7ubsF/6UDVTgs5P4hm62XQTlAEP8tTXI=;
        b=gCwEoT0H/9fkFjVOB/KTx29Vjsaz58uJVULlO0sVEGkvOrMo2i2nuQAln27gdkrHbt
         UalvHBvKIW+/nUe7cj6t9qtL682h2pamRivsQ2E5htFL0PxDlvwmOGSEzYYyNCLOV+2d
         f6byv8x9kh5ztFQ/NTk2DtYGGOMJvjx+oefCwQtxC1oOSMMwqlgaBHNG4o2aw3MpHgaI
         N8EfVvL4yhEYjH1w0LJoiq/3GBBw+ORP9CZ3HUzL66iv2gOA5LMsl1k1H+GSw39T+jGk
         D117QYxKgjRUveTAo7rIHp6ixKsCF/VbF6Um/2yorqgFET/KZM0GWsunksIQ6MWeSvim
         vwNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq25hSXV1zcBUOzJ1sGmE9PUyHq6NdHFmlSReEzUiYIf3ikTjuwRlP8jgRWFY9o1BjnBvlAb94DlCfDcCh219+J@lists.infradead.org
X-Gm-Message-State: AOJu0YxDJTOMLnofFOI/nuBXqp+oFaYNpKyiG7xLSJ0oap9P/g7huiVw
	49djaWepl84WyMdg5XeQA4lu/jCp0lBVj2q2hTHy+osgk4z3WXmGwb9f
X-Gm-Gg: AfdE7clxus73h2TJWlMPUbFrgyxwd5hVP8alCwizDij/pIeKlmoU24uQmmIJaSw+MEd
	atJBoftc0Qck2OvSuZ5PKKuX4gfSFPBmZauxgZHXfAZkYkhc01tOIIcf6xgk16j8OKHWHHepcyU
	f06fGTv++74ngh2HegUxBcZjcWMUNC/1iH0q7Dv2XC1aAjVmCe2awIz0HUQdaTnyptgKbAddd83
	wTkYdpp8YkI9UCP+tj/TintoLOVAP2nPR8bBJQ5zAWWkc7/LoYRqbzfufW9X/CGRHO/Xge2KPor
	//9hibZCd44V+OdK5aPq9yhkpVlMo5a3lzl/2l+NkcVszga/eJrwg3eWnjLqFKWZZSubRtsiO4+
	CEAEXUrobQDYTMZpKMPJND7f6ffe6esjXOpKjSXDS13JgtA+pOyLtcg+tLYRKyyyXNO8pHYQT7d
	kXb4qwIxEVud2HMUWkQvTcK5lzq5PSjyEXjtDsXmFBHganOFnuSPlljvPWzgI0NdTmivIDF4SDj
	A==
X-Received: by 2002:a17:903:37c6:b0:2c0:ab92:584c with SMTP id d9443c01a7336-2c7fc727984mr18002025ad.25.1782380714969;
        Thu, 25 Jun 2026 02:45:14 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac8c26sm16614995ad.1.2026.06.25.02.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:45:14 -0700 (PDT)
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
Subject: [PATCH v5 5/7] drm/verisilicon: add DC8000 (DCUltraLite) display controller support
Date: Thu, 25 Jun 2026 17:44:47 +0800
Message-ID: <20260625094449.708386-6-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625094449.708386-1-a0987203069@gmail.com>
References: <20260625094449.708386-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_024515_974298_373505EA 
X-CRM114-Status: GOOD (  21.49  )
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
controller (DC8000 generation) whose register layout differs from
the DC8200 in several important ways:

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

4. Simpler clock topology: only 'core' (bus gate) and 'pix0' (pixel
   divider) clocks; no axi or ahb clocks required.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/Makefile    |  2 +-
 drivers/gpu/drm/verisilicon/vs_dc.c     |  5 +-
 drivers/gpu/drm/verisilicon/vs_dc.h     |  1 +
 drivers/gpu/drm/verisilicon/vs_dc8000.c | 86 +++++++++++++++++++++++++
 4 files changed, 92 insertions(+), 2 deletions(-)
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
index fd1f5fe67a68..9499fffbca58 100644
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
index 825f5dd6bf17..ac96ad701199 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc.h
+++ b/drivers/gpu/drm/verisilicon/vs_dc.h
@@ -66,5 +66,6 @@ struct vs_dc {
 };
 
 extern const struct vs_dc_funcs vs_dc8200_funcs;
+extern const struct vs_dc_funcs vs_dc8000_funcs;
 
 #endif /* _VS_DC_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_dc8000.c b/drivers/gpu/drm/verisilicon/vs_dc8000.c
new file mode 100644
index 000000000000..fbe0fa516cac
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_dc8000.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Joey Lu <yclu4@nuvoton.com>
+ */
+
+#include <linux/regmap.h>
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
+	u32 hw_irqs, unified = 0;
+	unsigned int i;
+
+	regmap_read(dc->regs, VSDC_DISP_IRQ_STA, &hw_irqs);
+
+	for (i = 0; i < VSDC_MAX_OUTPUTS; i++) {
+		if (hw_irqs & VSDC_DISP_IRQ_VSYNC(i))
+			unified |= VSDC_IRQ_VSYNC(i);
+	}
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


