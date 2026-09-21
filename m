Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6724C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mS8QTe3O0YSNViqoUNLsYRtEn1B1+bnqRzNqyeLclGU=; b=wpiQgDWjpq3xlbbOO4UNpryHJW
	uksLqSMYxoJNj6C8F2biNPQvqgWaeZkhMJqqwrUZY41VUA3dFXH+WzCivu9vgcFN4UW7T3Ww0D/zq
	0w8QIcxX7VG3Clb9bPlqEcaSUG3t5iAGdrJ9Elzxgd1O3fejFyqpu77Utu4u4St7h85S/n5zoow3Z
	IG4Y0lJ1yKsx/oLnxzzuXgsvzrB8kOng2VmgGDGnY/kXpppYcO2/xT2kSO3umkRSzFO++utQQmWeg
	cNmygoWEvzdi70Zs9IAYQCNceSrOiJPvHAHlt5wMkLqMUAkQgX31ZGGq8w/0kYdTrgUixovfjzqub
	Btu1+91A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8blp-00000001oKA-3J3P;
	Mon, 21 Sep 2026 11:01:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8blj-00000001oHe-3Oah
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mS8QTe3O0YSNViqoUNLsYRtEn1B1+bnqRzNqyeLclGU=; b=AqqJXJrDlqIEbS5fRC6GGaKxl3
	df/MzB8UGQBIpZsp2aFkgLd6fm1+QZETxxkTinAoaWqbEvx0+YRB2RQyLOaGpOdrHq3SYpsPnFLkk
	JAbr3dJC9vTuR1SI6KH+lj01NalNAXC0DfYVD47vuOxshycvamzeDNqxKVWWqfcKt6zaYYzCff4M9
	lCjJp4hKFTzQ/18RcHCPlwEWVYWylv6Bni/zrwf17mmQ+BlYwA+Wl1iveQIb9shKmjga0b3kONST8
	iLLgwRfKqMKOqQLh5jNW2j2GbQ+ia+UAua/T0kjT8O3oypZzLJ3urFZoosv2nY0q1duuDECtbDVZj
	gKOao81A==;
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8blg-0000000CA2H-0ybf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:01:06 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c2939083cefso323300866b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 04:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789988463; x=1790593263; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mS8QTe3O0YSNViqoUNLsYRtEn1B1+bnqRzNqyeLclGU=;
        b=cIKbKuJ9VwctBG7Z1e4yj+PeUiIKARYwWaxDhDrDkxdSJTRUa5ioajY/CwuoR6SuvJ
         H3ig7QL2jZU6/nG93VLxVyDIDHh4XJVpuJh02KrF+jRjGYDiCSNniAY13Ib4E09JUCn8
         06BmATBrAW9sFA8qGFSBbikV5Gf5Y25uLkftEMlvxVuczw58yGfuKuWLjTkBcS+7aJqT
         tvVQNhvT8jZUOjDqR/HpFjtRqq3Y6j2E8q1AYohOAPs/c8sXUq6NwfO2OR1FT//vhROy
         YzZ2AQX6cpK8eVZPvOysRkz9NlqwH9FUlXhdUYQJu+uwYD/Vdyggm8YPMuwnjzs1XNbG
         R7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988463; x=1790593263;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mS8QTe3O0YSNViqoUNLsYRtEn1B1+bnqRzNqyeLclGU=;
        b=BfaH+uZRSuWylpGV0Y2+91+vN5wNFDwsvZRmv2aO6clTkQNnEmd1atruBeqMbO3BoR
         bbgcg0XED4ku1E+H4dKi1rR71zNxnIMYBpzZIcc0vEHgDzOPTkBb+HdjNkXgi/+OZ2zC
         rUZJJ0L4VMyOHssBbKp0p+2LQWuM4KkY9TQNy9dt0GCprBzhKiB8aSgvweBtfsjnqQUt
         Y+AKUJZbpmxfvzob4veSEF7jzOlvR8TLE+woA9XuAQZTQ6bHC23JIp5cN5x/k/DpoO7D
         6oIhypuZRA7S+eUwPDT0T4rMyXyDMjkdISlb96HJL2anZ+3KxV2ki/Z+cE+1zNpWzYtv
         CLnA==
X-Forwarded-Encrypted: i=1; AKwUvBxKyOUGBYkCBj7SxC7v05KWCt3xx+fYPgEOKP+o52U+I8NWGdX6M6bdbinxDhMzwo/jA2w5KT+cVz1g4RpX5w1V@lists.infradead.org
X-Gm-Message-State: AFuF++k+xusjlZ1sZ0grU7sMexgaDu7tDj4BtuTJ2bl+1NF55KcjEIjq
	GxTZFhT1Vvr3ZtRemT3uP2EyLZBJsaIcjHAvl0dTHLTABDN9A6Vvf7AHeuw1jEwWVPnEEZbi51i
	H6DjrN7ZtQWagV9JUdZ6QNw==
