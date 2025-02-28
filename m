Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9992FC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 17:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpv0DuXtUGFFknXE/Ouo8h8w+qXm8Lm1VQdgq9gJIqY=; b=uMoWLArM21JpqBfs+a7ewVjzoN
	/RqpCn9c1v19jj3qhuGRM8T8yNg18GEeSGhXDuo6c5wOMbVdQglBj02wmgs/zAUbTiNkMl+w1odLC
	klPNaZmD4COreH0Bt4LYPnx6gBur584LPuVWVCJITj0TPPF86iOeT5Ui//PiMgKiDPjKjwgg8mq2+
	ZvhiA1IrSgj9aMG4rLA3Sz/T/aXItE8b9MsmlLakGpQCffm7khZwM8/XSqEfGjZSh6W45ZhnhFbzc
	ICzAHR//c6ZCAiftakCU+zVt/Rtcw4ZD9+h7LdehGd6q5RQasW4/d4qXqBAT/xEJ6I5MemgWuMcWg
	Ryp8BWVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to3qB-0000000Br4r-2ab0;
	Fri, 28 Feb 2025 17:07:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to3jJ-0000000Bota-3etq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 17:00:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EB57150C;
	Fri, 28 Feb 2025 09:01:08 -0800 (PST)
Received: from e126864.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91F073F6A8;
	Fri, 28 Feb 2025 09:00:51 -0800 (PST)
From: =?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tong Tiangen <tongtiangen@huawei.com>,
	Robin Murphy <robin.murphy@arm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH v2 1/3] arm64: extable: Add fixup handling for uaccess CPY* instructions
Date: Fri, 28 Feb 2025 17:00:04 +0000
Message-Id: <20250228170006.390100-2-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250228170006.390100-1-kristina.martsenko@arm.com>
References: <20250228170006.390100-1-kristina.martsenko@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_090053_997748_F8F04DC1 
X-CRM114-Status: GOOD (  19.08  )
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

A subsequent patch will use CPY* instructions to copy between user and
kernel memory. Add a new exception fixup type to avoid fixing up faults
on kernel memory accesses, in order to make it easier to debug kernel
bugs and to keep the same behavior as with regular loads/stores.

Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
---
 arch/arm64/include/asm/asm-extable.h | 10 +++++++++-
 arch/arm64/include/asm/extable.h     |  2 +-
 arch/arm64/mm/extable.c              | 25 ++++++++++++++++++++++++-
 arch/arm64/mm/fault.c                |  2 +-
 4 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/asm/asm-extable.h
index b8a5861dc7b7..292f2687a12e 100644
--- a/arch/arm64/include/asm/asm-extable.h
+++ b/arch/arm64/include/asm/asm-extable.h
@@ -9,7 +9,8 @@
 #define EX_TYPE_BPF			1
 #define EX_TYPE_UACCESS_ERR_ZERO	2
 #define EX_TYPE_KACCESS_ERR_ZERO	3
-#define EX_TYPE_LOAD_UNALIGNED_ZEROPAD	4
+#define EX_TYPE_UACCESS_CPY		4
+#define EX_TYPE_LOAD_UNALIGNED_ZEROPAD	5
 
 /* Data fields for EX_TYPE_UACCESS_ERR_ZERO */
 #define EX_DATA_REG_ERR_SHIFT	0
@@ -23,6 +24,9 @@
 #define EX_DATA_REG_ADDR_SHIFT	5
 #define EX_DATA_REG_ADDR	GENMASK(9, 5)
 
+/* Data fields for EX_TYPE_UACCESS_CPY */
+#define EX_DATA_UACCESS_WRITE	BIT(0)
+
 #ifdef __ASSEMBLY__
 
 #define __ASM_EXTABLE_RAW(insn, fixup, type, data)	\
@@ -69,6 +73,10 @@
 	.endif
 	.endm
 
+	.macro		_asm_extable_uaccess_cpy, insn, fixup, uaccess_is_write
+	__ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_UACCESS_CPY, \uaccess_is_write)
+	.endm
+
 #else /* __ASSEMBLY__ */
 
 #include <linux/stringify.h>
diff --git a/arch/arm64/include/asm/extable.h b/arch/arm64/include/asm/extable.h
index 72b0e71cc3de..5892b8977710 100644
--- a/arch/arm64/include/asm/extable.h
+++ b/arch/arm64/include/asm/extable.h
@@ -45,5 +45,5 @@ bool ex_handler_bpf(const struct exception_table_entry *ex,
 }
 #endif /* !CONFIG_BPF_JIT */
 
-bool fixup_exception(struct pt_regs *regs);
+bool fixup_exception(struct pt_regs *regs, unsigned long esr);
 #endif
diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
index 228d681a8715..afb5241e4d91 100644
--- a/arch/arm64/mm/extable.c
+++ b/arch/arm64/mm/extable.c
@@ -8,8 +8,18 @@
 #include <linux/uaccess.h>
 
 #include <asm/asm-extable.h>
+#include <asm/esr.h>
 #include <asm/ptrace.h>
 
+static bool cpy_faulted_on_uaccess(const struct exception_table_entry *ex,
+				   unsigned long esr)
+{
+	bool uaccess_is_write = FIELD_GET(EX_DATA_UACCESS_WRITE, ex->data);
+	bool fault_on_write = esr & ESR_ELx_WNR;
+
+	return uaccess_is_write == fault_on_write;
+}
+
 static inline unsigned long
 get_ex_fixup(const struct exception_table_entry *ex)
 {
@@ -29,6 +39,17 @@ static bool ex_handler_uaccess_err_zero(const struct exception_table_entry *ex,
 	return true;
 }
 
+static bool ex_handler_uaccess_cpy(const struct exception_table_entry *ex,
+				   struct pt_regs *regs, unsigned long esr)
+{
+	/* Do not fix up faults on kernel memory accesses */
+	if (!cpy_faulted_on_uaccess(ex, esr))
+		return false;
+
+	regs->pc = get_ex_fixup(ex);
+	return true;
+}
+
 static bool
 ex_handler_load_unaligned_zeropad(const struct exception_table_entry *ex,
 				  struct pt_regs *regs)
@@ -56,7 +77,7 @@ ex_handler_load_unaligned_zeropad(const struct exception_table_entry *ex,
 	return true;
 }
 
-bool fixup_exception(struct pt_regs *regs)
+bool fixup_exception(struct pt_regs *regs, unsigned long esr)
 {
 	const struct exception_table_entry *ex;
 
@@ -70,6 +91,8 @@ bool fixup_exception(struct pt_regs *regs)
 	case EX_TYPE_UACCESS_ERR_ZERO:
 	case EX_TYPE_KACCESS_ERR_ZERO:
 		return ex_handler_uaccess_err_zero(ex, regs);
+	case EX_TYPE_UACCESS_CPY:
+		return ex_handler_uaccess_cpy(ex, regs, esr);
 	case EX_TYPE_LOAD_UNALIGNED_ZEROPAD:
 		return ex_handler_load_unaligned_zeropad(ex, regs);
 	}
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index ef63651099a9..da4854fc6150 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -375,7 +375,7 @@ static void __do_kernel_fault(unsigned long addr, unsigned long esr,
 	 * Are we prepared to handle this kernel fault?
 	 * We are almost certainly not prepared to handle instruction faults.
 	 */
-	if (!is_el1_instruction_abort(esr) && fixup_exception(regs))
+	if (!is_el1_instruction_abort(esr) && fixup_exception(regs, esr))
 		return;
 
 	if (WARN_RATELIMIT(is_spurious_el1_translation_fault(addr, esr, regs),
-- 
2.34.1


