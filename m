Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91802C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfXrXQw1fobjJb9xBIDk+12kYWCVjSmiwbD+2PDbQ3Q=; b=yODt9IrpkQg/lJ4OmQdaxc5Wl0
	bSKuKWrcMortz+4L+6it1TkXz9th6f/WZfds8Ex1ATXU+fNTXnR48/nvRDX8SJGYNRyNCcPUkHDxe
	SiXESAodGxLpBKgOGh1Da7LusjNbM4drQKx7Dc4bsLW3IrbBV2SLsJmTbTnAK/82SxSIL+f8NlIYS
	MmPOJgy40a/PXl9YM8gbFzeINb2VNZJ0FOYOrg3oJCYIgDNYr36Dj2pHkKDGwCjBOKDJFEuXdzrZo
	8AFXP9gc2X6yiehWWWO/m2uBRF6AdtrDbdpOt4pMOzsE1b84CuFrVGxAXfGPpii8rXFjpPIWTbex0
	h5Kk+XtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdZP-00000001YeN-1SLi;
	Fri, 17 Jul 2026 08:05:19 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdZM-00000001YdW-3DbP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:05:18 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7eb68bdf53aso3022677a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 01:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784275516; cv=none;
        d=google.com; s=arc-20260327;
        b=lXReisJiyx0fvXsD++l7y+tZhPuyPnD4Ghf9x3RmKysxdVby0qXGZ3I5scW/cJ5ciD
         NjBrL/MEOtoTLlpErgCE3LJFRJeuVCk3y4d0aS/UQ5tpwmyFIB82bCdLQu4qkKDkl64t
         R0t04AL6ESsXHj7VNPy8RjaWveORtziRgl7Vwc7qlSQ3leKQpmCVv33Gv0Q7c+nQtzNC
         7JBNkKqtxuwmlbxSZDYihCz4ifYmNLZv3gYWQUjz7GslQxnVFO1CuAD90pPuI+2KeDxq
         4nHq0HAXLaVay70oJ+VkpXYICT4kuYaRy09frX/p379RTla7balOGnwk0IAb1nz7HJW6
         lo6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NfXrXQw1fobjJb9xBIDk+12kYWCVjSmiwbD+2PDbQ3Q=;
        fh=IoZlKy+gll6lvDMz8i0JCqQZNpup3IlwBaBkQdRIQzQ=;
        b=gRELMNYTPSvH0D9Zw+HcHNh5RZQ9A/hApOZIwRl5z72iKeVnzaCVEs4BJS11MaL/XT
         qkMj0qzE7fveGPGUMpdLfuQiTTK35Vh1NoIMYlwSGu2L4C3109vzO0ibqY1EMVgiaS6g
         1gA44z8gNVYxXZ6SUhYBamWhnAYIcHBKEa6k/4HWTyt7Gga0LDS8NY5rj/jZA6tyJ8/9
         szZ+q4yKlioaG7bUW6qyrYIbzeXpjcNbPLlpVPrbIWRsj2b/pkpQW0H2lb5Vo0K3rkOF
         6k+uJLHwRvcwPxciy9RivBYEzo5kvBJjOMJ7B+qNrI6Rb0TGrCppdJkZRMjny5cC2DVv
         bBdw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784275516; x=1784880316; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NfXrXQw1fobjJb9xBIDk+12kYWCVjSmiwbD+2PDbQ3Q=;
        b=VdbbmzjWTdi2u4vF2Sj6yi/eL7z3vLXLRN5Hx6RzJpjC7WCr/KztsfjaDV2nCTnaSE
         CifcrIfKKRwYNoV/2B/K1tE9+ey+Lhq7unsJmixnRk4GKyQc1lgAhkJ+hxpyYhBUSwqk
         p9Zl5xPrC7IXDmwJktoTZ3v7MSPAMQNwLorHNpMLAODJh6k8zlQxk3oVBgWD/KbLD75J
         S/rRRaAc4s1fPk2bqA2xEiRni3YHdAef7pRocjmD/AKIfmIR3KMfiivZV0msdAY5Mq1L
         Ac/AZ1BgeKCtTyjOyDFy4+zH0eWeJg/Wy+jC51Tq4w0CakkHdDEFyPq+5BkT5Q9ViU4M
         EGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784275516; x=1784880316;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NfXrXQw1fobjJb9xBIDk+12kYWCVjSmiwbD+2PDbQ3Q=;
        b=Nre51V5/AbCMJ33kwXDVi8DtcCXVHEoxr3bjRnRASdp0gsyKu02BioSbyCRBqRzucj
         lOnGzvOQ8kRAqhHovaY46I7XGyo8iMRUAFyIu36Hwlvtui+681xC6hg1FNUpoAF3O+6i
         qMycimHjHbZiUQRTHSx0Qx5b2MKKms4vanJqSByZmsxcXNVwtw10JNFWQOmsDRzWnlZe
         rUtqZ8uSpg0C8hfFioETi/GVIe7nFazy64S5+rzeWMZ9hBdjUcMRLhRxeG81Q2lYMIAa
         qIp73h2RGLg6pH2LSOoAd79H2/GUlRx04iMQR9PzwKGYZUty7OPWvski+Xy+kg3AnQrb
         aBYg==
X-Forwarded-Encrypted: i=1; AHgh+RrucW/A+LmmAjGZuG6XosPJGuZkotdiZGbvhHM4tl4+qUAoWCF1x1i0WnloJs1Hbk9C5xkfgZYhmVv761mNs1YU@lists.infradead.org
X-Gm-Message-State: AOJu0YzIqinUHamkJlK8L4PwR7SnVP7KYAhW0mApc984dJM88RKSG9yG
	cQ8/0v/6+Austku35trUmHqYZv/fbSjgckf+gJYJGyzbH9f8wjchaL/qIdQp33OvAEGBYYlL3gq
	TQvFoLKBzIwD70E0Q2oO4/S9k9HRr0lw=
X-Gm-Gg: AfdE7cmNtmZ+A6/hrtX+qxDyefZ/WJfRsFPQk1Knq72IpE9hFmQSv4UENzfY5GhHaYh
	zyIOONYrpba/peLGXBD/6Ia1lF75dzlrqq4oYRBYni3GjvwYowGAZYbcx9913SkllbDW2JhQs4i
	UymII75vFzrmoN40f5fndYL4iVIIUaLswWsG3zE4XAQQNNmwnDR7hE7dRIm8Y5wwmqaXjMq1Oof
	sPTGlwZMTdw4MdVL1Z0rGfo+Z9iwk7uh222C1eyonLmE5jRiwW6phR2dRC8ZdKpwku12meYAtoY
	j6DGJHGmpYA6dPjh
X-Received: by 2002:a05:6808:19a6:b0:496:2b3:4a85 with SMTP id
 5614622812f47-4a4d054c616mr657577b6e.22.1784275515528; Fri, 17 Jul 2026
 01:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260716-series-vmap-race-fix-v4-0-8c108c4317df@kernel.org>
 <20260716-series-vmap-race-fix-v4-2-8c108c4317df@kernel.org>
 <CA+XhMqzUO49FiC-Oa6VYUt7Wm9RZLH30DhUH2kVn_PBodyZ6dg@mail.gmail.com> <alnLFGkfJdWIV42P@lucifer>
In-Reply-To: <alnLFGkfJdWIV42P@lucifer>
From: David CARLIER <devnexen@gmail.com>
Date: Fri, 17 Jul 2026 09:05:04 +0100
X-Gm-Features: AUfX_my2AxRQQJXhZAU1yLMsSU3AGuvi1Pc5chSlMdx5pvK9SEJVQNRbJvskW6c
Message-ID: <CA+XhMqygWOnYuxR26x-cjwWQNXGxzh4Za9Fb1570LMKXWzpMyA@mail.gmail.com>
Subject: Re: [PATCH mm-hotfixes v4 2/4] x86/mm/pat: acquire init_mm write lock
 to avoid UAF
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Toshi Kani <toshi.kani@hpe.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"Denis V. Lunev" <den@virtuozzo.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_010516_854960_0FCD403D 
X-CRM114-Status: GOOD (  51.80  )
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

Yes I used AI to agglomerate my otherwise disparate thoughts :)

