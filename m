Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F8FCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 09:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFT2qwUPpYfCLwTGty0d6yeRs8ICppiuWOoU1Fah3Ls=; b=Rqb8K5VSm6GyEZ4W0ZghrwKE+L
	PjN+xBc4E5lmWyTrwWgeitjin8i704GyheSSXz7iRNktB8rgTluAj4Xz+YYVvvZk7yfpDop6WUd32
	8hBNPslKoFcpXNrsnAOhD12FcVjKxtkEhDXSvoKkmtOh5cJsVMu5tf509eB0qt91PC14oowBqXV6k
	24VxYoV8q4f/CaBAoOObWvHFihoTiQSaBNE8t7njWXwgoeSP7ux832Xrk3mgFLpJMpeNbziu9c4PT
	DS+vU9vt8M996xVu9R4W6t/OOWmwal5+QT9rMDtxQJb5PwVH9xqwsufgn7lkrl4EOKtp2n/89XMfz
	0oUi6uyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8wl-00000000vSQ-0Nqf;
	Thu, 18 Jun 2026 09:22:03 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8wf-00000000vOA-1wR8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 09:21:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781774515; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=GFT2qwUPpYfCLwTGty0d6yeRs8ICppiuWOoU1Fah3Ls=;
	b=SAzaeL2eIAqknKcPk0hAIfU2MqZnWt0cR6VDTwd0lvHUj0TM0gO1sfX22lL6MMd9pjxBDl3yFzaeL1rTWybdBBSblaU7jcrwN7A5F57KF6tijhXocVhoydKCip6/qJzL3GlGqkomEKFAAhSZsDIgmfnKnT1Wef0kwDqgoEln76s=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X56USuz_1781774509;
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X56USuz_1781774509 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 18 Jun 2026 17:21:52 +0800
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
Subject: [PATCH v15 4/9] arm64: enable recover from synchronous external abort in kernel context
Date: Thu, 18 Jun 2026 17:21:18 +0800
Message-ID: <20260618092124.3901230-5-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260618092124.3901230-1-tianruidong@linux.alibaba.com>
References: <20260618092124.3901230-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_022157_828023_4D496102 
X-CRM114-Status: GOOD (  21.81  )
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

For the arm64 kernel, when it processes hardware memory errors for
synchronize notifications(do_sea()), if the errors is consumed within the
kernel, the current processing is panic. However, it is not optimal.

Take copy_from/to_user for example, If ld* triggers a memory error, even in
kernel mode, only the associated process is affected. Killing the user
process and isolating the corrupt page is a better choice.

Add new fixup type EX_TYPE_KACCESS_SEA to identify insn that can recover
from memory errors triggered by access to kernel memory, and this fixup
type is used in __arch_copy_to_user(), This make the regular copy_to_user()
will handle kernel memory errors.

[Ruidong: modify subject and rename EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR to
EX_TYPE_KACCESS_SEA]

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 arch/arm64/include/asm/asm-extable.h |  5 +++++
 arch/arm64/include/asm/asm-uaccess.h |  4 ++++
 arch/arm64/include/asm/extable.h     |  1 +
 arch/arm64/lib/copy_to_user.S        | 10 +++++-----
 arch/arm64/mm/extable.c              | 28 ++++++++++++++++++++++++++
 arch/arm64/mm/fault.c                | 30 ++++++++++++++++++++--------
 6 files changed, 65 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/asm/asm-extable.h
index 06b19023939b..8450ec5a3af6 100644
--- a/arch/arm64/include/asm/asm-extable.h
+++ b/arch/arm64/include/asm/asm-extable.h
@@ -10,6 +10,7 @@
 #define EX_TYPE_ACCESS_ERR_ZERO		2
 #define EX_TYPE_UACCESS_CPY		3
 #define EX_TYPE_LOAD_UNALIGNED_ZEROPAD	4
+#define EX_TYPE_KACCESS_SEA		5
 
 /* Data fields for EX_TYPE_ACCESS_ERR_ZERO */
 #define EX_DATA_REG_ERR_SHIFT	0
@@ -76,6 +77,10 @@
 	__ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_UACCESS_CPY, \uaccess_is_write)
 	.endm
 
