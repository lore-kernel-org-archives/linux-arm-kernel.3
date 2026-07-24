Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7B8C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 15:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tb5O8wjKcs1Pw/yvf0gMKaayemz7IuqUU9nVaaWlvg8=; b=DtlscumxZadmlz45yVams03tEq
	rTBx3d8ngbPmpIW5Iyuwm5eCRxGg99rBiq0pSjPJcbKzaS7S1ypJ3ycSP3nUtRt2PyeWWeru7qn30
	OMJUVdGYrvkDxAzPdLzhamxK7CNIXBFAxwS2Ur36rhXheuJs+6Uj7pj3BnZRAbtV8TdDKIEgUrilp
	5wRc6EU0FTTPTWt9+MFDSeDpW7uu2BEWEeIUKS1sN9OV+AbYkNBxjlfrBYwnWFoxGuHzAAUBD6YhK
	w30JsmAjauxYyxBnLqvC31DejIch+wXcwa1agQNxXrMowvLWecBhLIvxR0mNJrvQ6Bfz3O8zMaVJ6
	C0DNWYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHXU-0000000Geb8-1ksz;
	Fri, 24 Jul 2026 15:10:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHXS-0000000Gear-20SD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 15:10:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 282A24323D;
	Fri, 24 Jul 2026 15:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADC81F000E9;
	Fri, 24 Jul 2026 15:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784905814;
	bh=tb5O8wjKcs1Pw/yvf0gMKaayemz7IuqUU9nVaaWlvg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=clXeYOxQXDLXpoAFDrENkwTGS7dui0fvsU/h7Ajf1ew3+S1zHO/VInmDubBEe3KWJ
	 JX6jw8hkeIkNGGu6MY3CNkRCy3HysYs8Nb1uimnA1D4lSbUVRwffoZHRkJC3MpQAuL
	 Z2MKlVbWshUBo2CLTVtcgzh9vLEcvQCh1dCSo2VQvftbC9Fv41taVeNEu9puIqTQQT
	 fx5k1OoQV4j+3oVp7dQXtTWzQb0HpQWJfKB/UC0e9LAAJYVebm2TTU0e49BOMnI8WG
	 BNvgUvp4of6vGbUSykKTAFl/EXryoPxo8uD4ojxLNdMP6+36VCT5lSZ1apZFEeCgdU
	 Dvo0Dg6q+d4IA==
Date: Fri, 24 Jul 2026 16:09:53 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, David Carlier <devnexen@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"Denis V. Lunev" <den@virtuozzo.com>, "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, 
	stable@vger.kernel.org, syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
Subject: Re: [PATCH mm-hotfixes v6 0/5] mm: fix UAF caused by race between
 ptdump and vmap pgtable freeing
Message-ID: <amOANEMRAsJsTBR3@lucifer>
References: <20260723-series-vmap-race-fix-v6-0-8cc77dcc0018@kernel.org>
 <20260723162646.350cf3bf415a0855140d139b@linux-foundation.org>
 <20260723163233.54b38cfc682a25eb6edf7cc7@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723163233.54b38cfc682a25eb6edf7cc7@linux-foundation.org>
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

On Thu, Jul 23, 2026 at 04:32:33PM -0700, Andrew Morton wrote:
> On Thu, 23 Jul 2026 16:26:46 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
>
> > @@ -1250,7 +1251,11 @@ static int split_large_page(struct cpa_d
> >
> >  	if (!debug_pagealloc_enabled())
> >  		spin_unlock(&cpa_lock);
> > +	if (cpa->init_mm_read_locked)
> > +		mmap_read_unlock(&init_mm);
> >  	ptdesc = pagetable_alloc(GFP_KERNEL, 0);
> > +	if (cpa->init_mm_read_locked)
> > +		mmap_read_lock(&init_mm);
> >  	if (!debug_pagealloc_enabled())
> >  		spin_lock(&cpa_lock);
> >  	if (!ptdesc)
>
> btw, this affects your later "x86/mm/pat: allocate split page tables as
> kernel page tables".  Which I resolved thusly:
>
> static int split_large_page(struct cpa_data *cpa, pte_t *kpte,
> 			    unsigned long address)
> {
> 	pte_t *pte;
>
> 	if (!debug_pagealloc_enabled())
> 		spin_unlock(&cpa_lock);
> 	if (cpa->init_mm_read_locked)
> 		mmap_read_unlock(&init_mm);
> 	pte = pte_alloc_one_kernel(&init_mm);
> 	if (cpa->init_mm_read_locked)
> 		mmap_read_lock(&init_mm);
> 	if (!debug_pagealloc_enabled())
> 		spin_lock(&cpa_lock);
> 	if (!pte)
> 		return -ENOMEM;
>
> 	if (__split_large_page(cpa, kpte, address, pte))
> 		pte_free_kernel(&init_mm, pte);
>
> 	return 0;
> }
>
>

Thanks that's correct!

Cheers, Lorenzo