On Fri, 17 Jul 2026 at 08:47, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> On Fri, Jul 17, 2026 at 04:46:42AM +0100, David CARLIER wrote:
> > On Thu, 16 Jul 2026 at 22:31, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> > >
> > > x86 implements page attribute modification using its Change Page
> > > Attributes (CPA) mechanism.
> > >
> > > This tracks properties of ranges such as cache mode through x86 page
> > > attributes, and as part of that logic manipulates kernel page tables.
> > >
> > > Since commit 41d88484c71c ("x86/mm/pat: restore large ROX pages after
> > > fragmentation") ranges of kernel page table entries can be collapsed into
> > > huge page table entries as part of this logic.
> > >
> > > As part of this collapse, it frees the page tables which the collapsed
> > > entries previously pointed to, and it does so without any relevant locks
> > > being held to preclude concurrent kernel page table walkers.
> > >
> > > The only way this code can be reached is if CPA_COLLAPSE is specified, and
> > > this is only set in set_memory_rox() via:
> > >
> > > set_memory_rox()
> > > -> change_page_attr_set_clr()
> > > -> cpa_flush()
> > > -> cpa_collapse_large_pages()
> > >
> > > Notable users of this are execmem and bpf when manipulating executable
> > > mappings.
> > >
> > > However, this is problematic for ptdump as it walks ranges it does not own
> > > and thus runs the risk of a use-after-free on page tables freed underneath
> > > it.
> > >
> > > In addition, concurrent CPA collapse operations are possible which can also
> > > cause races.
> > >
> > > Resolve the issue by acquiring the mmap write lock on init_mm across the
> > > whole operation.
> > >
> > > It is safe to acquire a sleeping lock as all the callers invoke
> > > set_memory_rox() from process context and in any case,
> > > change_page_attr_set_clr() calls vm_unmap_alias() which ultimately takes a
> > > mutex, disallowing atomic context here.
> > >
> > > Fixes: 41d88484c71c ("x86/mm/pat: restore large ROX pages after fragmentation")
> > > Cc: stable@vger.kernel.org
> > > Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> > > Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> > > Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
> > > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > > ---
> > >  arch/x86/mm/pat/set_memory.c | 15 ++++++++++++++-
> > >  include/linux/mmap_lock.h    |  2 ++
> > >  2 files changed, 16 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> > > index d023a40a1e03..d1e63f7d267f 100644
> > > --- a/arch/x86/mm/pat/set_memory.c
> > > +++ b/arch/x86/mm/pat/set_memory.c
> > > @@ -22,6 +22,7 @@
> > >  #include <linux/cc_platform.h>
> > >  #include <linux/set_memory.h>
> > >  #include <linux/memregion.h>
> > > +#include <linux/cleanup.h>
> > >
> > >  #include <asm/e820/api.h>
> > >  #include <asm/processor.h>
> > > @@ -410,7 +411,7 @@ static void __cpa_flush_tlb(void *data)
> > >
> > >  static int collapse_large_pages(unsigned long addr, struct list_head *pgtables);
> > >
> > > -static void cpa_collapse_large_pages(struct cpa_data *cpa)
> > > +static void __cpa_collapse_large_pages(struct cpa_data *cpa)
> > >  {
> > >         unsigned long start, addr, end;
> > >         struct ptdesc *ptdesc, *tmp;
> > > @@ -442,6 +443,18 @@ static void cpa_collapse_large_pages(struct cpa_data *cpa)
> > >         }
> > >  }
> > >
> > > +static void cpa_collapse_large_pages(struct cpa_data *cpa)
> > > +{
> > > +       /*
> > > +        * Take the mmap write lock on init_mm to:
> > > +        * - Avoid a use-after-free if raced by ptdump (which takes its own
> > > +        *   write lock on init_mm).
> > > +        * - Serialise concurrent CPA walkers.
> > > +        */
> > > +       scoped_guard(mmap_write_lock, &init_mm)
> > > +               __cpa_collapse_large_pages(cpa);
> > > +}
> > > +
> > >  static void cpa_flush(struct cpa_data *cpa, int cache)
> > >  {
> > >         unsigned int i;
> > > diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> > > index 6b5c2390cc30..047f5f5e2c34 100644
> > > --- a/include/linux/mmap_lock.h
> > > +++ b/include/linux/mmap_lock.h
> > > @@ -621,6 +621,8 @@ static inline void mmap_read_unlock(struct mm_struct *mm)
> > >
> > >  DEFINE_GUARD(mmap_read_lock, struct mm_struct *,
> > >              mmap_read_lock(_T), mmap_read_unlock(_T))
> > > +DEFINE_GUARD(mmap_write_lock, struct mm_struct *,
> > > +            mmap_write_lock(_T), mmap_write_unlock(_T))
> > >  DEFINE_GUARD_COND(mmap_read_lock, _try, mmap_read_trylock(_T))
> > >
> > >  static inline void mmap_read_unlock_non_owner(struct mm_struct *mm)
> > >
> > > --
> > > 2.55.0
> > >
> >
> > Hi,
> >
> > This bullet confuses me. __change_page_attr() and friends are serialised by
>
> Which bullet? You're quoting the whole mail?
>
> Presumably "- Serialise concurrent CPA walkers".
>
> > cpa_lock/pgd_lock and never take init_mm's mmap lock, so this doesn't
> > exclude them.
> >
> > Collapse vs collapse looks covered already: collapse_large_pages() holds
>
> cpa_collapse_large_pages() has 3 stages:
>
> - walk + gather
> - flush tlb
> - free page tables
>
> Holding a lock then releasing it across stages doesn't serialise the whole
> operation.
>
> Thus concurrent collapse can occur.
>
> > pgd_lock across the walk and both collapse_pmd_page()/collapse_pud_page()
> > calls, and the pmd_leaf()/pud_leaf() early-outs stop a second CPU
> > re-queueing a collapsed table. I couldn't build the interleaving behind the
> > cover letter's "could result in memory corruption". Can you spell it out?
>
> "Build the interleaving" is an odd turn of phrase :)
>
> >
> > If the reason is really Will's v3 point - collapse rounds up to PMD/PUD and
> > frees tables outside its caller's range, so it has to exclude
> > walk_kernel_page_table_range() walkers holding the read lock - then say
> > that. It's a UAF independent of ptdump, and it's why v3's read lock wasn't
> > enough.
>
> "Then say that" could be rephrased into something a little more polite :)
>

