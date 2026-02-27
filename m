Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC34EFEFB6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksVWQ1ZWHXJ73fAwFe1u5hfLOgELKdw0SQJbIT8MUXw=; b=Rn1kz2d4dK+zJP9Tg/xjw0V0vk
	9CddUMsOsEQsDXPH7GVDDRrKFfd35HkK7/8fV9AoOc5htY3K53J2KMb3v7gH8flAJzZfb9z9z3z2x
	bB5zGJ5ubybJ+NC5Kg39tCk7vGmvinnkruKo95wNqLgGnA85+/VSdujp2rVSmPX9ani78MY6KfRDr
	xoAawKYhrwv85dnB1x8sFGQheHQzKGUWcqvf6P92JxblJx5YLoFWbBD/tn9uSWdiqDmmEMNOtiv7k
	EkBnjk50MZTx2pqTefl0yEUk8audhBLiC3QOUyBBYnjQmJw0MIKoUTF7Mr1HC+niAZffdEwyQSY4b
	2kH5b8nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw24b-00000008qYq-41Ss;
	Fri, 27 Feb 2026 17:56:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw24X-00000008qV3-26ul
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 17:56:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19704176B;
	Fri, 27 Feb 2026 09:56:10 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2FBF3F73B;
	Fri, 27 Feb 2026 09:56:11 -0800 (PST)
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
	Yang Shi <yang@os.amperecomputing.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH v6 07/30] arm64: Reset POR_EL1 on exception entry
Date: Fri, 27 Feb 2026 17:54:55 +0000
Message-ID: <20260227175518.3728055-8-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260227175518.3728055-1-kevin.brodsky@arm.com>
References: <20260227175518.3728055-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_095617_635040_D1640FA1 
X-CRM114-Status: GOOD (  18.89  )
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

POR_EL1 will be modified, through the kpkeys framework, in order to
grant temporary RW access to certain keys. If an exception occurs
in the middle of a "critical section" where POR_EL1 is set to a
privileged value, it is preferable to reset it to its default value
upon taking the exception to minimise the amount of code running at
higher kpkeys level.

This patch implements the reset of POR_EL1 on exception entry,
storing the original value in a new pt_regs field and restoring on
exception return. To avoid an expensive ISB, the register is only
reset if the interrupted value isn't the default. No check is made
on the return path as an ISB occurs anyway as part of ERET.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/kpkeys.h | 10 ++++++++++
 arch/arm64/include/asm/por.h    |  4 ++++
 arch/arm64/include/asm/ptrace.h |  4 ++++
 arch/arm64/kernel/asm-offsets.c |  3 +++
 arch/arm64/kernel/entry.S       | 24 +++++++++++++++++++++++-
 5 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kpkeys.h b/arch/arm64/include/asm/kpkeys.h
index 3b0ab5e7dd22..79ae33388088 100644
--- a/arch/arm64/include/asm/kpkeys.h
+++ b/arch/arm64/include/asm/kpkeys.h
@@ -8,6 +8,14 @@
 
 #include <asm-generic/kpkeys.h>
 
