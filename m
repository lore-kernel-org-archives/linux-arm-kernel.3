Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8B3C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P15DWYQO7QDzTQoPbuyf65oQTF47QNr5bOsQquOeepQ=; b=jGt8l6s4RkQvwBbQ3Pja6stEXS
	VZV5XduCPFUAuJDZUejVxWF4ljHg62nJl4D2HPhGJcbN0tamYQuTVrAPNYbitZfa0lmr158iIMxd1
	Je5qkUxU3/OwMrwnzadsTKyCfxteKW/3ypN+H7NMaFdoqa1qNm3fAtM4IGvMUa4HI1HDbItlVr2EB
	td+15q62/ISpicmQmMAOFfgqYEuB0H3xMcHOwzniEDS+pd5OmMPrBd5a3B5X1PpXHSgnNz9mB/gPf
	AIYcTRbIsREDTE5M/Gi0HtC/e5Kn+l2cl4o8zfegORPyXalfPO5fLZ3QJFHXEAIhl2pejQ7grUXwj
	GpxN8nSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjINB-00000009lEO-0F5M;
	Mon, 13 Jul 2026 15:15:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjINA-00000009lDz-0ewm
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 15:15:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=P15DWYQO7QDzTQoPbuyf65oQTF47QNr5bOsQquOeepQ=; b=DOHtZXW5djfjund5U0EHuhznSD
	wG6FZy6ojvS6Fh054kgosrs+GasbmEZGuMvmm5I+IwJCdemr1se1AHUC/E15WBtww0v4zSxgL6eJX
	D3LcZf5iZrbYJr/ThfnQGqDKxaNW6odGHpc0WD1Spv0JiCvBaTOTvtZII7ybjF0Y6b6lU4vzJPjFI
	dz/KNCDndRMnCBm6rJClUBHmzJ3LU7F6k02CPSbQKof9HBGKTyvtopUJYq5vYzuwUdEG4UhIqVERl
	b34CNVxUjxJ6cAJHELduQ7/o3J7J82focQWciZJ8eTCe5/TkZVo+WUWMkUxJtOu8KGtBR+9e0G7Q4
	Gs2mvfyQ==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjIN6-0000000BldO-47rc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:15:07 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-470174001a0so1980552f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 08:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783955702; x=1784560502; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P15DWYQO7QDzTQoPbuyf65oQTF47QNr5bOsQquOeepQ=;
        b=tavTbEqG8kJTVguS/e4tOkgNRI0PL9ZIR+nBO0CaQ8SxcmlAzb7u6oh8HclVuvNE4b
         zb3mrJmiejWzJ1ouV33svWXBwz4DKuwLRnYDhCJ7dO5bDDl3kYIx30uKLca9HMJti116
         /+QHlS4TJlDAwpKvaD5+j64YNnTYv4uePB2CCNIborrjqQV3fhJuLI8Y6cop1oRJsu2O
         DzmKV6eVp2wfMArbSS7JboWh94+CXX5VfFyV+kmDcV+GACHLN3baE4Aq/pMlbt8tsnHH
         95fFtP9ntih2WbNJ3oQVBSpKE34iMlOT7R/qUMgN1gnuyyisk78gE7ZLNv8+R7MlCADm
         +MwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955702; x=1784560502;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P15DWYQO7QDzTQoPbuyf65oQTF47QNr5bOsQquOeepQ=;
        b=SioIIr2RQUAFC5jbqHltR8shGTphF/U6CDp/mTH1NVusa3u0ECdw3C96ifbBvryRls
         IpjGZrKmjjdU91CUS1XA+GD6DUDdaiFvoHHA6tKF5hKDFEksGO+7d0qnElH9G4AJfK3E
         6jQBWtVihoROfbhEDq7FcZfIKXpOl7w5hkpzhW4Yr1NQ6NogYUnWu4OGHKcCNyrx1WgV
         SONFXZNcS7Les1ta7qwfLlXcWwCX6PAPIuKcZIDjzNID1sSa311A5YlisB4iVtKfL1Oz
         gvM7x7p2OJCyMe8Ydifxp16lwXSOzaCFNh6z63StBmt7lV6fQ059zjWoJCUXEPMjP+9j
         gfVQ==
