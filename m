Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A40CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 23:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5g3WJg5ro6ZPgCzGJHkVpWPf3BLafiGjcPsny3z3sE=; b=UlXpCYkiKhtx8SH8VnRZUd/T8K
	oNEqLcBiGC4I/pkm+mUsQSHhsMB/vXoezQVZjAx7ezKdAPztaftzeexzcfyijnONJf/sIfz7hmJ2A
	wltkVlTdYLgR9njY9SvIpEr72q8/IqDeuS091dNvtCd7jEO9BHE9CXH8GiWYCYCDQUS/g4eIU80jI
	xSB1ciSb8XC1PSNGKd2/WLCgpf5YeBeCgVhmSAxs2R/ZcxT/4i3E3G+3nVKClGpqIGkG22pcdmQzp
	uHiwXSKaJp7ITCwgZceMRfn3t7epOvfCCzVJGuZ5wuAdEF03Vb66bKl2I3gc3VICRwOdw/0QqIHNa
	OMU46/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHVcz-00000001Tt9-4BfW;
	Fri, 07 Nov 2025 23:12:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHVcx-00000001TsS-3pTz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 23:12:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4EA3D43967;
	Fri,  7 Nov 2025 23:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D1CC19422;
	Fri,  7 Nov 2025 23:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762557139;
	bh=B0AHPl2PuZVRK5tNUjTCgltSSw3SvWwui8ypfs0L1Bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pR1paCW0yy1ljJ/PJey7H4gvzNzun7TU/nG39UXNM9qpH/AbmbkLBGrkhNaFJU2+m
	 65lf8lfc5Fb9C9ih1kF5S/R3KK0jO2WMSYsd3nTq5m3jODKkIIKG7d0FlMQ5A1PQ4I
	 tjyINcHKBmnviErAiQdE6Tb7vQs+1R0/JnrViPlLDsnVYZ+vP6imooi9jpGbsZoQBm
	 rr0bXyYbdokB51EoaE5Kil5+0bsWAMS4PnE/w6oNljI7vGdbDkVu2NVAgAE0ASOUJW
	 dF8bkNVSEEfXGyhi1HZUpaYkosV1ix/N3qEGDlq/MoiQYn5/YQob4mKT1QJk7aBV6K
	 xkI/xnTTE0WIw==
Date: Fri, 7 Nov 2025 15:12:17 -0800
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, will@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, vladimir.murzin@arm.com
Subject: Re: [PATCH v2 5/5] KVM: arm64: Define FAR_MASK for fault IPA offset
Message-ID: <aQ580W6SU1lGbd_D@kernel.org>
References: <20251106144418.2847443-1-tabba@google.com>
 <20251106144418.2847443-6-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106144418.2847443-6-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_151219_998398_97F825BC 
X-CRM114-Status: GOOD (  21.09  )
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

On Thu, Nov 06, 2025 at 02:44:17PM +0000, Fuad Tabba wrote:
> This 12-bit FAR mask is hard-coded as 'GENMASK(11, 0)' in several places
> to reconstruct the full fault IPA.
> 
> Define FAR_MASK for this value in the shared header and replace all
> open-coded instances to improve readability.
> 
> No functional change intended.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/include/asm/kvm_arm.h         | 2 ++
>  arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c | 2 +-
>  arch/arm64/kvm/inject_fault.c            | 2 +-
>  arch/arm64/kvm/mmu.c                     | 4 ++--
>  4 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
> index 1da290aeedce..e995e9b3a0c4 100644
> --- a/arch/arm64/include/asm/kvm_arm.h
> +++ b/arch/arm64/include/asm/kvm_arm.h
> @@ -343,6 +343,8 @@
>  #define PAR_TO_HPFAR(par)		\
>  	(((par) & GENMASK_ULL(52 - 1, 12)) >> 8)
>  
> +#define FAR_MASK GENMASK_ULL(11, 0)
> +

This seems really confusing to me, since FAR_MASK sounds like it
represents the meaningful bits of FAR_ELx. Perhaps something like the
following would better represent intent:

#define FAR_TO_FIPA_OFFSET(far)	((far) & GENMASK_ULL(11, 0))

Thanks,
Oliver

>  #define ECN(x) { ESR_ELx_EC_##x, #x }
>  
>  #define kvm_arm_exception_class \
> diff --git a/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c b/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
> index 78579b31a420..22898ed4dd6f 100644
> --- a/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
> +++ b/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
> @@ -44,7 +44,7 @@ int __vgic_v2_perform_cpuif_access(struct kvm_vcpu *vcpu)
>  
>  	/* Build the full address */
>  	fault_ipa  = kvm_vcpu_get_fault_ipa(vcpu);
> -	fault_ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
> +	fault_ipa |= kvm_vcpu_get_hfar(vcpu) & FAR_MASK;
>  
>  	/* If not for GICV, move on */
>  	if (fault_ipa <  vgic->vgic_cpu_base ||
> diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
> index dfcd66c65517..8ef3453696a2 100644
> --- a/arch/arm64/kvm/inject_fault.c
> +++ b/arch/arm64/kvm/inject_fault.c
> @@ -258,7 +258,7 @@ void kvm_inject_size_fault(struct kvm_vcpu *vcpu)
>  	unsigned long addr, esr;
>  
>  	addr  = kvm_vcpu_get_fault_ipa(vcpu);
> -	addr |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
> +	addr |= kvm_vcpu_get_hfar(vcpu) & FAR_MASK;
>  
>  	__kvm_inject_sea(vcpu, kvm_vcpu_trap_is_iabt(vcpu), addr);
>  
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 7cc964af8d30..21a9442f9b1e 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1959,7 +1959,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  
>  		/* Falls between the IPA range and the PARange? */
>  		if (fault_ipa >= BIT_ULL(VTCR_EL2_IPA(vcpu->arch.hw_mmu->vtcr))) {
> -			fault_ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
> +			fault_ipa |= kvm_vcpu_get_hfar(vcpu) & FAR_MASK;
>  
>  			return kvm_inject_sea(vcpu, is_iabt, fault_ipa);
>  		}
> @@ -2059,7 +2059,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  		 * faulting VA. This is always 12 bits, irrespective
>  		 * of the page size.
>  		 */
> -		ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
> +		ipa |= kvm_vcpu_get_hfar(vcpu) & FAR_MASK;
>  		ret = io_mem_abort(vcpu, ipa);
>  		goto out_unlock;
>  	}
> -- 
> 2.51.2.1041.gc1ab5b90ca-goog
> 

