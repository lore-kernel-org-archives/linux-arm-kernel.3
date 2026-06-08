Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C30CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 06:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwl6bxoedBil6zkKjzP3xhadcmpC2ohFviRs8deqyrM=; b=0MHxYyOssfdg2l0elRf+8xe+Gr
	PbGyMkGPTZ2KbYcWPEqMeKaYzOuo1xUQw/JKA7k28W650/OBniQR2d71gpFxFAQGmf+G5r4WZxTez
	GKQ/+6SMNDXXB651hHMkF9a8yziqRydLghw299CsTeDeoGnxOBUicn5YH4Q+th3uJ+I4tpoWElNCd
	cs65TGfFEdjjJJi6AWj+4h7AkxCZ5FGDfbkOyaq/KZCDXpr0+izPGN0zztiOSqvX71o1SsELb6wv2
	EzXvR9uyrDjt8hzgMfHmo4hBcSon3jfpZGqA1YHSp6v3OdeCAk3gWKnfRJAAAANTn5gpo7rpMzMsZ
	Go4QjUNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTQq-00000002tcC-0TaN;
	Mon, 08 Jun 2026 06:25:56 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTQn-00000002tbo-2oEF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 06:25:54 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-45ef616daf6so3478737f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 23:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780899951; cv=none;
        d=google.com; s=arc-20240605;
        b=QJoQSwp5+j90OC8sjSNsELbMdVo8ZjCdPEKQKTkxYa7Frhpk1/gBgn4+9QxfsPznbM
         hRkENqvh9LjrKBT0mpi5h8F0FQJXhpLVoI1T5kKf03Ni3MN5uTGOeG9TPwR0+EQT+YzF
         uaumqTUXVUPy+3cJ1VNnQXcaUb5IYTga5a5g9TfRoM9Jgc2gstSMBhyCRWALRxky44hU
         Gq6kE57M9t7dxloEQjKkVNb81NfoJF+Yj/+mLxOX3+DEJWjPT90JRq09jm4zqxIqJfxf
         VNeDiycDS2+6HDJtiapqKQ6ISxjwYPQNxzIGj3YueoHhN3tYAFthKGSxZ1me5jMKN+wU
         zThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gwl6bxoedBil6zkKjzP3xhadcmpC2ohFviRs8deqyrM=;
        fh=1Yzh/ci6Uozrgz4zld3jQ5PmtmjyxyJefzHhJR5v354=;
        b=iL+YqxI31YFKAOcO3fXbdXVrATc7nY3DH0ETGjtj94otThj37kjda/KQZu7Md9zry7
         Q5MYCspQsM/ElAkU0P8T7m8Md0iiZdTxYGITY5jJbEBBWZRweIGBth9M8mlkGumLwQ4L
         MMADGV+jBalI9GtBbDSG3ca6B8EGu0rqe/9Rcw9GAcj+yMlYkVVRaUNy8JbWq76CbZAG
         R789oiQwkfrbx9rPe+6kstOVcARJswtxuGym3AvOOWHpfZv6hVyt52/RuyQbhJLFGyc6
         2tLOEQCoQiKeZlcXQzMW874VUyR5Db0U6h04jcX2TGKWtQVwemMuYQxj58mM6pgmRO2q
         L0Wg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780899951; x=1781504751; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gwl6bxoedBil6zkKjzP3xhadcmpC2ohFviRs8deqyrM=;
        b=DaB/sWKzlFS/qfT0KB8i4L4zQh0Sk3m4kOjIVTwvJdAe0Xtw58tywY1BhY25PLR+SB
         rBzI8nGw/am57UPi86D/gJTAhgwyFQ7d7bsZtF5Se0s0TQaCDP7Qedfhj2lP/A+SkXte
         oekVtsBHHwCI8ckzAo3cGYI0X2DAGtJRrp4D/LUP5yhnLaHS4PWboSL9BFA9P6lrW27c
         QvU3nB13w5lAc4AW+FM8Id5DgqcYNMra5EIQkYfFdVOUWY1PbdOaXjdZZDFbbJe/zSGf
         JWOQ5Lau59YJ01Qr0nZ9oZ+kTv5DxgE7ONNWdJbYH9iVgKvHaY4pJDUMKtsaDs6qkoZo
         nK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780899951; x=1781504751;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwl6bxoedBil6zkKjzP3xhadcmpC2ohFviRs8deqyrM=;
        b=AN1DBaSnEGPIYN8t4JqNL1sZkUZEqNmejiOAnq9cmDfbveyj2vVjsXZuZF2OFLawif
         vKmW64ddoeVQtxcnqywMISYTy5DBhRxW7PUAifnZ5Al66PfPThKszaUpI49iZDt2Fm8+
         L9FYAujDga7pLSfabSixlzDIUbw0DMFW0+dG6m4n2N99Yj+0Wm5DfSSNDIJYjgqlDZRK
         M50ldnMxjAGhgon4Ln1vRwrDqvphCHBzCqvfx1BK4BfpWMsCpNq1UwNrYGn5H/x+aYS+
         RWUuwla/97Q+dSYOdbRSO/9+Ll7TXa7OikNyicY6bqAOGYPfjdPmwr9nqu4cV0fTZ8pR
         LN6w==
