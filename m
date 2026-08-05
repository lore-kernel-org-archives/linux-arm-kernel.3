Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205F3C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 13:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHYWzmu6ZuPAY5Z9zsBk2vZkLf/NrY20M76Txnt8CKc=; b=mo5+G+G3HuL8iGrmrqVOUFf9oF
	OJ+4B2cspWVFt7xy3mUw+3oVkiCN5DySCsKAlg638w3JAlYxfKYCIXFGjcVWvCMpo7fg6ruf14Ev8
	KQEiSsKAxj+UNxPOA6Her1WuvRiM5aMDeoT8DbrZJyDeUB2a9O20wPwPVeqYInAIzI6+lWmXZBbCR
	mgSf9LPsuUBniBJCgr33AxAHOb53TgoR+atOcWW3L5mDG7GcdFQfyOUS1XiCVAOPiAp2PEzn0bcv6
	qCnIrGxGN5ITbOmvgXs9yQselQ0WRRTQYXc5uwk21dtDNPRn/UorWybU81Ukxe5whDrNwHz6n1Xvd
	bHH2guvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrbsy-000000040g0-1p4L;
	Wed, 05 Aug 2026 13:42:20 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrbsw-000000040fH-0rsP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 13:42:19 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6a17c7c3c6eso6137a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 06:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785937336; x=1786542136; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pHYWzmu6ZuPAY5Z9zsBk2vZkLf/NrY20M76Txnt8CKc=;
        b=K6p2UrE05BrP+4BmSfW0wSp2E1fgaLFChz+/7xSKozaqApVTGbmsYoM1jvYUS501oJ
         Yw9jL82mfM0VOBveLNfCHzxGIi8jCqSUicTIQUO0s/+ao/quxnGQqQeaI7iC/GdA1PdB
         InaYtMq2OOn2ARSqZcDQdfcSUDN60jIPNnzhLYmNjtUcBIPogvwXawI+g5Xz81hxbf9k
         BXsLYQaGwbvpshajSL1BRpf27JN1bXqmBVm1q4p/ksXiIAj139Oto8L84BpyvojVttUm
         vtSN7kIaR/KSdVJgBWIOJWAnbNQKjYdPDaZeORx0mvhXqARI71z2NZ/7OOUGlH/sA4Zv
         UkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937336; x=1786542136;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pHYWzmu6ZuPAY5Z9zsBk2vZkLf/NrY20M76Txnt8CKc=;
        b=nHmKAgfpqNTj2DBIQesPQMVYiQ4GN9Kr2UyQxbUb9GKz+kX302fFKasw4DdCdkSElc
         qrD9LB8qUu8ZtT35JEKKK/lLDd16cbbEO5sFRDnThLSGlaFeY5h4i1zswLhYLGEGPJKx
         PK2ZBR2aqPi2DDMfvXABEqlYQaRaz8c1DosUi9ToECVCcnc9vtehvOmBIy7mDTCa+dmF
         aoASc1tS+5tTismh3U1yjsukWVOmLC1hjSvdR/nf5t5uzmebbNhe6JUbh7cjY0zj3TFE
         2iURM/1xsHVTv38Sl5bstfZ/U0L02h4x+h3ohq0I/1roSzz2M7vV5CexTuQkGXb2jROx
         KKsw==
X-Gm-Message-State: AOJu0YyHJ2KPM5X2rOPzJO+vj3NOm94+mobCPHRceM5/21tkqpMghHCd
	jAy/Qz3cOE6aQyXDIy483RdudgFULyIURypU48ph7gt2sgNaqM0GDBXF2Bj2K4e2phzyh2ZudL9
	7u7i0rA==
