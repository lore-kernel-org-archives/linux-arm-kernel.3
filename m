Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5040AFCEE81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 11:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zuBUHuBQrYJzrr3eRAc0XTeUrMALRcVMX/e+1PIDpPw=; b=LV1prklKmX1QDOObj8PBku2+E+
	YQUOyiKFDrKdTsUhWDR8eETjxr3WpL7tc7HV3jZc/Nmyl3ST1rfW6uyzyLY/01hTKWhByLu7mSbP4
	4eEEp1f4AUf9EimEt6LpPutu28s5HcO6cSI3NFcps/jRHHOZjTJx3UyhPTXAoMgCfT5xIhkrqvWev
	tm+BoGv9jr+IB/4fbgw3ko3fs6IzYpnVUuaIyR94erhctIEipPr/3bBe/sY3NuiFOiaBe6F2mDeKP
	idThvb3lG8CjVG3I63eg4mQmr7PcB4YHs96TUNRaHxYK9cyjGKvMV9l7Z4zkRHZsOQJpEG9MvKTm0
	l6UX0LoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDBD-00000003vRm-1tGX;
	Wed, 25 Feb 2026 11:35:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDBA-00000003vRQ-410g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 11:35:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B46B165C;
	Wed, 25 Feb 2026 03:35:35 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E6C03F62B;
	Wed, 25 Feb 2026 03:35:40 -0800 (PST)
Date: Wed, 25 Feb 2026 11:35:32 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Deduplicate ASID retrieval code
Message-ID: <20260225113532.GA1763928@e124191.cambridge.arm.com>
References: <20260225104718.14209-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225104718.14209-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_033545_083915_C0D6032A 
X-CRM114-Status: GOOD (  22.93  )
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

