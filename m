Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255C9C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 04:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dS/3xl587WkmsMSn7jSfCRAJknBipZrHMmNnsRrAvn0=; b=sb51gy35WPgB0QrsOxllP+uKf5
	z+SUmHPwdwptKDEKe+xaB8OdQ00eVSK/i5Sms/Yu5KcNHFB0kQMtf5LfRUQ+Y1QOZIUYUMNQ7HN4T
	xmMDORvq8XIztG46Mwc5QdYMiLDbcw0oGHp28846fj7R9iMTQLKiioeAgy5kAz0JaQHJVY/mkYPlq
	86OuEhGNKoDrX1YJQwlTOvBaTY6MfVss1tmuYQgjyLJNSzna6nhHp4GJ+Jks5XFN7EoCUzamaahZ3
	2MA/++TYYWG8F8OTcAQUiJBm6eWW1XYoSTJgbyWP+FLmAGsXHLOOrKqS6vSrLRkpEKkF0cvD5E60P
	SG4dX6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x73Kf-0000000AXzU-3YGu;
	Thu, 17 Sep 2026 04:02:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x73Kc-0000000AXz8-1JZc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 04:02:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7ABF1476;
	Wed, 16 Sep 2026 21:02:36 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7FC83F7B4;
	Wed, 16 Sep 2026 21:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789617760; bh=pvRE23ivxd9BXCfxEuHJgM+rJ6GOZz+syS/Pgj8gpR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBJ1WsLFSDfD9zO4hIbZuImbAbY2/Ig1hMvMo3Wbk7+hngEkxgy28wy/ZxxPf5vI0
	 d+zOHmasm2jaRAfC67ZhqbOytBK3+dNgBBgQFSdXdQpx9G9kndvMqNwamAqXhQpcWs
	 b0yuJgaUEjzp51JEEt6yp3d8Spvn1PHwYnv9ZeVM=
Date: Thu, 17 Sep 2026 09:32:36 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: [PATCH V2 01/14] mm: Add read-write accessors for vm_page_prot
Message-ID: <lhvfz6htwibeee2xgnp2sdfh474lmklooep3e6c6467kegtxu4@jejzhb4jlekh>
References: <20260907035030.2839978-1-anshuman.khandual@arm.com>
 <20260907035030.2839978-2-anshuman.khandual@arm.com>
 <69a7987f-15fb-4793-81b6-cc436525224e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69a7987f-15fb-4793-81b6-cc436525224e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_210242_541635_2DA147B0 
X-CRM114-Status: GOOD (  23.06  )
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

OK - will change.

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

Could you please elaborate ?

AFAICS both these helpers vma_get_page_prot()/vma_set_page_prot() are already present.
Are you suggesting to change vma_get_page_prot() instead ?

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

