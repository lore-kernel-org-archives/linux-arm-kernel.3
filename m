Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399B0CF6BE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 03:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptUxQkZ+K9ShX84WxQzr80zRKVliAxBdsbmpSy77G1U=; b=ECVwLJq3Q9tpD6sBY4Zu4UZD0Q
	3cJxcTJGj+G/EmXEY0oAKYI7fBCs7EJ2NzVXs/BuiIZMQfzaBsa4G56r9UUBnyhmBwW7GP2DzKQEW
	FRu3wyvRZZX9KXsSPOcy9miW1XY7DEOD50H4hl86GPEKRSu7lGUvSzHWFTrfZkncz2tL++gyCTEbd
	tVc/WOVL4XOn6exLwu2AljZkAH7yZNI/EmBst1CLObRX2kbGaM1LB2S/oB/5cslQoqRhi7XjXE+7E
	fzNjgB46e+AwYQkw/kYqhn9IRmD0HFNuI4/ptjS7Yu9MGoFCN/xJLcvzldA4gaCjK0WZUtxcnUOpy
	hh/XVUbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdKGQ-0000000E7od-38Cn;
	Wed, 07 Jan 2026 03:31:14 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdKGN-0000000E7oG-3tYU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 03:31:13 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-b7a72874af1so304932566b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 19:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767756669; x=1768361469; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ptUxQkZ+K9ShX84WxQzr80zRKVliAxBdsbmpSy77G1U=;
        b=e5ENI4A9F5oJO2GmDGTwvzQMq3ZT4bvbgUq8p2yFqOWQRhXI6VopRE74PJldS3vZuh
         a/h4MHIL55s5Ukfmj1D6xhWVP9r3tu8fHAeAg4qcTNlfJx2vZJvctItDW+rOdpBU6HDo
         JxyF9mCOu5st6k5mf5a3OOaU7rVhe+sndVHZB6tdoX/M8trvGlkvZj17LEkijrm3mEDy
         Hb2HcZKrnxVI+KQkfKkrC/oipJlxvfUuDEZadeq9rbMzUJoXMVinPjsaOYKrKWxchTmx
         kH3AANn6zuIBHEj4N2q+IM4l2rY2fhV5mh0Ip9IclRUM+VgTOUYGfWk7KJ1YUPRaAUDd
         CX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767756669; x=1768361469;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptUxQkZ+K9ShX84WxQzr80zRKVliAxBdsbmpSy77G1U=;
        b=h7B0slviwIqrxPV6qABwNDGP9c9vzcNshQDKZ3NyWMFRE6WuPFdcTiDqY2sexPU+df
         Tu2tuiVkbb6tISipLiGf2bvt0pgrF7fRAuKe053drG2ntRS1a/r0s06RzvSOBh8Fy+AQ
         5hSgNY12724AyQOlw2aoWPBDsumesvrYJN40/c+uVp2uE3guKaVavsq3ftjlpMGX3syK
         /hkcB9Svwjf05g92ihi55v8exX0wti2n8Nd317oH1Wdkh++5d7El54+3+jbTJtgW89B/
         UJspXikfNZBFnHOEWBpR3IvwAq/j0THyxu0mLQoRJH+fAYpsPxLeEDHHLa3eTUurt8Y1
         G27A==
X-Forwarded-Encrypted: i=1; AJvYcCV57qnMk4rcgNQo7MwIbf6UyoJTEDldq2D4tKXIwsdHm6Gj8WXz63yEfGNSsiCImKsBixTk74RMSrgBj3t0fUTF@lists.infradead.org
X-Gm-Message-State: AOJu0YzUl0QLVYfW2VI36aZtXNpOIDZ3jXMRJq2GV3ZBg9+LyRRC1YFt
	LUGjQFt6tb49B6DbzVFh4CaP1v/BQtKWm84xG1ovog4ZKCRA0/eyXtQ/
X-Gm-Gg: AY/fxX7HzyL2LNeNFHPakAqa7cATilrrO8Q1pF3vyDT10hbCUPImbAvTUEre11xGiRh
	bTY3q/jU6sCEKihQiVOpHNKgXoDi2+DpRPeHJ02RKHeCedNOcek0LmZimS/MJLFKHnVfQ+Jsb/B
	YgLEB+0iUOXhpJQPnUR1SPl4/RIttw4bzxaCUjcaezDFoKag4YZ7FczvoNYQul+yc9Fuk9+n8sP
	BUA6UGJJfqi6ttcvOmmepuIhsODEqVGWj+CvBTJamw5Bd64XcxayzeboguxzlcRkrASPrvrForK
	HS8/QJp4i/XyPokB3HvzbmPAFucAWkWvQeCFv/3HGKkm0S2gKcPOM0MbJnv2wt4MrtwNoAcsh2b
	40go83DnbXM+ci8kPxOY60uLJtAIP8BR19A7v1ai9gEsdHbStUjSXkyiUNHg2UbHepqAB/nCVNe
	xMul3I8J3A8g==
