Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D80E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 15:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdjKxo+NrUniCbPIw5SczIYsjDTY5YJeEg6pDWYTro4=; b=NVuc98W4ynGZreEEvaLyyY11tr
	ct9WBOfmb4xFUKhO1kYO6oQwiFYkEPASxxAlZZhaRrLHms44eD12zFZloIGDSEwfeGqmADrw50iFh
	Q2FbaPq8yUJhnRLX1ixw3QCn0FELyt5VQhO8WBPYnxBNKfiqtzcW90yNAq7quSooqbzNOLucu4Kfm
	dbFLO6AXeszD+NsXb2GqvwRstYn3tao4uP+FEWZrRSBRuPvXwWxPlv59DVg7bxUYQpJLnFTa6cRCd
	DMqCSpcrDbL6AuEX0Oo8t6OB8L6tbXy4fJHpcThaEIZ86cMmLtApomwt+b+XVoDdW9KOAetYE0ciN
	mdEgHbRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2Cb-0000000BxFA-053J;
	Tue, 10 Dec 2024 15:31:09 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2BT-0000000Bx0i-3DvF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 15:30:01 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5cf6f367f97so8366472a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 07:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733844598; x=1734449398; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RdjKxo+NrUniCbPIw5SczIYsjDTY5YJeEg6pDWYTro4=;
        b=IW53Sf1g8srP4J1i+F2GVAq9TZ78j/rH9vViqJzOqTAFnmEzPyhFXG2Mam2njf9MqV
         h4rk+Iulkbcfr00TJc3kBycD9YdE8aKe3DtZf84qAx2ENO+qy8cqfCDdzRHu5eiUl8Ya
         dquzAdK9D9GTDXYGh4wFJKfnRVV1I/zmVyixMFzmdRz456hgY01HLlcSc3UL3F89PjND
         4hlAAKXuJ4F82lJ2G6QW4r/9XhYnc62V29pWfW0d8GM6ZylCzNeUI8ofzn3juHm5oofq
         6rQcDw5xr90hEFfPQufrfHoUazczgCUhST7NVd7tpaU0giSI/SdGwHvKr+AlLQ4fTLKD
         0Jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733844598; x=1734449398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdjKxo+NrUniCbPIw5SczIYsjDTY5YJeEg6pDWYTro4=;
        b=EWzJy9ELEcm6kEeAReG3BBhxpkTwKlrEPcaE0ICl+qNlnTM28ic3HM5f82TyDG+sas
         AeBN20fHHNQHxggtRrIEncPgaleaysriboWCacGoGrws1zW2Bc1GLNwmKaVMSpbrqcoK
         H7NP6GI/FsNahJQmXVbnUIjvpdjkUTfRL+8+AA2U8HtzmUWFUayalfRaAFSXXkeaqC/7
         cI6NvIhAc01GSAKyNLtxAi6wqLoEtrrfTc3sjlX55uvFlnDF/gdAi0XJj1Tl/49XSRWA
         mwaEWoW5WmHjYCzBET9zeAzSkLWxbIbvlfDY8isJVPNfK4jqv9vG02EVCWHB1A5Jyb3n
         JBfg==
X-Forwarded-Encrypted: i=1; AJvYcCUgF/2cO4CChACpqL4lJ5FD57g6Jzy71WFz/zykP1uBooVpp+iiHN6gCa6ffRKpOmNltKbnWcXkzo0QaCxnwhTI@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmi5xiFbQYxBEvpCO5PApL3X6ABESFn+YtJeDJ/1XZoWyo7yWa
	UKWxqTW64z0LHfQWtCm/YzQqKetcpcXZTNi6h3C1A/PRCvObhkiSwZgdr7HmOw==
X-Gm-Gg: ASbGnctBQdQFT67n6p1OlbFnBdcwqEInZSNRqbdwRSuYp3y6TLJACpIJz/x7pUZgspI
	JbxEcSjaWfJRaukyAyvDgNNOk2kmTJWj9fwhZAFWSzUcrshy1onPxX0kzHrP+rq7Jn48MXHxR7p
	gXUag9m2DpwYioxptVL8o+aCTKjv5joz2GRgMolc4eQa+pU2kq7dSgKGSdu38rukzBDj8hDNFFC
	mKXsfcTKeRqmdUSFrb4v9VRqxP/ab2MezpTb1IiEmiLAVUcXe47RMwS6RNTKMre26tdEvi4axKb
	emaPT+IRK8Na
