Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEFCC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 14:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOMMTfrI1Im8YLBftOATQW5sMNJc4vDknPj9SCkoCFc=; b=hv0nU7YGyLyA7M8WSsKt4r+bLh
	iV8R9Yp/IRckTIpKLewCaIqkWYxm6Zb0RsY2gpcLUXx1+EBEHA4mhWMaVF30y3RPrMAFePpwapDTe
	CTud3zIBtBiVvIla1BOoCzpA/+WNkialTonZm8vYN4OXOwkdIR+ksVd+lQGUNqGA42hah4xk2avYM
	ivUKFuYFV/KXJVbvd6yZ9aCDCFSevF5K64smjky10e5DTZ0pslujo2SspCVQ3ZPhdQ/1XXcAF9Hlp
	SkOTre8hakHmx+9LZfSk7tOVSbDeYZYAvlJ6XnxcsM2qu0hJv3ICJMnX0RwP8GXnCvG55XJiAgJFX
	ljqAjWRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn3T-0000000E9Z9-1hMS;
	Tue, 11 Aug 2026 14:02:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn3P-0000000E9X5-1WtX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 14:02:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B581D60A7B;
	Tue, 11 Aug 2026 14:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 146541F000E9;
	Tue, 11 Aug 2026 14:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786456926;
	bh=IOMMTfrI1Im8YLBftOATQW5sMNJc4vDknPj9SCkoCFc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZMmO3AmwDvZNHRehGl/JK1pCB+T0/Z6bUozWOk0S6XK9TZ3mbhnjsz2ki9KjObVEu
	 LPQH7KJy6D4TIH1mlT/MgYdphvbfVSZQS3MKhie8jQZldJavprXPAOh5yC29zdDMUm
	 hE7LWVVYwo5CYvQqPprVMijvenvpq2tKLjyqGu2QWnOQ43+GQYCSRVJ2d3Zj9ln9w4
	 LD7e2GNBDoNwxN9JP6Fv6/W6jpmRbvgIZONsi7Psiv1/esUUd4WmENoL/lYdcnDFL9
	 KSOvt/O9exQYo6VdxB29JH5foXhu+WEVbaACNg+Rf13v1KdcbI6K4BVz6/U0PiOs9S
	 ssebkQQKd0Wew==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 09/12] arm64: Remove all usage of CONFIG_CPU_BIG_ENDIAN
Date: Tue, 11 Aug 2026 15:01:28 +0100
Message-ID: <20260811140132.22778-10-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260811140132.22778-1-will@kernel.org>
References: <20260811140132.22778-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Big-endian support on arm64 depends on BROKEN. In preparation for
removing the dead code altogether, remove all usage of
CONFIG_CPU_BIG_ENDIAN from the arm64 kernel port.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/processor.h   |  2 --
 arch/arm64/include/asm/ptrace.h      |  6 ----
 arch/arm64/include/asm/sysreg.h      | 50 ++++++++--------------------
 arch/arm64/include/asm/thread_info.h |  5 ---
 arch/arm64/kernel/fpsimd.c           | 21 ++----------
 arch/arm64/kernel/image.h            | 18 ++--------
 arch/arm64/kernel/kexec_image.c      |  5 ++-
 arch/arm64/kernel/kgdb.c             |  3 --
 arch/arm64/kernel/ptrace.c           |  8 ++---
 arch/arm64/kernel/signal32.c         |  3 --
 arch/arm64/kernel/sys32.c            |  5 ---
 11 files changed, 22 insertions(+), 104 deletions(-)

diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index c2a627f39314..19a81f8d85a7 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -351,8 +351,6 @@ static inline void compat_start_thread(struct pt_regs *regs, unsigned long pc,
 	unsigned long pstate = PSR_AA32_MODE_USR;
 	if (pc & 1)
 		pstate |= PSR_AA32_T_BIT;
-	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
-		pstate |= PSR_AA32_E_BIT;
 
 	start_thread_common(regs, pc, pstate);
 	spectre_v4_enable_task_mitigation(current);
diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index 39582511ad72..4722201403ea 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -68,12 +68,6 @@
 #define PSR_AA32_IT_MASK	0x0600fc00	/* If-Then execution state mask */
 #define PSR_AA32_GE_MASK	0x000f0000
 
-#ifdef CONFIG_CPU_BIG_ENDIAN
-#define PSR_AA32_ENDSTATE	PSR_AA32_E_BIT
-#else
-#define PSR_AA32_ENDSTATE	0
-#endif
-
 /* AArch32 CPSR bits, as seen in AArch32 */
 #define COMPAT_PSR_DIT_BIT	0x00200000
 
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 7aa08d59d494..f97c60b5dfca 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -62,19 +62,10 @@
 
 #else  /* CONFIG_BROKEN_GAS_INST */
 
-#ifndef CONFIG_CPU_BIG_ENDIAN
-#define __INSTR_BSWAP(x)		(x)
-#else  /* CONFIG_CPU_BIG_ENDIAN */
-#define __INSTR_BSWAP(x)		((((x) << 24) & 0xff000000)	| \
-					 (((x) <<  8) & 0x00ff0000)	| \
-					 (((x) >>  8) & 0x0000ff00)	| \
-					 (((x) >> 24) & 0x000000ff))
-#endif	/* CONFIG_CPU_BIG_ENDIAN */
-
 #ifdef __ASSEMBLER__
