Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89278C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 05:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVMXmYryI27X+k6C+3JPZc/OW08qobGZWXfOZhg3D5E=; b=Fn0pwV8a+nUunqDcDg3t0otanu
	3fzeTqey35kN6K3b7yIJA4nUk4EK0EqeqGDwd3530L7R0edRLb15gtGc+DeMHxmmiwMoDcrV84FYj
	W4WLLw92RAJRSoSswcKIhZvdQFJ+rqEWEXViq4N794jlxOawiAnsTkGkhpsqCxHyiBK8xbsIpmOA+
	EzFpr7lBnWukG2SVqAgAlsMfVF2S0zOUUHFErdZUY/+IfOXueRLO1lyZhbkZ4k+Mch8UZ7KHRS4hX
	j4wuf9Xh/wO6eSoYUiq823XEt+oOXS6+Gvnfvkshr1/aGCOtOniu+LVJJkbTdOaRWk2Ls7eXEcYPY
	Kx8LAG8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue5e7-00000001LHS-0lrc;
	Tue, 22 Jul 2025 05:34:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue5ba-00000001L2y-0Gih
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 05:31:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A1260418A4
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 05:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D1DC4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 05:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753162317;
	bh=jwCZJ228g/XxK4rmoBUGmvkBnia7AFUz1V6Ln7YFp5U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Hv5st3PjM58WLE8Odte8yZY81vZOwHHnrXOr3YySyB+12261yynaGpgZ6wOt6uPW5
	 BTKzBGEGKSlH/22i6WyauEwKQp3gfmNitrUxcyp4M5UffgqUwaYYCiJGbw0izQvscq
	 0q3TKcFNWFgEMK3oQtwqdgYobtT/FOvGqQ/3fIwn3Bb1jegpgOQkjde8weW5SaV618
	 VBevfN4WIyH1rYuz4h3O0H0tm9uNhzPUNAGR6zQikQ1XXpTy+BNRDjO2BXedbMNVNX
	 3gjkLVx5ZxbQiXcVaHbQEKxbhrrl5p459YjnghbmaOCgKG+FfBjO+0S7LIgwBpD8wq
	 Vh46XQpLyzqYw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553b5165cf5so6005933e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 22:31:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUNUKdhfuW0Ww3GIysnSYcxO1PxwEUKl07eRT9ahSuHBElUwX205IpFG24qMFc5oI/lqK3/GV4CPiBI7CTKOaY@lists.infradead.org
X-Gm-Message-State: AOJu0YwEXRxGF88gzvfJpjXdnGeDiUf5Uj46zng4tteCBXI1Cj4uLHZW
	RTA/5XQkInSrJit0TB2m4a8r1L55pgoG4NZ1xCceEN3p1R08/Q2pUQZgg3+X82rKQ3ZjaE5rwfj
	NmnAlQHwASPRx17MuvZW/S8/ZY5T85kI=
X-Google-Smtp-Source: AGHT+IFdYr4M4GzDek3WNNiCy5w9d4Vlxjdh/+71vUadHqoKtocuI7NncX81ueO448QUkaNGSNUTzPtI2nxXvI8aJro=
X-Received: by 2002:a05:6512:131a:b0:55a:32c4:8716 with SMTP id
 2adb3069b0e04-55a32c48fe8mr4590748e87.28.1753162315823; Mon, 21 Jul 2025
 22:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250718142814.133329-1-ada.coupriediaz@arm.com> <aH5MPwJJzFZxOtfr@willie-the-truck>
