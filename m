Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3477C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 02:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBOdXyXS4xPz3SkZDj6+qaGSQH/hm/6mLzfAVljRnQI=; b=wZy3fWF0aqmt6YHTGFU118J9/T
	iL1k0JzD7qXBxzLRcHmxuW/14oLvhGVMgnDsArqMF104aIECGYGHAhTVp7rw7v9aB5SJyHlt8fSrz
	6xqy2zOYPNkCcp+EouOxhoYuXM+480R6RXoUOkRl8MZeNflQcpFvCePH2vTMsK6GCSQaxVX8pFvHH
	Hvz9HQVRhFkU89x1GigwBBqiVDVGwCPuao+/Xa0/FHjlOHQ22I4MH5UGLNR9CydomeIZDJ1uFD4De
	i0cZpyEdrE1ZWpwwS2S6bGYoC5NpBxPN8H6XpqlOv77uLe4B/HQSbL2d9j2ysEENtZZkOWpCi3rCT
	95mUNS3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC8DI-00000009njc-0Zu0;
	Tue, 06 May 2025 02:39:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4mu-00000008vRy-3cfJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:59:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D60C8439B6;
	Mon,  5 May 2025 22:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FCFBC4CEED;
	Mon,  5 May 2025 22:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485992;
	bh=2M8uPCt36C3of6ENKMaaIlkGVz65Qcmxt5L5qeA9Jus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PEctCCj3OgCddDU4ao2KrwEcYmJsZhR6DIGOu36l6q7ZsRCbvyT8hcJLOaZC5zTj3
	 g/+YqQXKZu60oLPydbzvD/cmCuZqUzUgKJGkdLxxRd1KzjXiSPbnvvcfqIuBbIj7kS
	 41tgl5Oku6MYOw+aBYJemXeKrTTHVYdN2qsrFlnOzre8oXBRmrbZxS0Flqd/sxd78A
	 lRAPZCX0FmjJ0N8kJi8rfXPbmG6wiThSJzyEh6UxKm9epvilzaXT3XYbVkXBBeRNnO
	 XEVhn7pHXED+uV14/6yocN169MblBcZjA7dtqmHzvdvlebM+1YzPNOagGEikm6kIGs
	 JTBvZE8C5i0FA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	joel@jms.id.au,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.6 101/294] watchdog: aspeed: Update bootstatus handling
Date: Mon,  5 May 2025 18:53:21 -0400
Message-Id: <20250505225634.2688578-101-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_155952_943190_455F1A9A 
X-CRM114-Status: GOOD (  19.33  )
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

From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

[ Upstream commit 5c03f9f4d36292150c14ebd90788c4d3273ed9dc ]

The boot status in the watchdog device struct is updated during
controller probe stage. Application layer can get the boot status
through the command, cat /sys/class/watchdog/watchdogX/bootstatus.
The bootstatus can be,
WDIOF_CARDRESET => System is reset due to WDT timeout occurs.
Others          => Other reset events, e.g., power on reset.

On ASPEED platforms, boot status is recorded in the SCU registers.
- AST2400: Only a bit is used to represent system reset triggered by
           any WDT controller.
- AST2500/AST2600: System reset triggered by different WDT controllers
                   can be distinguished by different SCU bits.

