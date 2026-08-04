Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBC8C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 12:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkEir9uFm1qRBCXp0zpCOeuLTQKL4glDCYZRatT+50Y=; b=kUaNQlPbvJtI6ZpWmd00iYHPCb
	D05EzUoKQORT++2rqu50NyqNOZiT534Dx8XzcEwWJx5tOUFjCTMWhaD14VXlLuPaBKSSSDU3ugLiM
	PGAfo0iEtLetdqq7fHAgiRCkxrTkZojnskcQogB98xn9G3dGKFG2ZS8F9/hZq9gUmM/emCDbgUj0S
	3Xa6BhmkvO/nn61q7PG93cvGa9KfIphMoLUVZ9E5814//KHDlOKcvKsCMbTp9LyVfoDcfCnGfUEyW
	d/gyKrqlUXbt3RqqmtxNkoUE/AjgeA8MHX/Ttxz4Z6UCtEkTQ47aON0xqYmwSsdrhXzeAikx67dyR
	SCQ5Vpag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrEjz-00000001rq8-2XHB;
	Tue, 04 Aug 2026 12:59:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrEjy-00000001rpp-1v0N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 12:59:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2551A41FC2;
	Tue,  4 Aug 2026 12:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B111F000E9;
	Tue,  4 Aug 2026 12:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785848370;
	bh=rkEir9uFm1qRBCXp0zpCOeuLTQKL4glDCYZRatT+50Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gVucjhvrdbhER92eS5xBHqYeZpRRPk+DMQSNxJPje3bAw5/f6Is/Nlxg+QiKYxfyL
	 pGQoOaMN++o0pL9N4wS88gUthxS0LEzYZKJZYvjbiDx/YUuiHmFTpl65FF4Q9xwM0s
	 a3HI42iOihbi5kLSp3FDAlBecuXQkaSEbziibdWB2HI43ExYZ5VxAwgNzL8NLKy4/V
	 BvJA7uaB+cbSx42oZRA6c8/ULe0tqE31ITKSKG8p1/ldAswRXodrmvS/+E0is3fQsS
	 w6b9GFu80tahoLmlwJ3y8g26YTuFV2gojiLnnLp6U02LXioHwZLgPZzUCMN88kobJv
	 U6M2c8qhm7r5g==
Date: Tue, 4 Aug 2026 13:59:08 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Muhammad Usama Anjum <usama.anjum@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] mm/powerpc/8xx: constify ptep_get() argument
Message-ID: <anHgw2Z-d-OQk9qs@lucifer>
References: <20260803164400.531199-1-pfalcato@suse.de>
 <20260803164400.531199-4-pfalcato@suse.de>
 <anHI4B-lMu6AJJfA@lucifer>
 <dcdb8cab-c18c-4995-ad1d-2f2d4700e7c1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcdb8cab-c18c-4995-ad1d-2f2d4700e7c1@kernel.org>
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

On Tue, Aug 04, 2026 at 02:50:19PM +0200, Christophe Leroy (CS GROUP) wrote:
> Hi Lorenzo,
>
> Le 04/08/2026 à 13:13, Lorenzo Stoakes (ARM) a écrit :
> > On Mon, Aug 03, 2026 at 05:43:57PM +0100, Pedro Falcato wrote:
> > > There is no need for write access to the PTE.
> > >
> > > Signed-off-by: Pedro Falcato <pfalcato@suse.de>
> >
> > With below addressed LGTM so:
> >
> > Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >
> > > ---
> > >   arch/powerpc/include/asm/nohash/32/pte-8xx.h | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
> > > index e2ea8ba9f8ca..f2bab31040c7 100644
> > > --- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
> > > +++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
> > > @@ -226,7 +226,7 @@ static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, p
> > >
> > >   #ifdef CONFIG_PPC_16K_PAGES
> > >   #define ptep_get ptep_get
> > > -static inline pte_t ptep_get(pte_t *ptep)
> > > +static inline pte_t ptep_get(const pte_t *ptep)
> > >   {
> > >   	pte_basic_t val = READ_ONCE(ptep->pte);
> > >   	pte_t pte = {val, val, val, val};
> >
> > Worth making these const too (that {val, val, val, val} horrifies me btw :)?
>
> Any suggestion welcome.

I'm being super nitty, all I mean is:

-   	pte_basic_t val = READ_ONCE(ptep->pte);
-  	pte_t pte = {val, val, val, val};
+   	const pte_basic_t val = READ_ONCE(ptep->pte);
+  	const pte_t pte = {val, val, val, val};

:)

>
> powerpc 8xx page table is independant on page size. When you use 16k pages,
> depending on the address you hit the page for the first time, the HW assist
> page table walk will fetch one of four 4k cells in page table that need to
> be identical as they all four define the same 16k page. Not sure I'm clear.

No that's clear, thanks!

(I say 'horrifying' because I am looking into RCU page table freeing which this
may complicate, though perhaps not in practice, to be continued :)

>
> Christophe
>

--
Cheers, Lorenzo