X-Forwarded-Encrypted: i=1; AFNElJ9Lmrh5O3+vWniBBtFYPVTsRiuDFe5+/cRtK3UYmHziQLdtb3WbwLVQ9stIfUWvHhaOLyocEfal4bWrS4Odm+55@lists.infradead.org
X-Gm-Message-State: AOJu0Yw90ymmRzix6UeU9fscySizSKcJEP2CBDJhXumAzeS+5rpyG0Z2
	f/E7J9mFzfL/hBfs5MKP3R8AqcoFKky7ItUHsKSLY9rf/2Fp+0BKEXuC9MPz4Ix0GlPX60cgIjQ
	z6DQO1Mg5yuyrEbE+0ery3ckyNgnNYC9ThQ==
X-Gm-Gg: Acq92OGyIVjeTHlMw8BM4jlwobTxK2IMVt/7SEGW5aRSzraLbVVupJb+XQy7yXIYwGx
	vQ2KIpzuyMXVjL8mTMdESfP+Rp5/0G3zp8efZe0K919blJtEBqNlm3udNht5NzD2s47nqm5HVwF
	Y6EeNHsZBo6+CMarC7MmOxJDV2JUfMCRqiZHX863LMzviMIy3Jgrn7FJsOwWOhGVz7M9bcARiX6
	scLC8njJLrnF3oEBWfJjYyvhWL3lsLSHnEf8+y1WGFs+oP1MMlOeeWB3oCqkjC3+Hw07zlja01n
	Gd90XfJtwphIsf/5yzA=
X-Received: by 2002:adf:eac3:0:b0:45e:ce28:666a with SMTP id
 ffacd0b85a97d-460302dcc75mr15718432f8f.1.1780899950996; Sun, 07 Jun 2026
 23:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
 <20260522053146.83209-5-jiangwenxiaomi@gmail.com> <46b0f2a7-3c0d-4372-a45d-946d8259d410@arm.com>
 <CAHKocdEfX3dgUr3O6q1WOe4PddN2=LKfX6Y5DfrfTwF9MM5J3w@mail.gmail.com> <53a51128-8ad5-4faa-9151-1245084bdd4c@arm.com>
In-Reply-To: <53a51128-8ad5-4faa-9151-1245084bdd4c@arm.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Mon, 8 Jun 2026 14:25:39 +0800
X-Gm-Features: AVVi8CdO-brXKZ74Vn--3CvlX_bimsMhmTttfAtKo0-xwHV3Y_noAP8U2d808V4
Message-ID: <CAHKocdHNAWzvYwu_mpekix+fH4ePn7ZMfmvxVsgb6VWYJAdZkg@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] mm/vmalloc: Extend page table walk to support
 larger page_shift sizes and eliminate page table rewalk
To: Dev Jain <dev.jain@arm.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	urezki@gmail.com, baohua@kernel.org, Xueyuan.chen21@gmail.com, 
	rppt@kernel.org, david@kernel.org, ryan.roberts@arm.com, 
	anshuman.khandual@arm.com, ajd@linux.ibm.com, linux-kernel@vger.kernel.org, 
	jiangwen6@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_232553_771004_6695D340 
X-CRM114-Status: GOOD (  39.47  )
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

