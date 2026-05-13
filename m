Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FEACD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 12:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CR6mVpRz75r2CIAqgdxcR404EZDS2TqtSNRv6Q3k7eU=; b=xXr69jCxCko88quRjSFqsusXWd
	zBWFE4q4ciGorPizyfcdnIkXmg399obaOaguLuD+w0U3ZMDImtiWUjh2XqDEyThxEAQVT9cc5LR+i
	+o32igvRwovaWJsgLaoOyOwqSvjpvB1KcxTNy3Nr+wVz45Iw8e5mdSyL1Q+5rkBpXdq/kBMN+W9tC
	ch+PcTuS5BVN37O8cVP9x1RxRAH9ausOOz7ngmclAmiq0V3iEVDzU1RAvNCSuqBiLL3bugs+JaqeC
	71IAaNi6D6uMnStRcaSyfm1GNrO8SkKvHmDn0wFs7kHKlIxYQ5U9e6fAtjif61aGpp9dUtZOE9URV
	lKdaYY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8i7-00000002UHx-0xXi;
	Wed, 13 May 2026 12:29:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8i4-00000002UHL-2Crc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 12:29:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 466EF165C;
	Wed, 13 May 2026 05:28:59 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13EC63F7B4;
	Wed, 13 May 2026 05:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778675344; bh=8MAloSmMAMMd4l/G/g/2yUICqF0/LT/W/Bue6X2uJOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tOxuLBMWjuVKvUJwvt6sg+sZg7VuI/aVrYvZYaRm2ztF/5yBmwIjwwPc4VEbn5Dbj
	 FHE1xGMqksAu4sLf3v102nT1j/sWILjF11x/y6CCqYOd2LYl0ET9yghwCD0qJGJ6A9
	 cXS5ZM3SzTGUcjIMhlnKP31YKmdCXqI7/d2ceOrQ=
Date: Wed, 13 May 2026 13:28:56 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 2/2] KVM: arm64: nv: Don't save/restore FP register
 during a nested ERET or exception
Message-ID: <agRuiKHWWn_88YzT@J2N7QTR9R3>
References: <20260512140755.3676306-1-maz@kernel.org>
 <20260512140755.3676306-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512140755.3676306-3-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_052908_644706_7991F50F 
X-CRM114-Status: GOOD (  36.90  )
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

On Tue, May 12, 2026 at 03:07:55PM +0100, Marc Zyngier wrote:
> When switching between L1 and L2, we diligently use a non-preemptible
> put/load sequence in order to make sure that the old state is saved,
> while the new state is brought in. Crucially, this includes the FP
> registers.
> 
> However, this is a bit silly. The FP registers are completely shared
> between the various ELs (just like the GPRs, really), and eagerly
> save/restoring those in a non-preemptible section is just overhead.
> Not to mention that the next access will end-up trapping, something
> that becomes exponentially expensive as we nest deeper.
> 
> The temptation is therefore to completely drop this save/restore thing.
> Why is it valid to do so? By analogy, the hypervisor doesn't try to
> poloce things between EL1 and EL0, or between EL2 and EL0. Why should
> it do so between EL2 and EL1 (or EL2 and L2 EL0)?
>
> Once you admit that the FP (and by extension SVE) registers are EL-agnostic,
> the things that matter are:

s/poloce/police/ ?

The above is a bit flowery; it would be nice to remove the rhetorical
questions and just state that (aside from some control registers) the
FPSIMD/SVE/SME state is shared between exception levels and doesn't need
to be saved/restored.

How about:

  When switching between L1 and L2, we save the old state using
  kvm_arch_vcpu_put(), mutate the state in memory, then load the new
  state using kvm_arch_vcpu_load(). Any live FPSIMD/SVE state is saved
  and unbound, such that it can be lazily restored on a subsequent trap.

  The FPSIMD/SVE state is shared by exception levels, and only a handful
  of related control registers need to be changed when transitioning
  between L1 and L2. The save/restore of the common state is needless
  overhead, especially as trapping becomes exponentially more expensive
  with nesting.

  Avoid this overhead by leaving the common FPSIMD/SVE state live on the
  CPU, and only switching the state that is distinct for L1 and L2:
 
> - the trap controls: the effective values are recomputed on each entry
>   into the guest to take the EL into account and merge the L0 and L1
>   configuration if in a nested context, or directly use the L0 configuration
>   in non-nested context (see __activate_traps()).
> 
> - the VL settings: the effective values are are also recomputed on each
>   entry into the guest (see fpsimd_lazy_switch_to_guest()).

This is true for FPSIMD+SVE today. For SME, SMCR_ELx also contains other
controls, and will need to be dealt with similarly. It might be worth
noting that (and that ZCR_ELx could gain new controls in future).

> Since we appear to cover all bases, use the vcpu flags indicating the
> handling of a nested ERET or exception delivery to avoid the whole FP
> save/restore shenanigans.
> 
> For an EL1 L3 guest where L1 and L2 have this optimisation, this
> results in at least a 10% wall clock reduction when running an I/O
> heavy workload, generating a high rate of nested exceptions.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/fpsimd.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
> index 15e17aca1dec0..73eda0f46b127 100644
> --- a/arch/arm64/kvm/fpsimd.c
> +++ b/arch/arm64/kvm/fpsimd.c
> @@ -28,6 +28,10 @@ void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
>  	if (!system_supports_fpsimd())
>  		return;
>  
> +	if (vcpu_get_flag(vcpu, IN_NESTED_ERET) ||
> +	    vcpu_get_flag(vcpu, IN_NESTED_EXCEPTION))
> +		return;
> +

I think we need a comment as to why this is safe, with some other detail
from the commit message. It would also be good to have asserts here to
catch if something goes wrong.

How about:

	/*
	 * Avoid needless save/restore of the guest's common
	 * FPSIMD/SVE/SME regs during transitions between L1/L2.
	 *
	 * These transitions only happens in a non-preemptible context
	 * where the host regs have already been saved and unbound. The
	 * live registers are either free or owned by the guest.
	 */
	if (vcpu_get_flag(vcpu, IN_NESTED_ERET) ||
	    vcpu_get_flag(vcpu, IN_NESTED_EXCEPTION) {
		WARN_ON_ONCE(host_owns_fp_regs());
		return;
	}

... ?

Note: I didn't add WARN_ON_ONCE(preemptible()), since
kvm_arch_vcpu_load_fp() should *never* be called in a preemptible
context.

>  	/*
>  	 * Ensure that any host FPSIMD/SVE/SME state is saved and unbound such
>  	 * that the host kernel is responsible for restoring this state upon
> @@ -102,6 +106,10 @@ void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu)
>  {
>  	unsigned long flags;
>  
> +	if (vcpu_get_flag(vcpu, IN_NESTED_ERET) ||
> +	    vcpu_get_flag(vcpu, IN_NESTED_EXCEPTION))
> +		return;

Likewise here, but we can reduce the comment, e.g.

	/*
	 * See comment in kvm_arch_vcpu_load_fp().
	 */
	if (vcpu_get_flag(vcpu, IN_NESTED_ERET) ||
	    vcpu_get_flag(vcpu, IN_NESTED_EXCEPTION) {
		WARN_ON_ONCE(host_owns_fp_regs());
		return;
	}

Thanks,
Mark.

> +
>  	local_irq_save(flags);
>  
>  	if (guest_owns_fp_regs()) {
> -- 
> 2.47.3
> 

