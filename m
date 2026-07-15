Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC41C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONrkZYCh5Okv7WFSmS8LJPVH6J3l7WkmLNTE/oBXpcg=; b=uqzlz0afjm6Mmqn7+OwbHDB4kS
	naPgBjchYsXwUlK1rySmulFgIuyfKA1yf/G5jlmc3BA6D4vh2xANfnaGbU0nNNB13ZaQcUE6gq5dc
	l9a1AVZJKwVFTUZNUN/ExPDWXKFH/iFDwMdClHHrhGpSO5TC55gx2iCf/jUNG98o2FJ2WM/zUBab0
	9kTH/6P/hPdk+kvL9s89o/wL5yojgUFpLB2bOAtSWBkbRCfCL69tqCpjARazpp+weGcy731YZ0Ldn
	KAQ+kSmqFxUKLjjZNeLGH7Gfa8LZYAlSwefpTkAwk3MLuZy9ktdyh+VGluoM02zp76yMfNNLSui/U
	RzGmYS+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4Zv-0000000Fhz7-3Cuw;
	Wed, 15 Jul 2026 18:43:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4Zs-0000000FhyV-2hJs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:43:29 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-493b8d92a4eso7835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 11:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784141006; x=1784745806; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ONrkZYCh5Okv7WFSmS8LJPVH6J3l7WkmLNTE/oBXpcg=;
        b=P5dcE75lH1yN8QmqcblN0f5GtIIh68YQGQUqx5NE4/I9tlM0xbfxpxyZdlkIsVSFJu
         bu933o6X1YjUg0GutGd5R93YvQgFFUwEIdW2euF209cKJjDTEA+acA2r9HHZROZKQjJ2
         YYbdkLxobOBsMkCTkLAjlZnMLsL7Mb+ZKJMlrwXje/cLPwAiGmyFc10rQC6LWBWtGYY7
         zxy9dweVAIFQ8jTn8YTzGNyB9KhmhGDNmtTUEU+uPE47AMbHjzxhnfv2EY+bgOJMsEhE
         PaTK1Tyc6YQ7NnaRxN4dmntu20gKSY7nVFQuvHnniK8WxEedU10bGTmBTN+O6YeWDOCE
         UZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784141006; x=1784745806;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ONrkZYCh5Okv7WFSmS8LJPVH6J3l7WkmLNTE/oBXpcg=;
        b=eZf1EP3lRwKgMyqx7X3hVODlEBpbEYQXWSoTFGZPyr8jo+FAOwq4Qncs//kNNgJJ3A
         uzdCXA0UkWwXty7+9nux5NWUrPQFJQCJ7jAZ24g1NTw+goanExtZPHMVoPJi4kJVlHM6
         UUPQOFwD60skPUByF4lW0sHQvMrhOX7wEmc+ZclPRUL/G+tcQtEhsVdvI+9JLcHiEPMe
         UGj/6dh2py70YGPUuQfpls1zXaCzJ1Yrn6yCzjIu5/JCF/xw3iKAsRpxFgvCBwHJaZw/
         4X1ruY5rPuFnWjllNDCMIwN081WRzwnPS8iDdPCzJEkJnAyd9r7U4TU7EXnrK65Bk16b
         Nfbw==
X-Gm-Message-State: AOJu0YziqE1a8Kg/nXDC91mETV2ysGJlWzw7C5IyV6OcmYIwjnjfW5gI
	1xruEhV1vB41KbtgKkufUItJyOUCeh/pIZ7BnCLGRnFvkNr01iQpxIJ8qw6+hCn/bQ==