X-Google-Smtp-Source: AGHT+IGg6WnoskYZdn9xOLfCiAAV+gyaqLcb0WFqoPlhvQYJd6IR9c361Akqel8PHMAiNRU5MHkhRA==
X-Received: by 2002:a05:6402:1e90:b0:5d0:d610:caa2 with SMTP id 4fb4d7f45d1cf-5d4185fe2aamr5885624a12.26.1733844597597;
        Tue, 10 Dec 2024 07:29:57 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3d76f3892sm5560295a12.28.2024.12.10.07.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 07:29:57 -0800 (PST)
Date: Tue, 10 Dec 2024 15:29:54 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/18] KVM: arm64: Move host page ownership tracking
 to the hyp vmemmap
Message-ID: <Z1heckLsqrCBF6Nw@google.com>
References: <20241203103735.2267589-1-qperret@google.com>
 <20241203103735.2267589-5-qperret@google.com>
 <CA+EHjTx13V1BcyWEAjNSC0JCxr+dSUvutC7z2KSRu_8jwV_Vxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTx13V1BcyWEAjNSC0JCxr+dSUvutC7z2KSRu_8jwV_Vxw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_072959_820703_866D6417 
X-CRM114-Status: GOOD (  51.87  )
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

Hey Fuad,

On Tuesday 10 Dec 2024 at 13:02:45 (+0000), Fuad Tabba wrote:
> Hi Quentin,
> 
> On Tue, 3 Dec 2024 at 10:37, Quentin Perret <qperret@google.com> wrote:
> >
> > We currently store part of the page-tracking state in PTE software bits
> > for the host, guests and the hypervisor. This is sub-optimal when e.g.
> > sharing pages as this forces to break block mappings purely to support
> > this software tracking. This causes an unnecessarily fragmented stage-2
> > page-table for the host in particular when it shares pages with Secure,
> > which can lead to measurable regressions. Moreover, having this state
> > stored in the page-table forces us to do multiple costly walks on the
> > page transition path, hence causing overhead.
> >
> > In order to work around these problems, move the host-side page-tracking
> > logic from SW bits in its stage-2 PTEs to the hypervisor's vmemmap.
> >
> > Signed-off-by: Quentin Perret <qperret@google.com>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/memory.h |  6 +-
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c    | 94 ++++++++++++++++--------
> >  arch/arm64/kvm/hyp/nvhe/setup.c          |  7 +-
> >  3 files changed, 71 insertions(+), 36 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > index 88cb8ff9e769..08f3a0416d4c 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > @@ -8,7 +8,7 @@
> >  #include <linux/types.h>
> >
> >  /*
> > - * SW bits 0-1 are reserved to track the memory ownership state of each page:
> > + * Bits 0-1 are reserved to track the memory ownership state of each page:
> >   *   00: The page is owned exclusively by the page-table owner.
> >   *   01: The page is owned by the page-table owner, but is shared
> >   *       with another entity.
> 
> Not shown in this patch, but a couple of lines below, you might want
> to update the comment on PKVM_NOPAGE to fix the reference to "PTE's SW
> bits":

I actually think the comment is still correct -- PKVM_NOPAGE never goes
in the software bits, with or without this patch, so I figured we could
leave it as-is. But happy to reword if you have a good idea :)

> > /* Meta-states which aren't encoded directly in the PTE's SW bits */
> > PKVM_NOPAGE = BIT(2),
> 
> > @@ -44,7 +44,9 @@ static inline enum pkvm_page_state pkvm_getstate(enum kvm_pgtable_prot prot)
> >  struct hyp_page {
> >         u16 refcount;
> >         u8 order;
> > -       u8 reserved;
> > +
> > +       /* Host (non-meta) state. Guarded by the host stage-2 lock. */
> > +       enum pkvm_page_state host_state : 8;
> >  };
> >
> >  extern u64 __hyp_vmemmap;
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index caba3e4bd09e..1595081c4f6b 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -201,8 +201,8 @@ static void *guest_s2_zalloc_page(void *mc)
> >
> >         memset(addr, 0, PAGE_SIZE);
> >         p = hyp_virt_to_page(addr);
> > -       memset(p, 0, sizeof(*p));
> >         p->refcount = 1;
> > +       p->order = 0;
> >
> >         return addr;
> >  }
> > @@ -268,6 +268,7 @@ int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd)
> >
> >  void reclaim_guest_pages(struct pkvm_hyp_vm *vm, struct kvm_hyp_memcache *mc)
> >  {
> > +       struct hyp_page *page;
> >         void *addr;
> >
> >         /* Dump all pgtable pages in the hyp_pool */
> > @@ -279,7 +280,9 @@ void reclaim_guest_pages(struct pkvm_hyp_vm *vm, struct kvm_hyp_memcache *mc)
> >         /* Drain the hyp_pool into the memcache */
> >         addr = hyp_alloc_pages(&vm->pool, 0);
> >         while (addr) {
> > -               memset(hyp_virt_to_page(addr), 0, sizeof(struct hyp_page));
> > +               page = hyp_virt_to_page(addr);
> > +               page->refcount = 0;
> > +               page->order = 0;
> >                 push_hyp_memcache(mc, addr, hyp_virt_to_phys);
> >                 WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn(addr), 1));
> >                 addr = hyp_alloc_pages(&vm->pool, 0);
> > @@ -382,19 +385,25 @@ bool addr_is_memory(phys_addr_t phys)
> >         return !!find_mem_range(phys, &range);
> >  }
> >
> > -static bool addr_is_allowed_memory(phys_addr_t phys)
> > +static bool is_in_mem_range(u64 addr, struct kvm_mem_range *range)
> > +{
> > +       return range->start <= addr && addr < range->end;
> > +}
> > +
> > +static int range_is_allowed_memory(u64 start, u64 end)
> 
> The name of this function "range_*is*_..." implies that it returns a
> boolean, which other functions in this file (and patch) with similar
> names do, but it returns an error instead. Maybe
> check_range_allowed_memory)?

