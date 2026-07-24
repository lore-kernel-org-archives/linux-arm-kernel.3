Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F909C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c21Lk08D0zYvSjfQjjn7bb1q3ErrrWyvS9nTmoxTl2A=; b=O0IZPn56vm4iEQ1ao86W7Rf44k
	PL4DEN6pxcBtCMoz1OqIO4YQaHRApNu9UtpOI4MVTPZxAK0A/S/OvxrjOQVJrMidGOpz/uzfGzasw
	EBYMh4XGHTtnhnBuG2/c0+Z+ZgyXzWAvYhJ7CnyNniuGROVy1G5Q2U0PGP8ltfB9JMLnja7Eyunmr
	q6LAnjyE777W8k2NcfqUVW2jIRk4+/3ccbpX01TpBu/QkRTth/zvbM0K4wwBu8RZ3kRqp076MuOMd
	kLLSbERmuIjiEgUz5EsCzf1AVvYD6VkxEJRJKgIAxi148MZZQLEISUAId1BPPY+5XnENRQNSO2C2+
	5c8xCgnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBzw-0000000FwWl-0Zv0;
	Fri, 24 Jul 2026 09:15:16 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBzr-0000000FwUP-2djt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:15:13 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-848595b338cso235429b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 02:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784884511; x=1785489311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c21Lk08D0zYvSjfQjjn7bb1q3ErrrWyvS9nTmoxTl2A=;
        b=KSHT4LRXDLLKdAYJqpBEQiJTIB34hjeZNTiVNk1LMWc8hD99gxzNbF8UyZ6m5auyF/
         CDiaPKJEdLhkcsYgiLeKmCxp5xCFaFOofi0BVZEXVgfiqSfb3UeZdXGSdaTvml5EPLYe
         AYC1A2yk99WYo1AuzJk5je//zQTQbCxWeKB1I1QfLexN6fiCqxnLW6AkRRXgNBISI9yl
         P0SQyHkmIHfqpyD9+u6ttgiPiZ9IRnZoU2xVbq/vw5jsgZlkiUDfeBlfM8bSyWpUnfT1
         J0U+kWbqI0WHERnLVjH24QvUJfpAOMUABB5ixSnvZl1mOv5lI3BRBn2S8BZ6A54RZe+v
         SBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784884511; x=1785489311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c21Lk08D0zYvSjfQjjn7bb1q3ErrrWyvS9nTmoxTl2A=;
        b=C3RBIUGDP0kcco9weNBpHTpICM+dRCNNvDO+6JiGAtwRugptXIRAgEuLcE0yBKl6Hn
         V+e/j7yeFpj/1nEEYqxy2XhO4mJ8dEM+0AZro+EamHAL/3MZRc5jYYT3s9MpKJ6KVqLl
         5zo6AaPZShiHmRaM5NI9BeefEiHy8yjfLTWvwc2LsU5MF3ecoB6W0dXrt3fxCW8MkacW
         QkMRUgC+Ivwg6yW+7vTA901I+v5aKK32C0J7LhWUQYi4RUBAqn7CtSWenKQ33H3qYkI8
         /+XD2QLFra88YEgX99Djw8OQ1Y/b9cc0hV2aw76vbksEuJ+0dwjrUa9JdpgjGmBbcJ/D
         K0iA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6/OGg0mcUAycc+kb/cJIc7Uun/bWQUJ/qn30866IcoR2E58tRpEa1KycMwItGt8EstIAEGbG71L3gmdbvrlTT@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm3EW4KFWwqx/WJIjz3HlO9VAygBkwvn7AaAyveXgtQp6OIeE0
	Kd9GMhBFV3k5Em+fsj8VZNEFkqYxyiXViI3+eWLWSBb9R4PGUC1BmIk4778tTQ==
