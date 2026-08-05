Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC1DC5AC79
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 14:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNzat26Y19ZrKtjltXLxT2fvXKCHP/AoQJ9WhsEOxAU=; b=yM1e49rJ9UJV3wcZqrsqKd7YSZ
	Ar4QgSjTACh0unbmXQI4Ho4eGDEUi2Z5qZ09774w5Zcx5MvirwDeI+MZ7lAFwJ2FYXBE3bCKE9kel
	ldZ/9jXUXxdEwol5NRI+Bb5z5YkiMioVdhiiHRf3P747QGRu4b3NFE9ZsCOC4xeibqR5G6P7Ur+3+
	UCqLnnag0Cb54DDCKkItPHVprVou1iZ7h4uNnG5Wpx4MkD52rMQoHf+r/KS2MgbN85KHHTGpLXJMi
	joSCfmS2k8pCchjE0edPzlmC2NGWI/nj5lfW8fn2HDDoH/jmkweBO6TAdKFk+GzGLmr88W+7fN7vN
	Es6xW9Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrd3R-000000047jh-1seN;
	Wed, 05 Aug 2026 14:57:13 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrd3O-000000047j3-1Awk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 14:57:11 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4954d5d814fso69765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 07:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785941827; x=1786546627; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NNzat26Y19ZrKtjltXLxT2fvXKCHP/AoQJ9WhsEOxAU=;
        b=Ld1WAiLsYBL41Q/DBfAWLuNPsBGvvHA53630tfUX8pYmnl2gNe1tkH3BG2wxNh7tae
         JYKwXn+m06sea+rc5hzQV5NmXVXgDuM8hRSHGuiwrku8stKwFOuIYFvXdIwv++vK5s21
         bBwiqzZg19sSutD56W8k5K9TA0HLsrYXp61nE22aB/NzX8JnLD4sQ/Vjpc/685RWC+tC
         BIyQz87XeSmMx/7fb8wV89yqXP+R9C+AxIzx79gtw8xEoAtox/lFUSVMLWbJX6WcjHgG
         QmriiOozOTcXB35Tj+tCZs6bI3uss5qKgsrO+7RBUUvXdFFfTC9asrl7PRKVn8J3p8/r
         GdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785941827; x=1786546627;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NNzat26Y19ZrKtjltXLxT2fvXKCHP/AoQJ9WhsEOxAU=;
        b=aZ5xSesEngPO97E4lpTkIALU84m3tNSWNWaP8RPcVrMjrlSYE6NpOpYtS0qZoPgCIq
         2Ie37HGI39L8tlSXZtkeD99ZrJCGiZ2gFH+xN5nTkZWoKAxcjxdTcNwsk36/9gumRAL4
         wxNuQsOr2lM2QBZN9lI6uD57+QxKKvRtTedQ+an4J3/huqEdNdDRdANsW+Q9xosk8j8X
         9IUiEyMMtTWYK6UKgA8Y33zxfxatqmffSoSH/2R16vqCfwHXEyXw4sFn0tD7njC+4pTA
         Ztv3QDI0+Nquc7lCllCq0cqf5Z3PXegJghn3u6dkK+MemmI2rP376l0KVds0UNqql1Ou
         zQdQ==
X-Gm-Message-State: AOJu0YzOV46Md/SSPPkncE2N0euJLN+ZGULqHnvM4EPi0f6SbqzWHQTF
	AxAOnRFODX3qvW9LCJC5scN+O7RMQWxrmtQCXgPYvQwduW0lrLyHfE4ewq5NUmWfXw==
