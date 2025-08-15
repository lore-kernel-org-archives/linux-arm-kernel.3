Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD2DCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 10:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rERn3rtGEvUrAdJLPdiij/tpOVbfy8tftDeD0deRkhg=; b=YYU2hWeVcQczvz+ppq8KWL++qW
	VsafcIwG/x4q+AkhpnkgqXPgDHWMGpaR3iEvCqGsBhibXWfNnbQWdsHh/DKyi9wZUiIk/GFu3AuUh
	2VAbqAu4JA1QvhLiXsM2FD99+oR0Lx48wU+tc63+HClariAcjxT7IqujY/iFyQakHest5sLnm4cS8
	oAa8LCjjsiJdvbCxK3XeCUmSokNwxJ3gFgISxHm3AyUhUTOIDma3EktqovpeTitepnUN4eou2JU2L
	2AmMxnM5RyuAgJecc1IkI94tVGBFFJB9tA4CmZ4E9hxKQTaIfr3YGz+CCS5ia7T6djqzjPNHLoaFY
	dIilgwfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umruc-00000002En2-1NFc;
	Fri, 15 Aug 2025 10:43:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqEW-00000001vyX-0yIx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 08:56:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A38611688;
	Fri, 15 Aug 2025 01:56:11 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C4DA3F63F;
	Fri, 15 Aug 2025 01:56:15 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [RFC PATCH v5 11/18] mm: Introduce kpkeys_hardened_pgtables
Date: Fri, 15 Aug 2025 09:55:05 +0100
Message-ID: <20250815085512.2182322-12-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250815085512.2182322-1-kevin.brodsky@arm.com>
References: <20250815085512.2182322-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_015620_347826_2221400A 
X-CRM114-Status: GOOD (  25.87  )
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

kpkeys_hardened_pgtables is a hardening feature based on kpkeys. It
aims to prevent the corruption of page tables by: 1. mapping all
page table pages, both kernel and user, with a privileged pkey
(KPKEYS_PKEY_PGTABLES), and 2. granting write access to that pkey
only when running at a higher kpkeys level (KPKEYS_LVL_PGTABLES).

The feature is exposed as CONFIG_KPKEYS_HARDENED_PGTABLES; it
requires explicit architecture opt-in by selecting
ARCH_HAS_KPKEYS_HARDENED_PGTABLES, since much of the page table
handling is arch-specific.

This patch introduces an API to modify the PTPs' pkey. Because this
API is going to be called from low-level pgtable helpers, it must
be inactive on boot and explicitly switched on if and when kpkeys
become available. A static key is used for that purpose; it is the
responsibility of each architecture supporting
kpkeys_hardened_pgtables to call kpkeys_hardened_pgtables_enable()
as early as possible to switch on that static key. The initial
kernel page tables are also walked to set their pkey, since they
have already been allocated at that point.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/asm-generic/kpkeys.h  |  4 +++
 include/linux/kpkeys.h        | 46 ++++++++++++++++++++++++++++++++++-
 mm/Kconfig                    |  3 +++
 mm/Makefile                   |  1 +
 mm/kpkeys_hardened_pgtables.c | 44 +++++++++++++++++++++++++++++++++
 security/Kconfig.hardening    | 12 +++++++++
 6 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 mm/kpkeys_hardened_pgtables.c

diff --git a/include/asm-generic/kpkeys.h b/include/asm-generic/kpkeys.h
index ab819f157d6a..cec92334a9f3 100644
--- a/include/asm-generic/kpkeys.h
+++ b/include/asm-generic/kpkeys.h
@@ -2,6 +2,10 @@
 #ifndef __ASM_GENERIC_KPKEYS_H
 #define __ASM_GENERIC_KPKEYS_H
 
+#ifndef KPKEYS_PKEY_PGTABLES
+#define KPKEYS_PKEY_PGTABLES	1
+#endif
+
 #ifndef KPKEYS_PKEY_DEFAULT
 #define KPKEYS_PKEY_DEFAULT	0
 #endif
diff --git a/include/linux/kpkeys.h b/include/linux/kpkeys.h
index faa6e2615798..5f4b096374ba 100644
--- a/include/linux/kpkeys.h
+++ b/include/linux/kpkeys.h
@@ -4,11 +4,15 @@
 
 #include <linux/bug.h>
 #include <linux/cleanup.h>
+#include <linux/jump_label.h>
+
+struct folio;
 
 #define KPKEYS_LVL_DEFAULT	0
+#define KPKEYS_LVL_PGTABLES	1
 
 #define KPKEYS_LVL_MIN		KPKEYS_LVL_DEFAULT
-#define KPKEYS_LVL_MAX		KPKEYS_LVL_DEFAULT
+#define KPKEYS_LVL_MAX		KPKEYS_LVL_PGTABLES
 
 #define __KPKEYS_GUARD(name, set_level, restore_pkey_reg, set_arg, ...)	\
 	__DEFINE_CLASS_IS_CONDITIONAL(name, false);			\
@@ -110,4 +114,44 @@ static inline bool arch_kpkeys_enabled(void)
 
 #endif /* CONFIG_ARCH_HAS_KPKEYS */
 
