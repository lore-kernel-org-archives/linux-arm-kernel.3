Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDB0C9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nrEq0rIrDNyRzTuLH6wNLAsCel8gddLV9sUCqPcYTNM=; b=XndVWgq6S+icUN
	9yb2FbI0hkD1xoAQnDukOk3+sMHVHuT09/g8Sbc/aP7Lqdb3VttoekwHoJneHr4G/aDuHw+XwG84I
	V10SZrT6mntKTv8snGo2H8+HBeN1sy3nRAhkdp138xT+FGeoCd8OTxijJpbP0rrsTjXvxMfKuKXRt
	io81+N+cL0mJOuvzr0zOyUuOBkDJYs6/XoJwUJQFdBcai6XHvfYo/w/zpAjmI+BEBFrCi0bDhCrvy
	7eAaUjrqrN9MPwCUkb9GpP2YSg5dXRM/DnB+LaEVvqZvodOsqmr0Cb7c/5fEthyNQ2bhm8L+D/1Mb
	MtOfnnqfR4pEtnsGTv5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBS0-00000000eeA-2HBJ;
	Mon, 28 Sep 2026 13:31:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBRj-00000000eY7-0FCx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 13:31:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2FBD1655;
	Mon, 28 Sep 2026 06:31:02 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.11.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2E3533F763;
	Mon, 28 Sep 2026 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790602266; bh=bvofNTmP3TQhTjJaHxA/cpJva+VT5zF7o+6lvtGusZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VpcDnsLzpMfMaLIwePw8vQEERpPy1Fys3e5z3i0CPnquuO12EjYOIIIwNHgErnuv7
	 D5gsl/ghZ8Vw3Cjs4n+Bpu+HM7swXhx8bR2VWCbclBOzlf0tVWB4XBbFtM1iOzFljx
	 5fSuf3jjuMu7+o7oFg8j5Q3DFNRHRIDzqDqD4+Ig=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/6] arm64: use alternatie callback to patch TPIDR_EL1 accesses