X-Gm-Message-State: AOJu0Yyizel/qk0BlNYA1ErkVC2A2UEPwui5v6ov4ljFdT9QeYI+sr6A
	B2C3LJwh6ci4siuWErNZ9ZgJddEHsjhUXZv4E4vniMnyb43o/HNz8iE2l+daKpPVug==
X-Gm-Gg: AfdE7cnwIymWYYkWNABk/xyLu1n01it9Ptc8lW3dKazhSEUxGPwviULQxdZOJ5Zi7LL
	jIp/7ob1YzYVrYuKtVlQmpz9m1cYjP9Btp44DnM+0j9mfYdTy9NNYIMgn6Oh2qL9h8S22syEh/L
	DMEy5E/3jWojzA9iQC3vWFVbd6epjj1OUYJtOPVbZJJE5bPvYf8Ojuo9VOJd8dGRTWYTaD/CGSJ
	/Q6wlwCXTxkzhkxXWAncy7FUlld0NItcWi83BjwIf7m6cqoXX1BXV8txtFKkMAx7Vp1zTApLhnw
	0LPALo2UYzKQD0ERumkObnYtCUgakzCEyILYIdKk0qIxN9K2dfyL3NYWpYDByRx1klPfeZH7um1
	WSCeC0guDioRHj4jQxW3qwLkHDgvIXAR8TqsM8U7xrVB/IkC2a01a8vN38PXrqqKBFmoZMwF6A9
	vYuxsGe7GCi/6MB6MuG4fFzjgQDuU6idFc40Wzr/RgJ/yFFryXURc=
X-Received: by 2002:a5d:5f88:0:b0:47d:d812:e03b with SMTP id ffacd0b85a97d-47f2dce302amr10841669f8f.43.1783955701310;
        Mon, 13 Jul 2026 08:15:01 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a9cesm64944f8f.14.2026.07.13.08.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:14:59 -0700 (PDT)
Date: Mon, 13 Jul 2026 16:14:55 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 08/25] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <alUA7zsJO1FGnss-@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-9-smostafa@google.com>
 <alTnAy7jvjUamwUA@google.com>
 <alTvf7iiOWn4PKE8@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alTvf7iiOWn4PKE8@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_161505_222137_6B3A83DD 
X-CRM114-Status: GOOD (  50.71  )
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

On Mon, Jul 13, 2026 at 02:00:31PM +0000, Mostafa Saleh wrote:
> On Mon, Jul 13, 2026 at 02:24:19PM +0100, Vincent Donnefort wrote:
> > On Fri, May 01, 2026 at 11:19:10AM +0000, Mostafa Saleh wrote:
> > > Create a page-table for the IOMMU that shadows the host CPU stage-2
> > > to establish DMA isolation.
> > > 
> > > An initial snapshot is created after the driver init, then
> > > on every permission change a callback would be called for
> > > the IOMMU driver to update the page table.
> > > 
> 
> [...]
> 
> > > +	 */
> > > +	if (pte && !kvm_pte_valid(pte))
> > > +		return 0;
> > > +
> > > +	if (kvm_pte_valid(pte)) {
> > > +		prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte));
> > > +		/* If the range is mapped in a single PTE, it must be the same type.*/
> > > +		if (!addr_is_memory(start))
> > > +			prot |= IOMMU_MMIO;
> > > +
> > > +		return kvm_iommu_ops->host_stage2_idmap(start, end, prot);
> > 
> > Do we really need to do that when is_memory()? 
> > 
> > fix_host_ownership_walker() by calling host_stage2_idmap_locked() and
> > host_stage2_set_owner_locked() should already handle the memory region. That
> > would also get rid of kvm_idmap_initialized.
> > 
> > So this one here could only take care of the MMIO?
> > 
> > Overall we would have a common point of synchro which is
> > fix_host_ownership_walker() after which the host ownership is ready for both
> > CPU stage-2 and the IOMMU?
> > 
> 
> I am not sure I understand, this is another empty page table, so we
> have to walk all of the host CPU stage-2 page table to shadow it in the
> IOMMU. if you are refering to the case where it handle zero ptes for
> memory, I can drop that but it will not change much in this logic.

