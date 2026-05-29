Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85349CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PChq7lVk0cZN2Il3vhZJBZZET0uiB5y1SQ5YG4ON0U0=; b=EzjvJkIhguuoRhhGZd9kxvBudy
	YppQgDPQ88TDnkxHF/RQJ9cN+G7lyKfqpO4fg9ZUnOglbNrSoJFgxmozwKLr22Lodwtw2oTJTghct
	YUKBRRMYjjhCv1tjP73xetsSO93H3kFjob7D/c6eb8Aui3r2VC8DPX95/meze3l1nqxbslJHKONlM
	ztZUSFo99ShJg7/RkRg+4m2A+pToaJTTyV1WCIdlWXG1wiFcR8B2w9vR7aL27nSBnroQu5m/3nZmp
	92ORethfBRCDESIM9sFsDJ6uPHuIsIjQ+bFPyKyMK/kNetpcFmQhcJigwxbTB4FKmPU+cXPvD4S7T
	EAfvUpbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuH0-000000079wt-2OdD;
	Fri, 29 May 2026 10:17:02 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuGy-000000079vd-0EQ9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:17:01 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4905529b933so54097275e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 03:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049818; x=1780654618; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PChq7lVk0cZN2Il3vhZJBZZET0uiB5y1SQ5YG4ON0U0=;
        b=kUwpyeOTeQLGgoQtlAoY/DjouT65SizfUnfYLVos0feWINpDxlewqR4+kJhvbB4BsA
         EkkqstWfo4thVX843kjaPc/n3gxdViAErv6D5Y/kLC8DftsztaJQE8ZL59d4YnWehkp5
         2AiuTGy8yhciSNVtu3BoMtHkGVM4nflBKgA7VL2B/Fc9oZ6mmJuISjeHqm/KmRPtNBOT
         SC8HDzQN1rlwMfVbUeaQIfY3BYqHUUSPSVjB1CAJ9I7xs9QVGQjaQU/2KhyP9PL0a0Te
         WrHzs0B/jRfPtanxoDlKOWPFBG9fIPAsPccIts+xrE/SCwn8gfHBTS3vdu6f9BobnTm9
         PArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049818; x=1780654618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PChq7lVk0cZN2Il3vhZJBZZET0uiB5y1SQ5YG4ON0U0=;
        b=K7G4+wxgW0LZAZ3bTa8LSG6CIpfdXPIvEajVBbgo7/hclY2RmqAFrZMIbPC/1z7v49
         1nisy8IouBk7NQhS2J9nAyDX1umIdzy9qA4lHBoFdOvKS9j4BBL9ARaZR6LVvyGWEpre
         4r8YQsp5ncNFr/EXq309V2Ch0EkU/FLiH31nU77owRCDQMRN+LIEm12nUbfZoWcGZR7c
         ButQEN4sGYzaH/RgdV9EtDSye+NVmJMiELYukvdO4LRpJVbYE+zOX1ab6Cq2HY2d2BoR
         qxXX/ES5GgXyCeqCNsS2rm5QOj5K2i5DpQy0Y/c8WtoIpz1kaJba2GfYxW6K++O59HLc
         z3Aw==
X-Forwarded-Encrypted: i=1; AFNElJ89D6fORDdFPzvU22YpPLCafPByL010EQmiVDwFs72jfnW7LZ0S1EUJk000pyvVMTryZsGGjC/Wt6nO0lAN/L3M@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdk+e7w6fohZoi4aZ/ivDJ2bWaLno6Pg6Q1ZmS7AZkl1QJZMwd
	STQquWIH7SQPxiabHTiz+AqXziUJ0sB70+zeGj8H0VJOMP0b0t++fVWRYME44w==
X-Gm-Gg: Acq92OFPzi2x4NTanTTU/zRNLYQAvOUZGtu87JSRShc3TKc+Te7dIZCz6J+Eg7wG7As
	2hLnvd/8kRb/2k/h+oRWnouVWkNWMvlxSLLurUlNpBZbCKoTLl1gs4yDiV525d+tRltMYfF4RYb
	xtdlIBpwSc42fdDeT65cBf0tcBZGlyQnFQBmy/poa3U4yk+Utv/8+fvJIjvXGVZkyStQItrIor1
	H64chWF/dMGa+1z30pPVjadVuH0P3m6QCszsDMMEReG66m2y3Jf9QX7zxkGrVmo9b6RoNH3J8NH
	2AUhJK0ZTnko3LCoMwph+5Ow8JXQ4mAyzUkiKl1schI45eDeiEp3RS8t0nP8IScAwVGS6q6Zbi3
	My7MiWVOUQFnF9AGfvo+spEMaFxmY1+G8V0D5FVcvqZDIkhQALsqUA3DFMVzisNLPm8F3QHAgAD
	hGYYEhqDUzpB27k/V7OwTK9eK+FRZ7jDmSCy13LxJP0DKQ04vx+PRfsRZgZWJ0VNq5iuzrqoC7L
	/YeH9N+UOo/Hxtcj7AVm3u/05pzQf75VGaoBAji1N7T
X-Received: by 2002:a05:600c:1453:b0:490:50ff:7943 with SMTP id 5b1f17b1804b1-4909c0773a4mr26720375e9.5.1780049817498;
        Fri, 29 May 2026 03:16:57 -0700 (PDT)