X-Gm-Gg: AR+sD13XePpL1lkxCtOJF52e6/ZQ6ip09oMUW6JRuulTMnLyQ7imyffwJy3bVhJN3lJ
	6fJxKJUghHZEMJxH1U12/8jR+YISLPQEANqI4ozxqzItQbIZ1LG9Fcjxfa+RWn1MiyVDUCuYisF
	ozaTFr9zul1+bxuGToWnqpLovTM5zOaLN7NMkJEZhRpaJX0mv3qMLvXS4Pc7FfJFPpssmczook8
	6lafAQuLhCgbn54EllqwmwrLNtd/M6i1+f1v5GrukniyQB+nRUQl0ZhOX2UgFcyeHX4ON+u9MS+
	mreQLouS7oeaTWRazP36egAXpDDnb9Zu/o2azfBFa/peW1WDfumbbpeOvLm6wMeKQEBx1y5xTba
	7M6mnvlc8UjNMXYJXYTPrKrsEWkerd5IIoZIm5U5FTUuj+aIq431zVOOuxnGHKxwRd26N6DM2Cb
	umhJVxSgFqdQzQtsv5Aj569ypo59fYt40jfv2IpnZCrScUZ+CFohxSJ7VGh7tbNekGA9LwPTWWC
	ufOc/cmH+H59dQFUtFTNjEhO/yQqA==
X-Received: by 2002:aa7:dbc1:0:b0:69f:d9cd:ec41 with SMTP id 4fb4d7f45d1cf-6a14fc57373mr57486a12.6.1785937335722;
        Wed, 05 Aug 2026 06:42:15 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c20560bab69sm8654166b.37.2026.08.05.06.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:42:14 -0700 (PDT)
Date: Wed, 5 Aug 2026 13:42:10 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, keirf@google.com
Subject: Re: [PATCH v7 02/24] KVM: arm64: Donate MMIO to the hypervisor
Message-ID: <anM9sk_gXTt5F1Ie@google.com>
References: <20260715115906.2664882-1-smostafa@google.com>
 <20260715115906.2664882-3-smostafa@google.com>
 <anMwxy9gEEt_Wu6M@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anMwxy9gEEt_Wu6M@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_064218_278146_A475BBAA 
X-CRM114-Status: GOOD (  40.70  )
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

