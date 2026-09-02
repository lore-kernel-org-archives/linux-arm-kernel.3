Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1418BC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnnAKTx0rWFGRttv0vRYvbBX3qhJSeyXfYhwCY9t/xQ=; b=YiqAz8/MFD+aeOk5OlhdSkmET6
	2p8B3517OxVLfysC26c1RKs51QL1FxS7fqjxn+vhtIRAv86pTKiZeJSViAkI3HqSyFjcGiTENS05i
	haw8HMAb3JqSzBsq4kpoLGZ+Lee35h3FUjsVguI0G+9+aoLXAluG+KQuqsIwx66qaznJCWD45OoHf
	eRphSvt2ItFEM0RraRDHqYUNNgaWiZMev1+L+fVXaMhJG7gR3b1L1IQma9z7it1Hns5EldGl30wVn
	CE2HTDK7e6xxE9CKQU4nWl9yZsFWeBxmSGqtXuFVXQtvJRw+VUwVfYP5kYG+zpYYCKZuotnD2wX5T
	P3hownoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYt-0000000EP5z-3MIu;
	Wed, 02 Sep 2026 10:51:23 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYp-0000000EOxz-2VJE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 10:51:20 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-495529a93f9so8306255e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 03:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346277; x=1788951077; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnnAKTx0rWFGRttv0vRYvbBX3qhJSeyXfYhwCY9t/xQ=;
        b=QRSwrI8WZnAlTyDvs9Elx/A+yvm1LxYGO3u3riH+G46ko7wIEQjc1HNjorjijNc9FK
         tkWjQ4GRMUGB+9MPDBIwwykNMo2KftdSWQdslSvXSl6yycLNfWXTceonCsL2jvC5z53N
         ZohVhi7xd0CIW6G2oUJ3zhg4Hcr71BJW6DGn+M3iHC4e0Qd6yGYaFJfIYROx1YZ09Hu0
         e1VUy4+cRfQJSC66igS4tpt94cwf7bjEJnUhxaqwQyyH9xXysoqmOYEEzFRDXaWKQIfz
         8SdH+xdu93Xh0QWCA0/sNVx9pFVhmUdoBWYWEhFTp20hN2WCCeo4X6r3tHD3xfb61DwM
         LfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346277; x=1788951077;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnnAKTx0rWFGRttv0vRYvbBX3qhJSeyXfYhwCY9t/xQ=;
        b=rv5quYXyLq2yUj4G4QsfSbNBG6UlAW20UHN198uGqeMhJMjw5hF2Frq+r2udRdNjqF
         7h4vEV0gA9CpYFOOEnJgkfS2Rcmm+MI7vlkyKzqcMGGuLIuaa/99XJ1MoXJ1VpNge9nn
         cDVKQJ7ykp/sHnCmC4CWpGd7ru5UKohoyU1afeaGKvgarwI2okMh+haksgGkgVM10djt
         XMKt+M3CwXL+c5PcUlOK4dNWPgcdB55d7HJ99s1en9upCpBEu4BXvEb6e11UFuI0DU4a
         3qoU48R85j3UdwQaADTgUDZpGK5yh2vKF/Z61wLPseau5bIbZt590NNaY9ASXsD6knrn
         mbBw==
X-Forwarded-Encrypted: i=1; AHgh+RoFfVQH6sc4MZ/gDjmzkP7gu1ykyjLIKFqAQMi7Zg6iJNJ346D6pvF7itHphNwXlyIAcYiwJ2V8nAo96bBgnc2E@lists.infradead.org
X-Gm-Message-State: AFuF++na0DxV59uKhgKbsrQjecdRky6stYnhAyvEKcgDedMIq9E8URX7
	kvAApmQI9NJknitOpb5FTyVaxOinqFu4uAqO4jOKL39D53tijUer8MeRfOtTApvM7PinGi11ZrC
	/ZaWLwxA5dbZWnqwitGqOiQ==
X-Received: from wmqh12.prod.google.com ([2002:a05:600c:350c:b0:496:c04d:501e])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:310f:b0:49b:c8e:a211 with SMTP id 5b1f17b1804b1-49ce57f27e8mr57275175e9.5.1788346277042;
 Wed, 02 Sep 2026 03:51:17 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:11 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-10-vdonnefort@google.com>
