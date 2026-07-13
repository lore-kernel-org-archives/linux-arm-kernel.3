Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6932C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+u4wOosch17douWjmqLZ5xq3MbumbBJVHk1MNjePoo=; b=2R0r2oFV3yPBwpLDvvRK1yGdRv
	s5CzBv3DeDDtqnWN/Mjfax/ysCH3GbKzwEx3HE/0f6FGm/jsDZ4hZhPpupgATRCcb1w0j1At5Fyqk
	cNL3nNco0WG8eZprvfwYxoJbzFtnQEVEJG8V4ZQHjaB9MCL0wOlIVByI44DZ4X6Bl/sNz8gtCaL9z
	AHOht4kBH0ROzJqVX2qKtNV5fppmi7tPWegAVPCT5Y8j14W9cU8bodvBRgzh6VXHgsss1iiSdLIJw
	XNf8vm30mikEIgWGbUXD3VLW3bk9tz3r9KtCPFk3vJDAP0E3IUnPA6JQyr141KKyr+gwJBg4JP5q3
	aJZ3DiVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIwB-00000009qEl-0ZJ2;
	Mon, 13 Jul 2026 15:51:19 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIw8-00000009qDs-2NfK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:51:17 +0000
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b8d92a4eso106725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 08:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783957873; x=1784562673; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c+u4wOosch17douWjmqLZ5xq3MbumbBJVHk1MNjePoo=;
        b=vSDXRUP6HmSf6579/jYw9bxImEIvDE2fqMuEuizbbD/BESf+Ip+n+964D/gX1jVTwU
         0kamA0zph+56BPbrUYHcVyLksxmDq8AIrBOTfOGAEL3/LiC2hnmUDrzPL8GI3d6cVy08
         FbFkxgMu2nhk4NgWNigsQ/QtRwXplUjv8CicWJYn7nQ30u6xopsEcjt77BExSPcioi59
         WTaJrfo92tU9xIReJ8PCpLdQF/3RsfKvxlBu4FpHoqmddhq17WXxIIHOFC/miJ0Q9SEW
         YLJsF3TYyLW5nzc4W3kd2EMd9W/eAI7IDf8gupLUhB3/4Dh2ZRHVCjWPYcB6gvH1dJxs
         Kc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783957873; x=1784562673;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+u4wOosch17douWjmqLZ5xq3MbumbBJVHk1MNjePoo=;
        b=bH4XMSelnHPTPFGbwpCfeorfMZbPHjeHBhq3AewoNfhDNM2mgiPx6o0Y/KwOSYz6KK
         N10k/VXhXfA+KKnFnBC0DKM91CR3Fjvw+yqP/HLGvCQudKFPIHZimMQ/Np5CQ67n5JAz
         ZQHqD0sMiFQjLZdkU3YpJBpiuWW4j6/XyzZxMvPKYyEUoAkPAMyT2CDAji09ROgx1n6i
         89czic44VhmKTqHbU6VXiGw/jdOqdICQix7jVE+5CfiKxqe6zd54XGiSE/Li9tsWQd2r
         CM6QTx7iqhIuRKuT27EJu+N8HF1VAI2xJTb4DwqdcTYlXpkU5v1dEpeSMW/LKCzO2Bys
         gbNg==
X-Gm-Message-State: AOJu0Yy0BWcX5NmqFILEBQviI5C4PcEq45c2FITDgk4Pe1LFrYqfhumr
	mXfZPyeZH2plfKv1reQ9wt20jzpZBs0ziUPScb6T/oBvHB6HyJ9Kuv6ZzFKJekvzJA==
X-Gm-Gg: AfdE7clf0Rfiob+Eg3vkRczjWNmXtoQNZHPDiUzVBsnRnpoBBPfvN9TNao7CtzkVzWB
	0fwJdq6sXZRIO6JuX0YYm390/uvJVut8Ok4NPFuu2SKs0fnzpMlwjVu+hP/4SMIWTwkG894Xt0I
	zwmDFE8ZB+qL8cmYh61mxXhpXPbwNj2KD16+AYqXLUd5p8HifrWOSMKSFM37dtSkcx7xuOxtvaR
	93tDLt69DbOxCRe3x82GScRnsfQUtCpMOZvCiY3qeCGkdIUR35oKVvR0M5zQe+4TNCGid7O8lfN
	uHpPYYWpiywqLaI3eMEKNqF9sb8Zt5fSPc9ld2wufM1jnEPHS2Fh0bVAFyHgH1qLDZha/cppm30
	LoCPY14iB7MhmheeQllsFIBCzt4ad1Z6KW6RBNRE8brjveldRK7XKZU7TVZRzGOmPEayROw+3Jr
	vkNqwalsAVbDsO5pxykvok1lRkdQrwC9mFyzZLHOkOBO9i5N/m