On Wed, Feb 25, 2026 at 10:47:18AM +0000, Marc Zyngier wrote:
> We currently have three versions of the ASID retrieval code, one
> in the S1 walker, and two in the VNCR handling (although the last
> two are limited to the EL2&0 transltion regime).
> 
> Make this code common, and take this opportunity to also simplify
> the code a bit while switching over to the TTBRx_EL1_ASID macro.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/include/asm/kvm_nested.h |  2 +
>  arch/arm64/kvm/at.c                 | 27 +------------
>  arch/arm64/kvm/nested.c             | 60 +++++++++++++++--------------
>  3 files changed, 35 insertions(+), 54 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
> index 905c658057a43..091544e6af442 100644
> --- a/arch/arm64/include/asm/kvm_nested.h
> +++ b/arch/arm64/include/asm/kvm_nested.h
> @@ -397,6 +397,8 @@ int kvm_vcpu_allocate_vncr_tlb(struct kvm_vcpu *vcpu);
>  int kvm_handle_vncr_abort(struct kvm_vcpu *vcpu);
>  void kvm_handle_s1e2_tlbi(struct kvm_vcpu *vcpu, u32 inst, u64 val);
>  
> +u16 get_asid_by_regime(struct kvm_vcpu *vcpu, enum trans_regime regime);
> +
>  #define vncr_fixmap(c)						\
>  	({							\
>  		u32 __c = (c);					\
> diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
> index 885bd5bb2f416..6588ea251ed77 100644
> --- a/arch/arm64/kvm/at.c
> +++ b/arch/arm64/kvm/at.c
> @@ -540,31 +540,8 @@ static int walk_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
>  	wr->pa |= va & GENMASK_ULL(va_bottom - 1, 0);
>  
>  	wr->nG = (wi->regime != TR_EL2) && (desc & PTE_NG);
> -	if (wr->nG) {
> -		u64 asid_ttbr, tcr;
> -
> -		switch (wi->regime) {
> -		case TR_EL10:
> -			tcr = vcpu_read_sys_reg(vcpu, TCR_EL1);
> -			asid_ttbr = ((tcr & TCR_A1) ?
> -				     vcpu_read_sys_reg(vcpu, TTBR1_EL1) :
> -				     vcpu_read_sys_reg(vcpu, TTBR0_EL1));
> -			break;
> -		case TR_EL20:
> -			tcr = vcpu_read_sys_reg(vcpu, TCR_EL2);
> -			asid_ttbr = ((tcr & TCR_A1) ?
> -				     vcpu_read_sys_reg(vcpu, TTBR1_EL2) :
> -				     vcpu_read_sys_reg(vcpu, TTBR0_EL2));
> -			break;
> -		default:
> -			BUG();
> -		}
> -
> -		wr->asid = FIELD_GET(TTBR_ASID_MASK, asid_ttbr);
> -		if (!kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR0_EL1, ASIDBITS, 16) ||
> -		    !(tcr & TCR_ASID16))
> -			wr->asid &= GENMASK(7, 0);
> -	}
> +	if (wr->nG)
> +		wr->asid = get_asid_by_regime(vcpu, wi->regime);
>  
>  	return 0;
>  
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 7f1ea85dc67ab..787776aaf4ad1 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -854,6 +854,33 @@ int kvm_inject_s2_fault(struct kvm_vcpu *vcpu, u64 esr_el2)
>  	return kvm_inject_nested_sync(vcpu, esr_el2);
>  }
>  
> +u16 get_asid_by_regime(struct kvm_vcpu *vcpu, enum trans_regime regime)
> +{
> +	enum vcpu_sysreg ttbr_elx;
> +	u64 tcr;
> +	u16 asid;
> +
> +	switch (regime) {
> +	case TR_EL10:
> +		tcr = vcpu_read_sys_reg(vcpu, TCR_EL1);
> +		ttbr_elx = (tcr & TCR_A1) ? TTBR1_EL1 : TTBR0_EL1;
> +		break;
> +	case TR_EL20:
> +		tcr = vcpu_read_sys_reg(vcpu, TCR_EL2);
> +		ttbr_elx = (tcr & TCR_A1) ? TTBR1_EL2 : TTBR0_EL2;
> +		break;
> +	default:
> +		BUG();
> +	}
> +
> +	asid = FIELD_GET(TTBRx_EL1_ASID, vcpu_read_sys_reg(vcpu, ttbr_elx));
> +	if (!kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR0_EL1, ASIDBITS, 16) ||
> +	    !(tcr & TCR_ASID16))
> +		asid &= GENMASK(7, 0);
> +
> +	return asid;
> +}
> +
>  static void invalidate_vncr(struct vncr_tlb *vt)
>  {
>  	vt->valid = false;
> @@ -1333,20 +1360,8 @@ static bool kvm_vncr_tlb_lookup(struct kvm_vcpu *vcpu)
>  	if (read_vncr_el2(vcpu) != vt->gva)
>  		return false;
>  
> -	if (vt->wr.nG) {
> -		u64 tcr = vcpu_read_sys_reg(vcpu, TCR_EL2);
> -		u64 ttbr = ((tcr & TCR_A1) ?
> -			    vcpu_read_sys_reg(vcpu, TTBR1_EL2) :
> -			    vcpu_read_sys_reg(vcpu, TTBR0_EL2));
> -		u16 asid;
> -
> -		asid = FIELD_GET(TTBR_ASID_MASK, ttbr);
> -		if (!kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR0_EL1, ASIDBITS, 16) ||
> -		    !(tcr & TCR_ASID16))
> -			asid &= GENMASK(7, 0);
> -
> -		return asid == vt->wr.asid;
> -	}
> +	if (vt->wr.nG)
> +		return get_asid_by_regime(vcpu, TR_EL20) == vt->wr.asid;
>  
>  	return true;
>  }
> @@ -1449,21 +1464,8 @@ static void kvm_map_l1_vncr(struct kvm_vcpu *vcpu)
>  	if (read_vncr_el2(vcpu) != vt->gva)
>  		return;
>  
> -	if (vt->wr.nG) {
> -		u64 tcr = vcpu_read_sys_reg(vcpu, TCR_EL2);
> -		u64 ttbr = ((tcr & TCR_A1) ?
> -			    vcpu_read_sys_reg(vcpu, TTBR1_EL2) :
> -			    vcpu_read_sys_reg(vcpu, TTBR0_EL2));
> -		u16 asid;
> -
> -		asid = FIELD_GET(TTBR_ASID_MASK, ttbr);
> -		if (!kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR0_EL1, ASIDBITS, 16) ||
> -		    !(tcr & TCR_ASID16))
> -			asid &= GENMASK(7, 0);
> -
> -		if (asid != vt->wr.asid)
> -			return;
> -	}
> +	if (vt->wr.nG && get_asid_by_regime(vcpu, TR_EL20) != vt->wr.asid)
> +		return;
>  
>  	vt->cpu = smp_processor_id();
>  
> -- 
> 2.47.3
> 
> 