X-Gm-Gg: AR+sD13uijcur+bDdOUqPo7TYBp5kBCdY6tcrhovRytcAlJOEtxUF11IajSxRdwEaGC
	aFj2R9XghiwIuTA2E/37a0ELHZbpaahPGdHLIXjifVmQMciKldySCns+R604pDjSpzoKe15MrYH
	DKm1tvwzRN4I2E8T+809GnAUmg21HXwhG6UhbznzgdK9iZ7TK5kOV40VcsEwx1s4w3KBj/0YXOI
	qM374jfwEu0V46qLi4MSzRr+Lrdo9EJhAtpgWnoRF5rXy1iJo0m7OkEuzNYdOkXtcAKePBZH3dN
	GNm6FU/gJGM7qSA2DmAjBhxppJYnji0cW4svXFpLRst0pEYjA+0R6vleLj9xupblDAVwRTv1rU8
	VzgsIYoG3kbtWdcy62ckMQAJ5w9XZXKwrnzRhHsoMRIgaHb08lzaDyped4RLfospAo1hdLR9YMS
	kr+ImiZdGykV9o1TGxWpmVap1kAfJ4O5sc8DTMHRnd4OQtaF5ytGvhggrO5P1IEWeWKmYYefgoh
	HxPkkNCOAP0ZzJ3BstggATEk0Yeph2a
X-Received: by 2002:a05:600c:6554:b0:493:ae5f:d29f with SMTP id 5b1f17b1804b1-4994f0fb66dmr834065e9.3.1785941827064;
        Wed, 05 Aug 2026 07:57:07 -0700 (PDT)
