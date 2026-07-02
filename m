Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B531C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 12:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1yHZB5AviYxr5fmROqofg2BuKQBlTZihY4YP4MX0BU=; b=a1gAjnhWUQLEALSf3jok3gC0ia
	X4oMSNSbV26drqGiWhUl/O5+DTfoVvFvTlrz2g7j4qkUmtk9fhxGFQjBtZ3u20NkCxAygzPhQqahg
	JV3P6tsV2D12HP9zlza06MHsTmGj5BZzYeQcOj4rbQXqQKHdrq84bXUOA3LlwaHMS2OMfA9dXrmPB
	qOec5Gxv523XmttLq56fm0xhNCWBw9d/79l6R5T5EnR2qeOmzh7g8SqHDAxBbP0bnXvTh2mClGghz
	rYvDIyU182BaiGFldoR1uvhlmG7d+XQZfOhmadFQ3n0YTInI2yJbaqN7SE5Zv6l7q2YkGxz4SfkLj
	Zvpkzr6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGC0-00000004PTs-0C8O;
	Thu, 02 Jul 2026 12:06:56 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGBv-00000004PQy-2XHT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 12:06:54 +0000
Received: by chaosmail.tech (Postfix) id 8FBDC1C9A55;
	Thu, 02 Jul 2026 12:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1782994007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W1yHZB5AviYxr5fmROqofg2BuKQBlTZihY4YP4MX0BU=;
	b=hQrjoXVe2ntYBnihlrb5XU/kKZg4anCmNIfBvFVCQox+e2PNGPUOboMCtv53I+ysGVDS2J
	0JWneVarn/4xQ5FrZezADJ9p0OHwcId7cKjCT+mXwqg4MHxvFf3qpG+SLS9vPrwPzYx4ix
	oQcXC6TrYgd+k/UgyDwy+y0IhIHwU18=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Thu, 02 Jul 2026 14:06:27 +0200
Subject: [PATCH 2/3] soc: apple: Add driver for Apple PMGR misc controls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-pmgr-misc-v1-2-4f075a3a95c1@chaosmail.tech>
References: <20260702-pmgr-misc-v1-0-4f075a3a95c1@chaosmail.tech>
In-Reply-To: <20260702-pmgr-misc-v1-0-4f075a3a95c1@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Hector Martin <marcan@marcan.st>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782994005; l=6831;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=reoMDQbT1uhWC6UmxrewOx01OsscnNt1iPEbvhra2Pw=;
 b=xMP/C7D1M4o6aB4iifR3TiRgKO1GNCECaDNT/1HX/GG7pkEJv4W6NbUBoyeWLyYYNn+4RKPg9
 4EO3s0kEyltAjseZFg7EcS9JlkTdQiw8GHULWFLi40JIFkP4/glOux8
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_050652_115160_45CE23CF 
X-CRM114-Status: GOOD (  20.63  )
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

From: Hector Martin <marcan@marcan.st>

Apple SoCs have PMGR blocks that control a bunch of power-related
features. Besides the existing device power state controls (which are
very uniform and handled by apple-pmgr-pwrstate), we also need to manage
more random registers such as SoC-wide fabric and memory controller
power states, which have a different interface.

Add a driver for these kitchen sink controls. Right now it implements
fabric and memory controller power state switching on system
standby/s2idle, which saves about 1W of power or so on t60xx platforms.

Signed-off-by: Hector Martin <marcan@marcan.st>
Co-developed-by: Sasha Finkelstein <k@chaosmail.tech>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/soc/apple/Kconfig           |  10 ++++++++
 drivers/soc/apple/Makefile          |   2 ++
 drivers/soc/apple/apple-pmgr-misc.c | 177 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 189 insertions(+)

diff --git a/drivers/soc/apple/Kconfig b/drivers/soc/apple/Kconfig
index d0ff32182a2b..cad847c90df8 100644
--- a/drivers/soc/apple/Kconfig
+++ b/drivers/soc/apple/Kconfig
@@ -16,6 +16,16 @@ config APPLE_MAILBOX
 
 	  Say Y here if you have an Apple SoC.
 
+config APPLE_PMGR_MISC
+	bool "Apple SoC PMGR miscellaneous support"
+	depends on PM
+	help
+	  The PMGR block in Apple SoCs provides high-level power state
+	  controls for SoC devices. This driver manages miscellaneous
+	  power controls.
+
+	  Say 'y' here if you have a Pro/Max/Ultra Apple SoC.
+
 config APPLE_RTKIT
 	tristate "Apple RTKit co-processor IPC protocol"
 	depends on APPLE_MAILBOX
diff --git a/drivers/soc/apple/Makefile b/drivers/soc/apple/Makefile
index 0b85ab61aefe..0481f7f43b06 100644
--- a/drivers/soc/apple/Makefile
+++ b/drivers/soc/apple/Makefile
@@ -3,6 +3,8 @@
 obj-$(CONFIG_APPLE_MAILBOX) += apple-mailbox.o
 apple-mailbox-y = mailbox.o
 
+obj-$(CONFIG_APPLE_PMGR_MISC)	+= apple-pmgr-misc.o
+
 obj-$(CONFIG_APPLE_RTKIT) += apple-rtkit.o
 apple-rtkit-y = rtkit.o rtkit-crashlog.o
 
