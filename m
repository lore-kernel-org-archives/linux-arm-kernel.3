Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140A4E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 10:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSEQJK+ksYiuBwJLNZIu14y1HbYeyt5RPpbKUWbkgOM=; b=wqVFZ3QUKQzs3mZJIwyhaOFKky
	fWlestjyKq/lFPG44oQE+6wYS4hphR4bsZ00L6Q7QDfjE8BtR35RsabItWGc252Edw9FDTZdFl2Gl
	0Ob0jl9ZElbFkjbAKYMz2KdrFc0J0rutUfK1R4i6UwpY2Mr3oQzIYcmAvgnULNOtvsWXNlRk7TzWi
	OdF6QZpmkxZVgaMqU4jhQA+gZZ4JuyHKZIuIElrck1lhex1HUUMzkTezAfmY7BMYlImLasuquAhpm
	iT979JHjY3xRGm1EsNX7IlK/l1/GrBHD0xfDkL/ytjUg+dtTGrdInjKtBccgkIQULGUelDXgtdF9+
	Gq9z9N9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVcC-00000001Idq-3dvm;
	Fri, 06 Dec 2024 10:31:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVLY-00000001DTt-47Tn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 10:14:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 436591C01;
	Fri,  6 Dec 2024 02:14:32 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59F153F71E;
	Fri,  6 Dec 2024 02:14:01 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	aruna.ramakrishna@oracle.com,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	jannh@google.com,
	jeffxu@chromium.org,
	joey.gouly@arm.com,
	kees@kernel.org,
	maz@kernel.org,
	pierre.langlois@arm.com,
	qperret@google.com,
	ryan.roberts@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [RFC PATCH 16/16] mm: Add basic tests for kpkeys_hardened_pgtables
Date: Fri,  6 Dec 2024 10:11:10 +0000
Message-ID: <20241206101110.1646108-17-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241206101110.1646108-1-kevin.brodsky@arm.com>
References: <20241206101110.1646108-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_021405_101083_2116DF2E 
X-CRM114-Status: GOOD (  19.19  )
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

Add basic tests for the kpkeys_hardened_pgtables feature: try to
perform a direct write to some kernel and user page table entry and
ensure it fails.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 mm/Makefile                        |  1 +
 mm/kpkeys_hardened_pgtables_test.c | 71 ++++++++++++++++++++++++++++++
 security/Kconfig.hardening         | 12 +++++
 3 files changed, 84 insertions(+)
 create mode 100644 mm/kpkeys_hardened_pgtables_test.c

diff --git a/mm/Makefile b/mm/Makefile
index ffe799c1c897..49ac16ae6875 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -147,3 +147,4 @@ obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
 obj-$(CONFIG_EXECMEM) += execmem.o
 obj-$(CONFIG_TMPFS_QUOTA) += shmem_quota.o
 obj-$(CONFIG_KPKEYS_HARDENED_PGTABLES) += kpkeys_hardened_pgtables.o
+obj-$(CONFIG_KPKEYS_HARDENED_PGTABLES_TEST) += kpkeys_hardened_pgtables_test.o
diff --git a/mm/kpkeys_hardened_pgtables_test.c b/mm/kpkeys_hardened_pgtables_test.c
new file mode 100644
index 000000000000..37b6ffaa55e6
--- /dev/null
+++ b/mm/kpkeys_hardened_pgtables_test.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <kunit/test.h>
+#include <linux/pgtable.h>
+#include <linux/mman.h>
+
+static void write_kernel_pte(struct kunit *test)
+{
+	pte_t *ptep;
+	pte_t pte;
+	int ret;
+
+	/*
+	 * The choice of address is mostly arbitrary - we just need a page
+	 * that is definitely mapped, such as the current function.
+	 */
+	ptep = virt_to_kpte((unsigned long)&write_kernel_pte);
+	KUNIT_ASSERT_NOT_NULL_MSG(test, ptep, "Failed to get PTE");
+
+	pte = ptep_get(ptep);
+	pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
+	ret = copy_to_kernel_nofault(ptep, &pte, sizeof(pte));
+	KUNIT_EXPECT_EQ_MSG(test, ret, -EFAULT,
+			    "Direct PTE write wasn't prevented");
+}
+
+static void write_user_pmd(struct kunit *test)
+{
+	pmd_t *pmdp;
+	pmd_t pmd;
+	unsigned long uaddr;
+	int ret;
+
+	uaddr = kunit_vm_mmap(test, NULL, 0, PAGE_SIZE, PROT_READ,
+			      MAP_ANONYMOUS | MAP_PRIVATE | MAP_POPULATE, 0);
+	KUNIT_ASSERT_NE_MSG(test, uaddr, 0, "Could not create userspace mm");
+
+	/* We passed MAP_POPULATE so a PMD should already be allocated */
+	pmdp = pmd_off(current->mm, uaddr);
+	KUNIT_ASSERT_NOT_NULL_MSG(test, pmdp, "Failed to get PMD");
+
+	pmd = pmdp_get(pmdp);
+	pmd = set_pmd_bit(pmd, __pgprot(PROT_SECT_NORMAL));
+	ret = copy_to_kernel_nofault(pmdp, &pmd, sizeof(pmd));
+	KUNIT_EXPECT_EQ_MSG(test, ret, -EFAULT,
+			    "Direct PMD write wasn't prevented");
+}
+
+static int kpkeys_hardened_pgtables_suite_init(struct kunit_suite *suite)
+{
+	if (!arch_kpkeys_enabled()) {
+		pr_err("Cannot run kpkeys_hardened_pgtables tests: kpkeys are not supported\n");
+		return 1;
+	}
+
+	return 0;
+}
+
+static struct kunit_case kpkeys_hardened_pgtables_test_cases[] = {
+	KUNIT_CASE(write_kernel_pte),
+	KUNIT_CASE(write_user_pmd),
+	{}
+};
+
+static struct kunit_suite kpkeys_hardened_pgtables_test_suite = {
+	.name = "Hardened pgtables using kpkeys",
+	.test_cases = kpkeys_hardened_pgtables_test_cases,
+	.suite_init = kpkeys_hardened_pgtables_suite_init,
+};
+kunit_test_suite(kpkeys_hardened_pgtables_test_suite);
+
+MODULE_LICENSE("GPL");
diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
index 95f93f1d4055..8bc5d7235f6d 100644
--- a/security/Kconfig.hardening
+++ b/security/Kconfig.hardening
@@ -312,6 +312,18 @@ config KPKEYS_HARDENED_PGTABLES
 	  This option has no effect if the system does not support
 	  kernel pkeys.
 
+config KPKEYS_HARDENED_PGTABLES_TEST
+	tristate "KUnit tests for kpkeys_hardened_pgtables" if !KUNIT_ALL_TESTS
+	depends on KPKEYS_HARDENED_PGTABLES
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Enable this option to check that the kpkeys_hardened_pgtables feature
+	  functions as intended, i.e. prevents arbitrary writes to user and
+	  kernel page tables.
+
+	  If unsure, say N.
+
 endmenu
 
 config CC_HAS_RANDSTRUCT
-- 
2.47.0