X-Received: by 2002:a05:600c:6d85:b0:493:be38:fa5a with SMTP id 5b1f17b1804b1-49462179b27mr415675e9.10.1783957872819;
        Mon, 13 Jul 2026 08:51:12 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f462e0cb2sm400519f8f.0.2026.07.13.08.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:51:10 -0700 (PDT)
Date: Mon, 13 Jul 2026 15:51:07 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 08/25] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <alUJa5cbjjqZ8n72@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-9-smostafa@google.com>
 <alTnAy7jvjUamwUA@google.com>
 <alTvf7iiOWn4PKE8@google.com>
 <alUA7zsJO1FGnss-@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alUA7zsJO1FGnss-@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_085116_640205_2C69505F 
X-CRM114-Status: GOOD (  58.41  )
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

On Mon, Jul 13, 2026 at 04:14:55PM +0100, Vincent Donnefort wrote:
> On Mon, Jul 13, 2026 at 02:00:31PM +0000, Mostafa Saleh wrote:
> > On Mon, Jul 13, 2026 at 02:24:19PM +0100, Vincent Donnefort wrote:
> > > On Fri, May 01, 2026 at 11:19:10AM +0000, Mostafa Saleh wrote:
> > > > Create a page-table for the IOMMU that shadows the host CPU stage-2
> > > > to establish DMA isolation.
> > > > 
> > > > An initial snapshot is created after the driver init, then
> > > > on every permission change a callback would be called for
> > > > the IOMMU driver to update the page table.
> > > > 
> > 
> > [...]
> > 
> > > > +	 */
> > > > +	if (pte && !kvm_pte_valid(pte))
> > > > +		return 0;
> > > > +
> > > > +	if (kvm_pte_valid(pte)) {
> > > > +		prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte));
> > > > +		/* If the range is mapped in a single PTE, it must be the same type.*/
> > > > +		if (!addr_is_memory(start))
> > > > +			prot |= IOMMU_MMIO;
> > > > +
> > > > +		return kvm_iommu_ops->host_stage2_idmap(start, end, prot);
> > > 
> > > Do we really need to do that when is_memory()? 
> > > 
> > > fix_host_ownership_walker() by calling host_stage2_idmap_locked() and
> > > host_stage2_set_owner_locked() should already handle the memory region. That
> > > would also get rid of kvm_idmap_initialized.
> > > 
> > > So this one here could only take care of the MMIO?
> > > 
> > > Overall we would have a common point of synchro which is
> > > fix_host_ownership_walker() after which the host ownership is ready for both
> > > CPU stage-2 and the IOMMU?
> > > 
> > 
> > I am not sure I understand, this is another empty page table, so we
> > have to walk all of the host CPU stage-2 page table to shadow it in the
> > IOMMU. if you are refering to the case where it handle zero ptes for
> > memory, I can drop that but it will not change much in this logic.
> 
> In fixup_host_ownership() we already walk the hyp pgtable to know what needs to be
> map/unmapped from the host stage-2. Can't we rely on that for the IOMMU
> page-table as well?
> 
> As of, fix_host_ownership() could handle the host stage-2 __and__ the iommu? 

fix_host_ownership() only walks the hypervisor page table, and fixes the
hypervisor pages in the host. That means that the IOMMU page table has
to  be fully populated first, then we unmap the donated pages.
That seems more complicated and it feels that decoupling the IOMMU
logic outside of this would be better.

Also, I rely on the IOMMU init to be done at the end of setup, so we
do not have to clean the IOMMU init if any other part of KVM fails.

