Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980AACD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 19:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdLAbqgwB3cbfBit4ZVDmF5fOX+Cth+Nq8mrAQRYaDE=; b=EnMkU6OAjY+NUtpolsYEpqGkOw
	vAF//Lp3qarFOvRn1s9sp6Mv5w2g/uLnBArYhK+B/Zrgx4kMQNdLT3NK833cscIP+yhtSWcIKbSkS
	TZnhk1aIyeWvhiYdFRxr9zTYYzCURMZionnXvo3Qw40M7joRA0Xlo7JgNQ4hoNgJ1Z2ferEiorYVa
	ciAq3Y1+1ujzVdL7FPQDwBAF4BFEvAZQYoMRSjdttu7dSAtFb7Db1xU4b7Bki00CjUpmpk9+Komgv
	FN5K1UskugvmLynWlbOYXTVEahHh4uI9Ni8zL6ms4bMHMZLxcRkCv+K0aPMJ/yVquRYKZAuW6Dolk
	Qi6mD19w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLmua-00000009TEw-2GYv;
	Sat, 09 May 2026 19:00:28 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLmuW-00000009TBT-3nrB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 19:00:26 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso27931705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 12:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353223; x=1778958023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdLAbqgwB3cbfBit4ZVDmF5fOX+Cth+Nq8mrAQRYaDE=;
        b=Ft2NpF++bTotMtmaocOAV6xmNn/XxhI9ok5Ab3jVALlvt2RT2wvRRebK5ER0txnAs0
         YQSHb/CZC0CkJJXSP7KeVtjzrb7SQsDNJ5YdDTtgDHqTj6g9P/w8msuxTKNAvZ7cQ9Dz
         Ctqvx22m57ldQTanfrru1Dd0tIrwa10QZ4pp09eu1DSnaawM2a2FD3JyXRLq2hoM7b+1
         TL9KpHmpyG35FkEEOFDI7IfQn/jlqm2GcbyESXMijyy9MMVnQx13IYJyoRIZNkyVmKv1
         XItOgBZGXVrGD8b7un/w/NeF4O7LWtny+5KVd+gjxQ4LUVth7OE1Cc/6HtcMPJo07JQG
         qF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353223; x=1778958023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AdLAbqgwB3cbfBit4ZVDmF5fOX+Cth+Nq8mrAQRYaDE=;
        b=pM2s5vUWAGZbiQXBVwxUN2qkVLbwu8PUj71pC5F1KgSbK4vAuF/mFEMVUaRDnvtJw7
         nTu8X87ypDdKswwxx4XG+IGSgjbudHgo86i0S05vwHbgvHTmiQDCV17D6TJ4yuLphCYQ
         1jYNgnHgok20VflGEmh0dhPhQoMlIblEmFvc2L/IbRSOahBUq7DquYKqv1uT37susFkn
         HbNy1i3ntGK4rt2Yv1tUx/wZ5/khQP6g+EmDYiQS0uvUpJMv/p2lAJWTilk1A6PlRIq+
         ngbrOjIlzvH6p9769JCUrqw9h/eRHoebEIxy+1MY2KGUyxdi5KbC+CTl2tq1r5VVBjWt
         g3jQ==
X-Forwarded-Encrypted: i=1; AFNElJ/mN9/a+FwU/KkLXwNA3b6iym+Nm0abIrgrJ+ywE8tQJ2yJYDL14NuXkmBF8ETX9DHoooWr4jXqopjUASZKhp6E@lists.infradead.org
X-Gm-Message-State: AOJu0YwkntP4ZJGDdGvbb0l54LCF6CPwb1UgbTCvl5QpT7ciowYJNp1N
	BqOhi0hlGHnQeRgCIIkqEGs3Rjim4lVrn1cRYf+pWCGY+XQfzy5cDz4P
