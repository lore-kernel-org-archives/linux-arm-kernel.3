Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0023DCD6E41
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 09:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeNp5zNgXhh9w9gen/mqg7KXpKPshnm2ZyOIypYk7Gw=; b=mdCk0vrlsCiU8ZxrUf77xsrZZ1
	t1YTlKp9y/8guSzmotDhkKGGJhIFpraTJmqTugqlhOrlcHqrau/KBoaiYc8asEH5Pu9ScsUr4Asbn
	r5+3puKMuf9Yepx6ppo57LdO6zKk/mX4Rt9A47AnQQ+U3nsNNXbeXFZGXdNKgHxkgFBtNLmIItoVU
	QUy1fpKejNJnjbQ+UeGj1cHWEFfNHMOvOp3lLym9975e+SVA3wgEb88rIm4/sh0y8y1QwTLVMWkQP
	DXIJabhZPJL7qfP6hdWUF6SLaA1SSg3yqp8C/QMwyyQnffXTCNbJ//IsS2yPHlNn9mJjOWXEeI4Dp
	yI2lf5WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAbD-00000003e0n-3hBn;
	Wed, 27 May 2026 09:30:51 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAbA-00000003dzx-1M0v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 09:30:50 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso19418115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 02:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779874246; x=1780479046; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UeNp5zNgXhh9w9gen/mqg7KXpKPshnm2ZyOIypYk7Gw=;
        b=WkpyFcqu4uj5VVc7wTkuggLRbFC45l7AI2AFOMjTCiRTVo7oXa8FgkGeh0sO3JU5CL
         JjcR232r/iF54ReVv3HV+gkm5tmH/pYOs4r4i4IG6SEdevQhf2UCP0dj1xWzApCNZ7F2
         jtsE8PDwRBxqkPSQhAKJpOJIhIz5qL8gojaC3HmGwcuxeGlpB8l7goQn/YXCKToQMG1W
         yrXeGsLPM41x5caPnHXdExGGpnoquQnhSd+a0e//qj9j+3johoh6wtCjzszzbR8y0qzb
         G1p7hUUgn9uxoTZSOC5/7xb5/5kfjgc1KaKKQS5EbuCPKI1ZYYu5nDC3H33kcmC/pyN8
         k0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779874246; x=1780479046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UeNp5zNgXhh9w9gen/mqg7KXpKPshnm2ZyOIypYk7Gw=;
        b=PFGMBoAxcB6OHscsQPteoNEufSeIkEJvX/exv8wDrI5EYwlkpNFDVMl77CwgJBKlgN
         8JdX7SBl8dn3DbZs0UH/DfMKhG1bN+EOjgAq708lCoselIu6HoBW6f9a9UmJvYfDJ20g
         nJcCBjPWW8AzJkeMsgfzpb1jO+Q+GRnycb/7S8jbf3eu85felFJgMgzPEsm6ZrRbZbZB
         ieg70CDjV1YpusgT3IT22W80ABQfkSH3FkacgGX9mjzzgg6z30cIDwLnIS3G6FbaWgqj
         Wa6xhDTCYgaVHfoFrTUAGBen6gbZ9aSqsD4DDsKW1qTAcx43AegT4H5UaxPs85I5Xhv5
         d5Mg==
X-Forwarded-Encrypted: i=1; AFNElJ843Pt/o7r+9rKUVauQq0j8ErTtjib3BvDaarfUH56ABH8p84LQJLdy7SuEhnlmt3wrrRrlAfIE72or29ON5lW2@lists.infradead.org
X-Gm-Message-State: AOJu0YyVcbNmYpVMk8YNhc9OrJ7J44Kl83V5Cd93abOxsdoEaIUwJhw0
	xoy+StCf8UxRPb11h8qPrAH9t06tRHH/Yl3SY8cRy8fnVAFtxuqqVg/H
X-Gm-Gg: Acq92OE/9pIAUazlGzoeDwP5o5I2rWoZ7XIkBbXjWlL2dAUPzBUbsaEqqKiQyMBXkRE
	6ru71XMyP2XFxqy9OviBqnBMCH05cplTSjCuj/eC0RQZuouAKY59Nl6RrzhYYljiDCNoCPQlGlg
	vG4YjQl3o3q06lNqbzYCxM9/YQy8kZKPg+bhEd77Aj7Apcwt75ITHzxCuu+XNwxzOH5wlKSXnkJ
	7o5phlZ3C5mUBrzz9R4msipc0DMWR4xQMQHfOpQQ4cW8i2wmUBhikBLvZU5uBfpxB3bT9JOmcEo
	Nxo+eH4SJrf8naLlbT/0v9Vr8B+RTJr/SDuqJYuT7W5O6dp8GJOnahQ0UxfM9/UJBUMg6k59Fnr
	9qywJ1NZEN8Ewt2RLLGPXgg4dRYu8IoU86pkNXjVCZ72TnGnDusTeD6LbSjuPUlkRfeI6/YodKI
	Ne95eDAqlyLv4iWDn9F6jdhIYAIN74V8qSHhzI4PybODKi5oJqbF3pFxsb50Tdxy7IH0FZHlj2T
	cVPdxmcsFjHPNFmDJdJ2u8Bu6lVlhK/8A==
