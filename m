Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AE5CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 11:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFMgh8B2S7/2/ySsxS0RcRSatwYqeYSzAk4PcikExNM=; b=AerbPqglVPXekFFoGHa+Aooa8z
	9u7PULWGpmlbGcRQ7TbGIRe8fcSx4kVOBnmjOTgHLvevVUUzt9LVM1qNO9XmKYGsj2J5+tY4v5LHg
	dcpM0yYSoUq1/c/cG2d08CXA7ZJCzheSG/svzGxw3NPau8zcRXG+DLYDoN3BTk9ZGBoViH6V8jY0B
	IlyUoTFTXMN9Yz2+MfnU3s5NUEmIttCWrQP4+0eg1RKS1fFdmwRYBOYqtSim4hNVKeaWe3IWaSJld
	ZZ3TBYvLAw3SEVcs4H1NojdAKbzK5UbAjW71wFd/tERHb9nQFHboB2e/v6am1luIs5Z8c4f0NfuHt
	vhQRXuHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEe7-00000008bVp-0sMT;
	Thu, 01 Oct 2026 11:08:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEe3-00000008bT8-1NAu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 11:08:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B1DB497;
	Thu,  1 Oct 2026 04:08:07 -0700 (PDT)
Received: from e142392.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1013B3F86F;
	Thu,  1 Oct 2026 04:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790852890; bh=q7s2uld8BJFJzSzmhmN8d0ghRTT8OCcocICutPF9nqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hq5bpPTtEKQ4oH74wkbbqCcSYHPb65lDqtpkvU/97+r7MAOvsxN53dmzRZ/TTyIi3
	 eevcgiTtDazbQKwDXokP1im/by5gmQWNdH+9ilLL2Af8tkHiAuk4eUjtEHw0AZUT71
	 hhKaxIS20mrynEhMYqvhqvI1lQXdEcRqhuGG2BYs=
From: =?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-efi@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [RFC 09/12] arm64: tlbid: Track the TLBI domain of a task
Date: Thu,  1 Oct 2026 12:06:52 +0100
Message-ID: <20261001110655.461473-10-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001110655.461473-1-kristina.martsenko@arm.com>
References: <20261001110655.461473-1-kristina.martsenko@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_040811_474077_25BAF4F0 
X-CRM114-Status: GOOD (  24.08  )
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

Maintain a bitmap of valid TLBI domains for each mm. A later patch will
issue TLBIs for an mm to one of the domains in its bitmap.

As a performance optimization, we want to avoid sending TLB
invalidations to CPUs that have never installed a particular mm, since
their TLBs can't contain the mm's PTEs. To achieve this, have each mm
contain a bitmap of valid TLBI domains. A domain is valid if it contains
all the CPUs that the mm has been installed on. Initially all domains
are valid. Whenever an mm is installed on a new CPU, its set of domains
is reduced (using a bitwise AND) to only include those domains that
contain the new CPU.

Use atomic operations to reduce the bitmap. In case two threads update
the bitmap concurrently, the result will be the same.

efi_mm is initialized very early, before TLBI domains are initialized,
so e.g. system_supports_tlbid() will return false. Just configure efi_mm
to use the largest domain in the system (containing all CPUs).

Note: The initial bitmap is all ones. If a TLBI were issued before the
mm is installed, then any domain could be selected, regardless of which
CPUs are in it. (The bits above the last valid domain will be ignored.)
This is fine, since at this point no TLBs actually need to be
invalidated, since the mm hasn't been installed anywhere yet.

Note: destroy_tlbid_context() doesn't need to check mm_is_efi() since
efi_mm is never freed.

Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
---
 arch/arm64/include/asm/mmu.h         | 11 ++++++
 arch/arm64/include/asm/mmu_context.h |  9 ++++-
 arch/arm64/mm/context.c              |  6 ++--
 arch/arm64/mm/tlbid.c                | 52 ++++++++++++++++++++++++++++
 4 files changed, 75 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index 5e1211c540ab..fc4e759f9f64 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -25,6 +25,7 @@ typedef struct {
 	void		*vdso;
 	unsigned long	flags;
 	u8		pkey_allocation_map;
+	atomic64_t	*tlbid_domains;
 } mm_context_t;
 
 /*
@@ -106,5 +107,15 @@ static inline void kpti_install_ng_mappings(void) {}
 
 extern bool page_alloc_available;
 
+#ifdef CONFIG_ARM64_TLBID
+int init_tlbid_context(struct mm_struct *mm);
+void destroy_tlbid_context(struct mm_struct *mm);
+void update_tlbid_domains(struct mm_struct *mm, unsigned int cpu);
+#else
+static inline int init_tlbid_context(struct mm_struct *mm) { return 0; }
+static inline void destroy_tlbid_context(struct mm_struct *mm) {}
+static inline void update_tlbid_domains(struct mm_struct *mm, unsigned int cpu) {}
+#endif
+
 #endif	/* !__ASSEMBLER__ */
 #endif
diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 803b68758152..5bf2d3f73e1c 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -21,6 +21,7 @@
 #include <asm/cpufeature.h>
 #include <asm/daifflags.h>
 #include <asm/gcs.h>
+#include <asm/mmu.h>
 #include <asm/proc-fns.h>
 #include <asm/cputype.h>
 #include <asm/sysreg.h>
@@ -172,7 +173,13 @@ init_new_context(struct task_struct *tsk, struct mm_struct *mm)
 	/* pkey 0 is the default, so always reserve it. */
 	mm->context.pkey_allocation_map = BIT(0);
 
-	return 0;
+	return init_tlbid_context(mm);
+}
+
+#define destroy_context(mm) destroy_context(mm)
+static inline void destroy_context(struct mm_struct *mm)
+{
+	destroy_tlbid_context(mm);
 }
 
 static inline void arch_dup_pkeys(struct mm_struct *oldmm,
diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index 0f4a28b87469..21146d57e8b7 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -13,6 +13,7 @@
 #include <linux/mm.h>
 
 #include <asm/cpufeature.h>
+#include <asm/mmu.h>
 #include <asm/mmu_context.h>
 #include <asm/smp.h>
 #include <asm/tlbflush.h>
@@ -215,7 +216,7 @@ static u64 new_context(struct mm_struct *mm)
 void check_and_switch_context(struct mm_struct *mm)
 {
 	unsigned long flags;
-	unsigned int cpu;
+	unsigned int cpu = smp_processor_id();
 	u64 asid, old_active_asid;
 
 	if (system_supports_cnp())
@@ -251,7 +252,6 @@ void check_and_switch_context(struct mm_struct *mm)
 		atomic64_set(&mm->context.id, asid);
 	}
 
-	cpu = smp_processor_id();
 	if (cpumask_test_and_clear_cpu(cpu, &tlb_flush_pending))
 		local_flush_tlb_all();
 
@@ -262,6 +262,8 @@ void check_and_switch_context(struct mm_struct *mm)
 
 	arm64_apply_bp_hardening();
 
+	update_tlbid_domains(mm, cpu);
+
 	/*
 	 * Defer TTBR0_EL1 setting for user threads to uaccess_enable() when
 	 * emulating PAN.
diff --git a/arch/arm64/mm/tlbid.c b/arch/arm64/mm/tlbid.c
index 0c26ace39592..b44fab2dca20 100644
--- a/arch/arm64/mm/tlbid.c
+++ b/arch/arm64/mm/tlbid.c
@@ -7,18 +7,70 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/atomic.h>
 #include <linux/bitops.h>
 #include <linux/bitmap.h>
+#include <linux/efi.h>
 #include <linux/jump_label.h>
+#include <linux/mm_types.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
 
+#include <asm/mmu.h>
+
 DEFINE_STATIC_KEY_FALSE(tlbid_enabled);
 
 static u16 *domain_ids;
 static unsigned long **cpu_domains;
 static int domain_count;
 
+void update_tlbid_domains(struct mm_struct *mm, unsigned int cpu)
+{
+	if (!system_supports_tlbid())
+		return;
+
+	for (int i = 0; i < BITS_TO_U64(domain_count); i++)
+		atomic64_and(cpu_domains[cpu][i], &mm->context.tlbid_domains[i]);
+}
+
+int init_tlbid_context(struct mm_struct *mm)
+{
+	bool is_efi = mm_is_efi(mm);
+	atomic64_t *domains;
+	int ndomains, nwords;
+
+	/* TLBI domain support not yet known at EFI init time */
+	if (!system_supports_tlbid() && !is_efi)
+		return 0;
+
+	ndomains = is_efi ? MAX_TLBI_DOMAINS : domain_count;
+	nwords = BITS_TO_U64(ndomains);
+	domains = kcalloc(nwords, sizeof(*domains), GFP_KERNEL);
+	if (!domains)
+		return -ENOMEM;
+
+	if (is_efi) {
+		/*
+		 * Use a safe domain since updates to domains would be lost if
+		 * efi_mm were installed before TLBID is enabled.
+		 */
+		atomic64_set(domains, 1);
+	} else {
+		for (int i = 0; i < nwords; i++)
+			atomic64_set(&domains[i], -1);
+	}
+
+	mm->context.tlbid_domains = domains;
+
+	return 0;
+}
+
+void destroy_tlbid_context(struct mm_struct *mm)
+{
+	if (system_supports_tlbid())
+		kfree(mm->context.tlbid_domains);
+}
+
 static int __init init_cpu_domain_bitmaps(struct tlbi_domain *domains)
 {
 	int cpu;
-- 
2.43.0


