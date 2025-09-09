Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111B6CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJMxqY9IeCYQY1IRecDR/My+5r7sHT7CqP05F1N1Ijg=; b=YnUqHtllF+TYlQI5qIXubbEXjs
	YJngrE88QO6HrOVrFdf4Qomx6zl9ihVysw1TzdMuDgNP1HKF6QtowVGDysVwGKG/FXP8nWvAowGDU
	nBaj1jYQDBYBNI1H8TazeN6MDse9/N9nuR3wdEn67j7LbmiH8WoxflVMepDLkaHwgIQOmLt0XGbsF
	NIhqQG0RD3Tx9c21nEdRx03VouTmMNJbDDQprpcmtG7VDiH8mkA9KgGueNI9ompz73HqLZzJi99BG
	AAnL/EocPFOLDGkjBkld9f7HMRjCnMszLFUYRJyuu5bBFCMI5o+m4QQp09jm7pRAR4YT/XdUCKR8G
	2xsJD93g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw21q-00000008xYd-2ahW;
	Tue, 09 Sep 2025 17:21:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvzXz-00000007o60-05q1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 14:42:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F20C601AC;
	Tue,  9 Sep 2025 14:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F32C4CEF4;
	Tue,  9 Sep 2025 14:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757428933;
	bh=sy3MVAHHpVBPpi9qQNA8uh94iv/9KGticKB2B5S88ec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lCQL2ZnhtslW9yIQkfsmJg5+75EuysNXo3JTQ4SrgE1/+t3v8/6IPMz2mL7oWf6rN
	 ub6dSGyAlU1XvFdylPw3uNCRbFnUCI73OxHBkok6B5jJ6boGar/3XTJYoVRwWv1Pf2
	 W71AFuxaSdbRtE8a087jq8srbxCTVwd8Jzqzs5eJMrmCdx/uCqmC23WI6l+KC9JUjr
	 8qbSO4M9fOHflSchEpJw3dcK1Hleffm9dRG8KWW4B5bA70t3slOZyKf1qZjOdlU6Wk
	 KEPt1IJXiK32JX9QP5z/ca8ONKh5i1F/gMzwE4EcHnzZmFAwTGlZIPBgTh//oUckBz
	 GvL3cKSxlZRFg==
Date: Tue, 9 Sep 2025 15:42:07 +0100
From: Will Deacon <will@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 10/28] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <aMA8vz0v0Vn-02QP@willie-the-truck>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-11-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819215156.2494305-11-smostafa@google.com>
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

On Tue, Aug 19, 2025 at 09:51:38PM +0000, Mostafa Saleh wrote:
> Create a shadow page table for the IOMMU that shadows the
> host CPU stage-2 into the IOMMUs to establish DMA isolation.
> 
> An initial snapshot is created after the driver init, then
> on every permission change a callback would be called for
> the IOMMU driver to update the page table.
> 
> For some cases, an SMMUv3 may be able to share the same page
> table used with the host CPU stage-2 directly.
> However, this is too strict and requires changes to the core hypervisor
> page table code, plus it would require the hypervisor to handle IOMMU
> page faults. This can be added later as an optimization for SMMUV3.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/include/nvhe/iommu.h |  4 ++
>  arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 83 ++++++++++++++++++++++++-
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c   |  5 ++
>  3 files changed, 90 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> index 1ac70cc28a9e..219363045b1c 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> @@ -3,11 +3,15 @@
>  #define __ARM64_KVM_NVHE_IOMMU_H__
>  
>  #include <asm/kvm_host.h>
> +#include <asm/kvm_pgtable.h>
>  
>  struct kvm_iommu_ops {
>  	int (*init)(void);
> +	void (*host_stage2_idmap)(phys_addr_t start, phys_addr_t end, int prot);
>  };
>  
>  int kvm_iommu_init(void);
>  
> +void kvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
> +				 enum kvm_pgtable_prot prot);
>  #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
> diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> index a01c036c55be..f7d1c8feb358 100644
> --- a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> +++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> @@ -4,15 +4,94 @@
>   *
>   * Copyright (C) 2022 Linaro Ltd.
>   */
> +#include <linux/iommu.h>
> +
>  #include <nvhe/iommu.h>
> +#include <nvhe/mem_protect.h>
> +#include <nvhe/spinlock.h>
>  
>  /* Only one set of ops supported */
>  struct kvm_iommu_ops *kvm_iommu_ops;
>  
> +/* Protected by host_mmu.lock */
> +static bool kvm_idmap_initialized;
> +
> +static inline int pkvm_to_iommu_prot(enum kvm_pgtable_prot prot)
> +{
> +	int iommu_prot = 0;
> +
> +	if (prot & KVM_PGTABLE_PROT_R)
> +		iommu_prot |= IOMMU_READ;
> +	if (prot & KVM_PGTABLE_PROT_W)
> +		iommu_prot |= IOMMU_WRITE;
> +	if (prot == PKVM_HOST_MMIO_PROT)
> +		iommu_prot |= IOMMU_MMIO;

This looks a little odd to me.

On the CPU side, the only different between PKVM_HOST_MEM_PROT and
PKVM_HOST_MMIO_PROT is that the former has execute permission. Both are
mapped as cacheable at stage-2 because it's the job of the host to set
the more restrictive memory type at stage-1.

Carrying that over to the SMMU would suggest that we don't care about
IOMMU_MMIO at stage-2 at all, so why do we need to set it here?

> +	/* We don't understand that, might be dangerous. */
> +	WARN_ON(prot & ~PKVM_HOST_MEM_PROT);
> +	return iommu_prot;
> +}
> +
> +static int __snapshot_host_stage2(const struct kvm_pgtable_visit_ctx *ctx,
> +				  enum kvm_pgtable_walk_flags visit)
> +{
> +	u64 start = ctx->addr;
> +	kvm_pte_t pte = *ctx->ptep;
> +	u32 level = ctx->level;
> +	u64 end = start + kvm_granule_size(level);
> +	int prot =  IOMMU_READ | IOMMU_WRITE;
> +
> +	/* Keep unmapped. */
> +	if (pte && !kvm_pte_valid(pte))
> +		return 0;
> +
> +	if (kvm_pte_valid(pte))
> +		prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte));
> +	else if (!addr_is_memory(start))
> +		prot |= IOMMU_MMIO;

Why do we need to map MMIO regions pro-actively here? I'd have thought
we could just do:

	if (!kvm_pte_valid(pte))
		return 0;

	prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte);
	kvm_iommu_ops->host_stage2_idmap(start, end, prot);
	return 0;

but I think that IOMMU_MMIO is throwing me again...

Will

