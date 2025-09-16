Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C09ECAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 13:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BHOalff8m1sEtBaAy0omnedb+cWGI69lbfkwDKZ9kc=; b=glo08tIdl8FMybKZmi2wqCq44F
	34QgazNLR/wdMneVLz/Jmr5SClVMQnaDEiOarp0ZOzdHA3gcMp9DG8dBr97hkYat6Sjg95GTeP6p7
	PD77TNNOF1mmsUjVMe3POn+KqOpx1bIFag58gOMugPme82SLM660elyEu+RySCPTYltBvs1bQE/Q8
	Oh2/HawidzSirTKxIj5dksu7hgQCM1X/FL9apd6n3xCsZcjw1qMrbWBi06avNNpmqjADS6NYIjQ0k
	K9EKteqTTTWHHu9kJ+sWnIEKE45XPlJ6RdY5dj1hQ/BMwDXFj6AnCrpxYxEb4ioMt6bUSWC0SQr2i
	jy5zVWBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVim-00000007w78-0uCm;
	Tue, 16 Sep 2025 13:27:48 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVij-00000007w5q-2thu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 13:27:46 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45f2d21cbabso50965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 06:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758029264; x=1758634064; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1BHOalff8m1sEtBaAy0omnedb+cWGI69lbfkwDKZ9kc=;
        b=JkkJ+R5stPC4eZHayrm6ZyydYc0bAW1ciH4Q1ezqwtVIMTC9X87WFwqwuljv2MRI9D
         EuiQO2jAtPr+UZ/Sv8SVafcvpZPqoP68YEO88UQE7aMe/kxHV0GQWDEyzYQyVUPK7Eig
         Ew99gkRfUVH8DLrsSMcnYVjLCG7soPJXnwjAQGdooUE3Ngnaurft+ylM0aWOrr0U/Mas
         bRxAtRXQQIQaHEu9ASPXnavOQm5fL3NJXJf4zjaRCWz+5LCn6VN/wmuYKqR5OBmlD+Xi
         xqgPSH6IQXRqMo4bqZQ39/EDwMPcuQVU7/BOySdz9gytExEeD6aohCWpr1rrIDNgyxas
         0YXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758029264; x=1758634064;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1BHOalff8m1sEtBaAy0omnedb+cWGI69lbfkwDKZ9kc=;
        b=hkoF+ljL195ZIGCLQIX22e2lxhAm8s8Po0hSw5e07v3MwqnG2rDC4+7U2RBeR4pMgg
         i8VWkZN29OGYT2CteyroBDHjdjNtlamXEjbl8CBahpTDyHAZJTNL0SuqKGZO3rR8FY5z
         dbAYd2X+z1qHt8sBSYH2d9SyiHbxIFm4xVCnVHE05USYWSyABe4FnkXwnXbjCKUkMipG
         pdGpYRihEXzRVpPdgZerfb/1bE90kuXGeZofTnxIVqxQOBE0qYDFiHRdQp9cl0KRU1S1
         bnBQZ8XXQCZNenODJpeNDAU5xrlZsSheZjjxY0c7sAgWDhc3DRtIk1F4xJvUJZJUF7rK
         fK5g==
X-Forwarded-Encrypted: i=1; AJvYcCUBBSBII/oq+mNUMGIgSU7BijT3RFban6CzcbyIdODCkR7mPHdFnlIIHCFKGLL/7tQyZGJS5Eq5E4euGbnYcFD4@lists.infradead.org
X-Gm-Message-State: AOJu0YwhajJbX06ZwMcFmu07C7c2rB/DD6QdQABG0zRvKBi/+4Vlw0X4
	ThHpFL0MjzOeUAW8vgaohMJQ70Jy2efgHvqBE9fPPOSbJrTZGSxV7EsTT6yYdwx1Pg==
