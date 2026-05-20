Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB5FCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 13:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fmc0UBFCeNbgxZ/HVnRCiKiV+eLG7UsGLkScWP+yos=; b=agyDpD1cItqBwaw+qLXUOqGXa/
	5uMg9E1+OiATZrSpfxerKOeTi/fj9peJseNOQC77jRQ5/u7rfVR4m62U/pC2M3FnsUZ6VClCugZ73
	+//y+fod9LY12bMf7Z42H9e7KJNAtx5WJ5cJKCqMXAQqDNiHULHrSxztsak+3YS8lV3MO6j6O7QO0
	1wZ9EHcN75i2SxE8nGpO4cSDwpay2EbwnIeQV/y8TLnT4jHqRlNp3yUz5XfgbEEEG7o4mUA5a3kbK
	xz6872lbnU5CAquWt3mYR3PfZh8iOa9vo+stHOCOp48QsCm5oSWvscqssaMqqsFyLMWkGSGLjME2U
	ebEa3yzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgZE-00000004dCp-0KQ8;
	Wed, 20 May 2026 13:02:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgZB-00000004dCB-3PTb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 13:02:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62A691516;
	Wed, 20 May 2026 06:02:20 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E18A3F85F;
	Wed, 20 May 2026 06:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779282145; bh=EouBC0yqkVKdLRVBmbSVOwjS0lsH3zO5YOwcji/96BI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SOF+eZMXF24B1OFynsRWIEETVfZ0f67BmjjkvJRHBGxpQrmojbkVsqClEWUipTkch
	 t+BKe5MqCoHhbo6wv2ohysbnGpMe3aZPxCwR4fRh5SAzhvyWgo9pbK19+xcNFQhHcC
	 X2zZhkc2C4d7z7D27aVI2NQ5p/qsqU/0+vWT3u/4=
Date: Wed, 20 May 2026 14:02:08 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2 2/2] KVM: arm64: nv: Don't save/restore FP register
 during a nested ERET or exception
Message-ID: <ag2w0G34NycT2456@J2N7QTR9R3.cambridge.arm.com>
References: <20260520085036.541666-1-maz@kernel.org>
 <20260520085036.541666-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520085036.541666-3-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_060229_983784_9C8C887E 
X-CRM114-Status: GOOD (  33.46  )
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

On Wed, May 20, 2026 at 09:50:36AM +0100, Marc Zyngier wrote:
> When switching between L1 and L2, we save the old state using
> kvm_arch_vcpu_put(), mutate the state in memory, then load the new
> state using kvm_arch_vcpu_load(). Any live FPSIMD/SVE state is saved
> and unbound, such that it can be lazily restored on a subsequent trap.
> 
> The FPSIMD/SVE state is shared by exception levels, and only a handful
> of related control registers need to be changed when transitioning
> between L1 and L2. The save/restore of the common state is needless
> overhead, especially as trapping becomes exponentially more expensive
> with nesting.
> 
> Avoid this overhead by leaving the common FPSIMD/SVE state live on the
> CPU, and only switching the state that is distinct for L1 and L2:
> 
> - the trap controls: the effective values are recomputed on each entry
>   into the guest to take the EL into account and merge the L0 and L1
>   configuration if in a nested context, or directly use the L0 configuration
>   in non-nested context (see __activate_traps()).
> 
> - the VL settings: the effective values are are also recomputed on each
>   entry into the guest (see fpsimd_lazy_switch_to_guest()).
>
> Since we appear to cover all bases, use the vcpu flags indicating the
> handling of a nested ERET or exception delivery to avoid the whole FP
> save/restore shenanigans. SME will have to be similarly dealt with when
> it eventually gets supported.
> 
> For an EL1 L3 guest where L1 and L2 have this optimisation, this
> results in at least a 10% wall clock reduction when running an I/O
> heavy workload, generating a high rate of nested exceptions.

There's on additional thing that's important, but I forgot to mention
last time: in the window between kvm_arch_vcpu_put() and
kvm_arch_vcpu_load(), it's possible to take an interrupt, and for a
softirq handler to try to use kernel mode NEON.

Due to that, kvm_arch_vcpu_put() must leave the L1 guest's maximum VL
configured in the host's ZCR_ELx, such that the guest's state can be
saved.

That value is configured by fpsimd_lazy_switch_to_host(), so we just
need to make sure that kvm_arch_vcpu_put() doesn't clobber it. I *think*
that's fine today, but maybe that warrants a comment somewhere.

Other than that, this all looks good to me:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/fpsimd.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
> index 15e17aca1dec0..aca98752a6e42 100644
> --- a/arch/arm64/kvm/fpsimd.c
> +++ b/arch/arm64/kvm/fpsimd.c
> @@ -28,6 +28,20 @@ void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
>  	if (!system_supports_fpsimd())
>  		return;
>  
> +	/*
> +	 * Avoid needless save/restore of the guest's common
> +	 * FPSIMD/SVE/SME regs during transitions between L1/L2.
> +	 *
> +	 * These transitions only happens in a non-preemptible context
> +	 * where the host regs have already been saved and unbound. The
> +	 * live registers are either free or owned by the guest.
> +	 */
> +	if (vcpu_get_flag(vcpu, IN_NESTED_ERET) ||
> +	    vcpu_get_flag(vcpu, IN_NESTED_EXCEPTION)) {
> +		WARN_ON_ONCE(host_owns_fp_regs());
> +		return;
> +	}
> +
>  	/*
>  	 * Ensure that any host FPSIMD/SVE/SME state is saved and unbound such
>  	 * that the host kernel is responsible for restoring this state upon
> @@ -102,6 +116,15 @@ void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu)
>  {
>  	unsigned long flags;
>  
> +	/*
> +	 * See comment in kvm_arch_vcpu_load_fp().
> +	 */
> +	if (vcpu_get_flag(vcpu, IN_NESTED_ERET) ||
> +	    vcpu_get_flag(vcpu, IN_NESTED_EXCEPTION)) {
> +		WARN_ON_ONCE(host_owns_fp_regs());
> +		return;
> +	}
> +
>  	local_irq_save(flags);
>  
>  	if (guest_owns_fp_regs()) {
> -- 
> 2.47.3
> 