X-Gm-Gg: Acq92OFpdAGrlDi3u/EXW3veJRbqhgnQaBhAFVuldDRuITtiT/t3IOhQYZjUa2AXwYx
	hJpWsTILGlusxfm6eLCLvetct/39vJgKRu0tP9oL6v1GYCa3s24xfvQN4ZRiQXd5ieGoHNKqf/5
	XenzEaHzNSHGMXoz1o1mSAkFbiIY8mnC/BNztzOTiW5wdTZSuVJGBLhl7Hu1+xA1NR1tA8e+R1c
	COyJQzPyMRrcDCHHE3sYjsNhytDFrk8kOBtg/urY+xTtgMIg7ayyUeML7mE0p57D0y3WGaVP/tm
	ovUpXqHrDEDHPW+0K+fGN88mmcmUK3iAZAAiYOwNy2QFw76UrqwarhGQWgBsG0tqmny713qqvPh
	UMkBiStRr0rBfN4cwRsQhGbZktfBrxFmxgUOGspl5mraGCiXGV1YL6IIRdWF7CbUGh7JD1BwrBj
	eJN/3W1QXzU1P2GqHguRJLY9WtmWFzy7POg8jZiWnrrGnuM6CQx7qVQhNqMh0ZFdwfQFs=
X-Received: by 2002:a5d:5f90:0:b0:451:ccc:a6e5 with SMTP id ffacd0b85a97d-4515d5c68d1mr27318999f8f.30.1778353222950;
        Sat, 09 May 2026 12:00:22 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:22 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	jernej.skrabec@gmail.com
Subject: [PATCH v2 2/8] clk: sunxi-ng: de2: Export register regmap for DE33
Date: Sat,  9 May 2026 21:00:09 +0200
Message-ID: <20260509190015.79086-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509190015.79086-1-jernej.skrabec@siol.net>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_120024_999040_3583F3BA 
X-CRM114-Status: GOOD (  17.79  )
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

DE33 clock pre-set plane mapping, which is not something that we want
from clock driver. Export registers instead, so DRM driver can set them
properly.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- used access tables instead of functions
- used macro for max register
- used dev_of_node() instead of open coding

 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 48 ++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index 6ec6c0dc4c26..26d8abd5fac6 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -6,9 +6,11 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 
 #include "ccu_common.h"
@@ -283,6 +285,36 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
 	.num_resets	= ARRAY_SIZE(sun50i_h616_de33_resets),
 };
 
+/*
+ * Add a regmap for the DE33 plane driver to access plane
+ * mapping registers.
+ * Only these registers are allowed to be written, to prevent
+ * overriding clock and reset configuration.
+ */
+
+#define SUN50I_DE33_CHN2CORE_REG 0x24
+#define SUN50I_DE33_PORT12CHN_REG 0x2c
+
+static const struct regmap_range sun8i_de2_ccu_regmap_accessible_ranges[] = {
+	regmap_reg_range(SUN50I_DE33_CHN2CORE_REG, SUN50I_DE33_PORT12CHN_REG),
+};
+
+static const struct regmap_access_table sun8i_de2_ccu_regmap_accessible_table = {
+	.yes_ranges = sun8i_de2_ccu_regmap_accessible_ranges,
+	.n_yes_ranges = ARRAY_SIZE(sun8i_de2_ccu_regmap_accessible_ranges),
+};
+
+static const struct regmap_config sun8i_de2_ccu_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= SUN50I_DE33_PORT12CHN_REG,
+
+	/* other devices have no business accessing other registers */
+	.wr_table	= &sun8i_de2_ccu_regmap_accessible_table,
+	.rd_table	= &sun8i_de2_ccu_regmap_accessible_table,
+};
+
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
 {
 	struct clk *bus_clk, *mod_clk;
@@ -336,13 +368,23 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 	}
 
 	/*
-	 * The DE33 requires these additional (unknown) registers set
+	 * The DE33 requires these additional plane mapping registers set
 	 * during initialisation.
 	 */
 	if (of_device_is_compatible(pdev->dev.of_node,
 				    "allwinner,sun50i-h616-de33-clk")) {
-		writel(0, reg + 0x24);
-		writel(0x0000a980, reg + 0x28);
+		struct regmap *regmap;
+
+		regmap = devm_regmap_init_mmio(&pdev->dev, reg,
+					       &sun8i_de2_ccu_regmap_config);
+		if (IS_ERR(regmap)) {
+			ret = PTR_ERR(regmap);
+			goto err_assert_reset;
+		}
+
+		ret = of_syscon_register_regmap(dev_of_node(&pdev->dev), regmap);
+		if (ret)
+			goto err_assert_reset;
 	}
 
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
-- 
2.54.0