Ack, I'll rename in v3.

> >  {
> >         struct memblock_region *reg;
> >         struct kvm_mem_range range;
> >
> > -       reg = find_mem_range(phys, &range);
> > +       /* Can't check the state of both MMIO and memory regions at once */
> 
> I don't understand this comment in relation to the code. Could you
> explain it to me please?

find_mem_range() will iterate the list of memblocks to find the 'range'
in which @start falls. That might either be in a memblock (so @addr is
memory, and @reg != NULL) or outside of one (so @addr is mmio, and
@reg == NULL). The check right after ensures that @end is in the same
PA range as @start. IOW, this checks that [start, end[ doesn't overlap
memory and MMIO, because the following logic wouldn't work for a mixed
case like that.

> > +       reg = find_mem_range(start, &range);
> > +       if (!is_in_mem_range(end - 1, &range))
> > +               return -EINVAL;
> >
> > -       return reg && !(reg->flags & MEMBLOCK_NOMAP);
> > -}
> > +       if (!reg || reg->flags & MEMBLOCK_NOMAP)
> > +               return -EPERM;
> >
> > -static bool is_in_mem_range(u64 addr, struct kvm_mem_range *range)
> > -{
> > -       return range->start <= addr && addr < range->end;
> > +       return 0;
> >  }
> >
> >  static bool range_is_memory(u64 start, u64 end)
> > @@ -454,8 +463,11 @@ static int host_stage2_adjust_range(u64 addr, struct kvm_mem_range *range)
> >         if (kvm_pte_valid(pte))
> >                 return -EAGAIN;
> >
> > -       if (pte)
> > +       if (pte) {
> > +               WARN_ON(addr_is_memory(addr) &&
> > +                       !(hyp_phys_to_page(addr)->host_state & PKVM_NOPAGE));
> 
> nit: since the host state is now an enum, should this just be an
> equality check rather than an &? This makes it consistent with other
> checks of pkvm_page_state in this patch too.

We don't currently have a state that is additive to PKVM_NOPAGE, so no
objection from me.

> >                 return -EPERM;
> > +       }
> >
> >         do {
> >                 u64 granule = kvm_granule_size(level);
> > @@ -477,10 +489,29 @@ int host_stage2_idmap_locked(phys_addr_t addr, u64 size,
> >         return host_stage2_try(__host_stage2_idmap, addr, addr + size, prot);
> >  }
> >
> > +static void __host_update_page_state(phys_addr_t addr, u64 size, enum pkvm_page_state state)
> > +{
> > +       phys_addr_t end = addr + size;
> 
> nit: newline
> 
> > +       for (; addr < end; addr += PAGE_SIZE)
> > +               hyp_phys_to_page(addr)->host_state = state;
> > +}
> > +
> >  int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
> >  {
> > -       return host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt,
> > -                              addr, size, &host_s2_pool, owner_id);
> > +       int ret;
> > +
> > +       ret = host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt,
> > +                             addr, size, &host_s2_pool, owner_id);
> > +       if (ret || !addr_is_memory(addr))
> > +               return ret;
> 
> Can hyp set an owner for an address that isn't memory? Trying to
> understand why we need to update the host stage2 pagetable but not the
> hypervisor's vmemmap in that case.

I think the answer is not currently, but we will when we'll have to e.g.
donate IOMMU registers to EL2 and things of that nature. Note that this
does require an extension to __host_check_page_state_range() to go query
the page-table 'the old way' for MMIO addresses, though that isn't done
in this series. If you think strongly that this is confusing, I'm happy
to drop that check and we'll add it back with the IOMMU series or
something like that.

> > +
> > +       /* Don't forget to update the vmemmap tracking for the host */
> > +       if (owner_id == PKVM_ID_HOST)
> > +               __host_update_page_state(addr, size, PKVM_PAGE_OWNED);
> > +       else
> > +               __host_update_page_state(addr, size, PKVM_NOPAGE);
> > +
> > +       return 0;
> >  }
> >
> >  static bool host_stage2_force_pte_cb(u64 addr, u64 end, enum kvm_pgtable_prot prot)
> > @@ -604,35 +635,38 @@ static int check_page_state_range(struct kvm_pgtable *pgt, u64 addr, u64 size,
> >         return kvm_pgtable_walk(pgt, addr, size, &walker);
> >  }
> >
> > -static enum pkvm_page_state host_get_page_state(kvm_pte_t pte, u64 addr)
> > -{
> > -       if (!addr_is_allowed_memory(addr))
> > -               return PKVM_NOPAGE;
> > -
> > -       if (!kvm_pte_valid(pte) && pte)
> > -               return PKVM_NOPAGE;
> > -
> > -       return pkvm_getstate(kvm_pgtable_stage2_pte_prot(pte));
> > -}
> > -
> >  static int __host_check_page_state_range(u64 addr, u64 size,
> >                                          enum pkvm_page_state state)
> >  {
> > -       struct check_walk_data d = {
> > -               .desired        = state,
> > -               .get_page_state = host_get_page_state,
> > -       };
> > +       u64 end = addr + size;
> > +       int ret;
> > +
> > +       ret = range_is_allowed_memory(addr, end);
> > +       if (ret)
> > +               return ret;
> >
> >         hyp_assert_lock_held(&host_mmu.lock);
> > -       return check_page_state_range(&host_mmu.pgt, addr, size, &d);
> > +       for (; addr < end; addr += PAGE_SIZE) {
> > +               if (hyp_phys_to_page(addr)->host_state != state)
> > +                       return -EPERM;
> > +       }
> > +
> > +       return 0;
> >  }
> >
> >  static int __host_set_page_state_range(u64 addr, u64 size,
> >                                        enum pkvm_page_state state)
> >  {
> > -       enum kvm_pgtable_prot prot = pkvm_mkstate(PKVM_HOST_MEM_PROT, state);
> > +       if (hyp_phys_to_page(addr)->host_state & PKVM_NOPAGE) {
> 
> Same nit as above regarding checking for PKVM_NOPAGE
> 
> Cheers,
> /fuad
> 
> 
> > +               int ret = host_stage2_idmap_locked(addr, size, PKVM_HOST_MEM_PROT);
> >
> > -       return host_stage2_idmap_locked(addr, size, prot);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> > +       __host_update_page_state(addr, size, state);
> > +
> > +       return 0;
> >  }
> >
> >  static int host_request_owned_transition(u64 *completer_addr,
> > diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> > index cbdd18cd3f98..7e04d1c2a03d 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> > @@ -180,7 +180,6 @@ static void hpool_put_page(void *addr)
> >  static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
> >                                      enum kvm_pgtable_walk_flags visit)
> >  {
> > -       enum kvm_pgtable_prot prot;
> >         enum pkvm_page_state state;
> >         phys_addr_t phys;
> >
> > @@ -203,16 +202,16 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
> >         case PKVM_PAGE_OWNED:
> >                 return host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HYP);
> >         case PKVM_PAGE_SHARED_OWNED:
> > -               prot = pkvm_mkstate(PKVM_HOST_MEM_PROT, PKVM_PAGE_SHARED_BORROWED);
> > +               hyp_phys_to_page(phys)->host_state = PKVM_PAGE_SHARED_BORROWED;
> >                 break;
> >         case PKVM_PAGE_SHARED_BORROWED:
> > -               prot = pkvm_mkstate(PKVM_HOST_MEM_PROT, PKVM_PAGE_SHARED_OWNED);
> > +               hyp_phys_to_page(phys)->host_state = PKVM_PAGE_SHARED_OWNED;
> >                 break;
> >         default:
> >                 return -EINVAL;
> >         }
> >
> > -       return host_stage2_idmap_locked(phys, PAGE_SIZE, prot);
> > +       return 0;
> >  }
> >
> >  static int fix_hyp_pgtable_refcnt_walker(const struct kvm_pgtable_visit_ctx *ctx,
> > --
> > 2.47.0.338.g60cca15819-goog
> >

