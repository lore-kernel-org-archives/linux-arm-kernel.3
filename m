Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0F1D1356B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 03:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKrqBYDWpA2Rp4McGKPnb/6dNWLjIXWZ+IBgL2/lAbQ=; b=PX5wVhpiWYfWQawGankWjcoUPt
	YUFpvous0twEKxmQ5dn7d9uQGtuf6kKX+qeI2nSXNfV9VENhKlv+LQ6oWBLySpGy19tum1F3BFV+a
	X9hUjcVlaneAE0YMGv1nQrpj3fMWe2PvLl9KFgrfBOYsYQPf22r7IQ/MBNA8FR85zfqx1Ex4dQ+zn
	Ww0gX5fdIoab5otCNfitPq/tG6VEpipqQ+isvHjvQVJx9i5Y2ve/BddnZh/0eF2HIPxaMGVU3QxeP
	kySgmBsS8U4wJPEZ3/pT2snZqHpNTuTU5ynI6pTsVB5iOGtmdpwRL9VDyIn5U6dBiUa8RewBMDD0E
	fuE1HCXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5G5p-00000009P6v-3W5S;
	Mon, 28 Oct 2024 03:06:57 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Fo0-00000009Mju-2krL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 02:48:33 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 28 Oct
 2024 10:48:13 +0800
Received: from aspeedtech.com (192.168.10.152) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 28 Oct 2024 10:48:13 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <patrick@stwcx.xyz>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>
CC: <Peter.Yin@quantatw.com>, <Patrick_NC_Lin@wiwynn.com>,
	<Bonnie_Lo@wiwynn.com>, <DELPHINE_CHIU@wiwynn.com>, <bmc-sw@aspeedtech.com>,
	<chnguyen@amperecomputing.com>
Subject: [PATCH v2 3/3] watchdog: aspeed: Add support for SW restart
Date: Mon, 28 Oct 2024 10:48:13 +0800
Message-ID: <20241028024813.2416962-4-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028024813.2416962-1-chin-ting_kuo@aspeedtech.com>
References: <20241028024813.2416962-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_194832_716883_858385A9 
X-CRM114-Status: GOOD (  15.94  )
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

Since AST2600, except for HW WDT counter timeout, HW WDT
reset can also be triggered by just cinfiguring some
HW registers by SW directly. We named it "SW restart".
Although it is "SW" restart, its mechanism is implemented
by HW.

Originally, system can only know it is reset by WDT
through a reset flag. However, since AST2600, SW can
trigger the reset event consciously and directly without
wait for WDT timeout. WDT counter is not enabled when
SW restart is adopted. After that, an independent reset
event flag will be set after systemis reset by SW.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/watchdog/aspeed_wdt.c | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index a0c03a949173..9ba9b7346d44 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -40,6 +40,9 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 #define   AST2600_SCU_SYS_RESET_WDT_SW_MASK	0x8
 #define   AST2600_SCU_SYS_RESET_WDT_MASK_SHIFT	16
 
+/* WDT behavior control flag */
+#define WDT_RESTART_SYSTEM_SW_SUPPORT	0x00000001
+
 struct aspeed_wdt_scu {
 	const char *compatible;
 	u32 reset_status_reg;
@@ -53,6 +56,7 @@ struct aspeed_wdt_config {
 	u32 irq_shift;
 	u32 irq_mask;
 	struct aspeed_wdt_scu scu;
+	u32 flags;
 };
 
 struct aspeed_wdt {
@@ -67,6 +71,7 @@ static const struct aspeed_wdt_config ast2400_config = {
 	.ext_pulse_width_mask = 0xff,
 	.irq_shift = 0,
 	.irq_mask = 0,
+	.flags = 0,
 	.scu = {
 		.compatible = "aspeed,ast2400-scu",
 		.reset_status_reg = AST2400_SCU_SYS_RESET_STATUS,
@@ -80,6 +85,7 @@ static const struct aspeed_wdt_config ast2500_config = {
 	.ext_pulse_width_mask = 0xfffff,
 	.irq_shift = 12,
 	.irq_mask = GENMASK(31, 12),
+	.flags = 0,
 	.scu = {
 		.compatible = "aspeed,ast2500-scu",
 		.reset_status_reg = AST2400_SCU_SYS_RESET_STATUS,
@@ -93,6 +99,7 @@ static const struct aspeed_wdt_config ast2600_config = {
 	.ext_pulse_width_mask = 0xfffff,
 	.irq_shift = 0,
 	.irq_mask = GENMASK(31, 10),
+	.flags = WDT_RESTART_SYSTEM_SW_SUPPORT,
 	.scu = {
 		.compatible = "aspeed,ast2600-scu",
 		.reset_status_reg = AST2600_SCU_SYS_RESET_STATUS,
@@ -130,6 +137,11 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
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
@@ -249,10 +261,31 @@ static int aspeed_wdt_set_pretimeout(struct watchdog_device *wdd,
 	return 0;
 }
 
+static void aspeed_wdt_sw_reset(struct watchdog_device *wdd)
+{
+	struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
+	u32 ctrl = WDT_CTRL_RESET_MODE_SOC |
+		   WDT_CTRL_RESET_SYSTEM;
+
+	writel(ctrl, wdt->base + WDT_CTRL);
+	writel(WDT_SW_RESET_COUNT_CLEAR,
+	       wdt->base + WDT_SW_RESET_CTRL);
+	writel(WDT_SW_RESET_ENABLE, wdt->base + WDT_SW_RESET_CTRL);
+
+	/* system must be reset immediately */
+	mdelay(1000);
+}
+
 static int aspeed_wdt_restart(struct watchdog_device *wdd,
 			      unsigned long action, void *data)
 {
 	struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
+	struct aspeed_wdt_config *cfg = wdt->cfg;
+
+	if (cfg->flags & WDT_RESTART_SYSTEM_SW_SUPPORT) {
+		aspeed_wdt_sw_reset(wdd);
+		return 0;
+	}
 
 	wdt->ctrl &= ~WDT_CTRL_BOOT_SECONDARY;
 	aspeed_wdt_enable(wdt, 128 * WDT_RATE_1MHZ / 1000);
@@ -524,6 +557,13 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 			if (nrstmask > 1)
 				writel(reset_mask[1], wdt->base + WDT_RESET_MASK2);
 		}
+
+		if (wdt->cfg->flags & WDT_RESTART_SYSTEM_SW_SUPPORT) {
+			reg = readl(wdt->base + WDT_RESET_MASK1);
+			writel(reg, wdt->base + WDT_SW_RESET_MASK1);
+			reg = readl(wdt->base + WDT_RESET_MASK2);
+			writel(reg, wdt->base + WDT_SW_RESET_MASK2);
+		}
 	}
 
 	if (!of_property_read_u32(np, "aspeed,ext-pulse-duration", &duration)) {
-- 
2.34.1


