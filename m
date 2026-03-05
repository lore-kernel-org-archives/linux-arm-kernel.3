Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF7AF33A74
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l49Hu0c5soBmy/5+cLM4owVfzf9yzdal8PFyT7273Bk=; b=iNEI4eQZ8oEHeVLbE2dIZ/pMrl
	wFyARB9cq2ZN0+k+b6RbbOM9rXIQXnImrFk6T9sJOWXy7f0fMk2YecaN46zl+kv3HwhWJ63iHXjRr
	Ep72FTsxwmlSiriU0OfpiULcOs7hx+tZSBxSqRThD+xNU/DyShAiJNbTex9EwY2RDTcLuJ6EE1eXW
	KTgQS8DGm7QkbQ0QpILJCZfsHlC7IuTu3Btaaf2LvtcLuD93RSnNBS6AcjIkNcpenmJsNoR7TpvMG
	2mM2AhL4xhe6CChhztiOzN+WytUtB9Am73H2iHBfqQ7Pxe9DVSmqr+uLtqFDuiT7MLp0QuJ45Lqjr
	c3yFNFag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9lA-00000001zup-0aeS;
	Thu, 05 Mar 2026 14:33:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9l6-00000001zu1-0389
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:33:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD30A43DE4;
	Thu,  5 Mar 2026 14:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D156C116C6;
	Thu,  5 Mar 2026 14:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721179;
	bh=cZO6dCpt0PwPwyFlyqp9lDdewbXDrNxzC0E2dFssjr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VeGUumLJg9Ecgb1G2OIvzx5YPaE355YP/2d4ad0wJ7yPFkxosRZoOx1nZVJay0ZJN
	 wVOh/lC8yMSk/rD7p4Rawv/ccKouRzfC8wO438uQzXDjIRW0WDOvJU/BqhtwurVcfc
	 +ZvX/DkJtaXxwDubC9+Bw9RVTrHxoo/IRsxjC5VBPqHRq+rqjHjfYqTwGea6WHe8LP
	 Bvj55rHbqfiN+pV0OQTsec9boA+LpvgaAQ6c5dI0BJdtK8mWmlHWtwY3oBbrJn/7Yu
	 ZRIbFZ99aTHTeGxtN3gLjUg+mhhwHLww3RZMHXPLxODGThYSuZGXGaSFTAR0OxJJdU
	 qVGWmFk1WNjUQ==
Date: Thu, 5 Mar 2026 14:32:54 +0000
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev
Subject: Re: [PATCH 4/4] KVM: arm64: Add SMC hook for SME dvmsync erratum
Message-ID: <aamUFoQV74t4okXx@willie-the-truck>
References: <20260302165801.3014607-1-catalin.marinas@arm.com>
 <20260302165801.3014607-5-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302165801.3014607-5-catalin.marinas@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_063300_092196_82A52952 
X-CRM114-Status: GOOD (  25.15  )
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

On Mon, Mar 02, 2026 at 04:57:57PM +0000, Catalin Marinas wrote:
> From: James Morse <james.morse@arm.com>
> 
> C1-Pro cores with SME have an erratum where TLBI+DSB does not complete
> all outstanding SME accesses. Instead a DSB needs to be executed on the
> affecteed CPUs. The implication is pages cannot be unmapped from the
> host stage2 then provided to the guest. Host SME accesses may occur
> after this point.
> 
> This erratum breaks pKVM's guarantees, and the workaround is hard to
> implement as EL2 and EL1 share a security state meaning EL1 can mask
> IPI sent by EL2, leading to interrupt blackouts.
> 
> Instead, do this in EL3. This has the advantage of a separate security
> state, meaning lower EL cannot mask the IPI. It is also simpler for EL3
> to know about CPUs that are off or in PSCI's CPU_SUSPEND.
> 
> Add the needed hook.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 17 +++++++++++++++++
>  include/linux/arm-smccc.h             |  5 +++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 38f66a56a766..ab7f9273fddf 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -5,6 +5,8 @@
>   */
>  
>  #include <linux/kvm_host.h>
> +#include <linux/arm-smccc.h>
> +
>  #include <asm/kvm_emulate.h>
>  #include <asm/kvm_hyp.h>
>  #include <asm/kvm_mmu.h>
> @@ -28,6 +30,15 @@ static struct hyp_pool host_s2_pool;
>  static DEFINE_PER_CPU(struct pkvm_hyp_vm *, __current_vm);
>  #define current_vm (*this_cpu_ptr(&__current_vm))
>  
> +static void pkvm_sme_dvmsync_fw_call(void)
> +{
> +	if (cpus_have_final_cap(ARM64_WORKAROUND_SME_DVMSYNC)) {
> +		struct arm_smccc_res res;
> +
> +		arm_smccc_1_1_smc(ARM_SMCCC_CPU_SME_DVMSYNC_WORKAROUND, &res);
> +	}
> +}
> +
>  static void guest_lock_component(struct pkvm_hyp_vm *vm)
>  {
>  	hyp_spin_lock(&vm->lock);
> @@ -553,6 +564,12 @@ int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
>  	if (ret)
>  		return ret;
>  
> +	/*
> +	 * After stage2 maintenance has happened, but before the page owner has
> +	 * changed.
> +	 */
> +	pkvm_sme_dvmsync_fw_call();

Please note that this will conflict with my patch series adding support
for protected memory with pkvm. I _think_ the right answer is to
move this call into host_stage2_set_owner_metadata_locked().

Will

