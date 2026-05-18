Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7E7CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 08:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZNjExq7H0YZ5/JkBFHk426Iyxdv38aH11enOzWM1m0=; b=Yph8a2OV9UtMTbG5R8lgcmDguJ
	lgjEmajfB2W2cUDjDzn5f0xaJ724mJBccGyxxywtqDCXlQ/pDfSjDJ2cZaoplh7AQbB4pMHHAmTyL
	2msGl6uEna5t3HfKUKwu4xMbaf2Lk4myKMOR9RdAfJkVSdb1vWuQ3KTvRMTNEuUhat99NGEUmW5NK
	aT5qSMN9RgpHZF4QokZXGRjL3oFUfuMv6KY0tv0xEi7i4g6OmioSib5DvxVKN03s80moSK9jaxU+A
	R+YKDCL4EuFI0lyqfTx+MtUohRIm30aV7dwjlP8qkySiDAEpvp3eiviOxANX0+XWXb3fJJaPYp5LF
	/XxUNMsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtg3-0000000Esdu-3WqE;
	Mon, 18 May 2026 08:50:19 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtg0-0000000Esbb-1ZzN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 08:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779094213; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=XZNjExq7H0YZ5/JkBFHk426Iyxdv38aH11enOzWM1m0=;
	b=WWf13C/NGDIUBe5okpGAQq1SLQ8JQUtjO4Fl/wA1JhQh0iwbi8lbLm56T4nj+t67lcEN4K1mGI3OqNb0CPMKpcg74UI01EgJkV/NAFZLAS6GLu8Utv/IpnBfa6u/l4EQpoVAn+1aLCKz/SMU4kcvEgxrd0nEhK6ZlL6+Rs/GF0k=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X3647KN_1779094209;
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X3647KN_1779094209 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 18 May 2026 16:50:10 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	rafael@kernel.org,
	tony.luck@intel.com,
	guohanjun@huawei.com,
	mchehab@kernel.org,
	xueshuai@linux.alibaba.com,
	tongtiangen@huawei.com,
	james.morse@arm.com,
	robin.murphy@arm.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	ryabinin.a.a@gmail.com,
	glider@google.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com,
	tglx@linutronix.de,
	mingo@redhat.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	tianruidong@linux.alibaba.com
Subject: [PATCH v14 3/8] arm64: add support for ARCH_HAS_COPY_MC
Date: Mon, 18 May 2026 16:49:47 +0800
Message-ID: <20260518084956.2538442-4-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260518084956.2538442-1-tianruidong@linux.alibaba.com>
References: <20260518084956.2538442-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_015016_780258_46273882 
X-CRM114-Status: GOOD (  21.13  )
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

From: Tong Tiangen <tongtiangen@huawei.com>

For the arm64 kernel, when it processes hardware memory errors for
synchronize notifications(do_sea()), if the errors is consumed within the
kernel, the current processing is panic. However, it is not optimal.

Take copy_from/to_user for example, If ld* triggers a memory error, even in
kernel mode, only the associated process is affected. Killing the user
process and isolating the corrupt page is a better choice.

Add new fixup type EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR to identify insn
that can recover from memory errors triggered by access to kernel memory,
and this fixup type is used in __arch_copy_to_user(), This make the regular
copy_to_user() will handle kernel memory errors.

[Ruidong: handle EX_TYPE_UACCESS_CPY in fixup_exception_me()]

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 arch/arm64/Kconfig                   |  1 +
 arch/arm64/include/asm/asm-extable.h | 22 +++++++++++++++++++-
 arch/arm64/include/asm/asm-uaccess.h |  4 ++++
 arch/arm64/include/asm/extable.h     |  1 +
 arch/arm64/lib/copy_to_user.S        | 10 +++++-----
 arch/arm64/mm/extable.c              | 21 +++++++++++++++++++
 arch/arm64/mm/fault.c                | 30 ++++++++++++++++++++--------
 7 files changed, 75 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fe60738e5943..831b20d45893 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -21,6 +21,7 @@ config ARM64
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_CC_PLATFORM
 	select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
