Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5E6C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6a38ClFgPK9YKy/HK9vCEJfb18SxtUt/mXNAS7tyiuo=; b=OtIDU8EYoJ7V76J2J8tqjgGuRJ
	yC5eWTQGjFV2CctPoq+TvlwlJGcoUWS4ytRmYtl7FR8QN2JWTWTx3LnWmotBM0eLGowivp+ZfYxCR
	pgOUm0T9KqL63SsW/u7t32UkX96Tmn56QdYlLfXTe/wWGw/0I6bVeVNIHXGXBpvFnG/bL90mChBrO
	9cI7il7wweFmC51ZhCIhNvZkyuvFpL4a+3eV5qyh8yTE1miIFIT0T1RHKPWaQT8X5k8RTMcAXtbvm
	ZGBtV2syMc2VpT/IK/rjpCHhYMPv5qgIPi8f8r0FlzK2Wdc2g/ZY6hzjnL64XDDZl68krcRoj2RIC
	8VyWLOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiiP-0000000GMpo-0wHT;
	Wed, 07 May 2025 17:37:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiHh-0000000GG7A-1yAp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 17:10:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4750B16F2;
	Wed,  7 May 2025 10:10:04 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A64F93F5A1;
	Wed,  7 May 2025 10:10:12 -0700 (PDT)
Date: Wed, 7 May 2025 18:10:07 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, daniel.kiss@arm.com,
	david.spickett@arm.com, luis.machado@arm.com, maz@kernel.org,
	richard.sandiford@arm.com, sander.desmalen@arm.com,
	tabba@google.com, tamas.petz@arm.com, tkjos@google.com,
	yury.khrustalev@arm.com
Subject: Re: [PATCH 15/20] arm64/fpsimd: ptrace/prctl: Ensure VL changes
 leave task in a valid state
Message-ID: <aBuT7yS1CYsqOJNM@J2N7QTR9R3>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
 <20250506152523.1107431-16-mark.rutland@arm.com>
 <20250507161246.GB2580@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507161246.GB2580@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_101017_602275_47ABC70F 
X-CRM114-Status: GOOD (  41.36  )
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

On Wed, May 07, 2025 at 05:12:47PM +0100, Will Deacon wrote:
> On Tue, May 06, 2025 at 04:25:18PM +0100, Mark Rutland wrote:
> > Currently, vec_set_vector_length() can manipulate a task into an invalid
> > state as a result of a prctl/ptrace syscall which changes the SVE/SME
> > vector length, resulting in several problems:
> > 
> > (1) When changing the SVE vector length, if the task initially has
> >     PSTATE.ZA==1, and sve_alloc() fails to allocate memory, the task
> >     will be left with PSTATE.ZA==1 and sve_state==NULL. This is not a
> >     legitimate state, and could result in a subsequent null pointer
> >     dereference.
> > 
> > (2) When changing the SVE vector length, if the task initially has
> >     PSTATE.SM==1, the task will be left with PSTATE.SM==1 and
> >     fp_type==FP_STATE_FPSIMD. Streaming mode state always needs to be
> >     saved in SVE format, so this is not a legitimate state.
> > 
> >     Attempting to restore this state may cause a task to erroneously
> >     inherit stale streaming mode predicate registers and FFR contents,
> >     behaving non-deterministically and potentially leaving information
> >     from another task.
> > 
> >     While in this state, reads of the NT_ARM_SSVE regset will indicate
> >     that the registers are not stored in SVE format. For the NT_ARM_SSVE
> >     regset specifically, debuggers interpret this as meaning that
> >     PSTATE.SM==0.
> > 
> > (3) When changing the SME vector length, if the task initially has
> >     PSTATE.SM==1, the lower 128 bits of task's streaming mode vector
> >     state will be migrated to non-streaming mode, rather than these bits
> >     being zeroed as is usually the case for changes to PSTATE.SM.
> > 
> > To fix the first issue, we can eagerly allocate the new sve_state and
> > sme_state before modifying the task. This makes it possible to handle
> > memory allocation failure without modifying the task state at all, and
> > removes the need to clear TIF_SVE and TIF_SME.
> > 
> > To fix the second issue, we either need to clear PSTATE.SM or not change
> > the saved fp_type. Given we're going to eagerly allocate sve_state and
> > sme_state, the simplest option is to preserve PSTATE.SM and the saves
> > fp_type, and consistently truncate the SVE state. This ensures that the
> > task always stays in a valid state.
> > 
> > I believe these changes should not be problematic for realistic usage:
> > 
> > * When the SVE/SME vector length is changed via prctl(), syscall entry
> >   will have cleared PSTATE.SM. Unless the task's state has been
> >   manipulated via ptrace after entry, the task will have PSTATE.SM==0.
> > 
> > * When the SVE/SME vector length is changed via a write to the
> >   NT_ARM_SVE or NT_ARM_SSVE regsets, PSTATE.SM will be forced
> >   immediately after the length change, and new vector state will be
> >   copied from userspace.
> > 
> > * When the SME vector length is changed via a write to the NT_ARM_ZA
> >   regset, the (S)SVE state is clobbered today, so anyone who cares about
> >   the specific state would need to install this after writing to the
> >   NT_ARM_ZA regset.

