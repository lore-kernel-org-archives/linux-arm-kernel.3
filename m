Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F86FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 18:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEpxSS5AT7sZwZhISlQ7XtXed3JthTvzY7OBT2Phvm0=; b=eZLXJGLu4VciUpgJ+9oI1KOdNR
	L/LR8AEV1gsEJCttftYLrl9g5z94/mW4W2HjypLPNXZRvuqxVHLcQkp/U1AjLq9mqd+aCGTtDf41R
	W3a+Kh5KMjywEXI1BPSnzM5vCddnEq/n9WPUaFtlAlW/BmEbz8cA2MdwOsQKItMBwjv7C6ZTooxwC
	iwxqHy7KEfjMKvPhjx48IceL+6Qx/9q0da0lWPIVr9vdQ8d4hkB7mLKPFmitKCOZdMbsAONYNpbKk
	TXjqdrygek2X9cG6MFsob82f/oy3UC7ZNiBxmpdgUmGi9wQpe60WxMMv+vEeGlT2QsrRLfOvBar/F
	Nkyz1MJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnJD-000000026OC-1ogq;
	Tue, 28 Apr 2026 18:37:23 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnJ6-000000026Jy-24Ik
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 18:37:17 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-35842aa350fso22478837a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777401435; x=1778006235; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rEpxSS5AT7sZwZhISlQ7XtXed3JthTvzY7OBT2Phvm0=;
        b=HFSYPJIzQVJQSSKWdp62bkwdxYUS/eWDJy99qiqGa+0qwf/n6/dkh9CREarPPyZDt6
         TogZg+kY82XV9pRVT4Qdti3BV1smyK1/TJuAxomohj5hDlaXGAKum/FFtHEgmdgBWrzu
         1etRK09jme786hBW24yIIE6oOOF+usuXL2nl7bIevQrAKQNtdXmloHwOUNVXdEB3yMco
         ehYlssiZ80j0bIfuaY6UXC4F9TUR4GZScFuJfaw1SBAOLOzU9PaKqMsp3XxncdjhLL0b
         WENJCYFEbiow9O3WrXro9i3lM8RFgemxmK5UJXcEnoLykY/uvMUXLgFvxzTLs76J3Msz
         dsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777401435; x=1778006235;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rEpxSS5AT7sZwZhISlQ7XtXed3JthTvzY7OBT2Phvm0=;
        b=GLn/ddsLkZTvUhsR++N1Zic1nOcIIkcaePwbkVKEhC8lWEw+8suRP6m38xw9I2h9qe
         t/YCtzA9IANBkTum85prScTXz6K5i77AyijRjek9qhHTshY5EF6zrfR0wTj7Q+EraLF1
         D1E/vkYVc2a+tFDjsITnuJUA1pbSydxUzaNm3LOa4qx7/Z4jCqZpp6xgJBh5+69gBrJO
         FnDh5OyrDqztLq6vFaloD4y6FO7wuqurU0LGkMGgTyhmoJJRlp6aH9/P7NHr65UubS5O
         hnr4gkz+qTYIN1BAUM9Jo+jkndZfPRmgSgUtprE+R4KJIFo3xssLP9Dbi6LgoB40zq35
         fg5A==
X-Forwarded-Encrypted: i=1; AFNElJ8hs6U/QnuPMLiamPc79DCNZOBhcWB7ypUMTZeZ8CeAESf8HfpHF1cMkVtSHrVu9x5epSYS6aWX4av4JkRTFIed@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/uI8ifVBZfdpXdboZPhpOmWdE4aa/k3kPnbgZMo9t0zxKknWu
	D4VbU0P7MMndid5lbsvxkD49kCWMRujcRkePdx6+jaAbEHoYw8/tIWzO1oOrVYdk7YlcWHcLkuq
	+Y9Zg/H42EwXafFK5RnTG5tEV9A==
X-Received: from pfuw1.prod.google.com ([2002:a05:6a00:14c1:b0:82f:a366:f295])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6d89:b0:3a2:ebc1:4620 with SMTP id adf61e73a8af0-3a39c33cdeemr5030967637.38.1777401434645;
 Tue, 28 Apr 2026 11:37:14 -0700 (PDT)
Date: Tue, 28 Apr 2026 18:36:38 +0000
In-Reply-To: <20260428183643.3796063-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260428183643.3796063-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428183643.3796063-4-dylanbhatch@google.com>
Subject: [PATCH v5 3/8] arm64: entry: add unwind info for various kernel entries
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
X-CRM114-CacheID: sfid-20260428_113716_554193_195C0751 
X-CRM114-Status: GOOD (  12.69  )
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
Suggested-by: Jens Remus <jremus@linux.ibm.com>
Reviewed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
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
2.54.0.545.g6539524ca2-goog


