Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0373BE98E14
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHea3OWHkkHkDsslxTpxNplTHtprxruHUZxobkSimgs=; b=dR8bNBMKaaOBQs/BqrVREDznlm
	dNq+KHZ/tcq+HElGV5GVI6AknErV4vHAZIt3MG7odpVwlc1+fM/1vw7irbCNm1z4FOg74zJxVQqwZ
	DTv47lWP6/ovFQVJ2Leb2tGwYDGz3jpkc16w3DgELLx6AXbnqXV+pIgao5MvTtD6DNqsmnTwoW3wZ
	90HgwbR6sSwXR9u/OpnvlBy2k/KMxOx5XBWbRJ8lj5FYbfQPlFPa7lk4GLTvt05vTaMf29ucTpMRB
	kKw9K3TPAqZ7m+ISQuAN5KbFRtDjJzV2GMXxGW+KbAjeZShS3GLGFllZ1pK4di+hE2SuCgDXqvjxV
	DO9D2ALA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT37-000000002FB-1f2R;
	Mon, 23 Feb 2026 10:20:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT34-000000002EC-3B4R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1771842018; x=1803378018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HYWBr38iHIjb+NSx2zGe9SgBNR2/Jd2Z4h5rS9bUVNw=;
  b=bMvfJp+tI1wGG2HRe8Hw0KpCog7yo4e6d45F6Va02YMzUp3ClfQz1J/5
   J3bZBSP7+r4FEU8qiK+IdTVm7FIwU9AvmVGlccmHACcYSUusu5+a44kIS
   xsk7WUKP6OAuYI7lNWu0szq/LrbNfCfFjX3ILuL/niFTm1ylchfmZAb5i
   AxyIgWPjEJTDp4ASrb2aFKkfg3pt6rNyEGkovf4txEgu1MuBlq/8ECwR6
   cClz4xGGiNo1WjpmUp0OnF59EQu9rGHO2Y6Kc/9c1FbhpbpfKSgMempM+
   McNqUSCNEse4Hii5+breFJmT3Og3Tm1N4xOiXNnwlP9tJQK2HwnU2g71S
   w==;
X-CSE-ConnectionGUID: Pkelvpk5TzC1b4CVtpcYwQ==
X-CSE-MsgGUID: v51EDN1ETbOmCom1RI3NQw==
X-IronPort-AV: E=Sophos;i="6.21,306,1763449200"; 
   d="scan'208";a="220994658"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Feb 2026 03:20:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 23 Feb 2026 03:19:54 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Feb 2026 03:19:49 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>, Dharma Balasubiramani
	<dharma.b@microchip.com>
Subject: [PATCH v3 1/4] mfd: atmel-hlcdc: fetch LVDS PLL clock for LVDS display
Date: Mon, 23 Feb 2026 15:49:17 +0530
Message-ID: <20260223101920.284697-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260223101920.284697-1-manikandan.m@microchip.com>
References: <20260223101920.284697-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_022018_929153_21702E49 
X-CRM114-Status: GOOD (  14.85  )
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

The XLCDC IP supports parallel RGB, MIPI DSI and LVDS Display.
The LCD Generic clock (sys_clk) is used for Parallel RGB and MIPI
displays, while the LVDS PLL clock (lvds_pll_clk) is used for LVDS
displays.Since both the clocks cannot co-exist together in the DT
for a given display, this patch tries sys_clk first (RGB/MIPI),
fallback to lvds_pll_clk (LVDS).

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
changes in v3:
- Rephrase the comments, err logs.
- assign NULL to sys_clk to avoid Oops error when
referenced in pwm-atmel-hlcdc.c

changes in v2:
- Rephrase the comments, commit message and err logs
- Replace dev_err wwith dev_warn
- Remove Initializing sys_clk and lvds_pll_clk to NULL post
devm_kzalloc() call
---
 drivers/mfd/atmel-hlcdc.c       | 13 +++++++++++--
 include/linux/mfd/atmel-hlcdc.h |  1 +
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/atmel-hlcdc.c b/drivers/mfd/atmel-hlcdc.c
index 4c4e35d404f3..0f83ad7ba15c 100644
--- a/drivers/mfd/atmel-hlcdc.c
+++ b/drivers/mfd/atmel-hlcdc.c
@@ -108,10 +108,19 @@ static int atmel_hlcdc_probe(struct platform_device *pdev)
 		return PTR_ERR(hlcdc->periph_clk);
 	}
 
+	/*
+	 * Retrieve one of the primary clocks required for LCD operation:
+	 * prefer sys_clk (for RGB/MIPI), and
+	 * fall back to lvds_pll_clk (for LVDS) if needed.
+	 */
 	hlcdc->sys_clk = devm_clk_get(dev, "sys_clk");
 	if (IS_ERR(hlcdc->sys_clk)) {
-		dev_err(dev, "failed to get system clock\n");
-		return PTR_ERR(hlcdc->sys_clk);
+		hlcdc->sys_clk = NULL;
+		hlcdc->lvds_pll_clk = devm_clk_get(dev, "lvds_pll_clk");
+		if (IS_ERR(hlcdc->lvds_pll_clk)) {
+			dev_err(dev, "Failed to obtain both the LCDC (generic) and LVDS PLL clocks\n");
+			return PTR_ERR(hlcdc->lvds_pll_clk);
+		}
 	}
 
 	hlcdc->slow_clk = devm_clk_get(dev, "slow_clk");
diff --git a/include/linux/mfd/atmel-hlcdc.h b/include/linux/mfd/atmel-hlcdc.h
index 80d675a03b39..07c2081867fd 100644
--- a/include/linux/mfd/atmel-hlcdc.h
+++ b/include/linux/mfd/atmel-hlcdc.h
@@ -75,6 +75,7 @@
  */
 struct atmel_hlcdc {
 	struct regmap *regmap;
+	struct clk *lvds_pll_clk;
 	struct clk *periph_clk;
 	struct clk *sys_clk;
 	struct clk *slow_clk;
-- 
2.25.1