[...]

> > +static int change_live_vector_length(struct task_struct *task,
> > +				     enum vec_type type,
> > +				     unsigned long vl)
> > +{
> > +	unsigned int sve_vl = task_get_sve_vl(task);
> > +	unsigned int sme_vl = task_get_sme_vl(task);
> > +	void *sve_state = NULL, *sme_state = NULL;
> > +
> > +	if (type == ARM64_VEC_SME)
> > +		sme_vl = vl;
> > +	else
> > +		sve_vl = vl;
> > +
> > +	/*
> > +	 * Allocate the new sve_state and sme_state before freeing the old
> > +	 * copies so that allocation failure can be handled without needing to
> > +	 * mutate the task's state in any way.
> > +	 *
> > +	 * Changes to the SVE vector length must not discard live ZA state or
> > +	 * clear PSTATE.ZA, as userspace code which is unaware of the AAPCS64
> > +	 * ZA lazy saving scheme may attempt to change the SVE vector length
> > +	 * while unsaved/dormant ZA state exists.
> > +	 */
> > +	sve_state = kzalloc(__sve_state_size(sve_vl, sme_vl), GFP_KERNEL);
> > +	if (!sve_state)
> > +		goto out_mem;
> > +
> > +	if (type == ARM64_VEC_SME) {
> > +		sme_state = kzalloc(__sme_state_size(sme_vl), GFP_KERNEL);
> > +		if (!sve_state)
> 
> This should be '!sme_state'.

Ugh, yes. Fixed now, thanks.

[...]

> > +	/*
> > +	 * Always preserve PSTATE.SM and the effective FPSIMD state, zeroing
> > +	 * other SVE state.
> > +	 */
> > +	fpsimd_sync_from_effective_state(task);
> > +	task_set_vl(task, type, vl);
> > +	kfree(task->thread.sve_state);
> > +	task->thread.sve_state = sve_state;
> > +	fpsimd_sync_to_effective_state_zeropad(task);
> > +
> > +	if (type == ARM64_VEC_SME) {
> > +		task->thread.svcr &= ~SVCR_ZA_MASK;
> > +		kfree(task->thread.sme_state);
> > +		task->thread.sme_state = sme_state;
> > +	}
> 
> I'm probably just missing something here, but how does this address
> problem three from the commit message where exiting streaming mode
> should zero the bottom bits of the vector registers?

The idea is that we no longer exit streaming mode, so we don't need to zero the
bottom bits.

Instead, when either the SVE or SME vector length changes, we
consitently truncate the (streaming or non-streaming) SVE registers to
128-bits, but preserve the existing value of PSTATE.SM and the saved
fp_type.

That all happens in:

	fpsimd_sync_from_effective_state(task);
	task_set_vl(task, type, vl);
	kfree(task->thread.sve_state);
	task->thread.sve_state = sve_state;
	fpsimd_sync_to_effective_state_zeropad(task);

... where:

* If the task's state was initially stored in FPSIMD format, the
  fpsimd_sync_from_effective_state() and
  fpsimd_sync_to_effective_state_zeropad() functions do not touch the
  saved FPSIMD state, leaving the low 128 bits intact.

* If the task's state was initially stored in SVE format, whether
  streaming or non-streaming, the fpsimd_sync_from_effective_state() and
  fpsimd_sync_to_effective_state_zeropad() functions copy the low 128
  bits into the FPSIMD storage, then copy that back into the new zeroed
  SVE storage.

That's what I was trying to describe in the commit message where I said:

| To fix the second issue, we either need to clear PSTATE.SM or not change
| the saved fp_type. Given we're going to eagerly allocate sve_state and
| sme_state, the simplest option is to preserve PSTATE.SM and the saves
| fp_type, and consistently truncate the SVE state. This ensures that the
| task always stays in a valid state.

... but I appreciate that mentioned the second issue and not the third.

I can add a note there, if it'd help?

Mark.

