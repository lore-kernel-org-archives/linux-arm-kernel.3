Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF19DC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 13:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6kjCxP9yBKoDCDGJpxropE2U03Q16iuU4HbhIBJf+A=; b=SmuWZNVDcpWeqJTYRXozZATlWc
	hNAPN48JexpQIpRhft7iE7bNcsUCbWKx+w7krLD22GsiBr+UKOTBbFW951wOiKJvWrsmtw5il4QWz
	xiUu8MYTvFMvbuZkgOnYwYFXhXYnxbapDBzJqXPBMugARYeHYK4FGAj1uhPvZ7Ku0tHpXzPBLK2TR
	mnHzrTH8uhNr3zAIrbYvgvHTol2dMPSc+VGXIE6C0tTUKGzrJNZHvXhlgFszLYhsEEovAsq2Y8urU
	3uaNY/firho2Do+nem2BBWl+H3i5c+9OwWHLKQeJs0MczBxsDgkWR6ONCGFGMGu0DZGzh8qGaulsj
	Dt0cYE5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ptO-00000009Hwk-1lrl;
	Wed, 16 Sep 2026 13:41:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ptM-00000009Hwc-3plf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 13:41:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A9F3C41A21;
	Wed, 16 Sep 2026 13:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4001F000FF;
	Wed, 16 Sep 2026 13:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789566100;
	bh=a6kjCxP9yBKoDCDGJpxropE2U03Q16iuU4HbhIBJf+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jlLD6yuFDosHEmd6JzFv/rPZm04Jd/L0IencJCYXxb65CisXMkNidUNhwaDOZsD5p
	 cM7KEQ8mbz1fxDWDQPDd02HLkioIVNmVIPX+9pme9NckO9RuD92oU52O33Y/0rLS5L
	 yp23VOHR8uJX3zOEqKf+Sst8wyQEgidw7WkMwhPW6M+bNXp8YU+/ztMXgqkpCIvvuv
	 +33wxUGO31GXBEGLK/j8nNTVK5CNaJsu61ffdl4mKBVty8Vv+K//kufvTaJ+E9+yfh
	 eFanxfBigamyNqn/1TCCvEiMOw4MINMe4k4fnxLc31nAxIeYFCX/Cb5czHSrTIsVzZ
	 hlJfasBj+UcZQ==
Date: Wed, 16 Sep 2026 14:41:34 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, 
	linux-arm-kernel@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: [PATCH V2 01/14] mm: Add read-write accessors for vm_page_prot
Message-ID: <aqqchzV9bgKYPPyn@gremlin>
References: <20260907035030.2839978-1-anshuman.khandual@arm.com>
 <20260907035030.2839978-2-anshuman.khandual@arm.com>
 <69a7987f-15fb-4793-81b6-cc436525224e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69a7987f-15fb-4793-81b6-cc436525224e@kernel.org>
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

On Wed, Sep 16, 2026 at 03:23:13PM +0200, David Hildenbrand (Arm) wrote:
> On 9/7/26 05:50, Anshuman Khandual wrote:
> > Currently vma->vm_page_prot is safely read from and written to, without any
> > locks with READ_ONCE() and WRITE_ONCE(). But with introduction of D128 page
> > tables on arm64 platform, vm_page_prot grows to 128 bits which can't safely
> > be handled with READ_ONCE() and WRITE_ONCE().
> >
> > Add read and write accessors for vm_page_prot like pgprot_[read|write]()
> > which any platform can override when required, although still defaulting as
> > READ_ONCE() and WRITE_ONCE(), thus preserving the functionality for others.
> >
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: David Hildenbrand <david@kernel.org>
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: Mike Rapoport <rppt@kernel.org>
> > Cc: linux-mm@kvack.org
> > Cc: linux-kernel@vger.kernel.org
> > Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> >  include/linux/pgtable.h | 14 ++++++++++++++
> >  mm/huge_memory.c        |  4 ++--
> >  mm/memory.c             |  2 +-
> >  mm/migrate.c            |  2 +-
> >  mm/mmap.c               |  2 +-
> >  5 files changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index e3c8ab96941c..0df57a5c19ef 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -524,6 +524,20 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
> >  }
> >  #endif
> >
> > +#ifndef pgprot_read
> > +static inline pgprot_t pgprot_read(pgprot_t *prot)
>
> Try passing "const pgprot_t *prot" instead.
>
> [...]
>
> > diff --git a/mm/migrate.c b/mm/migrate.c
> > index 15b45832bcfa..579152cce502 100644
> > --- a/mm/migrate.c
> > +++ b/mm/migrate.c
> > @@ -387,7 +387,7 @@ static bool remove_migration_pte(struct folio *folio,
> >
> >  		folio_get(folio);
> >  		new = folio_page(folio, idx);
> > -		pte = mk_pte(new, READ_ONCE(vma->vm_page_prot));
> > +		pte = mk_pte(new, pgprot_read(&vma->vm_page_prot));
> I do wonder whether a
>
> ogprot_t vma_get_page_prot(const struct vm_area_struct *vma)
>
> where we hide the pgprot access would be a good complement for vma_set_page_prot().

Yes please! :)

>
> Just a thought.
>
>
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 4bf26b0f1e6e..729bc244b317 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -89,7 +89,7 @@ void vma_set_page_prot(struct vm_area_struct *vma)
> >  		vm_page_prot = vma_pgprot_modify(vm_page_prot, vma_flags);
> >  	}
> >  	/* remove_protection_ptes reads vma->vm_page_prot without mmap_lock */
> > -	WRITE_ONCE(vma->vm_page_prot, vm_page_prot);
> > +	pgprot_write(&vma->vm_page_prot, vm_page_prot);
> >  }
> >
> >  /*
>
>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo

