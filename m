Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09ACDE69EA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 15:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfC+KndoW0FwO2UhrfMj33tlEUt+labamZT9E1NY3wg=; b=YcjR1J/BbN0fRd9EIPtsruyVg5
	vuT/Av0FupdozEb/nJN6uFH0I050EdJjMQHI7GwilhtYkRwTq7dzOcoxINptlijVc1wYUbfvOXqwx
	o9ij66qW2av+Tezft1QEnSOFu5G58t+Oyv151wXuoNWzfHUrT6DqXxJECgAEmFMV1OU1a++H3rmfV
	ZTZ3QN4isTmwtFX1rkaTs8C53UnK/vmUqhVUognKB3LUF3l6t2LM2gY+fh/48cgHUJmnFeWVSl8ck
	k4CO0sdCcRPE4LiYqCqsOePbCK5IqWybC7Ebz6xow/If6/1FS222dhzy0AAr+QlHXaiWD+cDOtLPE
	dpOc2A2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUwO-00000009x6q-3Hjn;
	Tue, 03 Dec 2024 15:35:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUua-00000009wga-3P4o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 15:34:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B1C2FEC;
	Tue,  3 Dec 2024 07:34:32 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88F953F71E;
	Tue,  3 Dec 2024 07:34:03 -0800 (PST)
Date: Tue, 3 Dec 2024 15:34:01 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] arm64/signal: Consistently invalidate the in
 register FP state in restore
Message-ID: <Z08k6QsYRzO8+O4t@e133380.arm.com>
References: <20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org>
 <20241203-arm64-sme-reenable-v1-4-d853479d1b77@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203-arm64-sme-reenable-v1-4-d853479d1b77@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_073404_938825_08489AB4 
X-CRM114-Status: GOOD (  40.09  )
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

On Tue, Dec 03, 2024 at 12:45:56PM +0000, Mark Brown wrote:
> When restoring the SVE and SME specific floating point register states we
> flush the task floating point state, marking the hardware state as stale so
> that preemption does not result in us saving register state from the signal
> handler on top of the restored context and forcing a reload from memory.
> For the plain FPSIMD state we don't do this, we just copy the state from
> userspace and then force an immediate reload of the register state.
> This isn't racy against context switch since we copy the incoming data
> onto the stack rather than directly into the task struct but it's still
> messy and inconsistent.
> 
> Simplify things and avoid a potential source of error by moving the
> invalidation of the CPU state to the main restore_sigframe() and
> reworking the restore of the FPSIMD state to update the task struct and
> rely on loading as part of the general do_notify_resume() handling for
> return to user like we do for the SVE and SME state.
> 
> As a result of this the only user of fpsimd_update_current_state() is
> the 32 bit signal code which should not have any SVE state, add an
> assert there that we don't have SVE enabled.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/kernel/fpsimd.c |  2 +-
>  arch/arm64/kernel/signal.c | 70 +++++++++++++++-------------------------------
>  2 files changed, 23 insertions(+), 49 deletions(-)
> 
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index a3bb17c88942eba031d26e9f75ad46f37b6dc621..f02762762dbcf954e9add6dfd3575ae7055b6b0e 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -1828,7 +1828,7 @@ void fpsimd_update_current_state(struct user_fpsimd_state const *state)
>  	get_cpu_fpsimd_context();
>  
>  	current->thread.uw.fpsimd_state = *state;
> -	if (test_thread_flag(TIF_SVE))

Add a comment here?

(I guess people can dig for the commit message, but it's easy to miss
the original intent of WARNs when editing code.)

> +	if (WARN_ON_ONCE(test_thread_flag(TIF_SVE)))
>  		fpsimd_to_sve(current);
>  
>  	task_fpsimd_load();
> diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
> index 14ac6fdb872b9672e4b16a097f1b577aae8dec50..abd0907061fe664bf22d1995319f9559c4bbed91 100644
> --- a/arch/arm64/kernel/signal.c
> +++ b/arch/arm64/kernel/signal.c
> @@ -271,7 +271,7 @@ static int preserve_fpsimd_context(struct fpsimd_context __user *ctx)
>  
>  static int restore_fpsimd_context(struct user_ctxs *user)
>  {
> -	struct user_fpsimd_state fpsimd;
> +	struct user_fpsimd_state *fpsimd = &current->thread.uw.fpsimd_state;
>  	int err = 0;
>  
>  	/* check the size information */
> @@ -279,18 +279,14 @@ static int restore_fpsimd_context(struct user_ctxs *user)
>  		return -EINVAL;
>  
>  	/* copy the FP and status/control registers */
> -	err = __copy_from_user(fpsimd.vregs, &(user->fpsimd->vregs),
> -			       sizeof(fpsimd.vregs));
> -	__get_user_error(fpsimd.fpsr, &(user->fpsimd->fpsr), err);
> -	__get_user_error(fpsimd.fpcr, &(user->fpsimd->fpcr), err);
> +	err = __copy_from_user(fpsimd->vregs, &(user->fpsimd->vregs),
> +			       sizeof(fpsimd->vregs));
> +	__get_user_error(fpsimd->fpsr, &(user->fpsimd->fpsr), err);
> +	__get_user_error(fpsimd->fpcr, &(user->fpsimd->fpcr), err);

It does kinda make sense to align this with the way SVE/SME are handled.

I just left this as-is when developing the SVE support, because it
wasn't feasible to stage the SVE state via the stack, and I didn't want
to break the world by messing with the FPSIMD-only code paths any more
than I had to.

But you're right that we don't really gain anything any more by doing
things a special way for the plain FPSIMD case...

Doing everything the same way should help maintainability.

>  
>  	clear_thread_flag(TIF_SVE);
>  	current->thread.fp_type = FP_STATE_FPSIMD;
>  
> -	/* load the hardware registers from the fpsimd_state structure */
> -	if (!err)
> -		fpsimd_update_current_state(&fpsimd);
> -
>  	return err ? -EFAULT : 0;
>  }
>  
> @@ -396,7 +392,7 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
>  {
>  	int err = 0;
>  	unsigned int vl, vq;
> -	struct user_fpsimd_state fpsimd;
> +	struct user_fpsimd_state *fpsimd = &current->thread.uw.fpsimd_state;
>  	u16 user_vl, flags;
>  
>  	if (user->sve_size < sizeof(*user->sve))
> @@ -439,16 +435,6 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
>  	if (user->sve_size < SVE_SIG_CONTEXT_SIZE(vq))
>  		return -EINVAL;
>  
> -	/*
> -	 * Careful: we are about __copy_from_user() directly into
> -	 * thread.sve_state with preemption enabled, so protection is
> -	 * needed to prevent a racing context switch from writing stale
> -	 * registers back over the new data.
> -	 */
> -
> -	fpsimd_flush_task_state(current);
> -	/* From now, fpsimd_thread_switch() won't touch thread.sve_state */
> -
>  	sve_alloc(current, true);
>  	if (!current->thread.sve_state) {
>  		clear_thread_flag(TIF_SVE);
> @@ -471,14 +457,10 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
>  fpsimd_only:
>  	/* copy the FP and status/control registers */
>  	/* restore_sigframe() already checked that user->fpsimd != NULL. */
> -	err = __copy_from_user(fpsimd.vregs, user->fpsimd->vregs,
> -			       sizeof(fpsimd.vregs));
> -	__get_user_error(fpsimd.fpsr, &user->fpsimd->fpsr, err);
> -	__get_user_error(fpsimd.fpcr, &user->fpsimd->fpcr, err);
> -
> -	/* load the hardware registers from the fpsimd_state structure */
> -	if (!err)
> -		fpsimd_update_current_state(&fpsimd);
> +	err = __copy_from_user(fpsimd->vregs, user->fpsimd->vregs,
> +			       sizeof(fpsimd->vregs));
> +	__get_user_error(fpsimd->fpsr, &user->fpsimd->fpsr, err);
> +	__get_user_error(fpsimd->fpcr, &user->fpsimd->fpcr, err);
>  
>  	return err ? -EFAULT : 0;
>  }
> @@ -587,16 +569,6 @@ static int restore_za_context(struct user_ctxs *user)
>  	if (user->za_size < ZA_SIG_CONTEXT_SIZE(vq))
>  		return -EINVAL;
>  
> -	/*
> -	 * Careful: we are about __copy_from_user() directly into
> -	 * thread.sme_state with preemption enabled, so protection is
> -	 * needed to prevent a racing context switch from writing stale
> -	 * registers back over the new data.
> -	 */
> -
> -	fpsimd_flush_task_state(current);
> -	/* From now, fpsimd_thread_switch() won't touch thread.sve_state */
> -
>  	sme_alloc(current, true);
>  	if (!current->thread.sme_state) {
>  		current->thread.svcr &= ~SVCR_ZA_MASK;
> @@ -664,16 +636,6 @@ static int restore_zt_context(struct user_ctxs *user)
>  	if (nregs != 1)
>  		return -EINVAL;
>  
> -	/*
> -	 * Careful: we are about __copy_from_user() directly into
> -	 * thread.zt_state with preemption enabled, so protection is
> -	 * needed to prevent a racing context switch from writing stale
> -	 * registers back over the new data.
> -	 */
> -
> -	fpsimd_flush_task_state(current);
> -	/* From now, fpsimd_thread_switch() won't touch ZT in thread state */
> -
>  	err = __copy_from_user(thread_zt_state(&current->thread),
>  			       (char __user const *)user->zt +
>  					ZT_SIG_REGS_OFFSET,
> @@ -1028,6 +990,18 @@ static int restore_sigframe(struct pt_regs *regs,
>  	if (err == 0)
>  		err = parse_user_sigframe(&user, sf);
>  
> +	/*
> +	 * Careful: we are about __copy_from_user() directly into

Nit: we are about _to_ __copy_from_user()...

(Looks like this was my typo in the original ancestor of this comment
block!  Might as well fix it now, since the comments are being unified
here.)

> +	 * thread floating point state with preemption enabled, so
> +	 * protection is needed to prevent a racing context switch
> +	 * from writing stale registers back over the new data. Mark
> +	 * the register floating point state as invalid and unbind the
> +	 * task from the CPU to force a reload before we return to
> +	 * userspace. fpsimd_flush_task_state() has a check for FP
> +	 * support.
> +	 */

Maybe add a comment in fpsimd_flush_task_state() about why the
system_supports_fpsimd() check is important?  It's not obvious there
why we should ever be calling that function on non-FPSIMD systems.

> +	fpsimd_flush_task_state(current);
> +

This seems a definite improvement.  We know we're about to load
something over the task's FPSIMD / vector state, even if we don't know
exactly what.

But would it be a good idea to stick a
WARN_ON(!test_thread_flag(TIF_FOREIGN_FPSTATE)) at the start of the
functions that rely on this?

This code isn't super hot-path.

[...]

Cheers
---Dave