X-Received: from ejbmb16.prod.google.com ([2002:a17:906:eb10:b0:c25:46b8:4594])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:94cd:b0:c29:3ea4:a219 with SMTP id a640c23a62f3a-c2a15eb3513mr916572766b.44.1789988462315;
 Mon, 21 Sep 2026 04:01:02 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:00:47 +0100
In-Reply-To: <20260921110050.3977591-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260921110050.3977591-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921110050.3977591-6-vdonnefort@google.com>
Subject: [PATCH v2 5/8] firmware: arm_ffa: Introduce ffa-lend-pool
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_120104_784804_1D8C60E5 
X-CRM114-Status: GOOD (  27.27  )
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

When memory is lent to the Secure world via FF-A, fatal CPU speculative
reads from Non-Secure can still occur as long as it retains a cacheable
mapping to that memory. Introduce the "arm,ffa-lend-pool"
reserved-memory CMA driver to unmap pages before lending
(ffa_prepare_lend()) and restore them upon reclaim
(ffa_lend_reclaimed()). Devices bind to the pool via the "memory-region"
DT property or via ffa_lend_pool_attach().

  reserved-memory {
      #address-cells = <0x2>;
      #size-cells = <0x2>;
      ranges;

      ffa_lend: ffa-lend-pool {
          compatible = "arm,ffa-lend-pool";
          reusable;
          size = <0x0 0x4000000>;
      };
  };

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/firmware/arm_ffa/Kconfig     |   5 +
 drivers/firmware/arm_ffa/Makefile    |   1 +
 drivers/firmware/arm_ffa/lend_pool.c | 261 +++++++++++++++++++++++++++
 include/linux/arm_ffa.h              |  23 +++
 4 files changed, 290 insertions(+)
 create mode 100644 drivers/firmware/arm_ffa/lend_pool.c

diff --git a/drivers/firmware/arm_ffa/Kconfig b/drivers/firmware/arm_ffa/Kconfig
index 5e3ae5cf82e8..66dbf74c37c3 100644
--- a/drivers/firmware/arm_ffa/Kconfig
+++ b/drivers/firmware/arm_ffa/Kconfig
@@ -19,3 +19,8 @@ config ARM_FFA_SMCCC
 	bool
 	default ARM_FFA_TRANSPORT
 	depends on ARM64 && HAVE_ARM_SMCCC_DISCOVERY
+
+config ARM_FFA_LEND_POOL
+	bool
+	default y
+	depends on ARM_FFA_TRANSPORT && CMA && OF_RESERVED_MEM
diff --git a/drivers/firmware/arm_ffa/Makefile b/drivers/firmware/arm_ffa/Makefile
index 168990a7e792..5ea3019c407b 100644
--- a/drivers/firmware/arm_ffa/Makefile
+++ b/drivers/firmware/arm_ffa/Makefile
@@ -6,3 +6,4 @@ ffa-core-objs := $(ffa-bus-y)
 ffa-module-objs := $(ffa-driver-y) $(ffa-transport-y)
 obj-$(CONFIG_ARM_FFA_TRANSPORT)  = ffa-core.o
 obj-$(CONFIG_ARM_FFA_TRANSPORT) += ffa-module.o
