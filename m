Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D63FD0D151
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 18:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVnFyWI3XmBy2ECGm4gBncQSZeXqWuMVRZiY/Le/cAk=; b=jzwsvED3f5BdIDpA0ERYf0pojj
	NnMKQ0+V1wOICAUe9QeS8BztK1/JHx59/uGi3SYqDP8KvRALywrqbwIO9tjD63BWmDzSr+eZg0heo
	HAq5mbeHTEhygiej+aUGl//AX9Jr28VxUR7btCnjTey9Nec/v+QzK2AmPyKwO+pGuhR5l5jwmbuXJ
	deH0+IzU7+FlITca70iYs+dPBf4LZf9Uglp42bobM5DNZaU/SCk+kxFvch3nc2VmlSpQdF+had9l7
	TzA3Nt8l8r2puSs1nNKaL+oYSBTbpxnqsz/wD4rqNj1P+SQ8RbdWfixfp/7TDIWnQ7E0XvPqJq0LL
	MQBi7D8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXw7-0000000FQI1-02vA;
	Wed, 07 Jan 2026 18:07:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXw5-0000000FQH6-0n2a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 18:07:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A89B6000A;
	Wed,  7 Jan 2026 18:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3965C4CEF7;
	Wed,  7 Jan 2026 18:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767809228;
	bh=oNcSmCCo6OmuWND+0r77rlCdula2pNWul2/J8cKG+ds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JNQLSvawA48QJAdE66h/J77r8y5wuM22zBMpOGo4VoIQARbwom8bEZLo2GzzrVqdX
	 CeF+DN9ZSqa8rQHfnT+DXHc03SShDMl97XfHWY37ANuSyBW+I13QkO3J+ZBZqITcjj
	 Dg/JQikoT7llNwQ43bTBDGWffrp0Yt/ECuJiCFZfcGqadeZCDlyp6YQumF/fAljAc4
	 wE/PiU8a4qkYtsDlQo/bw+6XBLqfpZLZyRDBKxYWMzQZ7bldI44S5qhDWGJ2c4BkVp
	 bl7wTMcDGEccYw9cu83DzCt81w5v2Gv6s9lz5JdtZh/9x/AN5wnG3THyv7tTny57DO
	 Z37yhLUIjwGKQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vdXw1-00000000A9B-2sao;
	Wed, 07 Jan 2026 18:07:05 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 1/3] arm64: Unconditionally enable LSE support
Date: Wed,  7 Jan 2026 18:06:59 +0000
Message-ID: <20260107180701.2858276-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107180701.2858276-1-maz@kernel.org>
References: <20260107180701.2858276-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

LSE atomics have been in the architecture since ARMv8.1 (released in
2014), and are hopefully supported by all modern toolchains.

Drop the optional nature of LSE support in the kernel, and always
compile the support in, as this really is very little code. LL/SC
still is the default, and the switch to LSE is done dynamically.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/Kconfig             | 16 ----------------
 arch/arm64/include/asm/insn.h  | 23 -----------------------
 arch/arm64/include/asm/lse.h   |  9 ---------
 arch/arm64/kernel/cpufeature.c |  2 --
 arch/arm64/kvm/at.c            |  7 -------
 arch/arm64/lib/insn.c          |  2 --
 arch/arm64/net/bpf_jit_comp.c  |  7 -------
 7 files changed, 66 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 93173f0a09c7d..b6f57cc1e4df8 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1873,22 +1873,6 @@ config ARM64_PAN
 	  The feature is detected at runtime, and will remain as a 'nop'
 	  instruction if the cpu does not implement the feature.
 
-config ARM64_LSE_ATOMICS
-	bool
-	default ARM64_USE_LSE_ATOMICS
-
-config ARM64_USE_LSE_ATOMICS
-	bool "Atomic instructions"
-	default y
-	help
-	  As part of the Large System Extensions, ARMv8.1 introduces new
-	  atomic instructions that are designed specifically to scale in
-	  very large systems.
-
-	  Say Y here to make use of these instructions for the in-kernel
-	  atomic routines. This incurs a small overhead on CPUs that do
-	  not support these instructions.
-
 endmenu # "ARMv8.1 architectural features"
 
 menu "ARMv8.2 architectural features"
diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index e1d30ba99d016..f463a654a2bbd 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -671,7 +671,6 @@ u32 aarch64_insn_gen_extr(enum aarch64_insn_variant variant,
 			  enum aarch64_insn_register Rn,
 			  enum aarch64_insn_register Rd,
 			  u8 lsb);
