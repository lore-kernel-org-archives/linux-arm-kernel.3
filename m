Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D70C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y05XFpD9jkV2IVvA4ki2HAlfx62YFmpKxQbnv9Iw8N0=; b=fODpBz0U5eTB7tmptVaKP31vZE
	vfG3/9eDe1FR5opEJOp1VB3DkD+m3C4bwCSQs2ChAjBmkpn3KcqKq/fRyjUYhGt8S1XC++o28k7pg
	KbuVrD+MKZ5QoWbhxf8wJZZC5yzFmrBX29jL6cO02mJRXHjgGKLJOVCO+g270lxXqHRi1JbCmOw2s
	h2AWGaShUE9j/Wu0htuqGkrrfiHct/IyOuTrcdMHn7XuIWr0G8vqmi2/zoXh+TMd6TmZ+dLtmWQgN
	XsgepLlRybQ9BEqZNsxBQUQ700apwS2fhBvs2+xB5I3V8+fQP7fk/jqgGDJiK7DVtEjQJZQVexzZh
	cOGdPMuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiXE-0000000GJ5G-0Tdj;
	Wed, 07 May 2025 17:26:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChOA-0000000G7HA-34YV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 16:12:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A47B7A4DB2E;
	Wed,  7 May 2025 16:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F5FC4CEE2;
	Wed,  7 May 2025 16:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746634373;
	bh=0RLqrwMsAhl2xqXyWYnpo3EgpwbWRgNXpPwCXKSnqxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V4VntZFM1KJCWu2fesTk7x4UR7hFUwMEUgzoMCzqwqZt7URM7Jn8fVOpVQwkcnRJb
	 vyzJf+J5iKgudCkjCUia9WSaMg3gxltPUmTg7ohe4z1sHZrH0qbLqc8F+snJEqgk1D
	 3T7T+TfMjRQSDv/BrSd1LD3/wkq1cNLlV+uS+Q2bIVo4R5tnxcsSlQ9efYa1gn/vbG
	 fNPajg3Oumq/5RANmGzETOzLotarwr/R43BVRjiUfUQgKafSK5CDnOEHrPq37eReNV
	 ISLG8omjKpSOKQ40YalMQqFr2T548J0fTu8xlRACNzAOsDH2BBsRce5kHCvJXPg5hz
	 4AXtPr40uidNQ==
Date: Wed, 7 May 2025 17:12:47 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, daniel.kiss@arm.com,
	david.spickett@arm.com, luis.machado@arm.com, maz@kernel.org,
	richard.sandiford@arm.com, sander.desmalen@arm.com,
	tabba@google.com, tamas.petz@arm.com, tkjos@google.com,
	yury.khrustalev@arm.com
Subject: Re: [PATCH 15/20] arm64/fpsimd: ptrace/prctl: Ensure VL changes
 leave task in a valid state
Message-ID: <20250507161246.GB2580@willie-the-truck>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
 <20250506152523.1107431-16-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506152523.1107431-16-mark.rutland@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_091254_910391_AB760E91 
X-CRM114-Status: GOOD (  37.98  )
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