X-Gm-Gg: AfdE7ckwsFZ2zeoI5btkM4Xxqh1mv21bjT2NJ71GCGt3pEuO9xv4yOVSHaTvgibx8z6
	Xrp5pMQU+rcWPu2tStyR4xyO9/DrzlAeMew8U8boCq5uJij63dEtfgmRRhiNMM9+ff31ag6YwEJ
	BrD+nlAnhGzY6xTkGbA5TQ3zlO78RpaH2qdGqy4wxBPIOnA3vn0KFRvf6BDCN+I67+yx40HaoTn
	wKWAVlNLIfux+1EcVhoHQWU6p7e11CdD/jzUUxCGsTthUJFUzuXbJvxPrvuwGBJL7LK1QW/Xmx3
	RjmvMshVa05jIyZ3UXbQdCkfSkwst68vLXamFMrPxw+/DYOgvOQBIAjiNZif68wpAPcNPyWN9tE
	Eu7OzYohignf7njbNJOrzpt4WH6Qofkn7t3BZ9c10bzh31SeqsTgJPkx6n3Zsp8N6V+IS4BJ3MG
	i6ISKmfd/qqq0vdgXdeDB24uVXqSveNP+T5iFVTudCVy6ui5OooBAzlcRnPAE=
X-Received: by 2002:a05:600c:605a:b0:490:b2ae:44ca with SMTP id 5b1f17b1804b1-49541e9a8ccmr10545e9.5.1784141005664;
        Wed, 15 Jul 2026 11:43:25 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953c704bfasm77694915e9.2.2026.07.15.11.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 11:43:24 -0700 (PDT)
Date: Wed, 15 Jul 2026 18:43:21 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v7 07/24] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <alfUyfyAIFURy39W@google.com>
References: <20260715115906.2664882-1-smostafa@google.com>
 <20260715115906.2664882-8-smostafa@google.com>
 <alfJ0cLRSw-qmCrP@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alfJ0cLRSw-qmCrP@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_114328_742836_C063AE23 
X-CRM114-Status: GOOD (  55.67  )
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

