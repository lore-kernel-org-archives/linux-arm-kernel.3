Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED362E6B24D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 12:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bumxjbac1qkRIvzFmwsc/skdkzA5dF+Lt2xM6bxv250=; b=aYXl75DVK8i32l4ytpT2tr9tEY
	rjIi550qQvduNlGj/A5Zh8aK7qtj7RtzQKRLpfGde7XVu0UWSVKwdK6wlEMnG4hSN8uDTHa1M//MM
	2NVchFNRcq2MLhnAcRqzgtMjj6Klu765odN3CX47IqPDGlnei7MlWUOggTNzE2kzTzkooLchP2RTH
	eI/cqVobIbpoEukOabP6NJ0MIf674o0/Je2+ZLuE6An45d6JmZhZwX/gV6zSeQtE/Ma9Wubt2MsDj
	qoOsi/AQfMiwdrN2yvDBFUiAxa6XkFdk7rlThg1d8PpuvcA5HA6IuGBkdbWjMFmxt2JRpHuS20zy+
	TBG5xu/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qsQ-000000073ef-2C12;
	Fri, 01 Nov 2024 12:35:43 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qVq-00000006uLm-3lTd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 12:12:24 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 1 Nov
 2024 20:12:02 +0800
Received: from aspeedtech.com (192.168.10.152) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 1 Nov 2024 20:12:02 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <patrick@stwcx.xyz>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>
CC: <Peter.Yin@quantatw.com>, <Patrick_NC_Lin@wiwynn.com>,
	<Bonnie_Lo@wiwynn.com>, <DELPHINE_CHIU@wiwynn.com>, <bmc-sw@aspeedtech.com>,
	<chnguyen@amperecomputing.com>
Subject: [PATCH v4 3/3] watchdog: aspeed: Update restart implementations
Date: Fri, 1 Nov 2024 20:12:01 +0800
Message-ID: <20241101121201.2464091-4-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_051222_959371_9BBF109B 
X-CRM114-Status: GOOD (  14.07  )
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

Restart callback function is created to distinguish the restart mechanisms
between AST2400/AST2500 and AST2600.

On AST2400 and AST2500 platforms, system can only be reset by enabling
WDT and waiting for WDT timeout. Since AST2600, SW can trigger the reset
event consciously and directly by just cinfiguring some HW registers
without waiting for WDT timeout. This mechanism is named "SW restart" and
is implemented by HW. The WDT counter is not enabled when SW restart
is adopted.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/watchdog/aspeed_wdt.c | 59 +++++++++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 63b5ff9e2751..28a16a0c442d 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -23,6 +23,14 @@ static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+struct aspeed_wdt {
+	struct watchdog_device	wdd;
+	void __iomem		*base;
+	u32			ctrl;
+	const struct aspeed_wdt_data *data;
+};
+
 struct aspeed_wdt_scu {
 	const char *compatible;
 	u32 reset_status_reg;
@@ -36,14 +44,11 @@ struct aspeed_wdt_data {
 	u32 irq_shift;
 	u32 irq_mask;
 	struct aspeed_wdt_scu scu;
+	int (*restart)(struct aspeed_wdt *wdt);
 };
 
-struct aspeed_wdt {
-	struct watchdog_device	wdd;
-	void __iomem		*base;
-	u32			ctrl;
-	const struct aspeed_wdt_data *data;
-};
+static int aspeed_ast2400_wdt_restart(struct aspeed_wdt *wdt);
+static int aspeed_ast2600_wdt_restart(struct aspeed_wdt *wdt);
 
 static const struct aspeed_wdt_data ast2400_data = {
 	.ext_pulse_width_mask = 0xff,
@@ -56,6 +61,7 @@ static const struct aspeed_wdt_data ast2400_data = {
 		.wdt_sw_reset_mask = 0,
 		.wdt_reset_mask_shift = 1,
 	},
+	.restart = aspeed_ast2400_wdt_restart,
 };
 
 static const struct aspeed_wdt_data ast2500_data = {
@@ -69,6 +75,7 @@ static const struct aspeed_wdt_data ast2500_data = {
 		.wdt_sw_reset_mask = 0,
 		.wdt_reset_mask_shift = 2,
 	},
+	.restart = aspeed_ast2400_wdt_restart,
 };
 
 static const struct aspeed_wdt_data ast2600_data = {
@@ -82,6 +89,7 @@ static const struct aspeed_wdt_data ast2600_data = {
 		.wdt_sw_reset_mask = 0x8,
 		.wdt_reset_mask_shift = 16,
 	},
+	.restart = aspeed_ast2600_wdt_restart,
 };
 
 static const struct of_device_id aspeed_wdt_of_table[] = {
@@ -112,6 +120,11 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
 #define WDT_RESET_MASK1		0x1c
 #define WDT_RESET_MASK2		0x20
+#define WDT_SW_RESET_CTRL	0x24
+#define   WDT_SW_RESET_COUNT_CLEAR	0xDEADDEAD
+#define   WDT_SW_RESET_ENABLE	0xAEEDF123
+#define WDT_SW_RESET_MASK1	0x28
+#define WDT_SW_RESET_MASK2	0x2c
 
 /*
  * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
@@ -231,11 +244,8 @@ static int aspeed_wdt_set_pretimeout(struct watchdog_device *wdd,
 	return 0;
 }
 
-static int aspeed_wdt_restart(struct watchdog_device *wdd,
-			      unsigned long action, void *data)
+static int aspeed_ast2400_wdt_restart(struct aspeed_wdt *wdt)
 {
-	struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
-
 	wdt->ctrl &= ~WDT_CTRL_BOOT_SECONDARY;
 	aspeed_wdt_enable(wdt, 128 * WDT_RATE_1MHZ / 1000);
 
@@ -244,6 +254,35 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
 	return 0;
 }
 
+static int aspeed_ast2600_wdt_restart(struct aspeed_wdt *wdt)
+{
+	u32 reg;
+	u32 ctrl = WDT_CTRL_RESET_MODE_SOC |
+		   WDT_CTRL_RESET_SYSTEM;
+
+	reg = readl(wdt->base + WDT_RESET_MASK1);
+	writel(reg, wdt->base + WDT_SW_RESET_MASK1);
+	reg = readl(wdt->base + WDT_RESET_MASK2);
+	writel(reg, wdt->base + WDT_SW_RESET_MASK2);
+
+	writel(ctrl, wdt->base + WDT_CTRL);
+	writel(WDT_SW_RESET_COUNT_CLEAR, wdt->base + WDT_SW_RESET_CTRL);
+	writel(WDT_SW_RESET_ENABLE, wdt->base + WDT_SW_RESET_CTRL);
+
+	/* system must be reset immediately */
+	mdelay(1000);
+
+	return 0;
+}
+
+static int aspeed_wdt_restart(struct watchdog_device *wdd,
+			      unsigned long action, void *data)
+{
+	struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
+
+	return wdt->data->restart(wdt);
+}
+
 static int aspeed_wdt_update_bootstatus(struct platform_device *pdev,
 					struct aspeed_wdt *wdt)
 {
-- 
2.34.1