X-Received: by 2002:a05:600c:8b23:b0:48f:d5b2:7c1a with SMTP id 5b1f17b1804b1-490425aa7a4mr390195565e9.13.1779874246051;
        Wed, 27 May 2026 02:30:46 -0700 (PDT)
Received: from fedora (cpc92878-cmbg18-2-0-cust539.5-4.cable.virginm.net. [86.16.54.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49045282201sm427410665e9.8.2026.05.27.02.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:30:45 -0700 (PDT)
Date: Wed, 27 May 2026 10:30:43 +0100
From: Vishal Moola <vishal.moola@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alistair Popple <apopple@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, david@kernel.org
Subject: Re: [PATCH] arm64: mm: call pagetable dtor when freeing hot-removed
 page tables
Message-ID: <aha5w_WRTmtb6O-B@fedora>
References: <20260521032730.2104017-1-apopple@nvidia.com>
 <20260521153130.d7d5cd060f7522f894252333@linux-foundation.org>
 <ahACfQ6kCfONqz5h@arm.com>
 <ahAjudlB32VbkKbG@fedora>
 <92450154-e1ab-46e4-b23d-eaa59c9cdd3b@arm.com>
 <ahW3QYiYjjVB4Knv@willie-the-truck>
 <423a2656-e1a3-473e-abeb-5e301c6f7c2a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <423a2656-e1a3-473e-abeb-5e301c6f7c2a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_023048_384740_E07E9A10 
X-CRM114-Status: GOOD (  29.67  )
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

On Wed, May 27, 2026 at 09:35:50AM +0200, Kevin Brodsky wrote:
> On 26/05/2026 17:07, Will Deacon wrote:
> > On Tue, May 26, 2026 at 01:54:00PM +0200, Kevin Brodsky wrote:
> >> On 22/05/2026 11:36, Vishal Moola wrote:
> >>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> >>>> index 4c8959153ac4..9d42cbddce27 100644
> >>>> --- a/arch/arm64/mm/mmu.c
> >>>> +++ b/arch/arm64/mm/mmu.c
> >>>> @@ -1441,6 +1441,9 @@ static void free_hotplug_page_range(struct page *page, size_t size,
> >>>>  
> >>>>  static void free_hotplug_pgtable_page(struct page *page)
> >>>>  {
> >>>> +	if (folio_test_pgtable(page_folio(page)))
> >>> This should work.
> >>>
> >>>> +		pagetable_dtor(page_ptdesc(page));
> >>>> +
> >>>>  	free_hotplug_page_range(page, PAGE_SIZE, NULL);
> >>> In the case we presumably have a page table page (ptdesc) at this
> >>> point, we should really be freeing it with pagetable_free() as well.
> >> Agreed, I think this is the right thing to do, something like:
> >>
> >> if (folio_test_pgtable(page_folio(page)))
> >> pagetable_dtor_free(page_ptdesc(page)); else
> >> free_hotplug_page_range(page, PAGE_SIZE, NULL);
> >>
> >>
> >> Strangely enough x86 calls pagetable_free() in both cases.
> >>
> >> My series protecting page tables with pkeys has a patch [1] to get
> >> vmemmap to allocate page tables with pagetable_alloc(). The diff above
> >> will require pagetable_*_ctor() to be called as well, but I think that's
> >> the right thing to do anyway. That could be posted as a separate series,
> >> but I'm hesitant due to the lack of NUMA awareness in pagetable_alloc().
> > I agree that calling the ctor()/dtor() functions consistently is the
> > cleanest approach and that will need something like your patch to call
> > the constructor from vmemmap_alloc_block_zero(). Trying to elide these
> > calls for the page-table pages used to map the altmap just feels odd to
> > me, as there isn't anything particularly special about them afaik.
> 
> I don't think they're really special either, most likely they just got
> missed/ignored for the purpose of ctor/dtor like many other kernel page
> tables (until recently).
>
> I'll prepare a series refactoring that code then - that will also
> require changing most arch implementations of vmemmap_free() to call
> pagetable_dtor_free().

Take a look at Matthew's series[1]. I think thats the ideal approach for
page table accounting. He hasn't had time to iterate on it though. I
doubt he'd mind if someone picked it up.

> In the meantime we should probably use the logic above to avoid the BUG
> that Alistair reported.

Agreed.

[1] https://lore.kernel.org/linux-mm/20251113140448.1814860-4-willy@infradead.org/

