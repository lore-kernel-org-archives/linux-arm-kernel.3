Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191F9C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 23:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Te2N0Ehb2hIy0mh9b8m69QeJVdXvUxmS1kbyHlQdpeI=; b=aEB0oS0FMg9N4dAK4lO1Cwok03
	5/Xb/IUX6rnF/pMsEbPVd5iH+f/c5oiIm5fs+GU79cFDNjK+TJiS5dr6fVQ5Qib24hQhDgY4ojwFe
	puX1hBFmbxx7WjMAkZWnOoBPg9R7JWwGr6F/hacZd33QSjZdoETI7ATkSnd2T+XTOxGaD9uu0VyF/
	7h6JxUFx3WHaOOJGi+KhTf9cVGhmkBp74tgr9d8ssbPUj1qxWk6O+on3U4Wo7LNnx9ued08Irc0lK
	0eY3P9r1GVbX/b/6biOd0sSSMkbbZr4/0qMqa+BCO5b8nfQLAaNP2SDHn/CA8vNdtiK8rqZEMrlhU
	a/mrl+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFzs-00000003KIA-32Em;
	Thu, 20 Feb 2025 23:30:24 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFvF-00000003J5D-2lSe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 23:25:39 +0000
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KL98lh029271;
	Thu, 20 Feb 2025 15:25:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=T
	e2N0Ehb2hIy0mh9b8m69QeJVdXvUxmS1kbyHlQdpeI=; b=VhqBqKG63bmCD6w53
	KkX/676Z62qJQ/00pdUWclIqJ+waXpeJWgotVm48z3HekucNMHI0RNoVXLPx06Fo
	l5wW5LdB4uQUsgylu+0QjsoO8ASQHmxU6vKk9NbL+IN02AVaQfkCewBPKuHbWSRW
	rz/3AnBfq5X0XCPpQMIjfnwnazTlhAj9ps7wl9sV8YZzqkY9vVlWksg1IJG47oE7
	vELNxuge7M9x6uhtqEFcMtlL33nD1DaTBMIBoRPTLCDNqqKOjXqnAgvZFYavW8QS
	seSNKe7tAxhoq/1sw1osYjt+iWV/skQ0YfD6ir03Su4vjpRgvQcbT15OhXahocrS
	jFRxw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 44xc24r915-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 15:25:31 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 20 Feb 2025 15:25:30 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 20 Feb 2025 15:25:30 -0800
Received: from wd-ubuntu-24-04.marvell.com (wd-ubuntu-24-04.marvell.com [10.111.132.113])
	by maili.marvell.com (Postfix) with ESMTP id 0C4235B692D;
	Thu, 20 Feb 2025 15:25:30 -0800 (PST)
From: Wilson Ding <dingwei@marvell.com>
To: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
        <sebastian.hesselbarth@gmail.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <salee@marvell.com>, <gakula@marvell.com>,
        Wilson Ding <dingwei@marvell.com>
Subject: [PATCH v2 3/4] reset: Add support for Armada8K reset controller
Date: Thu, 20 Feb 2025 15:25:26 -0800
Message-ID: <20250220232527.882888-4-dingwei@marvell.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220232527.882888-1-dingwei@marvell.com>
References: <20250220232527.882888-1-dingwei@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: oouzwpn9sRE_GUopu0MLjFdKUgDk3Yfa
X-Proofpoint-ORIG-GUID: oouzwpn9sRE_GUopu0MLjFdKUgDk3Yfa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_152537_819445_97DF69CE 
X-CRM114-Status: GOOD (  30.56  )
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

Armada8K has one register for unit soft-reset configuration within the
system controller register area. This patch created a new driver based
on the simple-reset driver to support the reset controller of a SYSCON
device.

Signed-off-by: Wilson Ding <dingwei@marvell.com>
---
 drivers/reset/Kconfig               |  12 ++
 drivers/reset/Makefile              |   1 +
 drivers/reset/reset-simple-syscon.c | 195 ++++++++++++++++++++++++++++
 include/linux/reset/reset-simple.h  |   3 +
 4 files changed, 211 insertions(+)
 create mode 100644 drivers/reset/reset-simple-syscon.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 5b3abb6db248..e98b22195317 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -248,6 +248,18 @@ config RESET_SIMPLE
 	   - SiFive FU740 SoCs
 	   - Sophgo SoCs
 
