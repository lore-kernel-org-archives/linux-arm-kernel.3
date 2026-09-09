Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78967C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MbKNCDdxcrn7azAPYKNZk5k8lTv9nPdVMcY/I7jUrI=; b=DFD4muG/09/8GxGhqRA17a/FFN
	7DwZ2F1LmuucBwWj7LlUtKdZ9WUpWFrmxoK3jFDe8PechcnHg/vh4guWDk76lG+bsagy4rWEhya/G
	iaoPFr8OGpg8IcNGD1OcCMJ1nfBZKNz+fpA7bOGvF/ZgiJz5PZIXAQjTEVmTV/E7tou5tB3yk62qZ
	nrZvhnzpWpC4gt1Mh65u/9WiDZ5ROlv1MkEmvrgTI048r5vQ8Lhx76tRY7fkPw4l1W+nr8U+gjueN
	IEzqjgOQ8ObcpjE2vroXoGDsF2Y6WR009v0ng21wWKuWHmOqTvJtauDwXgTY3RQLIopDErbSwWmdQ
	4iQhnk6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ihh-0000000BqgY-3mvA;
	Wed, 09 Sep 2026 13:51:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ihe-0000000Bqg4-1bbm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:51:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C01961691;
	Wed,  9 Sep 2026 06:50:58 -0700 (PDT)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A503D3F7B4;
	Wed,  9 Sep 2026 06:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788961862; bh=qLBZINToZmCvUTu3/W9dwaMyG5PVK7PCPz8V6+Z0ALM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=amgA6GZeKxs3Oae9wZr466PUH1elaPzNBUM5/PJ/4+Pn22MEqgH4DKALCBQElAREa
	 hr12SJo8Zs6hcOcdsa3vuqO9Qe7bJKXSIeGdksWZ4EtA9XUTeGCcf3vy644IBF9teg
	 ueq7HxBI48zgoQbcAUSfiND/Qj/bLUSUccDCy6NM=
Date: Wed, 9 Sep 2026 14:50:12 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2 06/17] KVM: arm64: Add system register reset framework
 for protected VMs
Message-ID: <aqFkFF1ebFSHZLEN@e143914.arm.com>
References: <20260907070002.3333525-1-fuad.tabba@linux.dev>
 <20260907070002.3333525-7-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907070002.3333525-7-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_065106_553841_24A63E08 
X-CRM114-Status: GOOD (  32.84  )
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

Hi Fuad,

On Mon, Sep 07, 2026 at 07:59:51AM +0100, Fuad Tabba wrote:
> Add kvm_reset_pvm_sys_regs() and the pvm_sys_reg_reset_vals[] table
> that drives it, and call it from init_pkvm_hyp_vcpu() for protected
> vCPUs. The table holds the registers sys_regs.c resets that
> __sysreg_restore_state_nvhe() loads for a protected vCPU. The rest of
> the context keeps the zero the donated hyp vCPU page is cleared to. A

If the context is zero'd, why is there RESET_ZERO()? If it's just for
'completeness', worth noting here.

> poison value stands in where sys_regs.c resets to UNKNOWN, and for
> VBAR_EL1 and CONTEXTIDR_EL1 in place of the 0 it uses. MPIDR_EL1 is
> derived from vcpu_id, as for any KVM guest. AMAIR_EL1 resets to 0
> where sys_regs.c reads the hardware: the host writes it freely before
> the hypercall, and it's loaded on every guest entry.

Also if you can just put a new line for each 'category' here would make
it simpler to read.

> 
> Until the per-EC marshalling patch removes the host's full-context
> copy from flush_hyp_vcpu(), that copy overwrites these values on every
> entry, so this patch has no observable effect on its own.

Thanks for adding this!

> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  1 +
>  arch/arm64/kvm/hyp/nvhe/pkvm.c         |  5 ++
>  arch/arm64/kvm/hyp/nvhe/sys_regs.c     | 73 ++++++++++++++++++++++++--
>  3 files changed, 75 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> index 49a0a992047ba..a04b7c04d5135 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> @@ -95,6 +95,7 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code);
>  bool kvm_handle_pvm_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code);
>  bool kvm_handle_pvm_restricted(struct kvm_vcpu *vcpu, u64 *exit_code);
>  void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu);
> +void kvm_reset_pvm_sys_regs(struct kvm_vcpu *vcpu);
>  int kvm_check_pvm_sysreg_table(void);
>  
>  #endif /* __ARM64_KVM_NVHE_PKVM_H__ */
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index e85f13233da08..af334318d0a03 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -551,6 +551,11 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
>  		goto done;
>  
>  	ret = pkvm_vcpu_init_sve(hyp_vcpu, host_vcpu);
> +	if (ret)
> +		goto done;
> +
> +	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> +		kvm_reset_pvm_sys_regs(&hyp_vcpu->vcpu);
>  done:
>  	if (ret)
>  		unpin_host_vcpu(host_vcpu);
> diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> index 8758c68017765..03d2c2447e0fd 100644
> --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> @@ -525,6 +525,66 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
>  	/* Performance Monitoring Registers are restricted. */
>  };
>  
> +struct sys_reg_desc_reset {
> +	int reg;
> +	void (*reset)(struct kvm_vcpu *vcpu, const struct sys_reg_desc_reset *rd);
> +	u64 value;
> +};
> +
> +static void reset_mpidr(struct kvm_vcpu *vcpu, const struct sys_reg_desc_reset *r)
> +{
> +	__vcpu_assign_sys_reg(vcpu, r->reg, kvm_calculate_mpidr(vcpu));
> +}
> +
> +static void reset_value(struct kvm_vcpu *vcpu, const struct sys_reg_desc_reset *r)
> +{
> +	__vcpu_assign_sys_reg(vcpu, r->reg, r->value);
> +}
> +
> +#define RESET_VAL(REG, RESET_VAL) {  REG, reset_value, RESET_VAL }
> +
> +#define RESET_ZERO(REG) RESET_VAL(REG, 0)
> +
> +#define RESET_UNKNOWN(REG) RESET_VAL(REG, 0x1de7ec7edbadc0deULL)
> +
> +#define RESET_FUNC(REG, RESET_FUNC) {  REG, RESET_FUNC, 0 }
> +
> +/* Sorted ascending by reg; kvm_check_pvm_sysreg_table() enforces it. */
> +static const struct sys_reg_desc_reset pvm_sys_reg_reset_vals[] = {
> +	RESET_FUNC(MPIDR_EL1, reset_mpidr),
> +	RESET_UNKNOWN(TPIDR_EL0),
> +	RESET_UNKNOWN(TPIDRRO_EL0),
> +	RESET_UNKNOWN(TPIDR_EL1),
> +	RESET_ZERO(CNTKCTL_EL1),
> +	RESET_UNKNOWN(PAR_EL1),
> +	RESET_ZERO(DISR_EL1),
> +	RESET_ZERO(CPACR_EL1),
> +	RESET_VAL(CONTEXTIDR_EL1, 0x00000000dbadc0deULL),
> +	RESET_VAL(SCTLR_EL1, 0x00C50078ULL),
> +	RESET_ZERO(TCR_EL1),
> +	RESET_UNKNOWN(AFSR0_EL1),
> +	RESET_UNKNOWN(AFSR1_EL1),
> +	RESET_UNKNOWN(ESR_EL1),
> +	RESET_UNKNOWN(MAIR_EL1),
> +	RESET_ZERO(AMAIR_EL1),
> +	RESET_ZERO(MDSCR_EL1),
> +	RESET_UNKNOWN(TTBR0_EL1),
> +	RESET_UNKNOWN(TTBR1_EL1),
> +	RESET_UNKNOWN(FAR_EL1),
> +	RESET_VAL(VBAR_EL1, 0x1de7ec7edbadc000ULL),
> +};
> +
> +void kvm_reset_pvm_sys_regs(struct kvm_vcpu *vcpu)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < ARRAY_SIZE(pvm_sys_reg_reset_vals); i++) {
> +		const struct sys_reg_desc_reset *r = &pvm_sys_reg_reset_vals[i];
> +
> +		r->reset(vcpu, r);
> +	}
> +}
> +
>  /*
>   * Initializes feature registers for protected vms.
>   */
> @@ -550,16 +610,21 @@ void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu)
>  }
>  
>  /*
> - * Checks that the sysreg table is unique and in-order.
> - *
> - * Returns 0 if the table is consistent, or 1 otherwise.
> + * Both tables must be unique and sorted ascending. pvm_sys_reg_descs.reg is the
> + * sys_reg() encoding, pvm_sys_reg_reset_vals.reg the vcpu_sysreg index, so they
> + * compare differently. BUG_ON() at __pkvm_init: fatal at boot.
>   */
>  int kvm_check_pvm_sysreg_table(void)
>  {
>  	unsigned int i;
>  
>  	for (i = 1; i < ARRAY_SIZE(pvm_sys_reg_descs); i++) {
> -		if (cmp_sys_reg(&pvm_sys_reg_descs[i-1], &pvm_sys_reg_descs[i]) >= 0)
> +		if (cmp_sys_reg(&pvm_sys_reg_descs[i - 1], &pvm_sys_reg_descs[i]) >= 0)
> +			return 1;
> +	}
> +
> +	for (i = 1; i < ARRAY_SIZE(pvm_sys_reg_reset_vals); i++) {
> +		if (pvm_sys_reg_reset_vals[i - 1].reg >= pvm_sys_reg_reset_vals[i].reg)
>  			return 1;
>  	}
>  

Some minor commit message nits, and I see you're going to remove this
sorting check.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks,
Joey

