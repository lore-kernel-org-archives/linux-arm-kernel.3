Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD78CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nxfrq1oErs1k/vPJqSmHMRIqd6UamZQptG6IeTh3sVg=; b=hG4VOW/YhTRKPD4lDZLk0lJcEV
	JbBdCS0tSovPua6UpBKnQvRukx/KzfF4T7ULD5bSaFIlZzfTcfmTV37Y2VxbDhcVe72GvnnzM/6Fb
	Yx1P4Q0vOG2VW7mxqGDiL0Yt0qSDNknjoRZeTWbL664aBQK8B4YiOW2a/fG7XHoHRbRsCTG882b44
	wpKQfBJrKi6MMyr7Ai2xjNyt+ylxM2ZAbImdIf0WmWdw7J/Vll02tOqNtDpRFG366z0Ya2qURQ/p5
	3BAQ3BYIEgErlzzyCARaTurtUVm4XkfIl+L5vVKkDLmggpPWkdh1Pc/Tdl90xH21YLH/SArKuu/fj
	YPKRw0DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFNh-00000001DPN-465D;
	Mon, 28 Sep 2026 17:43:13 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMe-00000001Clg-3jiX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:42:10 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-48af11f8d62so29820f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617326; x=1791222126; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nxfrq1oErs1k/vPJqSmHMRIqd6UamZQptG6IeTh3sVg=;
        b=ONYV23PiB6B0TayOuToG6JMXO2p3YoMYqg82je4gz5ARzFHxqXbMj9u8sht0r914QU
         II84b63uXHN5ROebKSgXK9zadC/7sCNATb8SmoZubxoUFV30YQ70MTCRRAjOnX0dRjV7
         p4O1wSOKkuLgcyUxxb0JZoOEU18qqwzIVBOl3RJoQPJdCg2WjTRtRDY3XRs5G3L25++U
         BmmqvfNz9pr2IbpC8tvFeVaUPYTFDt4rb4XOS7i1T6o1DwMJbJjenC9Te3lELgjDEMfR
         4HFkbe/D+4dkjdd252MpUHYfyb8zoQAl02ylyFVqnMzs9rULBcrab6jAfoOAkVcMRXSP
         ERoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617326; x=1791222126;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nxfrq1oErs1k/vPJqSmHMRIqd6UamZQptG6IeTh3sVg=;
        b=lTdYFAbza+qyFUDmb57win+Df7ncy7HSuQNpbAj+t/hceQUBQWAulZRaOxoMSfyZ99
         ys81eMDrDJTryFiqnz7VzSfs+2c0YjtCN7OrGYOMDH+wDoOBaifzcbJmlj2mz8qIBmGi
         9J2CgqxDH+kgbONU8Ja4YloyrmyubOvxwGDbD7Dk6QCwAA4Ol2znLDfsUYvUOwTsKoDd
         gPQyySBoX5eb/LASRk1hDY/Pcqua8NSIOrjEdra1GaLz6xcK8xW3mJLZo0mJJzG9veYI
         d3kukFdHQ6zWY9IRC4izGyliKuM88YKHtMqr78iIB2+MzkIm/P9f4bzbCsV9v8VBP5Ud
         Q+kg==
X-Forwarded-Encrypted: i=1; AKwUvBzr6JGkkIRjGcHuBv51ZBHxp4Op6MTW1oODn1Q1IjYdStWdB44lYgpromUoYVwixiLn+ghQy+Hz60A/nNJQwxuG@lists.infradead.org
X-Gm-Message-State: AFuF++lHj87Vam1H4a4lkqh/yeDxOlrxMXKTJn7Nt5eqyyL1mG01rgvq
	L/DEIPT+tvqbfVEJHLKrj6BdzFemzLUjIG0jDTFrqQyuS2uDcGUTXBwuf09n2rQyUqAXtc3L9py
	8RcYCQT96ctgu0Q==
X-Received: from wmpg37.prod.google.com ([2002:a05:600c:4ca5:b0:4a0:6b:ade5])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f12:b0:49f:ce78:356b with SMTP id 5b1f17b1804b1-49fe6700d0cmr271026815e9.28.1790617325440;
 Mon, 28 Sep 2026 10:42:05 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:21 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-15-smostafa@google.com>
Subject: [RFC PATCH 14/15] arm64: mm: Relax kernel stack alignment
From: Mostafa Saleh <smostafa@google.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	akpm@linux-foundation.org, urezki@gmail.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, kees@kernel.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, gustavoars@kernel.org, 
	bigeasy@linutronix.de, clrkwllms@kernel.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_104208_973118_FD5D2E65 
X-CRM114-Status: GOOD (  18.89  )
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

On the kernel entry it was not possible to use the stack until it
was checked for overflow which was done by a clever trick relying
on aligning the kernel stack to double it's size, so if the
bit at THREAD_SHIFT was set it means that the stack pointer has
overflowed.

Now, we can easily switch the sp to sp_el1 which is the overflow
stack, push some registers and execute more complex flow.