X-Gm-Gg: ASbGncug+ZcDI2yl9q8mTBBLcYzyFhfphV7WJCgzpwpJXthpgAwC43rXvoqTZFcjDur
	du/pZhAKtIK3D9vAk+AUg33UeS6Y2NKcGfiEVTPJFkLWbOVp6ONr0iC5mGiPVSlw+m/47HwFhV/
	CWSAJGLenyMaOs8GRZZk5eHvKj42NFpSF2XNyHgWPDyQWTIqKHvDNaX/WiDND2qBeBfLI0Bfhw0
	L3aUu8tQvroavrSFNrGNnqvBwQb2XwrrMA6ZSug8b7Sb7nN/QYZwyhnO5qPCxvIpc+bOEBM+OLE
	sSs3rVQPOsy5dsPDVXGnX2lcwvTyCDrHBsTClt3chZjUK7NNtK4FmbgPzf/D89QZy3x+B4CGTqf
	86W2d2BTSMEO/fFNuh2MFNxGUW1l3k8HyXLlT+ZKE8XQpBPjqTZ3rBd/d5dCuy5tMAdbMmcsXzW
	LBdpcz
X-Google-Smtp-Source: AGHT+IHpO3TM6wn0wdYZvYreXHSvE8knSxzVulFeyjbb2VOK8rBqXdxwKd/PFHa+lbfy7DcIUz373Q==
X-Received: by 2002:a05:600c:8b6a:b0:45f:5b02:b0cb with SMTP id 5b1f17b1804b1-45f5b02b390mr1128685e9.0.1758029263552;
        Tue, 16 Sep 2025 06:27:43 -0700 (PDT)
Received: from google.com (157.24.148.146.bc.googleusercontent.com. [146.148.24.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e95b111b68sm12008298f8f.32.2025.09.16.06.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 06:27:43 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:27:39 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 02/28] KVM: arm64: Donate MMIO to the hypervisor
Message-ID: <aMlly_9kDE04Inn2@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-3-smostafa@google.com>
 <aMA13Sowq91XEqP9@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMA13Sowq91XEqP9@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_062745_766746_F6BCA01F 
X-CRM114-Status: GOOD (  41.21  )
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

On Tue, Sep 09, 2025 at 03:12:45PM +0100, Will Deacon wrote:
> On Tue, Aug 19, 2025 at 09:51:30PM +0000, Mostafa Saleh wrote:
> > Add a function to donate MMIO to the hypervisor so IOMMU hypervisor
> > drivers can use that to protect the MMIO of IOMMU.
> > The initial attempt to implement this was to have a new flag to
> > "___pkvm_host_donate_hyp" to accept MMIO. However that had many problems,
> > it was quite intrusive for host/hyp to check/set page state to make it
> > aware of MMIO and to encode the state in the page table in that case.
> > Which is called in paths that can be sensitive to performance (FFA, VMs..)
> > 
> > As donating MMIO is very rare, and we don’t need to encode the full state,
> > it’s reasonable to have a separate function to do this.
> > It will init the host s2 page table with an invalid leaf with the owner ID
> > to prevent the host from mapping the page on faults.
> > 
> > Also, prevent kvm_pgtable_stage2_unmap() from removing owner ID from
> > stage-2 PTEs, as this can be triggered from recycle logic under memory
> > pressure. There is no code relying on this, as all ownership changes is
> > done via kvm_pgtable_stage2_set_owner()
> > 
> > For error path in IOMMU drivers, add a function to donate MMIO back
> > from hyp to host.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 64 +++++++++++++++++++
> >  arch/arm64/kvm/hyp/pgtable.c                  |  9 +--
> >  3 files changed, 68 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > index 52d7ee91e18c..98e173da0f9b 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > @@ -37,6 +37,8 @@ int __pkvm_host_share_hyp(u64 pfn);
> >  int __pkvm_host_unshare_hyp(u64 pfn);
> >  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
> >  int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot);
> > +int __pkvm_host_donate_hyp_mmio(u64 pfn);
> > +int __pkvm_hyp_donate_host_mmio(u64 pfn);
> >  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
> >  int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
> >  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 861e448183fd..c9a15ef6b18d 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -799,6 +799,70 @@ int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot)
> >  	return ret;
> >  }
> >  
> > +int __pkvm_host_donate_hyp_mmio(u64 pfn)
> > +{
> > +	u64 phys = hyp_pfn_to_phys(pfn);
> > +	void *virt = __hyp_va(phys);
> > +	int ret;
> > +	kvm_pte_t pte;
> > +
> > +	host_lock_component();
> > +	hyp_lock_component();
> > +
> > +	ret = kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, NULL);
> > +	if (ret)
> > +		goto unlock;
> > +
> > +	if (pte && !kvm_pte_valid(pte)) {
> > +		ret = -EPERM;
> > +		goto unlock;
> > +	}
> 
> Shouldn't we first check that the pfn is indeed MMIO? Otherwise, testing
> the pte for the ownership information isn't right.