-#define __emit_inst(x)			.long __INSTR_BSWAP(x)
+#define __emit_inst(x)			.long (x)
 #else  /* __ASSEMBLER__ */
-#define __emit_inst(x)			".long " __stringify(__INSTR_BSWAP(x)) "\n\t"
+#define __emit_inst(x)			".long " __stringify(x) "\n\t"
 #endif	/* __ASSEMBLER__ */
 
 #endif	/* CONFIG_BROKEN_GAS_INST */
@@ -835,39 +826,26 @@
 #define SCTLR_ELx_A	 (BIT(1))
 #define SCTLR_ELx_M	 (BIT(0))
 
-#ifdef CONFIG_CPU_BIG_ENDIAN
-#define ENDIAN_SET_EL2		SCTLR_ELx_EE
-#else
-#define ENDIAN_SET_EL2		0
-#endif
-
 #define INIT_SCTLR_EL2_MMU_ON						\
 	(SCTLR_ELx_M  | SCTLR_ELx_C | SCTLR_ELx_SA | SCTLR_ELx_I |	\
-	 SCTLR_ELx_IESB | SCTLR_ELx_WXN | ENDIAN_SET_EL2 |		\
-	 SCTLR_ELx_ITFSB | SCTLR_ELx_EIS | SCTLR_ELx_EOS | SCTLR_EL2_RES1)
+	 SCTLR_ELx_IESB | SCTLR_ELx_WXN | SCTLR_ELx_ITFSB |		\
+	 SCTLR_ELx_EIS | SCTLR_ELx_EOS | SCTLR_EL2_RES1)
 
-#define INIT_SCTLR_EL2_MMU_OFF \
-	(SCTLR_EL2_RES1 | ENDIAN_SET_EL2)
+#define INIT_SCTLR_EL2_MMU_OFF	(SCTLR_EL2_RES1)
 
 /* SCTLR_EL1 specific flags. */
-#ifdef CONFIG_CPU_BIG_ENDIAN
-#define ENDIAN_SET_EL1		(SCTLR_EL1_E0E | SCTLR_ELx_EE)
-#else
-#define ENDIAN_SET_EL1		0
-#endif
-
 #define INIT_SCTLR_EL1_MMU_OFF \
-	(ENDIAN_SET_EL1 | SCTLR_EL1_LSMAOE | SCTLR_EL1_nTLSMD | \
-	 SCTLR_EL1_EIS  | SCTLR_EL1_TSCXT  | SCTLR_EL1_EOS)
+	(SCTLR_EL1_LSMAOE | SCTLR_EL1_nTLSMD | SCTLR_EL1_EIS  |		\
+	 SCTLR_EL1_TSCXT  | SCTLR_EL1_EOS)
 
 #define INIT_SCTLR_EL1_MMU_ON \
-	(SCTLR_ELx_M      | SCTLR_ELx_C      | SCTLR_ELx_SA    | \
-	 SCTLR_EL1_SA0    | SCTLR_EL1_SED    | SCTLR_ELx_I     | \
-	 SCTLR_EL1_DZE    | SCTLR_EL1_UCT    | SCTLR_EL1_nTWE  | \
-	 SCTLR_ELx_IESB   | SCTLR_EL1_SPAN   | SCTLR_ELx_ITFSB | \
-	 ENDIAN_SET_EL1   | SCTLR_EL1_UCI    | SCTLR_EL1_EPAN  | \
-	 SCTLR_EL1_LSMAOE | SCTLR_EL1_nTLSMD | SCTLR_EL1_EIS   | \
-	 SCTLR_EL1_TSCXT  | SCTLR_EL1_EOS)
+	(SCTLR_ELx_M      | SCTLR_ELx_C      | SCTLR_ELx_SA     | \
+	 SCTLR_EL1_SA0    | SCTLR_EL1_SED    | SCTLR_ELx_I      | \
+	 SCTLR_EL1_DZE    | SCTLR_EL1_UCT    | SCTLR_EL1_nTWE   | \
+	 SCTLR_ELx_IESB   | SCTLR_EL1_SPAN   | SCTLR_ELx_ITFSB  | \
+	 SCTLR_EL1_UCI    | SCTLR_EL1_EPAN   | SCTLR_EL1_LSMAOE | \
+	 SCTLR_EL1_nTLSMD | SCTLR_EL1_EIS    | SCTLR_EL1_TSCXT  | \
+	 SCTLR_EL1_EOS)
 
 /* MAIR_ELx memory attributes (used by Linux) */
 #define MAIR_ATTR_DEVICE_nGnRnE		UL(0x00)
diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index 5d7fe3e153c8..161b91762e93 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -29,13 +29,8 @@ struct thread_info {
 	union {
 		u64		preempt_count;	/* 0 => preemptible, <0 => bug */
 		struct {
-#ifdef CONFIG_CPU_BIG_ENDIAN
-			u32	need_resched;
-			u32	count;
-#else
 			u32	count;
 			u32	need_resched;
-#endif
 		} preempt;
 	};
 #ifdef CONFIG_SHADOW_CALL_STACK
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e7f1682a3059..65e7147067aa 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -621,23 +621,6 @@ static int __init sme_sysctl_init(void) { return 0; }
 #define ZREG(sve_state, vq, n) ((char *)(sve_state) +		\
 	(SVE_SIG_ZREG_OFFSET(vq, n) - SVE_SIG_REGS_OFFSET))
 
-#ifdef CONFIG_CPU_BIG_ENDIAN
-static __uint128_t arm64_cpu_to_le128(__uint128_t x)
-{
-	u64 a = swab64(x);
-	u64 b = swab64(x >> 64);
-
-	return ((__uint128_t)a << 64) | b;
-}
-#else
-static __uint128_t arm64_cpu_to_le128(__uint128_t x)
-{
-	return x;
-}
-#endif
-
-#define arm64_le128_to_cpu(x) arm64_cpu_to_le128(x)
-
 static void __fpsimd_to_sve(struct arm64_sve_state *sst,
 			    struct user_fpsimd_state const *fst,
 			    unsigned int vq)
@@ -647,7 +630,7 @@ static void __fpsimd_to_sve(struct arm64_sve_state *sst,
 
 	for (i = 0; i < SVE_NUM_ZREGS; ++i) {
 		p = (__uint128_t *)ZREG(sst, vq, i);
-		*p = arm64_cpu_to_le128(fst->vregs[i]);
+		*p = fst->vregs[i];
 	}
 }
 
@@ -702,7 +685,7 @@ static inline void sve_to_fpsimd(struct task_struct *task)
 	vq = sve_vq_from_vl(vl);
 	for (i = 0; i < SVE_NUM_ZREGS; ++i) {
 		p = (__uint128_t const *)ZREG(sst, vq, i);
-		fst->vregs[i] = arm64_le128_to_cpu(*p);
+		fst->vregs[i] = *p;
 	}
 }
 
diff --git a/arch/arm64/kernel/image.h b/arch/arm64/kernel/image.h
index 7bc3ba897901..5c10ca773363 100644
--- a/arch/arm64/kernel/image.h
+++ b/arch/arm64/kernel/image.h
@@ -24,28 +24,14 @@
  * when PIE is in effect. So we need to split them up in 32-bit high and low
  * words.
  */
-#ifdef CONFIG_CPU_BIG_ENDIAN
-#define DATA_LE32(data)				\
-	((((data) & 0x000000ff) << 24) |	\
-	 (((data) & 0x0000ff00) << 8)  |	\
-	 (((data) & 0x00ff0000) >> 8)  |	\
-	 (((data) & 0xff000000) >> 24))
-#else
-#define DATA_LE32(data) ((data) & 0xffffffff)
-#endif
-
 #define DEFINE_IMAGE_LE64(sym, data)				\
-	sym##_lo32 = DATA_LE32((data) & 0xffffffff);		\
-	sym##_hi32 = DATA_LE32((data) >> 32)
+	sym##_lo32 = (data) & 0xffffffff;			\
+	sym##_hi32 = (data) >> 32
 
 #define __HEAD_FLAG(field)	(__HEAD_FLAG_##field << \
 					ARM64_IMAGE_FLAG_##field##_SHIFT)
 
