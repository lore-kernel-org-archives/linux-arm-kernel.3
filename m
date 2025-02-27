Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C05C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HqytoyZlIAKh3kfduNHmj2AMH9IiJuRAqZBJXKMvjc=; b=Uq4N2Ksqr+FhhhmyXOiAl4eSPP
	4c2geYjtbDpcmMI0UKMl59oNmAvpLsgCqj2jPzkmwZGzZi0Fy/KJSw/7JsXOvvEujwdTZwAW6fJ5N
	Q0ObPUwnBHpHcmlJ6rDp4sPJtsxXx1AihElZHTW0eVugy1+6mN6GXrcX83GUQZCidU4cQPDpw1jod
	IyhXQADT84MsdttS4UdjnII7POVku+Jw7ViT2u528pQ6NkOJX3ylAj1OwfupyF2ruVBfcQHs6OLee
	BlNhygpVMfk7Rxw9rkFRa6tWEs0qDoBRq2+oBeelynBbWWOhrWv+lQc+AjLQ4Ldd5oQb6/cr8Wjdl
	rG97kPMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjoV-00000008g90-2Vzv;
	Thu, 27 Feb 2025 19:44:55 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjW4-00000008Rzz-0Trr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 19:25:54 +0000
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RFjKPu005358;
	Thu, 27 Feb 2025 11:25:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=+
	HqytoyZlIAKh3kfduNHmj2AMH9IiJuRAqZBJXKMvjc=; b=BueZ8L2MA3a5t6JeQ
	My72uvpWa/88+K0Ad9CNUp69bsuA1/CFYRdzb4knxGoAOr6zlmiCziSPP0wR0cPf
	2umQhCToYZMrJNAulRGSIZKqDO9BnK4ZTCmVIfmZ0tDG+8TNyzeSS8PfKEvGY7Kn
	h69iKhXSzRaqUu4Pjk201ogUiRpMJSwBqT3fLXEil/lI6nSBCctlaQNbc5Yj2DKK
	3Ven2enfs9B/VngDTvj0wFWgNuueaArTupJBX3WGcwNlio3cZCHgAS1PdzMfKkfs
	B0NzjsY+euyON8zWoCbpSroXoQTQdfBV3YZaSpF59DAVcejxwqkTFl8DG+S8wBvv
	PUTyA==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 452tyjrhbm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 11:25:39 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 27 Feb 2025 11:25:38 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 27 Feb 2025 11:25:38 -0800
Received: from wd-ubuntu-24-04.marvell.com (wd-ubuntu-24-04.marvell.com [10.111.132.113])
	by maili.marvell.com (Postfix) with ESMTP id 5B0F53F707D;
	Thu, 27 Feb 2025 11:25:38 -0800 (PST)
From: Wilson Ding <dingwei@marvell.com>
To: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
        <sebastian.hesselbarth@gmail.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <salee@marvell.com>, <gakula@marvell.com>,
        Wilson Ding <dingwei@marvell.com>
Subject: [PATCH v3 2/3] reset: Add support for Armada8K reset controller
Date: Thu, 27 Feb 2025 11:25:35 -0800
Message-ID: <20250227192536.2426490-3-dingwei@marvell.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227192536.2426490-1-dingwei@marvell.com>
References: <20250227192536.2426490-1-dingwei@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: YBzRlG9k6QrEIuhHyOm14XtK_IaCnYW0
X-Authority-Analysis: v=2.4 cv=UIYnHDfy c=1 sm=1 tr=0 ts=67c0bc33 cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=T2h4t0Lz3GQA:10 a=M5GUcnROAAAA:8 a=uP1ucDPQAAAA:8 a=TCups3AGXvnK9ebHqNkA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
 a=9a9ggB8z3XFZH39hjkD6:22
X-Proofpoint-GUID: YBzRlG9k6QrEIuhHyOm14XtK_IaCnYW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_07,2025-02-27_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_112552_158959_D27A6F6A 
X-CRM114-Status: GOOD (  28.08  )
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
 drivers/reset/reset-simple-syscon.c | 188 ++++++++++++++++++++++++++++
 include/linux/reset/reset-simple.h  |   3 +
 4 files changed, 204 insertions(+)
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
index 000000000000..798467f29911
--- /dev/null
+++ b/drivers/reset/reset-simple-syscon.c
@@ -0,0 +1,188 @@
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
+static const
+struct reset_simple_syscon_devdata reset_simple_syscon_active_low = {
+	.active_low = true,
+	.status_active_low = true,
+};
+
+static const struct of_device_id reset_simple_syscon_dt_ids[] = {
+	{ .compatible = "marvell,armada8k-reset",
+		.data = &reset_simple_syscon_active_low },
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
+	 * If the "reg" property is available, retrieve the reg_offset
+	 * and calculate the nr_resets based on the register size.
+	 */
+	if (!device_property_read_u32_array(&pdev->dev, "reg", reg, 2)) {
+		data->reg_offset = reg[0];
+		data->rcdev.nr_resets = reg[1] * BITS_PER_BYTE;
+	}
+
+	spin_lock_init(&data->lock);
+	data->rcdev.owner = THIS_MODULE;
+	data->rcdev.ops = &reset_simple_syscon_ops;
+	data->rcdev.of_node = dev->of_node;
+
+	if (devdata) {
+		if (devdata->reg_offset)
+			data->reg_offset = devdata->reg_offset;
+		if (devdata->nr_resets)
+			data->rcdev.nr_resets = devdata->nr_resets;
+		data->active_low = devdata->active_low;
+		data->status_active_low = devdata->status_active_low;
+	}
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