X-Gm-Gg: AR+sD11uCzGWeCwMMJ9i9lWLF2BG2/Z4N5UdhlrIMXEmPOjGhuUtXf7a7JfqWdF/Sjj
	B2NzsyOClizoM7hTSQBDygyOwGNwGkpxZiqja7+3DK2VhTt6Ma3BSPIhzyPiyacT5qGXluFp9b4
	JqwOpkPaU3o2XXRecCL+UuMRgoboHWivMJOQKN11SiKOiY/bsU8wVKnAsZ7Gi07B1lF9Ta7/skk
	o5ZQEjJBX2v83q8RWhIzHTTbeIvY/vMeHoemin6guiYiZ2ymMWNUMGovAw85cE5EpKq+NQhWmI/
	skIFGOKOHWLeT+/8hJ0Fn8GlfV7f1pTPiY8uSmiiDvZgdBPjEm5JR3lmeBGBQgT05pAc39ptqhe
	PfAi6s1xeK+dHqeqjz8sZ9uyQNHVy+fMOgYDsJjPtSMr711kqYvPWteczMFVppTWaRz5snRqd/5
	shFhm7+5IXQlMtR07CvwjMvfpQ/QNxbZl4Y2q9MBivg6097DcrKen15mnAClal
X-Received: by 2002:a05:6a00:9514:b0:84e:685:cbe1 with SMTP id d2e1a72fcca58-84e2bbfc634mr7500141b3a.69.1784884510746;
        Fri, 24 Jul 2026 02:15:10 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237c3fsm4410519b3a.9.2026.07.24.02.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:15:10 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v2 2/3] watchdog: Add Nuvoton MA35D1 watchdog driver support
Date: Fri, 24 Jul 2026 17:14:26 +0800
Message-Id: <20260724091427.1689980-3-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724091427.1689980-1-zychennvt@gmail.com>
References: <20260724091427.1689980-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_021511_720979_FC1F09AA 
X-CRM114-Status: GOOD (  30.78  )
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

Add driver support for the Watchdog Timer (WDT) integrated in
Nuvoton MA35D1 SoC. This driver provides standard watchdog functionality,
including timeout configuration, ping, and system reset support via
the watchdog framework.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 drivers/watchdog/Kconfig      |  10 +
 drivers/watchdog/Makefile     |   1 +
 drivers/watchdog/ma35d1_wdt.c | 358 ++++++++++++++++++++++++++++++++++
 3 files changed, 369 insertions(+)
 create mode 100644 drivers/watchdog/ma35d1_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 08cb8612d41f..972740fd36a6 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -720,6 +720,16 @@ config STMP3XXX_RTC_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called stmp3xxx_rtc_wdt.
 
+config MA35D1_WDT
+	tristate "Nuvoton MA35D1 Watchdog Timer"
+	depends on ARCH_MA35 || COMPILE_TEST
+	select WATCHDOG_CORE
+	help
+	  Say Y here to include support for the watchdog timer
+	  for the Nuvoton MA35D1 series microprosser.
+	  To compile this driver as a module, choose M here: the
+	  module will be called ma35d1_wdt.
+
 config TS4800_WATCHDOG
 	tristate "TS-4800 Watchdog"
 	depends on HAS_IOMEM && OF
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index bc1d52220f22..a7889eb48c7f 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -104,6 +104,7 @@ obj-$(CONFIG_APPLE_WATCHDOG) += apple_wdt.o
 obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
 obj-$(CONFIG_MARVELL_GTI_WDT) += marvell_gti_wdt.o
 obj-$(CONFIG_GUNYAH_WATCHDOG) += gunyah_wdt.o
+obj-$(CONFIG_MA35D1_WDT) += ma35d1_wdt.o
 
 # X86 (i386 + ia64 + x86_64) Architecture
 obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
