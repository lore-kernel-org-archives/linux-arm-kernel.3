Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCA3C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 21:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ca3UcDl1zOIo+8XtbXTq634i3NsU5jZbqdlOm4MtkTc=; b=SFOMC2yM2cinrZW8q6pWHM0mkP
	4oysXz7ncVC2oZ6N2rTu1wRTlL65VUU80iUFd+JdRy+ogZWSQCAfybejhN5dT2z7G1E+931yHFTyP
	sfqJfNbaiIguewJJfOzRRXehMH3VSJrJYSQr4hsYVPronw9Pa+cHjJ/UvkRqFmvu/1V+VE/9ROOJq
	EtnpE+Ezpjj7CbV0Lu6s3d0mS9JvqfBOSIQBH8IE3Qr3XoyE6KZruvHEQxfIZJutdsDMnX6aQQh8Z
	aHPnvt2CI60/+8hiGWC0enT7K9pN5I9c6FVTIMB0GT5Lmejb8fu2errV/Uq+EYVt0niVpY+3npGdp
	FacLVCmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAxA-00000006qr5-0MrW;
	Tue, 24 Jun 2025 21:13:16 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5tb-00000006BbF-40Ky
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 15:49:17 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bRTlG0cDmz6J6l2;
	Tue, 24 Jun 2025 23:44:10 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id C993C1402EA;
	Tue, 24 Jun 2025 23:49:09 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.19.247) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 24 Jun 2025 17:49:08 +0200
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Catalin Marinas <catalin.marinas@arm.com>, <james.morse@arm.com>,
	<linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, <gregkh@linuxfoundation.org>, Will Deacon
	<will@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Davidlohr Bueso
	<dave@stgolabs.net>
CC: Yicong Yang <yangyicong@huawei.com>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, H Peter Anvin
	<hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>
Subject: [PATCH v2 2/8] generic: Support ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
Date: Tue, 24 Jun 2025 16:47:58 +0100
Message-ID: <20250624154805.66985-3-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250624154805.66985-1-Jonathan.Cameron@huawei.com>
References: <20250624154805.66985-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_084916_280430_E9B08103 
X-CRM114-Status: GOOD (  16.36  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION provides the mechanism for
invalidate certain memory regions in a cache-incoherent manner.
Currently is used by NVIDMM adn CXL memory. This is mainly done
by the system component and is implementation define per spec.
Provides a method for the platforms register their own invalidate
method and implement ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION.

Architectures can opt in for this support via
CONFIG_GENERIC_CPU_CACHE_INVALIDATE_MEMREGION.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/base/Kconfig             |  3 +++
 drivers/base/Makefile            |  1 +
 drivers/base/cache.c             | 46 ++++++++++++++++++++++++++++++++
 include/asm-generic/cacheflush.h | 12 +++++++++
 4 files changed, 62 insertions(+)

diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index 064eb52ff7e2..cc6df87a0a96 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -181,6 +181,9 @@ config SYS_HYPERVISOR
 	bool
 	default n
 
+config GENERIC_CPU_CACHE_INVALIDATE_MEMREGION
+	bool
+
 config GENERIC_CPU_DEVICES
 	bool
 	default n
diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index 8074a10183dc..0fbfa4300b98 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_DEV_COREDUMP) += devcoredump.o
 obj-$(CONFIG_GENERIC_MSI_IRQ) += platform-msi.o
 obj-$(CONFIG_GENERIC_ARCH_TOPOLOGY) += arch_topology.o
 obj-$(CONFIG_GENERIC_ARCH_NUMA) += arch_numa.o
+obj-$(CONFIG_GENERIC_CPU_CACHE_INVALIDATE_MEMREGION) += cache.o
 obj-$(CONFIG_ACPI) += physical_location.o
 
 obj-y			+= test/
diff --git a/drivers/base/cache.c b/drivers/base/cache.c
new file mode 100644
index 000000000000..8d351657bbef
--- /dev/null
+++ b/drivers/base/cache.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Generic support for CPU Cache Invalidate Memregion
+ */
+
+#include <linux/spinlock.h>
+#include <linux/export.h>
+#include <asm/cacheflush.h>
+
+
+static const struct system_cache_flush_method *scfm_data;
+DEFINE_SPINLOCK(scfm_lock);
+
+void generic_set_sys_cache_flush_method(const struct system_cache_flush_method *method)
+{
+	guard(spinlock_irqsave)(&scfm_lock);
+	if (scfm_data || !method || !method->invalidate_memregion)
+		return;
+
+	scfm_data = method;
+}
+EXPORT_SYMBOL_GPL(generic_set_sys_cache_flush_method);
+
+void generic_clr_sys_cache_flush_method(const struct system_cache_flush_method *method)
+{
+	guard(spinlock_irqsave)(&scfm_lock);
+	if (scfm_data && scfm_data == method)
+		scfm_data = NULL;
+}
+
+int cpu_cache_invalidate_memregion(int res_desc, phys_addr_t start, size_t len)
+{
+	guard(spinlock_irqsave)(&scfm_lock);
+	if (!scfm_data)
+		return -EOPNOTSUPP;
+
+	return scfm_data->invalidate_memregion(res_desc, start, len);
+}
+EXPORT_SYMBOL_NS_GPL(cpu_cache_invalidate_memregion, "DEVMEM");
+
+bool cpu_cache_has_invalidate_memregion(void)
+{
+	guard(spinlock_irqsave)(&scfm_lock);
+	return !!scfm_data;
+}
+EXPORT_SYMBOL_NS_GPL(cpu_cache_has_invalidate_memregion, "DEVMEM");
diff --git a/include/asm-generic/cacheflush.h b/include/asm-generic/cacheflush.h
index 7ee8a179d103..87e64295561e 100644
--- a/include/asm-generic/cacheflush.h
+++ b/include/asm-generic/cacheflush.h
@@ -124,4 +124,16 @@ static inline void flush_cache_vunmap(unsigned long start, unsigned long end)
 	} while (0)
 #endif
 
+#ifdef CONFIG_GENERIC_CPU_CACHE_INVALIDATE_MEMREGION
+
+struct system_cache_flush_method {
+	int (*invalidate_memregion)(int res_desc,
+				    phys_addr_t start, size_t len);
+};
+
+void generic_set_sys_cache_flush_method(const struct system_cache_flush_method *method);
+void generic_clr_sys_cache_flush_method(const struct system_cache_flush_method *method);
+
+#endif /* CONFIG_GENERIC_CPU_CACHE_INVALIDATE_MEMREGION */
+
 #endif /* _ASM_GENERIC_CACHEFLUSH_H */
-- 
2.48.1


