Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B37DD36108
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 19:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/o1Sfs7jKQurNnafgcuR4sjtuRSNBj5DPUDtQwNcs8=; b=Q35mTIBOgmEKbDQxmGPzDHmRv/
	yyhmGQSJQEyuMy575jUoN+AL7mpSKVIgT+WAqH55xyFdDz5W+k4qjwpS7DtzDXihyvzHHYgVtaS5o
	F5dzJEmsExdMT4rS7NJNCfISIE1nBqTGhirdnSvTELbcyA58KfnCjgKh5D51qY8E8SS6PmMLNlpHi
	q0UIVAL69+fZ+ffF6r1dHcCtnlglCzQ8u8M1QlWSPORz/BukgJKCL9J08EPR6xN5MATJIlnZ+4Rr+
	XGZtZm0RsNVavK+cehZ4SAK43j6vJwAAWWIKra/jAVkdBweN+eoDfs8641xBBl8inw89S/riHfFEn
	nRA+T4Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8P10-00000000WeV-2CUZ;
	Tue, 05 Nov 2024 19:14:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OzG-00000000WSQ-3gJy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 19:13:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8EAA1063;
	Tue,  5 Nov 2024 11:13:37 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B989B3F528;
	Tue,  5 Nov 2024 11:13:06 -0800 (PST)
Date: Tue, 5 Nov 2024 19:13:04 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64/sve: Flush foreign register state in
 sve_init_regs()
Message-ID: <ZypuQNhWHKut8mLl@J2N7QTR9R3.cambridge.arm.com>
References: <20241030-arm64-fpsimd-foreign-flush-v1-0-bd7bd66905a2@kernel.org>
 <20241030-arm64-fpsimd-foreign-flush-v1-1-bd7bd66905a2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030-arm64-fpsimd-foreign-flush-v1-1-bd7bd66905a2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_111311_102996_BF011C1F 
X-CRM114-Status: GOOD (  29.50  )
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

On Wed, Oct 30, 2024 at 08:23:50PM +0000, Mark Brown wrote:
> When we update the in memory register state in sve_init_regs() we neglect
> to flush the task's CPU binding, meaning if the task is rescheduled to
> the last CPU it ran on it is possible for the check for current state in
> fpsimd_thread_switch() to falsely determine that up to date register
> state is present on the CPU.  This results in it incorrectly clearing
> TIF_FOREIGN_FPSTATE and suppress reloading.
> 
> This will also suppress the sve_user_enable() done in
> fpsimd_bind_task_to_cpu() as part of return to userspace, causing
> spurious SVE access traps.
> 
> Call fpsimd_flush_task_state() to invalidate the last loaded CPU
> recorded in the task.
> 
> Fixes: cccb78ce89c4 ("arm64/sve: Rework SVE access trap to convert state in registers")
> Reported-by: Mark Rutlamd <mark.rutland@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Cc: stable@vger.kernel.org

How about the following:

| arm64/sve: Discard stale CPU state when handling SVE traps
| 
| The logic for handling SVE traps manipulates saved FPSIMD/SVE state
| incorrectly, and a race with preemption can result in a task having
| TIF_SVE set and TIF_FOREIGN_FPSTATE clear even though the live CPU state
| is stale (e.g. with SVE traps enabled). This has been observed to result
| in warnings from do_sve_acc() where SVE traps are not expected while
| TIF_SVE is set:
| 
| |         if (test_and_set_thread_flag(TIF_SVE))
| |                 WARN_ON(1); /* SVE access shouldn't have trapped */
| 
| Warnings of this form have been reported intermittently, e.g.
| 
|   https://lore.kernel.org/linux-arm-kernel/CA+G9fYtEGe_DhY2Ms7+L7NKsLYUomGsgqpdBj+QwDLeSg=JhGg@mail.gmail.com/
|   https://lore.kernel.org/linux-arm-kernel/000000000000511e9a060ce5a45c@google.com/
| 
| The race can occur when the SVE trap handler is preempted before and
| after manipulating the saved FPSIMD/SVE state, starting and ending on
| the same CPU, e.g.
| 
| | void do_sve_acc(unsigned long esr, struct pt_regs *regs)
| | {
| |         // Trap on CPU 0 with TIF_SVE clear, SVE traps enabled
| |         // task->fpsimd_cpu is 0.
| |         // per_cpu_ptr(&fpsimd_last_state, 0) is task.
| | 
| |         ...
| | 
| |         // Preempted; migrated from CPU 0 to CPU 1.
| |         // TIF_FOREIGN_FPSTATE is set.
| | 
| |         get_cpu_fpsimd_context();
| | 
| |         if (test_and_set_thread_flag(TIF_SVE))
| |                 WARN_ON(1); /* SVE access shouldn't have trapped */
| | 
| |         sve_init_regs() {
| |                 if (!test_thread_flag(TIF_FOREIGN_FPSTATE)) {
| |                         ...
| |                         fpsimd_bind_task_to_cpu();
| |                 } else {
| |                         fpsimd_to_sve(current);
| |                         current->thread.fp_type = FP_STATE_SVE;
| |                 }
| |         }
| | 
| |         put_cpu_fpsimd_context();
| | 
| |         // Preempted; migrated from CPU 1 to CPU 0.
| |         // task->fpsimd_cpu is still 0
| |         // If per_cpu_ptr(&fpsimd_last_state, 0) is still task then:
| |         // - Stale HW state is reused (with SVE traps enabled)
| |         // - TIF_FOREIGN_FPSTATE is cleared
| |         // - A return to userspace skips HW state restore
| | }
| 
| In the case where sve_init_regs() is called while the state is live and
| TIF_FOREIGN_FPSTATE is clear, the state is correctly modified and the
| call to fpsimd_bind_task_to_cpu() disables the SVE trap.
| 
| Fix the case where the state is not live and TIF_FOREIGN_FPSTATE is set
| by calling fpsimd_flush_task_state() to detach from the saved CPU
| state. This ensures that a subsequent context switch will not reuse the
| stale CPU state, and will instead set TIF_FOREIGN_FPSTATE, forcing the
| new state to be reloaded from memory prior to a return to userspace.
| 
| Fixes: cccb78ce89c4 ("arm64/sve: Rework SVE access trap to convert state in registers")
| Reported-by: Mark Rutland <mark.rutland@arm.com>
| Signed-off-by: Mark Brown <broonie@kernel.org>
| Cc: stable@vger.kernel.org

Note: I fixed the typo (s/Rutlamd/Rutland)

With that:

Reviewed-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/kernel/fpsimd.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index 77006df20a75aee7c991cf116b6d06bfe953d1a4..6d21971ae5594f32947480cfa168db400a69a283 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -1367,6 +1367,7 @@ static void sve_init_regs(void)
>  	} else {
>  		fpsimd_to_sve(current);
>  		current->thread.fp_type = FP_STATE_SVE;
> +		fpsimd_flush_task_state(current);
>  	}
>  }
>  
> 
> -- 
> 2.39.2
> 
> 