On Wed, Jul 15, 2026 at 06:56:33PM +0100, Vincent Donnefort wrote:
> On Wed, Jul 15, 2026 at 11:58:48AM +0000, Mostafa Saleh wrote:
> > Create a page-table for the IOMMU that shadows the host CPU stage-2
> > to establish DMA isolation.
> > 
> > An initial snapshot is created after the driver init, then
> > on every permission change a callback would be called for
> > the IOMMU driver to update the page table.
> > 
> > There are 3 different ways to add the callback:
> > 1) In the high level memory transitions: (__pkvm_host_donate_hyp(),
> >   __pkvm_host_donate_guest()...
> > 
> > 2) In Lower level functions covering all transitions
> >   - host_stage2_set_owner_metadata_locked() which covers:
> >    - __pkvm_host_donate_hyp()
> >    - __pkvm_host_donate_guest()
> >    - __pkvm_host_donate_hyp()
> >    - __pkvm_guest_unshare_host()
> >   - host_stage2_set_owner_locked() only for ID_HOST which covers:
> >    - __pkvm_hyp_donate_host()
> >    - __pkvm_host_force_reclaim_page_guest()
> >    - __pkvm_host_reclaim_page_guest()
> >   - __pkvm_guest_share_host()
> > 
> > 3) In the lowest level function __host_update_page_state(), which
> >    requires only one callback. However, in that case the page state
> >    is not enough as we might need to know the old state also.
> > 
> > Option #2 was implemented here.
> > 
> > For some cases, an SMMUv3 may be able to share the same page-table
> > used with the host CPU stage-2 directly.
> > 
> > However, this is too strict and requires changes to the core hypervisor
> > page-table code, plus it would require the hypervisor to handle IOMMU
> > page-faults. This can be added later as an optimization for SMMUV3.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/iommu.h       |   4 +
> >  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   1 +
> >  arch/arm64/kvm/hyp/nvhe/iommu.c               | 129 +++++++++++++++++-
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c         |  27 ++--
> >  4 files changed, 145 insertions(+), 16 deletions(-)
[...]
> > +
> > +/*
> > + * IOMMU page tables are shadowed and not shared, that is mainly because:
> > + * - Possible inconsistency between IOMMU and CPU features or format.
> > + * - KVM relies on handling in page faults (BBM, lazy mapping).
> > + */
> > +static int __snapshot_host_stage2(const struct kvm_pgtable_visit_ctx *ctx,
> > +				  enum kvm_pgtable_walk_flags visit)
> > +{
> > +	u64 start = ctx->addr;
> > +	u64 block_end = ALIGN_DOWN(ctx->addr, kvm_granule_size(ctx->level)) +
> > +			kvm_granule_size(ctx->level);
> 
> nit: I believe that for more complex init like that we should just put it after
> the declarations.

I see, I will fix it.

> 
> > +	u64 end = min(ctx->end, block_end);
> > +	kvm_pte_t pte = *ctx->ptep;
> > +	bool is_memory = *(bool *)ctx->arg;
> > +	int prot;
> > +
> > +	/*
> > +	 * Keep annotated PTEs unmapped, and map everything else even lazily
> > +	 * mapped PTEs(0), as the IOMMU can't handle page faults.
> > +	 * That maps the whole address space which can be large, but that doesn't
> > +	 * use a lot of memory as it will be mostly large block (1 GB with 4kb pages)
> > +	 */
> > +	if (pte && !kvm_pte_valid(pte))
> >  		return 0;
> >  
> > -	return pkvm_iommu_ops->init();
> > +	if (kvm_pte_valid(pte))
> > +		prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte));
> > +	else
> > +		prot = IOMMU_READ | IOMMU_WRITE;
> > +
> > +	if (!is_memory)
> > +		prot |= IOMMU_MMIO;
> > +
> > +	return pkvm_iommu_ops->host_stage2_idmap(start, end, prot);
> > +}
> > +
> > +static int pkvm_iommu_snapshot_host_stage2(void)
> > +{
> > +	struct kvm_pgtable *pgt = &host_mmu.pgt;
> > +	bool is_memory;
> > +	struct kvm_pgtable_walker walker = {
> > +		.cb	= __snapshot_host_stage2,
> > +		.flags	= KVM_PGTABLE_WALK_LEAF,
> > +		.arg	= &is_memory,
> > +	};
> > +	int ret = 0, i;
> > +	u64 start = 0;
> > +
> > +	hyp_spin_lock(&host_mmu.lock);
> > +	for (i = 0; i < hyp_memblock_nr; i++) {
> > +		struct memblock_region *reg = &hyp_memory[i];
> > +
> > +		if (start < reg->base) {
> > +			is_memory = false;
> > +			ret = kvm_pgtable_walk(pgt, start, reg->base - start, &walker);
> 
> nit: You could have a helper? So is_memory isn't passed as a reference.
> 
> __snapshot_host_stage2(u64 start, u64 end, bool is_memory)

Not sure I understand, the function signature is defined by the walker,
or do you mean __snapshot_host_stage2() should call another function
were we pass is_memory? That does not seem necessary, the function
is small already.

> > +			if (ret)
> > +				goto out_unlock;
> > +		}
> > +
> > +		is_memory = true;
> > +		ret = kvm_pgtable_walk(pgt, reg->base, reg->size, &walker);
> > +		if (ret)
> > +			goto out_unlock;
> > +
> > +		start = reg->base + reg->size;
> > +	}
> > +
> > +	if (start < BIT(pgt->ia_bits)) {
> > +		is_memory = false;
> > +		ret = kvm_pgtable_walk(pgt, start, BIT(pgt->ia_bits) - start, &walker);
> > +		if (ret)
> > +			goto out_unlock;
> > +	}
> > +
> > +	pkvm_idmap_initialized = true;
> > +
> > +out_unlock:
> > +	hyp_spin_unlock(&host_mmu.lock);
> > +	return ret;
> > +}
> > +
> > +int pkvm_iommu_init(void)
> > +{
> > +	int ret;
> > +
> > +	/* Keep DMA isolation optional. */
> > +	if (!pkvm_iommu_ops || !pkvm_iommu_ops->init ||
> > +	    !pkvm_iommu_ops->host_stage2_idmap)
> > +		return 0;
> > +
> > +	ret = pkvm_iommu_ops->init();
> > +	if (ret)
> > +		return ret;
> > +
> > +	return pkvm_iommu_snapshot_host_stage2();
> > +}
> > +
> > +int pkvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
> > +				enum kvm_pgtable_prot prot)
> > +{
> > +	hyp_assert_lock_held(&host_mmu.lock);
> > +
> > +	if (!pkvm_idmap_initialized)
> > +		return 0;
> > +
> > +	return pkvm_iommu_ops->host_stage2_idmap(start, end, pkvm_to_iommu_prot(prot));
> 
> Out of curiosity, why is it "host_stage2_idmap" and not just "idmap" ?
> 

Well it's a host stage-2 idmap :), maybe one day we support guests also!

> >  }
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index d803b3dd4cb4..ce610274bda0 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -17,6 +17,7 @@
> >  
> >  #include <nvhe/arm-smccc.h>
> >  #include <nvhe/gfp.h>
> > +#include <nvhe/iommu.h>
> >  #include <nvhe/memory.h>
> >  #include <nvhe/mem_protect.h>
> >  #include <nvhe/mm.h>
> > @@ -596,16 +597,15 @@ static int host_stage2_set_owner_metadata_locked(phys_addr_t addr, u64 size,
> >  	ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
> >  			      addr, size, &host_s2_pool,
> >  			      KVM_HOST_INVALID_PTE_TYPE_DONATION, annotation);
> > -	if (!ret) {
> > -		/*
> > -		 * After stage2 maintenance has happened, but before the page
> > -		 * owner has changed.
> > -		 */
> > -		pkvm_sme_dvmsync_fw_call();
> > -		__host_update_page_state(addr, size, PKVM_NOPAGE);
> > -	}
> > -
> > -	return ret;
> > +	if (ret)
> > +		return ret;
> > +	/*
> > +	 * After stage2 maintenance has happened, but before the page
> > +	 * owner has changed.
> > +	 */
> > +	pkvm_sme_dvmsync_fw_call();
> > +	__host_update_page_state(addr, size, PKVM_NOPAGE);
> > +	return pkvm_iommu_host_stage2_idmap(addr, addr + size, 0);
> 
> On error here the host stage-2 annotation needs to be reverted. Or just
> WARN_ON() here. It also probably better to do it before the page-state has
> changed, even if we hold the host stage-2 lock.
> 