X-Google-Smtp-Source: AGHT+IHXrUepqohER4eBi/ltvOeG/vWbcCIBmPjJ/7BGwIJoB6JHs+TLloUHrygj8bn21j4DVZ0kQQ==
X-Received: by 2002:a17:907:72d2:b0:b6d:4df9:68bc with SMTP id a640c23a62f3a-b8444c59fb8mr112453566b.1.1767756669213;
        Tue, 06 Jan 2026 19:31:09 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a233fb3sm384401966b.12.2026.01.06.19.31.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jan 2026 19:31:08 -0800 (PST)
Date: Wed, 7 Jan 2026 03:31:08 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Barry Song <21cnbao@gmail.com>, Wei Yang <richard.weiyang@gmail.com>,
	akpm@linux-foundation.org, david@kernel.org,
	catalin.marinas@arm.com, will@kernel.org,
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, riel@surriel.com,
	harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
	dev.jain@arm.com, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/5] mm: rmap: support batched unmapping for file
 large folios
Message-ID: <20260107033108.4rspmaq26fewygci@master>
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <142919ac14d3cf70cba370808d85debe089df7b4.1766631066.git.baolin.wang@linux.alibaba.com>
 <20260106132203.kdxfvootlkxzex2l@master>
 <CAGsJ_4yKRtyADU2ZxUMgvqdrhAEL4SpZxCMRt28gNJfUf--5zQ@mail.gmail.com>
 <20260107014601.dxvq6b7ljgxwg7iu@master>
 <CAGsJ_4xfVnPKSPvHYWa1cPK7kZC4F6hKreny9RsKfSCyC4RHuQ@mail.gmail.com>
 <cd626b19-2636-477e-ab01-26380b12d4b1@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd626b19-2636-477e-ab01-26380b12d4b1@linux.alibaba.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_193112_030736_0AECDBAF 