diff --git a/drivers/watchdog/ma35d1_wdt.c b/drivers/watchdog/ma35d1_wdt.c
new file mode 100644
index 000000000000..e5247e55dfee
--- /dev/null
+++ b/drivers/watchdog/ma35d1_wdt.c
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Nuvoton technology corporation.
+ *
+ * Author: Zi-Yu Chen <zychennvt@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/property.h>
+#include <linux/types.h>
+#include <linux/watchdog.h>
+
+#define DRV_NAME		"ma35d1-wdt"
+
+#define REG_WDT_CTL		0x00
+#define REG_WDT_RSTCNT	0x08
+
+#define TOUTSEL			GENMASK(11, 8)
+#define WDTEN			BIT(7)
+#define INTEN			BIT(6)
+#define WKF				BIT(5)
+#define WKEN			BIT(4)
+#define IF				BIT(3)
+#define RSTF			BIT(2)
+#define RSTEN			BIT(1)
+#define SYNC			BIT(30)
+
+#define WDT_DEFAULT_TIMEOUT		32
+#define RESET_COUNTER			0x00005AA5
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+static unsigned int timeout;
+
+struct ma35d1_wdt_dev {
+	struct watchdog_device wdt_dev;
+	spinlock_t lock;
+	void __iomem *wdt_base;
+	struct clk *clk;
+	unsigned long clk_rate;
+	int irq;
+};
+
+static int ma35d1_wdt_wait_sync(struct ma35d1_wdt_dev *ma35d1_wdt)
+{
+	unsigned int val;
+
+	return readl_relaxed_poll_timeout_atomic(ma35d1_wdt->wdt_base +
+							 REG_WDT_CTL, val, !(val & SYNC), 10, 125);
+}
+
+/**
+ * ma35d1_wdt_stop - Stop the watchdog.
+ *
+ * @wdt_dev: watchdog device
+ *
+ * Read the contents of the CTL register, clear the WDTEN bit
+ * in the register and set the access key for successful write.
+ *
+ * Return: 0 on success, negative error otherwise.
+ */
+static int ma35d1_wdt_stop(struct watchdog_device *wdt_dev)
+{
+	struct ma35d1_wdt_dev *ma35d1_wdt = watchdog_get_drvdata(wdt_dev);
+	unsigned int val;
+	int ret;
+
+	guard(spinlock_irqsave)(&ma35d1_wdt->lock);
+	val = readl_relaxed(ma35d1_wdt->wdt_base + REG_WDT_CTL);
+	val &= ~WDTEN;
+	writel_relaxed(val, ma35d1_wdt->wdt_base + REG_WDT_CTL);
+	ret = ma35d1_wdt_wait_sync(ma35d1_wdt);
+	if (ret) {
+		dev_err(wdt_dev->parent, "Wait for WDTEN SYNC timeout!\n");
+		return ret;
+	}
+	return 0;
+}
+
+static int ma35d1_wdt_ping(struct watchdog_device *wdt_dev)
+{
+	struct ma35d1_wdt_dev *ma35d1_wdt = watchdog_get_drvdata(wdt_dev);
+
+	writel_relaxed(RESET_COUNTER, ma35d1_wdt->wdt_base + REG_WDT_RSTCNT);
+
+	return 0;
+}
+
+static int ma35d1_wdt_set_timeout(struct watchdog_device *wdt_dev,
+				  unsigned int timeout)
+{
+	struct ma35d1_wdt_dev *ma35d1_wdt = watchdog_get_drvdata(wdt_dev);
+	unsigned long target_ticks;
+	unsigned int val, i;
+	static const uint8_t toutsel_shifts[] = { 4,  6,  8,  10, 12,
+						  14, 16, 18, 20 };
+
+	if (timeout < (ma35d1_wdt->wdt_dev.max_hw_heartbeat_ms / 1000)) {
+		target_ticks = (unsigned long)timeout * ma35d1_wdt->clk_rate;
+
+		for (i = 0; i < ARRAY_SIZE(toutsel_shifts); i++) {
+			if ((1UL << toutsel_shifts[i]) >= target_ticks)
+				break;
+		}
+		/* To avoid truncation errors (0 seconds) during division. */
+		wdt_dev->timeout =
+			(1UL << toutsel_shifts[i]) / ma35d1_wdt->clk_rate;
+		if (wdt_dev->timeout == 0)
+			wdt_dev->timeout = 1;
+
+	} else {
+		i = ARRAY_SIZE(toutsel_shifts) - 1;
+		wdt_dev->timeout = timeout;
+	}
+
+	guard(spinlock_irqsave)(&ma35d1_wdt->lock);
+	val = readl_relaxed(ma35d1_wdt->wdt_base + REG_WDT_CTL);
+	val &= ~TOUTSEL;
+	val |= FIELD_PREP(TOUTSEL, i);
+	writel_relaxed(val, ma35d1_wdt->wdt_base + REG_WDT_CTL);
+
+	ma35d1_wdt_ping(wdt_dev);
+	return 0;
+}
+
+static int ma35d1_wdt_start(struct watchdog_device *wdt_dev)
+{
+	struct ma35d1_wdt_dev *ma35d1_wdt = watchdog_get_drvdata(wdt_dev);
+	void __iomem *wdt_base = ma35d1_wdt->wdt_base;
+	unsigned int val;
+	int ret;
+
+	ret = ma35d1_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
+	if (ret < 0)
+		return ret;
+
+	guard(spinlock_irqsave)(&ma35d1_wdt->lock);
+	val = readl_relaxed(wdt_base + REG_WDT_CTL);
+	val |= (WDTEN | RSTEN);
+
+	writel_relaxed(val, wdt_base + REG_WDT_CTL);
+	ret = ma35d1_wdt_wait_sync(ma35d1_wdt);
+	if (ret) {
+		dev_err(wdt_dev->parent, "Wait for WDTEN SYNC timeout!\n");
+		return ret;
+	}
+
+	writel_relaxed(RESET_COUNTER, wdt_base + REG_WDT_RSTCNT);
+
+	return 0;
+}
+
+static const struct watchdog_info ma35d1_wdt_info = {
+	.identity = DRV_NAME,
+	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE |
+		   WDIOF_CARDRESET,
+};
+
+static const struct watchdog_ops ma35d1_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = ma35d1_wdt_start,
+	.stop = ma35d1_wdt_stop,
+	.ping = ma35d1_wdt_ping,
+	.set_timeout = ma35d1_wdt_set_timeout,
+};
+
+static irqreturn_t ma35d1_wdt_isr(int irq, void *dev_id)
+{
+	struct ma35d1_wdt_dev *ma35d1_wdt = dev_id;
+	unsigned int val;
+
+	/* Clear the flag if set */
+	guard(spinlock)(&ma35d1_wdt->lock);
+	val = readl_relaxed(ma35d1_wdt->wdt_base + REG_WDT_CTL);
+	writel_relaxed(val, ma35d1_wdt->wdt_base + REG_WDT_CTL);
+
+	return IRQ_HANDLED;
+}
+
+static int ma35d1_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ma35d1_wdt_dev *ma35d1_wdt;
+	unsigned long clk_rate, val;
+	int ret;
+
+	ma35d1_wdt = devm_kzalloc(dev, sizeof(*ma35d1_wdt), GFP_KERNEL);
+	if (!ma35d1_wdt)
+		return -ENOMEM;
+
+	spin_lock_init(&ma35d1_wdt->lock);
+	platform_set_drvdata(pdev, ma35d1_wdt);
+
+	ma35d1_wdt->wdt_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ma35d1_wdt->wdt_base))
+		return PTR_ERR(ma35d1_wdt->wdt_base);
+
+	ma35d1_wdt->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(ma35d1_wdt->clk))
+		return dev_err_probe(dev, PTR_ERR(ma35d1_wdt->clk),
+				     "Can't get Watchdog clock\n");
+
+	clk_rate = clk_get_rate(ma35d1_wdt->clk);
+	if (!clk_rate)
+		return -EINVAL;
+	ma35d1_wdt->clk_rate = clk_rate;
+
+	ma35d1_wdt->irq = platform_get_irq(pdev, 0);
+	if (ma35d1_wdt->irq < 0)
+		return dev_err_probe(dev, ma35d1_wdt->irq,
+				     "failed to get irq\n");
+
+	ma35d1_wdt->wdt_dev.info = &ma35d1_wdt_info;
+	ma35d1_wdt->wdt_dev.ops = &ma35d1_wdt_ops;
+	ma35d1_wdt->wdt_dev.timeout = WDT_DEFAULT_TIMEOUT;
+	ma35d1_wdt->wdt_dev.min_timeout = 1;
+	ma35d1_wdt->wdt_dev.max_hw_heartbeat_ms = (1U << 20) * 1000 / clk_rate;
+	ma35d1_wdt->wdt_dev.parent = dev;
+
+	val = readl_relaxed(ma35d1_wdt->wdt_base + REG_WDT_CTL);
+	if (val & RSTF) {
+		ma35d1_wdt->wdt_dev.bootstatus = WDIOF_CARDRESET;
+		writel_relaxed(val, ma35d1_wdt->wdt_base + REG_WDT_CTL);
+	}
+
+	if (val & WDTEN)
+		set_bit(WDOG_HW_RUNNING, &ma35d1_wdt->wdt_dev.status);
+
+	watchdog_set_drvdata(&ma35d1_wdt->wdt_dev, ma35d1_wdt);
+	watchdog_set_nowayout(&ma35d1_wdt->wdt_dev, nowayout);
+	watchdog_init_timeout(&ma35d1_wdt->wdt_dev, timeout, &pdev->dev);
+
+	ret = devm_request_irq(dev, ma35d1_wdt->irq, ma35d1_wdt_isr, 0,
+			       dev_name(dev), ma35d1_wdt);
+	if (ret)
+		return dev_err_probe(dev, ret, "cannot claim IRQ %d\n",
+				     ma35d1_wdt->irq);
+
+	if (device_property_read_bool(dev, "wakeup-source")) {
+		ret = devm_device_init_wakeup(dev);
+		if (ret)
+			return ret;
+
+		ret = devm_pm_set_wake_irq(dev, ma35d1_wdt->irq);
+		if (ret)
+			return ret;
+	}
+
+	watchdog_stop_on_reboot(&ma35d1_wdt->wdt_dev);
+	watchdog_stop_on_unregister(&ma35d1_wdt->wdt_dev);
+	ret = devm_watchdog_register_device(dev, &ma35d1_wdt->wdt_dev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int ma35d1_wdt_suspend(struct device *dev)
+{
+	struct ma35d1_wdt_dev *ma35d1_wdt = dev_get_drvdata(dev);
+
+	if (watchdog_active(&ma35d1_wdt->wdt_dev)) {
+		u32 val;
+		int ret;
+
+		guard(spinlock_irqsave)(&ma35d1_wdt->lock);
+		val = readl_relaxed(ma35d1_wdt->wdt_base + REG_WDT_CTL);
+
+		if (device_may_wakeup(dev)) {
+			val &= ~RSTEN;
+			val |= (INTEN | WKEN);
+		} else {
+			val &= ~(WDTEN | RSTEN);
+		}
+		writel_relaxed(val, ma35d1_wdt->wdt_base + REG_WDT_CTL);
+		ret = ma35d1_wdt_wait_sync(ma35d1_wdt);
+		if (ret) {
+			dev_err(dev, "Wait for WDTEN SYNC timeout!\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int ma35d1_wdt_resume(struct device *dev)
+{
+	struct ma35d1_wdt_dev *ma35d1_wdt = dev_get_drvdata(dev);
+
+	if (watchdog_active(&ma35d1_wdt->wdt_dev)) {
+		u32 val;
+		int ret;
+
+		guard(spinlock_irqsave)(&ma35d1_wdt->lock);
+		val = readl_relaxed(ma35d1_wdt->wdt_base + REG_WDT_CTL);
+
+		if (device_may_wakeup(dev)) {
+			val |= RSTEN;
+			val &= ~(INTEN | WKEN);
+		} else {
+			val |= (WDTEN | RSTEN);
+		}
+		writel_relaxed(val, ma35d1_wdt->wdt_base + REG_WDT_CTL);
+		writel_relaxed(RESET_COUNTER,
+			       ma35d1_wdt->wdt_base + REG_WDT_RSTCNT);
+		ret = ma35d1_wdt_wait_sync(ma35d1_wdt);
+		if (ret) {
+			dev_err(dev, "Wait for WDTEN SYNC timeout!\n");
+			return ret;
+		}
+	}
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(ma35d1_wdt_pm_ops, ma35d1_wdt_suspend,
+				ma35d1_wdt_resume);
+
+static const struct of_device_id ma35d1_wdt_dt_ids[] = {
+	{ .compatible = "nuvoton,ma35d1-wdt" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, ma35d1_wdt_dt_ids);
+
+static struct platform_driver ma35d1_wdt_driver = {
+	.probe		= ma35d1_wdt_probe,
+	.driver		= {
+		.name	= DRV_NAME,
+		.pm	= pm_ptr(&ma35d1_wdt_pm_ops),
+		.of_match_table = ma35d1_wdt_dt_ids,
+	},
+};
+
+module_platform_driver(ma35d1_wdt_driver);
+
+module_param(timeout, uint, 0);
+MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds");
+
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(
+	nowayout,
+	"Watchdog cannot be stopped once started (default=" __MODULE_STRING(
+		WATCHDOG_NOWAYOUT) ")");
+
+MODULE_AUTHOR("Zi-Yu Chen <zychennvt@gmail.com>");
+MODULE_DESCRIPTION("Nuvoton MA35D1 Watchdog Timer Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