+obj-$(CONFIG_ARM_FFA_LEND_POOL) += lend_pool.o
diff --git a/drivers/firmware/arm_ffa/lend_pool.c b/drivers/firmware/arm_ffa/lend_pool.c
new file mode 100644
index 000000000000..e4348f5c618b
--- /dev/null
+++ b/drivers/firmware/arm_ffa/lend_pool.c
@@ -0,0 +1,261 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Arm FF-A Reserved Memory CMA driver for Memory Lending
+ *
+ * Prevents CPU speculative reads to secure memory by unmapping it from the
+ * kernel direct map. This works if rodata=full or if all CPUs in the system
+ * support BBML3 or if a reserved-memory is declared for this driver
+ * "arm,ffa_lend_pool".
+ *
+ * Copyright (C) 2026 Google LLC
+ * Author: Vincent Donnefort <vdonnefort@google.com>
+ */
+
+#include <linux/arm_ffa.h>
+#include <linux/cleanup.h>
+#include <linux/cma.h>
+#include <linux/dma-map-ops.h>
+#include <linux/init.h>
+#include <linux/memblock.h>
+#include <linux/mm.h>
+#include <linux/of.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/rcupdate.h>
+#include <linux/suspend.h>
+#include <linux/set_memory.h>
+#include <linux/xarray.h>
+
+#include <linux/cacheflush.h>
+#include <asm/tlbflush.h>
+
+static DEFINE_XARRAY(ffa_lend_pool_devices);
+static atomic_t ffa_lend_pool_active;
+
+#define FFA_LEND_POOL_DISABLED	-1
+
+static bool ffa_lend_pool_can_set_direct_map(struct device *dev, struct page *page, u64 nr_pages)
+{
+	phys_addr_t addr, base, end;
+	size_t size;
+
+	if (can_set_direct_map())
+		return true;
+
+	if (!dev)
+		return false;
+
+	guard(rcu)();
+
+	if (xa_load(&ffa_lend_pool_devices, (unsigned long)dev) != dev)
+		return false;
+
+	if (WARN_ON_ONCE(!dev->cma_area))
+		return false;
+
+	addr = page_to_phys(page);
+	size = nr_pages << PAGE_SHIFT;
+	base = cma_get_base(dev->cma_area);
+	end = base + cma_get_size(dev->cma_area);
+
+	return addr >= base && (addr + size) <= end;
+}
+
+/**
+ * ffa_prepare_lend() - Prepare a memory region to be lent in FF-A
+ * @dev:	Device attached to the lend pool
+ * @page:	First page of the memory region
+ * @nr_pages:	Number of pages
+ *
+ * When memory is lent via FF-A, TrustZone transitions it to the secure state.
+ * As long as Arm CPUs retain a valid mapping to that now-secure memory, they
+ * can speculatively read it, which is fatal on some systems.
+ *
+ * ffa_prepare_lend() prevents this by unmapping the memory range from the
+ * kernel's direct map.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int ffa_prepare_lend(struct device *dev, struct page *page, u64 nr_pages)
+{
+	struct page *p, *end;
+	unsigned long addr;
+	int ret;
+
+	if (!ffa_lend_pool_can_set_direct_map(dev, page, nr_pages))
+		return -ENODEV;
+
+	/* provides full ordering */
+	if (!atomic_add_unless(&ffa_lend_pool_active, 1, FFA_LEND_POOL_DISABLED))
+		return -EBUSY;
+
+	end = page + nr_pages;
+	for (p = page; p < end; p++)
+		flush_dcache_page(p);
+
+	ret = __set_direct_map_invalid_noflush(page, nr_pages);
+	if (ret) {
+		atomic_dec(&ffa_lend_pool_active);
+		return ret;
+	}
+
+	addr = (unsigned long)page_address(page);
+	flush_tlb_kernel_range(addr, addr + (nr_pages << PAGE_SHIFT));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ffa_prepare_lend);
+
+/**
+ * ffa_lend_reclaimed() - Restore a reclaimed FF-A memory region
+ * @dev:	Device attached to the lend pool
+ * @page:	First page of the memory region
+ * @nr_pages:	Number of pages
+ *
+ * Restores a memory range into the kernel's direct mapping. It must be called
+ * after a successful FF-A memory reclaim invocation.
+ */
+void ffa_lend_reclaimed(struct device *dev, struct page *page, u64 nr_pages)
+{
+	if (!ffa_lend_pool_can_set_direct_map(dev, page, nr_pages))
+		return;
+
+	__set_direct_map_default_noflush(page, nr_pages);
+
+	atomic_dec_return_release(&ffa_lend_pool_active);
+}
+EXPORT_SYMBOL_GPL(ffa_lend_reclaimed);
+
+static int ffa_lend_pool_pm_notify(struct notifier_block *nb, unsigned long mode, void *data)
+{
+	/* Prevent hibernation which would try to access lent memory */
+	switch (mode) {
+	case PM_HIBERNATION_PREPARE:
+		if (atomic_cmpxchg_acquire(&ffa_lend_pool_active, 0, FFA_LEND_POOL_DISABLED))
+			return notifier_from_errno(-EBUSY);
+		break;
+	case PM_POST_HIBERNATION:
+		atomic_set(&ffa_lend_pool_active, 0);
+	}
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block ffa_lend_pool_pm_nb = {
+	.notifier_call	= ffa_lend_pool_pm_notify,
+};
+
+static const struct reserved_mem_ops ffa_lend_pool_ops;
+
+static struct reserved_mem *ffa_lend_pool_get_rmem(void)
+{
+	struct reserved_mem *rmem;
+	struct device_node *np;
+
+	np = of_find_compatible_node(NULL, NULL, "arm,ffa-lend-pool");
+	if (!np)
+		return NULL;
+
+	rmem = of_reserved_mem_lookup(np);
+	of_node_put(np);
+
+	if (WARN_ON_ONCE(rmem && rmem->ops != &ffa_lend_pool_ops))
+		return NULL;
+
+	return rmem;
+}
+
+/**
+ * ffa_lend_pool_attach() - Attach a device to the FF-A lend pool
+ * @dev:	Device to attach
+ *
+ * FF-A devices are dynamically discovered and might not have an associated
+ * device tree node with a "memory-region" phandle. In that case, drivers must
+ * use this function to attach to the "arm,ffa-lend-pool" reserved memory
+ * region.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int ffa_lend_pool_attach(struct device *dev)
+{
+	struct reserved_mem *rmem = ffa_lend_pool_get_rmem();
+
+	return rmem ? rmem->ops->device_init(rmem, dev) : -ENODEV;
+}
+EXPORT_SYMBOL_GPL(ffa_lend_pool_attach);
+
+/**
+ * ffa_lend_pool_detach() - Detach a device from the FF-A lend pool
+ * @dev:	Device to detach
+ *
+ * Releases the device from the "arm,ffa-lend-pool" reserved memory region.
+ */
+void ffa_lend_pool_detach(struct device *dev)
+{
+	struct reserved_mem *rmem = ffa_lend_pool_get_rmem();
+
+	if (rmem)
+		rmem->ops->device_release(rmem, dev);
+}
+EXPORT_SYMBOL_GPL(ffa_lend_pool_detach);
+
+static int __init ffa_lend_pool_setup(unsigned long node, struct reserved_mem *rmem)
+{
+	struct cma *cma;
+	int ret;
+
+	/* Limited by ffa_lend_pool_active */
+	if (rmem->size / PAGE_SIZE > INT_MAX)
+		return -E2BIG;
+
+	if (!IS_ALIGNED(rmem->base | rmem->size, CMA_MIN_ALIGNMENT_BYTES)) {
+		pr_err("FF-A lend pool: incorrect alignment of CMA region\n");
+		return -EINVAL;
+	}
+
+	ret = memblock_mark_ptemap(rmem->base, rmem->size);
+	if (ret)
+		return ret;
+
+	ret = cma_init_reserved_mem(rmem->base, rmem->size, 0, rmem->name, &cma);
+	if (ret) {
+		pr_err("FF-A lend pool: unable to setup CMA region (%d)\n", ret);
+		memblock_clear_ptemap(rmem->base, rmem->size);
+		return ret;
+	}
+
+	register_pm_notifier(&ffa_lend_pool_pm_nb);
+	rmem->priv = cma;
+
+	return 0;
+}
+
+static int ffa_lend_pool_device_init(struct reserved_mem *rmem, struct device *dev)
+{
+	int ret;
+
+	if (!can_set_direct_map_range(pfn_to_page(PHYS_PFN(rmem->base)), rmem->size / PAGE_SIZE)) {
+		pr_err("FF-A lend pool: reserved memory cannot be unmapped in direct map\n");
+		return -EINVAL;
+	}
+
+	dev->cma_area = rmem->priv;
+
+	ret = xa_err(xa_store(&ffa_lend_pool_devices, (unsigned long)dev, dev, GFP_KERNEL));
+	if (ret)
+		dev->cma_area = NULL;
+
+	return ret;
+}
+
+static void ffa_lend_pool_device_release(struct reserved_mem *rmem, struct device *dev)
+{
+	xa_erase(&ffa_lend_pool_devices, (unsigned long)dev);
+	dev->cma_area = NULL;
+}
+
+static const struct reserved_mem_ops ffa_lend_pool_ops = {
+	.node_init	= ffa_lend_pool_setup,
+	.device_init	= ffa_lend_pool_device_init,
+	.device_release = ffa_lend_pool_device_release,
+};
+RESERVEDMEM_OF_DECLARE(ffa_lend_pool, "arm,ffa-lend-pool", &ffa_lend_pool_ops);
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index e71d83ee0aef..8608847931cc 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -519,4 +519,27 @@ struct ffa_ops {
 	const struct ffa_notifier_ops *notifier_ops;
 };
 
+struct page;
+
+#if IS_ENABLED(CONFIG_ARM_FFA_LEND_POOL)
+int ffa_lend_pool_attach(struct device *dev);
+void ffa_lend_pool_detach(struct device *dev);
+int ffa_prepare_lend(struct device *dev, struct page *page, u64 nr_pages);
+void ffa_lend_reclaimed(struct device *dev, struct page *page, u64 nr_pages);
+#else
+static inline int ffa_lend_pool_attach(struct device *dev)
+{
+	return -ENODEV;
+}
+static inline void ffa_lend_pool_detach(struct device *dev)
+{
+}
+static inline int ffa_prepare_lend(struct device *dev, struct page *page, u64 nr_pages)
+{
+	return -ENODEV;
+}
+static inline void ffa_lend_reclaimed(struct device *dev, struct page *page, u64 nr_pages)
+{
+}
+#endif
 #endif /* _LINUX_ARM_FFA_H */
-- 
2.55.0.1082.g2b9226bbc0-goog


