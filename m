Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F567CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 14:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciRDTOzI/lCUDx+BoSkY2ACKmRXDu7NJkXbOFy06xZc=; b=XIqy9wHQXxin+T+ydKMBZ8QoQB
	Ze5JT+eOGrM9dVx5ylyFm/waybwW38l5W55j7/T8FpYU34wtCI0va1psqCA0n9OhGT5NWqbqrtMsj
	nl5g0NVrfIe3QwBr9iVHNzMen+wWNiefFZpWVNX4DHnBmX/oPfj21gRk08CnLRFeBCgkJoij3UI0W
	c240SV1aSxV2lVI8hOrm4dIuoilqgWNmnziW9aEwTtNf4hzajK1UQ7lC/uXY84glbSqoDT4kygwg7
	nIoHwGB7xpwXaIAqno+U2+IFVLKmObza1DE37VaYAaYJKqDlUhKwAwrNdrWqeKdHR1XVcfXtENRho
	AZiVE1Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29ep-000000026Mu-1W9C;
	Fri, 26 Sep 2025 14:42:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29eo-000000026Lr-13Qi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 14:42:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 648E061E1B;
	Fri, 26 Sep 2025 14:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A95C4CEF4;
	Fri, 26 Sep 2025 14:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758897765;
	bh=D26fU8PCfxAV2/rnQjd/+ukqL80rtYmpOmBeDcURakU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SOBkDd+m3dNQt1II5PGGLkUa7XfDE4ac7m3+mnYzvGRcMKbDpj1Y7JR+uCrSaXcAs
	 5uhobDRfp0TxbVkMdULO5Y2CroiqzNQLPUpfQwCuIo78i8+f5gVz1kJj/6gMt10ulU
	 cSE3nzWUpsLu1MV2xE/SVZfSxNmLpl0AeF9uSGWJoQYaWjhl6iTjIc/mfllfS3Ul2T
	 md9MT5kiqH8D8SmS4A7jm3EXcwhokB83yutLXIWqdALZnjIhgZ9RGHsajz6iBD/6l/
	 YtOeoHBzpKld5CKahk+tXaQ5RtPeF7siu19N8v3C6mNy++qqduAC7JNpMov4ElJNNo
	 G8HcM0SQZsjgQ==
Date: Fri, 26 Sep 2025 15:42:38 +0100
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
Message-ID: <aNamXlTErXDs1K8Z@willie-the-truck>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-11-smostafa@google.com>
 <aMA8vz0v0Vn-02QP@willie-the-truck>
 <aMlzLsj5slPQhWEr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMlzLsj5slPQhWEr@google.com>
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

On Tue, Sep 16, 2025 at 02:24:46PM +0000, Mostafa Saleh wrote:
> On Tue, Sep 09, 2025 at 03:42:07PM +0100, Will Deacon wrote:
> > On Tue, Aug 19, 2025 at 09:51:38PM +0000, Mostafa Saleh wrote:
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> > > index a01c036c55be..f7d1c8feb358 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> > > @@ -4,15 +4,94 @@
> > >   *
> > >   * Copyright (C) 2022 Linaro Ltd.
> > >   */
> > > +#include <linux/iommu.h>
> > > +
> > >  #include <nvhe/iommu.h>
> > > +#include <nvhe/mem_protect.h>
> > > +#include <nvhe/spinlock.h>
> > >  
> > >  /* Only one set of ops supported */
> > >  struct kvm_iommu_ops *kvm_iommu_ops;
> > >  
> > > +/* Protected by host_mmu.lock */
> > > +static bool kvm_idmap_initialized;
> > > +
> > > +static inline int pkvm_to_iommu_prot(enum kvm_pgtable_prot prot)
> > > +{
> > > +	int iommu_prot = 0;
> > > +
> > > +	if (prot & KVM_PGTABLE_PROT_R)
> > > +		iommu_prot |= IOMMU_READ;
> > > +	if (prot & KVM_PGTABLE_PROT_W)
> > > +		iommu_prot |= IOMMU_WRITE;
> > > +	if (prot == PKVM_HOST_MMIO_PROT)
> > > +		iommu_prot |= IOMMU_MMIO;
> > 
> > This looks a little odd to me.
> > 
> > On the CPU side, the only different between PKVM_HOST_MEM_PROT and
> > PKVM_HOST_MMIO_PROT is that the former has execute permission. Both are
> > mapped as cacheable at stage-2 because it's the job of the host to set
> > the more restrictive memory type at stage-1.
> > 
> > Carrying that over to the SMMU would suggest that we don't care about
> > IOMMU_MMIO at stage-2 at all, so why do we need to set it here?
> 
> Unlike the CPU, the host can set the SMMU to bypass, in that case the
> hypervisor will attach its stage-2 with no stage-1 configured. So,
> stage-2 must have the correct attrs for MMIO.

I'm not sure about that.

If the SMMU is in stage-1 bypass, we still have the incoming memory
attributes from the transaction (modulo MTCFG which we shouldn't be
setting) and they should combine with the stage-2 attributes in roughly
the same way as the CPU, no?

> > > +static int __snapshot_host_stage2(const struct kvm_pgtable_visit_ctx *ctx,
> > > +				  enum kvm_pgtable_walk_flags visit)
> > > +{
> > > +	u64 start = ctx->addr;
> > > +	kvm_pte_t pte = *ctx->ptep;
> > > +	u32 level = ctx->level;
> > > +	u64 end = start + kvm_granule_size(level);
> > > +	int prot =  IOMMU_READ | IOMMU_WRITE;
> > > +
> > > +	/* Keep unmapped. */
> > > +	if (pte && !kvm_pte_valid(pte))
> > > +		return 0;
> > > +
> > > +	if (kvm_pte_valid(pte))
> > > +		prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte));
> > > +	else if (!addr_is_memory(start))
> > > +		prot |= IOMMU_MMIO;
> > 
> > Why do we need to map MMIO regions pro-actively here? I'd have thought
> > we could just do:
> > 
> > 	if (!kvm_pte_valid(pte))
> > 		return 0;
> > 
> > 	prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte);
> > 	kvm_iommu_ops->host_stage2_idmap(start, end, prot);
> > 	return 0;
> > 
> > but I think that IOMMU_MMIO is throwing me again...
> 
> We have to map everything pro-actively as we don’t handle page faults
> in the SMMUv3 driver.
> This would be a future work where the CPU stage-2 page table is shared with
> the SMMUv3.

Ah yes, I'd forgotten about that.

Thanks,

Will

