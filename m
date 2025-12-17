Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079FCD65530
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Io7uktFZsEIWw6iajXo5tQpiFORUrEErO74eGmWgHNs=; b=vcMrPQvnT7I56BH8i+p4KdJvrl
	ej4AKeN/lyLStM2b0vHuhZ/1q6Xp0VY0dFCpihYdum8fP6YmBJVPFM6Wfw43Q/Se4vGCbqfXWbEns
	nx4Q9Ym4sfIlfcaq6wLftvxxdDS/S35lKEd0Ky+gcfrFenqtE0h4De2OkDOSIyhmgExXfYHxcAL8g
	7eVrDD/txydjf+hw+bxOPUy6SbMvdlvtNbt68N+GCObj47ZhwRuJ+xCU8/+fZS/d6ekpMjLg5Z0zv
	h0SM19oNoZvbQbkWrA/ExmPGX7NK7sQkIWxf2M8/ZkNj5svuBlMlifuOHGl2bgMFlf2NrTdtpzuOD
	QAT/dlQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVohd-00000006dSr-42wk;
	Wed, 17 Dec 2025 10:24:17 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVohW-00000006dQA-3kzb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 10:24:13 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Io7uktFZsEIWw6iajXo5tQpiFORUrEErO74eGmWgHNs=;
	b=yvL10XeWjs2o2T0BU0mfmCkNXdmQxqDTPbW8yN7AB0tK0GcUuMlRUxbQxT4f+l+Lfu8G22Y8M
	I6C4jxA9iwXRBkQR6pchMuosnRW1SjvRLuyTkXxRC11VW+LSl/OL5Dge8gwWMyvMSplKJSZUp6F
	Epj/IJJGvz5dTHKFrDv7DBI=
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4dWVF50NYhz1cySS;
	Wed, 17 Dec 2025 18:20:57 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 3FD6E140109;
	Wed, 17 Dec 2025 18:23:59 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
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
Subject: [PATCH RFC v2 1/3] soc cache: L3 cache driver for HiSilicon SoC
Date: Wed, 17 Dec 2025 18:23:55 +0800
Message-ID: <20251217102357.1730573-2-wangyushan12@huawei.com>
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
X-CRM114-CacheID: sfid-20251217_022411_256606_4DE6C15E 
X-CRM114-Status: GOOD (  29.92  )
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

The driver will create a file of `/dev/hisi_l3c` on init, mmap
operations to it will allocate a memory region that is guaranteed to be
placed in L3 cache.

The driver also provides unmap() to deallocated the locked memory.

The driver also provides an ioctl interface for user to get cache lock
information, such as lock restrictions and locked sizes.

Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 MAINTAINERS                                   |   6 +
 drivers/soc/hisilicon/Kconfig                 |  10 +
 drivers/soc/hisilicon/Makefile                |   2 +
 drivers/soc/hisilicon/hisi_soc_l3c.c          | 359 ++++++++++++++++++
 include/uapi/misc/hisi_l3c.h                  |  28 ++
 6 files changed, 406 insertions(+)
 create mode 100644 drivers/soc/hisilicon/hisi_soc_l3c.c
 create mode 100644 include/uapi/misc/hisi_l3c.h

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 7232b3544cec..439c5bcbfa94 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -387,6 +387,7 @@ Code  Seq#    Include File                                             Comments
                                                                        <mailto:linux-hyperv@vger.kernel.org>
 0xBA  00-0F  uapi/linux/liveupdate.h                                   Pasha Tatashin
                                                                        <mailto:pasha.tatashin@soleen.com>
+0xBB  all    uapi/misc/hisi_soc_cache.h                                HiSilicon SoC cache driver
 0xC0  00-0F  linux/usb/iowarrior.h
 0xCA  00-0F  uapi/misc/cxl.h                                           Dead since 6.15
 0xCA  10-2F  uapi/misc/ocxl.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..f09b718f59fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11366,6 +11366,12 @@ F:	Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
 F:	drivers/soc/hisilicon/kunpeng_hccs.c
 F:	drivers/soc/hisilicon/kunpeng_hccs.h
 
+HISILICON SOC L3C DRIVER
+M:	Yushan Wang <wangyushan12@huawei.com>
+S:	Maintained
+F:	drivers/soc/hisilicon/hisi_soc_l3c.c
+F:	include/uapi/misc/hisi_l3c.h
+
 HISILICON LPC BUS DRIVER
 M:	Jay Fang <f.fangjian@huawei.com>
 S:	Maintained
