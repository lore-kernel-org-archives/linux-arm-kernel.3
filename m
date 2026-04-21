Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E32F94CB7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 22:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNlZDyegmOFELN70B6bCpVLxtkFdBX1CWXSw170KDZw=; b=ZqKtFU8Q3QBA5sMwbonHE04YZc
	AQT1fDsD5m20JXu6PsktUk8D9mRbX08oH7y47prQd/y+TfYjxc2TQ/g6mFE6kLBa1mrCk/Q/BWWK+
	JoRf1NtCr5eGXL+hBb5VT/si9QkqDcoVwkyw6SMRSNXq1YkDtYCC39W1jt7JOEDEeZobd0SbiPDY2
	NSxThyEUGUC4HApuBahgkAfueUO7DGU/6qxG9FkzE0BO8svatHRG7Z6/Pdzv5Tw4unB2ma7ATu4eQ
	6W7jIYAqT5viK5LPB0TaoSjlf5/6Hyp0qbKLDl8NR77egeVTzfpxMNFbkpWHgdABAcMOo7MGIfkSD
	pz+Itzdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJx7-00000009NPY-39jd;
	Tue, 21 Apr 2026 22:52:21 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJx4-00000009NNV-0wHl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 22:52:19 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-35da97f6a6dso4619401a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 15:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776811936; x=1777416736; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zNlZDyegmOFELN70B6bCpVLxtkFdBX1CWXSw170KDZw=;
        b=NMkJK/2pOlEyLQCdCgzxufyIZ9iQQQm0oz47ZemkLMEh1q5Tqx0fEZ0OuzOEEKI8ao
         3VRHZtt/k1tgMUcIWtkcZXH69tO5EZvtLqAjl2KmjW5zsRzawzU3aDlbC/K7uTQcUfwB
         ZkEvTtm+NOCCLPxuYwDfOHbwWkZ3I/a1cB5mse2krmbNpA1HvAV9QZSiupkHaltaJUyP
         jlVudH9gDxpxZGsqpw4UXCHcWoU242HDWTkKrnf8wxKUCdreX7QbfVjPNfUrc+wkzd+/
         HlgBZ4dIabuJaKgmSVKM8aM2L58NeZkXIl0+sTCY4l8hSzlW36CoFP9IUGoNHXov57Kn
         zuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776811936; x=1777416736;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zNlZDyegmOFELN70B6bCpVLxtkFdBX1CWXSw170KDZw=;
        b=AEbys31CbQyCCRiMm5rJV5egEegXoQNgQzVcnQ830ykJpG/WXX2/1C4dRQDNf0CCI/
         rupIuY++Th5iHPC5+gIKxsRyIfS9dQk0gB5uSubN3EmFRMZEt/kJ9ufxCbki1C06T8yY
         E7BPMchQw3p98DTWzbgM8VCaK4+QPJJnwdCL5r205FcG2t1ua9xEaYPYwSmY9diPtDI8
         beXyiV7WNELt8sqsMUfeiMYXvBZEZWWEV5ZUBY0F/yS2Cm8dEc4szXWnrVTFT7SSKiY0
         SiwC4n5Ap/He7995ABX/cCH3nAvr4dwRMortIRK6aOeRlegFxa7sYyXvyX5MznNyXbwA
         NVXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8MOOVkRYtkhlceUxxU3ocrgfpm2wqjaNSbMiAnGGdyTvcqAccBvxDeokeri07z7GWfR9tyb6IS7ZatTcgS0uZE@lists.infradead.org
X-Gm-Message-State: AOJu0YxLfVaTfS4DhS1blvfiehcZI4CLHoaaCf4qMCJjyox6bz/ej/vN
	/l2TQTM2X1hFNxo4viVXHImsqDGaXkd6/3qEZ0Z0v3ojUpvIaS1BP1M1msaHJ5hv1413sN/6WJ2
	xu72Fkrt433WtiwZgHgDqRMoOjg==
