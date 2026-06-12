Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942EDCD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 09:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWQo1My+orzf3GxyeSQq+tdTBcgI7/cbrlLOABYNLWE=; b=az9yOG3w3R3D+lR7EvxFkka7fl
	Dm1qLWrv+g643wPookO390URjF9qyPuSz2I4fSi4XDpIfHNL415FHM0Yrf2KWpwuxxfH5ADQp0bNR
	ynA6b5j4U3lfZhBmgzatt5ThT4hYuwQFkUBjgzVtfE7HtTIAjBkIozLP3J3rMn5aXLXKwTh/+WC6J
	zKHg0qAaXznLhvBCMfRAN+GveDYz+PVhNy+RY7zFuiQy2DPOFKrn+O7e4crCp6KP+FYi95grTQNp3
	df8+Oy77+FnTNKEfg+mWc2ZdL0QEGlKgLisRrnrPcRSeEcrtc7lMpkdNClZ9PM3dmu9RBQ5qqagL/
	gbsuomzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyFa-0000000Afhx-0Ln2;
	Fri, 12 Jun 2026 09:32:30 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyFW-0000000AfhL-30GE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 09:32:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=KWQo1My+orzf3GxyeSQq+tdTBcgI7/cbrlLOABYNLWE=;
	b=kkeSEpTJuA1Y1fsGfzWbn88SLOPIm3gOYaQJDCWOZKXqGajr0xEzjxc2o5msCfX6CZm7x9rIL
	TBx6IFAw63D9FwgmO1LVkbco2PYZeHyn6en1yrKHF6gKt2DpxS6TVn+Xp/UwFHJnAxcnp33JQ8h
	2fp628coPLbAMxNGsIEv8zI=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gcDbc4Z3PzcZxp;
	Fri, 12 Jun 2026 17:23:56 +0800 (CST)
