Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E1CD6552C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjf9nElP4xRo/evEet3Ndawinw3/P3yEeqcpeGgXScI=; b=wtMh5I/SnwhhmS6nFeGqIQbsh8
	NvzgT4UbZwimmx+cgcEs+mlVkUfDctstx4uf1OG/2VusalKsXQGsve2rjm8az8fiKF11jNdXAHfpb
	wD7RkgRx5BnGZd7W/UDLOtuSU2HnpxJh/4Rd84/XemDE/WiGvK2XoLF4F0afz9u3MbeRbL/FsiTQx
	LBCUxpkRZD35YD/I/pdi8Oy/OJAH6k2qkZ3u6E3NgyrknMLeg7NAgbIgddg1pMP2qaSfqSxNawjkE
	uS+Gjc03Rh7IvaRD2IGbqR3j2AVOWX3GVPEru+Gib6uR+DRq/zQ+Z1fIJS48k+FlN3ST3Z2gOmf6s
	GjQurxSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVohe-00000006dTE-1HIO;
	Wed, 17 Dec 2025 10:24:18 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVohX-00000006dQF-1i18
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 10:24:14 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yjf9nElP4xRo/evEet3Ndawinw3/P3yEeqcpeGgXScI=;
	b=Rga2IjF2HlNF7ekhZSdD4p3e4SOzBEOPMtAIootld1mBOdMFmpvxUQ8dR2Oe+i+zdDHhjn14U
	iyhSBheEltYWmVmmnxvoFu5L1quM39QERlqqppWPitbi8odee+c8UCiczuXoCEqSGlQJRY5xrh+
	ChDj1pzB3WecjiV/fJX3gQY=
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4dWVGL20wFzKm72;
	Wed, 17 Dec 2025 18:22:02 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 8F19B1800D0;
	Wed, 17 Dec 2025 18:24:03 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 17 Dec 2025 18:23:59 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 17 Dec 2025 18:23:58 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<xuwei5@hisilicon.com>, <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>,
	<Jonathan.Cameron@huawei.com>
CC: <liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <alexandre.belloni@bootlin.com>, <arnd@arndb.de>,
	<fustini@kernel.org>, <krzk@kernel.org>, <linus.walleij@linaro.org>,
	<will@kernel.org>
Subject: [PATCH RFC v2 2/3] soc cache: L3 cache lockdown support for HiSilicon SoC
Date: Wed, 17 Dec 2025 18:23:56 +0800
Message-ID: <20251217102357.1730573-3-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20251217102357.1730573-1-wangyushan12@huawei.com>
References: <20251217102357.1730573-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_022411_789677_81802063 
X-CRM114-Status: GOOD (  27.09  )
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

The number of locked memory region is limited according to firmware,
and the total size of locked memory regions must be less than 70% of
cache size.

Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 drivers/soc/hisilicon/hisi_soc_l3c.c | 520 ++++++++++++++++++++++++++-
 1 file changed, 519 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/hisilicon/hisi_soc_l3c.c b/drivers/soc/hisilicon/hisi_soc_l3c.c
index 2c196c4dfff1..1e3419436173 100644
--- a/drivers/soc/hisilicon/hisi_soc_l3c.c
+++ b/drivers/soc/hisilicon/hisi_soc_l3c.c
@@ -8,19 +8,49 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/acpi.h>
 #include <linux/cleanup.h>
+#include <linux/cpuhotplug.h>
 #include <linux/init.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/mm.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/spinlock_types.h>
 #include <linux/types.h>
+#include <linux/xarray.h>
 
 #include <asm/cputype.h>
 
 #include <uapi/misc/hisi_l3c.h>
 