Rework the kernel entry code to eliminate the tbnz check and the
alignment requirement.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/include/asm/memory.h |  7 +--
 arch/arm64/kernel/entry.S       | 87 ++++++++++++++++++++++++++++-----
 2 files changed, 77 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index 93ce6ef65573..4545d9b39bd5 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -130,12 +130,7 @@
 
 #define THREAD_SIZE		(UL(1) << THREAD_SHIFT)
 
-/*
- * By aligning VMAP'd stacks to 2 * THREAD_SIZE, we can detect overflow by
- * checking sp & (1 << THREAD_SHIFT), which we can do cheaply in the entry
- * assembly.
- */
-#define THREAD_ALIGN		(2 * THREAD_SIZE)
+#define THREAD_ALIGN		THREAD_SIZE
 
 #define IRQ_STACK_SIZE		THREAD_SIZE
 
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index a31ef890a2ee..ea733b673970 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -62,15 +62,33 @@
 	sub	sp, sp, #PT_REGS_SIZE
 
 	/*
-	 * Test whether the SP has overflowed, without corrupting a GPR.
-	 * Task and IRQ stacks are aligned so that SP & (1 << THREAD_SHIFT)
-	 * should always be zero.
+	 * Test whether the SP has overflowed, using the overflow stack.
+	 * As we do not know if the CPU was in process or irq context, first
+	 * check against the task stack if that failed it means it might have
+	 * been an interrupt, so check against an interrupt stack, if both
+	 * failed it means that at least one of the stacks overflowed.
 	 */
-	add	sp, sp, x0			// sp' = sp + x0
-	sub	x0, sp, x0			// x0' = sp' - x0 = (sp + x0) - x0 = sp
-	tbnz	x0, #THREAD_SHIFT, __bad_stack
-	sub	x0, sp, x0			// x0'' = sp' - x0' = (sp + x0) - sp = x0
-	sub	sp, sp, x0			// sp'' = sp' - x0 = (sp + x0) - x0 = sp
+	msr	spsel, #1
+	stp	x0, x1, [sp, #-16]!
+
+	mrs	x0, tpidrro_el0
+	ldr	x0, [x0, #TSK_STACK]
+	msr	spsel, #0
+	mov	x1, sp
+	msr	spsel, #1
+	sub	x1, x1, x0
+	cmp	x1, #THREAD_SIZE
+	b.lo	.Lstack_ok\@
+
+	/* Check whether we are on the IRQ, SDEI or EFI stacks. */
+	stp	x2, x30, [sp, #-16]!
+	bl	__check_ext_stacks
+	ldp	x2, x30, [sp], #16
+
+.Lstack_ok\@:
+	ldp	x0, x1, [sp], #16
+	msr	spsel, #0
+
 	b	el1t_\regsize\()_\label
 	.endm
 
@@ -528,13 +546,60 @@ SYM_CODE_START(vectors)
 	kernel_ventry	0, t, 32, error		// Error 32-bit EL0
 SYM_CODE_END(vectors)
 
+
+	.macro check_stack_overflow type, ptr, size
+	.ifc \type, percpu
+	ldr_this_cpu x1, \ptr, x0
+	.else
+	adr_l	x1, \ptr
+	ldr	x1, [x1]
+	.endif
+	cbz	x1, 1f
+	.ifc \type, top
+	sub	x1, x1, #\size
+	.endif
+	msr	spsel, #0
+	mov	x0, sp
+	msr	spsel, #1
+	sub	x0, x0, x1
+	cmp	x0, #\size
+	b.lo	2f
+1:
+	.endm
+
+SYM_CODE_START_LOCAL(__check_ext_stacks)
+	/* IRQ stack check */
+	check_stack_overflow percpu, irq_stack_ptr, IRQ_STACK_SIZE
+#ifdef CONFIG_ARM_SDE_INTERFACE
+	/* SDEI normal stack check */
+	check_stack_overflow percpu, sdei_stack_normal_ptr, IRQ_STACK_SIZE
+	/* SDEI critical stack check */
+	check_stack_overflow percpu, sdei_stack_critical_ptr, IRQ_STACK_SIZE
+#endif
+
+#ifdef CONFIG_EFI
+	/* EFI runtime stack check */
+	check_stack_overflow top, efi_rt_stack_top, THREAD_SIZE
+#endif
+
+	/* All checks failed => it's a real overflow */
+	ldp	x2, x30, [sp], #16
+	b	__bad_stack
+
+2:
+	/* A check succeeded => return to kernel_ventry */
+	ret
+SYM_CODE_END(__check_ext_stacks)
+
 SYM_CODE_START_LOCAL(__bad_stack)
 	/*
 	 * We detected an overflow in kernel_ventry.
-	 * Restore SP and X0.
+	 * Restore X0 and X1, and pop the overflow stack.
 	 */
-	sub	x0, sp, x0
-	sub	sp, sp, x0
+	ldp	x0, x1, [sp], #16
+
+	/* Restore SP_EL0 */
+	msr	spsel, #0
 	add	sp, sp, #PT_REGS_SIZE
 
 	/* Switch to the overflow stack */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


