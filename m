Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE2BC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 17:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NtAANCe4QtIKO9m3X/Y53rt7yHSwtrSDMfLnQ8LDCg=; b=Cz/C1GgGv2/enlqd6Wc5FgGNXD
	/55w4RHzb6G4AzeNyeJiiHrafLW9GyVvMCgfHicE/SkQi4u38uKgSHhdnFmwfJdvBP+6QoRjnVSxb
	kyK+4ThM39HHb60G537Xep9jifCuZgF30w6GHZtf7H67zb4hGVMpSyhM77gAp7QYGnwuxO1BfFvZO
	eA4vi584+tXu/cXs7uKENli1xGGMXWWfTsb4t5wPxtb3fKJH/nfph8o6ZluDcaA5QY8cmmDURgJ44
	sGw6vq8wLiiD5n7OfvhCsJcKRQKyw5DSb3omL2Izfg1zeEIo8arBfbqIIxTvsdXOC7EEVxdvlls0C
	qS7UWADg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJyg-0000000Cqq8-3LBw;
	Thu, 20 Mar 2025 17:46:46 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJuS-0000000CqEv-311M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 17:42:26 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZJXr66Rdqz6M4js;
	Fri, 21 Mar 2025 01:39:02 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 2F93614050D;
	Fri, 21 Mar 2025 01:42:23 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.19.247) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Mar 2025 18:42:22 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<james.morse@arm.com>, <conor@kernel.org>, Yicong Yang
	<yangyicong@huawei.com>, <linux-acpi@vger.kernel.org>
CC: <linux-arch@vger.kernel.org>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, <linux-mm@kvack.org>,
	<gregkh@linuxfoundation.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dan Williams <dan.j.williams@intel.com>
Subject: [RFC PATCH 2/6] arm64: Support ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
Date: Thu, 20 Mar 2025 17:41:14 +0000
Message-ID: <20250320174118.39173-3-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320174118.39173-1-Jonathan.Cameron@huawei.com>
References: <20250320174118.39173-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_104225_061839_F2312B95 
X-CRM114-Status: GOOD (  13.03  )
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
Currently is used by NVIDMM and CXL memory. This is mainly done
by the system component and is implementation define per spec.
Provides a method for the platforms register their own invalidate
method and implement ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 arch/arm64/Kconfig                  |  1 +
 arch/arm64/include/asm/cacheflush.h | 14 ++++++++++
 arch/arm64/mm/flush.c               | 42 +++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 940343beb3d4..11ecd20ec3b8 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -21,6 +21,7 @@ config ARM64
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_CC_PLATFORM
+	select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
 	select ARCH_HAS_CRC32
 	select ARCH_HAS_CRC_T10DIF if KERNEL_MODE_NEON
 	select ARCH_HAS_CURRENT_STACK_POINTER
diff --git a/arch/arm64/include/asm/cacheflush.h b/arch/arm64/include/asm/cacheflush.h
index 28ab96e808ef..b8eb8738c965 100644
--- a/arch/arm64/include/asm/cacheflush.h
+++ b/arch/arm64/include/asm/cacheflush.h
@@ -139,6 +139,20 @@ static __always_inline void icache_inval_all_pou(void)
 	dsb(ish);
 }
 
+#ifdef CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
+
+#include <linux/memregion.h>
+
+struct system_cache_flush_method {
+	int (*invalidate_memregion)(int res_desc,
+				    phys_addr_t start, size_t len);
+};
+
+void arm64_set_sys_cache_flush_method(const struct system_cache_flush_method *method);
+void arm64_clr_sys_cache_flush_method(const struct system_cache_flush_method *method);
+
+#endif /* CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION */
+
 #include <asm-generic/cacheflush.h>
 
 #endif /* __ASM_CACHEFLUSH_H */
diff --git a/arch/arm64/mm/flush.c b/arch/arm64/mm/flush.c
index 013eead9b695..d822406d925d 100644
--- a/arch/arm64/mm/flush.c
+++ b/arch/arm64/mm/flush.c
@@ -10,6 +10,7 @@
 #include <linux/mm.h>
 #include <linux/libnvdimm.h>
 #include <linux/pagemap.h>
+#include <linux/memregion.h>
 
 #include <asm/cacheflush.h>
 #include <asm/cache.h>
@@ -100,3 +101,44 @@ void arch_invalidate_pmem(void *addr, size_t size)
 }
 EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
 #endif
+
+#ifdef CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
+
+static const struct system_cache_flush_method *scfm_data;
+DEFINE_SPINLOCK(scfm_lock);
+
+void arm64_set_sys_cache_flush_method(const struct system_cache_flush_method *method)
+{
+	guard(spinlock_irqsave)(&scfm_lock);
+	if (scfm_data || !method || !method->invalidate_memregion)
+		return;
+
+	scfm_data = method;
+}
+EXPORT_SYMBOL_GPL(arm64_set_sys_cache_flush_method);
+
+void arm64_clr_sys_cache_flush_method(const struct system_cache_flush_method *method)
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
+
+#endif /* CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION */
-- 
2.43.0