+#define HISI_L3C_LOCK_CTRL	0x0530
+#define HISI_L3C_LOCK_AREA	0x0534
+#define HISI_L3C_LOCK_START_L	0x0538
+#define HISI_L3C_LOCK_START_H	0x053C
+
+#define HISI_L3C_DYNAMIC_AUCTRL	0x0404
+
+#define HISI_L3C_LOCK_CTRL_POLL_GAP_US	10
+#define HISI_L3C_LOCK_CTRL_POLL_MAX_US	10000
+
+/* L3C control register bit definition */
+#define HISI_L3C_LOCK_CTRL_LOCK_EN		BIT(0)
+#define HISI_L3C_LOCK_CTRL_LOCK_DONE		BIT(1)
+#define HISI_L3C_LOCK_CTRL_UNLOCK_EN		BIT(2)
+#define HISI_L3C_LOCK_CTRL_UNLOCK_DONE		BIT(3)
+
+#define HISI_L3C_LOCK_MIN_SIZE		(1 * 1024 * 1024)
+#define HISI_L3_CACHE_LINE_SIZE		64
+
+/* Allow maximum 70% of cache locked. */
+#define HISI_L3C_MAX_LOCK_SIZE(size)	((size) / 10 * 7)
+
+#define l3c_lock_reg_offset(reg, set)	((reg) + 16 * (set))
+
 #define to_hisi_l3c(p) container_of((p), struct hisi_l3c, comp)
 
 /**
@@ -85,8 +115,280 @@ struct hisi_soc_comp_list {
 	spinlock_t lock;
 };
 
+struct hisi_l3c {
+	struct hisi_soc_comp comp;
+	cpumask_t associated_cpus;
+
+	/* Stores the first address locked by each register sets. */
+	struct xarray lock_sets;
+	/* Locks lock_sets to forbid overlapping access. */
+	spinlock_t reg_lock;
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
+static int hisi_l3c_cpuhp_state;
+
 static struct hisi_soc_comp_list l3c_devs;
 