Received: from whupemo500002.china.huawei.com (unknown [7.152.185.250])
	by mail.maildlp.com (Postfix) with ESMTPS id 32DF640561;
	Fri, 12 Jun 2026 17:32:12 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 whupemo500002.china.huawei.com (7.152.185.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 12 Jun 2026 17:32:11 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <fanghao11@huawei.com>, <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, <wangzhou1@hisilicon.com>,
	<wangyushan12@huawei.com>
Subject: [PATCH v2 2/3] drivers/perf: hisi: Support uncore ITS PMU
Date: Fri, 12 Jun 2026 17:32:06 +0800
Message-ID: <20260612093207.1242000-3-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260612093207.1242000-1-wangyushan12@huawei.com>
References: <20260612093207.1242000-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo500002.china.huawei.com (7.152.185.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_023227_407545_376C07BB 
X-CRM114-Status: GOOD (  25.65  )
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

Support uncore ITS PMU, which provides the capability of counting
the number of interrupts routed to ITS by interrupt catagories, and the
latency. It also supports collecting statistics of micro-ops of ITS.

The driver adapts to HiSilicon uncore PMU framework. It does not support
overflow interruption, which is the same as NoC PMU, so a few dummy
functions or handling interrupts are left empty.

Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 Documentation/admin-guide/perf/hisi-pmu.rst  |  12 +
 drivers/perf/hisilicon/Makefile              |   2 +-
 drivers/perf/hisilicon/hisi_uncore_its_pmu.c | 375 +++++++++++++++++++
 3 files changed, 388 insertions(+), 1 deletion(-)
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_its_pmu.c

diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
index d56b2d690709..b2b79be998f9 100644
--- a/Documentation/admin-guide/perf/hisi-pmu.rst
+++ b/Documentation/admin-guide/perf/hisi-pmu.rst
@@ -128,6 +128,18 @@ channel with this option. The current supported channels are as follows:
 7. tt_en: NoC PMU supports counting only transactions that have tracetag set
 if this option is set. See the 2nd list for more information about tracetag.
 
+8. int_id: ITS PMU supports filtering by interrupt id, which is defined by
+hardware. Interrupt id takes up to 32 bits, and can be divided into 2 parts:
+
+- Upper 16 bits: DeviceID if counting LPI, PEID if counting SGI/PPI.
+- Lower 16 bits: EventID if counting LPI, IntID if counting SGI/PPI.
+
+int_id is a global configuration for each PMU instance, if multiple different
+int_id's are specified, the last came in will be effective.
+
+9. int_en: A one-bit flag to tell if int_id is used to filter the statistics. It
+allows filtering 0 DeviceID and EventID.
+
 For HiSilicon uncore PMU v3 whose identifier is 0x40, some uncore PMUs are
 further divided into parts for finer granularity of tracing, each part has its
 own dedicated PMU, and all such PMUs together cover the monitoring job of events
diff --git a/drivers/perf/hisilicon/Makefile b/drivers/perf/hisilicon/Makefile
index 186be3d02238..5f28cfdb8a72 100644
--- a/drivers/perf/hisilicon/Makefile
+++ b/drivers/perf/hisilicon/Makefile
@@ -2,7 +2,7 @@
 obj-$(CONFIG_HISI_PMU) += hisi_uncore_pmu.o hisi_uncore_l3c_pmu.o \
 			  hisi_uncore_hha_pmu.o hisi_uncore_ddrc_pmu.o hisi_uncore_sllc_pmu.o \
 			  hisi_uncore_pa_pmu.o hisi_uncore_cpa_pmu.o hisi_uncore_uc_pmu.o \
-			  hisi_uncore_noc_pmu.o hisi_uncore_mn_pmu.o
+			  hisi_uncore_noc_pmu.o hisi_uncore_mn_pmu.o hisi_uncore_its_pmu.o
 
 obj-$(CONFIG_HISI_PCIE_PMU) += hisi_pcie_pmu.o
 obj-$(CONFIG_HNS3_PMU) += hns3_pmu.o
diff --git a/drivers/perf/hisilicon/hisi_uncore_its_pmu.c b/drivers/perf/hisilicon/hisi_uncore_its_pmu.c
new file mode 100644
index 000000000000..3d1316ee12ef
--- /dev/null
+++ b/drivers/perf/hisilicon/hisi_uncore_its_pmu.c
@@ -0,0 +1,375 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for HiSilicon Uncore ITS PMU device
+ *
+ * Copyright (c) 2026 HiSilicon Technologies Co., Ltd.
+ * Author: Yushan Wang <wangyushan12@huawei.com>
+ */
+#include <linux/bitops.h>
+#include <linux/cpuhotplug.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/sysfs.h>
+
+#include "hisi_uncore_pmu.h"
+
+#define ITS_PMU_VERSION			0x21000
+#define ITS_PMU_GLOBAL_CTRL		0x21004
+#define ITS_PMU_GLOBAL_CTRL_PMU_EN	BIT(0)
+#define ITS_PMU_COUNTER_CTRL		0x21008
+#define ITS_PMU_EVENT_CTRL		0x2100c
+#define ITS_PMU_COUNTER0		0x21010
+
+#define ITS_PMU_INT_ID_MASK		0x20008
+#define ITS_PMU_INT_ID_CTRL		0x20084
+
+#define ITS_PMU_NR_COUNTERS		4
+
+#define ITS_PMU_EVENT_CNTRn(cntr0, n)	((cntr0) + 8 * (n))
+#define ITS_PMU_CNTR_CTRL_MASK(n)	GENMASK(8 * ((n) + 1) - 1, 8 * (n))
+#define ITS_PMU_CNTR_EVENT_CFG(n, e)	((e) << ((n) * 8))
+#define ITS_PMU_EVENT_CTRL_TYPE		GENMASK(12, 0)
+
+HISI_PMU_EVENT_ATTR_EXTRACTOR(int_id, config1, 31, 0);
+HISI_PMU_EVENT_ATTR_EXTRACTOR(int_en, config1, 32, 32);
+
+/* Dynamic CPU hotplug state used by this PMU driver */
+static enum cpuhp_state hisi_its_pmu_cpuhp_state;
+
+struct hisi_its_pmu_regs {
+	u32 version;
+	u32 pmu_ctrl;
+	u32 event_ctrl0;
+	u32 event_cntr0;
+	u32 cntr_ctrl;
+};
+
+static void hisi_its_pmu_write_evtype(struct hisi_pmu *its_pmu, int idx, u32 type)
+{
+	struct hisi_its_pmu_regs *reg_info = its_pmu->dev_info->private;
+	u32 reg;
+
+	reg = readl(its_pmu->base + reg_info->event_ctrl0);
+	reg &= ~ITS_PMU_CNTR_CTRL_MASK(idx);
+	reg |= ITS_PMU_CNTR_EVENT_CFG(idx, type);
+	writel(reg, its_pmu->base + reg_info->event_ctrl0);
+}
+
+static u64 hisi_its_pmu_read_counter(struct hisi_pmu *its_pmu,
+				     struct hw_perf_event *hwc)
+{
+	struct hisi_its_pmu_regs *reg_info = its_pmu->dev_info->private;
+
+	return readq(its_pmu->base + ITS_PMU_EVENT_CNTRn(reg_info->event_cntr0, hwc->idx));
+}
+
+static void hisi_its_pmu_write_counter(struct hisi_pmu *its_pmu,
+				       struct hw_perf_event *hwc, u64 val)
+{
+	struct hisi_its_pmu_regs *reg_info = its_pmu->dev_info->private;
+
+	writeq(val, its_pmu->base + ITS_PMU_EVENT_CNTRn(reg_info->event_cntr0, hwc->idx));
+}
+
+static void hisi_its_pmu_enable_counter(struct hisi_pmu *its_pmu,
+					struct hw_perf_event *hwc)
+{
+	struct hisi_its_pmu_regs *reg_info = its_pmu->dev_info->private;
+	u32 reg;
+
+	reg = readl(its_pmu->base + reg_info->cntr_ctrl);
+	reg |= BIT(hwc->idx);
+	writel(reg, its_pmu->base + reg_info->cntr_ctrl);
+}
+
+static void hisi_its_pmu_disable_counter(struct hisi_pmu *its_pmu,
+					 struct hw_perf_event *hwc)
+{
+	struct hisi_its_pmu_regs *reg_info = its_pmu->dev_info->private;
+	u32 reg;
+
+	reg = readl(its_pmu->base + reg_info->cntr_ctrl);
+	reg &= ~BIT(hwc->idx);
+	writel(reg, its_pmu->base + reg_info->cntr_ctrl);
+}
+
+static void hisi_its_pmu_enable_counter_int(struct hisi_pmu *its_pmu,
+					    struct hw_perf_event *hwc)
+{
+	/* We don't support interrupt, so a stub here. */
+}
+
+static void hisi_its_pmu_disable_counter_int(struct hisi_pmu *its_pmu,
+					     struct hw_perf_event *hwc)
+{
+}
+
+static void hisi_its_pmu_start_counters(struct hisi_pmu *its_pmu)
+{
+	struct hisi_its_pmu_regs *reg_info = its_pmu->dev_info->private;
+	u32 reg;
+
+	reg = readl(its_pmu->base + reg_info->pmu_ctrl);
+	reg |= ITS_PMU_GLOBAL_CTRL_PMU_EN;
+	writel(reg, its_pmu->base + reg_info->pmu_ctrl);
+}
+
+static void hisi_its_pmu_stop_counters(struct hisi_pmu *its_pmu)
+{
+	struct hisi_its_pmu_regs *reg_info = its_pmu->dev_info->private;
+	u32 reg;
+
+	reg = readl(its_pmu->base + reg_info->pmu_ctrl);
+	reg &= ~ITS_PMU_GLOBAL_CTRL_PMU_EN;
+	writel(reg, its_pmu->base + reg_info->pmu_ctrl);
+}
+
+static void hisi_its_pmu_enable_filter(struct perf_event *event)
+{
+	struct hisi_pmu *its_pmu = to_hisi_pmu(event->pmu);
+	u32 int_id = hisi_get_int_id(event);
+	u32 int_en = hisi_get_int_en(event);
+
+	/*
+	 * Don't touch global filtering config if user doesn't
+	 * explicitly specify it.
+	 */
+	if (int_en) {
+		writel(int_id, its_pmu->base + ITS_PMU_INT_ID_CTRL);
+		/* Write 0 to this register to enable filtering with int_id. */
+		writel(0, its_pmu->base + ITS_PMU_INT_ID_MASK);
+	} else {
+		writel(-1U, its_pmu->base + ITS_PMU_INT_ID_MASK);
+	}
+}
+
+static void hisi_its_pmu_disable_filter(struct perf_event *event)
+{
+	struct hisi_pmu *its_pmu = to_hisi_pmu(event->pmu);
+	u32 int_en = hisi_get_int_en(event);
+
+	/* Don't touch global filtering config if this is not the last counter. */
+	if (bitmap_weight(its_pmu->pmu_events.used_mask, its_pmu->num_counters) > 1)
+		return;
+
+	if (int_en) {
+		writel(0, its_pmu->base + ITS_PMU_INT_ID_CTRL);
+		writel(-1U, its_pmu->base + ITS_PMU_INT_ID_MASK);
+	}
+}
+
+static const struct hisi_uncore_ops hisi_uncore_its_ops = {
+	.write_evtype		= hisi_its_pmu_write_evtype,
+	.get_event_idx		= hisi_uncore_pmu_get_event_idx,
+	.read_counter		= hisi_its_pmu_read_counter,
+	.write_counter		= hisi_its_pmu_write_counter,
+	.enable_counter		= hisi_its_pmu_enable_counter,
+	.disable_counter	= hisi_its_pmu_disable_counter,
+	.enable_counter_int	= hisi_its_pmu_enable_counter_int,
+	.disable_counter_int	= hisi_its_pmu_disable_counter_int,
+	.start_counters		= hisi_its_pmu_start_counters,
+	.stop_counters		= hisi_its_pmu_stop_counters,
+	.enable_filter		= hisi_its_pmu_enable_filter,
+	.disable_filter		= hisi_its_pmu_disable_filter,
+};
+
+static struct attribute *hisi_its_pmu_format_attrs[] = {
+	HISI_PMU_FORMAT_ATTR(event, "config:0-7"),
+	HISI_PMU_FORMAT_ATTR(int_id, "config1:0-31"),
+	HISI_PMU_FORMAT_ATTR(int_en, "config1:32-32"),
+	NULL
+};
+
+static const struct attribute_group hisi_its_pmu_format_group = {
+	.name = "format",
+	.attrs = hisi_its_pmu_format_attrs,
+};
+
+static struct attribute *hisi_its_pmu_events_attrs[] = {
+	HISI_PMU_EVENT_ATTR(lpi_num, 0xc0),
+	HISI_PMU_EVENT_ATTR(lpi_time, 0x80),
+	HISI_PMU_EVENT_ATTR(sgi_num, 0xc1),
+	HISI_PMU_EVENT_ATTR(sgi_time, 0x81),
+	HISI_PMU_EVENT_ATTR(ppi_num, 0xc2),
+	HISI_PMU_EVENT_ATTR(ppi_time, 0x82),
+	HISI_PMU_EVENT_ATTR(sl3_lpi_num, 0xc3),
+	HISI_PMU_EVENT_ATTR(sl3_sgi_num, 0xc4),
+	HISI_PMU_EVENT_ATTR(sl3_ppi_num, 0xc5),
+	HISI_PMU_EVENT_ATTR(sl0_ddr_read, 0xc9),
+	HISI_PMU_EVENT_ATTR(sl0_ddr_time, 0x89),
+	HISI_PMU_EVENT_ATTR(sl1_ddr_read, 0xca),
+	HISI_PMU_EVENT_ATTR(sl1_ddr_time, 0x8a),
+	HISI_PMU_EVENT_ATTR(sl2_ddr_read, 0xcb),
+	HISI_PMU_EVENT_ATTR(sl2_ddr_time, 0x8b),
+	HISI_PMU_EVENT_ATTR(cycles, 0xcc),
+	NULL
+};
+
+static const struct attribute_group hisi_its_pmu_events_group = {
+	.name = "events",
+	.attrs = hisi_its_pmu_events_attrs,
+};
+
+static const struct attribute_group *hisi_its_pmu_attr_groups[] = {
+	&hisi_its_pmu_format_group,
+	&hisi_its_pmu_events_group,
+	&hisi_pmu_cpumask_attr_group,
+	&hisi_pmu_identifier_group,
+	NULL
+};
+
+static int hisi_its_pmu_dev_init(struct platform_device *pdev, struct hisi_pmu *its_pmu)
+{
+	struct hisi_its_pmu_regs *reg_info;
+
+	hisi_uncore_pmu_init_topology(its_pmu, &pdev->dev);
+
+	if (its_pmu->topo.scl_id < 0)
+		return dev_err_probe(&pdev->dev, -EINVAL, "failed to get scl-id\n");
+
+	if (its_pmu->topo.index_id < 0)
+		return dev_err_probe(&pdev->dev, -EINVAL, "failed to get idx-id\n");
+
+	its_pmu->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(its_pmu->base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(its_pmu->base),
+				     "fail to remap io memory\n");
+
+	its_pmu->dev_info = device_get_match_data(&pdev->dev);
+	if (!its_pmu->dev_info)
+		return -ENODEV;
+
+	its_pmu->pmu_events.attr_groups = its_pmu->dev_info->attr_groups;
+	its_pmu->counter_bits = its_pmu->dev_info->counter_bits;
+	its_pmu->check_event = its_pmu->dev_info->check_event;
+	its_pmu->num_counters = ITS_PMU_NR_COUNTERS;
+	its_pmu->ops = &hisi_uncore_its_ops;
+	its_pmu->dev = &pdev->dev;
+	its_pmu->on_cpu = -1;
+
+	reg_info = its_pmu->dev_info->private;
+	its_pmu->identifier = readl(its_pmu->base + reg_info->version);
+
+	return 0;
+}
+
+static void hisi_its_pmu_remove_cpuhp_instance(void *hotplug_node)
+{
+	cpuhp_state_remove_instance_nocalls(hisi_its_pmu_cpuhp_state, hotplug_node);
+}
+
+static void hisi_its_pmu_unregister_pmu(void *pmu)
+{
+	perf_pmu_unregister(pmu);
+}
+
+static int hisi_its_pmu_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct hisi_pmu *its_pmu;
+	char *name;
+	int ret;
+
+	its_pmu = devm_kzalloc(dev, sizeof(*its_pmu), GFP_KERNEL);
+	if (!its_pmu)
+		return -ENOMEM;
+
+	/*
+	 * HiSilicon Uncore PMU framework needs to get common hisi_pmu device
+	 * from device's drvdata.
+	 */
+	platform_set_drvdata(pdev, its_pmu);
+
+	ret = hisi_its_pmu_dev_init(pdev, its_pmu);
+	if (ret)
+		return ret;
+
+	ret = cpuhp_state_add_instance(hisi_its_pmu_cpuhp_state, &its_pmu->node);
+	if (ret)
+		return dev_err_probe(dev, ret, "Fail to register cpuhp instance\n");
+
+	ret = devm_add_action_or_reset(dev, hisi_its_pmu_remove_cpuhp_instance,
+				       &its_pmu->node);
+	if (ret)
+		return ret;
+
+	hisi_pmu_init(its_pmu, THIS_MODULE);
+
+	name = devm_kasprintf(dev, GFP_KERNEL, "hisi_scl%d_its%d",
+			      its_pmu->topo.scl_id, its_pmu->topo.index_id);
+	if (!name)
+		return -ENOMEM;
+
+	ret = perf_pmu_register(&its_pmu->pmu, name, -1);
+	if (ret)
+		return dev_err_probe(dev, ret, "Fail to register PMU\n");
+
+	return devm_add_action_or_reset(dev, hisi_its_pmu_unregister_pmu,
+					&its_pmu->pmu);
+}
+
+static struct hisi_its_pmu_regs hisi_its_v1_pmu_regs = {
+	.version = ITS_PMU_VERSION,
+	.pmu_ctrl = ITS_PMU_GLOBAL_CTRL,
+	.event_ctrl0 = ITS_PMU_EVENT_CTRL,
+	.event_cntr0 = ITS_PMU_COUNTER0,
+	.cntr_ctrl = ITS_PMU_COUNTER_CTRL,
+};
+
+static const struct hisi_pmu_dev_info hisi_its_v1 = {
+	.attr_groups = hisi_its_pmu_attr_groups,
+	.counter_bits = 48,
+	.check_event = ITS_PMU_EVENT_CTRL_TYPE,
+	.private = &hisi_its_v1_pmu_regs,
+};
+
+static const struct acpi_device_id hisi_its_pmu_ids[] = {
+	{ "HISI0591", (kernel_ulong_t) &hisi_its_v1 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, hisi_its_pmu_ids);
+
+static struct platform_driver hisi_its_pmu_driver = {
+	.driver = {
+		.name = "hisi_its_pmu",
+		.acpi_match_table = hisi_its_pmu_ids,
+		.suppress_bind_attrs = true,
+	},
+	.probe = hisi_its_pmu_probe,
+};
+
+static int __init hisi_its_pmu_module_init(void)
+{
+	int ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
+					  "perf/hisi/its:online",
+					  hisi_uncore_pmu_online_cpu,
+					  hisi_uncore_pmu_offline_cpu);
+	if (ret < 0) {
+		pr_err("hisi_its_pmu: Fail to setup cpuhp callbacks, ret = %d\n", ret);
+		return ret;
+	}
+	hisi_its_pmu_cpuhp_state = ret;
+
+	ret = platform_driver_register(&hisi_its_pmu_driver);
+	if (ret)
+		cpuhp_remove_multi_state(hisi_its_pmu_cpuhp_state);
+
+	return ret;
+}
+module_init(hisi_its_pmu_module_init);
+
+static void __exit hisi_its_pmu_module_exit(void)
+{
+	platform_driver_unregister(&hisi_its_pmu_driver);
+	cpuhp_remove_multi_state(hisi_its_pmu_cpuhp_state);
+}
+module_exit(hisi_its_pmu_module_exit);
+
+MODULE_IMPORT_NS("HISI_PMU");
+MODULE_DESCRIPTION("HiSilicon SoC Uncore ITS PMU driver");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Yushan Wang <wangyushan12@huawei.com>");
-- 
2.33.0