On Fri, 5 Jun 2026 at 14:02, Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 28/05/26 9:09 am, Wen Jiang wrote:
> > On Wed, 27 May 2026 at 13:59, Dev Jain <dev.jain@arm.com> wrote:
> >>
> >>
> >>
> >> On 22/05/26 11:01 am, Wen Jiang wrote:
> >> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> >>
> >> vmap_pages_range_noflush_walk() (formerly vmap_small_pages_range_noflush())
> >> provides a clean interface by taking struct page **pages and mapping them
> >> via direct PTE iteration. This avoids the page table rewalk seen when
> >> using vmap_range_noflush() for page_shift values other than PAGE_SHIFT.
> >>
> >> Extend it to support larger page_shift values, and add PMD- and
> >> contiguous-PTE mappings as well. Rename it to vmap_pages_range_noflush_walk()
> >> since it now handles more than just small pages.
> >>
> >> For vmalloc() allocations with VM_ALLOW_HUGE_VMAP, we no longer need to
> >> iterate over pages one by one via vmap_range_noflush(), which would
> >> otherwise lead to page table rewalk. The code is now unified with the
> >> PAGE_SHIFT case by simply calling vmap_pages_range_noflush_walk().
> >>
> >> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> >> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> >> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> >> ---
> >>  mm/vmalloc.c | 71 +++++++++++++++++++++++++++++-----------------------
> >>  1 file changed, 40 insertions(+), 31 deletions(-)
> >>
> >> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> >> index 53fd4ee460ea4..deb764abc0571 100644
> >> --- a/mm/vmalloc.c
> >> +++ b/mm/vmalloc.c
> >> @@ -543,8 +543,10 @@ void vunmap_range(unsigned long addr, unsigned long end)
> >>
> >>  static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
> >>               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> >> -             pgtbl_mod_mask *mask)
> >> +             pgtbl_mod_mask *mask, unsigned int shift)
> >>  {
> >> +     unsigned long pfn, size;
> >> +     unsigned int steps;
> >>       int err = 0;
> >>       pte_t *pte;
> >>
> >> @@ -575,9 +577,10 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
> >>                       break;
> >>               }
> >>
> >> -             set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
> >> -             (*nr)++;
> >> -     } while (pte++, addr += PAGE_SIZE, addr != end);
> >> +             pfn = page_to_pfn(page);
> >> +             size = vmap_set_ptes(pte, addr, end, pfn, prot, shift);
> >> +             steps = PFN_DOWN(size);
> >> +     } while (pte += steps, *nr += steps, addr += size, addr != end);
> >>
> >>       lazy_mmu_mode_disable();
> >>       *mask |= PGTBL_PTE_MODIFIED;
> >> @@ -587,7 +590,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
> >>
> >>  static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
> >>               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> >> -             pgtbl_mod_mask *mask)
> >> +             pgtbl_mod_mask *mask, unsigned int shift)
> >>  {
> >>       pmd_t *pmd;
> >>       unsigned long next;
> >>> @@ -597,7 +600,27 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
> >>>               return -ENOMEM;
> >>>       do {
> >>>               next = pmd_addr_end(addr, end);
> >>> -             if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
> >>> +
> >>> +             if (shift == PMD_SHIFT) {
> >>> +                     struct page *page = pages[*nr];
> >>> +                     phys_addr_t phys_addr;
> >>> +
> >>> +                     if (WARN_ON(!page))
> >>> +                             return -ENOMEM;
> >>> +                     if (WARN_ON(!pfn_valid(page_to_pfn(page))))
> >>> +                             return -EINVAL;
> >>
> >>
> >> So I know these !page and !pfn_valid checks have been copied from vmap_pages_pte_range,
> >> but do they mean anything?
> >>
> >> I think pfn_valid() makes sense in that someone may take a random VA/PA, convert it into a struct
> >> page and pass to vmap layer. But I don't see how anyone would pass page == NULL? At the
> >> very least, returning ENOMEM does not make sense because the pages are not being
> >> allocated by vmap() but have already been allocated.
> >
> > Hi Dev,
> >
> > vmap() is EXPORT_SYMBOL with many callers across drivers, each
> > constructing the pages array differently. The !page check guards
> > against malformed arrays at this API boundary.
> >
> > The same -ENOMEM issue also exists in vmap_pages_pte_range().
> > Should I fix both in this patchset or leave it as a separate cleanup?
> >
> >>
> >>> +
> >>> +                     phys_addr = page_to_phys(page);
> >>> +
> >>> +                     if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot,
> >>> +                                             shift)) {
> >>> +                             *mask |= PGTBL_PMD_MODIFIED;
> >>> +                             *nr += 1 << (shift - PAGE_SHIFT);
> >>> +                             continue;
> >>> +                     }
> >>> +             }
> >>> +
> >>> +             if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask, shift))
> >>>                       return -ENOMEM;
> >>>       } while (pmd++, addr = next, addr != end);
> >>>       return 0;
> >>> @@ -605,7 +628,7 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
> >>>
> >>>  static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
> >>>               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> >>> -             pgtbl_mod_mask *mask)
> >>> +             pgtbl_mod_mask *mask, unsigned int shift)
> >>>  {
> >>>       pud_t *pud;
> >>>       unsigned long next;
> >>> @@ -615,7 +638,7 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
> >>>               return -ENOMEM;
> >>>       do {
> >>>               next = pud_addr_end(addr, end);
> >>> -             if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
> >>> +             if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask, shift))
> >>>                       return -ENOMEM;
> >>>       } while (pud++, addr = next, addr != end);
> >>>       return 0;
> >>> @@ -623,7 +646,7 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
> >>>
> >>>  static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
> >>>               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> >>> -             pgtbl_mod_mask *mask)
> >>> +             pgtbl_mod_mask *mask, unsigned int shift)
> >>>  {
> >>>       p4d_t *p4d;
> >>>       unsigned long next;
> >>> @@ -633,14 +656,14 @@ static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
> >>>               return -ENOMEM;
> >>>       do {
> >>>               next = p4d_addr_end(addr, end);
> >>> -             if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask))
> >>> +             if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask, shift))
> >>>                       return -ENOMEM;
> >>>       } while (p4d++, addr = next, addr != end);
> >>>       return 0;
> >>>  }
> >>>
> >>> -static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> >>> -             pgprot_t prot, struct page **pages)
> >>> +static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
> >>> +             pgprot_t prot, struct page **pages, unsigned int shift)
> >>>  {
> >>>       unsigned long start = addr;
> >>>       pgd_t *pgd;
> >>> @@ -655,7 +678,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> >>>               next = pgd_addr_end(addr, end);
> >>>               if (pgd_bad(*pgd))
> >>>                       mask |= PGTBL_PGD_MODIFIED;
> >>> -             err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
> >>> +             err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask, shift);
> >>>               if (err)
> >>>                       break;
> >>>       } while (pgd++, addr = next, addr != end);
> >>> @@ -678,27 +701,13 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> >>>  int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> >>>               pgprot_t prot, struct page **pages, unsigned int page_shift)
> >>>  {
> >>> -     unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
> >>> -
> >>>       WARN_ON(page_shift < PAGE_SHIFT);
> >>>
> >>> -     if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> >>> -                     page_shift == PAGE_SHIFT)
> >>> -             return vmap_small_pages_range_noflush(addr, end, prot, pages);
> >>> +     if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
> >>> +             page_shift = PAGE_SHIFT;
> >>>
> >>> -     for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> >>> -             int err;
> >>> -
> >>> -             err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> >>> -                                     page_to_phys(pages[i]), prot,
> >>> -                                     page_shift);
> >>> -             if (err)
> >>> -                     return err;
> >>> -
> >>> -             addr += 1UL << page_shift;
> >>> -     }
> >>> -
> >>> -     return 0;
> >>> +     return vmap_pages_range_noflush_walk(addr, end, prot, pages,
> >>> +                     min(page_shift, PMD_SHIFT));
> >>
> >>
> >> We can easily extend to PUD huge mappings right? Not sure whether we
> >> should keep everything symmetric to how vmap_range_noflush() operates
> >> right now, since P4D mappings don't exist, but PUD looks worthwhile.
> >>
> >
> > PUD mapping requires 1GB of contiguous physical memory, but the buddy
> > allocator's MAX_PAGE_ORDER is 10 (4MB on 4K pages). So page_shift
> > passed to vmap_pages_range_noflush_walk() never exceeds PMD_SHIFT.
>
> Can we then just drop the min()? You can guard the try_huge_pmd with
> shift >= PMD_SHIFT - the walker has the necessary ingredients to work
> with a shift > PMD_SHIFT, so let us not confuse by this min() truncation.
>

Will Drop the min() here.
Thanks.

> >
> > Thanks,
> > Wen
> >>>  }
> >>>
> >>>  int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> >>
>

