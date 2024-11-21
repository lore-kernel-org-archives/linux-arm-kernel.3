Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35755D75BDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 09:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sp9zPv0+JnKUsKXx2PuZpYCNzMU/Vf8RxVzcD76ygxc=; b=EYH1Msq3Io4xcmfooISAb4aWIB
	m4QBma55Ajxk6vI/aDai6++jiSO4V/9Md9uGC82U3O/j8E8LE4CzLtrMng9eCGK2Psi3BqDC0Ql/M
	9TNUC7Vckt/pfQZ514hza99poAACS+H/TgFa5mLkPITj0KEDJcjWlIKBcbPUco8l5doA47N3BYj6S
	BjBRm/xwiOD1SvidVrfbKhshi1wnsEECiIUBkYQaf0Tb7Am5Z2V7qmtqv+jfEjpLTeOKq8kbI6pbs
	h8ldrQJnrNK3gX+yzrSjJTxm9nB5tZv2HYZ6n1bJh0Qbl9p1XQrojcSgR7HFA40XYLDuMO9uVS63W
	xf+X2zIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE3Qt-0000000HEv0-2TXa;
	Thu, 21 Nov 2024 09:25:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE3Pb-0000000HEei-0XOS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 09:23:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732181022; x=1763717022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hTZs9u0Oqdf1I9PjVZl9bFYDm54NofKT7IeYsH2t1xw=;
  b=dM/vKqAbWnx5u8VuihwBJarkfEqwyJ1oBpNUHT/7uMu0bkwuoDXN+Y4K
   3kGYzgNZ9b/hgRY3JUhErAtnLqXzG9uZP/9lA2SunsUH8qFjDrC0JeKbK
   cxUSj02yxx/JFWfCw2s1DYPsXiM+TAsWX4CRwc/e3WpkzN3Ea4gQ0tgTY
   9xFB5P6AHI41pJ53VzokWYgsUPDZ7/uoGptfALFwuo0wao3NIBUDafYHN
   tsdj3YgG5QolshDEOJYA21cjAG2uQBti+4DdS/VerQoZLpPy7kGudlVoe
   b8B5L34xXlfH09Jbbu6bBRraaQYegB/Lo0EbCHqfWRtZSzJUrjqo0b8US
   A==;
X-CSE-ConnectionGUID: wS72ZE3TTRmRyzdG8hxnTQ==
X-CSE-MsgGUID: aalNNPKeSoqk3SayxHhJFA==
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="202047025"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Nov 2024 02:23:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Nov 2024 02:23:08 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 21 Nov 2024 02:23:04 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>, Dharma Balasubiramani
	<dharma.b@microchip.com>
Subject: [PATCH 2/3] mfd: atmel-hlcdc: fetch LVDS PLL clock for LVDS display
Date: Thu, 21 Nov 2024 14:53:07 +0530
Message-ID: <20241121092308.130328-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121092308.130328-1-manikandan.m@microchip.com>
References: <20241121092308.130328-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_012343_224800_F4200D8D 
X-CRM114-Status: GOOD (  13.92  )
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

The XLCDC IP supports DSI, parallel RGB and LVDS Display.
sys_clk(Generic clock) is used for DSI and Parallel RGB displays;
And LVDS PLL is used with LVDS displays.
obtain anyone of the clocks for the LCD to operate

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 drivers/mfd/atmel-hlcdc.c       | 16 ++++++++++++++--
 include/linux/mfd/atmel-hlcdc.h |  1 +
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/atmel-hlcdc.c b/drivers/mfd/atmel-hlcdc.c
index 4c4e35d404f3..60b0b766459e 100644
--- a/drivers/mfd/atmel-hlcdc.c
+++ b/drivers/mfd/atmel-hlcdc.c
@@ -108,10 +108,22 @@ static int atmel_hlcdc_probe(struct platform_device *pdev)
 		return PTR_ERR(hlcdc->periph_clk);
 	}
 
+	/*
+	 * Obtain one of the main clocks (GCK / LVDS PLL) required by the
+	 * LCD to function,
+	 * GCK for Parallel RGB and MIPI displays;
+	 * LVDS PLL for LVDS displays.
+	 */
+	hlcdc->sys_clk = NULL;
+	hlcdc->lvds_pll_clk = NULL;
 	hlcdc->sys_clk = devm_clk_get(dev, "sys_clk");
 	if (IS_ERR(hlcdc->sys_clk)) {
-		dev_err(dev, "failed to get system clock\n");
-		return PTR_ERR(hlcdc->sys_clk);
+		dev_dbg(dev, "failed to get system clock\n");
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


