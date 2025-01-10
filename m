Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C60E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 18:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OAAZ5ExKSw4sunEiGOmMdMqPi5nEhxTNddsmPqbv2Y=; b=IFXHXrPfF2+VUBVptzWrg0y82X
	QP30BH3B7Tcop4AT4K9/07x4jCcoFlPyJiKI+7s3n+D6p+rMwAhqEQjB1MgL7kfcGE5V1P6O7rKP3
	XizXvc1Kdt0AN2zJIA/rkahed2N8KGGBHi+dAee+tjVVUNN1RbWcgPESlCMbnMKSfY9sZ3V1YxR3E
	o95Bt9GvhKGndn0KSYGCCWVq1W3LyknrBes+12b47S3Ife/TdKKQT966sVyWxDLVWtPo2wE2O/oJJ
	NV0sjSrtcEiYWfQV6qr25ISOXawuHLfzp1g1awao9eYhi9NeB1Cz3Av77IBpsGakrev6bGsOt0Gfo
	zsdBKl2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJdk-0000000GXn5-1wjY;
	Fri, 10 Jan 2025 18:21:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJcU-0000000GXfz-1rW1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 18:20:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BAAF8A427F0;
	Fri, 10 Jan 2025 18:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC829C4CED6;
	Fri, 10 Jan 2025 18:20:25 +0000 (UTC)
Date: Fri, 10 Jan 2025 18:20:23 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 5/7] KVM: arm64: MTE: Use stage-2 NoTagAccess memory
 attribute if supported
Message-ID: <Z4Fk58k8YptDkVgm@arm.com>
References: <20250110110023.2963795-1-aneesh.kumar@kernel.org>
 <20250110110023.2963795-6-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110110023.2963795-6-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_102030_609632_A7C425E6 
X-CRM114-Status: GOOD (  23.71  )
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

On Fri, Jan 10, 2025 at 04:30:21PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Currently, the kernel won't start a guest if the MTE feature is enabled
> and the guest RAM is backed by memory which doesn't support access tags.
> Update this such that the kernel uses the NoTagAccess memory attribute
> while mapping pages from VMAs for which MTE is not allowed. The fault
> from accessing the access tags with such pages is forwarded to VMM so
> that VMM can decide to kill the guest or take any corrective actions
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Mostly nitpicks below (apart from the slot registration). The decision
on whether that's the best approach lies with Oliver/Marc.

> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index cf811009a33c..609ed6a5ffce 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -378,6 +378,11 @@ static inline bool kvm_vcpu_trap_is_exec_fault(const struct kvm_vcpu *vcpu)
>  	return kvm_vcpu_trap_is_iabt(vcpu) && !kvm_vcpu_abt_iss1tw(vcpu);
>  }
>  
> +static inline bool kvm_vcpu_trap_is_tagaccess(const struct kvm_vcpu *vcpu)
> +{
> +	return !!(ESR_ELx_ISS2(kvm_vcpu_get_esr(vcpu)) & ESR_ELx_TagAccess);
> +}

The function type is already bool, no need for the "!!".

> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index eb8220a409e1..3610bea7607d 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1660,9 +1660,11 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  
>  	if (!fault_is_perm && !device && kvm_has_mte(kvm)) {
>  		/* Check the VMM hasn't introduced a new disallowed VMA */
> -		if (mte_allowed) {
> +		if (mte_allowed)
>  			sanitise_mte_tags(kvm, pfn, vma_pagesize);
> -		} else {
> +		else if (kvm_has_mte_perm(kvm))
> +			prot |= KVM_PGTABLE_PROT_NORMAL_NOTAGACCESS;
> +		else {
>  			ret = -EFAULT;
>  			goto out_unlock;
>  		}

Don't remove the brackets at the end of "if (mte_allowed) {" etc. The
coding style does require them if at least one of the branches is
multi-line (the last "else").

> @@ -2152,7 +2162,8 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>  		if (!vma)
>  			break;
>  
> -		if (kvm_has_mte(kvm) && !kvm_vma_mte_allowed(vma)) {
> +		if (kvm_has_mte(kvm) &&
> +		    !kvm_has_mte_perm(kvm) && !kvm_vma_mte_allowed(vma)) {
>  			ret = -EINVAL;
>  			break;
>  		}

I don't think we should change this, or at least not how it's done above
(Suzuki raised a related issue internally relaxing this for VM_PFNMAP).

For standard memory slots, we want to reject them upfront rather than
deferring to the fault handler. An example here is file mmap() passed as
standard RAM to the VM. It's an unnecessary change in behaviour IMHO.
I'd only relax this for VM_PFNMAP mappings further down in this
function (and move the VM_PFNMAP check above; see Suzuki's internal
patch, unless he posted it publicly already).

-- 
Catalin