+#ifdef CONFIG_KPKEYS_HARDENED_PGTABLES
+
+DECLARE_STATIC_KEY_FALSE(kpkeys_hardened_pgtables_key);
+
+static inline bool kpkeys_hardened_pgtables_enabled(void)
+{
+	return static_branch_unlikely(&kpkeys_hardened_pgtables_key);
+}
+
+int kpkeys_protect_pgtable_memory(struct folio *folio);
+int kpkeys_unprotect_pgtable_memory(struct folio *folio);
+
+/*
+ * Enables kpkeys_hardened_pgtables and switches existing kernel page tables to
+ * a privileged pkey (KPKEYS_PKEY_PGTABLES).
+ *
+ * Should be called as early as possible by architecture code, after (k)pkeys
+ * are initialised and before any user task is spawned.
+ */
+void kpkeys_hardened_pgtables_enable(void);
+
+#else /* CONFIG_KPKEYS_HARDENED_PGTABLES */
+
+static inline bool kpkeys_hardened_pgtables_enabled(void)
+{
+	return false;
+}
+
+static inline int kpkeys_protect_pgtable_memory(struct folio *folio)
+{
+	return 0;
+}
+static inline int kpkeys_unprotect_pgtable_memory(struct folio *folio)
+{
+	return 0;
+}
+static inline void kpkeys_hardened_pgtables_enable(void) {}
+
+#endif /* CONFIG_KPKEYS_HARDENED_PGTABLES */
+
 #endif /* _LINUX_KPKEYS_H */
diff --git a/mm/Kconfig b/mm/Kconfig
index 90f2e5c381a6..e34edf5c41e7 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1175,6 +1175,9 @@ config ARCH_HAS_PKEYS
 	bool
 config ARCH_HAS_KPKEYS
 	bool
+# ARCH_HAS_KPKEYS must be selected when selecting this option
+config ARCH_HAS_KPKEYS_HARDENED_PGTABLES
+	bool
 
 config ARCH_USES_PG_ARCH_2
 	bool
diff --git a/mm/Makefile b/mm/Makefile
index ef54aa615d9d..10848df0ca85 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -147,3 +147,4 @@ obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
 obj-$(CONFIG_EXECMEM) += execmem.o
 obj-$(CONFIG_TMPFS_QUOTA) += shmem_quota.o
 obj-$(CONFIG_PT_RECLAIM) += pt_reclaim.o
+obj-$(CONFIG_KPKEYS_HARDENED_PGTABLES) += kpkeys_hardened_pgtables.o
diff --git a/mm/kpkeys_hardened_pgtables.c b/mm/kpkeys_hardened_pgtables.c
new file mode 100644
index 000000000000..931fa97bc8a7
--- /dev/null
+++ b/mm/kpkeys_hardened_pgtables.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/mm.h>
+#include <linux/kpkeys.h>
+#include <linux/set_memory.h>
+
+DEFINE_STATIC_KEY_FALSE(kpkeys_hardened_pgtables_key);
+
+int kpkeys_protect_pgtable_memory(struct folio *folio)
+{
+	unsigned long addr = (unsigned long)folio_address(folio);
+	unsigned int order = folio_order(folio);
+	int ret = 0;
+
+	if (kpkeys_hardened_pgtables_enabled())
+		ret = set_memory_pkey(addr, 1 << order, KPKEYS_PKEY_PGTABLES);
+
+	WARN_ON(ret);
+	return ret;
+}
+
+int kpkeys_unprotect_pgtable_memory(struct folio *folio)
+{
+	unsigned long addr = (unsigned long)folio_address(folio);
+	unsigned int order = folio_order(folio);
+	int ret = 0;
+
+	if (kpkeys_hardened_pgtables_enabled())
+		ret = set_memory_pkey(addr, 1 << order, KPKEYS_PKEY_DEFAULT);
+
+	WARN_ON(ret);
+	return ret;
+}
+
+void __init kpkeys_hardened_pgtables_enable(void)
+{
+	int ret;
+
+	if (!arch_kpkeys_enabled())
+		return;
+
+	static_branch_enable(&kpkeys_hardened_pgtables_key);
+	ret = kernel_pgtables_set_pkey(KPKEYS_PKEY_PGTABLES);
+	WARN_ON(ret);
+}
diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
index b9a5bc3430aa..41b7530530b7 100644
--- a/security/Kconfig.hardening
+++ b/security/Kconfig.hardening
@@ -265,6 +265,18 @@ config BUG_ON_DATA_CORRUPTION
 
 	  If unsure, say N.
 
+config KPKEYS_HARDENED_PGTABLES
+	bool "Harden page tables using kernel pkeys"
+	depends on ARCH_HAS_KPKEYS_HARDENED_PGTABLES
+	help
+	  This option makes all page tables mostly read-only by
+	  allocating them with a non-default protection key (pkey) and
+	  only enabling write access to that pkey in routines that are
+	  expected to write to page table entries.
+
+	  This option has no effect if the system does not support
+	  kernel pkeys.
+
 endmenu
 
 config CC_HAS_RANDSTRUCT
-- 
2.47.0