> 
> > 
> > > > +	}
> > > > +
> > > > +	/* In case of invalid PTE, we need to figure out which part of it is MMIO */
> > 
> > [...]
> > 
> > > >  #include <nvhe/mm.h>
> > > > @@ -481,6 +482,14 @@ static int check_range_allowed_memory(u64 start, u64 end)
> > > >  	return 0;
> > > >  }
> > > >  
> > > > +u64 find_mem_range_from(u64 start, bool *is_memory)
> > > > +{
> > > > +	struct kvm_mem_range r;
> > > > +
> > > > +	*is_memory = !!find_mem_range(start, &r);
> > > > +	return r.end;
> > > > +}
> > > > +
> > > >  static bool range_is_memory(u64 start, u64 end)
> > > >  {
> > > >  	struct kvm_mem_range r;
> > > > @@ -577,8 +586,34 @@ int host_stage2_idmap_locked(phys_addr_t addr, u64 size,
> > > >  
> > > >  static void __host_update_page_state(phys_addr_t addr, u64 size, enum pkvm_page_state state)
> > > 
> > > I would really split this. I know that this is convinient, but as the function
> > > says, it only update the page state so it shouldn't hide an update to the IOMMU.
> > 
> > I mention a couple of alternatives in the commit message, I tried to
> > implement it differently which was harder to reason about as the calls
> > was scattered everywhere and any small refactor will possibly break it.
> > 
> > Did you have a split in my mind? I open to rework it.
> 
> Yes, I meant the option #2.
> 
> > 
> > > 
> > > Beside, we have examples already in Android where we want to update the
> > > page-state but not the IOMMU, so it doesn't feel future-proof...
> > > 
> > > >  {
> > > > +	enum pkvm_page_state old = get_host_state(hyp_phys_to_page(addr));
> > > > +	enum kvm_pgtable_prot prot = 0;
> > > > +
> > > >  	for_each_hyp_page(page, addr, size)
> > > >  		set_host_state(page, state);
> > > > +
> > > > +	/*
> > > > +	 * Any transition to PKVM_NOPAGE, unmaps the page from the host
> > > > +	 * Any transition to PKVM_PAGE_SHARED_BORROWED, maps the page in the host
> > > > +	 * Any transition to PKVM_PAGE_SHARED_OWNED is ignored as page is already mapped.
> > > > +	 * Transitions to PKVM_PAGE_OWNED from anything but PKVM_NOPAGE are ignored.
> > > > +	 * Transitions to PKVM_PAGE_OWNED from PKVM_NOPAGE will map the page.
> > > > +	 */
> > > > +	if ((state == PKVM_PAGE_SHARED_OWNED) ||
> > > > +		((state == PKVM_PAGE_OWNED) && (old != PKVM_NOPAGE)))
> > > > +		return;
> > > > +
> > > > +	if ((state == PKVM_PAGE_SHARED_BORROWED) ||
> > > > +		(state == PKVM_PAGE_OWNED))
> > > > +		prot = PKVM_HOST_MEM_PROT;
> > > 
> > > ... and that would avoid that sort of things here. The caller decides if the IOMMU
> > > is updated or not.
> > 
> > Typically, the IOMMU is updated if the CPU is.
> > 
> > > 
> > > And as the patch says, we "shadow" the host stage2. So probably modifying
> > > host_stage2_idmap and host_stage2_set_owner_metdata() sounds really a better
> > > approach.
> > 
> > Initially, before the pKVM merge upstream I was doing something similar
> > as that only required one hook [1]. However, after rebasing I found that
> > would be too complicated and I have to add many more (as mentioned in
> > the commit message). But I can re-visit this approach in v7.
> 
> What bit would be more complicated? As you've wrote in the commit message, in
> option#2 you only need two calls really:
> 
>   * host_stage2_set_owner_locked()
>   * host_stage2_set_owner_metadata_locked().
> 
> This fits better the narative for the "shadow" page-table: when we map the host
> stage-2, we map the iommu and when we unmap the host stage-2, we unmap the
> iommu.

I see, looking again it does not seem as complicated as I was imagining,
I will try that for v7.

Thanks,
Mostafa

> 
> > 
> > [1] https://lore.kernel.org/all/20250819215156.2494305-11-smostafa@google.com/
> > 
> > Thanks,
> > Mostafa
> > 

