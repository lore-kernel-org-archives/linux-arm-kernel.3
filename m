Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE90DC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 19:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1kWPjrBd/613IEnzahoCitSYpNjnmHuaFTPRIcMwrRo=; b=RzWYpAuhqss4mMHnf666UW5c69
	kSoNkfv2ul/OwaPGWWH9paY/8AdG1j9uyrU+++KxA/u1essrtJoo9/8Rw4V3y2jMZ63DGUfMW2tpR
	/Kxd0557W5f1AfBPWE9tR3qgM4SDEYOBv7ykTN7B9yulwfKg66qxU2a6JihWM837EnXz3tr4CrMjt
	jH5GLgSfkoZ6rhaMuAWFEARWWfm8vYkjMmIEUI76g+lSJ+dx2RsNCKuxaaFC7SjJ0kxBoQ4rjiIY2
	O1AWH9Wf8istrZ3SeQVyBHrs4A4Xf+pIi3wmkyEwn15NwdtyDfWomneHtMVojFUARAJNXPb8+EebV
	naA3pBzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdv6-00000001dsS-3G0V;
	Thu, 15 May 2025 19:07:04 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdjz-00000001c9a-49O2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 18:55:37 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-54fd1650b83so1450019e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 11:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747335334; x=1747940134; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1kWPjrBd/613IEnzahoCitSYpNjnmHuaFTPRIcMwrRo=;
        b=QDZ24vlvm/jgLYWxR8UoNJWDFDJMkvLPHTwu3vNJkCjcJYnd1ayrt4+Vgf7W98Zqbu
         21nK/87rtSF3YmgB/cG9l1KbitIQFku5oPlTwij0YLpmUSTRqHPexLllakFfiV8G33jp
         uKgLSixeBxKIyIkMk9MqGdN5+MXIKp17iqlbydEvESIY+ez/h+43nQk9yQQQOTeuuVSY
         HmbCnVwWPqJyZixoZasWBXGNd9zTlrCJZvmJzlIpj5daz31XB9R9TuLfBx55GM3ATdA8
         8iwdbA8JHJFSCdHWMR8iGscp2YLaHUFakyghRtG+BVjlFqhyzvpV86pXe2Ufm+vdgx44
         GxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747335334; x=1747940134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1kWPjrBd/613IEnzahoCitSYpNjnmHuaFTPRIcMwrRo=;
        b=rzC60pVv+i8HyDzTqIcmcUM/M/TlvZkycgDjuERxe57AGXElpy2+PVv7krooVYNvW2
         s2g+DjyqTwTYXBTo7B5qDF2LLaO//BzShj75k2Hweb8Vf4t96Y8vQMf76iDShoobRtJz
         Gu+Pfyw7581Yfn1cJ8Rf3ByTml+FM7ipvg54M02yPEx1x/mAm3b5jjuL1UboZ58uPLHs
         GQ88EjwRRSNQJAVzuWqBfAuEVdsVGW6Sg6ahI6FKr6/JBtYutWbiys03y5KQ8NDQb7X6
         MVOf5NsXlTtPgXR3FXtLMu4FUrRMQC6rX6cE5rtJa3iNTm5y4RjLIWsxHfOBPNXHC2Ym
         vRzA==
X-Gm-Message-State: AOJu0YzP8o+LjUSBTHndFHe8/bWG4fd1UEkJ0NTu31dX8nI0A0GtPbFM
	Tg8qQ1GxqQyfLYLnaJx7hvia0Xu6hio0gpabQTsDyREElwbTLrTqUZGV
X-Gm-Gg: ASbGncsbIihAmTsj0+5ekI36Vs7PBCPx0KVD1o+Tzu6MHRPOXixwi2gEx28rsM332ez
	wU6Nin2E9BleR7p7r+LFgU8vnTPsOfC3erYku+bVIHWtJNTqIxUgQiFaaLE5gXnQ1yLwufrg67D
	XSdVJHLY6t1KSGiwJ3ePMI5HAL95pNZC5Yh0txmSBFQiRr0kMxlATViHyFX+43SB65CfUBVvGPz
	kMxeA17R5wRK38dC4Bxr5hYOgPvReVhaQKVmvnMGQ8DHHwrdcLixKY/CSe4ICpGKR8B+c06XUqW
	40KalQ6hj54aJDI7qJ0iXVdhiD1JvjxCbs+gThWhXaPAQcqtqlUv8HF23gSZKlp5