X-Received: from pjrx9.prod.google.com ([2002:a17:90a:bc89:b0:35d:9dbb:bda8])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3811:b0:35f:c729:de9f with SMTP id 98e67ed59e1d1-361404c2053mr20137572a91.27.1776811936241;
 Tue, 21 Apr 2026 15:52:16 -0700 (PDT)
Date: Tue, 21 Apr 2026 22:51:55 +0000
In-Reply-To: <20260421225200.1198447-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260421225200.1198447-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260421225200.1198447-4-dylanbhatch@google.com>
Subject: [PATCH v4 3/8] arm64: entry: add unwind info for various kernel entries
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_155218_286897_567A3CDF 
X-CRM114-Status: GOOD (  12.58  )
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

From: Weinan Liu <wnliu@google.com>

DWARF CFI (Call Frame Information) specifies how to recover the return
address and callee-saved registers at each PC in a given function.
Compilers are able to generate the CFI annotations when they compile
the code to assembly language. For handcrafted assembly, we need to
annotate them by hand.

Annotate minimal CFI to enable stacktracing using SFrame for kernel
exception entries through el1*_64_*() paths and irq entries through
call_on_irq_stack()

Signed-off-by: Weinan Liu <wnliu@google.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
Suggested-by: Jens Remus <jremus@linux.ibm.com>
---
 arch/arm64/kernel/entry.S | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index f8018b5c1f9a..dc55b0b19cfa 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -30,6 +30,12 @@
 #include <asm/asm-uaccess.h>
 #include <asm/unistd.h>
 
+/*
+ * Do not generate .eh_frame.  Only generate .debug_frame and optionally
+ * .sframe (via assembler option --gsframe[-N]).
+ */
+	.cfi_sections .debug_frame
+
 	.macro	clear_gp_regs
 	.irp	n,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
 	mov	x\n, xzr
@@ -575,7 +581,16 @@ SYM_CODE_START_LOCAL(el\el\ht\()_\regsize\()_\label)
 	.if \el == 0
 	b	ret_to_user
 	.else
+	/*
+	 * Minimal DWARF CFI for unwinding across the call above.
+	 * Enable unwinding for el1*_64_*() path only.
+	 */
+	.cfi_startproc
+	.cfi_def_cfa_offset PT_REGS_SIZE
+	.cfi_offset 29, S_FP - PT_REGS_SIZE
+	.cfi_offset 30, S_LR - PT_REGS_SIZE
 	b	ret_to_kernel
+	.cfi_endproc
 	.endif
 SYM_CODE_END(el\el\ht\()_\regsize\()_\label)
 	.endm
@@ -872,6 +887,7 @@ NOKPROBE(ret_from_fork)
  * Calls func(regs) using this CPU's irq stack and shadow irq stack.
  */
 SYM_FUNC_START(call_on_irq_stack)
+	.cfi_startproc
 	save_and_disable_daif x9
 #ifdef CONFIG_SHADOW_CALL_STACK
 	get_current_task x16
@@ -882,6 +898,9 @@ SYM_FUNC_START(call_on_irq_stack)
 	/* Create a frame record to save our LR and SP (implicit in FP) */
 	stp	x29, x30, [sp, #-16]!
 	mov	x29, sp
+	.cfi_def_cfa 29, 16
+	.cfi_offset 29, -16
+	.cfi_offset 30, -8
 
 	ldr_this_cpu x16, irq_stack_ptr, x17
 
@@ -897,9 +916,13 @@ SYM_FUNC_START(call_on_irq_stack)
 	 */
 	mov	sp, x29
 	ldp	x29, x30, [sp], #16
+	.cfi_restore 29
+	.cfi_restore 30
+	.cfi_def_cfa 31, 0
 	scs_load_current
 	restore_irq x9
 	ret
+	.cfi_endproc
 SYM_FUNC_END(call_on_irq_stack)
 NOKPROBE(call_on_irq_stack)
 
-- 
2.54.0.rc1.555.g9c883467ad-goog


