Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B71CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/FSvKdD0Rw1UPKEmYKGjjwHZIO5Pn+E96++Oh5YfMs=; b=QyIvxF7M5yMCGi0nH7MJqdO+yG
	SHAvp5in517/FoQQatQ5Oa84RB/wP7QRRvlHFGL9KRPVvtLu3BU7vNvDZaOhXybR5in/LmP7AluXT
	1SzldTb9VJ0GkX9mgQX9HT9CvfzpMXRNEa+lszN5H3akJur1nRlcZ+7pcLlgdfqZt3XXDRZ+5eVpF
	X3V4huOhOHwXefCkk/iRtkAMwlzCFNPcBk4iW+a6ivLFvvFbaCZ7RlYf9GUEY0Jg9QzVyAT+gXNe0
	GYTdBb+k+2BN2SO7NRAda+gvrtqxol2rilfl1zUl7goSZ+E8UGzQHvhtabv5xUqJealjnXn1cbKOD
	Zf3cBZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ74-00000009bFj-1dff;
	Thu, 01 Oct 2026 15:54:26 +0000
Received: from mail-ej2-x0f.google.com ([2a00:1450:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ71-00000009bCt-25Nf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:54:25 +0000
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c2e27d11f43so121301566b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 08:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870062; x=1791474862; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t/FSvKdD0Rw1UPKEmYKGjjwHZIO5Pn+E96++Oh5YfMs=;
        b=U+4BUGKcXjqKm63I5e4bv1hyLjD53gjSfVUHaF5x9Ch3fRLXX6xQrE2f5WgM+G7C6J
         usELjT0Ov4+2ASoYEI8S+GrFLay3s7ixppFaBj4FTM6HSfXFPR33zI/Eod9UFCc73PSK
         dC2nr96GF4IUhlX1ncBYpRLCwzEn391ZYc+zAo+jm3DmAI1gXWFRZFoNKzh8C/BLDI0e
         uQJ9DzsufA5VOB+b/XwqTZNC6ItjBv7SdcwLRqbKz6P2A/VUvOYNxS3Bh59I+JpMFda+
         95Gg9/k3Smf7ilblzGYCFv3AL7h1aE3r+7eBaxi1WmcbgDh90jgwJXSY+qIrGo0dCh9/
         4IAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870062; x=1791474862;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/FSvKdD0Rw1UPKEmYKGjjwHZIO5Pn+E96++Oh5YfMs=;
        b=uF09uHmXW0SvaMaPk9V7IViCod8UVkn1Em2o1Kd7B1Cb2ftxDU7ezkHuMIeXL5lVfV
         nCdYNtS2WwxgNQfOwUR91WBXXnVWnzY+gkFkQZCuRiPwxky9cj8UN6j+K4fOTm1CCvVh
         dcJb36Q9LC5x4/VesUBXsZhLnELg3k8DX20yqBpmYUkhaso12QdtN9SNokPBhgQM1LTb
         +ObFS3WYP6wBVOHfCbdEHk6V0WJQhRKXZgn3RgzFSfudv4NkJqpifraAaDz6LqV4/LHb
         nFKHjtWi7ixgWP4hGFA25BAiFGr/jrtsaWCTiCjYOalvvRQlGRCOLJ/A8WvE0LkGB2sb
         QsoA==
X-Forwarded-Encrypted: i=1; AKwUvBxNREriMT647MtxqyKIgaHzh726jXLNSa1Ni9ByGaVLqa3ARUZwXQ27l491w/ZmZpnojM1DumDK77zckutY4asv@lists.infradead.org
X-Gm-Message-State: AFuF++ke7MHXueKTkznogpVZEE+ycnG6yvlsDH+mRa06ryYF2mmAFCl/
	0oRBQtPjbGuShSKcN13/p7xPldwgtLpEbVe/Pd3gF/NOVvKnQxBmvuiTFzKF2I8ca5k=
X-Gm-Gg: AYBFou1T7/pSyWdj6baEaaeT0H9B3hP75/6RZCvMoGMixtydUFRNZRwH1QeItS66m8i
	lUsyzLe/BrPUXfpClL5xFZvMUUWP7lzptFnDsFNv/Y489qLs9zYmGUJLiU/eQQxPLRn2ZtiDrts
	LUFntc2Xbfu4Dr+n0AgjBeBqd5TrFqY65ktxGHHVUmt8obKzbkRrin4ZuhGJ1EEliyu9tPm5rdj
	DenVxB3qRDJkISHBfXd84NzM8tb/3M7n8+bJ+Qp1Po1DI9a8mPj4gJYRcYDp5FJ9x3eNwfUuxWG
	wBMsL9mR1kJkdV2FzIt7+jxWXvHKvfq3kxB9ENpSvFjsABmKdfOjcFrs8dAL+D28tyU3A3CLApU
	RIGbbc/fHEtsE06juoNdxwnVoy2Ogx85X1reVram+iMzPbjpON6oB/K5Ti1ex2m2YZ0jRx76ylC
	qmFfXTQu7mxwtmvoCZWwCeGiF9pQNw3z5Ux8E=
X-Received: by 2002:a17:907:d87:b0:c2e:4397:7c82 with SMTP id a640c23a62f3a-c2e4aa6562dmr2262966b.6.1790870061590;
        Thu, 01 Oct 2026 08:54:21 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31cf0d6esm183317366b.37.2026.10.01.08.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:18 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 1 Oct 2026 17:54:15 +0200
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, akpm@linux-foundation.org,
	catalin.marinas@arm.com, linux-mm@kvack.org, will@kernel.org,
	Xueyuan.chen21@gmail.com, ajd@linux.ibm.com,
	anshuman.khandual@arm.com, baohua@kernel.org, chleroy@kernel.org,
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com,
	leo.yan@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	rppt@kernel.org, ryan.roberts@arm.com
Subject: Re: [PATCH v9 06/10] mm/vmalloc: extract vmap_set_ptes() to
 consolidate PTE mapping logic
Message-ID: <ar6CJ9pWSEB8fAcC@milan>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
 <20260923062832.479455-7-jiangwen6@xiaomi.com>
 <ar0fJcjNmGGV6uFu@milan>
 <CAHKocdF43Rqnt8-v0WP-t=Dxz2sSJ9xpyjLAYc2fzzKAW1_N8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHKocdF43Rqnt8-v0WP-t=Dxz2sSJ9xpyjLAYc2fzzKAW1_N8A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_085423_572991_75D6C506 
X-CRM114-Status: GOOD (  27.99  )
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

On Thu, Oct 01, 2026 at 03:58:21PM +0800, Wen Jiang wrote:
> On Wed, 30 Sept 2026 at 22:39, Uladzislau Rezki <urezki@gmail.com> wrote:
> >
> > On Wed, Sep 23, 2026 at 02:28:28PM +0800, Wen Jiang wrote:
> > > Extract the common PTE mapping logic from vmap_pte_range() into a
> > > shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
> > > PTE mappings in a single function, preparing for the next patch which
> > > will extend vmap_pages_pte_range() to also use this helper.
> > >
> > > No functional change.
> > >
> > > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > > Tested-by: Leo Yan <leo.yan@arm.com>
> > > ---
> > >  mm/vmalloc.c | 36 +++++++++++++++++++++++++++---------
> > >  1 file changed, 27 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index fb757d95bde25..d475e52110e4a 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -92,6 +92,29 @@ struct vfree_deferred {
> > >  static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);
> > >
> > >  /*** Page table manipulation functions ***/
> > > +
> > > +/*
> > > + * Try contiguous mappings at the PTE level for arches which support them, and if
> > > + * requested by the caller. Fall back to PAGE_SIZE mappings otherwise.
> > > + *
> > > + * Return: mapping size.
> > > + */
> > > +static __always_inline unsigned long vmap_set_ptes(pte_t *ptep,
> > > +             unsigned long addr, unsigned long end, u64 pfn,
> > > +             pgprot_t prot, unsigned int max_page_shift)
> > > +{
> > > +     unsigned long size;
> > > +
> > > +     size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
> > > +     if (size != PAGE_SIZE) {
> > > +             pte_set_huge(ptep, addr, PFN_PHYS(pfn), prot, size);
> > > +             return size;
> > > +     }
> > > +
> > > +     set_pte_at(&init_mm, addr, ptep, pfn_pte(pfn, prot));
> > > +     return PAGE_SIZE;
> > > +}
> > > +
> > >  static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> > >                       phys_addr_t phys_addr, pgprot_t prot,
> > >                       unsigned int max_page_shift, pgtbl_mod_mask *mask)
> > > @@ -100,6 +123,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> > >       u64 pfn;
> > >       struct page *page;
> > >       unsigned long size;
> > > +     unsigned int steps;
> > >
> > >       if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
> > >               return -EINVAL;
> > > @@ -120,15 +144,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> > >                       BUG();
> > >               }
> > >
> > > -             size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
> > > -             if (size != PAGE_SIZE) {
> > > -                     pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
> > > -                     pfn += PFN_DOWN(size);
> > > -                     continue;
> > > -             }
> > > -             set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
> > > -             pfn++;
> > > -     } while (pte += PFN_DOWN(size), addr += size, addr != end);
> > > +             size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
> > > +             steps = PFN_DOWN(size);
> > > +     } while (pte += steps, pfn += steps, addr += size, addr != end);
> > >
> > #define PFN_DOWN(x)     ((x) >> PAGE_SHIFT) - how many pages covers the size.
> > Replace steps by nr_pages or nr_ptes?
> >
> 
> Agreed, I'll use nr_pages. Since vmap_pages_pte_range() in the next patch has
> the same "step = PFN_DOWN(size)" pattern, I'll rename it there too.
> 
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki

