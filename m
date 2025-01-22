Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF4CC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 07:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIG/i/1g1RnKar8vvdDmupIkbiHSv0SGr5cQtOH3A2g=; b=0TBTlyazyOrT6aIckIdJx50S7X
	1aHgHpucfqpIL1WliWX+kiIS9c8EmPnDgBCqSpwJ7/qCeKPbZxyO/6iE3zBcEuXPtEbk5juLSTDAg
	afU1JAOsh7NW+G2PBX04E8ruZFX5BflCoNXO/ADRtIja8QlPfsE4gjSUYXVnQswzx3xJWu8tXHfbJ
	V9Dy+tjzuUJJUrsD2o8n/aEi56L7OmCL85l53aR9XDpd4dxqVXHqsC1uwAF8UGEVdsnlqOalL6iQm
	164gtLNClSDcYG9u9gto+NtcrHKGZ+jTWLk2z47d36cxzMLkt7hYsBrKCtAzj9u+/V3yYHJSGIgAx
	eKYCfp6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taUjN-00000009Z0C-45YY;
	Wed, 22 Jan 2025 07:00:53 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taUgp-00000009YXj-3fI0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 06:58:17 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4YdFKL6qlJz20pCd;
	Wed, 22 Jan 2025 14:58:30 +0800 (CST)
Received: from dggpemf100016.china.huawei.com (unknown [7.185.36.236])
	by mail.maildlp.com (Postfix) with ESMTPS id 94AFE1A0171;
	Wed, 22 Jan 2025 14:58:05 +0800 (CST)
Received: from localhost.huawei.com (10.50.165.33) by
 dggpemf100016.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Jan 2025 14:58:05 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <xuwei5@hisilicon.com>, <yangyicong@hisilicon.com>,
	<Jonathan.Cameron@huawei.com>, <wangjie125@huawei.com>,
	<wanghuiqiang@huawei.com>, <christophe.jaillet@wanadoo.fr>
CC: <prime.zeng@hisilicon.com>, <fanghao11@huawei.com>,
	<wangyushan12@huawei.com>, <linuxarm@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 2/2] soc cache: L3 cache lockdown support for HiSilicon SoC
Date: Wed, 22 Jan 2025 14:58:03 +0800
Message-ID: <20250122065803.3363926-3-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250122065803.3363926-1-wangyushan12@huawei.com>
References: <20250122065803.3363926-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf100016.china.huawei.com (7.185.36.236)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_225816_215647_1808A71B 
X-CRM114-Status: GOOD (  33.34  )
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

This driver implements the interface exposed by framework, passes cache
lock/unlock requests to hardware.

L3 cache and L3 cache PMU share the same memory resource, which makes
one fails to probe while another is on board.  Since both devices
rely on distinct information exported by ACPI, make their probing
functions unrelated and workaround resource conflict check by replacing
devm_ioremap_resource() to devm_ioremap().

Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 drivers/soc/hisilicon/Kconfig        |  11 +
 drivers/soc/hisilicon/Makefile       |   1 +
 drivers/soc/hisilicon/hisi_soc_l3c.c | 527 +++++++++++++++++++++++++++
 3 files changed, 539 insertions(+)
 create mode 100644 drivers/soc/hisilicon/hisi_soc_l3c.c

diff --git a/drivers/soc/hisilicon/Kconfig b/drivers/soc/hisilicon/Kconfig
index ef826c895a9d..7b44a5699950 100644
--- a/drivers/soc/hisilicon/Kconfig
+++ b/drivers/soc/hisilicon/Kconfig
@@ -32,4 +32,15 @@ config HISI_SOC_CACHE
 	  If either HiSilicon L3 cache driver or HiSilicon Hydra Home
 	  Agent driver is needed, say yes.
 
+config HISI_SOC_L3C
+	tristate "HiSilicon L3 Cache device driver"
+	depends on ARM64 && ACPI || COMPILE_TEST
+	depends on HISI_SOC_CACHE
+	help
+	  This driver provides the functions to lock L3 cache entries from
+	  being evicted for better performance.
+
+	  This driver can be built as a module. If so, the module will be
+	  called hisi_soc_l3c.
+
 endmenu
