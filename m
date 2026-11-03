Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07D6606A328
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 17:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ivSHaoXu;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZfVrbbFu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4sghRfvpX+eAonCWMENYaARxGNgqibOAgOQ2PAAwmw4=; b=ivSHaoXuFESMS+S/sxtWqLRZQl
	FfuIHi34kwh4ypiuCDDVTocusqGxzrqi8YItwovReeEB3swci7/IqO8ltzOw+g5OrGH8hnrnpEJw1
	iB83Zwxa9sghZ1njKjmhe90JI+YHI6bVlGoL9qU2+4XOvxukdEnR6at3p/gjE8/6Fyw3cEP6k322d
	+9ubFXcWNSfCGi7resVzXz4A35X0UppLx5WTUbDGP8eUkwgGTtIJLWQFoDdJ85Z6Fg6AuEmV6Wqx2
	Dgs2V0NJ/JEuJnL40IwSmrcVNXVxgFrdl7NmtaF1uS/kao8UIqf3Hh/dm8gl+O/4Tzx7MvBFEW6fN
	dRPHOrVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHvq-00000003GHi-185h;
	Tue, 03 Nov 2026 17:04:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHvo-00000003GGw-2yWD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 17:04:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F290460609;
	Tue,  3 Nov 2026 17:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C151F00A1A;
	Tue,  3 Nov 2026 17:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793725459;
	bh=4sghRfvpX+eAonCWMENYaARxGNgqibOAgOQ2PAAwmw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZfVrbbFufgZA6P/d4rWcT527uw6YZfQsIVznyaLz4A1a/OAXgncABl+7dSLuy4iID
	 l9NIRi3hzDhTSqf/QfojeZs+qo/5xwGsxXoieFKBWf8s3rvR4H1zCG8urUW11azHI5
	 1uTSmXMVQOpV8pTXKBgsL/qD3BSD09Qp1YozTeSZf7H1BEtzikIYf6yNwPBiaCfoHp
	 UEp9frYgP9OvM7Sux9j6uM9L7ar9TcLKtvpl/mWOHYlNFnEr4FspOxRgfSknwki7eR
	 vHHV0kT4k+0PBo0HPL9A9H3O6ypPu3nTCTEKF78+cH4cSs+sgid0tY72l85X9dvMF5
	 mNdjbhTIAHj+Q==
Date: Tue, 3 Nov 2026 17:04:13 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org
Subject: Re: [RFC PATCH v7 20/28] KVM: arm64: Allow guest SPE physical
 timestamps only if kernel allows it
Message-ID: <auoFWWJHUcmvif7s@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-21-alexandru.elisei@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903160623.315525-21-alexandru.elisei@arm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Sep 03, 2026 at 05:06:15PM +0100, Alexandru Elisei wrote:
> The SPE driver allows userspace to use physical timestamps for records only
> if the kernel allows it, do the same for a virtual machine.

This is really bare bones again. You are making a broader change of restoring
PMSCR_EL2 and gating on perf_allow_kernel() etc. - you should explain what
you're doing here.

Also you definitely need a 'why' here :>)

