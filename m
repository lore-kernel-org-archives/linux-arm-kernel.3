Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCA0CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 06:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=086D5frAOVBWnalU1CQBdAMt78W31bnAcSL8E1jh81w=; b=TGMdR/iuctvymocOdfJiq9giQw
	nmK1hotC8AJE4RZzU6s6tIQhQGZnsSyNS7OxyxVyb/VRDtLqlRhIwFKnNFLFELoEuRsMMfmR7svXo
	2DdNnWh7amJjqIiMc0X+2STbODOwWzD3q7ymgnOWP/nnXcgPGDqM3SI9Sj9i0q5QiMgd6TsuRlQ+s
	QZSY82TLRpNlahkM7jjDf3ITxV93WM87rnYpHCRCe4m4b+4oFyeiWFUdOFr5nfrBPzPGx2qqT1lUi
	l7mT4SjFoJoDwtCoVoJhA7CXExf9pFnCiubOQqnjzK0AEsydqdtk8NpND+z6UxTU/K/tMfoHE/C1s
	Ktn3Vfjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEHV-00000000Oa8-2NgP;
	Tue, 19 May 2026 06:50:21 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEHM-00000000OUf-37Sg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 06:50:13 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-83eefe4867eso1881059b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 23:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779173411; x=1779778211; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=086D5frAOVBWnalU1CQBdAMt78W31bnAcSL8E1jh81w=;
        b=cGqQ1OV9nOSSjzWKGK/YPKjewT9gOdXHOZ4/A6IeD6UzJOS/lSyykgYFcQU/jopi1d
         o1CRpVzWFstOfYzUgLfIbuwPlSte61eUm+rSkMdEzNdLa7BjR/mqxNEfZ5ecEp80MXMz
         qn6eSTQYVVrgWLSXvqcgRmOXBWiKARDAJkA3rrcfC0AL5UZYeQQT9dJB1ustscNzoAYV
         lglM3hSyvkRmyK0+Pgqm2hYnfD7IBnbmEqzD3d5FzfuvxQylxeSRQBMcS+EbUvZDagMl
         owFoRmAkmkzo2iXdiUrWjdjL2xVlIL+xIKKc4GruwtwUUD+iy9xIVmbQgGdDLKKt9/Qs
         keww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779173411; x=1779778211;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=086D5frAOVBWnalU1CQBdAMt78W31bnAcSL8E1jh81w=;
        b=KDu4JLWlFnQMKNEnHuKN920WCvDAqsaeohK4RFkzZVKdPpeI9ndCs6p2LA0D+rDqoj
         5fqbQsS8gHFTOR5iCLgcyREt2lzefN7OCi8lqI68h9sIvQZaPbFLXDazn30pkz327fb6
         sIs3BeJtgceamxHyZxHC4gEC719inxVEGOtppNssDrACg0YpFkDYJNBN9obGf3ZuKcOs
         U75U/MwFdubvytCBa2zjBn4NF/ZfS+XOFnWYHuLCM86qxTT3JVnDm+u95w9ctairgoyP
         hPV86IAhw7mwsE2BV3IoAifTAYkNEbKLhoBVNSix43ZxOboP5UxPLSDd4KI81nxRhaBq
         XD5A==
X-Forwarded-Encrypted: i=1; AFNElJ/nvo9jree8v7+rkJGegYLV9sjFK9K4ZdeX7GWDFWww73wZHeVg0TnhFP+31TI7LABex/CuVd2JK3IhUj4XBB3R@lists.infradead.org
X-Gm-Message-State: AOJu0Yx980Uos6tiAJktmIyr/KI/5sqzDdf3SlegfPbY4x21MSaTm1J7
	e8NL9RV3wQ7x6lDRyyACoV7JjOh8G2SMujasFfQYKgCUe1xs2y5UclIdNi3gzv9TSFK/esP/ZTS
	ECWEV6XMNJpxvwirGaTh2ZN57eg==
X-Received: from pfoo3.prod.google.com ([2002:a05:6a00:1a03:b0:82f:d8c0:fef8])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:e11:b0:837:a211:4ed0 with SMTP id d2e1a72fcca58-83f33de8025mr17898871b3a.41.1779173410955;
 Mon, 18 May 2026 23:50:10 -0700 (PDT)
Date: Tue, 19 May 2026 06:49:44 +0000
In-Reply-To: <20260519064950.493949-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260519064950.493949-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519064950.493949-4-dylanbhatch@google.com>
Subject: [PATCH v6 3/9] arm64: entry: add unwind info for call_on_irq_stack()
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>, joe.lawrence@redhat.com, 
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>, Mostafa Saleh <smostafa@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_235012_792299_3F3244D2 
X-CRM114-Status: GOOD (  12.53  )
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

Frame pointers alone are usually sufficient to recover stack frames
(without CFI), except at the exception boundary, where more information
is needed to determine if the LR is live.

Since an exception can be taken from call_on_irq_stack(), annotate it
with CFI. The actual entry assembly functions are left untouched, since
they are not expected to take exceptions themselves.

Signed-off-by: Weinan Liu <wnliu@google.com>
Suggested-by: Jens Remus <jremus@linux.ibm.com>
Reviewed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/arm64/kernel/entry.S | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index e0db14e9c843..5f4172ba4274 100644
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
@@ -870,6 +876,7 @@ NOKPROBE(ret_from_fork)
  * Calls func(regs) using this CPU's irq stack and shadow irq stack.
  */
 SYM_FUNC_START(call_on_irq_stack)
+	.cfi_startproc
 	save_and_disable_daif x9
 #ifdef CONFIG_SHADOW_CALL_STACK
 	get_current_task x16
@@ -880,6 +887,9 @@ SYM_FUNC_START(call_on_irq_stack)
 	/* Create a frame record to save our LR and SP (implicit in FP) */
 	stp	x29, x30, [sp, #-16]!
 	mov	x29, sp
+	.cfi_def_cfa 29, 16
+	.cfi_offset 29, -16
+	.cfi_offset 30, -8
 
 	ldr_this_cpu x16, irq_stack_ptr, x17
 
@@ -895,9 +905,13 @@ SYM_FUNC_START(call_on_irq_stack)
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
2.54.0.563.g4f69b47b94-goog


