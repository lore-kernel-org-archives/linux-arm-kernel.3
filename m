Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4553C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 09:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xWXpEufWMsbdL9aSyso+1oSexieZNcppiay7D7l66/c=; b=B+LvTAdWVW/Lv/Tg5r6r7xNqmT
	QT3o1fXHucaSZUWdi9LedXzTSvR0XZNC1iBXoJlQQmSxeaHEVeuv5Qv8naNiun3e4VnBb4BUt42Hv
	hCS3Kh4vsLspU8fSr+WbjpHGKyUAeMMlVUZNv6PWYSLBDaq+Y7S7Iji7tGIqcntFzoUof7yAmEp9W
	dUq6gb2cj/uMNuAAqI7FXTqTl2U9LVd5tE4RwbENJ8RBjw4W432h9u4kZnCRozixfiArOTepBzMmJ
	5eARu/8JEnqOc/Ddzwpy/kbXpgE4yWjpPehSVywnCjOgPpKOmGPuJQCDOSJmBmQDkgyhqeTdIstHk
	Bvy7FmSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukfvR-00000004JIg-2efz;
	Sat, 09 Aug 2025 09:31:41 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukfsv-00000004JE5-3qzt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 09:29:07 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bzbCq1y0rztT4X;
	Sat,  9 Aug 2025 17:27:51 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 30098180B64;
	Sat,  9 Aug 2025 17:28:52 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 9 Aug
 2025 17:28:51 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <maz@kernel.org>, <lpieralisi@kernel.org>, <tglx@linutronix.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH -next] irqchip/gic-v5: Improve the SPI alloc efficiency
Date: Sat, 9 Aug 2025 17:29:20 +0800
Message-ID: <20250809092920.3765609-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_022906_260023_1CE59D79 
X-CRM114-Status: GOOD (  22.28  )
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

If the GICv5 system has a large number of PEs and IRS components,
traversing the linked list to find the irs_data corresponding
to a specific SPI interrupt will be very slow.

Since the maximum number of IRS nodes, the minimum and maximum SPI
interrupt numbers for each IRS is known during the initialization
of the IRS nodes, sort the IRS nodes by interrupt number at
the initial stage. This way, when allocating SPI interrupts, we can
directly perform a binary search on the irs_data
using the SPI interrupt number with O(log N) complexity.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/irqchip/irq-gic-v5-irs.c   | 83 +++++++++++++++++++++---------
 include/linux/irqchip/arm-gic-v5.h |  2 +
 2 files changed, 61 insertions(+), 24 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index f845415f9143..41ddfd3c85de 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -8,6 +8,7 @@
 #include <linux/log2.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/sort.h>
 
 #include <linux/irqchip.h>
 #include <linux/irqchip/arm-gic-v5.h>
@@ -22,7 +23,7 @@
 #define IRS_FLAGS_NON_COHERENT		BIT(0)
 
 static DEFINE_PER_CPU_READ_MOSTLY(struct gicv5_irs_chip_data *, per_cpu_irs_data);
-static LIST_HEAD(irs_nodes);
+static struct gicv5_irs_chip_data **irs_nodes;
 
 static u32 irs_readl_relaxed(struct gicv5_irs_chip_data *irs_data,
 			     const u32 reg_offset)
@@ -382,17 +383,18 @@ int gicv5_irs_cpu_to_iaffid(int cpuid, u16 *iaffid)
 
 struct gicv5_irs_chip_data *gicv5_irs_lookup_by_spi_id(u32 spi_id)
 {
-	struct gicv5_irs_chip_data *irs_data;
-	u32 min, max;
+	int l = 0, r = gicv5_global_data.irs_count - 1;
 
-	list_for_each_entry(irs_data, &irs_nodes, entry) {
-		if (!irs_data->spi_range)
-			continue;
+	while (l <= r) {
+		int m = (l + r) >> 1;
 
-		min = irs_data->spi_min;
-		max = irs_data->spi_min + irs_data->spi_range - 1;
-		if (spi_id >= min && spi_id <= max)
-			return irs_data;
+		if (irs_nodes[m]->spi_min <= spi_id &&
+		    spi_id <= irs_nodes[m]->spi_max)
+			return irs_nodes[m];
+		else if (spi_id < irs_nodes[m]->spi_min)
+			r = m - 1;
+		else
+			l = m + 1;
 	}
 
 	return NULL;
@@ -489,7 +491,7 @@ void gicv5_irs_syncr(void)
 	struct gicv5_irs_chip_data *irs_data;
 	u32 syncr;
 
-	irs_data = list_first_entry_or_null(&irs_nodes, struct gicv5_irs_chip_data, entry);
+	irs_data = irs_nodes[0];
 	if (WARN_ON_ONCE(!irs_data))
 		return;
 
@@ -673,7 +675,7 @@ static void irs_setup_pri_bits(u32 idr1)
 	}
 }
 