On Tue, May 06, 2025 at 04:25:18PM +0100, Mark Rutland wrote:
> Currently, vec_set_vector_length() can manipulate a task into an invalid
> state as a result of a prctl/ptrace syscall which changes the SVE/SME
> vector length, resulting in several problems:
> 
> (1) When changing the SVE vector length, if the task initially has
>     PSTATE.ZA==1, and sve_alloc() fails to allocate memory, the task
>     will be left with PSTATE.ZA==1 and sve_state==NULL. This is not a
>     legitimate state, and could result in a subsequent null pointer
>     dereference.
> 
> (2) When changing the SVE vector length, if the task initially has
>     PSTATE.SM==1, the task will be left with PSTATE.SM==1 and
>     fp_type==FP_STATE_FPSIMD. Streaming mode state always needs to be
>     saved in SVE format, so this is not a legitimate state.
> 
>     Attempting to restore this state may cause a task to erroneously
>     inherit stale streaming mode predicate registers and FFR contents,
>     behaving non-deterministically and potentially leaving information
>     from another task.
> 
>     While in this state, reads of the NT_ARM_SSVE regset will indicate
>     that the registers are not stored in SVE format. For the NT_ARM_SSVE
>     regset specifically, debuggers interpret this as meaning that
>     PSTATE.SM==0.
> 
> (3) When changing the SME vector length, if the task initially has
>     PSTATE.SM==1, the lower 128 bits of task's streaming mode vector
>     state will be migrated to non-streaming mode, rather than these bits
>     being zeroed as is usually the case for changes to PSTATE.SM.
> 
> To fix the first issue, we can eagerly allocate the new sve_state and
> sme_state before modifying the task. This makes it possible to handle
> memory allocation failure without modifying the task state at all, and
> removes the need to clear TIF_SVE and TIF_SME.
> 
> To fix the second issue, we either need to clear PSTATE.SM or not change
> the saved fp_type. Given we're going to eagerly allocate sve_state and
> sme_state, the simplest option is to preserve PSTATE.SM and the saves
> fp_type, and consistently truncate the SVE state. This ensures that the
> task always stays in a valid state.
> 
> I believe these changes should not be problematic for realistic usage:
> 
> * When the SVE/SME vector length is changed via prctl(), syscall entry
>   will have cleared PSTATE.SM. Unless the task's state has been
>   manipulated via ptrace after entry, the task will have PSTATE.SM==0.
> 
> * When the SVE/SME vector length is changed via a write to the
>   NT_ARM_SVE or NT_ARM_SSVE regsets, PSTATE.SM will be forced
>   immediately after the length change, and new vector state will be
>   copied from userspace.
> 
> * When the SME vector length is changed via a write to the NT_ARM_ZA
>   regset, the (S)SVE state is clobbered today, so anyone who cares about
>   the specific state would need to install this after writing to the
>   NT_ARM_ZA regset.
> 
> The fp-ptrace test checks for this last behaviour, so I've updated it to
> match the change to the kernel.
> 
> As we need to free the old SVE state while TIF_SVE may still be set, we
> cannot use sve_free(), and using kfree() directly makes it clear that
> the free pairs with the subsequent assignment. As this leaves sve_free()
> unused, I've removed the existing sve_free() and renamed __sve_free() to
> mirror sme_free().
> 
> Fixes: 8bd7f91c03d8 ("arm64/sme: Implement traps and syscall handling for SME")
> Fixes: baa8515281b3 ("arm64/fpsimd: Track the saved FPSIMD state type separately to TIF_SVE")
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: David Spickett <david.spickett@arm.com>
> Cc: Luis Machado <luis.machado@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> ---
>  Documentation/arch/arm64/sme.rst             |   2 +-
>  arch/arm64/kernel/fpsimd.c                   | 137 ++++++++++---------
>  tools/testing/selftests/arm64/fp/fp-ptrace.c |  18 +--
>  3 files changed, 76 insertions(+), 81 deletions(-)

[...]

> +static int change_live_vector_length(struct task_struct *task,
> +				     enum vec_type type,
> +				     unsigned long vl)
> +{
> +	unsigned int sve_vl = task_get_sve_vl(task);
> +	unsigned int sme_vl = task_get_sme_vl(task);
> +	void *sve_state = NULL, *sme_state = NULL;
> +
> +	if (type == ARM64_VEC_SME)
> +		sme_vl = vl;
> +	else
> +		sve_vl = vl;
> +
> +	/*
> +	 * Allocate the new sve_state and sme_state before freeing the old
> +	 * copies so that allocation failure can be handled without needing to
> +	 * mutate the task's state in any way.
> +	 *
> +	 * Changes to the SVE vector length must not discard live ZA state or
> +	 * clear PSTATE.ZA, as userspace code which is unaware of the AAPCS64
> +	 * ZA lazy saving scheme may attempt to change the SVE vector length
> +	 * while unsaved/dormant ZA state exists.
> +	 */
> +	sve_state = kzalloc(__sve_state_size(sve_vl, sme_vl), GFP_KERNEL);
> +	if (!sve_state)
> +		goto out_mem;
> +
> +	if (type == ARM64_VEC_SME) {
> +		sme_state = kzalloc(__sme_state_size(sme_vl), GFP_KERNEL);
> +		if (!sve_state)

This should be '!sme_state'.

> +			goto out_mem;
> +	}
> +
> +	if (task == current)
> +		fpsimd_save_and_flush_current_state();
> +	else
> +		fpsimd_flush_task_state(task);
> +
> +	/*
> +	 * Always preserve PSTATE.SM and the effective FPSIMD state, zeroing
> +	 * other SVE state.
> +	 */
> +	fpsimd_sync_from_effective_state(task);
> +	task_set_vl(task, type, vl);
> +	kfree(task->thread.sve_state);
> +	task->thread.sve_state = sve_state;
> +	fpsimd_sync_to_effective_state_zeropad(task);
> +
> +	if (type == ARM64_VEC_SME) {
> +		task->thread.svcr &= ~SVCR_ZA_MASK;
> +		kfree(task->thread.sme_state);
> +		task->thread.sme_state = sme_state;
> +	}

I'm probably just missing something here, but how does this address
problem three from the commit message where exiting streaming mode
should zero the bottom bits of the vector registers?

Will

