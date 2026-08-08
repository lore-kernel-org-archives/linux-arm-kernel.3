Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E520C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 21:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sso6Z0vlPVEMY8Q1y/EKi4v8c0Ojp9A39N8E0Om7i0o=; b=SSgxrSmWtd8OwxTDPQWk3CSiuB
	iX3ClnkKT0yDiS1dS90ANogHM7ZFqTc/j1ZQB/d7qdNFePsJjFMiVtmSr9P2z6X24qAFTLwqy/X1T
	bpKnvCcXYgLBk7N1QfEqvIfB1pJc2CacDNYc5syT+h54xIaXzZ2DFmSqlpiDjcDjRZb+7L3R2V/i4
	l8sGBm95g6xggZHihcIEuiBnEGawL5b80tMpwWCBfLn0ZxgaiMv0iMY25rQeqlMTfwSiKqpdzaxUz
	E82AFcrjMXFCfOQ0l3A3JbnEVWLP/sT9piE+zUOsVm2AwRWQeokWgI6p648FfDa95/Lw4M2ZUNhgI
	0O/fqy0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsonf-00000009kYN-2nW5;
	Sat, 08 Aug 2026 21:41:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsonb-00000009kXw-3YXR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 21:41:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B301C152B;
	Sat,  8 Aug 2026 14:41:39 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7C103F9A2;
	Sat,  8 Aug 2026 14:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786225303; bh=I4DdleW8mzxVeMyiB3L8HY8f1W4aXjk83V1EP/T4+I4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BI9ksKowFBrkK396n5hsWjimnlOOable3MsLV4y3n7S5+1tgNqP6N6WFXFGtDTE32
	 hEr/u9esRbfm0i0MrHb1lIeDuaaWjUuK/9esr7GvjoQEWbNKWioArCRJofLMM62J3r
	 8+yBNoBgpQhKZ7WczfW/mYTuBK0b3wymIrkMqDnE=
Date: Sat, 8 Aug 2026 22:41:31 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Hyunwoo Kim <imv4bel@gmail.com>, Yao Yuan <yaoyuan@linux.alibaba.com>, ljs@kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2 4/8] KVM: arm64: Correctly handle end of VA space TLBI
 invalidation
Message-ID: <yifz3wn5gk5sr6mapi32trgk5m5kp33bquctsjmkifebnsnndt@fix6u4rthx4g>
References: <20260806091026.620700-1-maz@kernel.org>
 <20260806091026.620700-5-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806091026.620700-5-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_144148_082137_D97EBF54 
X-CRM114-Status: GOOD (  24.49  )
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

Hi Marc,

On Thu, Aug 06, 2026 at 10:10:22AM +0100, Marc Zyngier wrote:
> Our TLB invalidation by VA code is based on comparing two ranges,
> one defined by the TLB, and one defined by the TLBI instruction.
> 
> Each range is defined by a start and a size. However, the way the
> comparison is done doesn't account for address rollover, as it
> compares an address with (base + size). This works nicely until
> this expression represent the last page/block in the TTBR1 VA space,
> as the result is a big fat 0. And a failed TLB invalidation.
> 
> Rewrite the comparison in a way that is immune to the address
> rollover (making the end address inclusive instead of exclusive),
> and move this into a common helper that is used by both VA and IPA
> invalidations, as suggested by Hyunwoo Kim (although the IPA version
> didn't suffer from this particular problem, obviously).
> 
> Fixes: 4ffa72ad8f37e ("KVM: arm64: nv: Add S1 TLB invalidation primitive for VNCR_EL2")
> Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org
> ---
>  arch/arm64/kvm/nested.c | 43 ++++++++++++++++++-----------------------
>  1 file changed, 19 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 27bc7ee4b3382..8a602d074dbb4 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -999,6 +999,20 @@ static void invalidate_vncr(struct vncr_tlb *vt)
>  		clear_fixmap(vncr_fixmap(vt->cpu));
>  }
>  
> +static bool vncr_tlb_intersects(struct vncr_tlb *vt, u64 addr,
> +				u64 scope_start, u64 scope_size)
> +{
> +	u64 tlb_size, tlb_start, tlb_end, scope_end;
> +
> +	tlb_size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift, vt->wr.level));
> +
> +	tlb_start = addr & ~(tlb_size - 1);
> +	tlb_end = tlb_start + tlb_size - 1;
> +	scope_end = scope_start + scope_size - 1;

I think if scope_end overflows,

> +
> +	return !(tlb_end < scope_start || tlb_start > scope_end);

tlb_start > scope_end can evaluate to true and we return false even when
there is overlap near the end of the TTBR1 address space.

Therefore I think we need to saturate scope_end to ULONG_MAX when overflow
happens. This is also what the architecture does when looking at the
pseudocode J1.2.3.442 TLBIRange (M.c).

Thanks,
Wei-Lin Chang

> +}
> +
>  /*
>   * VNCR TLB invalidation occurs from MMU notifiers or TLBI instructions, and
>   * either can race against a vcpu not being onlined yet (no pseudo-TLB
> @@ -1021,19 +1035,9 @@ static void kvm_invalidate_vncr_ipa(struct kvm *kvm, u64 start, u64 end)
>  	if (!kvm_has_feat(kvm, ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY))
>  		return;
>  
> -	kvm_for_each_vncr_tlb(i, vcpu, vt, kvm) {
> -		u64 ipa_start, ipa_end, ipa_size;
> -
> -		ipa_size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift,
> -							    vt->wr.level));
> -		ipa_start = vt->wr.pa & ~(ipa_size - 1);
> -		ipa_end = ipa_start + ipa_size;
> -
> -		if (ipa_end <= start || ipa_start >= end)
> -			continue;
> -
> -		invalidate_vncr(vt);
> -	}
> +	kvm_for_each_vncr_tlb(i, vcpu, vt, kvm)
> +		if (vncr_tlb_intersects(vt, vt->wr.pa, start, end - start))
> +			invalidate_vncr(vt);
>  }
>  
>  struct s1e2_tlbi_scope {
> @@ -1059,28 +1063,19 @@ static void invalidate_vncr_va(struct kvm *kvm,
>  	lockdep_assert_held_write(&kvm->mmu_lock);
>  
>  	kvm_for_each_vncr_tlb(i, vcpu, vt, kvm) {
> -		u64 va_start, va_end, va_size;
> -
> -		va_size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift,
> -							   vt->wr.level));
> -		va_start = vt->gva & ~(va_size - 1);
> -		va_end = va_start + va_size;
> -
>  		switch (scope->type) {
>  		case TLBI_ALL:
>  			break;
>  
>  		case TLBI_VA:
> -			if (va_end <= scope->va ||
> -			    va_start >= (scope->va + scope->size))
> +			if (!vncr_tlb_intersects(vt, vt->gva, scope->va, scope->size))
>  				continue;
>  			if (vt->wr.nG && vt->wr.asid != scope->asid)
>  				continue;
>  			break;
>  
>  		case TLBI_VAA:
> -			if (va_end <= scope->va ||
> -			    va_start >= (scope->va + scope->size))
> +			if (!vncr_tlb_intersects(vt, vt->gva, scope->va, scope->size))
>  				continue;
>  			break;
>  
> -- 
> 2.47.3
> 

