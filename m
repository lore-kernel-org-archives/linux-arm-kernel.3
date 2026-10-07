Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9394CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l81J79D4i1POsrCPf+Pwq64LjZ2oqmV8MJetLifQiQs=; b=XWqcq2mQo2JhSyWFhCwNk1c5oc
	SRivEHze2uNgGFPrpALTVfqMfLqCOaRYmvpJBgw3iG2mgL52yyUHbVerxorfvwHVld2WJSO7+VTD6
	dGIZaQM2XKsBuFtd1gJLJUB1fAMXUC0vYv3Ik8yrDZQWh7FXT4hMmTuxbt56M/xy9bQ5VejaFxnbJ
	TDCIKCkJOb7UzcPj/t+jzMbeW19v1s2m3Li6h9tAuztB3S21bv30NFxwxsuNiD1dfd65LpOeMFh+S
	QeCg0JluN8DyuH1xDPkt7Um1nAWZ3a0ZdYbouZePIFQR4kTCppXffQvnk5DVuAFuHKh80nb+nCcPZ
	IRETBjxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ4A-00000002N1I-0RXI;
	Wed, 07 Oct 2026 11:44:10 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ47-00000002MuN-1Drn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:44:08 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-88f2b158139so2484172b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791373443; x=1791978243; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l81J79D4i1POsrCPf+Pwq64LjZ2oqmV8MJetLifQiQs=;
        b=GJHLbclx2q1MfeyUuUGp597R1pV+oV35lWihUpunhS2wEZ4YgrLoihpzyN/pzu4jV7
         H4eW68b2InHJLuUq+TsJSeWdIgTWNRcz5X+QySr6R1yPpS/RqH66L8TparYrotww1G9y
         9rHBmjHjddpjG+2YQ5G14ywwoZZrFlUM+KaX5mDfCQdcwPj/ldclOtpjQlHfFXKtpdsv
         mPZnBOX7MTdvvV2rP/SjK0G81JeWZh9BAuvuOdnQLSwv40giOo+Ep/kmeSKkxdyy2JcZ
         1DJT6+C9sKhSbJCCZow7y8lHSRFmPXpW0cfgfn+Aqour9ECTLr06FGVsYZeSJzjMOB/c
         qgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373443; x=1791978243;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l81J79D4i1POsrCPf+Pwq64LjZ2oqmV8MJetLifQiQs=;
        b=uUPt5/pYgiVjRvYCtzOejJMcn2U1CiXziMah3xjVjkrtWkkCZTDrU73ZYjXAagWBPI
         6PEKDFmikh575rHYetpaB8XasmaUBaEx/htzdIEpSKx5N7CVkbkIDe9/+cmhxQmC6aSy
         MwJcnYR283Qt8yyDlgureDT2NEMMPs/JpLYFT0h1GiAdZG0mFeoAxq7NrAnqYJEhgkOc
         mZfD/dVx4BGuErP67fllZz3bblbV4DEIBtyQ60XDl4WpOLz3zAVyrBrXVPalisUa1pZC
         zI+LqeLhd0yFIZUn8xbG2VmrsShAZ6RTbjY5eDg8KdWnyrOE57CdxTXoGrPCAW7z6FbX
         Uryg==
X-Forwarded-Encrypted: i=1; AKwUvBxDE1p6Gsd4wTv/MQ5a4gzWXCvn4IB2VCIiJT37ILykrfhWZVp6r0eK3dutupN4llDEOGXw1YtAAIbv/yH6JrzA@lists.infradead.org
X-Gm-Message-State: AFuF++kf/XqoIANznQm9v8kdonL1QsNPoeTmvma7k7VVrk3AB3grYEP4
	x9beMXmleqmQ3pKqTNOtXVCtZvJGz3kWhaSmt8ovwF3dE04wWvFIskbFWaGFU8JKKsN5D/rpfqI
	Br56QIMPXXVf//GKGdIuiJSVOtg==
X-Received: from pfbfs11.prod.google.com ([2002:a05:6a00:818b:b0:880:3605:84e5])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2995:b0:878:3507:8d5e with SMTP id d2e1a72fcca58-891b48f75edmr1559429b3a.37.1791373442790;
 Wed, 07 Oct 2026 04:44:02 -0700 (PDT)
Date: Wed,  7 Oct 2026 11:43:33 +0000
In-Reply-To: <20261007114335.440322-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20261007114335.440322-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
Message-ID: <20261007114335.440322-10-dylanbhatch@google.com>
Subject: [PATCH v8 09/11] arm64: entry: add unwind info for call_on_irq_stack()
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
X-CRM114-CacheID: sfid-20261007_044407_546518_1893E973 
X-CRM114-Status: GOOD (  12.72  )
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
index f63049ac32dc6..3703acbeb16a5 100644
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
@@ -866,6 +872,7 @@ NOKPROBE(ret_from_fork)
  * Calls func(regs) using this CPU's irq stack and shadow irq stack.
  */
 SYM_FUNC_START(call_on_irq_stack)
+	.cfi_startproc
 	save_and_disable_daif x9
 #ifdef CONFIG_SHADOW_CALL_STACK
 	get_current_task x16
@@ -876,6 +883,9 @@ SYM_FUNC_START(call_on_irq_stack)
 	/* Create a frame record to save our LR and SP (implicit in FP) */
 	stp	x29, x30, [sp, #-16]!
 	mov	x29, sp
+	.cfi_def_cfa 29, 16
+	.cfi_offset 29, -16
+	.cfi_offset 30, -8
 
 	ldr_this_cpu x16, irq_stack_ptr, x17
 
@@ -891,9 +901,13 @@ SYM_FUNC_START(call_on_irq_stack)
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
2.56.0.360.g66cac248cb-goog