+/**
+ * hisi_l3c_alloc_lock_reg_set - Allocate an available control register set
+ *				     of L3 cache for lock & unlock operations.
+ * @l3c:	The L3C instance on which the register set will be allocated.
+ * @addr:	The address to be locked.
+ * @size:	The size to be locked.
+ *
+ * @return:
+ *   - -EBUSY: If there is no available register sets.
+ *   - -ENOMEM: If there is no available memory for lock region struct.
+ *   - -EINVAL: If there is no available cache size for lock.
+ *   - 0: If allocation succeeds.
+ *
+ * Maintains the resource of control registers of L3 cache.  On allocation,
+ * the index of a spare set of registers is returned, then the address is
+ * stored inside for future match of unlock operation.
+ */
+static int hisi_l3c_alloc_lock_reg_set(struct hisi_l3c *l3c, phys_addr_t addr, size_t size)
+{
+	struct hisi_l3c_lock_info *info = l3c->comp.private;
+	struct hisi_l3c_lock_region *lr;
+	void *entry;
+	int idx, ret;
+
+	if (size > info->lock_size)
+		return -EINVAL;
+
+	for (idx = 0; idx < info->lock_region_num; ++idx) {
+		entry = xa_load(&l3c->lock_sets, idx);
+		if (!entry)
+			break;
+	}
+
+	if (idx > info->lock_region_num)
+		return -EBUSY;
+
+	lr = kzalloc(sizeof(*lr), GFP_KERNEL);
+	if (!lr)
+		return -ENOMEM;
+
+	lr->addr = addr;
+	lr->size = size;
+
+	ret = xa_alloc(&l3c->lock_sets, &idx, lr, xa_limit_31b, GFP_KERNEL);
+	if (ret) {
+		kfree(lr);
+		return ret;
+	}
+
+	info->lock_size -= size;
+	info->lock_region_num -= 1;
+
+	return idx;
+}
+
+/**
+ * hisi_l3c_get_locked_reg_set - Get the index of an allocated register set
+ *				     by locked address.
+ * @l3c:	The L3C instance on which the register set is allocated.
+ * @addr:	The locked address.
+ *
+ * @return:
+ *   - >= 0: index of register set which controls locked memory region of @addr.
+ *   - -EINVAL: If @addr is not locked in this cache.
+ */
+static int hisi_l3c_get_locked_reg_set(struct hisi_l3c *l3c, phys_addr_t addr)
+{
+	struct hisi_l3c_lock_region *entry;
+	unsigned long idx;
+
+	xa_for_each(&l3c->lock_sets, idx, entry) {
+		if (entry->addr == addr)
+			return idx;
+	}
+	return -EINVAL;
+}
+
+/**
+ * hisi_l3c_free_lock_reg_set - Free an allocated register set by locked
+ *				    address.
+ *
+ * @l3c:	The L3C instance on which the register set is allocated.
+ * @regset:	ID of Register set to be freed.
+ */
+static void hisi_l3c_free_lock_reg_set(struct hisi_l3c *l3c, int regset)
+{
+	struct hisi_l3c_lock_info *info = l3c->comp.private;
+	struct hisi_l3c_lock_region *entry;
+
+	if (regset < 0)
+		return;
+
+	entry = xa_erase(&l3c->lock_sets, regset);
+	if (!entry)
+		return;
+
+	info->lock_size += entry->size;
+	info->lock_region_num += 1;
+	kfree(entry);
+}
+
+static bool hisi_l3c_lock_wait_finished(struct hisi_l3c *l3c, int regset)
+{
+	void *reg = l3c->base + l3c_lock_reg_offset(HISI_L3C_LOCK_CTRL, regset);
+	/* Wait until neither lock or unlock operation is going on. */
+	u32 mask = HISI_L3C_LOCK_CTRL_LOCK_DONE | HISI_L3C_LOCK_CTRL_UNLOCK_DONE;
+	u32 val;
+
+	/*
+	 * Lock/unlock done bits are initially 0 if no lock operation was ever
+	 * issued, and will be set until next operation comes.
+	 * Check if this is the first lock operation after boot by checking if
+	 * the register is 0. If so, proceed with the operation.
+	 */
+	val = readl(reg);
+	if (!val)
+		return true;
+
+	return !readl_poll_timeout_atomic(reg, val, val & mask,
+			HISI_L3C_LOCK_CTRL_POLL_GAP_US,
+			HISI_L3C_LOCK_CTRL_POLL_MAX_US);
+}
+
+static int hisi_l3c_do_lock(struct hisi_soc_comp *comp, phys_addr_t addr, size_t size)
+{
+	struct hisi_l3c *l3c = to_hisi_l3c(comp);
+	struct hisi_l3c_lock_info *info = l3c->comp.private;
+	void *base = l3c->base;
+	int regset;
+	u32 ctrl;
+
+	if (info->address_alignment && addr % size != 0)
+		return -EINVAL;
+
+	if (size < info->min_lock_size || size > info->max_lock_size)
+		return -EINVAL;
+
+	guard(spinlock)(&l3c->reg_lock);
+
+	regset = hisi_l3c_alloc_lock_reg_set(l3c, addr, size);
+	if (regset < 0)
+		return -EBUSY;
+
+	if (!hisi_l3c_lock_wait_finished(l3c, regset)) {
+		hisi_l3c_free_lock_reg_set(l3c, regset);
+		return -EBUSY;
+	}
+
+	writel(lower_32_bits(addr),
+	       base + l3c_lock_reg_offset(HISI_L3C_LOCK_START_L, regset));
+	writel(upper_32_bits(addr),
+	       base + l3c_lock_reg_offset(HISI_L3C_LOCK_START_H, regset));
+	writel(size, base + l3c_lock_reg_offset(HISI_L3C_LOCK_AREA, regset));
+
+	ctrl = readl(base + HISI_L3C_DYNAMIC_AUCTRL);
+	ctrl |= BIT(regset);
+	writel(ctrl, base + HISI_L3C_DYNAMIC_AUCTRL);
+
+	ctrl = readl(base + l3c_lock_reg_offset(HISI_L3C_LOCK_CTRL, regset));
+	ctrl = (ctrl | HISI_L3C_LOCK_CTRL_LOCK_EN) &
+		~HISI_L3C_LOCK_CTRL_UNLOCK_EN;
+	writel(ctrl, base + l3c_lock_reg_offset(HISI_L3C_LOCK_CTRL, regset));
+
+	return 0;
+}
+
+static int hisi_l3c_poll_lock_done(struct hisi_soc_comp *comp, phys_addr_t addr, size_t size)
+{
+	struct hisi_l3c *l3c = to_hisi_l3c(comp);
+	int regset;
+
+	guard(spinlock)(&l3c->reg_lock);
+
+	regset = hisi_l3c_get_locked_reg_set(l3c, addr);
+	if (regset < 0)
+		return -EINVAL;
+
+	if (!hisi_l3c_lock_wait_finished(l3c, regset))
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+static int hisi_l3c_do_unlock(struct hisi_soc_comp *comp, phys_addr_t addr)
+{
+	struct hisi_l3c *l3c = to_hisi_l3c(comp);
+	void *base = l3c->base;
+	int regset;
+	u32 ctrl;
+
+	guard(spinlock)(&l3c->reg_lock);
+
+	regset = hisi_l3c_get_locked_reg_set(l3c, addr);
+	if (regset < 0)
+		return -EINVAL;
+
+	if (!hisi_l3c_lock_wait_finished(l3c, regset))
+		return -EBUSY;
+
+	ctrl = readl(base + HISI_L3C_DYNAMIC_AUCTRL);
+	ctrl &= ~BIT(regset);
+	writel(ctrl, base + HISI_L3C_DYNAMIC_AUCTRL);
+
+	ctrl = readl(base + l3c_lock_reg_offset(HISI_L3C_LOCK_CTRL, regset));
+	ctrl = (ctrl | HISI_L3C_LOCK_CTRL_UNLOCK_EN) &
+		~HISI_L3C_LOCK_CTRL_LOCK_EN;
+	writel(ctrl, base + l3c_lock_reg_offset(HISI_L3C_LOCK_CTRL, regset));
+
+	return 0;
+}
+
+static int hisi_l3c_poll_unlock_done(struct hisi_soc_comp *comp, phys_addr_t addr)
+{
+	struct hisi_l3c *l3c = to_hisi_l3c(comp);
+	int regset;
+
+	guard(spinlock)(&l3c->reg_lock);
+
+	regset = hisi_l3c_get_locked_reg_set(l3c, addr);
+	if (regset < 0)
+		return -EINVAL;
+
+	if (!hisi_l3c_lock_wait_finished(l3c, regset))
+		return -ETIMEDOUT;
+
+	hisi_l3c_free_lock_reg_set(l3c, regset);
+
+	return 0;
+}
+
+static void hisi_l3c_remove_locks(struct hisi_l3c *l3c)
+{
+	void *base = l3c->base;
+	unsigned long regset;
+	void *entry;
+
+	guard(spinlock)(&l3c->reg_lock);
+
+	xa_for_each(&l3c->lock_sets, regset, entry) {
+		int timeout;
+		u32 ctrl;
+
+		ctrl = readl(base + l3c_lock_reg_offset(HISI_L3C_LOCK_CTRL, regset));
+		ctrl = (ctrl | HISI_L3C_LOCK_CTRL_UNLOCK_EN) & ~HISI_L3C_LOCK_CTRL_LOCK_EN;
+		writel(ctrl, base + l3c_lock_reg_offset(HISI_L3C_LOCK_CTRL, regset));
+
+		timeout = hisi_l3c_lock_wait_finished(l3c, regset);
+		if (timeout)
+			pr_err("failed to remove %lu-th cache lock.\n", regset);
+	}
+}
+
 static int hisi_l3c_lock(int cpu, phys_addr_t addr, size_t size)
 {
 	struct hisi_soc_comp *comp;
@@ -315,6 +617,196 @@ static int hisi_l3c_lock_restriction(unsigned long arg)
 	return -ENODEV;
 }
 
+static int hisi_l3c_init_lock_capacity(struct hisi_l3c *l3c, struct device *dev)
+{
+	int ret;
+	u32 val;
+
+	struct hisi_l3c_lock_info *info __free(kfree) = kmalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	ret = device_property_read_u32(dev, "hisilicon,l3c-lockregion-num", &val);
+	if (ret || val <= 0)
+		return -EINVAL;
+
+	info->lock_region_num = val;
+
+	ret = device_property_read_u32(dev, "hisilicon,l3c-max-single-lockregion-size", &val);
+	if (ret || val <= 0)
+		return -EINVAL;
+
+	info->lock_size = HISI_L3C_MAX_LOCK_SIZE(val);
+	info->address_alignment = info->lock_region_num == 1;
+	info->max_lock_size = HISI_L3C_MAX_LOCK_SIZE(val);
+	info->min_lock_size = info->lock_region_num == 1
+					? HISI_L3C_LOCK_MIN_SIZE
+					: HISI_L3_CACHE_LINE_SIZE;
+
+	l3c->comp.private = no_free_ptr(info);
+
+	return 0;
+}
+
+static int hisi_l3c_init_topology(struct hisi_l3c *l3c, struct device *dev)
+{
+	l3c->sccl_id = -1;
+	l3c->ccl_id = -1;
+
+	if (device_property_read_u32(dev, "hisilicon,scl-id", &l3c->sccl_id) ||
+	    l3c->sccl_id < 0)
+		return -EINVAL;
+
+	if (device_property_read_u32(dev, "hisilicon,ccl-id", &l3c->ccl_id) ||
+	    l3c->ccl_id < 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void hisi_init_associated_cpus(struct hisi_l3c *l3c)
+{
+	if (!cpumask_empty(&l3c->associated_cpus))
+		return;
+	cpumask_clear(&l3c->associated_cpus);
+	cpumask_copy(&l3c->comp.affinity_mask, &l3c->associated_cpus);
+}
+
+static struct hisi_soc_comp_ops hisi_comp_ops = {
+	.do_lock = hisi_l3c_do_lock,
+	.poll_lock_done = hisi_l3c_poll_lock_done,
+	.do_unlock = hisi_l3c_do_unlock,
+	.poll_unlock_done = hisi_l3c_poll_unlock_done,
+};
+
+static struct hisi_soc_comp hisi_comp = {
+	.ops = &hisi_comp_ops,
+};
+
+static int hisi_l3c_probe(struct platform_device *pdev)
+{
+	struct hisi_l3c *l3c;
+	struct resource *mem;
+	int ret;
+
+	l3c = devm_kzalloc(&pdev->dev, sizeof(*l3c), GFP_KERNEL);
+	if (!l3c)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, l3c);
+
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!mem)
+		return -ENODEV;
+
+	l3c->base = devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
+	if (IS_ERR_OR_NULL(l3c->base))
+		return PTR_ERR(l3c->base);
+
+	l3c->comp = hisi_comp;
+	spin_lock_init(&l3c->reg_lock);
+	xa_init_flags(&l3c->lock_sets, XA_FLAGS_ALLOC);
+
+	ret = hisi_l3c_init_lock_capacity(l3c, &pdev->dev);
+	if (ret)
+		goto err_xa;
+
+	hisi_init_associated_cpus(l3c);
+
+	ret = hisi_l3c_init_topology(l3c, &pdev->dev);
+	if (ret)
+		goto err_xa;
+
+	ret = cpuhp_state_add_instance(hisi_l3c_cpuhp_state, &l3c->node);
+	if (ret)
+		goto err_xa;
+
+	hisi_soc_comp_add(&l3c->comp);
+
+	return 0;
+
+err_xa:
+	xa_destroy(&l3c->lock_sets);
+	return ret;
+}
+
+static void hisi_l3c_remove(struct platform_device *pdev)
+{
+	struct hisi_l3c *l3c = platform_get_drvdata(pdev);
+	unsigned long idx;
+	struct hisi_l3c_lock_region *entry;
+
+	hisi_l3c_remove_locks(l3c);
+
+	hisi_soc_comp_del(&l3c->comp);
+
+	cpuhp_state_remove_instance_nocalls(hisi_l3c_cpuhp_state, &l3c->node);
+
+	xa_for_each(&l3c->lock_sets, idx, entry)
+		entry = xa_erase(&l3c->lock_sets, idx);
+
+	xa_destroy(&l3c->lock_sets);
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
+static bool hisi_l3c_is_associated(struct hisi_l3c *l3c)
+{
+	int sccl_id, ccl_id;
+
+	hisi_read_sccl_and_ccl_id(&sccl_id, &ccl_id);
+
+	return sccl_id == l3c->sccl_id && ccl_id == l3c->ccl_id;
+}
+
+static int hisi_l3c_online_cpu(unsigned int cpu, struct hlist_node *node)
+{
+	struct hisi_l3c *l3c = hlist_entry_safe(node, struct hisi_l3c, node);
+
+	if (!cpumask_test_cpu(cpu, &l3c->associated_cpus)) {
+		if (!(hisi_l3c_is_associated(l3c)))
+			return 0;
+
+		cpumask_set_cpu(cpu, &l3c->associated_cpus);
+		cpumask_copy(&l3c->comp.affinity_mask,
+			     &l3c->associated_cpus);
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
+static struct platform_driver hisi_l3c_driver = {
+	.driver = {
+		.name = "hisi_l3c",
+		.acpi_match_table = hisi_l3c_acpi_match,
+	},
+	.probe = hisi_l3c_probe,
+	.remove = hisi_l3c_remove,
+};
+
 static long hisi_l3c_ioctl(struct file *file, u32 cmd, unsigned long arg)
 {
 	switch (cmd) {
@@ -340,15 +832,41 @@ static struct miscdevice l3c_miscdev = {
 
 static int __init hisi_l3c_init(void)
 {
+	int ret;
+
 	spin_lock_init(&l3c_devs.lock);
 	INIT_LIST_HEAD(&l3c_devs.node);
 
-	return misc_register(&l3c_miscdev);
+	ret = misc_register(&l3c_miscdev);
+	if (ret)
+		return ret;
+
+	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, "hisi_l3c",
+				      hisi_l3c_online_cpu, NULL);
+	if (ret < 0)
+		goto err_hp;
+
+	hisi_l3c_cpuhp_state = ret;
+
+	ret = platform_driver_register(&hisi_l3c_driver);
+	if (ret)
+		goto err_plat;
+
+	return 0;
+
+err_plat:
+	cpuhp_remove_multi_state(CPUHP_AP_ONLINE_DYN);
+err_hp:
+	misc_deregister(&l3c_miscdev);
+
+	return ret;
 }
 module_init(hisi_l3c_init);
 
 static void __exit hisi_l3c_exit(void)
 {
+	platform_driver_unregister(&hisi_l3c_driver);
+	cpuhp_remove_multi_state(CPUHP_AP_ONLINE_DYN);
 	misc_deregister(&l3c_miscdev);
 	hisi_soc_comp_del(NULL);
 }
-- 
2.33.0


