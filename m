Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF4DC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 06:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXrGCRVy0xrAsux56YWNqowoVYljQeYjfABhTJ6njzE=; b=RZ+LXomT91+ChDtHfXkY5I2WhU
	x/6jvqJCBqmxtawbV/JeS2JJluaI3GMl+koifgUndInzHMKiliS4qkaoOaRzYTJUY/nQDWl7oMmhZ
	E/eWTPcMWo3AI+0SGnr6b6VGuTtHMS25dlWbxKH5DmYQyXFrIFynJjEbcvqAiu5Fgsm6DsoxpK800
	B8/leIDnPxWTw9G7kCS34Oms6LJI7s6UAofTdVxgbSb1agEy3uTYvBEqAq7H1IsUHnJRVD7ysC6+u
	G70ElWU5f+qSij57DcACUMSvDwsXKbivQ8moZMC3mwgIpwNdylx7DeTI3BHWVIRvA3i81aq1bPg0r
	i099OvDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taUi7-00000009YkL-1RA4;
	Wed, 22 Jan 2025 06:59:35 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taUgp-00000009YXh-0oiw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 06:58:17 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YdFFz329bz22lhq;
	Wed, 22 Jan 2025 14:55:35 +0800 (CST)
Received: from dggpemf100016.china.huawei.com (unknown [7.185.36.236])
	by mail.maildlp.com (Postfix) with ESMTPS id 6CC5214013B;
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
Subject: [PATCH v2 1/2] soc cache: Add framework driver for HiSilicon SoC cache
Date: Wed, 22 Jan 2025 14:58:02 +0800
Message-ID: <20250122065803.3363926-2-wangyushan12@huawei.com>
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
X-CRM114-CacheID: sfid-20250121_225815_541453_347164B4 
X-CRM114-Status: GOOD (  36.30  )
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

From: Jie Wang <wangjie125@huawei.com>

HiSilicon SoC cache is comprised of multiple hardware devices, a driver
in this patch is used to provide common utilities for other drivers to
avoid redundancy.

The driver will create a file of `/dev/hisi_soc_cache_mgmt`, mmap
operations to it will be taken as applying cache lock for a memory
region, ioctl operations will be taken as cache maintenance.

The address is aligned up to return to user and the arena's starting
address is stored for future release.  Unused pages produced during
above process are released to allow minimum arena.

Co-developed-by: Yicong Yang <yangyicong@hisilicon.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Co-developed-by: Yushan Wang <wangyushan12@huawei.com>
Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
Signed-off-by: Jie Wang <wangjie125@huawei.com>
---
 drivers/soc/hisilicon/Kconfig                 |  11 +
 drivers/soc/hisilicon/Makefile                |   1 +
 .../soc/hisilicon/hisi_soc_cache_framework.c  | 534 ++++++++++++++++++
 .../soc/hisilicon/hisi_soc_cache_framework.h  |  77 +++
 4 files changed, 623 insertions(+)
 create mode 100644 drivers/soc/hisilicon/hisi_soc_cache_framework.c
 create mode 100644 drivers/soc/hisilicon/hisi_soc_cache_framework.h

diff --git a/drivers/soc/hisilicon/Kconfig b/drivers/soc/hisilicon/Kconfig
index 6d7c244d2e78..ef826c895a9d 100644
--- a/drivers/soc/hisilicon/Kconfig
+++ b/drivers/soc/hisilicon/Kconfig
@@ -21,4 +21,15 @@ config KUNPENG_HCCS
 	  health status and port information of HCCS, or reducing system
 	  power consumption on Kunpeng SoC.
 
+config HISI_SOC_CACHE
+	bool "HiSilicon Cache driver for Kunpeng SoC"
+	depends on ARCH_HISI
+	help
+	  This driver provides the basic utilities for drivers of
+	  different part of Kunpeng SoC cache, including L3 cache and
+	  Hydra Home Agent etc.
+
+	  If either HiSilicon L3 cache driver or HiSilicon Hydra Home
+	  Agent driver is needed, say yes.
+
 endmenu