-#ifdef CONFIG_ARM64_LSE_ATOMICS
 u32 aarch64_insn_gen_atomic_ld_op(enum aarch64_insn_register result,
 				  enum aarch64_insn_register address,
 				  enum aarch64_insn_register value,
@@ -683,28 +682,6 @@ u32 aarch64_insn_gen_cas(enum aarch64_insn_register result,
 			 enum aarch64_insn_register value,
 			 enum aarch64_insn_size_type size,
 			 enum aarch64_insn_mem_order_type order);
-#else
-static inline
-u32 aarch64_insn_gen_atomic_ld_op(enum aarch64_insn_register result,
-				  enum aarch64_insn_register address,
-				  enum aarch64_insn_register value,
-				  enum aarch64_insn_size_type size,
-				  enum aarch64_insn_mem_atomic_op op,
-				  enum aarch64_insn_mem_order_type order)
-{
-	return AARCH64_BREAK_FAULT;
-}
-
-static inline
-u32 aarch64_insn_gen_cas(enum aarch64_insn_register result,
-			 enum aarch64_insn_register address,
-			 enum aarch64_insn_register value,
-			 enum aarch64_insn_size_type size,
-			 enum aarch64_insn_mem_order_type order)
-{
-	return AARCH64_BREAK_FAULT;
-}
-#endif
 u32 aarch64_insn_gen_dmb(enum aarch64_insn_mb_type type);
 u32 aarch64_insn_gen_dsb(enum aarch64_insn_mb_type type);
 u32 aarch64_insn_gen_mrs(enum aarch64_insn_register result,
diff --git a/arch/arm64/include/asm/lse.h b/arch/arm64/include/asm/lse.h
index 3129a5819d0e0..1e77c45bb0a83 100644
--- a/arch/arm64/include/asm/lse.h
+++ b/arch/arm64/include/asm/lse.h
@@ -4,8 +4,6 @@
 
 #include <asm/atomic_ll_sc.h>
 
-#ifdef CONFIG_ARM64_LSE_ATOMICS
-
 #define __LSE_PREAMBLE	".arch_extension lse\n"
 
 #include <linux/compiler_types.h>
@@ -27,11 +25,4 @@
 #define ARM64_LSE_ATOMIC_INSN(llsc, lse)				\
 	ALTERNATIVE(llsc, __LSE_PREAMBLE lse, ARM64_HAS_LSE_ATOMICS)
 
-#else	/* CONFIG_ARM64_LSE_ATOMICS */
-
-#define __lse_ll_sc_body(op, ...)		__ll_sc_##op(__VA_ARGS__)
-
-#define ARM64_LSE_ATOMIC_INSN(llsc, lse)	llsc
-
-#endif	/* CONFIG_ARM64_LSE_ATOMICS */
 #endif	/* __ASM_LSE_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index c840a93b9ef95..547ccf28f2893 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2560,7 +2560,6 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, PAN, PAN3)
 	},
 #endif /* CONFIG_ARM64_EPAN */
-#ifdef CONFIG_ARM64_LSE_ATOMICS
 	{
 		.desc = "LSE atomic instructions",
 		.capability = ARM64_HAS_LSE_ATOMICS,
@@ -2568,7 +2567,6 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		ARM64_CPUID_FIELDS(ID_AA64ISAR0_EL1, ATOMIC, IMP)
 	},
-#endif /* CONFIG_ARM64_LSE_ATOMICS */
 	{
 		.desc = "Virtualization Host Extensions",
 		.capability = ARM64_HAS_VIRT_HOST_EXTN,
diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 53bf70126f81d..6cbcec041a9dd 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -1700,7 +1700,6 @@ int __kvm_find_s1_desc_level(struct kvm_vcpu *vcpu, u64 va, u64 ipa, int *level)
 	}
 }
 
-#ifdef CONFIG_ARM64_LSE_ATOMICS
 static int __lse_swap_desc(u64 __user *ptep, u64 old, u64 new)
 {
 	u64 tmp = old;
@@ -1725,12 +1724,6 @@ static int __lse_swap_desc(u64 __user *ptep, u64 old, u64 new)
 
 	return ret;
 }
-#else
-static int __lse_swap_desc(u64 __user *ptep, u64 old, u64 new)
-{
-	return -EINVAL;
-}
-#endif
 
 static int __llsc_swap_desc(u64 __user *ptep, u64 old, u64 new)
 {
diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
index 4e298baddc2e5..cc5b40917d0dd 100644
--- a/arch/arm64/lib/insn.c
+++ b/arch/arm64/lib/insn.c
@@ -611,7 +611,6 @@ u32 aarch64_insn_gen_load_store_ex(enum aarch64_insn_register reg,
 					    state);
 }
 
-#ifdef CONFIG_ARM64_LSE_ATOMICS
 static u32 aarch64_insn_encode_ldst_order(enum aarch64_insn_mem_order_type type,
 					  u32 insn)
 {
@@ -755,7 +754,6 @@ u32 aarch64_insn_gen_cas(enum aarch64_insn_register result,
 	return aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RS, insn,
 					    value);
 }
-#endif
 
 u32 aarch64_insn_gen_add_sub_imm(enum aarch64_insn_register dst,
 				 enum aarch64_insn_register src,
diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index b6eb7a465ad24..5ce82edc508e4 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -776,7 +776,6 @@ static int emit_atomic_ld_st(const struct bpf_insn *insn, struct jit_ctx *ctx)
 	return 0;
 }
 
-#ifdef CONFIG_ARM64_LSE_ATOMICS
 static int emit_lse_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
 {
 	const u8 code = insn->code;
@@ -843,12 +842,6 @@ static int emit_lse_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
 
 	return 0;
 }
-#else
-static inline int emit_lse_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
-{
-	return -EINVAL;
-}
-#endif
 
 static int emit_ll_sc_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
 {
-- 
2.47.3