+config RESET_SIMPLE_SYSCON
+	bool "Simple SYSCON Reset Controller Driver" if COMPILE_TEST || EXPERT
+	depends on HAS_IOMEM
+	select MFD_SYSCON
+	help
+	  This enables a simple reset controller driver for reset lines that
+	  that can be asserted and deasserted by toggling bits in a contiguous,
+	  exclusive register space.
+
+	  Currently this driver supports:
+	   - Marvell Armada8K SoCs
+
 config RESET_SOCFPGA
 	bool "SoCFPGA Reset Driver" if COMPILE_TEST && (!ARM || !ARCH_INTEL_SOCFPGA)
 	default ARM && ARCH_INTEL_SOCFPGA
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 677c4d1e2632..c43642fe4d9b 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_RESET_RASPBERRYPI) += reset-raspberrypi.o
 obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) += reset-rzg2l-usbphy-ctrl.o
 obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
+obj-$(CONFIG_RESET_SIMPLE_SYSCON) += reset-simple-syscon.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
 obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
diff --git a/drivers/reset/reset-simple-syscon.c b/drivers/reset/reset-simple-syscon.c
new file mode 100644
index 000000000000..aeeb9e9550f5
--- /dev/null
+++ b/drivers/reset/reset-simple-syscon.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Simple SYSCON Reset Controller Driver
+ *
+ * Copyright (C) 2025 Marvell, Wilson Ding <dingwei@marvell.com>
+ *
+ * Based on Simple Reset Controller Driver
+ *
+ * Copyright (C) 2017 Pengutronix, Philipp Zabel <kernel@pengutronix.de>
+ * Copyright 2013 Maxime Ripard <maxime.ripard@free-electrons.com>
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+#include <linux/reset/reset-simple.h>
+#include <linux/spinlock.h>
+
+static inline struct reset_simple_data *
+to_reset_simple_data(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct reset_simple_data, rcdev);
+}
+
+static int reset_simple_syscon_update(struct reset_controller_dev *rcdev,
+				      unsigned long id, bool assert)
+{
+	struct reset_simple_data *data = to_reset_simple_data(rcdev);
+	int reg_width = sizeof(u32);
+	int bank = id / (reg_width * BITS_PER_BYTE);
+	int offset = id % (reg_width * BITS_PER_BYTE);
+	u32 mask, val;
+
+	mask = BIT(offset);
+
+	if (assert ^ data->active_low)
+		val = mask;
+	else
+		val = 0;
+
+	return regmap_write_bits(data->regmap,
+				 data->reg_offset + (bank * reg_width),
+				 mask, val);
+}
+
+static int reset_simple_syscon_assert(struct reset_controller_dev *rcdev,
+				      unsigned long id)
+{
+	return reset_simple_syscon_update(rcdev, id, true);
+}
+
+static int reset_simple_syscon_deassert(struct reset_controller_dev *rcdev,
+					unsigned long id)
+{
+	return reset_simple_syscon_update(rcdev, id, false);
+}
+
+static int reset_simple_syscon_reset(struct reset_controller_dev *rcdev,
+				     unsigned long id)
+{
+	struct reset_simple_data *data = to_reset_simple_data(rcdev);
+	int ret;
+
+	if (!data->reset_us)
+		return -EINVAL;
+
+	ret = reset_simple_syscon_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	usleep_range(data->reset_us, data->reset_us * 2);
+
+	return reset_simple_syscon_deassert(rcdev, id);
+}
+
+static int reset_simple_syscon_status(struct reset_controller_dev *rcdev,
+				      unsigned long id)
+{
+	struct reset_simple_data *data = to_reset_simple_data(rcdev);
+	int reg_width = sizeof(u32);
+	int bank = id / (reg_width * BITS_PER_BYTE);
+	int offset = id % (reg_width * BITS_PER_BYTE);
+	u32 reg;
+	int ret;
+
+	ret = regmap_read(data->regmap, data->reg_offset + (bank * reg_width),
+			  &reg);
+	if (ret)
+		return ret;
+
+	return !(reg & BIT(offset)) ^ !data->status_active_low;
+}
+
+const struct reset_control_ops reset_simple_syscon_ops = {
+	.assert		= reset_simple_syscon_assert,
+	.deassert	= reset_simple_syscon_deassert,
+	.reset		= reset_simple_syscon_reset,
+	.status		= reset_simple_syscon_status,
+};
+EXPORT_SYMBOL_GPL(reset_simple_syscon_ops);
+
+/**
+ * struct reset_simple_syscon_devdata - simple reset controller properties
+ * @reg_offset: offset between base address and first reset register.
+ * @nr_resets: number of resets. If not set, default to resource size in bits.
+ * @active_low: if true, bits are cleared to assert the reset. Otherwise, bits
+ *              are set to assert the reset.
+ * @status_active_low: if true, bits read back as cleared while the reset is
+ *                     asserted. Otherwise, bits read back as set while the
+ *                     reset is asserted.
+ */
+struct reset_simple_syscon_devdata {
+	u32 reg_offset;
+	u32 nr_resets;
+	bool active_low;
+	bool status_active_low;
+};
+
+static const struct reset_simple_syscon_devdata reset_simple_syscon_armada8k = {
+	.nr_resets = 32,
+	.active_low = true,
+	.status_active_low = true,
+};
+
+static const struct of_device_id reset_simple_syscon_dt_ids[] = {
+	{ .compatible = "marvell,armada8k-reset",
+		.data = &reset_simple_syscon_armada8k },
+	{ /* sentinel */ },
+};
+
+static int reset_simple_syscon_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct reset_simple_syscon_devdata *devdata;
+	struct reset_simple_data *data;
+	u32 reg[2];
+
+	devdata = of_device_get_match_data(dev);
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->regmap = syscon_node_to_regmap(pdev->dev.parent->of_node);
+	if (IS_ERR(data->regmap))
+		return PTR_ERR(data->regmap);
+
+	/*
+	 * If the "reg" property is available, retrieve the reg_offset and
+	 * calculate the nr_resets based on the register size. If "reg" is not
+	 * available, attempt to read the "offset" property for reg_offset and
+	 * use nr_resets from devdata. If "offset" is also not available,
+	 * default to using reg_offset from devdata.
+	 */
+	if (device_property_read_u32_array(&pdev->dev, "reg", reg, 2)) {
+		if (device_property_read_u32(&pdev->dev, "offset",
+					     &data->reg_offset))
+			data->reg_offset = devdata->reg_offset;
+		data->rcdev.nr_resets = devdata->nr_resets;
+	} else {
+		data->reg_offset = reg[0];
+		data->rcdev.nr_resets = reg[1] * BITS_PER_BYTE;
+	}
+
+	data->active_low = devdata->active_low;
+	data->status_active_low = devdata->status_active_low;
+
+	if (data->rcdev.nr_resets == 0) {
+		dev_err(dev, "no reset lines\n");
+		return -EINVAL;
+	}
+
+	spin_lock_init(&data->lock);
+	data->rcdev.owner = THIS_MODULE;
+	data->rcdev.ops = &reset_simple_syscon_ops;
+	data->rcdev.of_node = dev->of_node;
+
+	return devm_reset_controller_register(dev, &data->rcdev);
+}
+
+static struct platform_driver reset_simple_syscon_driver = {
+	.probe	= reset_simple_syscon_probe,
+	.driver = {
+		.name		= "simple-reset-syscon",
+		.of_match_table	= reset_simple_syscon_dt_ids,
+	},
+};
+builtin_platform_driver(reset_simple_syscon_driver);
diff --git a/include/linux/reset/reset-simple.h b/include/linux/reset/reset-simple.h
index c3e44f45b0f7..9a8eebd5892f 100644
--- a/include/linux/reset/reset-simple.h
+++ b/include/linux/reset/reset-simple.h
@@ -13,6 +13,7 @@
 #define __RESET_SIMPLE_H__
 
 #include <linux/io.h>
+#include <linux/regmap.h>
 #include <linux/reset-controller.h>
 #include <linux/spinlock.h>
 
@@ -37,6 +38,8 @@
 struct reset_simple_data {
 	spinlock_t			lock;
 	void __iomem			*membase;
+	struct regmap			*regmap;
+	u32				reg_offset;
 	struct reset_controller_dev	rcdev;
 	bool				active_low;
 	bool				status_active_low;
-- 
2.43.0


