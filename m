Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C544C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnmn4tml0hrLyWRLredb95JgtG9J+ReFeTT007iHkHc=; b=ZPHD45mUL8FJ++o3ZpMbTgOvh9
	9EcB8X5jiwjrIDKIR0vW3hCqVIH7Qh+WLZfkSCOGF8PKu/iD/ebvb4f1yHLDa9IKIxILE6xwuvMty
	zORZ2uMQf4pzz0yy6+Va6g7605I4Qh7lX81Q3OLVcE6b2Hi0IoCPsZMDxhqdqvLwHoP1up7hKp29U
	jukpoxrFvZnMOLV4fyd8uQv4oM9efQYg65PU8EkJGxnV/5kzQVJNYQZR6gBZgX4HBm30s/bCNUZ7R
	BRyVu3FZXkGKo6MJh3rdS/dfk66SIfgIji5VpAhNKkSudrxp73EtZcWem35bJB1lDyVWX0yVrG1QE
	r1E075pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT0U-0000000HFTc-1DLF;
	Wed, 08 Jul 2026 14:12:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT0S-0000000HFSR-0DXd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:12:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88B4A1A00;
	Wed,  8 Jul 2026 07:12:00 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.2.213.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 984173F7B4;
	Wed,  8 Jul 2026 07:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783519924; bh=pS4fc+DWPWj0gMe6msC77y6Fpi4tYZKDlh0OobjR0d4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TOGRuL4moMpwF+YU4AL5KUA2+6hainzJazOPH9RkMdp+oWnl1nZg9tRtFfmpleidM
	 x07ANFJS81TcNAOB3DgjkugblJrnNtkL8VpClA0PW9jucsRXW6EChV4tZWYzpjqlQY
	 dWlCkFPkPMWDOqWjNB95emNEjSCynj79uIvvReGw=
Date: Wed, 8 Jul 2026 15:11:58 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 23/28] KVM: arm64: Add NVHCR_EL2 context switching
Message-ID: <20260708141158.GA12293@e124191.cambridge.arm.com>
References: <20260702160248.1377250-1-maz@kernel.org>
 <20260702160248.1377250-24-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702160248.1377250-24-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_071208_168642_9377A1FF 
X-CRM114-Status: GOOD (  25.48  )
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

On Thu, Jul 02, 2026 at 05:02:43PM +0100, Marc Zyngier wrote:
> Since NVHCR_EL2 represents the HCR_EL2 state of the EL1 guest, it
> must be dealt with in some particular way:
> 
> - for a guest in hyp context (an L1 by definition), NVHCR_EL2 directly
>   reflects HCR_EL2 as read and written by the guest itself. It must
>   therefore be eagerly synced back with the emulation code which only
>   knows about HCR_EL2. This is unconditional if NV3 is available on
>   the host.
> 
> - For an L2 guest, NVHCR_EL2 is controlled by the L1 guest, and we
>   just context switch it like any other EL1 register. Yes, EL1, as
>   that's where this thing runs from the PoV of L1. This is conditioned
>   on the guest using NV3.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 11 +++++++++++
>  arch/arm64/kvm/hyp/vhe/switch.c            | 10 ++++++++--
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> index a17cbe7582de9..c382848d31947 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> @@ -172,6 +172,10 @@ static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
>  
>  	if (ctxt_has_sctlr2(ctxt))
>  		ctxt_sys_reg(ctxt, SCTLR2_EL1) = read_sysreg_el1(SYS_SCTLR2);
> +
> +	/* Retrieve L2's HCR_EL2, and save it for future use */
> +	if (is_nested_nv3_ctxt(ctxt_to_vcpu(ctxt)))
> +		ctxt_sys_reg(ctxt, NVHCR_EL2) = read_sysreg_s(SYS_NVHCR_EL2);
>  }
>  
>  static inline void __sysreg_save_el2_return_state(struct kvm_cpu_context *ctxt)
> @@ -285,6 +289,13 @@ static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt,
>  
>  	if (ctxt_has_sctlr2(ctxt))
>  		write_sysreg_el1(ctxt_sys_reg(ctxt, SCTLR2_EL1), SYS_SCTLR2);
> +
> +	/*
> +	 * Publish the L2 view of HCR_EL2 to the HW if L1 is using NV3.
> +	 * Otherwise, the data is already in place in the L1's own VNCR.
> +	 */
> +	if (is_nested_nv3_ctxt(ctxt_to_vcpu(ctxt)))
> +		write_sysreg_s(ctxt_sys_reg(ctxt, NVHCR_EL2), SYS_NVHCR_EL2);
>  }
>  
>  /* Read the VCPU state's PSTATE, but translate (v)EL2 to EL1. */
> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index 05bcf8bf7f978..c5c06ae41b229 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -71,7 +71,10 @@ static u64 __compute_hcr(struct kvm_vcpu *vcpu)
>  			hcr |= HCR_NV1;
>  
>  		/* Publish the guest's view of HCR_EL2 to the HW */
> -		__vcpu_assign_sys_reg(vcpu, NVHCR_EL2, __vcpu_sys_reg(vcpu, HCR_EL2));
> +		if (cpus_have_final_cap(ARM64_HAS_NV3) && vcpu_el2_e2h_is_set(vcpu))
> +			write_sysreg_s(__vcpu_sys_reg(vcpu, HCR_EL2), SYS_NVHCR_EL2);
> +		else
> +			__vcpu_assign_sys_reg(vcpu, NVHCR_EL2, __vcpu_sys_reg(vcpu, HCR_EL2));
>  
>  		/*
>  		 * Nothing in HCR_EL2 should impact running in hypervisor
> @@ -565,7 +568,10 @@ static void fixup_nv_guest_exit(struct kvm_vcpu *vcpu)
>  		*vcpu_cpsr(vcpu) |= mode;
>  
>  		/* Publish the latest HCR_EL2 to the emulation */
> -		hcr = __vcpu_sys_reg(vcpu, NVHCR_EL2);
> +		hcr = (cpus_have_final_cap(ARM64_HAS_NV3) &&
> +		       vcpu_el2_e2h_is_set(vcpu)) ?
> +			read_sysreg_s(SYS_NVHCR_EL2) :
> +			__vcpu_sys_reg(vcpu, NVHCR_EL2);
>  
>  		__vcpu_assign_sys_reg(vcpu, HCR_EL2, hcr);
>  	}
> -- 
> 2.47.3
> 