X-Google-Smtp-Source: AGHT+IGEs4fWZGHCmoPX8DHxcqfmeaQBK7SGcY2ZAhMdx5ivNIe71+v8W7lZ8Ob1Opu59vWYlaooiQ==
X-Received: by 2002:a05:6512:31d2:b0:54a:cc76:ad5e with SMTP id 2adb3069b0e04-550e71981e2mr223781e87.3.1747335333916;
        Thu, 15 May 2025 11:55:33 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([95.167.212.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702dd8asm60389e87.196.2025.05.15.11.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:55:33 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 15 May 2025 21:55:29 +0300
Subject: [PATCH v3 4/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-vt8500-timer-updates-v3-4-2197a1b062bd@gmail.com>
References: <20250515-vt8500-timer-updates-v3-0-2197a1b062bd@gmail.com>
In-Reply-To: <20250515-vt8500-timer-updates-v3-0-2197a1b062bd@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747335328; l=6862;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=2XFRYiD91queAeJhWuLHIGRtox7ITgkji4UZkOxOnJU=;
 b=TCQO3le/NzI+O9M2LYnIFQZPy6L1dVDvBwVsgTeULw4pXLs/se7iBNx5Z11uwcTanQn+OeT+N
 PalmzHKo5kvAqLiKno6ziebxGbP/kUaEgcuoAV8Kx+bhK2dIPyFI6nq
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_115536_034236_4DB41FB4 
X-CRM114-Status: GOOD (  26.50  )
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

VIA/WonderMedia SoCs can use their system timer's first channel as a
watchdog device which will reset the system if the clocksource counter
matches the value given in its match register 0 and if the watchdog
function is enabled.

Since the watchdog function is tightly coupled to the timer itself, it
is implemented as a child platform device of the timer device, and just
reuses the MMIO registers already remapped by the timer driver. This is
similar to the approach taken by gxp-wdt.c

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 MAINTAINERS                   |   1 +
 drivers/watchdog/Kconfig      |  14 +++++
 drivers/watchdog/Makefile     |   1 +
 drivers/watchdog/vt8500-wdt.c | 116 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 132 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b8b2843491c47182a4fc6c76f5c29b6c411830a6..d809643b76ad299ca1c08804540b08cc4a7184a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3446,6 +3446,7 @@ F:	drivers/tty/serial/vt8500_serial.c
 F:	drivers/video/fbdev/vt8500lcdfb.*
 F:	drivers/video/fbdev/wm8505fb*
 F:	drivers/video/fbdev/wmt_ge_rops.*
+F:	drivers/watchdog/vt8500-wdt.c
 
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@amd.com>
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0d8d37f712e8cfb4bf8156853baa13c23a57d6d9..429e4e775f1f458fd457067a3a039a5d544b4818 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -2003,6 +2003,20 @@ config PIC32_DMT
 	  To compile this driver as a loadable module, choose M here.
 	  The module will be called pic32-dmt.
 
+config VT8500_WATCHDOG
+	tristate "VIA/WonderMedia VT8500 watchdog support"
+	depends on ARCH_VT8500 || COMPILE_TEST
+	select WATCHDOG_CORE
+	help
+	  VIA/WonderMedia SoCs can use their system timer as a hardware
+	  watchdog, as long as the first timer channel is free from other
+	  uses and respective function is enabled in its registers. To
+	  make use of it, say Y here and ensure that the device tree
+	  lists at least two interrupts for the VT8500 timer device.
+
+	  To compile this driver as a module, choose M here.
+	  The module will be called vt8500-wdt.
+
 # PARISC Architecture
 
 # POWERPC Architecture
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index c9482904bf870a085c7fce2a439ac5089b6e6fee..3072786bf226c357102be3734fe6e701f753d45b 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
 obj-$(CONFIG_APPLE_WATCHDOG) += apple_wdt.o
 obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
 obj-$(CONFIG_MARVELL_GTI_WDT) += marvell_gti_wdt.o
+obj-$(CONFIG_VT8500_WATCHDOG) += vt8500-wdt.o
 
 # X86 (i386 + ia64 + x86_64) Architecture
 obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
diff --git a/drivers/watchdog/vt8500-wdt.c b/drivers/watchdog/vt8500-wdt.c
new file mode 100644
index 0000000000000000000000000000000000000000..8e605c850dd9f42c90104f362b74adac63dd9fdb
--- /dev/null
+++ b/drivers/watchdog/vt8500-wdt.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2025 Alexey Charkov <alchark@gmail.com */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+#include <linux/watchdog.h>
+
+#define TIMER_MATCH_REG(x)	(4 * (x))
+#define TIMER_COUNT_REG		0x0010	 /* clocksource counter */
+
+#define TIMER_WATCHDOG_EN_REG	0x0018
+#define TIMER_WD_EN		BIT(0)
+
+#define TIMER_CTRL_REG		0x0020
+#define TIMER_CTRL_ENABLE	BIT(0)	 /* enable clocksource counter */
+#define TIMER_CTRL_RD_REQ	BIT(1)	 /* request counter read */
+
+#define TIMER_ACC_STS_REG	0x0024	 /* access status */
+#define TIMER_ACC_WR_MATCH(x)	BIT((x)) /* writing Match (x) value */
+#define TIMER_ACC_WR_COUNTER	BIT(4)	 /* writing clocksource counter */
+#define TIMER_ACC_RD_COUNTER	BIT(5)	 /* reading clocksource counter */
+
+#define VT8500_TIMER_HZ		3000000
+#define msecs_to_loops(t) (loops_per_jiffy / 1000 * HZ * t)
+
+struct vt8500_wdt {
+	void __iomem *regbase;
+	struct watchdog_device wdd;
+};
+
+static u64 vt8500_timer_read(void __iomem *regbase)
+{
+	int loops = msecs_to_loops(10);
+
+	writel(TIMER_CTRL_ENABLE | TIMER_CTRL_RD_REQ, regbase + TIMER_CTRL_REG);
+	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_RD_COUNTER
+	     && --loops)
+		cpu_relax();
+	return readl(regbase + TIMER_COUNT_REG);
+}
+
+static int vt8500_watchdog_start(struct watchdog_device *wdd)
+{
+	struct vt8500_wdt *drvdata = watchdog_get_drvdata(wdd);
+	u64 cycles = wdd->timeout * VT8500_TIMER_HZ;
+	u64 deadline = vt8500_timer_read(drvdata->regbase) + cycles;
+
+	writel((u32)deadline, drvdata->regbase + TIMER_MATCH_REG(0));
+	writel(TIMER_WD_EN, drvdata->regbase + TIMER_WATCHDOG_EN_REG);
+	return 0;
+}
+
+static int vt8500_watchdog_stop(struct watchdog_device *wdd)
+{
+	struct vt8500_wdt *drvdata = watchdog_get_drvdata(wdd);
+
+	writel(0, drvdata->regbase + TIMER_WATCHDOG_EN_REG);
+	return 0;
+}
+
+static const struct watchdog_ops vt8500_watchdog_ops = {
+	.start			= vt8500_watchdog_start,
+	.stop			= vt8500_watchdog_stop,
+};
+
+static const struct watchdog_info vt8500_watchdog_info = {
+	.identity		= "VIA VT8500 watchdog",
+	.options		= WDIOF_MAGICCLOSE |
+				  WDIOF_KEEPALIVEPING |
+				  WDIOF_SETTIMEOUT,
+};
+
+static int vt8500_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct vt8500_wdt *drvdata;
+
+	drvdata = devm_kzalloc(dev, sizeof(struct vt8500_wdt), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	/*
+	 * The register area where the timer and watchdog reside is disarranged.
+	 * Hence mapping individual register blocks for the timer and watchdog
+	 * is not recommended as they would have access to each others
+	 * registers. The timer driver creates the watchdog as a child device.
+	 * During the watchdogs creation, the timer driver passes the base
+	 * address to the watchdog over the private interface.
+	 */
+
+	drvdata->regbase = (void __iomem *)dev->platform_data;
+
+	drvdata->wdd.info = &vt8500_watchdog_info;
+	drvdata->wdd.ops = &vt8500_watchdog_ops;
+	drvdata->wdd.max_hw_heartbeat_ms = -1UL / (VT8500_TIMER_HZ / 1000);
+	drvdata->wdd.parent = dev;
+
+	watchdog_set_drvdata(&drvdata->wdd, drvdata);
+
+	return devm_watchdog_register_device(dev, &drvdata->wdd);
+}
+
+static struct platform_driver vt8500_wdt_driver = {
+	.probe = vt8500_wdt_probe,
+	.driver = {
+		.name =	"vt8500-wdt",
+	},
+};
+module_platform_driver(vt8500_wdt_driver);
+
+MODULE_AUTHOR("Alexey Charkov <alchark@gmail.com>");
+MODULE_DESCRIPTION("Driver for the VIA VT8500 watchdog timer");
+MODULE_LICENSE("GPL");

-- 
2.49.0