In fixup_host_ownership() we already walk the hyp pgtable to know what needs to be
map/unmapped from the host stage-2. Can't we rely on that for the IOMMU
page-table as well?

As of, fix_host_ownership() could handle the host stage-2 __and__ the iommu? 

> 
> > > +	}
> > > +
> > > +	/* In case of invalid PTE, we need to figure out which part of it is MMIO */
> 
> [...]
> 
> > >  #include <nvhe/mm.h>
> > > @@ -481,6 +482,14 @@ static int check_range_allowed_memory(u64 start, u64 end)
> > >  	return 0;
> > >  }
> > >  
> > > +u64 find_mem_range_from(u64 start, bool *is_memory)
> > > +{
> > > +	struct kvm_mem_range r;
> > > +
> > > +	*is_memory = !!find_mem_range(start, &r);
> > > +	return r.end;
> > > +}
> > > +
> > >  static bool range_is_memory(u64 start, u64 end)
> > >  {
> > >  	struct kvm_mem_range r;
> > > @@ -577,8 +586,34 @@ int host_stage2_idmap_locked(phys_addr_t addr, u64 size,
> > >  
> > >  static void __host_update_page_state(phys_addr_t addr, u64 size, enum pkvm_page_state state)
> > 
> > I would really split this. I know that this is convinient, but as the function
> > says, it only update the page state so it shouldn't hide an update to the IOMMU.
> 
> I mention a couple of alternatives in the commit message, I tried to
> implement it differently which was harder to reason about as the calls
> was scattered everywhere and any small refactor will possibly break it.
> 
> Did you have a split in my mind? I open to rework it.

Yes, I meant the option #2.

> 
> > 
> > Beside, we have examples already in Android where we want to update the
> > page-state but not the IOMMU, so it doesn't feel future-proof...
> > 
> > >  {
> > > +	enum pkvm_page_state old = get_host_state(hyp_phys_to_page(addr));
> > > +	enum kvm_pgtable_prot prot = 0;
> > > +
> > >  	for_each_hyp_page(page, addr, size)
> > >  		set_host_state(page, state);
> > > +
> > > +	/*
> > > +	 * Any transition to PKVM_NOPAGE, unmaps the page from the host
> > > +	 * Any transition to PKVM_PAGE_SHARED_BORROWED, maps the page in the host
> > > +	 * Any transition to PKVM_PAGE_SHARED_OWNED is ignored as page is already mapped.
> > > +	 * Transitions to PKVM_PAGE_OWNED from anything but PKVM_NOPAGE are ignored.
> > > +	 * Transitions to PKVM_PAGE_OWNED from PKVM_NOPAGE will map the page.
> > > +	 */
> > > +	if ((state == PKVM_PAGE_SHARED_OWNED) ||
> > > +		((state == PKVM_PAGE_OWNED) && (old != PKVM_NOPAGE)))
> > > +		return;
> > > +
> > > +	if ((state == PKVM_PAGE_SHARED_BORROWED) ||
> > > +		(state == PKVM_PAGE_OWNED))
> > > +		prot = PKVM_HOST_MEM_PROT;
> > 
> > ... and that would avoid that sort of things here. The caller decides if the IOMMU
> > is updated or not.
> 
> Typically, the IOMMU is updated if the CPU is.
> 
> > 
> > And as the patch says, we "shadow" the host stage2. So probably modifying
> > host_stage2_idmap and host_stage2_set_owner_metdata() sounds really a better
> > approach.
> 
> Initially, before the pKVM merge upstream I was doing something similar
> as that only required one hook [1]. However, after rebasing I found that
> would be too complicated and I have to add many more (as mentioned in
> the commit message). But I can re-visit this approach in v7.

What bit would be more complicated? As you've wrote in the commit message, in
option#2 you only need two calls really:

  * host_stage2_set_owner_locked()
  * host_stage2_set_owner_metadata_locked().

This fits better the narative for the "shadow" page-table: when we map the host
stage-2, we map the iommu and when we unmap the host stage-2, we unmap the
iommu.

> 
> [1] https://lore.kernel.org/all/20250819215156.2494305-11-smostafa@google.com/
> 
> Thanks,
> Mostafa
> 

