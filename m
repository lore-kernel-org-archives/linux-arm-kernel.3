Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1568CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/nlcLfHeEK22CudUS4OFWKM5qdfybZsW0BcDmXYUS0=; b=xtirGDZ6P/Ld7QhZ+/NaR9YIXX
	dJlz5yxYHp8Cw6KRRch6JrugVx1DunlynJSWdjHwFK+M64LASIL52xwNl2hcu1MsrJZEZidDTO5RB
	1RMdU3C9ltiwEc5yMnLtZC9LIE/vV/0wO9JXIUYKASOklJoYkARJiTkOylB46+0ok902gHqBRyqlY
	9uXaSHdMW3uAtCJmqa0TxLLIiNrFR5WZBcvVLN2rVSCE9CkXjWzq6vfswgWjlDwxxXS0tNbMat5cy
	KxuUO4fntc1xq9oouM03RxPpueKOj9uc+NpI0pCdfSIOziVzp+mRZvFcoBOEZNxdg0/cx2Fz+HqFP
	wvv/JPIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjRU-0000000EthZ-302f;
	Wed, 03 Jun 2026 11:07:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjRQ-0000000EtNk-3cVF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:07:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E048F49FF;
	Wed,  3 Jun 2026 04:07:14 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 12CB83F86F;
	Wed,  3 Jun 2026 04:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780484839; bh=wI68yc1Q70swWj48fpOlxiWQla8Pc9mTBYmKEg16hCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fm5XspJcAg9jNpNOKpX/Yi5eLhe8jj7DFZDj2knp0P/j69LyDGRGd1a2EuwHLYyM1
	 +nUugCuFMe3cRFM+vlK8W85nzogz1rHHeqj8q8XwjwleWr1CEldZPSsNoD9XnmxL+O
	 1smAOmJaIwiZABh2ZNFpl1dvVSSWmaP9UEMTSaFs=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	stable@vger.kernel.org,
	tabba@google.com,
	vladimir.murzin@arm.com,
	will@kernel.org
Subject: [PATCH v4 18/20] arm64: fpsimd: Move sve_flush_live() inline
Date: Wed,  3 Jun 2026 12:06:28 +0100
Message-Id: <20260603110630.1027435-19-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260603110630.1027435-1-mark.rutland@arm.com>
References: <20260603110630.1027435-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_040721_005857_CEFCC6BD 
X-CRM114-Status: GOOD (  18.18  )
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

Currently sve_flush_live() is written in out-of-line assembly. It would
be nice if we could move it inline such that control flow can be written
more clearly in C, and to permit the removal of otherwise unused
assembly macros.

The 'flush_ffr' argument is redundant as sve_flush_live() is always
called from non-streaming mode, and all callers pass 'true'. Remove the
argument and make it a requirement that the function is called from
non-streaming mode.

The 'vq_minus_1' argument is unnecessary, as sve_flush_live() can read
the live VL directly using the RDVL instruction (wrapped by the
sve_get_vl() helper function).

Move the function to C, with the simplifications above.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h       | 25 +++++++++++++++++++++-
 arch/arm64/include/asm/fpsimdmacros.h | 30 ---------------------------
 arch/arm64/kernel/entry-common.c      |  8 ++-----
 arch/arm64/kernel/entry-fpsimd.S      | 22 --------------------
 arch/arm64/kernel/fpsimd.c            |  2 +-
 5 files changed, 27 insertions(+), 60 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index 8f1b844f000fa..9dfe53204ebfb 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -332,7 +332,30 @@ static inline void sve_load_state(const struct arm64_sve_state *state, bool ffr)
 	__sve_load_p(state, vl, ffr);
 }
 
-extern void sve_flush_live(bool flush_ffr, unsigned long vq_minus_1);
+/*
+ * Zero all SVE registers except for the first 128 bits of each vector.
+ *
+ * The caller must ensure that the VL has been configured and the CPU must be
+ * in non-streaming mode.
+ */
+static inline void sve_flush_live(void)
+{
+	unsigned long vl = sve_get_vl();
+
+	if (vl > sizeof(__uint128_t)) {
+		asm volatile(
+		__FPSIMD_PREAMBLE
+		FOR_EACH_Z_REG("n", "mov	v\\n\\().16b, v\\n\\().16b")
+		);
+	}
+
+	asm volatile(
+	__SVE_PREAMBLE
+	FOR_EACH_P_REG("n", "pfalse	p\\n\\().b")
+	"	wrffr	p0.b\n"
+	);
+}
+
 extern void sme_save_state(struct arm64_sme_state *state, int zt);
 extern void sme_load_state(const struct arm64_sme_state *state, int zt);
 