>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arch/arm64/include/asm/kvm_spe.h | 1 +
>  arch/arm64/kvm/hyp/vhe/spe-sr.c  | 5 +++--
>  arch/arm64/kvm/spe.c             | 8 ++++++++
>  3 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
> index ad0ad6ace93c..8a55ea0de4e5 100644
> --- a/arch/arm64/include/asm/kvm_spe.h
> +++ b/arch/arm64/include/asm/kvm_spe.h
> @@ -15,6 +15,7 @@ struct arm_spe_pmu;
>  struct kvm_spe {
>  	struct arm_spe_pmu *spe_pmu;
>  	u64 pmblimitr_el1_res0_mask;
> +	u64 guest_pmscr_el2;
>  };
>
>  struct kvm_vcpu_spe {
> diff --git a/arch/arm64/kvm/hyp/vhe/spe-sr.c b/arch/arm64/kvm/hyp/vhe/spe-sr.c
> index 978620ad99fa..3c32a1338cc8 100644
> --- a/arch/arm64/kvm/hyp/vhe/spe-sr.c
> +++ b/arch/arm64/kvm/hyp/vhe/spe-sr.c
> @@ -107,6 +107,7 @@ static bool __kvm_spe_profiling_buffer_enabled(u64 pmblimitr, u64 pmbsr)
>   */
>  void __kvm_spe_restore_guest_state_vhe(struct kvm_vcpu *vcpu, struct kvm_cpu_context *guest_ctxt)
>  {
> +	struct kvm *kvm = vcpu->kvm;
>  	u64 pmblimitr, pmbsr;
>
>  	pmbsr = ctxt_sys_reg(guest_ctxt, PMBSR_EL1);
> @@ -120,10 +121,10 @@ void __kvm_spe_restore_guest_state_vhe(struct kvm_vcpu *vcpu, struct kvm_cpu_con
>  		write_sysreg_s(pmbsr, SYS_PMBSR_EL1);
>  	}
>
> -	__kvm_spe_restore_sampling_regs(vcpu->kvm, guest_ctxt);
> +	__kvm_spe_restore_sampling_regs(kvm, guest_ctxt);
>
>  	write_sysreg_el1(ctxt_sys_reg(guest_ctxt, PMSCR_EL1), SYS_PMSCR);
> -	write_sysreg_el2(0, SYS_PMSCR);
> +	write_sysreg_el2(kvm->arch.kvm_spe.guest_pmscr_el2, SYS_PMSCR);
>  }
>  NOKPROBE_SYMBOL(__kvm_spe_restore_guest_state_vhe);
>
> diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
> index af1e19cb8e9a..68b751bdb384 100644
> --- a/arch/arm64/kvm/spe.c
> +++ b/arch/arm64/kvm/spe.c
> @@ -3,9 +3,11 @@
>   * Copyright (C) 2021 - ARM Ltd
>   */
>
> +#include <linux/capability.h>
>  #include <linux/cpumask.h>
>  #include <linux/kvm_host.h>
>  #include <linux/perf/arm_spe_pmu.h>
> +#include <linux/perf_event.h>
>
>  #include <asm/kvm_emulate.h>
>  #include <asm/kvm_spe.h>
> @@ -97,6 +99,12 @@ int kvm_spe_vcpu_first_run_init(struct kvm_vcpu *vcpu)
>  	if (!kvm_spe->pmblimitr_el1_res0_mask)
>  		kvm_spe_compute_pmblimitr_el1_res0_mask(kvm);
>
> +	if (kvm_vm_has_ran_once(kvm))
> +		return 0;
> +
> +	if (perf_allow_kernel())
> +		kvm_spe->guest_pmscr_el2 = PMSCR_EL2_PCT_PHYS;

Ouch, I see the bot raised that perf_allow_kernel() does the 'return 0 if
success' pattern which is just AWFUL naming.

Though I'm confused as to why you're gating on this at all? The driver needs to,
I get that, as you don't want host userspace to gain access.

But physical timestamps in the SPE buffer seems fine? What's the threat model
there? This should be explained with a comment/commit msg if there if it's
needed.

Does it expose this data to userspace in a way that is not correctly gated? Or
does the driver already handle this?

Looking at [0], I can see that there are multiple options here in PMSCR_EL2.PCT:

* PMSCR_EL2_PCT_VIRT = 0b00 - Virtual, offset by CNTVOFF_EL2 (unless EL2-owned
  then 0, but patch 19 already made it EL1-owned when guest sampling).

* PMSCR_EL2_PCT_PHYS = 0b01 - Defer to PMSCR_EL1.PCT if EL1-owned, otherwise
  phys. Define phys as the RAW physical counter (no offset).

* PMSCR_EL2_PCT_GUEST = 0b11 - Defer to PMSCR_EL1.PCT if EL1-owned.
  Virtual means raw phys minus CNTVOFF_EL2. Phys means raw phys minus
  CNTPOFF_EL2 when ECV is enabled, otherwise no offset.

And [1], [2] tells me that there are offsets to take into account (ugh)
which I see can be set via KVM_ARM_SET_COUNTER_OFFSET, and these counters will
be what is used to correlate the data with other perf counters.

As far as I can make out from the timer code, if there's no CNTPOFF_EL2
but userspace has set a physical offset, KVM traps the guest's CNTPCT
reads and applies the offset in software, i.e. in timer_set_traps():

    /*
     * We have two possibility to deal with a physical offset:
     *
     * - Either we have CNTPOFF (yay!) or the offset is 0:
     *	 we let the guest freely access the HW
     *
     * - or neither of these condition apply:
     *	 we trap accesses to the HW, but still use it
     *	 after correcting the physical offset
     */
    if (!has_cntpoff() && timer_get_offset(map->direct_ptimer))
	tpt = tpc = true;

So just accepting physical timestamps in SPE would mean they'd be offset
from the physical counter.

Where CNTPOFF_EL2 exists, PMSCR_EL2_PCT_GUEST does the right thing in
both directions - virtual minus CNTVOFF_EL2, physical minus
CNTPOFF_EL2).

But you're kinda screwed if it doesn't, so the only way for the timestamps
to be consistent with what's expected is to force a virtual offset.

So the code should look like:

    u64 pct;

    ...

    /* Without CNTPOFF_EL2 physical timestamps can't be offset, so deny them. */
    pct = has_cntpoff() ? PMSCR_EL2_PCT_GUEST : PMSCR_EL2_PCT_VIRT;
    kvm_spe->guest_pmscr_el2 = FIELD_PREP(PMSCR_EL2_PCT, pct);

I think.

> +
>  	return 0;
>  }
>
> --
> 2.43.0
>
>

--
Cheers, Lorenzo

[0]:https://support.arm.com/documentation/ddi0601/2026-09/AArch64-Registers/PMSCR-EL2--Statistical-Profiling-Control-Register--EL2-?lang=en
[1]:https://support.arm.com/documentation/ddi0601/2026-09/AArch64-Registers/CNTVOFF-EL2--Counter-timer-Virtual-Offset-Register?lang=en
[2]:https://support.arm.com/documentation/ddi0601/2026-09/AArch64-Registers/CNTPOFF-EL2--Counter-timer-Physical-Offset-Register?lang=en