Sorry I did not mean that tone originally

> >
> > Also: patch 1 justifies the trylock fallback on ptdump being rare, but this
> > takes the write lock on every set_memory_rox() (BPF JIT, module load,
> > execmem), even when nothing collapsed. vmap_try_huge_*() then loses the
>
> Locks work by excluding the critical section.
>
> > trylock and quietly falls back to PTEs on every BPF load. No counter, no
>
> Entirely false. You don't have concurrent writers on every load.
>
> > trace. Not a blocker and I've no better idea, but fa93b45fd397 was about
> > getting vmalloc-huge on by default, so it's worth calling out.
>
> I have no idea why you're referencing Dev's arm64 fix?
>
> Anyway as to the 'costly' stuff - you're doing costly operations on this code
> path anyway.
>
> BPF JIT, module load + execmem allocation are not hot path operations nor do
> they seem likely to be problematic in terms of lock contention.
>
> >
> > Rest looks right. 4/4 restores pud_free_pmd_page() exactly as it was before
> > fa93b45fd397, and 3/4 builds the same walk init_mm got via
> > walk_kernel_page_table_range_lockless().
>
> ??? I didn't change any of those in this revision? Let's keep review of a
> specific patch to review of a specific patch, please :)
>
> >
> > Reviewed-by: David Carlier <devnexen@gmail.com>
>
> Thanks.
>
> >
> > Cheers !
>
> This reply reads like it was... assisted shall we say. Let me gently push back
> on doing that please ;)
>
> I don't think there are actually any other readers that could be problematic
> here, so this a bit of a half-fix, really we need to do the same thing or take a
> read lock on the split path too.
>
> Let me think about it some more.
>
> Thanks, Lorenzo
>
> Assisted-by: Caffeine (Vimto energy with real fruit juice)

