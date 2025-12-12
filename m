Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3EFD49200
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 11:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IY8xE4luXCqjJBEJSTfGH3CwInGAQCJdJm0//1WVsWU=; b=LTeYSqXFEUGUhDyNoS4GnLdi0I
	EZf5Scgp7LrJq4jSQiFBxcXWrQkiRzYHd08mf9dz2cBlZiPkpOTcV10gVn3tdrZQy2U+oMxfM+O4e
	EZ0dSM4Yjkk3ciH6PQPs38Lj2C1aMYBry95qfXF/qGkarKjJyhSe6iOAsIywXVggQRvhGSj5dkIt8
	53xV/FO3NnGuQcRFEIZGwWuwmKJv4Wr5vCIJqxSY6GH6LI8BN7MrVaWYThfnoPADLeduPdEp5KJvb
	K69tL6SpWM5QzgSuuvZt4F+57chjz905CDgUskQzoDaKWNMDiV40U0izBTbcgTcjeeDyu9vOhfiEx
	qw77J3ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU1NC-00000000TVi-1wVr;
	Fri, 12 Dec 2025 11:31:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU1NA-00000000TVD-0kfB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 11:31:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3B78FEC;
	Fri, 12 Dec 2025 03:31:33 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2C333F73B;
	Fri, 12 Dec 2025 03:31:37 -0800 (PST)
Message-ID: <24c964ca-ecf5-44af-8bea-4d97b549935c@arm.com>
Date: Fri, 12 Dec 2025 11:31:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/38] KVM: arm64: Force guest EL1 to use user-space's
 partid configuration
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Gavin Shan
 <gshan@redhat.com>, rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-7-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251205215901.17772-7-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_033144_301865_F61E83CA 
X-CRM114-Status: GOOD (  33.71  )
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

Hi James,

On 12/5/25 21:58, James Morse wrote:
> While we trap the guest's attempts to read/write the MPAM control
> registers, the hardware continues to use them. Guest-EL0 uses KVM's
> user-space's configuration, as the value is left in the register, and
> guest-EL1 uses either the host kernel's configuration, or in the case of
> VHE, the UNKNOWN reset value of MPAM1_EL1.
> 
> On nVHE systems, EL2 continues to use partid-0 for world-switch, even
> when the host may have configured its kernel threads to use a different
> partid. 0 may have been assigned to another task.
> 
> We want to force the guest-EL1 to use KVM's user-space's MPAM
> configuration, and EL2s to match the host's EL1 config.
> 
> On a nVHE system, copy the EL1 MPAM register to EL2. This ensures
> world-switch uses the same partid as the kernel thread does on the host.
> 
> When loading the guest's EL1 registers, copy the VMM's EL0 partid to
> the EL1 register.
> 
> For VHE systems, we can skip restoring the EL1 register for the host,
> as it is out-of-context once HCR_EL2.TGE is set.
> 
> This is done outside the usual sysreg save/restore as the values can
> change behind KVMs back, so should not be stored in the guest context.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  arch/arm64/include/asm/kvm_host.h          |  1 +
>  arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 16 ++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/switch.c           | 12 ++++++++++++
>  arch/arm64/kvm/hyp/vhe/sysreg-sr.c         |  1 +
>  4 files changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index b763293281c8..baba23b7ce97 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -447,6 +447,7 @@ enum vcpu_sysreg {
>  	MDCCINT_EL1,	/* Monitor Debug Comms Channel Interrupt Enable Reg */
>  	OSLSR_EL1,	/* OS Lock Status Register */
>  	DISR_EL1,	/* Deferred Interrupt Status Register */
> +	MPAM1_EL1,	/* Memory Partitioning And Monitoring register */
>  
>  	/* Performance Monitors Registers */
>  	PMCR_EL0,	/* Control Register */
> diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> index a17cbe7582de..d8ab0ced0403 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> @@ -166,6 +166,9 @@ static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
>  		ctxt_sys_reg(ctxt, TFSRE0_EL1) = read_sysreg_s(SYS_TFSRE0_EL1);
>  	}
>  
> +	if (system_supports_mpam())
> +		ctxt_sys_reg(ctxt, MPAM1_EL1) = read_sysreg_el1(SYS_MPAM1);
> +
>  	ctxt_sys_reg(ctxt, SP_EL1)	= read_sysreg(sp_el1);
>  	ctxt_sys_reg(ctxt, ELR_EL1)	= read_sysreg_el1(SYS_ELR);
>  	ctxt_sys_reg(ctxt, SPSR_EL1)	= read_sysreg_el1(SYS_SPSR);
> @@ -261,6 +264,9 @@ static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt,
>  		write_sysreg_s(ctxt_sys_reg(ctxt, TFSRE0_EL1), SYS_TFSRE0_EL1);
>  	}
>  
> +	if (system_supports_mpam())
> +		write_sysreg_el1(ctxt_sys_reg(ctxt, MPAM1_EL1), SYS_MPAM1);
> +