diff --git a/arch/arm64/include/asm/fpsimdmacros.h b/arch/arm64/include/asm/fpsimdmacros.h
index 5f03fe51d0bff..9e352b5c6b764 100644
--- a/arch/arm64/include/asm/fpsimdmacros.h
+++ b/arch/arm64/include/asm/fpsimdmacros.h
@@ -40,20 +40,6 @@
 	.endif
 .endm
 
-/* Deprecated macros for SVE instructions */
-
-/* WRFFR P\np.B */
-.macro _sve_wrffr np
-	.arch_extension sve
-	wrffr p\np\().b
-.endm
-
-/* PFALSE P\np.B */
-.macro _sve_pfalse np
-	.arch_extension sve
-	pfalse	p\np\().b
-.endm
-
 /* Deprecated macros for SME instructions */
 
 /* RDSVL X\nx, #\imm */
@@ -131,22 +117,6 @@
 	.purgem _for__body
 .endm
 
-/* Preserve the first 128-bits of Znz and zero the rest. */
-.macro _sve_flush_z nz
-	_sve_check_zreg \nz
-	mov	v\nz\().16b, v\nz\().16b
-.endm
-
-.macro sve_flush_z
- _for n, 0, 31, _sve_flush_z	\n
-.endm
-.macro sve_flush_p
- _for n, 0, 15, _sve_pfalse	\n
-.endm
-.macro sve_flush_ffr
-		_sve_wrffr	0
-.endm
-
 .macro sme_save_za nxbase, xvl, nw
 	mov	w\nw, #0
 
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index cb54335465f66..2352297330e12 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -237,12 +237,8 @@ static inline void fpsimd_syscall_enter(void)
 	if (!system_supports_sve())
 		return;
 
-	if (test_thread_flag(TIF_SVE)) {
-		unsigned int sve_vq_minus_one;
-
-		sve_vq_minus_one = sve_vq_from_vl(task_get_sve_vl(current)) - 1;
-		sve_flush_live(true, sve_vq_minus_one);
-	}
+	if (test_thread_flag(TIF_SVE))
+		sve_flush_live();
 
 	/*
 	 * Any live non-FPSIMD SVE state has been zeroed. Allow
diff --git a/arch/arm64/kernel/entry-fpsimd.S b/arch/arm64/kernel/entry-fpsimd.S
index f957536356255..2a4755113b99a 100644
--- a/arch/arm64/kernel/entry-fpsimd.S
+++ b/arch/arm64/kernel/entry-fpsimd.S
@@ -11,28 +11,6 @@
 #include <asm/assembler.h>
 #include <asm/fpsimdmacros.h>
 
-#ifdef CONFIG_ARM64_SVE
-
-/*
- * Zero all SVE registers but the first 128-bits of each vector
- *
- * VQ must already be configured by caller, any further updates of VQ
- * will need to ensure that the register state remains valid.
- *
- * x0 = include FFR?
- * x1 = VQ - 1
- */
-SYM_FUNC_START(sve_flush_live)
-	cbz		x1, 1f	// A VQ-1 of 0 is 128 bits so no extra Z state
-	sve_flush_z
-1:	sve_flush_p
-	tbz		x0, #0, 2f
-	sve_flush_ffr
-2:	ret
-SYM_FUNC_END(sve_flush_live)
-
-#endif /* CONFIG_ARM64_SVE */
-
 #ifdef CONFIG_ARM64_SME
 
 /*
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index b9506422d29c6..25dc5afe9ba0c 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1338,7 +1338,7 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
 	if (!test_thread_flag(TIF_FOREIGN_FPSTATE)) {
 		unsigned long vq = sve_vq_from_vl(task_get_sve_vl(current));
 		sysreg_clear_set_s(SYS_ZCR_EL1, ZCR_ELx_LEN, vq - 1);
-		sve_flush_live(true, vq - 1);
+		sve_flush_live();
 		fpsimd_bind_task_to_cpu();
 	} else {
 		fpsimd_to_sve(current);
-- 
2.30.2