+	.macro          _asm_extable_kaccess_sea, insn, fixup
+	__ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_KACCESS_SEA, 0)
+	.endm
+
 #else /* __ASSEMBLER__ */
 
 #include <linux/stringify.h>
diff --git a/arch/arm64/include/asm/asm-uaccess.h b/arch/arm64/include/asm/asm-uaccess.h
index 12aa6a283249..27bf8edbf597 100644
--- a/arch/arm64/include/asm/asm-uaccess.h
+++ b/arch/arm64/include/asm/asm-uaccess.h
@@ -57,6 +57,10 @@ alternative_else_nop_endif
 	.endm
 #endif
 
+#define KERNEL_SEA(l, x...)			\
+9999:	x;					\
+	_asm_extable_kaccess_sea	9999b, l
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
index 819f2e3fc7a9..6103f5b0a2d0 100644
--- a/arch/arm64/lib/copy_to_user.S
+++ b/arch/arm64/lib/copy_to_user.S
@@ -20,7 +20,7 @@
  *	x0 - bytes not copied
  */
 	.macro ldrb1 reg, ptr, val
-	ldrb  \reg, [\ptr], \val
+	KERNEL_SEA(9998f, ldrb  \reg, [\ptr], \val)
 	.endm
 
 	.macro strb1 reg, ptr, val
@@ -28,7 +28,7 @@
 	.endm
 
 	.macro ldrh1 reg, ptr, val
-	ldrh  \reg, [\ptr], \val
+	KERNEL_SEA(9998f, ldrh  \reg, [\ptr], \val)
 	.endm
 
 	.macro strh1 reg, ptr, val
@@ -36,7 +36,7 @@
 	.endm
 
 	.macro ldr1 reg, ptr, val
-	ldr \reg, [\ptr], \val
+	KERNEL_SEA(9998f, ldr \reg, [\ptr], \val)
 	.endm
 
 	.macro str1 reg, ptr, val
@@ -44,7 +44,7 @@
 	.endm
 
 	.macro ldp1 reg1, reg2, ptr, val
-	ldp \reg1, \reg2, [\ptr], \val
+	KERNEL_SEA(9998f, ldp \reg1, \reg2, [\ptr], \val)
 	.endm
 
 	.macro stp1 reg1, reg2, ptr, val
@@ -74,7 +74,7 @@ SYM_FUNC_START(__arch_copy_to_user)
 9997:	cmp	dst, dstin
 	b.ne	9998f
 	// Before being absolutely sure we couldn't copy anything, try harder
-	ldrb	tmp1w, [srcin]
+KERNEL_SEA(9998f, ldrb	tmp1w, [srcin])
 USER(9998f, sttrb tmp1w, [dst])
 	add	dst, dst, #1
 9998:	sub	x0, end, dst			// bytes not copied
diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
index 76b18780f1f9..20a7a9eeed94 100644
--- a/arch/arm64/mm/extable.c
+++ b/arch/arm64/mm/extable.c
@@ -109,7 +109,35 @@ bool fixup_exception(struct pt_regs *regs, unsigned long esr)
 		return ex_handler_uaccess_cpy(ex, regs, esr);
 	case EX_TYPE_LOAD_UNALIGNED_ZEROPAD:
 		return ex_handler_load_unaligned_zeropad(ex, regs);
+	/*
+	 * Kernel address faults (e.g. copy_to_user reading from kernel src).
+	 * Do not fixup here: a translation fault on a kernel address is a
+	 * kernel bug (e.g. NULL pointer dereference) and must oops.
+	 * Only SEA (hardware memory error) should be fixed up, which is
+	 * handled by fixup_exception_me() through the do_sea path.
+	 */
+	case EX_TYPE_KACCESS_SEA:
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
+	case EX_TYPE_ACCESS_ERR_ZERO:
+		return ex_handler_access_err_zero(ex, regs);
+	case EX_TYPE_KACCESS_SEA:
+		regs->pc = get_ex_fixup(ex);
+		return true;
+	}
+
+	return false;
+}
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 0f3c5c7ca054..b775c0928a53 100644
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
+	if (!user_mode(regs)) {
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