I don't think this
__sysreg_save_el1_state()/__sysreg_restore_el1_state() mpam change adds
anything. Assuming MPAM0 and MPAM1 are always set together and that we
continue to trap accesses from the guest there is nothing to change the
value away from that of the task. If MPAM0 and MPAM1 were set separately
then we would need a way to restore the host value of MPAM1 in the nvhe
case due to the copy from MPAM0 to MPAM1.

>  	if (!has_vhe() &&
>  	    cpus_have_final_cap(ARM64_WORKAROUND_SPECULATIVE_AT) &&
>  	    ctxt->__hyp_running_vcpu) {
> @@ -374,4 +380,14 @@ static inline void __sysreg32_restore_state(struct kvm_vcpu *vcpu)
>  		write_sysreg(__vcpu_sys_reg(vcpu, DBGVCR32_EL2), dbgvcr32_el2);
>  }
>  
> +/*
> + * The _EL0 value was written by the host's context switch and belongs to the
> + * VMM. Copy this into the guest's _EL1 register.
> + */
> +static inline void __mpam_guest_load(void)
> +{
> +	if (system_supports_mpam())
> +		write_sysreg_el1(read_sysreg_s(SYS_MPAM0_EL1), SYS_MPAM1);
> +}
> +
>  #endif /* __ARM64_KVM_HYP_SYSREG_SR_H__ */
> diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
> index d3b9ec8a7c28..b785977aa61e 100644
> --- a/arch/arm64/kvm/hyp/nvhe/switch.c
> +++ b/arch/arm64/kvm/hyp/nvhe/switch.c
> @@ -238,6 +238,15 @@ static inline bool fixup_guest_exit(struct kvm_vcpu *vcpu, u64 *exit_code)
>  	return __fixup_guest_exit(vcpu, exit_code, handlers);
>  }
>  
> +/* Use the host thread's partid and pmg for world switch */
> +static void __mpam_copy_el1_to_el2(void)
> +{
> +	if (system_supports_mpam()) {
> +		write_sysreg_s(read_sysreg_s(SYS_MPAM1_EL1), SYS_MPAM2_EL2);
> +		isb();
> +	}
> +}
> +
>  /* Switch to the guest for legacy non-VHE systems */
>  int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
>  {
> @@ -247,6 +256,8 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
>  	bool pmu_switch_needed;
>  	u64 exit_code;
>  
> +	__mpam_copy_el1_to_el2();
> +

What about the other hypercalls? E.g. __pkvm_init_vm(). Don't we end up
just running them all with the MPAM settings of the previous vcpu that ran?

>  	/*
>  	 * Having IRQs masked via PMR when entering the guest means the GIC
>  	 * will not signal the CPU of interrupts of lower priority, and the
> @@ -306,6 +317,7 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
>  	__timer_enable_traps(vcpu);
>  
>  	__debug_switch_to_guest(vcpu);
> +	__mpam_guest_load();

As MPAM0 and MPAM1 are kept in sync this doesn't do anything in the nvhe
case.

>  
>  	do {
>  		/* Jump in the fire! */
> diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> index f28c6cf4fe1b..2a84edc90465 100644
> --- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> +++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> @@ -222,6 +222,7 @@ void __vcpu_load_switch_sysregs(struct kvm_vcpu *vcpu)
>  	 */
>  	__sysreg32_restore_state(vcpu);
>  	__sysreg_restore_user_state(guest_ctxt);
> +	__mpam_guest_load();
>  
>  	if (unlikely(is_hyp_ctxt(vcpu))) {
>  		__sysreg_restore_vel2_state(vcpu);

Thanks,

Ben


