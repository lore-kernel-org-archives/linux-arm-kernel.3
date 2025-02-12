Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D467C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4TIZYbwqNyBKQPtN9RUr0YEpI/gqW7eYbko8Gi7UzJc=; b=fP6POMA94l2cO4R34X9rhvGx/E
	yNWgKevWsiwuKM3yYqIvvIeRHF3SVOCMbalyhv76wm6Gxs0SC07M586qJ2zG8L63W+0QFRvhlb7MY
	g3obb13xnClf1Q+jqepDYJA5QRq5QG+fhICi0TmGN3ehN+sETK45FdNScpCCHROFgNEqDOXue1q05
	f19UJNd2BUnw3tno3dznQEDn7qWW3o+9vQIvB7sYSFjfUiMArbeCPRX32kzRPr4pOgZetGN5PQF1p
	uOgdAgZVkiEL1rJJNm5fRatHfpfbbysjj2TQwbX8pVraWko4C7uGfUYAxIqXHnT96Z7VbxCjaImN9
	Y3dL2qnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9f4-00000006veo-0MAt;
	Wed, 12 Feb 2025 10:08:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9Iw-00000006qIa-2eKf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 09:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739353514; x=1770889514;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1NSB5qjI3HdwTQRBQBnjuqJ4TpcqIKiTpLxKV/W6NhQ=;
  b=KPT9WL31HgGlK7dtvELul90TDouOKF84qxmlR5rIGxee4THk1H9PQIfS
   hyEuEB96MIgFsngKysS3+6RJT8VLCfRiJTz0AzuLsx+peuJnqEyf6Irvx
   +k58DWKK7EriKLrzDIjOyR1I4MDSolkzsdoxW9JZnrO8RGMptlNOcJPpi
   2iWyoyN4w/IrUG26+VPuIIN/pZ6Yc5UhEq86jvjf94Wpx1suHVVdjvxyN
   7TeUPS6rCx0REX/Q5f2+pNXwMbws5jQcyK+InCPjDKjP1BqUcJetzy/ao
   qv2NyNhqp43e5/s5Ydg4Fn1E1rLEKBHWnXfspRC9U9uOFB5KbILKMh1ge
   w==;
X-CSE-ConnectionGUID: qkANol4LQQKG05F3y7BElw==
X-CSE-MsgGUID: P7uX/GQ0TOmWM4WVOBVmyA==
X-IronPort-AV: E=Sophos;i="6.13,279,1732604400"; 
   d="scan'208";a="37191058"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Feb 2025 02:45:13 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 12 Feb 2025 02:45:08 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 12 Feb 2025 02:45:01 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>
Subject: [PATCH v2 2/3] mfd: atmel-hlcdc: fetch LVDS PLL clock for LVDS display
Date: Wed, 12 Feb 2025 15:14:48 +0530
Message-ID: <20250212094449.109622-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250212094449.109622-1-manikandan.m@microchip.com>
References: <20250212094449.109622-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_014514_731161_069AE74F 
X-CRM114-Status: GOOD (  15.49  )
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
for a given display, this patch first attempts to retrieve sys_clk
If that fails,it then tries to acquire lvds_pll_clk.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
changes in v2:
- Rephrase the comments, commit message and err logs
- Replace dev_err wwith dev_warn
- Remove Initializing sys_clk and lvds_pll_clk to NULL post
devm_kzalloc() call

---
 drivers/mfd/atmel-hlcdc.c       | 16 ++++++++++++++--
 include/linux/mfd/atmel-hlcdc.h |  1 +
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/atmel-hlcdc.c b/drivers/mfd/atmel-hlcdc.c
index 4c4e35d404f3..f680392b01ba 100644
--- a/drivers/mfd/atmel-hlcdc.c
+++ b/drivers/mfd/atmel-hlcdc.c
@@ -108,10 +108,22 @@ static int atmel_hlcdc_probe(struct platform_device *pdev)
 		return PTR_ERR(hlcdc->periph_clk);
 	}
 
+	/*
+	 * Retrieve any one of the Main clk required by the LCD to operate:
+	 *
+	 * LCDC Generic Clock (sys_clk) - Parallel RGB and MIPI displays,
+	 * LVDS PLL (lvds_pll_clk)      - LVDS display
+	 */
 	hlcdc->sys_clk = devm_clk_get(dev, "sys_clk");
 	if (IS_ERR(hlcdc->sys_clk)) {
-		dev_err(dev, "failed to get system clock\n");
-		return PTR_ERR(hlcdc->sys_clk);
+		dev_warn(dev,
+			 "failed to get LCDC generic clock, trying for LVDS PLL clock instead\n");
+
+		hlcdc->lvds_pll_clk = devm_clk_get(dev, "lvds_pll_clk");
+		if (IS_ERR(hlcdc->lvds_pll_clk)) {
+			dev_err(dev, "failed to get LVDS PLL clock\n");
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