-#ifdef CONFIG_CPU_BIG_ENDIAN
-#define __HEAD_FLAG_BE		ARM64_IMAGE_FLAG_BE
-#else
 #define __HEAD_FLAG_BE		ARM64_IMAGE_FLAG_LE
-#endif
 
 #define __HEAD_FLAG_PAGE_SIZE	((PAGE_SHIFT - 10) / 2)
 
diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
index b70f4df15a1a..b8d0fb0a9daf 100644
--- a/arch/arm64/kernel/kexec_image.c
+++ b/arch/arm64/kernel/kexec_image.c
@@ -40,7 +40,7 @@ static void *image_load(struct kimage *image,
 {
 	struct arm64_image_header *h;
 	u64 flags, value;
-	bool be_image, be_kernel;
+	bool be_image;
 	struct kexec_buf kbuf = {};
 	unsigned long text_offset, kernel_segment_number;
 	struct kexec_segment *kernel_segment;
@@ -58,8 +58,7 @@ static void *image_load(struct kimage *image,
 	/* Check cpu features */
 	flags = le64_to_cpu(h->flags);
 	be_image = arm64_image_flag_field(flags, ARM64_IMAGE_FLAG_BE);
-	be_kernel = IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
-	if ((be_image != be_kernel) && !system_supports_mixed_endian())
+	if (be_image && !system_supports_mixed_endian())
 		return ERR_PTR(-EINVAL);
 
 	value = arm64_image_flag_field(flags, ARM64_IMAGE_FLAG_PAGE_SIZE);
diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
index 968324a79a89..41eb34c50721 100644
--- a/arch/arm64/kernel/kgdb.c
+++ b/arch/arm64/kernel/kgdb.c
@@ -61,9 +61,6 @@ struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
 	 * detail.
 	 */
 	{ "pstate", 4, offsetof(struct pt_regs, pstate)
-#ifdef CONFIG_CPU_BIG_ENDIAN
-							+ 4
-#endif
 	},
 	{ "v0", 16, -1 },
 	{ "v1", 16, -1 },
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 4d08598e2891..2f8663038c22 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2467,12 +2467,8 @@ static int valid_compat_regs(struct user_pt_regs *regs)
 {
 	regs->pstate &= ~SPSR_EL1_AARCH32_RES0_BITS;
 
-	if (!system_supports_mixed_endian_el0()) {
-		if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
-			regs->pstate |= PSR_AA32_E_BIT;
-		else
-			regs->pstate &= ~PSR_AA32_E_BIT;
-	}
+	if (!system_supports_mixed_endian_el0())
+		regs->pstate &= ~PSR_AA32_E_BIT;
 
 	if (user_mode(regs) && (regs->pstate & PSR_MODE32_BIT) &&
 	    (regs->pstate & PSR_AA32_A_BIT) == 0 &&
diff --git a/arch/arm64/kernel/signal32.c b/arch/arm64/kernel/signal32.c
index bb3b526ff43f..5edcab50f753 100644
--- a/arch/arm64/kernel/signal32.c
+++ b/arch/arm64/kernel/signal32.c
@@ -334,9 +334,6 @@ static void compat_setup_return(struct pt_regs *regs, struct k_sigaction *ka,
 	/* The IT state must be cleared for both ARM and Thumb-2 */
 	spsr &= ~PSR_AA32_IT_MASK;
 
-	/* Restore the original endianness */
-	spsr |= PSR_AA32_ENDSTATE;
-
 	if (ka->sa.sa_flags & SA_RESTORER) {
 		retcode = ptr_to_compat(ka->sa.sa_restorer);
 	} else {
diff --git a/arch/arm64/kernel/sys32.c b/arch/arm64/kernel/sys32.c
index 12a948f3a504..8ac07aeb018d 100644
--- a/arch/arm64/kernel/sys32.c
+++ b/arch/arm64/kernel/sys32.c
@@ -59,12 +59,7 @@ COMPAT_SYSCALL_DEFINE6(aarch32_mmap2, unsigned long, addr, unsigned long, len,
 	return ksys_mmap_pgoff(addr, len, prot, flags, fd, off_4k);
 }
 
-#ifdef CONFIG_CPU_BIG_ENDIAN
-#define arg_u32p(name)	u32, name##_hi, u32, name##_lo
-#else
 #define arg_u32p(name)	u32, name##_lo, u32, name##_hi
-#endif
-
 #define arg_u64(name)	(((u64)name##_hi << 32) | name##_lo)
 
 COMPAT_SYSCALL_DEFINE6(aarch32_pread64, unsigned int, fd, char __user *, buf,
-- 
2.55.0.679.g6767b8d81c-goog


