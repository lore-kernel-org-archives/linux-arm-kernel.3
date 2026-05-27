Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E44CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 12:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqzEaQO/OXBNWswLNnk2hw+0c7BzSHgekUOP8OXwRVs=; b=iGTFEQspmhZv99TT5qHdrmIiSS
	fscds5ITyy29OqLH0mlrjMbRpnwJoHEDmL6xQjpTb5NLrYMEah/WmdOlLZrnkFx7EdvVskJIvhFaW
	wziHJwtJ+sYyYJl2qESLxZ7IuzrNgjiFqykG+27VbJOU/e7mm3NIKcfUlBoyjq+9eepiNLxiuPDjt
	HDV4UeUvdutoOPXesFZZ15wz0LSIZi9On8K71cEW9mWr63H4lXcIQhJJKimFSKjlKdCoZdJojkJ7H
	Nl4aleKHsjcxlu6UU/kgfv30vz5vkDzcQAuUnFq4QrlmsLUqajPWX94ijhqdkO4RN6s2v506IiUxV
	KgOe2XtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSD11-000000042zW-3ipk;
	Wed, 27 May 2026 12:05:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSD0z-000000042zB-1bxK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 12:05:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA7D72880;
	Wed, 27 May 2026 05:05:29 -0700 (PDT)
Received: from [10.1.38.169] (e121487-lin.cambridge.arm.com [10.1.38.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A51CE3F7D8;
	Wed, 27 May 2026 05:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779883534; bh=Zbxpqn4Jt/9J9sZFTsb4lQB+ojGhadpcsY1uxX/YM5w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QbFKB+7jVYsFzfC6CZJ1pOS71mhTMwWoUMCsHUiIvQtsA9VyylaEke2RIanwkvzCy
	 7DQh3WmNbyA2JaQqEg+dnLLA4AUkTebzIIvEE+Fpw4FYjUhagVYcQ8gy6cL1Vlx1AP
	 /VGoSX53cvFwGJkyY8cUdSK5lzoH74BPk/jrTVtA=
Message-ID: <7cca038b-f5bc-4dba-97cd-a77c5d5cf804@arm.com>
Date: Wed, 27 May 2026 13:05:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/18] arm64: fpsimd: Fold sve_init_regs() into
 do_sve_acc()
To: Mark Rutland <mark.rutland@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Cc: broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
 maz@kernel.org, oupton@kernel.org, tabba@google.com, will@kernel.org
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-6-mark.rutland@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260521132556.584676-6-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_050537_529570_B36CAD5C 
X-CRM114-Status: GOOD (  28.50  )
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

On 5/21/26 14:25, Mark Rutland wrote:
> For historical reasons, do_sve_acc() is structurally different from
> do_sme_acc(), and the logic to convert the task from FPSIMD to SVE is
> out-of-line in sve_init_regs(). We only use sve_init_regs() within
> do_sme_acc(), so it's not necessary for this to be a separate function.
> 
> Fold sve_init_regs() into do_sve_acc(), and simplify the associated
> comments. This makes do_sve_acc() structurally similar to do_sme_acc(),
> making it easier to see similarities and differences.
> 
> There should be no functional change as a result of this patch.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/fpsimd.c | 48 ++++++++++++++------------------------
>  1 file changed, 17 insertions(+), 31 deletions(-)
> 
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index 60a45d600b460..a8395cb303344 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -1293,31 +1293,6 @@ void sme_suspend_exit(void)
>  
>  #endif /* CONFIG_ARM64_SME */
>  
> -static void sve_init_regs(void)
> -{
> -	/*
> -	 * Convert the FPSIMD state to SVE, zeroing all the state that
> -	 * is not shared with FPSIMD. If (as is likely) the current
> -	 * state is live in the registers then do this there and
> -	 * update our metadata for the current task including
> -	 * disabling the trap, otherwise update our in-memory copy.
> -	 * We are guaranteed to not be in streaming mode, we can only
> -	 * take a SVE trap when not in streaming mode and we can't be
> -	 * in streaming mode when taking a SME trap.
> -	 */
> -	if (!test_thread_flag(TIF_FOREIGN_FPSTATE)) {
> -		unsigned long vq_minus_one =
> -			sve_vq_from_vl(task_get_sve_vl(current)) - 1;
> -		sve_set_vq(vq_minus_one);
> -		sve_flush_live(true, vq_minus_one);
> -		fpsimd_bind_task_to_cpu();
> -	} else {
> -		fpsimd_to_sve(current);
> -		current->thread.fp_type = FP_STATE_SVE;
> -		fpsimd_flush_task_state(current);
> -	}
> -}
> -
>  /*
>   * Trapped SVE access
>   *
> @@ -1349,13 +1324,24 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
>  		WARN_ON(1); /* SVE access shouldn't have trapped */
>  
>  	/*
> -	 * Even if the task can have used streaming mode we can only
> -	 * generate SVE access traps in normal SVE mode and
> -	 * transitioning out of streaming mode may discard any
> -	 * streaming mode state.  Always clear the high bits to avoid
> -	 * any potential errors tracking what is properly initialised.
> +	 * Convert the FPSIMD state to SVE. Stale SVE state can be present in
> +	 * registers or memory, so we must zero all state that is not shared
> +	 * with FPSIMD.
> +	 *
> +	 * SVE traps cannot be taken from streaming mode, so there cannot be
> +	 * any effective streaming mode SVE state.
>  	 */
> -	sve_init_regs();
> +	if (!test_thread_flag(TIF_FOREIGN_FPSTATE)) {
> +		unsigned long vq_minus_one =
> +			sve_vq_from_vl(task_get_sve_vl(current)) - 1;
> +		sve_set_vq(vq_minus_one);
> +		sve_flush_live(true, vq_minus_one);
> +		fpsimd_bind_task_to_cpu();
> +	} else {
> +		fpsimd_to_sve(current);
> +		current->thread.fp_type = FP_STATE_SVE;
> +		fpsimd_flush_task_state(current);
> +	}
>  
>  	put_cpu_fpsimd_context();
>  }
> -- 2.30.2
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