diff --git a/drivers/soc/hisilicon/Makefile b/drivers/soc/hisilicon/Makefile
index 226e747e70d6..dbc673b71d4d 100644
--- a/drivers/soc/hisilicon/Makefile
+++ b/drivers/soc/hisilicon/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_KUNPENG_HCCS)	+= kunpeng_hccs.o
+obj-$(CONFIG_HISI_SOC_CACHE)	+= hisi_soc_cache_framework.o
diff --git a/drivers/soc/hisilicon/hisi_soc_cache_framework.c b/drivers/soc/hisilicon/hisi_soc_cache_framework.c
new file mode 100644
index 000000000000..d86e97f8671e
--- /dev/null
+++ b/drivers/soc/hisilicon/hisi_soc_cache_framework.c
@@ -0,0 +1,534 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Framework for HiSilicon SoC cache, manages HiSilicon SoC cache drivers.
+ *
+ * Copyright (c) 2024 HiSilicon Technologies Co., Ltd.
+ * Author: Jie Wang <wangjie125@huawei.com>
+ * Author: Yicong Yang <yangyicong@hisilicon.com>
+ * Author: Yushan Wang <wangyushan12@huawei.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/cleanup.h>
+#include <linux/debugfs.h>
+#include <linux/fs.h>
+#include <linux/init.h>
+#include <linux/memory.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/pagewalk.h>
+#include <linux/spinlock.h>
+#include <linux/uaccess.h>
+
+#include <asm/page.h>
+
+#include "hisi_soc_cache_framework.h"
+
+struct hisi_soc_cache_lock_region {
+	/* physical memory region of the arena allocated for aligned address */
+	unsigned long arena_start;
+	unsigned long arena_end;
+	/* VMA region of locked memory for future release */
+	unsigned long vm_start;
+	unsigned long vm_end;
+	phys_addr_t addr;
+	size_t size;
+	u32 status;
+	int cpu;
+};
+
+struct hisi_soc_comp_inst {
+	struct list_head node;
+	struct hisi_soc_comp *comp;
+};
+
+struct hisi_soc_comp_list {
+	struct list_head node;
+	/* protects list of HiSilicon SoC cache components */
+	spinlock_t lock;
+	u32 inst_num;
+};
+
+static struct hisi_soc_comp_list soc_cache_devs[SOC_COMP_TYPE_MAX];
+
+static int hisi_soc_cache_lock(int cpu, phys_addr_t addr, size_t size)
+{
+	struct hisi_soc_comp_inst *inst;
+	struct list_head *head;
+	int ret = -ENOMEM;
+
+	/* Avoid null pointer when there is no instance onboard. */
+	if (soc_cache_devs[HISI_SOC_L3C].inst_num <= 0)
+		return ret;
+
+	guard(spinlock)(&soc_cache_devs[HISI_SOC_L3C].lock);
+
+	/* Iterate L3C instances to perform operation, break loop once found. */
+	head = &soc_cache_devs[HISI_SOC_L3C].node;
+	list_for_each_entry(inst, head, node) {
+		if (!cpumask_test_cpu(cpu, &inst->comp->affinity_mask))
+			continue;
+		ret = inst->comp->ops->do_lock(inst->comp, addr, size);
+		if (ret)
+			return ret;
+		break;
+	}
+
+	return inst->comp->ops->poll_lock_done(inst->comp, addr, size);
+}
+
+static int hisi_soc_cache_unlock(int cpu, phys_addr_t addr)
+{
+	struct hisi_soc_comp_inst *inst;
+	struct list_head *head;
+	int ret = 0;
+
+	/* Avoid null pointer when there is no instance onboard. */
+	if (soc_cache_devs[HISI_SOC_L3C].inst_num <= 0)
+		return ret;
+
+	guard(spinlock)(&soc_cache_devs[HISI_SOC_L3C].lock);
+
+	/* Iterate L3C instances to perform operation, break loop once found. */
+	head = &soc_cache_devs[HISI_SOC_L3C].node;
+	list_for_each_entry(inst, head, node) {
+		if (!cpumask_test_cpu(cpu, &inst->comp->affinity_mask))
+			continue;
+		ret = inst->comp->ops->do_unlock(inst->comp, addr);
+		if (ret)
+			return ret;
+		break;
+	}
+
+	ret = inst->comp->ops->poll_unlock_done(inst->comp, addr);
+
+	return ret;
+}
+
+static int hisi_soc_cache_inst_check(const struct hisi_soc_comp *comp,
+				     enum hisi_soc_comp_type comp_type)
+{
+	struct hisi_soc_comp_ops *ops = comp->ops;
+
+	/* Different types of component could have different ops. */
+	switch (comp_type) {
+	case HISI_SOC_L3C:
+		if (!ops->do_lock || !ops->poll_lock_done ||
+		    !ops->do_unlock || !ops->poll_unlock_done)
+			return -EINVAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int hisi_soc_cache_inst_add(struct hisi_soc_comp *comp,
+				   enum hisi_soc_comp_type comp_type)
+{
+	struct hisi_soc_comp_inst *comp_inst;
+	int ret;
+
+	ret = hisi_soc_cache_inst_check(comp, comp_type);
+	if (ret)
+		return ret;
+
+	comp_inst = kzalloc(sizeof(*comp_inst), GFP_KERNEL);
+	if (!comp_inst)
+		return -ENOMEM;
+
+	comp_inst->comp = comp;
+
+	scoped_guard(spinlock, &soc_cache_devs[comp_type].lock) {
+		list_add_tail(&comp_inst->node,
+			      &soc_cache_devs[comp_type].node);
+		soc_cache_devs[comp_type].inst_num++;
+	}
+
+	return 0;
+}
+
+/*
+ * When @comp is NULL, it means to delete all instances of @comp_type.
+ */
+static void hisi_soc_cache_inst_del(struct hisi_soc_comp *comp,
+				    enum hisi_soc_comp_type comp_type)
+{
+	struct hisi_soc_comp_inst *inst, *tmp;
+
+	guard(spinlock)(&soc_cache_devs[comp_type].lock);
+	list_for_each_entry_safe(inst, tmp, &soc_cache_devs[comp_type].node,
+				 node) {
+		if (comp && comp != inst->comp)
+			continue;
+
+		if (soc_cache_devs[comp_type].inst_num > 0)
+			soc_cache_devs[comp_type].inst_num--;
+
+		list_del(&inst->node);
+		kfree(inst);
+
+		/* Stop the loop if we have already deleted @comp. */
+		if (comp)
+			break;
+	}
+}
+
+int hisi_soc_comp_inst_add(struct hisi_soc_comp *comp)
+{
+	int ret, i = HISI_SOC_L3C;
+
+	if (!comp || !comp->ops || comp->comp_type == 0)
+		return -EINVAL;
+
+	for_each_set_bit_from(i, &comp->comp_type, SOC_COMP_TYPE_MAX) {
+		ret = hisi_soc_cache_inst_add(comp, i);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(hisi_soc_comp_inst_add);
+
+int hisi_soc_comp_inst_del(struct hisi_soc_comp *comp)
+{
+	int i;
+
+	if (!comp)
+		return -EINVAL;
+
+	for_each_set_bit(i, &comp->comp_type, SOC_COMP_TYPE_MAX)
+		hisi_soc_cache_inst_del(comp, i);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(hisi_soc_comp_inst_del);
+
+static void hisi_soc_cache_vm_open(struct vm_area_struct *vma)
+{
+	struct hisi_soc_cache_lock_region *clr = vma->vm_private_data;
+
+	/*
+	 * Only perform cache lock when the vma passed in is created
+	 * in hisi_soc_cache_mmap.
+	 */
+	if (clr->vm_start != vma->vm_start || clr->vm_end != vma->vm_end)
+		return;
+
+	clr->status = hisi_soc_cache_lock(clr->cpu, clr->addr, clr->size);
+}
+
+/**
+ * hisi_soc_cache_aligned_alloc - Allocate memory region to be locked and
+ *				  returns address that aligned to the requested
+ *				  size.
+ * @clr:	The locked memory region to be allocated for.
+ * @size:	Requested memory size.
+ * @addr:	Pointer of the start physical address of the requested
+ *		memory region.
+ *
+ * @return:
+ *    - -ENOMEM: If allocation fails.
+ *    - 0: If allocations succeeds.
+ *
+ * Physical address of allocated memory region is requested to be aligned to
+ * its size.  In order to achieve that, add the order of requested memory size
+ * by 1 to double the size of allocated memory to ensure the existence of size-
+ * aligned address.  After locating the aligned region, release the unused
+ * pages from both sides to avoid waste.
+ */
+static int hisi_soc_cache_aligned_alloc(struct hisi_soc_cache_lock_region *clr,
+					unsigned long size,
+					unsigned long *addr)
+{
+	unsigned long prefix_hole_size, suffix_hole_size;
+	unsigned long arena_start, arena_end;
+	int order = get_order(size) + 1;
+	unsigned long start, end;
+	unsigned long free_size;
+	struct page *pg;
+	int bit;
+
+	pg = alloc_pages(GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO, order);
+	if (!pg)
+		return -ENOMEM;
+
+	arena_start = page_to_phys(pg);
+	arena_end = arena_start + (PAGE_SIZE << order) - 1;
+
+	/*
+	 * Align up the address by the requested size if the address is not
+	 * naturally aligned to the size.
+	 */
+	start = arena_start % size == 0
+		? arena_start
+		: arena_start / size * size + size;
+	end = start + size - 1;
+	prefix_hole_size = start - arena_start;
+	suffix_hole_size = arena_end - end;
+
+	if (prefix_hole_size >= PAGE_SIZE) {
+		bit = PAGE_SHIFT;
+		for_each_set_bit_from(bit, &prefix_hole_size,
+				      MAX_PAGE_ORDER + PAGE_SHIFT) {
+			free_size = (PAGE_SIZE << (bit - PAGE_SHIFT)) - 1;
+			__free_pages(phys_to_page(arena_start),
+				     bit - PAGE_SHIFT);
+			arena_start += free_size + 1;
+		}
+	}
+
+	if (suffix_hole_size >= PAGE_SIZE) {
+		bit = PAGE_SHIFT;
+		for_each_set_bit_from(bit, &suffix_hole_size,
+				      MAX_PAGE_ORDER + PAGE_SHIFT) {
+			free_size = (PAGE_SIZE << (bit - PAGE_SHIFT)) - 1;
+			__free_pages(phys_to_page(arena_end - free_size),
+				     bit - PAGE_SHIFT);
+			arena_end -= free_size + 1;
+		}
+	}
+
+	*addr = start;
+	clr->arena_start = arena_start;
+	clr->arena_end = arena_end;
+
+	return 0;
+}
+
+/**
+ * hisi_soc_cache_aligned_free - Free the aligned memory region allcated by
+ *				 hisi_soc_cache_aligned_alloc().
+ * @clr:	The allocated locked memory region.
+ *
+ * Since unused memory pages are release in hisi_soc_cache_aligned_alloc(), the
+ * memory region to be freed here may not be power of 2 numbers of pages.
+ * Thus split the memory by page order and release them accordingly.
+ */
+static void hisi_soc_cache_aligned_free(struct hisi_soc_cache_lock_region *clr)
+{
+	unsigned long size = clr->arena_end - clr->arena_start;
+	int bit = PAGE_SHIFT;
+
+	for_each_set_bit_from(bit, &size, MAX_PAGE_ORDER)
+		__free_pages(phys_to_page(clr->arena_start), bit - PAGE_SHIFT);
+}
+
+static void hisi_soc_cache_vm_close(struct vm_area_struct *vma)
+{
+	struct hisi_soc_cache_lock_region *clr = vma->vm_private_data;
+
+	/*
+	 * Only perform cache unlock when the vma passed in is created
+	 * in hisi_soc_cache_mmap.
+	 */
+	if (clr->vm_start != vma->vm_start || clr->vm_end != vma->vm_end)
+		return;
+
+	hisi_soc_cache_unlock(clr->cpu, clr->addr);
+
+	hisi_soc_cache_aligned_free(clr);
+	kfree(clr);
+	vma->vm_private_data = NULL;
+}
+
+/*
+ * mremap operation is not supported for HiSilicon SoC cache.
+ */
+static int hisi_soc_cache_vm_mremap(struct vm_area_struct *vma)
+{
+	struct hisi_soc_cache_lock_region *clr = vma->vm_private_data;
+
+	/*
+	 * vma region size will be changed as requested by mremap despite the
+	 * callback failure in this function.  Thus, change the vma region
+	 * stored in clr according to the parameters to verify if the pages
+	 * should be freed when unmapping.
+	 */
+	clr->vm_end = clr->vm_start + (vma->vm_end - vma->vm_start);
+	pr_err("mremap for HiSilicon SoC locked cache is not supported\n");
+
+	return -EOPNOTSUPP;
+}
+
+static const struct vm_operations_struct hisi_soc_cache_vm_ops = {
+	.open = hisi_soc_cache_vm_open,
+	.close = hisi_soc_cache_vm_close,
+	.mremap = hisi_soc_cache_vm_mremap,
+};
+
+static int hisi_soc_cache_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	unsigned long size = vma->vm_end - vma->vm_start;
+	struct hisi_soc_cache_lock_region *clr;
+	unsigned long addr;
+	int ret;
+
+	clr = kzalloc(sizeof(*clr), GFP_KERNEL);
+	if (!clr)
+		return -ENOMEM;
+
+	ret = hisi_soc_cache_aligned_alloc(clr, size, &addr);
+	if (ret)
+		goto out_clr;
+
+	ret = remap_pfn_range(vma, vma->vm_start,
+			      (addr >> PAGE_SHIFT) + vma->vm_pgoff,
+			      size, vma->vm_page_prot);
+	if (ret)
+		goto out_page;
+
+	clr->addr = addr;
+	clr->size = size;
+	clr->cpu = smp_processor_id();
+	vm_flags_set(vma, VM_DONTCOPY | VM_DONTEXPAND);
+
+	/*
+	 * The vma should not be moved throughout its lifetime, store the
+	 * region for verification.
+	 */
+	clr->vm_start = vma->vm_start;
+	clr->vm_end = vma->vm_end;
+
+	vma->vm_private_data = clr;
+	vma->vm_ops = &hisi_soc_cache_vm_ops;
+	hisi_soc_cache_vm_ops.open(vma);
+
+	if (clr->status) {
+		ret = -ENOMEM;
+		goto out_page;
+	}
+
+	return 0;
+
+out_page:
+	hisi_soc_cache_aligned_free(clr);
+out_clr:
+	kfree(clr);
+	return ret;
+}
+
+static const struct file_operations soc_cache_dev_fops = {
+	.owner = THIS_MODULE,
+	.mmap = hisi_soc_cache_mmap,
+};
+
+static struct miscdevice soc_cache_miscdev = {
+	.minor = MISC_DYNAMIC_MINOR,
+	.name = "hisi_soc_cache_mgmt",
+	.fops = &soc_cache_dev_fops,
+	.mode = 0600,
+};
+
+static void hisi_soc_cache_inst_uninit(void)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(soc_cache_devs); ++i)
+		hisi_soc_cache_inst_del(NULL, i);
+}
+
+static void hisi_soc_cache_framework_data_init(void)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(soc_cache_devs); ++i) {
+		spin_lock_init(&soc_cache_devs[i].lock);
+		INIT_LIST_HEAD(&soc_cache_devs[i].node);
+	}
+}
+
+static const char *const hisi_soc_cache_item_str[SOC_COMP_TYPE_MAX] = {
+	"cache"
+};
+
+/*
+ * Print cache instance number debug information for debug FS.
+ */
+static ssize_t hisi_soc_cache_dbg_get_inst_num(struct file *file,
+					       char __user *buff,
+					       size_t cnt,
+					       loff_t *ppos)
+{
+#define HISI_SOC_CACHE_DBGFS_REG_LEN 100
+	char *read_buff __free(kfree) = NULL;
+	int len, i, pos = 0;
+
+	if (!access_ok(buff, cnt))
+		return -EFAULT;
+	if (*ppos < 0)
+		return -EINVAL;
+	if (cnt == 0)
+		return 0;
+
+	read_buff = kzalloc(HISI_SOC_CACHE_DBGFS_REG_LEN, GFP_KERNEL);
+	if (!read_buff)
+		return -ENOMEM;
+
+	len = HISI_SOC_CACHE_DBGFS_REG_LEN;
+
+	for (i = 0; i < ARRAY_SIZE(soc_cache_devs); i++) {
+		guard(spinlock)(&soc_cache_devs[i].lock);
+		pos += scnprintf(read_buff + pos, len - pos,
+				 "%s inst num: %u\n",
+				 hisi_soc_cache_item_str[i],
+				 soc_cache_devs[i].inst_num);
+	}
+
+	return simple_read_from_buffer(buff, cnt, ppos, read_buff,
+				       strlen(read_buff));
+}
+
+static struct dentry *hisi_cache_dbgfs_root;
+static const struct file_operations hisi_cache_dbgfs_ops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.read = hisi_soc_cache_dbg_get_inst_num,
+};
+
+static void hisi_soc_cache_dbgfs_init(void)
+{
+	hisi_cache_dbgfs_root = debugfs_create_dir("hisi_soc_cache_frm", NULL);
+	debugfs_create_file("instance", 0400, hisi_cache_dbgfs_root, NULL,
+			    &hisi_cache_dbgfs_ops);
+}
+
+static void hisi_soc_cache_dbgfs_uninit(void)
+{
+	debugfs_remove_recursive(hisi_cache_dbgfs_root);
+	hisi_cache_dbgfs_root = NULL;
+}
+
+static int __init hisi_soc_cache_framework_init(void)
+{
+	int ret;
+
+	hisi_soc_cache_framework_data_init();
+
+	ret = misc_register(&soc_cache_miscdev);
+	if (ret) {
+		hisi_soc_cache_inst_uninit();
+		return ret;
+	}
+
+	hisi_soc_cache_dbgfs_init();
+
+	return 0;
+}
+module_init(hisi_soc_cache_framework_init);
+
+static void __exit hisi_soc_cache_framework_exit(void)
+{
+	hisi_soc_cache_dbgfs_uninit();
+	misc_deregister(&soc_cache_miscdev);
+	hisi_soc_cache_inst_uninit();
+}
+module_exit(hisi_soc_cache_framework_exit);
+
+MODULE_DESCRIPTION("HiSilicon SoC Cache Framework Driver");
+MODULE_AUTHOR("Jie Wang <wangjie125@huawei.com>");
+MODULE_AUTHOR("Yushan Wang <wangyushan12@huawei.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/hisilicon/hisi_soc_cache_framework.h b/drivers/soc/hisilicon/hisi_soc_cache_framework.h
new file mode 100644
index 000000000000..4f16eed5dfa2
--- /dev/null
+++ b/drivers/soc/hisilicon/hisi_soc_cache_framework.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Header file of framework for HiSilicon SoC cache.
+ *
+ * Copyright (c) 2024 HiSilicon Technologies Co., Ltd.
+ * Author: Jie Wang <wangjie125@huawei.com>
+ * Author: Yicong Yang <yangyicong@hisilicon.com>
+ * Author: Yushan Wang <wangyushan12@huawei.com>
+ */
+
+#ifndef HISI_CACHE_FRAMEWORK_H
+#define HISI_CACHE_FRAMEWORK_H
+
+#include <linux/bits.h>
+#include <linux/types.h>
+
+enum hisi_soc_comp_type {
+	HISI_SOC_L3C,
+	SOC_COMP_TYPE_MAX
+};
+
+struct hisi_soc_comp;
+
+/**
+ * struct hisi_soc_comp_ops - Callbacks for SoC cache drivers to handle
+ *			      operation requests.
+ * @lock_enable: lock certain region of L3 cache from being evicted.
+ * @poll_lock_done: check if the lock operation has succeeded.
+ * @unlock_enable: unlock the locked region of L3 cache back to normal.
+ * @poll_unlock_done: check if the unlock operation has succeeded.
+ *
+ * Operations are decoupled into two phases so that framework does not have
+ * to wait for one operation to finish before calling the next when multiple
+ * hardwares onboard.
+ *
+ * Implementers must implement the functions in pairs.  Implementation should
+ * return -EBUSY when:
+ * - insufficient resources are available to perform the operation.
+ * - previously raised operation is not finished.
+ * - new operations (do_lock(), do_unlock() etc.) to the same address
+ *   before corresponding done functions being called.
+ */
+struct hisi_soc_comp_ops {
+	int (*do_lock)(struct hisi_soc_comp *comp,
+		       phys_addr_t addr, size_t size);
+	int (*poll_lock_done)(struct hisi_soc_comp *comp,
+			      phys_addr_t addr, size_t size);
+	int (*do_unlock)(struct hisi_soc_comp *comp,
+			 phys_addr_t addr);
+	int (*poll_unlock_done)(struct hisi_soc_comp *comp,
+				phys_addr_t addr);
+};
+
+/**
+ * struct hisi_soc_comp - Struct of HiSilicon SoC cache components.
+ * @ops: possible operations a component may perform.
+ * @affinity_mask: cpus that associate with this component.
+ * @comp_type: bitmap declaring the type of the component.
+ *
+ * A component may have multiple types (e.g. a piece of multi-function device).
+ * If so, set the bit of @comp_type according to its supporting type in struct
+ * hisi_soc_comp_type.
+ */
+struct hisi_soc_comp {
+	struct hisi_soc_comp_ops *ops;
+	cpumask_t affinity_mask;
+	/*
+	 * Setting bit x to 1 means this instance supports feature of x-th
+	 * entry in enum hisi_soc_comp_type.
+	 */
+	unsigned long comp_type;
+};
+
+int hisi_soc_comp_inst_add(struct hisi_soc_comp *comp);
+int hisi_soc_comp_inst_del(struct hisi_soc_comp *comp);
+
+#endif
-- 
2.33.0