Received: from google.com (63.235.189.35.bc.googleusercontent.com. [35.189.235.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec232d74sm9786235f8f.17.2026.08.05.07.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 07:57:06 -0700 (PDT)
Date: Wed, 5 Aug 2026 14:57:02 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, keirf@google.com
Subject: Re: [PATCH v7 02/24] KVM: arm64: Donate MMIO to the hypervisor
Message-ID: <anNPPrjGd2Z2dSwc@google.com>
References: <20260715115906.2664882-1-smostafa@google.com>
 <20260715115906.2664882-3-smostafa@google.com>
 <anMwxy9gEEt_Wu6M@google.com>
 <anM9sk_gXTt5F1Ie@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anM9sk_gXTt5F1Ie@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_075710_380119_90CC8279 
X-CRM114-Status: GOOD (  48.26  )
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

On Wed, Aug 05, 2026 at 01:42:10PM +0000, Mostafa Saleh wrote:
> On Wed, Aug 05, 2026 at 12:47:03PM +0000, Sebastian Ene wrote:
> > On Wed, Jul 15, 2026 at 11:58:43AM +0000, Mostafa Saleh wrote:
> > > Add a function to donate MMIO to the hypervisor so IOMMU hypervisor
> > > drivers can protect and access the MMIO of IOMMUs.
> > > 
> > > As donating MMIO is very rare, and we don’t need to encode the full
> > > state, it’s reasonable to have a separate function to do this.
> > > It will init the host s2 page table with an invalid leaf with the owner ID
> > > to prevent the host from mapping the page on faults.
> > > 
> > > Also, prevent kvm_pgtable_stage2_unmap() from removing owner ID from
> > > stage-2 PTEs, as this can be triggered from recycle logic under memory
> > > pressure. There is no code relying on this, as all ownership changes is
> > > done via kvm_pgtable_stage2_set_owner()
> > > 
> > > For the error path in IOMMU drivers, add a function to donate MMIO
> > > back from hyp to host. However, that leaks the hypervisor virtual
> > > address range which should be acceptable as this is quite rare and
> > > it matches the behaviour of fix_map/block.
> > > 
> > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > > ---
> > >  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  7 ++
> > >  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 91 ++++++++++++++++++-
> > >  arch/arm64/kvm/hyp/pgtable.c                  | 11 +--
> > >  3 files changed, 102 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > > index 29935c7da1de..51b0eb3844a9 100644
> > > --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > > +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > > @@ -36,6 +36,13 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
> > >  int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
> > >  int __pkvm_host_unshare_hyp(u64 pfn);
> > >  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
> > > +/*
> > > + * Donate MMIO range to the hypervisor, it will be mapped in the hypervisor's
> > > + * private range and unmapped from the host stage-2.
> > > + */
> > > +int __pkvm_host_donate_hyp_mmio(phys_addr_t addr, size_t size, unsigned long *haddr);
> > > +/* Remaps MMIO range in the host, typically used in error path. */
> > > +int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size);
> > >  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
> > >  int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
> > >  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > index 4e329e39a695..d803b3dd4cb4 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > @@ -378,7 +378,11 @@ static int host_stage2_unmap_dev_all(void)
> > >  	u64 addr = 0;
> > >  	int i, ret;
> > >  
> > > -	/* Unmap all non-memory regions to recycle the pages */
> > > +	/*
> > > +	 * Unmap all non-memory regions to recycle the pages.
> > > +	 * That relies on kvm_pgtable_stage2_unmap() not clearing
> > > +	 * counted PTEs which include hypervisor MMIO.
> > > +	 */
> > >  	for (i = 0; i < hyp_memblock_nr; i++, addr = reg->base + reg->size) {
> > >  		reg = &hyp_memory[i];
> > >  		ret = kvm_pgtable_stage2_unmap(pgt, addr, reg->base - addr);
> > > @@ -1119,6 +1123,91 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
> > >  	return ret;
> > >  }
> > >  
> > > +int __pkvm_host_donate_hyp_mmio(phys_addr_t addr, size_t size, unsigned long *haddr)
> > > +{
> > > +	kvm_pte_t pte;
> > > +	u64 offset;
> > > +	int ret;
> > > +
> > > +	/* Only before de-privilege. */
> > > +	if (static_branch_unlikely(&kvm_protected_mode_initialized))
> > > +		return -EPERM;
> > > +
> > > +	if (!PAGE_ALIGNED(addr | size) ||
> > > +	    !pfn_range_is_valid(hyp_phys_to_pfn(addr), size >> PAGE_SHIFT))
> > > +		return -EINVAL;
> > > +
> > > +	ret = __pkvm_create_private_mapping(addr, size, PAGE_HYP_DEVICE, haddr);
> > 
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	host_lock_component();
> > > +	for (offset = 0; offset < size; offset += PAGE_SIZE) {
> > > +		if (addr_is_memory(addr + offset)) {
> > > +			ret = -EINVAL;
> > > +			goto unlock;
> > 
> > If this fails we are left with the mapping inside the hyp because the unlock
> > doesn't destroy the private mapping. Is this intended ?
> > 
> 
> Yes, there is no way to remove a private mapping at the moment, all
> the callers to __pkvm_create_private_mapping() will leak it on failure.
> 
> > > +		}
> > > +		ret = kvm_pgtable_get_leaf(&host_mmu.pgt, addr + offset, &pte, NULL);
> > > +		if (ret)
> > > +			goto unlock;
> > > +		if (pte && !kvm_pte_valid(pte)) {
> > > +			ret = -EPERM;
> > > +			goto unlock;
> > > +		}
> > > +	}
> > > +	/*
> > > +	 * We set HYP as the owner of the MMIO pages in the host stage-2, for:
> > > +	 * - host aborts: host_stage2_adjust_range() would fail for invalid non zero PTEs.
> > > +	 * - recycle under memory pressure: host_stage2_unmap_dev_all() would call
> > > +	 *   kvm_pgtable_stage2_unmap() which will not clear non zero invalid ptes (counted).
> > > +	 * - other MMIO donation: Would fail as we check that the PTE is valid or empty.
> > > +	 */
> > > +	ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
> > > +			      addr, size, &host_s2_pool,
> > > +			      KVM_HOST_INVALID_PTE_TYPE_DONATION,
> > > +			      FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, PKVM_ID_HYP));
> > > +unlock:
> > > +	host_unlock_component();
> > > +	return ret;
> > > +}
> > > +
> > > +int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size)
> > 
> > This function seems to only update the host stage-2 annotation but it
> > doesn't destroy the hyp mapping.
> 
> Yes, as mentioned above there is no way to destroy it, and this was
> not desgined for frequent use. Typicaly, __pkvm_host_donate_hyp_mmio()
> is called at boot per area/device. And __pkvm_hyp_donate_host_mmio()
> is only used for failures.
> 

Yes, I saw that you only allow the call during the init pKVM calls, however it seems a bit fragile.

> > 
> > I was looking to make use of this patch in an upcoming posting for the
> > v2 ITS hardening but in my case I don't need the private VA range
> > creation.
> 
> I believe if you need to map MMIO, private range is the right way to
> do it as the linear map was mainly designed around system memory.

Is there a reason behind not having MMIO as part of the linear
map in the hypervisor ? I would like to avoid holding the hva around and
just do a simple addition to resolve the hyp_va.

> 
> Thanks,
> Mostafa
>

Thanks,
Sebastian