+/*
+ * Equivalent to por_set_kpkeys_level(0, KPKEYS_LVL_DEFAULT), but can also be
+ * used in assembly.
+ */
+#define POR_EL1_INIT	POR_ELx_PERM_PREP(KPKEYS_PKEY_DEFAULT, POE_RWX)
+
+#ifndef __ASSEMBLY__
+
 static inline bool arch_kpkeys_enabled(void)
 {
 	return system_supports_poe();
@@ -46,4 +54,6 @@ static __always_inline void arch_kpkeys_restore_pkey_reg(u64 pkey_reg)
 
 #endif /* CONFIG_ARM64_POE */
 
+#endif	/* __ASSEMBLY__ */
+
 #endif	/* __ASM_KPKEYS_H */
diff --git a/arch/arm64/include/asm/por.h b/arch/arm64/include/asm/por.h
index bffb4d2b1246..58dce4b8021b 100644
--- a/arch/arm64/include/asm/por.h
+++ b/arch/arm64/include/asm/por.h
@@ -10,6 +10,8 @@
 
 #define POR_EL0_INIT	POR_ELx_PERM_PREP(0, POE_RWX)
 
+#ifndef __ASSEMBLY__
+
 static inline bool por_elx_allows_read(u64 por, u8 pkey)
 {
 	u8 perm = POR_ELx_PERM_GET(pkey, por);
@@ -38,4 +40,6 @@ static inline u64 por_elx_set_pkey_perms(u64 por, u8 pkey, u64 perms)
 	return (por & ~(POE_MASK << shift)) | (perms << shift);
 }
 
+#endif	/* __ASSEMBLY__ */
+
 #endif /* _ASM_ARM64_POR_H */
diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index 39582511ad72..1a258617ab89 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -166,6 +166,10 @@ struct pt_regs {
 	u64 orig_x0;
 	s32 syscallno;
 	u32 pmr;
+#ifdef CONFIG_ARM64_POE
+	u64 por_el1;
+	u64 __unused;
+#endif
 
 	u64 sdei_ttbr1;
 	struct frame_record_meta stackframe;
diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index b6367ff3a49c..30b4d0636f58 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -76,6 +76,9 @@ int main(void)
   DEFINE(S_SYSCALLNO,		offsetof(struct pt_regs, syscallno));
   DEFINE(S_SDEI_TTBR1,		offsetof(struct pt_regs, sdei_ttbr1));
   DEFINE(S_PMR,			offsetof(struct pt_regs, pmr));
+#ifdef CONFIG_ARM64_POE
+  DEFINE(S_POR_EL1,		offsetof(struct pt_regs, por_el1));
+#endif
   DEFINE(S_STACKFRAME,		offsetof(struct pt_regs, stackframe));
   DEFINE(S_STACKFRAME_TYPE,	offsetof(struct pt_regs, stackframe.type));
   DEFINE(PT_REGS_SIZE,		sizeof(struct pt_regs));
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index f8018b5c1f9a..0dd6f7fbb669 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -20,6 +20,7 @@
 #include <asm/errno.h>
 #include <asm/esr.h>
 #include <asm/irq.h>
+#include <asm/kpkeys.h>
 #include <asm/memory.h>
 #include <asm/mmu.h>
 #include <asm/processor.h>
@@ -277,6 +278,19 @@ alternative_else_nop_endif
 	.else
 	add	x21, sp, #PT_REGS_SIZE
 	get_current_task tsk
+#ifdef CONFIG_ARM64_POE
+alternative_if_not ARM64_HAS_S1POE
+	b	1f
+alternative_else_nop_endif
+	mrs_s	x0, SYS_POR_EL1
+	str	x0, [sp, #S_POR_EL1]
+	mov	x1, #POR_EL1_INIT
+	cmp	x0, x1
+	b.eq	1f
+	msr_s	SYS_POR_EL1, x1
+	isb
+1:
+#endif /* CONFIG_ARM64_POE */
 	.endif /* \el == 0 */
 	mrs	x22, elr_el1
 	mrs	x23, spsr_el1
@@ -407,7 +421,15 @@ alternative_else_nop_endif
 	mte_set_user_gcr tsk, x0, x1
 
 	apply_ssbd 0, x0, x1
-	.endif
+	.else
+#ifdef CONFIG_ARM64_POE
+alternative_if ARM64_HAS_S1POE
+	ldr	x0, [sp, #S_POR_EL1]
+	msr_s	SYS_POR_EL1, x0
+	/* No explicit ISB; we rely on ERET */
+alternative_else_nop_endif
+#endif /* CONFIG_ARM64_POE */
+	.endif /* \el == 0 */
 
 	msr	elr_el1, x21			// set up the return data
 	msr	spsr_el1, x22
-- 
2.51.2