+	select ARCH_HAS_COPY_MC if ACPI_APEI_GHES
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/asm/asm-extable.h
index d67e2fdd1aee..4980023f2fbd 100644
--- a/arch/arm64/include/asm/asm-extable.h
+++ b/arch/arm64/include/asm/asm-extable.h
@@ -11,6 +11,8 @@
 #define EX_TYPE_KACCESS_ERR_ZERO	3
 #define EX_TYPE_UACCESS_CPY		4
 #define EX_TYPE_LOAD_UNALIGNED_ZEROPAD	5
+/* kernel access memory error safe */
+#define EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR	6
 
 /* Data fields for EX_TYPE_UACCESS_ERR_ZERO */
 #define EX_DATA_REG_ERR_SHIFT	0
@@ -42,7 +44,7 @@
 	(.L__gpr_num_##gpr << EX_DATA_REG_##reg##_SHIFT)
 
 #define _ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, err, zero)		\
-	__ASM_EXTABLE_RAW(insn, fixup, 					\
+	__ASM_EXTABLE_RAW(insn, fixup,					\
 			  EX_TYPE_UACCESS_ERR_ZERO,			\
 			  (						\
 			    EX_DATA_REG(ERR, err) |			\
@@ -55,6 +57,17 @@
 #define _ASM_EXTABLE_UACCESS(insn, fixup)				\
 	_ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, wzr, wzr)
 
+#define _ASM_EXTABLE_KACCESS_ERR_ZERO_MEM_ERR(insn, fixup, err, zero)	\
+	__ASM_EXTABLE_RAW(insn, fixup,					\
+			  EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR,		\
+			  (						\
+			    EX_DATA_REG(ERR, err) |			\
+			    EX_DATA_REG(ZERO, zero)			\
+			  ))
+
+#define _ASM_EXTABLE_KACCESS_MEM_ERR(insn, fixup)			\
+	_ASM_EXTABLE_KACCESS_ERR_ZERO_MEM_ERR(insn, fixup, wzr, wzr)
+
 /*
  * Create an exception table entry for uaccess `insn`, which will branch to `fixup`
  * when an unhandled fault is taken.
@@ -76,6 +89,13 @@
 	.macro		_asm_extable_uaccess_cpy, insn, fixup, uaccess_is_write
 	__ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_UACCESS_CPY, \uaccess_is_write)
 	.endm
+/*
+ * Create an exception table entry for kaccess `insn`, which will branch to
+ * `fixup` when an unhandled fault is taken.
+ */
+	.macro          _asm_extable_kaccess_mem_err, insn, fixup
+	_ASM_EXTABLE_KACCESS_MEM_ERR(\insn, \fixup)
+	.endm
 
 #else /* __ASSEMBLER__ */
 
diff --git a/arch/arm64/include/asm/asm-uaccess.h b/arch/arm64/include/asm/asm-uaccess.h
index 12aa6a283249..c8f0af5fde63 100644
--- a/arch/arm64/include/asm/asm-uaccess.h
+++ b/arch/arm64/include/asm/asm-uaccess.h
@@ -57,6 +57,10 @@ alternative_else_nop_endif
 	.endm
 #endif
 
+#define KERNEL_MEM_ERR(l, x...)			\
+9999:	x;					\
+	_asm_extable_kaccess_mem_err	9999b, l
+
 #define USER(l, x...)				\
 9999:	x;					\
 	_asm_extable_uaccess	9999b, l
diff --git a/arch/arm64/include/asm/extable.h b/arch/arm64/include/asm/extable.h
index 9dc39612bdf5..47c851d7df4f 100644
--- a/arch/arm64/include/asm/extable.h
+++ b/arch/arm64/include/asm/extable.h
@@ -48,4 +48,5 @@ bool ex_handler_bpf(const struct exception_table_entry *ex,
 #endif /* !CONFIG_BPF_JIT */
 
 bool fixup_exception(struct pt_regs *regs, unsigned long esr);
+bool fixup_exception_me(struct pt_regs *regs);
 #endif
diff --git a/arch/arm64/lib/copy_to_user.S b/arch/arm64/lib/copy_to_user.S
index 819f2e3fc7a9..991d94ecc1a8 100644
--- a/arch/arm64/lib/copy_to_user.S
+++ b/arch/arm64/lib/copy_to_user.S
@@ -20,7 +20,7 @@
  *	x0 - bytes not copied
  */
 	.macro ldrb1 reg, ptr, val
-	ldrb  \reg, [\ptr], \val
+	KERNEL_MEM_ERR(9998f, ldrb  \reg, [\ptr], \val)
 	.endm
 
 	.macro strb1 reg, ptr, val
@@ -28,7 +28,7 @@
 	.endm
 
 	.macro ldrh1 reg, ptr, val
-	ldrh  \reg, [\ptr], \val
+	KERNEL_MEM_ERR(9998f, ldrh  \reg, [\ptr], \val)
 	.endm
 
 	.macro strh1 reg, ptr, val
@@ -36,7 +36,7 @@
 	.endm
 
 	.macro ldr1 reg, ptr, val
-	ldr \reg, [\ptr], \val
+	KERNEL_MEM_ERR(9998f, ldr \reg, [\ptr], \val)
 	.endm
 
 	.macro str1 reg, ptr, val
@@ -44,7 +44,7 @@
 	.endm
 
 	.macro ldp1 reg1, reg2, ptr, val
-	ldp \reg1, \reg2, [\ptr], \val
+	KERNEL_MEM_ERR(9998f, ldp \reg1, \reg2, [\ptr], \val)
 	.endm
 
 	.macro stp1 reg1, reg2, ptr, val
@@ -74,7 +74,7 @@ SYM_FUNC_START(__arch_copy_to_user)
 9997:	cmp	dst, dstin
 	b.ne	9998f
 	// Before being absolutely sure we couldn't copy anything, try harder
-	ldrb	tmp1w, [srcin]
+KERNEL_MEM_ERR(9998f, ldrb	tmp1w, [srcin])
 USER(9998f, sttrb tmp1w, [dst])
 	add	dst, dst, #1
 9998:	sub	x0, end, dst			// bytes not copied
diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
index 6e0528831cd3..f78ac7e92845 100644
--- a/arch/arm64/mm/extable.c
+++ b/arch/arm64/mm/extable.c
@@ -110,7 +110,28 @@ bool fixup_exception(struct pt_regs *regs, unsigned long esr)
 		return ex_handler_uaccess_cpy(ex, regs, esr);
 	case EX_TYPE_LOAD_UNALIGNED_ZEROPAD:
 		return ex_handler_load_unaligned_zeropad(ex, regs);
+	case EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR:
+		return false;
 	}
 
 	BUG();
 }
+
+bool fixup_exception_me(struct pt_regs *regs)
+{
+	const struct exception_table_entry *ex;
+
+	ex = search_exception_tables(instruction_pointer(regs));
+	if (!ex)
+		return false;
+
+	switch (ex->type) {
+	case EX_TYPE_UACCESS_CPY:
+		return ex_handler_uaccess_cpy(ex, regs, 0);
+	case EX_TYPE_UACCESS_ERR_ZERO:
+	case EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR:
+		return ex_handler_uaccess_err_zero(ex, regs);
+	}
+
+	return false;
+}
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 0f3c5c7ca054..efbda54770be 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -858,21 +858,35 @@ static int do_bad(unsigned long far, unsigned long esr, struct pt_regs *regs)
 	return 1; /* "fault" */
 }
 
+/*
+ * APEI claimed this as a firmware-first notification.
+ * Some processing deferred to task_work before ret_to_user().
+ */
+static int do_apei_claim_sea(struct pt_regs *regs)
+{
+	int ret;
+
+	ret = apei_claim_sea(regs);
+	if (ret)
+		return ret;
+
+	if (!user_mode(regs) && IS_ENABLED(CONFIG_ARCH_HAS_COPY_MC)) {
+		if (!fixup_exception_me(regs))
+			return -ENOENT;
+	}
+
+	return ret;
+}
+
 static int do_sea(unsigned long far, unsigned long esr, struct pt_regs *regs)
 {
 	const struct fault_info *inf;
 	unsigned long siaddr;
 
-	inf = esr_to_fault_info(esr);
-
-	if (user_mode(regs) && apei_claim_sea(regs) == 0) {
-		/*
-		 * APEI claimed this as a firmware-first notification.
-		 * Some processing deferred to task_work before ret_to_user().
-		 */
+	if (do_apei_claim_sea(regs) == 0)
 		return 0;
-	}
 
+	inf = esr_to_fault_info(esr);
 	if (esr & ESR_ELx_FnV) {
 		siaddr = 0;
 	} else {
-- 
2.39.3


