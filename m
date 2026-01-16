Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9346DC98301
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7p7FfOQBO7Zk8yazJbshoXgEOCDuHznPrJ1fLE3Q2fM=; b=GquMpjz0Me+bhI46pq7C8iub8k
	WkP7xOWc99No0TWL7d6rj3Ss8qLm2lDxrIKDbF2PPXDGe1lclpFfjiKXaW86tHxU3dWsYo9+GfOqA
	hdn/yY1JxR1vpKo+RveECCxp5c8t73nvKi60PZavSCAQrp1Geb9iQA8CN2REdh4s5GM3FqSMfA7XI
	HBRWhtgzzYAFn+96+ld2VUFZCIOJpp3+cLQFEyqiOLugBR3EG9+qHaf5NMIGNec5reYgfKKJdTeSm
	tKmN5ZcRxDF3xv5VRw0GnKn00P6UWOcz0k4iAbi9InVKVlZQ1+KQf7/k8iqKwWEqeHtXxOnlmYM3V
	YPFTkXkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6Y-0000000Ek8F-2X3t;
	Fri, 16 Jan 2026 20:07:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6Q-0000000Ejz1-3Xdf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 20:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594046; x=1800130046;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n7mIBMggA516wAOxYTsWouwXOvs5xr+CGDAMpD99kJg=;
  b=Mt+jfCBd09mp3uWG3E+y+EoMWYQFwCBs5hBXniskDc+uJlHYVK9Madyc
   LlZ8J0+Ql2+Cg0wYMDaIThKDzGujxmzdlDK2I810y+BQmGgAqT0AVa9R8
   SxYO014gpe8x+ZOV8prJ7p6906mobGsy+7wv+sWdVKseWsKfRgK4bNZDG
   GjVzDXtztKSyFNdiG7Ji+iG639d/iVBUypu/dY9q46HMm/nzAlUB9NYVb
   nBIrwi0OtZGUPiIf10vFcRklykJbm1al3rRFd5udnJmWVrw4LGsoPEelW
   KUp5j75scDOFK0Cuu2VT7FuqVug2uX+yckzmg/Jn6N79R4V9FFgLPZAtX
   w==;
X-CSE-ConnectionGUID: OTooRcwrRNCxZBlF1StIPQ==
X-CSE-MsgGUID: 4EQoo9cNRY+exmGaOQL3iw==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="59042239"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 13:07:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 16 Jan 2026 13:07:06 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 16 Jan 2026 13:07:06 -0700
From: <ryan.wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <bmasney@redhat.com>,
	<alexander.sverdlin@gmail.com>, <varshini.rajendran@microchip.com>
CC: <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 17/31] clk: at91: clk-h32mx: add support for parent_data
Date: Fri, 16 Jan 2026 13:07:10 -0700
Message-ID: <9f6f22bfd5ca47e4d1608282d13eb80a9c01865a.1768512290.git.ryan.wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768512290.git.ryan.wanner@microchip.com>
References: <cover.1768512290.git.ryan.wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_120726_894219_AE6FEE4D 
X-CRM114-Status: GOOD (  15.64  )
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

From: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Add support for parent_data in h32mx clock driver.
With this parent-child relation is described with pointers rather
than strings making registration a bit faster.

All the SoC based drivers that rely on clk-h32mx were adapted
to the new API change. The switch itself for SoCs will be done
in subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-h32mx.c | 11 +++++++----
 drivers/clk/at91/dt-compat.c |  2 +-
 drivers/clk/at91/pmc.h       |  2 +-
 drivers/clk/at91/sama5d2.c   |  2 +-
 drivers/clk/at91/sama5d4.c   |  2 +-
 5 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/at91/clk-h32mx.c b/drivers/clk/at91/clk-h32mx.c
index a9aa93b5a870..c691a3b1526f 100644
--- a/drivers/clk/at91/clk-h32mx.c
+++ b/drivers/clk/at91/clk-h32mx.c
@@ -94,10 +94,10 @@ static const struct clk_ops h32mx_ops = {
 
 struct clk_hw * __init
 at91_clk_register_h32mx(struct regmap *regmap, const char *name,
-			const char *parent_name)
+			const char *parent_name, struct clk_parent_data *parent_data)
 {
 	struct clk_sama5d4_h32mx *h32mxclk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	h32mxclk = kzalloc(sizeof(*h32mxclk), GFP_KERNEL);
@@ -106,8 +106,11 @@ at91_clk_register_h32mx(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &h32mx_ops;
-	init.parent_names = parent_name ? &parent_name : NULL;
-	init.num_parents = parent_name ? 1 : 0;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
+	else
+		init.parent_names = &parent_name;
+	init.num_parents = 1;
 	init.flags = CLK_SET_RATE_GATE;
 
 	h32mxclk->hw.init = &init;
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 3285e3110b58..ccdeba3a1130 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -201,7 +201,7 @@ static void __init of_sama5d4_clk_h32mx_setup(struct device_node *np)
 
 	parent_name = of_clk_get_parent_name(np, 0);
 
-	hw = at91_clk_register_h32mx(regmap, name, parent_name);
+	hw = at91_clk_register_h32mx(regmap, name, parent_name, NULL);
 	if (IS_ERR(hw))
 		return;
 
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index e6465259521e..32bb041c1466 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -180,7 +180,7 @@ at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
 
 struct clk_hw * __init
 at91_clk_register_h32mx(struct regmap *regmap, const char *name,
-			const char *parent_name);
+			const char *parent_name, struct clk_parent_data *parent_data);
 
 struct clk_hw * __init
 at91_clk_i2s_mux_register(struct regmap *regmap, const char *name,
diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
index 7904f2122ed7..8c7ff0108b41 100644
--- a/drivers/clk/at91/sama5d2.c
+++ b/drivers/clk/at91/sama5d2.c
@@ -276,7 +276,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 
 	sama5d2_pmc->chws[PMC_MCK] = hw;
 
-	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div");
+	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div", NULL);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/sama5d4.c b/drivers/clk/at91/sama5d4.c
index 7cda8032653e..04c848cd7001 100644
--- a/drivers/clk/at91/sama5d4.c
+++ b/drivers/clk/at91/sama5d4.c
@@ -214,7 +214,7 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 
 	sama5d4_pmc->chws[PMC_MCK] = hw;
 
-	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div");
+	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div", NULL);
 	if (IS_ERR(hw))
 		goto err_free;
 
-- 
2.43.0