diff --git a/drivers/soc/hisilicon/Makefile b/drivers/soc/hisilicon/Makefile
index dbc673b71d4d..139ba3608984 100644
--- a/drivers/soc/hisilicon/Makefile
+++ b/drivers/soc/hisilicon/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_KUNPENG_HCCS)	+= kunpeng_hccs.o
 obj-$(CONFIG_HISI_SOC_CACHE)	+= hisi_soc_cache_framework.o
+obj-$(CONFIG_HISI_SOC_L3C)	+= hisi_soc_l3c.o
diff --git a/drivers/soc/hisilicon/hisi_soc_l3c.c b/drivers/soc/hisilicon/hisi_soc_l3c.c
new file mode 100644
index 000000000000..d91b1ef67bf3
--- /dev/null
+++ b/drivers/soc/hisilicon/hisi_soc_l3c.c
@@ -0,0 +1,527 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for HiSilicon L3 cache.
+ *
+ * Copyright (c) 2024 HiSilicon Technologies Co., Ltd.
+ * Author: Yushan Wang <wangyushan12@huawei.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/cleanup.h>
+#include <linux/cpuhotplug.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/spinlock_types.h>
+#include <linux/types.h>
+#include <linux/xarray.h>
+
+#include <asm/cputype.h>
+
+#include "hisi_soc_cache_framework.h"
+
+#define HISI_L3C_LOCK_CTRL	0x0530
+#define HISI_L3C_LOCK_AREA	0x0534
+#define HISI_L3C_LOCK_START_L	0x0538
+#define HISI_L3C_LOCK_START_H	0x053C
+
+#define HISI_L3C_LOCK_CTRL_POLL_GAP_US		10
+#define HISI_L3C_LOCK_CTRL_POLL_TIMEOUT_US	50000
+
+#define HISI_L3C_MAX_LOCKREGION_SIZE	\
+	"hisilicon,l3c-max-single-lockregion-size"
+#define HISI_L3C_MAX_LOCKREGION_NUM	\
+	"hisilicon,l3c-lockregion-num"
+
+/* L3C control register bit definition */
+#define HISI_L3C_LOCK_CTRL_LOCK_EN		BIT(0)
+#define HISI_L3C_LOCK_CTRL_LOCK_DONE		BIT(1)
+#define HISI_L3C_LOCK_CTRL_UNLOCK_EN		BIT(2)
+#define HISI_L3C_LOCK_CTRL_UNLOCK_DONE		BIT(3)
+
+#define l3c_reg_offset(reg, set)	((reg) + 16 * (set))
+
+#define l3c_lock_ctrl_mask(lock_ctrl, mask) ((lock_ctrl) & (mask))
+
+#define to_hisi_l3c(p) container_of((p), struct hisi_soc_l3c, comp)
+
+static int hisi_l3c_cpuhp_state;
+
+struct hisi_soc_l3c {
+	struct hisi_soc_comp comp;
+	cpumask_t associated_cpus;
+
+	/* Stores the first address locked by each register sets. */
+	struct xarray lock_sets;
+	/* Stores if a set of lock control register has been used. */
+	u32 reg_used_map;
+	/* Locks reg_used_map and lock_sets to forbid overlapping access. */
+	spinlock_t reg_lock;
+
+	/* Maximum locked memory size for a single lock region. */
+	unsigned int max_single_lock_size;
+	/* Maximum number of locked memory size. */
+	int max_lock_num;
+
+	struct hlist_node node;
+	void __iomem *base;
+
+	/* ID of Super CPU cluster on where the L3 cache locates. */
+	int sccl_id;
+	/* ID of CPU cluster where L3 cache is located. */
+	int ccl_id;
+};
+
+/**
+ * hisi_soc_l3c_alloc_lock_reg_set - Allocate an available control register set
+ *				     of L3 cache for lock & unlock operations.
+ * @soc_l3c:	The L3C instance on which the register set will be allocated.
+ * @addr:	The address to be locked.
+ *
+ * @return:
+ *   - -EBUSY: If there is no available register sets.
+ *   - 0: If allocation succeeds.
+ *
+ * Maintains the resource of control registers of L3 cache.  On allocation,
+ * the index of a spare set of registers is returned, then the address is
+ * stored inside for future match of unlock operation.
+ */
+static int hisi_soc_l3c_alloc_lock_reg_set(struct hisi_soc_l3c *soc_l3c,
+					   phys_addr_t addr)
+{
+	unsigned long idx;
+	void *entry;
+
+	for (idx = 0; idx < soc_l3c->max_lock_num; ++idx) {
+		entry = xa_load(&soc_l3c->lock_sets, idx);
+		if (!entry)
+			break;
+	}
+
+	if (idx >= soc_l3c->max_lock_num)
+		return -EBUSY;
+
+	xa_store(&soc_l3c->lock_sets, idx, xa_mk_value(addr), GFP_KERNEL);
+	return idx;
+}
+
+/**
+ * hisi_soc_l3c_get_locked_reg_set - Get the index of an allocated register set
+ *				     by locked address.
+ * @soc_l3c:	The L3C instance on which the register set is allocated.
+ * @addr:	The locked address.
+ *
+ * @return:
+ *   - >= 0: index of register set which controls locked memory region of @addr.
+ *   - -EINVAL: If @addr is not locked in this cache.
+ */
+static int hisi_soc_l3c_get_locked_reg_set(struct hisi_soc_l3c *soc_l3c,
+					   phys_addr_t addr)
+{
+	void *entry;
+	unsigned long idx;
+
+	xa_for_each_range(&soc_l3c->lock_sets, idx, entry, 0,
+			  soc_l3c->max_lock_num) {
+		if (xa_to_value(entry) == addr)
+			return idx;
+	}
+	return -EINVAL;
+}
+
+/**
+ * hisi_soc_l3c_free_lock_reg_set - Free an allocated register set by locked
+ *				    address.
+ *
+ * @soc_l3c:	The L3C instance on which the register set is allocated.
+ * @regset:	ID of Register set to be freed.
+ */
+static void hisi_soc_l3c_free_lock_reg_set(struct hisi_soc_l3c *soc_l3c,
+					   int regset)
+{
+	if (regset < 0)
+		return;
+
+	xa_erase(&soc_l3c->lock_sets, regset);
+}
+
+static int hisi_l3c_lock_poll_timeout(struct hisi_soc_l3c *soc_l3c,
+				      int regset, u32 mask)
+{
+	u32 reg_used_map = soc_l3c->reg_used_map;
+	void *base = soc_l3c->base;
+	u32 val;
+
+	/*
+	 * Each HiSilicon L3 cache instance will have lock/unlock done bit set
+	 * to 0 when first put to use even if the device is available.
+	 * A reg_used_map is proposed to record if an instance has been called
+	 * to lock down, then we can determine if it is available by
+	 * reading lock/unlock done bit.
+	 */
+	if (!(reg_used_map & BIT(regset))) {
+		reg_used_map |= BIT(regset);
+		return 1;
+	}
+
+	return !readl_poll_timeout_atomic(base + l3c_reg_offset(HISI_L3C_LOCK_CTRL, regset),
+					  val, l3c_lock_ctrl_mask(val, mask),
+					  HISI_L3C_LOCK_CTRL_POLL_GAP_US,
+					  HISI_L3C_LOCK_CTRL_POLL_TIMEOUT_US);
+}
+
+static int hisi_soc_l3c_do_lock(struct hisi_soc_comp *l3c_comp,
+				phys_addr_t addr, size_t size)
+{
+	struct hisi_soc_l3c *soc_l3c = to_hisi_l3c(l3c_comp);
+	void *base = soc_l3c->base;
+	int regset;
+	u32 ctrl;
+
+	if (size > soc_l3c->max_single_lock_size)
+		return -EINVAL;
+
+	guard(spinlock)(&soc_l3c->reg_lock);
+
+	regset = hisi_soc_l3c_alloc_lock_reg_set(soc_l3c, addr);
+	if (regset < 0)
+		return -EBUSY;
+
+	if (!hisi_l3c_lock_poll_timeout(soc_l3c, regset, HISI_L3C_LOCK_CTRL_LOCK_DONE)) {
+		hisi_soc_l3c_free_lock_reg_set(soc_l3c, regset);
+		return -EBUSY;
+	}
+
+	writel(lower_32_bits(addr), base + l3c_reg_offset(HISI_L3C_LOCK_START_L, regset));
+	writel(upper_32_bits(addr), base + l3c_reg_offset(HISI_L3C_LOCK_START_H, regset));
+	writel(size, base + l3c_reg_offset(HISI_L3C_LOCK_AREA, regset));
+
+	ctrl = readl(base + l3c_reg_offset(HISI_L3C_LOCK_CTRL, regset));
+	ctrl = (ctrl | HISI_L3C_LOCK_CTRL_LOCK_EN) & ~HISI_L3C_LOCK_CTRL_UNLOCK_EN;
+	writel(ctrl, base + l3c_reg_offset(HISI_L3C_LOCK_CTRL, regset));
+
+	return 0;
+}
+
+static int hisi_soc_l3c_poll_lock_done(struct hisi_soc_comp *l3c_comp,
+				       phys_addr_t addr, size_t size)
+{
+	struct hisi_soc_l3c *soc_l3c = to_hisi_l3c(l3c_comp);
+	int regset;
+
+	guard(spinlock)(&soc_l3c->reg_lock);
+
+	regset = hisi_soc_l3c_get_locked_reg_set(soc_l3c, addr);
+	if (regset < 0)
+		return -EINVAL;
+
+	if (!hisi_l3c_lock_poll_timeout(soc_l3c, regset, HISI_L3C_LOCK_CTRL_LOCK_DONE))
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+static int hisi_soc_l3c_do_unlock(struct hisi_soc_comp *l3c_comp, phys_addr_t addr)
+{
+	struct hisi_soc_l3c *soc_l3c = to_hisi_l3c(l3c_comp);
+	void *base = soc_l3c->base;
+	int regset;
+	u32 ctrl;
+
+	guard(spinlock)(&soc_l3c->reg_lock);
+
+	regset = hisi_soc_l3c_get_locked_reg_set(soc_l3c, addr);
+	if (regset < 0)
+		return -EINVAL;
+
+	if (!hisi_l3c_lock_poll_timeout(soc_l3c, regset, HISI_L3C_LOCK_CTRL_UNLOCK_DONE))
+		return -EBUSY;
+
+	ctrl = readl(base + l3c_reg_offset(HISI_L3C_LOCK_CTRL, regset));
+	ctrl = (ctrl | HISI_L3C_LOCK_CTRL_UNLOCK_EN) & ~HISI_L3C_LOCK_CTRL_LOCK_EN;
+	writel(ctrl, base + l3c_reg_offset(HISI_L3C_LOCK_CTRL, regset));
+
+	return 0;
+}
+
+static int hisi_soc_l3c_poll_unlock_done(struct hisi_soc_comp *l3c_comp, phys_addr_t addr)
+{
+	struct hisi_soc_l3c *soc_l3c = to_hisi_l3c(l3c_comp);
+	int regset;
+
+	guard(spinlock)(&soc_l3c->reg_lock);
+
+	regset = hisi_soc_l3c_get_locked_reg_set(soc_l3c, addr);
+	if (regset < 0)
+		return -EINVAL;
+
+	if (!hisi_l3c_lock_poll_timeout(soc_l3c, regset, HISI_L3C_LOCK_CTRL_UNLOCK_DONE))
+		return -ETIMEDOUT;
+
+	hisi_soc_l3c_free_lock_reg_set(soc_l3c, regset);
+
+	return 0;
+}
+
+/**
+ * hisi_soc_l3c_remove_locks - Remove all cache locks when the driver exits.
+ *
+ * @soc_l3c:	The L3C instance on which the cache locks should be removed.
+ */
+static void hisi_soc_l3c_remove_locks(struct hisi_soc_l3c *soc_l3c)
+{
+	void *base = soc_l3c->base;
+	unsigned long regset;
+	int timeout;
+	void *entry;
+	u32 ctrl;
+
+	guard(spinlock)(&soc_l3c->reg_lock);
+
+	xa_for_each(&soc_l3c->lock_sets, regset, entry) {
+		timeout = hisi_l3c_lock_poll_timeout(soc_l3c, regset,
+						     HISI_L3C_LOCK_CTRL_UNLOCK_DONE);
+
+		ctrl = readl(base + l3c_reg_offset(HISI_L3C_LOCK_CTRL, regset));
+		ctrl = (ctrl | HISI_L3C_LOCK_CTRL_UNLOCK_EN) &
+			~HISI_L3C_LOCK_CTRL_LOCK_EN;
+		writel(ctrl, base + l3c_reg_offset(HISI_L3C_LOCK_CTRL, regset));
+
+		timeout = hisi_l3c_lock_poll_timeout(soc_l3c, regset,
+						     HISI_L3C_LOCK_CTRL_UNLOCK_DONE);
+
+		/*
+		 * If cache lock remove fails, inform user since the removal of
+		 * driver cannot fail.
+		 */
+		if (timeout)
+			pr_err("failed to remove %lu-th cache lock.\n", regset);
+	}
+}
+
+static int hisi_soc_l3c_init_lock_capacity(struct hisi_soc_l3c *soc_l3c,
+					   struct device *dev)
+{
+	if (device_property_read_u32(dev, HISI_L3C_MAX_LOCKREGION_SIZE,
+				     &soc_l3c->max_single_lock_size) ||
+	    soc_l3c->max_single_lock_size <= 0)
+		return -EINVAL;
+
+	if (device_property_read_u32(dev, HISI_L3C_MAX_LOCKREGION_NUM,
+				     &soc_l3c->max_lock_num) ||
+	    soc_l3c->max_lock_num <= 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int hisi_soc_l3c_init_topology(struct hisi_soc_l3c *soc_l3c,
+				      struct device *dev)
+{
+	soc_l3c->sccl_id = -1;
+	soc_l3c->ccl_id = -1;
+
+	if (device_property_read_u32(dev, "hisilicon,scl-id", &soc_l3c->sccl_id) ||
+	    soc_l3c->sccl_id < 0)
+		return -EINVAL;
+
+	if (device_property_read_u32(dev, "hisilicon,ccl-id", &soc_l3c->ccl_id) ||
+	    soc_l3c->ccl_id < 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void hisi_init_associated_cpus(struct hisi_soc_l3c *soc_l3c)
+{
+	if (!cpumask_empty(&soc_l3c->associated_cpus))
+		return;
+	cpumask_clear(&soc_l3c->associated_cpus);
+	cpumask_copy(&soc_l3c->comp.affinity_mask, &soc_l3c->associated_cpus);
+}
+
+static struct hisi_soc_comp_ops hisi_soc_l3c_comp_ops = {
+	.do_lock = hisi_soc_l3c_do_lock,
+	.poll_lock_done = hisi_soc_l3c_poll_lock_done,
+	.do_unlock = hisi_soc_l3c_do_unlock,
+	.poll_unlock_done = hisi_soc_l3c_poll_unlock_done,
+};
+
+static struct hisi_soc_comp hisi_soc_l3c_comp = {
+	.comp_type = BIT(HISI_SOC_L3C),
+	.ops = &hisi_soc_l3c_comp_ops,
+};
+
+static int hisi_soc_l3c_probe(struct platform_device *pdev)
+{
+	struct hisi_soc_l3c *soc_l3c;
+	struct resource *mem;
+	int ret = 0;
+
+	soc_l3c = devm_kzalloc(&pdev->dev, sizeof(*soc_l3c), GFP_KERNEL);
+	if (!soc_l3c)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, soc_l3c);
+
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!mem)
+		return -ENODEV;
+
+	/*
+	 * L3C cache driver share the same register region with L3C uncore PMU
+	 * driver in hardware's perspective, none of them should reserve the
+	 * resource to itself only.  Here exclusive access verification is
+	 * avoided by calling devm_ioremap instead of devm_ioremap_resource to
+	 * allow both drivers to exist at the same time.
+	 */
+	soc_l3c->base = devm_ioremap(&pdev->dev, mem->start,
+				     resource_size(mem));
+	if (IS_ERR_OR_NULL(soc_l3c->base))
+		return PTR_ERR(soc_l3c->base);
+
+	soc_l3c->comp = hisi_soc_l3c_comp;
+	spin_lock_init(&soc_l3c->reg_lock);
+	xa_init(&soc_l3c->lock_sets);
+
+	ret = hisi_soc_l3c_init_lock_capacity(soc_l3c, &pdev->dev);
+	if (ret)
+		goto err_xa;
+
+	hisi_init_associated_cpus(soc_l3c);
+
+	ret = hisi_soc_l3c_init_topology(soc_l3c, &pdev->dev);
+	if (ret)
+		goto err_xa;
+
+	ret = cpuhp_state_add_instance(hisi_l3c_cpuhp_state, &soc_l3c->node);
+	if (ret)
+		goto err_xa;
+
+	ret = hisi_soc_comp_inst_add(&soc_l3c->comp);
+	if (ret)
+		goto err_hotplug;
+
+	return ret;
+
+err_hotplug:
+	cpuhp_state_remove_instance_nocalls(hisi_l3c_cpuhp_state, &soc_l3c->node);
+
+err_xa:
+	xa_destroy(&soc_l3c->lock_sets);
+	return ret;
+}
+
+static void hisi_soc_l3c_remove(struct platform_device *pdev)
+{
+	struct hisi_soc_l3c *soc_l3c = platform_get_drvdata(pdev);
+	unsigned long idx;
+	void *entry;
+
+	hisi_soc_l3c_remove_locks(soc_l3c);
+
+	hisi_soc_comp_inst_del(&soc_l3c->comp);
+
+	cpuhp_state_remove_instance_nocalls(hisi_l3c_cpuhp_state,
+					    &soc_l3c->node);
+
+	xa_for_each(&soc_l3c->lock_sets, idx, entry)
+		xa_erase(&soc_l3c->lock_sets, idx);
+
+	xa_destroy(&soc_l3c->lock_sets);
+}
+
+static void hisi_read_sccl_and_ccl_id(int *scclp, int *cclp)
+{
+	u64 mpidr = read_cpuid_mpidr();
+	int aff3 = MPIDR_AFFINITY_LEVEL(mpidr, 3);
+	int aff2 = MPIDR_AFFINITY_LEVEL(mpidr, 2);
+	int aff1 = MPIDR_AFFINITY_LEVEL(mpidr, 1);
+	int sccl, ccl;
+
+	if (mpidr & MPIDR_MT_BITMASK) {
+		sccl = aff3;
+		ccl = aff2;
+	} else {
+		sccl = aff2;
+		ccl = aff1;
+	}
+
+	*scclp = sccl;
+	*cclp = ccl;
+}
+
+static bool hisi_soc_l3c_is_associated(struct hisi_soc_l3c *soc_l3c)
+{
+	int sccl_id, ccl_id;
+
+	hisi_read_sccl_and_ccl_id(&sccl_id, &ccl_id);
+	return sccl_id == soc_l3c->sccl_id && ccl_id == soc_l3c->ccl_id;
+}
+
+static int hisi_soc_l3c_online_cpu(unsigned int cpu, struct hlist_node *node)
+{
+	struct hisi_soc_l3c *soc_l3c =
+		hlist_entry_safe(node, struct hisi_soc_l3c, node);
+
+	if (!cpumask_test_cpu(cpu, &soc_l3c->associated_cpus)) {
+		if (!(hisi_soc_l3c_is_associated(soc_l3c)))
+			return 0;
+
+		cpumask_set_cpu(cpu, &soc_l3c->associated_cpus);
+		cpumask_copy(&soc_l3c->comp.affinity_mask,
+			     &soc_l3c->associated_cpus);
+	}
+	return 0;
+}
+
+static const struct acpi_device_id hisi_l3c_acpi_match[] = {
+	{ "HISI0501", },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, hisi_l3c_acpi_match);
+
+static struct platform_driver hisi_soc_l3c_driver = {
+	.driver = {
+		.name = "hisi_soc_l3c",
+		.acpi_match_table = hisi_l3c_acpi_match,
+	},
+	.probe = hisi_soc_l3c_probe,
+	.remove = hisi_soc_l3c_remove,
+};
+
+static int __init hisi_soc_l3c_init(void)
+{
+	int ret;
+
+	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, "hisi_soc_l3c",
+				      hisi_soc_l3c_online_cpu, NULL);
+	if (ret < 0)
+		return ret;
+	hisi_l3c_cpuhp_state = ret;
+
+	ret = platform_driver_register(&hisi_soc_l3c_driver);
+	if (ret)
+		cpuhp_remove_multi_state(CPUHP_AP_ONLINE_DYN);
+
+	return ret;
+}
+module_init(hisi_soc_l3c_init);
+
+static void __exit hisi_soc_l3c_exit(void)
+{
+	platform_driver_unregister(&hisi_soc_l3c_driver);
+	cpuhp_remove_multi_state(CPUHP_AP_ONLINE_DYN);
+}
+module_exit(hisi_soc_l3c_exit);
+
+MODULE_DESCRIPTION("Driver supporting cache lockdown for Hisilicon L3 cache");
+MODULE_AUTHOR("Yushan Wang <wangyushan12@huawei.com>");
+MODULE_LICENSE("GPL");
-- 
2.33.0