diff --git a/drivers/soc/hisilicon/Kconfig b/drivers/soc/hisilicon/Kconfig
index 6d7c244d2e78..ea16dffccd5e 100644
--- a/drivers/soc/hisilicon/Kconfig
+++ b/drivers/soc/hisilicon/Kconfig
@@ -21,4 +21,14 @@ config KUNPENG_HCCS
 	  health status and port information of HCCS, or reducing system
 	  power consumption on Kunpeng SoC.
 
+config HISI_SOC_L3C
+	bool "HiSilicon L3 Cache device driver"
+	depends on ARM64 && ACPI || COMPILE_TEST
+	help
+	  This driver provides the functions to lock L3 cache entries from
+	  being evicted for better performance.
+
+	  This driver can be built as a module. If so, the module will be
+	  called hisi_soc_l3c.
+
 endmenu
diff --git a/drivers/soc/hisilicon/Makefile b/drivers/soc/hisilicon/Makefile
index 226e747e70d6..16ff2c73c4a5 100644
--- a/drivers/soc/hisilicon/Makefile
+++ b/drivers/soc/hisilicon/Makefile
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_KUNPENG_HCCS)	+= kunpeng_hccs.o
+
+obj-$(CONFIG_HISI_SOC_L3C)	+= hisi_soc_l3c.o
diff --git a/drivers/soc/hisilicon/hisi_soc_l3c.c b/drivers/soc/hisilicon/hisi_soc_l3c.c
new file mode 100644
index 000000000000..2c196c4dfff1
--- /dev/null
+++ b/drivers/soc/hisilicon/hisi_soc_l3c.c
@@ -0,0 +1,359 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for HiSilicon L3 cache.
+ *
+ * Copyright (c) 2025 HiSilicon Technologies Co., Ltd.
+ * Author: Yushan Wang <wangyushan12@huawei.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/cleanup.h>
+#include <linux/init.h>
+#include <linux/mm.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/spinlock.h>
+#include <linux/spinlock_types.h>
+#include <linux/types.h>
+
+#include <asm/cputype.h>
+
+#include <uapi/misc/hisi_l3c.h>
+
+#define to_hisi_l3c(p) container_of((p), struct hisi_l3c, comp)
+
+/**
+ * struct hisi_soc_comp - Struct of HiSilicon SoC cache components.
+ *
+ * @node: list node of hisi_soc_comp_list.
+ * @ops: possible operations a component may perform.
+ * @affinity_mask: cpus that associate with this component.
+ * @private: component specific data.
+ */
+struct hisi_soc_comp {
+	struct list_head node;
+	struct hisi_soc_comp_ops *ops;
+	cpumask_t affinity_mask;
+	void *private;
+};
+
+/**
+ * struct hisi_soc_comp_ops - Callbacks for SoC cache drivers to handle
+ *			      operation requests.
+ *
+ * @do_lock: lock certain region of L3 cache from being evicted.
+ * @poll_lock_done: check if the lock operation has succeeded.
+ * @do_unlock: unlock the locked region of L3 cache back to normal.
+ * @poll_unlock_done: check if the unlock operation has succeeded.
+	      operation requests.
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
+	int (*do_lock)(struct hisi_soc_comp *comp, phys_addr_t addr, size_t size);
+	int (*poll_lock_done)(struct hisi_soc_comp *comp, phys_addr_t addr, size_t size);
+	int (*do_unlock)(struct hisi_soc_comp *comp, phys_addr_t addr);
+	int (*poll_unlock_done)(struct hisi_soc_comp *comp, phys_addr_t addr);
+};
+
+struct hisi_l3c_lock_region {
+	/* physical address of the arena allocated for aligned address */
+	unsigned long arena_start;
+	/* VMA region of locked memory for future release */
+	unsigned long vm_start;
+	unsigned long vm_end;
+	phys_addr_t addr;
+	size_t size;
+	/* Return value of cache lock call */
+	int status;
+	int cpu;
+};
+
+struct hisi_soc_comp_list {
+	struct list_head node;
+	/* protects list of HiSilicon SoC cache components */
+	spinlock_t lock;
+};
+
+static struct hisi_soc_comp_list l3c_devs;
+
+static int hisi_l3c_lock(int cpu, phys_addr_t addr, size_t size)
+{
+	struct hisi_soc_comp *comp;
+	int ret;
+
+	guard(spinlock)(&l3c_devs.lock);
+
+	/* When there is no instance onboard, no locked memory is available. */
+	if (list_empty(&l3c_devs.node))
+		return -ENOMEM;
+
+	/* Lock need to be performed on each channel of associated L3 cache. */
+	list_for_each_entry(comp, &l3c_devs.node, node) {
+		if (!cpumask_test_cpu(cpu, &comp->affinity_mask))
+			continue;
+		ret = comp->ops->do_lock(comp, addr, size);
+		if (ret)
+			return ret;
+	}
+
+	list_for_each_entry(comp, &l3c_devs.node, node) {
+		if (!cpumask_test_cpu(cpu, &comp->affinity_mask))
+			continue;
+		ret = comp->ops->poll_lock_done(comp, addr, size);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int hisi_l3c_unlock(int cpu, phys_addr_t addr)
+{
+	struct hisi_soc_comp *comp;
+	int ret;
+
+	guard(spinlock)(&l3c_devs.lock);
+
+	if (list_empty(&l3c_devs.node))
+		return -EINVAL;
+
+	/* Perform unlock on each channel of associated L3 cache. */
+	list_for_each_entry(comp, &l3c_devs.node, node) {
+		if (!cpumask_test_cpu(cpu, &comp->affinity_mask))
+			continue;
+		ret = comp->ops->do_unlock(comp, addr);
+		if (ret)
+			return ret;
+	}
+
+	list_for_each_entry(comp, &l3c_devs.node, node) {
+		if (!cpumask_test_cpu(cpu, &comp->affinity_mask))
+			continue;
+		ret = comp->ops->poll_unlock_done(comp, addr);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void hisi_soc_comp_add(struct hisi_soc_comp *comp)
+{
+	guard(spinlock)(&l3c_devs.lock);
+	list_add_tail(&comp->node, &l3c_devs.node);
+}
+
+/* Null @comp means to delete all instances. */
+static int hisi_soc_comp_del(struct hisi_soc_comp *comp)
+{
+	struct hisi_soc_comp *entry, *tmp;
+
+	guard(spinlock)(&l3c_devs.lock);
+	list_for_each_entry_safe(entry, tmp, &l3c_devs.node, node) {
+		if (comp && comp != entry)
+			continue;
+
+		list_del(&entry->node);
+
+		/* Only continue to delete nodes when @comp is NULL */
+		if (comp)
+			break;
+	}
+
+	return 0;
+}
+
+static void hisi_l3c_vm_open(struct vm_area_struct *vma)
+{
+	struct hisi_l3c_lock_region *clr = vma->vm_private_data;
+
+	/*
+	 * Only perform cache lock when the vma passed in is created in
+	 * hisi_l3c_mmap.
+	 */
+	if (clr->vm_start != vma->vm_start || clr->vm_end != vma->vm_end)
+		return;
+
+	clr->status = hisi_l3c_lock(clr->cpu, clr->addr, clr->size);
+}
+
+static void hisi_l3c_vm_close(struct vm_area_struct *vma)
+{
+	struct hisi_l3c_lock_region *clr = vma->vm_private_data;
+	int order = get_order(clr->size);
+
+	/*
+	 * Only perform cache unlock when the vma passed in is created
+	 * in hisi_l3c_mmap.
+	 */
+	if (clr->vm_start != vma->vm_start || clr->vm_end != vma->vm_end)
+		return;
+
+	hisi_l3c_unlock(clr->cpu, clr->addr);
+
+	free_contig_range(PHYS_PFN(clr->addr), 1 << order);
+	kfree(clr);
+	vma->vm_private_data = NULL;
+}
+
+/* mremap operation is not supported for HiSilicon SoC cache. */
+static int hisi_l3c_vm_mremap(struct vm_area_struct *vma)
+{
+	struct hisi_l3c_lock_region *clr = vma->vm_private_data;
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
+static int hisi_l3c_may_split(struct vm_area_struct *area, unsigned long addr)
+{
+	pr_err("HiSilicon SoC locked cache may not be split.\n");
+	return -EINVAL;
+}
+
+static const struct vm_operations_struct hisi_l3c_vm_ops = {
+	.open = hisi_l3c_vm_open,
+	.close = hisi_l3c_vm_close,
+	.may_split = hisi_l3c_may_split,
+	.mremap = hisi_l3c_vm_mremap,
+};
+
+static int hisi_l3c_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	unsigned long size = vma->vm_end - vma->vm_start;
+	int order = get_order(size);
+	unsigned long addr;
+	struct page *pg;
+	int ret;
+
+	struct hisi_l3c_lock_region *clr __free(kfree) = kzalloc(sizeof(*clr), GFP_KERNEL);
+	if (!clr)
+		return -ENOMEM;
+
+	/* Continuous physical memory is required for L3 cache lock. */
+	pg = alloc_contig_pages(1 << order, GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO,
+				cpu_to_node(smp_processor_id()), NULL);
+	if (!pg)
+		return -ENOMEM;
+
+	addr = page_to_phys(pg);
+	*clr = (struct hisi_l3c_lock_region) {
+		.addr = addr,
+		.size = size,
+		.cpu = smp_processor_id(),
+		/* vma should not be moved, store here for validation */
+		.vm_start = vma->vm_start,
+		.vm_end = vma->vm_end,
+	};
+
+	vm_flags_set(vma, VM_DONTCOPY | VM_DONTEXPAND);
+	vma->vm_ops = &hisi_l3c_vm_ops;
+	vma->vm_private_data = clr;
+
+	hisi_l3c_vm_ops.open(vma);
+	if (clr->status) {
+		ret = clr->status;
+		goto out_page;
+	}
+
+	ret = remap_pfn_range(vma, vma->vm_start, PFN_DOWN(addr), size,
+			      vma->vm_page_prot);
+	if (ret)
+		goto out_page;
+
+	/* Save clr from being freed when lock succeeds. */
+	vma->vm_private_data = no_free_ptr(clr);
+
+	return 0;
+
+out_page:
+	free_contig_range(PHYS_PFN(clr->addr), 1 << order);
+	return ret;
+}
+
+static int hisi_l3c_lock_restriction(unsigned long arg)
+{
+	void __user *uarg = (void __user *)arg;
+	int cpu = smp_processor_id();
+	struct hisi_soc_comp *comp;
+
+	if (list_empty(&l3c_devs.node))
+		return -ENODEV;
+
+	list_for_each_entry(comp, &l3c_devs.node, node) {
+		if (!cpumask_test_cpu(cpu, &comp->affinity_mask))
+			continue;
+
+		if (!comp->private)
+			return -ENOENT;
+
+		if (copy_to_user(uarg, comp->private, sizeof(struct hisi_l3c_lock_info)))
+			return -EFAULT;
+
+		return 0;
+	}
+
+	return -ENODEV;
+}
+
+static long hisi_l3c_ioctl(struct file *file, u32 cmd, unsigned long arg)
+{
+	switch (cmd) {
+	case HISI_L3C_LOCK_INFO:
+		return hisi_l3c_lock_restriction(arg);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct file_operations l3c_dev_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = hisi_l3c_ioctl,
+	.mmap = hisi_l3c_mmap,
+};
+
+static struct miscdevice l3c_miscdev = {
+	.minor = MISC_DYNAMIC_MINOR,
+	.name = "hisi_l3c",
+	.fops = &l3c_dev_fops,
+	.mode = 0600,
+};
+
+static int __init hisi_l3c_init(void)
+{
+	spin_lock_init(&l3c_devs.lock);
+	INIT_LIST_HEAD(&l3c_devs.node);
+
+	return misc_register(&l3c_miscdev);
+}
+module_init(hisi_l3c_init);
+
+static void __exit hisi_l3c_exit(void)
+{
+	misc_deregister(&l3c_miscdev);
+	hisi_soc_comp_del(NULL);
+}
+module_exit(hisi_l3c_exit);
+
+MODULE_DESCRIPTION("Hisilicon L3 Cache Driver");
+MODULE_AUTHOR("Yushan Wang <wangyushan12@huawei.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/uapi/misc/hisi_l3c.h b/include/uapi/misc/hisi_l3c.h
new file mode 100644
index 000000000000..6555be18aa1c
--- /dev/null
+++ b/include/uapi/misc/hisi_l3c.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later WITH Linux-syscall-note */
+/* Copyright (c) 2024 HiSilicon Technologies Co., Ltd. */
+#ifndef _UAPI_HISI_SOC_L3C_H
+#define _UAPI_HISI_SOC_L3C_H
+
+#include <linux/types.h>
+
+/* HISI_L3C_INFO: cache lock info for HiSilicon SoC */
+#define HISI_L3C_LOCK_INFO	_IOW(0xBB, 1, unsigned long)
+
+/**
+ * struct hisi_l3c_info - User data for hisi cache operates.
+ * @lock_region_num: available locked memory region on a L3C instance
+ * @lock_size: available size to be locked of the L3C instance.
+ * @address_alignment: if the L3C lock requires locked region physical start
+ *		       address to be aligned with the memory region size.
+ * @max_lock_size: maximum locked memory size on a L3C instance.
+ * @min_lock_size: minimum locked memory size on a L3C instance.
+ */
+struct hisi_l3c_lock_info {
+	__u32 lock_region_num;
+	__u64 lock_size;
+	__u8 address_alignment;
+	__u64 max_lock_size;
+	__u64 min_lock_size;
+};
+
+#endif
-- 
2.33.0