Date: Mon, 28 Sep 2026 14:30:34 +0100
Message-ID: <20260928133034.243541-7-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928133034.243541-1-ada.coupriediaz@arm.com>
References: <20260928133034.243541-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_063107_200114_42E3BEB9 
X-CRM114-Status: GOOD (  14.90  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Barry Song <baohua@kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Shanker Donthineni <sdonthineni@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, Oliver Upton <oupton@kernel.org>, James Morse <james.morse@arm.com>, Andre Przywara <andre.przywara@arm.com>, Tejun Heo <tj@kernel.org>, Lucas Wei <lucaswei@google.com>, Will Deacon <will@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

ARM64_HAS_VIRT_HOST_EXTN represents about 3k alternatives, most of them
are found in per_cpu calls switching between TPIDR_EL1 and TPIDR_EL2.

Replace the current alternative instructions with a callback that
changes the target system register, saving a potential 10kB.

`aarch64_insn_extract_system_reg()` is safe to use as it was made
`noinstr` in the previous patch.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/alternative.h |  3 +++
 arch/arm64/include/asm/assembler.h   | 12 ++++--------
 arch/arm64/include/asm/percpu.h      | 12 ++++++------
 arch/arm64/kernel/alternative.c      | 25 +++++++++++++++++++++++++
 arch/arm64/kernel/image-vars.h       |  1 +
 5 files changed, 39 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/alternative.h b/arch/arm64/include/asm/alternative.h
index 621aa8550174f..e3842a28f88ba 100644
--- a/arch/arm64/include/asm/alternative.h
+++ b/arch/arm64/include/asm/alternative.h
@@ -37,5 +37,8 @@ static inline int apply_alternatives_module(void *start, size_t length)
 void alt_cb_patch_nops(struct alt_instr *alt, __le32 *origptr,
 		       __le32 *updptr, int nr_inst);
 
+void alt_cb_patch_tpidr_el2(struct alt_instr *alt, __le32 *origptr,
+			    __le32 *updptr, int nr_inst);
+
 #endif /* __ASSEMBLER__ */
 #endif /* __ASM_ALTERNATIVE_H */
diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index 0b58b550e8dce..6cbdfefe45382 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -210,19 +210,15 @@ lr	.req	x30		// link register
 	.endm
 #else
 	.macro	get_this_cpu_offset, dst
-alternative_if_not ARM64_HAS_VIRT_HOST_EXTN
+alternative_cb ARM64_HAS_VIRT_HOST_EXTN, alt_cb_patch_tpidr_el2
 	mrs	\dst, tpidr_el1
-alternative_else
-	mrs	\dst, tpidr_el2
-alternative_endif
+alternative_cb_end
 	.endm
 
 	.macro	set_this_cpu_offset, src
-alternative_if_not ARM64_HAS_VIRT_HOST_EXTN
+alternative_cb ARM64_HAS_VIRT_HOST_EXTN, alt_cb_patch_tpidr_el2
 	msr	tpidr_el1, \src
-alternative_else
-	msr	tpidr_el2, \src
-alternative_endif
+alternative_cb_end
 	.endm
 #endif
 
diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 8cf4068ce1b56..6999ae86a7e9f 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -14,9 +14,9 @@
 
 static inline void set_my_cpu_offset(unsigned long off)
 {
-	asm volatile(ALTERNATIVE("msr tpidr_el1, %0",
-				 "msr tpidr_el2, %0",
-				 ARM64_HAS_VIRT_HOST_EXTN)
+	asm volatile(ALTERNATIVE_CB("msr tpidr_el1, %0",
+				    ARM64_HAS_VIRT_HOST_EXTN,
+				    alt_cb_patch_tpidr_el2)
 			:: "r" (off) : "memory");
 }
 
@@ -37,9 +37,9 @@ static inline unsigned long __kern_my_cpu_offset(void)
 	 * We want to allow caching the value, so avoid using volatile and
 	 * instead use a fake stack read to hazard against barrier().
 	 */
-	asm(ALTERNATIVE("mrs %0, tpidr_el1",
-			"mrs %0, tpidr_el2",
-			ARM64_HAS_VIRT_HOST_EXTN)
+	asm(ALTERNATIVE_CB("mrs %0, tpidr_el1",
+			   ARM64_HAS_VIRT_HOST_EXTN,
+			   alt_cb_patch_tpidr_el2)
 		: "=r" (off) :
 		"Q" (*(const unsigned long *)current_stack_pointer));
 
diff --git a/arch/arm64/kernel/alternative.c b/arch/arm64/kernel/alternative.c
index f5ec7e7c1d3fd..d853eda04ed23 100644
--- a/arch/arm64/kernel/alternative.c
+++ b/arch/arm64/kernel/alternative.c
@@ -303,3 +303,28 @@ noinstr void alt_cb_patch_nops(struct alt_instr *alt, __le32 *origptr,
 		updptr[i] = cpu_to_le32(aarch64_insn_gen_nop());
 }
 EXPORT_SYMBOL(alt_cb_patch_nops);
+
+/*
+ * Patch MSR and MRS instructions to switch from TPIDR_EL1 to TPIDR_EL2.
+ * MSR (register) and MRS have the same target system register encoding,
+ * so we can handle both here.
+ */
+noinstr void alt_cb_patch_tpidr_el2(struct alt_instr *alt, __le32 *origptr,
+				    __le32 *updptr, int nr_inst)
+{
+	u32 orinst, altinst;
+
+	BUG_ON(nr_inst != 1);
+
+	orinst = le32_to_cpu(origptr[0]);
+	BUG_ON(!aarch64_insn_is_msr_reg(orinst) &&
+	       !aarch64_insn_is_mrs(orinst));
+	BUG_ON(aarch64_insn_extract_system_reg(orinst) !=
+	       AARCH64_INSN_SYSREG_TPIDR_EL1);
+
+	altinst = orinst & ~AARCH64_INSN_SYSREG_MASK;
+	altinst |= AARCH64_INSN_SYSREG_TPIDR_EL2 << AARCH64_INSN_SYSREG_OFFSET;
+
+	updptr[0] = cpu_to_le32(altinst);
+}
+EXPORT_SYMBOL(alt_cb_patch_tpidr_el2);
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 615b77ef403fe..49d9984d7cd89 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -96,6 +96,7 @@ KVM_NVHE_ALIAS(kvm_compute_ich_hcr_trap_bits);
 KVM_NVHE_ALIAS(kvm_patch_ich_vtr_el2);
 KVM_NVHE_ALIAS(__io_nvidia_olympus_patch_dmb);
 KVM_NVHE_ALIAS(__io_arm_a57_patch_ladr);
+KVM_NVHE_ALIAS(alt_cb_patch_tpidr_el2);
 
 /* Global kernel state accessed by nVHE hyp code. */
 KVM_NVHE_ALIAS(kvm_vgic_global_state);
-- 
2.43.0