Besides, on AST2400 and AST2500, since alternating boot event is
also triggered by using WDT timeout mechanism, it is classified
as WDIOF_CARDRESET.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20250113093737.845097-2-chin-ting_kuo@aspeedtech.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/watchdog/aspeed_wdt.c | 81 ++++++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index b72a858bbac70..7bc0fb1df1e00 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -11,21 +11,30 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/kstrtox.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/watchdog.h>
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+struct aspeed_wdt_scu {
+	const char *compatible;
+	u32 reset_status_reg;
+	u32 wdt_reset_mask;
+	u32 wdt_reset_mask_shift;
+};
 
 struct aspeed_wdt_config {
 	u32 ext_pulse_width_mask;
 	u32 irq_shift;
 	u32 irq_mask;
+	struct aspeed_wdt_scu scu;
 };
 
 struct aspeed_wdt {
@@ -39,18 +48,36 @@ static const struct aspeed_wdt_config ast2400_config = {
 	.ext_pulse_width_mask = 0xff,
 	.irq_shift = 0,
 	.irq_mask = 0,
+	.scu = {
+		.compatible = "aspeed,ast2400-scu",
+		.reset_status_reg = 0x3c,
+		.wdt_reset_mask = 0x1,
+		.wdt_reset_mask_shift = 1,
+	},
 };
 
 static const struct aspeed_wdt_config ast2500_config = {
 	.ext_pulse_width_mask = 0xfffff,
 	.irq_shift = 12,
 	.irq_mask = GENMASK(31, 12),
+	.scu = {
+		.compatible = "aspeed,ast2500-scu",
+		.reset_status_reg = 0x3c,
+		.wdt_reset_mask = 0x1,
+		.wdt_reset_mask_shift = 2,
+	},
 };
 
 static const struct aspeed_wdt_config ast2600_config = {
 	.ext_pulse_width_mask = 0xfffff,
 	.irq_shift = 0,
 	.irq_mask = GENMASK(31, 10),
+	.scu = {
+		.compatible = "aspeed,ast2600-scu",
+		.reset_status_reg = 0x74,
+		.wdt_reset_mask = 0xf,
+		.wdt_reset_mask_shift = 16,
+	},
 };
 
 static const struct of_device_id aspeed_wdt_of_table[] = {
@@ -211,6 +238,56 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
 	return 0;
 }
 
+static void aspeed_wdt_update_bootstatus(struct platform_device *pdev,
+					 struct aspeed_wdt *wdt)
+{
+	const struct resource *res;
+	struct aspeed_wdt_scu scu = wdt->cfg->scu;
+	struct regmap *scu_base;
+	u32 reset_mask_width;
+	u32 reset_mask_shift;
+	u32 idx = 0;
+	u32 status;
+	int ret;
+
+	if (!of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt")) {
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		idx = ((intptr_t)wdt->base & 0x00000fff) / resource_size(res);
+	}
+
+	scu_base = syscon_regmap_lookup_by_compatible(scu.compatible);
+	if (IS_ERR(scu_base)) {
+		wdt->wdd.bootstatus = WDIOS_UNKNOWN;
+		return;
+	}
+
+	ret = regmap_read(scu_base, scu.reset_status_reg, &status);
+	if (ret) {
+		wdt->wdd.bootstatus = WDIOS_UNKNOWN;
+		return;
+	}
+
+	reset_mask_width = hweight32(scu.wdt_reset_mask);
+	reset_mask_shift = scu.wdt_reset_mask_shift +
+			   reset_mask_width * idx;
+
+	if (status & (scu.wdt_reset_mask << reset_mask_shift))
+		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+
+	/* clear wdt reset event flag */
+	if (of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt") ||
+	    of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2500-wdt")) {
+		ret = regmap_read(scu_base, scu.reset_status_reg, &status);
+		if (!ret) {
+			status &= ~(scu.wdt_reset_mask << reset_mask_shift);
+			regmap_write(scu_base, scu.reset_status_reg, status);
+		}
+	} else {
+		regmap_write(scu_base, scu.reset_status_reg,
+			     scu.wdt_reset_mask << reset_mask_shift);
+	}
+}
+
 /* access_cs0 shows if cs0 is accessible, hence the reverted bit */
 static ssize_t access_cs0_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
@@ -447,10 +524,10 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		writel(duration - 1, wdt->base + WDT_RESET_WIDTH);
 	}
 
+	aspeed_wdt_update_bootstatus(pdev, wdt);
+
 	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
 	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
-		wdt->wdd.bootstatus = WDIOF_CARDRESET;
-
 		if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
 		    of_device_is_compatible(np, "aspeed,ast2500-wdt"))
 			wdt->wdd.groups = bswitch_groups;
-- 
2.39.5