Subject: [PATCH v9 09/10] firmware: arm_ffa: Introduce ffa-lend-pool
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
X-CRM114-CacheID: sfid-20260902_035119_686803_4B9B04B2 
X-CRM114-Status: GOOD (  25.16  )
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
          ll-map;
          size = <0x0 0x4000000>;
      };
  };

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

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
index 000000000000..67a36f5d5aa6
--- /dev/null
+++ b/drivers/firmware/arm_ffa/lend_pool.c
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Arm FF-A Reserved Memory CMA driver for Memory Lending
+ *
+ * Prevents CPU speculative reads to secure memory by unmapping it from the
+ * kernel direct map. This only works if the reserved-memory is mapped at the
+ * last-level ("ll-map;" or "rodata=full") or if all CPUs in the system support
+ * BBML3.
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
+#include <linux/mm.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/rcupdate.h>
+#include <linux/set_memory.h>
+#include <linux/xarray.h>
+
+static DEFINE_XARRAY(ffa_lend_devices);
+
+static bool ffa_lend_pool_contains(struct device *dev, phys_addr_t addr, size_t size)
+{
+	phys_addr_t base, end;
+
+	if (!dev)
+		return false;
+
+	guard(rcu)();
+
+	if (xa_load(&ffa_lend_devices, (unsigned long)dev) != dev)
+		return false;
+
+	if (WARN_ON_ONCE(!dev->cma_area))
+		return false;
+
+	base = cma_get_base(dev->cma_area);
+	end = base + cma_get_size(dev->cma_area);
+
+	return addr >= base && (addr + size) <= end;
+}
+
+/**
+ * ffa_prepare_lend() - Prepare a memory region to be lent in FF-A
+ * @dev:	Device attached to the lend pool
+ * @addr:	Physical start address of the memory region
+ * @size:	Size in bytes
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
+int ffa_prepare_lend(struct device *dev, phys_addr_t addr, size_t size)
+{
+	unsigned long nr_pages = size >> PAGE_SHIFT;
+	struct page *page;
+	unsigned long i;
+	int ret;
+
+	if (!ffa_lend_pool_contains(dev, addr, size))
+		return -ENODEV;
+
+	page = pfn_to_page(PHYS_PFN(addr));
+	for (i = 0; i < nr_pages; i++) {
+		ret = __set_direct_map_invalid_noflush(page + i);
+
+		if (ret) {
+			while (i--)
+				__set_direct_map_default_noflush(page + i);
+
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ffa_prepare_lend);
+
+/**
+ * ffa_lend_reclaimed() - Restore a reclaimed FF-A memory region
+ * @dev:	Device attached to the lend pool
+ * @addr:	Physical start address of the memory region
+ * @size:	Size in bytes
+ *
+ * Restores a memory range into the kernel's direct mapping. It must be called
+ * after a successful FF-A memory reclaim invocation.
+ */
+void ffa_lend_reclaimed(struct device *dev, phys_addr_t addr, size_t size)
+{
+	unsigned long nr_pages = size >> PAGE_SHIFT;
+	struct page *page;
+	unsigned long i;
+
+	if (!ffa_lend_pool_contains(dev, addr, size))
+		return;
+
+	page = pfn_to_page(PHYS_PFN(addr));
+	for (i = 0; i < nr_pages; i++)
+		__set_direct_map_default_noflush(page + i);
+}
+EXPORT_SYMBOL_GPL(ffa_lend_reclaimed);
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
+	struct device_node *np;
+	struct reserved_mem *rmem;
+
+	np = of_find_compatible_node(NULL, NULL, "arm,ffa-lend-pool");
+	if (!np)
+		return -ENODEV;
+
+	rmem = of_reserved_mem_lookup(np);
+	of_node_put(np);
+	if (!rmem || !rmem->ops || !rmem->ops->device_init)
+		return -EINVAL;
+
+	return rmem->ops->device_init(rmem, dev);
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
+	struct device_node *np;
+	struct reserved_mem *rmem;
+
+	np = of_find_compatible_node(NULL, NULL, "arm,ffa-lend-pool");
+	if (!np)
+		return;
+
+	rmem = of_reserved_mem_lookup(np);
+	of_node_put(np);
+
+	if (rmem && rmem->ops && rmem->ops->device_release)
+		rmem->ops->device_release(rmem, dev);
+}
+EXPORT_SYMBOL_GPL(ffa_lend_pool_detach);
+
+static int __init ffa_lend_pool_setup(unsigned long node, struct reserved_mem *rmem)
+{
+	struct cma *cma;
+	int ret;
+
+	if (!of_get_flat_dt_prop(node, "reusable", NULL) ||
+	    of_get_flat_dt_prop(node, "no-map", NULL)) {
+		pr_err("FF-A lend pool: node must be 'reusable' and not 'no-map'\n");
+		return -EINVAL;
+	}
+
+	if (!IS_ALIGNED(rmem->base | rmem->size, CMA_MIN_ALIGNMENT_BYTES)) {
+		pr_err("FF-A lend pool: incorrect alignment of CMA region\n");
+		return -EINVAL;
+	}
+
+	ret = cma_init_reserved_mem(rmem->base, rmem->size, 0, rmem->name, &cma);
+	if (ret) {
+		pr_err("FF-A lend pool: unable to setup CMA region (%d)\n", ret);
+		return ret;
+	}
+
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
+	ret = xa_err(xa_store(&ffa_lend_devices, (unsigned long)dev, dev, GFP_KERNEL));
+	if (ret)
+		dev->cma_area = NULL;
+
+	return ret;
+}
+
+static void ffa_lend_pool_device_release(struct reserved_mem *rmem, struct device *dev)
+{
+	xa_erase(&ffa_lend_devices, (unsigned long)dev);
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
index e71d83ee0aef..fa3570f85ff7 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -519,4 +519,25 @@ struct ffa_ops {
 	const struct ffa_notifier_ops *notifier_ops;
 };
 
+#if IS_ENABLED(CONFIG_ARM_FFA_LEND_POOL)
+int ffa_lend_pool_attach(struct device *dev);
+void ffa_lend_pool_detach(struct device *dev);
+int ffa_prepare_lend(struct device *dev, phys_addr_t paddr, size_t size);
+void ffa_lend_reclaimed(struct device *dev, phys_addr_t paddr, size_t size);
+#else
+static inline int ffa_lend_pool_attach(struct device *dev)
+{
+	return -ENODEV;
+}
+static inline void ffa_lend_pool_detach(struct device *dev)
+{
+}
+static inline int ffa_prepare_lend(struct device *dev, phys_addr_t paddr, size_t size)
+{
+	return -ENODEV;
+}
+static inline void ffa_lend_reclaimed(struct device *dev, phys_addr_t paddr, size_t size)
+{
+}
+#endif
 #endif /* _LINUX_ARM_FFA_H */
-- 
2.55.0.970.g62bdec98f9-goog