On Wed, Aug 05, 2026 at 12:47:03PM +0000, Sebastian Ene wrote:
> On Wed, Jul 15, 2026 at 11:58:43AM +0000, Mostafa Saleh wrote:
> > Add a function to donate MMIO to the hypervisor so IOMMU hypervisor
> > drivers can protect and access the MMIO of IOMMUs.
> > 
> > As donating MMIO is very rare, and we don’t need to encode the full
> > state, it’s reasonable to have a separate function to do this.
> > It will init the host s2 page table with an invalid leaf with the owner ID
> > to prevent the host from mapping the page on faults.
> > 
> > Also, prevent kvm_pgtable_stage2_unmap() from removing owner ID from
> > stage-2 PTEs, as this can be triggered from recycle logic under memory
> > pressure. There is no code relying on this, as all ownership changes is
> > done via kvm_pgtable_stage2_set_owner()
> > 
> > For the error path in IOMMU drivers, add a function to donate MMIO
> > back from hyp to host. However, that leaks the hypervisor virtual
> > address range which should be acceptable as this is quite rare and
> > it matches the behaviour of fix_map/block.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  7 ++
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 91 ++++++++++++++++++-
> >  arch/arm64/kvm/hyp/pgtable.c                  | 11 +--
> >  3 files changed, 102 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > index 29935c7da1de..51b0eb3844a9 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > @@ -36,6 +36,13 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
> >  int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
> >  int __pkvm_host_unshare_hyp(u64 pfn);
> >  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
> > +/*
> > + * Donate MMIO range to the hypervisor, it will be mapped in the hypervisor's
> > + * private range and unmapped from the host stage-2.
> > + */
> > +int __pkvm_host_donate_hyp_mmio(phys_addr_t addr, size_t size, unsigned long *haddr);
> > +/* Remaps MMIO range in the host, typically used in error path. */
> > +int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size);
> >  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
> >  int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
> >  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 4e329e39a695..d803b3dd4cb4 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -378,7 +378,11 @@ static int host_stage2_unmap_dev_all(void)
> >  	u64 addr = 0;
> >  	int i, ret;
> >  
> > -	/* Unmap all non-memory regions to recycle the pages */
> > +	/*
> > +	 * Unmap all non-memory regions to recycle the pages.
> > +	 * That relies on kvm_pgtable_stage2_unmap() not clearing
> > +	 * counted PTEs which include hypervisor MMIO.
> > +	 */
> >  	for (i = 0; i < hyp_memblock_nr; i++, addr = reg->base + reg->size) {
> >  		reg = &hyp_memory[i];
> >  		ret = kvm_pgtable_stage2_unmap(pgt, addr, reg->base - addr);
> > @@ -1119,6 +1123,91 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
> >  	return ret;
> >  }
> >  
> > +int __pkvm_host_donate_hyp_mmio(phys_addr_t addr, size_t size, unsigned long *haddr)
> > +{
> > +	kvm_pte_t pte;
> > +	u64 offset;
> > +	int ret;
> > +
> > +	/* Only before de-privilege. */
> > +	if (static_branch_unlikely(&kvm_protected_mode_initialized))
> > +		return -EPERM;
> > +
> > +	if (!PAGE_ALIGNED(addr | size) ||
> > +	    !pfn_range_is_valid(hyp_phys_to_pfn(addr), size >> PAGE_SHIFT))
> > +		return -EINVAL;
> > +
> > +	ret = __pkvm_create_private_mapping(addr, size, PAGE_HYP_DEVICE, haddr);
> 
> > +	if (ret)
> > +		return ret;
> > +
> > +	host_lock_component();
> > +	for (offset = 0; offset < size; offset += PAGE_SIZE) {
> > +		if (addr_is_memory(addr + offset)) {
> > +			ret = -EINVAL;
> > +			goto unlock;
> 
> If this fails we are left with the mapping inside the hyp because the unlock
> doesn't destroy the private mapping. Is this intended ?
> 

Yes, there is no way to remove a private mapping at the moment, all
the callers to __pkvm_create_private_mapping() will leak it on failure.

> > +		}
> > +		ret = kvm_pgtable_get_leaf(&host_mmu.pgt, addr + offset, &pte, NULL);
> > +		if (ret)
> > +			goto unlock;
> > +		if (pte && !kvm_pte_valid(pte)) {
> > +			ret = -EPERM;
> > +			goto unlock;
> > +		}
> > +	}
> > +	/*
> > +	 * We set HYP as the owner of the MMIO pages in the host stage-2, for:
> > +	 * - host aborts: host_stage2_adjust_range() would fail for invalid non zero PTEs.
> > +	 * - recycle under memory pressure: host_stage2_unmap_dev_all() would call
> > +	 *   kvm_pgtable_stage2_unmap() which will not clear non zero invalid ptes (counted).
> > +	 * - other MMIO donation: Would fail as we check that the PTE is valid or empty.
> > +	 */
> > +	ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
> > +			      addr, size, &host_s2_pool,
> > +			      KVM_HOST_INVALID_PTE_TYPE_DONATION,
> > +			      FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, PKVM_ID_HYP));
> > +unlock:
> > +	host_unlock_component();
> > +	return ret;
> > +}
> > +
> > +int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size)
> 
> This function seems to only update the host stage-2 annotation but it
> doesn't destroy the hyp mapping.

Yes, as mentioned above there is no way to destroy it, and this was
not desgined for frequent use. Typicaly, __pkvm_host_donate_hyp_mmio()
is called at boot per area/device. And __pkvm_hyp_donate_host_mmio()
is only used for failures.

> 
> I was looking to make use of this patch in an upcoming posting for the
> v2 ITS hardening but in my case I don't need the private VA range
> creation.

I believe if you need to map MMIO, private range is the right way to
do it as the linear map was mainly designed around system memory.

Thanks,
Mostafa