I saw that all the callers will WARN on failure, that's why I did
not handle the failure. I can move it earlier.

> >  }
> >  
> >  int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
> > @@ -618,8 +618,10 @@ int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
> >  			return -EPERM;
> >  
> >  		ret = host_stage2_idmap_locked(addr, size, PKVM_HOST_MEM_PROT);
> > -		if (!ret)
> > -			__host_update_page_state(addr, size, PKVM_PAGE_OWNED);
> > +		if (ret)
> > +			break;
> > +		__host_update_page_state(addr, size, PKVM_PAGE_OWNED);
> > +		ret = pkvm_iommu_host_stage2_idmap(addr, addr + size, PKVM_HOST_MEM_PROT);
> >  		break;
> >  	case PKVM_ID_HYP:
> >  		ret = host_stage2_set_owner_metadata_locked(addr, size,
> > @@ -1022,6 +1024,7 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
> >  				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_SHARED_OWNED),
> >  				       &vcpu->vcpu.arch.pkvm_memcache, 0));
> >  	WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORROWED));
> > +	WARN_ON(pkvm_iommu_host_stage2_idmap(phys, phys + PAGE_SIZE, PKVM_HOST_MEM_PROT));
> 
> Ha ok I understand your remark yesterday. I thought you'd put
> pkvm_iommu_host_stage2_idmap() into host_stage2_idmap_locked()... but then it
> means it tries to map on very host abort. 

Yes, actually this version is less efficient than v6, as now on VM
teardown we re-map all the VM pages including the shared ones which
are already in the IOMMU. It's is not terrible but the but the
io-pgtable detects that and return -EEXIST which I added new code
in this version to ignore.

> 
> (same though as host_stage2_set_owner_metadata_locked(), I would first update
> the iommu and then update the page-state)

Will do.

Thanks,
Mostafa

> 