In-Reply-To: <aH5MPwJJzFZxOtfr@willie-the-truck>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 22 Jul 2025 15:31:44 +1000
X-Gmail-Original-Message-ID: <CAMj1kXG40=hymhdL1GM0dDfp3F_-TzYqzkda3DY1CSRGAhme+g@mail.gmail.com>
X-Gm-Features: Ac12FXxsehLts9bXJJL5Ho3Iq_Q0lDwcTFs75oe7u7MscSAhEQxKVlgGauWooSk
Message-ID: <CAMj1kXG40=hymhdL1GM0dDfp3F_-TzYqzkda3DY1CSRGAhme+g@mail.gmail.com>
Subject: Re: [PATCH] arm64/entry: Mask DAIF in cpu_switch_to(), call_on_irq_stack()
To: Will Deacon <will@kernel.org>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_223158_150038_C503ADFD 
X-CRM114-Status: GOOD (  40.87  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, Cristian Prundeanu <cpru@amazon.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

(cc Sami)

On Tue, 22 Jul 2025 at 00:18, Will Deacon <will@kernel.org> wrote:
>
> On Fri, Jul 18, 2025 at 03:28:14PM +0100, Ada Couprie Diaz wrote:
> > `cpu_switch_to()` and `call_on_irq_stack()` manipulate SP to change
> > to different stacks along with the Shadow Call Stack if it is enabled.
> > Those two stack changes cannot be done atomically and both functions
> > can be interrupted by SErrors or Debug Exceptions which, though unlikely,
> > is very much broken : if interrupted, we can end up with mismatched stacks
> > and Shadow Call Stack leading to clobbered stacks.
> >
> > In `cpu_switch_to()`, it can happen when SP_EL0 points to the new task,
> > but x18 stills points to the old task's SCS. When the interrupt handler
> > tries to save the task's SCS pointer, it will save the old task
> > SCS pointer (x18) into the new task struct (pointed to by SP_EL0),
> > clobbering it.
> >

In this case, the 'interrupt handler' is not the entry code, but
call_on_irq_stack(), right?

> > In `call_on_irq_stack()`, it can happen when switching from the task stack
> > to the IRQ stack and when switching back. In both cases, we can be
> > interrupted when the SCS pointer points to the IRQ SCS, but SP points to
> > the task stack. The nested interrupt handler pushes its return addresses
> > on the IRQ SCS. It then detects that SP points to the task stack,
> > calls `call_on_irq_stack()` and clobbers the task SCS pointer with
> > the IRQ SCS pointer, which it will also use !
> >
> > This leads to tasks returning to addresses on the wrong SCS,
> > or even on the IRQ SCS, triggering kernel panics via CONFIG_VMAP_STACK
> > or FPAC if enabled.
> >
> > This is possible on a default config, but unlikely.
> > However, when enabling CONFIG_ARM64_PSEUDO_NMI, DAIF is unmasked and
> > instead the GIC is responsible for filtering what interrupts the CPU
> > should receive based on priority.
> > Given the goal of emulating NMIs, pseudo-NMIs can be received by the CPU
> > even in `cpu_switch_to()` and `call_on_irq_stack()`, possibly *very*
> > frequently depending on the system configuration and workload, leading
> > to unpredictable kernel panics.
> >
> > Completely mask DAIF in `cpu_switch_to()` and restore it when returning.
> > Do the same in `call_on_irq_stack()`, but restore and mask around
> > the branch.
> > Mask DAIF even if CONFIG_SHADOW_CALL_STACK is not enabled for consistency
> > of behaviour between all configurations.
> >
> > Introduce and use an assembly macro for saving and masking DAIF,
> > as the existing one saves but only masks IF.
> >
> > Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > Reported-by: Cristian Prundeanu <cpru@amazon.com>
> > Fixes: 59b37fe52f49955791a460752c37145f1afdcad1 ("arm64: Stash shadow stack pointer in the task struct on interrupt")
> > ---
> > Hi,
> > I spent some time evaluating the performance impact of this change
> > to make sure that it would be OK to mask in those functions.
> > They have very few instructions so have few chances to be interrupted
> > to begin with so the impact should be minimal.
>
> It's definitely worthwhile doing the benchmarking, so thanks for that,
> but realistically I don't think we have an awful lot of choice but to
> fix this, do we?
>

So AIUI, the problem is that both cpu_switch_to() and
call_on_irq_stack() itself can be interrupted by the latter, resulting
in the shadow call stack pointer recorded in the task struct to be
incorrect, either because the task struct pointer is pointing to the
wrong task, or the shadow stack pointer is pointing to the wrong
stack.

Commit 59b37fe52f49955 changed this code to ensure that the shadow
stack pointer is not preserved to/restored from the ordinary stack,
because that turns call_on_irq_stack() into a rather useful gadget but
use the task struct instead.

What we could do instead is record the caller's SCS pointer on the IRQ
shadow stack, avoiding the task struct altogether. This should be the
only occurrence of scs_save that may interrupt cpu_switch_to(), so it
should address both issues AFAICT.

The only minor issue is that loading the IRQ shadow stack pointer
before assigning SP is problematic, because when call_on_irq_stack()
is re-entered over the top of an exception that is taken at that
point, the clobbering of scs_sp will interfere with the return from
that exception, and so scs_sp should be left untouched until after SP
is assigned (which is what prevents call_on_irq_stack() from
re-entering). This creates a tiny window where we may end up servicing
a (nested) IRQ running on the IRQ stack but on the task shadow stack,
but I don't think that is a thing to obsess about tbh. (Sami?) If it
is, we'll need your DAIF changes to turn that into a proper critical
section, but I doubt whether that is necessary.


--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -874,12 +874,6 @@ NOKPROBE(ret_from_fork)
  * Calls func(regs) using this CPU's irq stack and shadow irq stack.
  */
 SYM_FUNC_START(call_on_irq_stack)
-#ifdef CONFIG_SHADOW_CALL_STACK
-       get_current_task x16
-       scs_save x16
-       ldr_this_cpu scs_sp, irq_shadow_call_stack_ptr, x17
-#endif
-
        /* Create a frame record to save our LR and SP (implicit in FP) */
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
@@ -888,7 +882,23 @@ SYM_FUNC_START(call_on_irq_stack)

        /* Move to the new stack and call the function there */
        add     sp, x16, #IRQ_STACK_SIZE
+#ifdef CONFIG_SHADOW_CALL_STACK
+       mov     x16, scs_sp
+       ldr_this_cpu scs_sp, irq_shadow_call_stack_ptr, x17
+#ifdef CONFIG_DYNAMIC_SCS
+       cbz     scs_sp, 0f
+#endif
+       str     x16, [scs_sp], #8
+0:
+#endif
        blr     x1
+#ifdef CONFIG_SHADOW_CALL_STACK
+#ifdef CONFIG_DYNAMIC_SCS
+       cbz     scs_sp, 1f
+#endif
+       ldr     scs_sp, [scs_sp, #-8]
+1:
+#endif

        /*
         * Restore the SP from the FP, and restore the FP and LR from the
@@ -896,7 +906,6 @@ SYM_FUNC_START(call_on_irq_stack)
         */
        mov     sp, x29
        ldp     x29, x30, [sp], #16
-       scs_load_current
        ret
 SYM_FUNC_END(call_on_irq_stack)
 NOKPROBE(call_on_irq_stack)