X-CRM114-Status: GOOD (  43.47  )
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jan 07, 2026 at 10:29:18AM +0800, Baolin Wang wrote:
>
>
>On 1/7/26 10:21 AM, Barry Song wrote:
>> On Wed, Jan 7, 2026 at 2:46 PM Wei Yang <richard.weiyang@gmail.com> wrote:
>> > 
>> > On Wed, Jan 07, 2026 at 10:29:25AM +1300, Barry Song wrote:
>> > > On Wed, Jan 7, 2026 at 2:22 AM Wei Yang <richard.weiyang@gmail.com> wrote:
>> > > > 
>> > > > On Fri, Dec 26, 2025 at 02:07:59PM +0800, Baolin Wang wrote:
>> > > > > Similar to folio_referenced_one(), we can apply batched unmapping for file
>> > > > > large folios to optimize the performance of file folios reclamation.
>> > > > > 
>> > > > > Barry previously implemented batched unmapping for lazyfree anonymous large
>> > > > > folios[1] and did not further optimize anonymous large folios or file-backed
>> > > > > large folios at that stage. As for file-backed large folios, the batched
>> > > > > unmapping support is relatively straightforward, as we only need to clear
>> > > > > the consecutive (present) PTE entries for file-backed large folios.
>> > > > > 
>> > > > > Performance testing:
>> > > > > Allocate 10G clean file-backed folios by mmap() in a memory cgroup, and try to
>> > > > > reclaim 8G file-backed folios via the memory.reclaim interface. I can observe
>> > > > > 75% performance improvement on my Arm64 32-core server (and 50%+ improvement
>> > > > > on my X86 machine) with this patch.
>> > > > > 
>> > > > > W/o patch:
>> > > > > real    0m1.018s
>> > > > > user    0m0.000s
>> > > > > sys     0m1.018s
>> > > > > 
>> > > > > W/ patch:
>> > > > > real   0m0.249s
>> > > > > user   0m0.000s
>> > > > > sys    0m0.249s
>> > > > > 
>> > > > > [1] https://lore.kernel.org/all/20250214093015.51024-4-21cnbao@gmail.com/T/#u
>> > > > > Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>> > > > > Acked-by: Barry Song <baohua@kernel.org>
>> > > > > Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> > > > > ---
>> > > > > mm/rmap.c | 7 ++++---
>> > > > > 1 file changed, 4 insertions(+), 3 deletions(-)
>> > > > > 
>> > > > > diff --git a/mm/rmap.c b/mm/rmap.c
>> > > > > index 985ab0b085ba..e1d16003c514 100644
>> > > > > --- a/mm/rmap.c
>> > > > > +++ b/mm/rmap.c
>> > > > > @@ -1863,9 +1863,10 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
>> > > > >        end_addr = pmd_addr_end(addr, vma->vm_end);
>> > > > >        max_nr = (end_addr - addr) >> PAGE_SHIFT;
>> > > > > 
>> > > > > -      /* We only support lazyfree batching for now ... */
>> > > > > -      if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
>> > > > > +      /* We only support lazyfree or file folios batching for now ... */
>> > > > > +      if (folio_test_anon(folio) && folio_test_swapbacked(folio))
>> > > > >                return 1;
>> > > > > +
>> > > > >        if (pte_unused(pte))
>> > > > >                return 1;
>> > > > > 
>> > > > > @@ -2231,7 +2232,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>> > > > >                         *
>> > > > >                         * See Documentation/mm/mmu_notifier.rst
>> > > > >                         */
>> > > > > -                      dec_mm_counter(mm, mm_counter_file(folio));
>> > > > > +                      add_mm_counter(mm, mm_counter_file(folio), -nr_pages);
>> > > > >                }
>> > > > > discard:
>> > > > >                if (unlikely(folio_test_hugetlb(folio))) {
>> > > > > --
>> > > > > 2.47.3
>> > > > > 
>> > > > 
>> > > > Hi, Baolin
>> > > > 
>> > > > When reading your patch, I come up one small question.
>> > > > 
>> > > > Current try_to_unmap_one() has following structure:
>> > > > 
>> > > >      try_to_unmap_one()
>> > > >          while (page_vma_mapped_walk(&pvmw)) {
>> > > >              nr_pages = folio_unmap_pte_batch()
>> > > > 
>> > > >              if (nr_pages = folio_nr_pages(folio))
>> > > >                  goto walk_done;
>> > > >          }
>> > > > 
>> > > > I am thinking what if nr_pages > 1 but nr_pages != folio_nr_pages().
>> > > > 
>> > > > If my understanding is correct, page_vma_mapped_walk() would start from
>> > > > (pvmw->address + PAGE_SIZE) in next iteration, but we have already cleared to
>> > > > (pvmw->address + nr_pages * PAGE_SIZE), right?
>> > > > 
>> > > > Not sure my understanding is correct, if so do we have some reason not to
>> > > > skip the cleared range?
>> > > 
>> > > I don’t quite understand your question. For nr_pages > 1 but not equal
>> > > to nr_pages, page_vma_mapped_walk will skip the nr_pages - 1 PTEs inside.
>> > > 
>> > > take a look:
>> > > 
>> > > next_pte:
>> > >                 do {
>> > >                         pvmw->address += PAGE_SIZE;
>> > >                         if (pvmw->address >= end)
>> > >                                 return not_found(pvmw);
>> > >                         /* Did we cross page table boundary? */
>> > >                         if ((pvmw->address & (PMD_SIZE - PAGE_SIZE)) == 0) {
>> > >                                 if (pvmw->ptl) {
>> > >                                         spin_unlock(pvmw->ptl);
>> > >                                         pvmw->ptl = NULL;
>> > >                                 }
>> > >                                 pte_unmap(pvmw->pte);
>> > >                                 pvmw->pte = NULL;
>> > >                                 pvmw->flags |= PVMW_PGTABLE_CROSSED;
>> > >                                 goto restart;
>> > >                         }
>> > >                         pvmw->pte++;
>> > >                 } while (pte_none(ptep_get(pvmw->pte)));
>> > > 
>> > 
>> > Yes, we do it in page_vma_mapped_walk() now. Since they are pte_none(), they
>> > will be skipped.
>> > 
>> > I mean maybe we can skip it in try_to_unmap_one(), for example:
>> > 
>> > diff --git a/mm/rmap.c b/mm/rmap.c
>> > index 9e5bd4834481..ea1afec7c802 100644
>> > --- a/mm/rmap.c
>> > +++ b/mm/rmap.c
>> > @@ -2250,6 +2250,10 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>> >                   */
>> >                  if (nr_pages == folio_nr_pages(folio))
>> >                          goto walk_done;
>> > +               else {
>> > +                       pvmw.address += PAGE_SIZE * (nr_pages - 1);
>> > +                       pvmw.pte += nr_pages - 1;
>> > +               }
>> >                  continue;
>> >   walk_abort:
>> >                  ret = false;
>> 
>> 
>> I feel this couples the PTE walk iteration with the unmap
>> operation, which does not seem fine to me. It also appears
>> to affect only corner cases.
>
>Agree. There may be no performance gains, so I also prefer to leave it as is.

Got it, thanks.

-- 
Wei Yang
Help you, Help me