-static int __init gicv5_irs_init(struct device_node *node)
+static int __init gicv5_irs_init(struct device_node *node, unsigned int *num)
 {
 	struct gicv5_irs_chip_data *irs_data;
 	void __iomem *irs_base;
@@ -725,11 +727,11 @@ static int __init gicv5_irs_init(struct device_node *node)
 	irs_data->spi_range = FIELD_GET(GICV5_IRS_IDR6_SPI_IRS_RANGE, idr);
 
 	if (irs_data->spi_range) {
+		irs_data->spi_max = irs_data->spi_min + irs_data->spi_range - 1;
 		pr_info("%s detected SPI range [%u-%u]\n",
 						of_node_full_name(node),
 						irs_data->spi_min,
-						irs_data->spi_min +
-						irs_data->spi_range - 1);
+						irs_data->spi_max);
 	}
 
 	/*
@@ -737,8 +739,7 @@ static int __init gicv5_irs_init(struct device_node *node)
 	 * Global properties (iaffid_bits, global spi count) are guaranteed to
 	 * be consistent across IRSes by the architecture.
 	 */
-	if (list_empty(&irs_nodes)) {
-
+	if (*num == 0) {
 		idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR1);
 		irs_setup_pri_bits(idr);
 
@@ -752,7 +753,7 @@ static int __init gicv5_irs_init(struct device_node *node)
 		pr_debug("Detected %u SPIs globally\n", spi_count);
 	}
 
-	list_add_tail(&irs_data->entry, &irs_nodes);
+	irs_nodes[(*num)++] = irs_data;
 
 	return 0;
 
@@ -765,12 +766,14 @@ static int __init gicv5_irs_init(struct device_node *node)
 
 void __init gicv5_irs_remove(void)
 {
-	struct gicv5_irs_chip_data *irs_data, *tmp_data;
+	struct gicv5_irs_chip_data *irs_data;
+	int i;
 
 	gicv5_free_lpi_domain();
 	gicv5_deinit_lpis();
 
-	list_for_each_entry_safe(irs_data, tmp_data, &irs_nodes, entry) {
+	for (i = 0; i < gicv5_global_data.irs_count; i++) {
+		irs_data = irs_nodes[i];
 		iounmap(irs_data->irs_base);
 		list_del(&irs_data->entry);
 		kfree(irs_data);
@@ -782,8 +785,7 @@ int __init gicv5_irs_enable(void)
 	struct gicv5_irs_chip_data *irs_data;
 	int ret;
 
-	irs_data = list_first_entry_or_null(&irs_nodes,
-					    struct gicv5_irs_chip_data, entry);
+	irs_data = irs_nodes[0];
 	if (!irs_data)
 		return -ENODEV;
 
@@ -799,24 +801,57 @@ int __init gicv5_irs_enable(void)
 void __init gicv5_irs_its_probe(void)
 {
 	struct gicv5_irs_chip_data *irs_data;
+	int i;
 
-	list_for_each_entry(irs_data, &irs_nodes, entry)
+	for (i = 0; i < gicv5_global_data.irs_count; i++) {
+		irs_data = irs_nodes[i];
 		gicv5_its_of_probe(to_of_node(irs_data->fwnode));
+	}
+}
+
+static int spi_min_cmp(const void *a, const void *b)
+{
+	const struct gicv5_irs_chip_data *irs_data1 = a;
+	const struct gicv5_irs_chip_data *irs_data2 = b;
+
+	return irs_data1->spi_min - irs_data2->spi_min;
 }
 
 int __init gicv5_irs_of_probe(struct device_node *parent)
 {
+	unsigned int irs_count = 0, num = 0;
 	struct device_node *np;
 	int ret;
 
+	for_each_available_child_of_node(parent, np) {
+		if (of_device_is_compatible(np, "arm,gic-v5-irs"))
+			irs_count++;
+	}
+
+	if (irs_count == 0)
+		return -ENODEV;
+
+	irs_nodes = kcalloc(irs_count, sizeof(struct gicv5_irs_chip_data *),
+			    __GFP_ZERO);
+	if (!irs_nodes)
+		return -ENOMEM;
+
 	for_each_available_child_of_node(parent, np) {
 		if (!of_device_is_compatible(np, "arm,gic-v5-irs"))
 			continue;
 
-		ret = gicv5_irs_init(np);
+		ret = gicv5_irs_init(np, &num);
 		if (ret)
 			pr_err("Failed to init IRS %s\n", np->full_name);
 	}
 
-	return list_empty(&irs_nodes) ? -ENODEV : 0;
+	if (num == 0) {
+		kfree(irs_nodes);
+		return -ENODEV;
+	}
+
+	sort(irs_nodes, num, sizeof(struct gicv5_irs_chip_data *), spi_min_cmp, NULL);
+	gicv5_global_data.irs_count = num;
+
+	return 0;
 }
diff --git a/include/linux/irqchip/arm-gic-v5.h b/include/linux/irqchip/arm-gic-v5.h
index 68ddcdb1cec5..6661b583b8d8 100644
--- a/include/linux/irqchip/arm-gic-v5.h
+++ b/include/linux/irqchip/arm-gic-v5.h
@@ -278,6 +278,7 @@ struct gicv5_chip_data {
 	u8			cpuif_pri_bits;
 	u8			cpuif_id_bits;
 	u8			irs_pri_bits;
+	unsigned int		irs_count;
 	struct {
 		__le64 *l1ist_addr;
 		u32 l2_size;
@@ -294,6 +295,7 @@ struct gicv5_irs_chip_data {
 	void __iomem		*irs_base;
 	u32			flags;
 	u32			spi_min;
+	u32			spi_max;
 	u32			spi_range;
 	raw_spinlock_t		spi_config_lock;
 };
-- 
2.34.1


