Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B85FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 13:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WX8OSMCUcv8pi5syb26caCWQC9+MZHtc8mcnjzN/Cg=; b=pwUCf3E74bQ+iKEXKi9qbYv7hP
	bmYtWwPlDg41fKNTl6F0QaCeAHQRoOjdB+u44j/mVaAJP48kMw2cbo8d2VvoeqY6wuIoH0DR7X4QA
	9s5X/Y+MrVvsZhXRQ+nZZiJgMm4Rgronz/7x/SsTgUAD8db+TTRAqOcPQsXbKapRrvlObLib5EW5s
	8X8UY/chZXWA8UznYLXaLl5g3Kovdkkc41OmdCvjTYVusWRIABIE5yiY26ypeZ6UyDIqmDwbQCA3i
	8b+4HLf23TK+yAfomst4/1tdHc0hoEBJK18kyDGc/bPwwgPicqGGA+vgDGq1pcj4U0alkpaz8skS1
	wsoAOBUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6Gn-0000000F687-36VV;
	Tue, 07 Jul 2026 13:55:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6Gl-0000000F67l-0sYj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 13:55:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC5311A2D;
	Tue,  7 Jul 2026 06:55:19 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.2.213.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCEDD3F85F;
	Tue,  7 Jul 2026 06:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783432524; bh=ICx3pfpfzRC6B2jMY/97ptCXRIXl9HJdina4SUTaGAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r8of3wY/XjYZJZHOKfxPdd3GPh2MArwl/HPgItGmZ8ELFmveS/0aL84ZcirScE/6l
	 zwmexmBW7XqSC+Sez/ExU6fNBrPDYNBHE1ssBv2Cfu2IogXLmnwYcbRJfOUZvv6EV4
	 Bwi8/2tor3fuOswaAjOycwBcWS5Xg3XHxBI/7z38=
Date: Tue, 7 Jul 2026 14:55:20 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 09/28] KVM: arm64: Relax CPTR_EL2 handling when
 FEAT_NV2p1 is present
Message-ID: <20260707135520.GB922094@e124191.cambridge.arm.com>
References: <20260702160248.1377250-1-maz@kernel.org>
 <20260702160248.1377250-10-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702160248.1377250-10-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_065527_344520_86888B9B 
X-CRM114-Status: GOOD (  21.72  )
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

On Thu, Jul 02, 2026 at 05:02:29PM +0100, Marc Zyngier wrote:
> With FEAT_NV2P1, it is no longer necessary to trap CPTR_EL2 accesses
> via CPACR_EL1, as CPACR_EL1.TCPAC is guaranteed to be stateful.
> 
> Prevent such trapping and context switch CPACTR_EL1 in NV contexts
> when NV2P1 is present.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/kvm/hyp/include/hyp/switch.h | 5 +++--
>  arch/arm64/kvm/hyp/vhe/switch.c         | 3 +++
>  arch/arm64/kvm/hyp/vhe/sysreg-sr.c      | 8 +++++---
>  arch/arm64/kvm/sys_regs.c               | 5 ++++-
>  4 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index 8e5f492f39086..7b27296c94607 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -108,9 +108,10 @@ static inline void __activate_cptr_traps_vhe(struct kvm_vcpu *vcpu)
>  	 * The architecture is a bit crap (what a surprise): an EL2 guest
>  	 * writing to CPTR_EL2 via CPACR_EL1 can't set any of TCPAC or TTA,
>  	 * as they are RES0 in the guest's view. To work around it, trap the
> -	 * sucker using the very same bit it can't set...
> +	 * sucker using the very same bit it can't set. FEAT_NV2p1 fixes it.
>  	 */
> -	if (vcpu_el2_e2h_is_set(vcpu) && is_hyp_ctxt(vcpu))
> +	if (!cpus_have_final_cap(ARM64_HAS_NV2P1) &&
> +	    vcpu_el2_e2h_is_set(vcpu) && is_hyp_ctxt(vcpu))
>  		val |= CPTR_EL2_TCPAC;
>  
>  	/*
> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index 3b76e0468317b..361d3f8344dd8 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -441,6 +441,9 @@ static bool kvm_hyp_handle_cpacr_el1(struct kvm_vcpu *vcpu, u64 *exit_code)
>  	u64 esr = kvm_vcpu_get_esr(vcpu);
>  	int rt;
>  
> +	if (cpus_have_final_cap(ARM64_HAS_NV2P1))
> +		return false;
> +
>  	if (!is_hyp_ctxt(vcpu) || esr_sys64_to_sysreg(esr) != SYS_CPACR_EL1)
>  		return false;
>  
> diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> index be685b63e8cf2..6f0f046e4ca4e 100644
> --- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> +++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> @@ -42,10 +42,12 @@ static void __sysreg_save_vel2_state(struct kvm_vcpu *vcpu)
>  		u64 val;
>  
>  		/*
> -		 * We don't save CPTR_EL2, as accesses to CPACR_EL1
> -		 * are always trapped, ensuring that the in-memory
> -		 * copy is always up-to-date. A small blessing...
> +		 * Without FEAT_NV2p1, we don't save CPTR_EL2, as accesses
> +		 * to CPACR_EL1 are always trapped, ensuring that the
> +		 * in-memory copy is always up-to-date. A small blessing...
>  		 */
> +		if (cpus_have_final_cap(ARM64_HAS_NV2P1))
> +			__vcpu_assign_sys_reg(vcpu, CPTR_EL2, read_sysreg_el1(SYS_CPACR));
>  		__vcpu_assign_sys_reg(vcpu, SCTLR_EL2,	 read_sysreg_el1(SYS_SCTLR));
>  		__vcpu_assign_sys_reg(vcpu, TTBR0_EL2,	 read_sysreg_el1(SYS_TTBR0));
>  		__vcpu_assign_sys_reg(vcpu, TTBR1_EL2,	 read_sysreg_el1(SYS_TTBR1));
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 6b47d936efb32..1dfc1f88bec82 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -326,7 +326,10 @@ u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
>  			val |= __vcpu_sys_reg(vcpu, reg) & ~CNTKCTL_VALID_BITS;
>  			return val;
>  		case CPTR_EL2:
> -			return __vcpu_sys_reg(vcpu, reg);
> +			if (cpus_have_final_cap(ARM64_HAS_NV2P1))
> +				return read_sysreg_el1(SYS_CPACR);
> +			else
> +				return __vcpu_sys_reg(vcpu, reg);
>  		default:
>  			WARN_ON_ONCE(1);
>  		}
> -- 
> 2.47.3
> 