I will add it, although the input should be trusted as it comes from the
hypervisor SMMUv3 driver.

> 
> > +	ret = kvm_pgtable_get_leaf(&pkvm_pgtable, (u64)virt, &pte, NULL);
> > +	if (ret)
> > +		goto unlock;
> > +	if (pte) {
> > +		ret = -EBUSY;
> > +		goto unlock;
> > +	}
> > +
> > +	ret = pkvm_create_mappings_locked(virt, virt + PAGE_SIZE, PAGE_HYP_DEVICE);
> > +	if (ret)
> > +		goto unlock;
> > +	/*
> > +	 * We set HYP as the owner of the MMIO pages in the host stage-2, for:
> > +	 * - host aborts: host_stage2_adjust_range() would fail for invalid non zero PTEs.
> > +	 * - recycle under memory pressure: host_stage2_unmap_dev_all() would call
> > +	 *   kvm_pgtable_stage2_unmap() which will not clear non zero invalid ptes (counted).
> > +	 * - other MMIO donation: Would fail as we check that the PTE is valid or empty.
> > +	 */
> > +	WARN_ON(host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt, phys,
> > +				PAGE_SIZE, &host_s2_pool, PKVM_ID_HYP));
> > +unlock:
> > +	hyp_unlock_component();
> > +	host_unlock_component();
> > +
> > +	return ret;
> > +}
> > +
> > +int __pkvm_hyp_donate_host_mmio(u64 pfn)
> > +{
> > +	u64 phys = hyp_pfn_to_phys(pfn);
> > +	u64 virt = (u64)__hyp_va(phys);
> > +	size_t size = PAGE_SIZE;
> > +
> > +	host_lock_component();
> > +	hyp_lock_component();
> 
> Shouldn't we check that:
> 
>   1. pfn is mmio
>   2. pfn is owned by hyp
>   3. The host doesn't have something mapped at pfn already
> 
> ?
> 

I thought about this initially, but as
- This code is only called from the hypervisor with trusted
  inputs (only at boot)
- Only called on error path

So WARN_ON in case of failure to unmap MMIO pages seemed is good enough,
to avoid extra code.

But I can add the checks if you think they are necessary, we will need
to add new helpers for MMIO state though.

> > +	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) != size);
> > +	WARN_ON(host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt, phys,
> > +				PAGE_SIZE, &host_s2_pool, PKVM_ID_HOST));
> > +	hyp_unlock_component();
> > +	host_unlock_component();
> > +
> > +	return 0;
> > +}
> > +
> >  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
> >  {
> >  	return ___pkvm_host_donate_hyp(pfn, nr_pages, PAGE_HYP);
> > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > index c351b4abd5db..ba06b0c21d5a 100644
> > --- a/arch/arm64/kvm/hyp/pgtable.c
> > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > @@ -1095,13 +1095,8 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
> >  	kvm_pte_t *childp = NULL;
> >  	bool need_flush = false;
> >  
> > -	if (!kvm_pte_valid(ctx->old)) {
> > -		if (stage2_pte_is_counted(ctx->old)) {
> > -			kvm_clear_pte(ctx->ptep);
> > -			mm_ops->put_page(ctx->ptep);
> > -		}
> > -		return 0;
> > -	}
> > +	if (!kvm_pte_valid(ctx->old))
> > +		return stage2_pte_is_counted(ctx->old) ? -EPERM : 0;
> 
> Can this code be reached for the guest? For example, if
> pkvm_pgtable_stage2_destroy() runs into an MMIO-guarded pte on teardown?

AFAICT, VMs page table is destroyed from reclaim_pgtable_pages() =>
kvm_pgtable_stage2_destroy() => kvm_pgtable_stage2_destroy_range() ... =>
stage2_free_walker()

Which doesn't interact with “stage2_unmap_walker”, so that should be
fine.

Thanks,
Mostafa


> 
> Will