diff --git a/drivers/soc/apple/apple-pmgr-misc.c b/drivers/soc/apple/apple-pmgr-misc.c
new file mode 100644
index 000000000000..d487a87ecddb
--- /dev/null
+++ b/drivers/soc/apple/apple-pmgr-misc.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SoC PMGR device power state driver
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include <linux/bitops.h>
+#include <linux/bitfield.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+
+#define APPLE_CLKGEN_PSTATE 0
+#define APPLE_CLKGEN_PSTATE_DESIRED GENMASK(3, 0)
+
+#define SYS_DEV_PSTATE_SUSPEND 1
+
+enum sys_device {
+	DEV_FABRIC,
+	DEV_DCS,
+	DEV_MAX,
+};
+
+struct apple_pmgr_sys_device {
+	void __iomem *base;
+	u32 active_state;
+	u32 suspend_state;
+};
+
+struct apple_pmgr_misc_hw {
+	u32 dev_min_ps[DEV_MAX];
+};
+
+struct apple_pmgr_misc {
+	struct device *dev;
+	struct apple_pmgr_sys_device devices[DEV_MAX];
+};
+
+static void apple_pmgr_sys_dev_set_pstate(struct apple_pmgr_misc *misc,
+					  enum sys_device dev, bool active)
+{
+	u32 pstate;
+	u32 val;
+
+	if (!misc->devices[dev].base)
+		return;
+
+	if (active)
+		pstate = misc->devices[dev].active_state;
+	else
+		pstate = misc->devices[dev].suspend_state;
+
+	dev_dbg(misc->dev, "set %d ps to pstate %d\n", dev, pstate);
+
+	val = readl_relaxed(misc->devices[dev].base + APPLE_CLKGEN_PSTATE);
+	val &= ~APPLE_CLKGEN_PSTATE_DESIRED;
+	val |= FIELD_PREP(APPLE_CLKGEN_PSTATE_DESIRED, pstate);
+	writel_relaxed(val, misc->devices[dev].base);
+}
+
+static int __maybe_unused apple_pmgr_misc_suspend_noirq(struct device *dev)
+{
+	struct apple_pmgr_misc *misc = dev_get_drvdata(dev);
+	int i;
+
+	for (i = 0; i < DEV_MAX; i++)
+		apple_pmgr_sys_dev_set_pstate(misc, i, false);
+
+	return 0;
+}
+
+static int __maybe_unused apple_pmgr_misc_resume_noirq(struct device *dev)
+{
+	struct apple_pmgr_misc *misc = dev_get_drvdata(dev);
+	int i;
+
+	for (i = 0; i < DEV_MAX; i++)
+		apple_pmgr_sys_dev_set_pstate(misc, i, true);
+
+	return 0;
+}
+
+static bool apple_pmgr_init_device(struct apple_pmgr_misc *misc,
+				   const struct apple_pmgr_misc_hw *hw,
+				   enum sys_device dev,
+				   const char *device_name)
+{
+	void __iomem *base;
+	char name[32];
+	u32 val;
+
+	snprintf(name, sizeof(name), "%s-ps", device_name);
+
+	base = devm_platform_ioremap_resource_byname(
+		to_platform_device(misc->dev), name);
+	if (!base)
+		return false;
+
+	val = readl_relaxed(base + APPLE_CLKGEN_PSTATE);
+
+	misc->devices[dev].base = base;
+	misc->devices[dev].active_state =
+		FIELD_GET(APPLE_CLKGEN_PSTATE_DESIRED, val);
+	misc->devices[dev].suspend_state = hw->dev_min_ps[dev];
+
+	return true;
+}
+
+static int apple_pmgr_misc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct apple_pmgr_misc_hw *hw;
+	struct apple_pmgr_misc *misc;
+	int ret = -ENODEV;
+
+	misc = devm_kzalloc(dev, sizeof(*misc), GFP_KERNEL);
+	if (!misc)
+		return -ENOMEM;
+
+	misc->dev = dev;
+	hw = of_device_get_match_data(dev);
+
+	if (apple_pmgr_init_device(misc, hw, DEV_FABRIC, "fabric"))
+		ret = 0;
+
+	if (apple_pmgr_init_device(misc, hw, DEV_DCS, "dcs"))
+		ret = 0;
+
+	platform_set_drvdata(pdev, misc);
+
+	return ret;
+}
+
+static const struct apple_pmgr_misc_hw apple_pmgr_misc_hw_t600x = {
+	.dev_min_ps = {
+		[DEV_FABRIC] = SYS_DEV_PSTATE_SUSPEND,
+		[DEV_DCS] = 7,
+	},
+};
+
+static const struct apple_pmgr_misc_hw apple_pmgr_misc_hw_t602x = {
+	.dev_min_ps = {
+		[DEV_FABRIC] = SYS_DEV_PSTATE_SUSPEND,
+		[DEV_DCS] = SYS_DEV_PSTATE_SUSPEND,
+	},
+};
+
+static const struct of_device_id apple_pmgr_misc_of_match[] = {
+	{ .compatible = "apple,t6000-pmgr-misc", .data = &apple_pmgr_misc_hw_t600x },
+	{ .compatible = "apple,t6020-pmgr-misc", .data = &apple_pmgr_misc_hw_t602x },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, apple_pmgr_misc_of_match);
+
+static const struct dev_pm_ops apple_pmgr_misc_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(apple_pmgr_misc_suspend_noirq,
+				      apple_pmgr_misc_resume_noirq)
+};
+
+static struct platform_driver apple_pmgr_misc_driver = {
+	.probe = apple_pmgr_misc_probe,
+	.driver = {
+		.name = "apple-pmgr-misc",
+		.of_match_table = apple_pmgr_misc_of_match,
+		.pm = pm_ptr(&apple_pmgr_misc_pm_ops),
+	},
+};
+
+MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
+MODULE_DESCRIPTION("PMGR misc driver for Apple SoCs");
+MODULE_LICENSE("GPL");
+
+module_platform_driver(apple_pmgr_misc_driver);

-- 
2.55.0


