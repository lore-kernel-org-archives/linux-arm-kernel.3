Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EB8C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 22:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=piXxKwae9uzBpYIu/Zn6s/3PXKEGnNnie257UODpRQo=; b=Ip+o8xCy378gfYaN1y+zcIRcKi
	rFYzzCo776glF0t0V8L6k4RpAmbyiUTRdlWQZRgSQo7vl0v3abeTdYPq9EFrzBq/ARK08w/GoH9SA
	1LDgHfu872YPiXYo8fukMjTpNC208ApmA6cja0HBGcg+9eiymdibo5oym5n7hiXHG6LgSvjRGHhpx
	BBApwwc+fFnnvt72gd/abtqZIuuaEohH9VaufNZBPlNhWJs+mJKCOCV2EQO+IwtmOhcv/zdEr7up4
	7bGcr+Ifl31FHR6Y5BEfXiVk5uFhZteNMiMeK0HKuOX4wS0szhgriVuXfB0VJWEHaYmU2zjncLPAF
	1ppCjBug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hHu-0000000FeFS-0g59;
	Fri, 18 Sep 2026 22:42:34 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hHh-0000000Fe4L-13o4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 22:42:26 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cbb92868263so1051451a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 15:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789771339; x=1790376139; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piXxKwae9uzBpYIu/Zn6s/3PXKEGnNnie257UODpRQo=;
        b=N++A5wRCtWHkTVwIKWeKb4YAdE298YKun4+TMFgl5qv391XSTUbJN/IGjBI8ACp7I/
         l9RjD1ldr/QdIzrM1gRCyLa1fIm7QZUEG2LkK3ueDFnuPMgR4EhmLVQJdOjzH3UNic4B
         6vPVuxQkAcdzpVUof8HPCTeSTreQfBMHYVnYq/L/4DTkyQ7VAScTQXjQyHtuoDR3+dWG
         jU/1e369BRDRLV6FXQNxcgDiXdHkEphYnbXE5tMwH92zffVzeWNzShOKxPYxMhHK093M
         q0Y7UKRGuj0d7k7aMS5k7k1WqDhJ6/ZiVOK4R5y/0ocTyIXs4cx1EVn02HjVaBbCK0F6
         EmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789771339; x=1790376139;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piXxKwae9uzBpYIu/Zn6s/3PXKEGnNnie257UODpRQo=;
        b=BZK1m9taYPsd94OXYThkgFI8yV67cdaTzx49sYWpKTil+SC7tvGynXE8ry+msNnBDb
         mR3J7GoATkrDcnCE2syX+tCcsrTzfaDZuAXi/0STXSfEIEqbj+q+3hnQaZPoXpd76It+
         +PRBf+sDarxG1d2Cg0dfuVBDOo7t64zhPuNXrU4wdPUKNCFIWr4NKQzh2YtshC7vtwOX
         kfhQ0nz/1nXVpTP2qKnh+WUrOQHwb/tNzmhvarcqiEhHER3ThQdBpI6ex/M242pjCmVM
         bDMn+UvEN59bira2+RvcJ/W/CDMRJyt0vkATIuhfwX5Ce8+EF0VAhR6Z85+KMjRoEeWu
         RApg==
X-Forwarded-Encrypted: i=1; AKwUvByYpxebx+7ogiYpCUReIl0sBHaEJZc3z8QkRGpAL5gzaDPBhrhddeThaJJnLiTScvaym6qvhxgP4dUqpepCl8IA@lists.infradead.org
X-Gm-Message-State: AFuF++nZPbvAYG8CgMOPZDopZYzsukwnScLxGpK45iC6onKoZahgPSSF
	utcu4IMmPWpXQ485xvXrdxWMcu88Vg88OsLsFLrU5BYpP/ygdcBLIKmi4MX4dxAW7qXIpJjWHhe
	jOzr/C2eOUNrKuuy/UT4xmThlvg==
X-Received: from pgbcm3.prod.google.com ([2002:a05:6a02:a03:b0:cc5:2930:2a60])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:5483:b0:3dd:a196:3090 with SMTP id adf61e73a8af0-3dda19633c6mr1593487637.64.1789771339375;
 Fri, 18 Sep 2026 15:42:19 -0700 (PDT)
Date: Fri, 18 Sep 2026 22:41:55 +0000
In-Reply-To: <20260918224157.1471085-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260918224157.1471085-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918224157.1471085-10-dylanbhatch@google.com>
Subject: [PATCH v7 09/11] arm64: entry: add unwind info for call_on_irq_stack()
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
X-CRM114-CacheID: sfid-20260918_154223_333036_6E7DC53F 
X-CRM114-Status: GOOD (  12.26  )
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
2.55.0.1082.g2b9226bbc0-goog