Received: from fedora (cpc92878-cmbg18-2-0-cust539.5-4.cable.virginm.net. [86.16.54.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c13276dsm11265945e9.36.2026.05.29.03.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:16:56 -0700 (PDT)
Date: Fri, 29 May 2026 11:16:54 +0100
From: Vishal Moola <vishal.moola@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alistair Popple <apopple@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, david@kernel.org
Subject: Re: [PATCH] arm64: mm: call pagetable dtor when freeing hot-removed
 page tables
Message-ID: <ahlnltbpnoWcEtEj@fedora>
References: <20260521032730.2104017-1-apopple@nvidia.com>
 <20260521153130.d7d5cd060f7522f894252333@linux-foundation.org>
 <ahACfQ6kCfONqz5h@arm.com>
 <ahAjudlB32VbkKbG@fedora>
 <92450154-e1ab-46e4-b23d-eaa59c9cdd3b@arm.com>
 <ahW3QYiYjjVB4Knv@willie-the-truck>
 <423a2656-e1a3-473e-abeb-5e301c6f7c2a@arm.com>
 <aha5w_WRTmtb6O-B@fedora>
 <83d168c1-fed9-4301-8d0e-ffd133df90bb@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83d168c1-fed9-4301-8d0e-ffd133df90bb@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_031700_122209_508BAF3B 
X-CRM114-Status: GOOD (  36.87  )
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

On Thu, May 28, 2026 at 10:05:22AM +0200, Kevin Brodsky wrote:
> On 27/05/2026 11:30, Vishal Moola wrote:
> > On Wed, May 27, 2026 at 09:35:50AM +0200, Kevin Brodsky wrote:
> >> On 26/05/2026 17:07, Will Deacon wrote:
> >>> On Tue, May 26, 2026 at 01:54:00PM +0200, Kevin Brodsky wrote:
> >>>> On 22/05/2026 11:36, Vishal Moola wrote:
> >>>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> >>>>>> index 4c8959153ac4..9d42cbddce27 100644
> >>>>>> --- a/arch/arm64/mm/mmu.c
> >>>>>> +++ b/arch/arm64/mm/mmu.c
> >>>>>> @@ -1441,6 +1441,9 @@ static void free_hotplug_page_range(struct page *page, size_t size,
> >>>>>>  
> >>>>>>  static void free_hotplug_pgtable_page(struct page *page)
> >>>>>>  {
> >>>>>> +	if (folio_test_pgtable(page_folio(page)))
> >>>>> This should work.
> >>>>>
> >>>>>> +		pagetable_dtor(page_ptdesc(page));
> >>>>>> +
> >>>>>>  	free_hotplug_page_range(page, PAGE_SIZE, NULL);
> >>>>> In the case we presumably have a page table page (ptdesc) at this
> >>>>> point, we should really be freeing it with pagetable_free() as well.
> >>>> Agreed, I think this is the right thing to do, something like:
> >>>>
> >>>> if (folio_test_pgtable(page_folio(page)))
> >>>> pagetable_dtor_free(page_ptdesc(page)); else
> >>>> free_hotplug_page_range(page, PAGE_SIZE, NULL);
> >>>>
> >>>>
> >>>> Strangely enough x86 calls pagetable_free() in both cases.
> >>>>
> >>>> My series protecting page tables with pkeys has a patch [1] to get
> >>>> vmemmap to allocate page tables with pagetable_alloc(). The diff above
> >>>> will require pagetable_*_ctor() to be called as well, but I think that's
> >>>> the right thing to do anyway. That could be posted as a separate series,
> >>>> but I'm hesitant due to the lack of NUMA awareness in pagetable_alloc().
> >>> I agree that calling the ctor()/dtor() functions consistently is the
> >>> cleanest approach and that will need something like your patch to call
> >>> the constructor from vmemmap_alloc_block_zero(). Trying to elide these
> >>> calls for the page-table pages used to map the altmap just feels odd to
> >>> me, as there isn't anything particularly special about them afaik.
> >> I don't think they're really special either, most likely they just got
> >> missed/ignored for the purpose of ctor/dtor like many other kernel page
> >> tables (until recently).
> >>
> >> I'll prepare a series refactoring that code then - that will also
> >> require changing most arch implementations of vmemmap_free() to call
> >> pagetable_dtor_free().
> > Take a look at Matthew's series[1]. I think thats the ideal approach for
> > page table accounting. He hasn't had time to iterate on it though. I
> > doubt he'd mind if someone picked it up.
> 
> I recall this series. Are you suggesting that we would no longer need to
> call the ctor/dtor for kernel page tables with this approach? That
> leaves us with the weird case of ptdesc_set_kernel(), which is called
> from *_alloc_one() while ptdesc_clear_kernel() is called from
> pagetable_free(), but that's only an optimisation so we can probably
> live with it.

Pretty much. The ctor/dtor do things that every single page table should
be doing, so it makes sense to move them to the allocation/free sites
instead.

Kernel pagetables are a subset of ptdescs, so keeping those where they
are makes sense IMO.

> If we go down this route, I would suggest we inline what's left of the
> ctor/dtor, i.e. ptlock, in {pte,pmd}_alloc_one() and {pte,pmd}_free().
> This way it is clear that everything applicable to all page tables
> (kernel+user) should go directly into pagetable_{alloc,free}.
> 
> Happy to post something along those lines (patch 2/3 of Matthew's series
> + removing ctor/dtor completely) if that sounds sensible.

Sounds good to me :)

