Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18D5CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YG6o6wTRxoEQtd5iQEcu4HXOz2uoJ4yfyWYLykx9lM=; b=1ESASDNioXK3SXhrkVfG9RQQFq
	KBhskuQM5IiHiwVoLlnNp6Ji7e+M8hyjhUZed2DEzZGojuq7HgrSPYrGWPjNmzNvWAlkUjx2MmtXA
	+fxqGcOJUm+OvFy4nNa5gMfvs32bnjV9LrFvShyVB017VyjVXRw/ZZdGcspF8c0aJ8O9dt7+T2ipk
	h7bMSCJ8WcFiP6on8SX/57jcf7nVBSJuS68oHBbt6St79Lzfbv/luCRIMxvPPjGrETCLQfUS0lIoI
	jbg+RwtEhCDjGw6mCnZtFTBEX8kNGn7VyOt1HDidXEd4QVZ83XinaE5mHmJDnAr+rJxCwHy1ezG5A
	qmmld9wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ1D-00000009a9j-0Xpl;
	Thu, 01 Oct 2026 15:48:23 +0000
Received: from mail-ej2-x0f.google.com ([2a00:1450:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ1B-00000009a94-1CLT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:48:22 +0000
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c2e20bb4583so303800966b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 08:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869698; x=1791474498; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1YG6o6wTRxoEQtd5iQEcu4HXOz2uoJ4yfyWYLykx9lM=;
        b=UjBbwFPpaqY16BqNSSrP2lopDMaTzoZqWfkDMSnUF07C3AieGtIQdL4FZUh2i0PWD8
         qKOr+GxMzlSaCVsqkP1D0bcaj3SsD9AXci5W7OHDtWa8RS4aniL0xessjgJ4VWtaKnf4
         ZlzswsmxxhqelXeE6Anhfs/5RkJ5MXONRkLuATcX3wzehPPfS2xwYniY58g82h3oXnKz
         XqmLXqn6QwLdZURo+jMcAyhby7IMLyAS6xWb0331B1374F0Y8BpDDBkkJKOhDKfITVi3
         ADCLsmUGHlsxv/p7tdSDIEESkS/HT94h1trRAnUeXJjqlPK2MWEkAfawkokeaHXmDEh4
         eR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869698; x=1791474498;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1YG6o6wTRxoEQtd5iQEcu4HXOz2uoJ4yfyWYLykx9lM=;
        b=bASHr48bDsaG+KRNR/L8xlxG/g63OsQLobCBDklbU3FmBf1fZ1hT6k0a4wIFOd8DLg
         viSqC1B+UezIkV7XqbMLoKMucHJjsdcVgZpReHv7eYaJvvLBdLdRyXnYH22tZ/dREoju
         houPuYPpU+zu8X0C2SoEppg3m3aI+sModTLtFOlRtWgznuVp8WZOy3aqzgFQKOwyniJs
         gRAlbue7BfeA6m+VdSG5awP4ygg20srTJsrU8upbppFqBlNYOUiFLNjpfzUOeFGbz8xQ
         642aPDccbAsYwcgD1dQhTG6lF0L2xPed4UHdFMB9nCzqtv+bP7t7JkGhSEOynzrs0C7v
         yOzw==
X-Forwarded-Encrypted: i=1; AKwUvByKKXhm9r9carZMkylLSgWYrlHbfpwibO4wkwVTIIAmm0wYfiLfBO+Ft1+Os+LoEjnTWH2R+JISTrDzEK4jCHGu@lists.infradead.org
X-Gm-Message-State: AFuF++nmABzUwGRA+2RM73lH/X7xYkLWctJCAZbJGxOcTrrjl+60KjPr
	W5tRpwbWzlmhfBBHq2Ua6uHfU/VZHv5dGWRRjQTXMZdV/izsfuFzpGvF
X-Gm-Gg: AYBFou2cMCBnJBI8KDr+Ybtix6p+2xL4e6Pi9AN2YZOokln2ed3CyPL5CgMtpLq+58r
	RICPbJKyhIPXQ7PhBq0Yg8MXeoHO2eTfRl5XYmhB1UCb+W+LtUnVaQHeslIvF5/9UHKCIvT96Ty
	kw2XWpVMipdoCjaxNbIEQXaIBFeJFPdwLOaOOEgIEA9NT9uDRyxjTn9G/HnmFDk1kEPzRZw36Bw
	mV9OVP/kNdjmELVoeJLHLwULKYeaSaqbA8/ia5KXKs9ia+HWvOEsCwzjZZ7hRO+TiwGw+XUiYdu
	/XQDkDeTKEs28qhHmI9ndoPFSXOtznY5Zjh3MJ6Nz1Em25lq1isdse5FWyKpWRO14P2Ra73mSga
	kESsUOIqjZ404oqigSSzCSTRGMvzmwz01I6AVOKqeoS07qafWG3534DnCSlRfb3icg+4e97yAKe
	fv6xOrGZRrLS6wrKFo3uFqxoUKhiMpRDiVYRM=
X-Received: by 2002:a17:907:3f87:b0:c2e:856:2a08 with SMTP id a640c23a62f3a-c2e4a9b37a6mr2297866b.1.1790869697837;
        Thu, 01 Oct 2026 08:48:17 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d87bdfsm180664666b.57.2026.10.01.08.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:48:05 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 1 Oct 2026 17:48:00 +0200
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
Subject: Re: [PATCH v9 09/10] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
Message-ID: <ar6AsIvAviFFQjEh@milan>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
 <20260923062832.479455-10-jiangwen6@xiaomi.com>
 <ar0lMkKxugZV7xyw@milan>
 <CAHKocdEqnCCyW1TgmiRotFO0hQdHt7pXP1sdqzZ7Up6wc+-Bsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHKocdEqnCCyW1TgmiRotFO0hQdHt7pXP1sdqzZ7Up6wc+-Bsw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_084821_493706_B15B288C 
X-CRM114-Status: GOOD (  34.90  )
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

On Thu, Oct 01, 2026 at 04:09:24PM +0800, Wen Jiang wrote:
> On Wed, 30 Sept 2026 at 23:05, Uladzislau Rezki <urezki@gmail.com> wrote:
> >
> > On Wed, Sep 23, 2026 at 02:28:31PM +0800, Wen Jiang wrote:
> > > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> > >
> > > In many cases, the pages passed to vmap() may include high-order
> > > pages. For example, the systemheap often allocates pages in descending
> > > order: order 8, then 4, then 0. Currently, vmap() iterates over every
> > > page individually—even pages inside a high-order block are handled
> > > one by one.
> > >
> > > This patch detects physically contiguous pages (regardless of whether
> > > they are compound or non-compound) by scanning with
> > > num_pages_contiguous(), and maps them as a single contiguous block
> > > whenever possible. The mapping order is determined by taking the
> > > minimum of the contiguous page count and the pfn alignment, allowing
> > > graceful degradation when pfn alignment is less than the contiguous
> > > range.
> > >
> > > Pages with the same page_shift are coalesced and mapped via
> > > vmap_pages_range_noflush_walk() to avoid page table rewalk.
> > >
> > > As users typically allocate memory in descending orders (e.g.
> > > 8 → 4 → 0), once an order-0 page is encountered, we stop scanning
> > > for contiguous pages since subsequent pages are likely order-0 as well.
> > >
> > > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > > Co-developed-by: Dev Jain <dev.jain@arm.com>
> > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > > Tested-by: Leo Yan <leo.yan@arm.com>
> > > ---
> > >  mm/vmalloc.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++--
> > >  1 file changed, 80 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index a43965016eb4d..37cddb7f45a4f 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -3576,6 +3576,85 @@ static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
> > >       return arch_vmap_pte_supported_shift(size);
> > >  }
> > >
> > > +static inline int get_vmap_batch_order(struct page **pages,
> > > +             pgprot_t prot, unsigned int nr_pages)
> > >
> > get_vmap_mapping_order()?
> >
> 
> Agreed, that's a clearer name.
> 
> > > +{
> > > +     unsigned long pfn;
> > > +     unsigned int nr_contig;
> > > +     int order;
> > > +
> > > +     if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> > > +             return 0;
> > > +
> > > +     /* Limit nr_pages by pfn alignment */
> > > +     pfn = page_to_pfn(*pages);
> > > +     if (pfn > 0)
> > > +             nr_pages = min_t(size_t, nr_pages, 1UL << __ffs(pfn));
> > > +
> > > +     nr_contig = num_pages_contiguous(pages, nr_pages);
> > > +     if (nr_contig < 2)
> > > +             return 0;
> > > +
> > > +     order = ilog2(nr_contig);
> > > +
> > > +     if (vm_shift(prot, PAGE_SIZE << order) == PAGE_SHIFT)
> > > +             return 0;
> > > +
> > > +     return order;
> > > +}
> > > +
> > > +static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
> > > +             pgprot_t prot, struct page **pages)
> > > +{
> > > +     const unsigned int nr_pages = (end - addr) >> PAGE_SHIFT;
> > > +     unsigned int prev_shift = 0, batch_idx = 0;
> > > +     unsigned long batch_start = addr, batch_end = addr;
> > > +     int err;
> > > +
> > > +     err = kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
> > > +                                          PAGE_SHIFT, GFP_KERNEL);
> > > +
> > > +     if (err)
> > > +             goto out;
> > > +
> > > +     for (unsigned int i = 0; i < nr_pages; ) {
> > > +             unsigned int shift = PAGE_SHIFT +
> > > +                     get_vmap_batch_order(pages + i, prot, nr_pages - i);
> > > +
> > > +             if (!i)
> > > +                     prev_shift = shift;
> > > +
> > > +             if (shift != prev_shift) {
> > > +                     err = vmap_pages_range_noflush_walk(batch_start, batch_end,
> > > +                                     prot, pages + batch_idx, prev_shift);
> > > +                     if (err)
> > > +                             goto out;
> > > +                     prev_shift = shift;
> > > +                     batch_start = batch_end;
> > > +                     batch_idx = i;
> > > +             }
> > > +
> > > +             /*
> > > +              * Once we fail to batch pages, we expect to fail batching
> > > +              * for all remaining pages, so just give up.
> > > +              */
> > > +             if (shift == PAGE_SHIFT)
> > > +                     break;
> > > +
> > > +             batch_end += 1UL << shift;
> > > +             i += 1U << (shift - PAGE_SHIFT);
> > > +     }
> > > +
> > > +     /* Remaining */
> > > +     if (batch_start < end)
> > > +             err = vmap_pages_range_noflush_walk(batch_start, end, prot,
> > > +                             pages + batch_idx, prev_shift);
> > > +
> > > +out:
> > > +     flush_cache_vmap(addr, end);
> > > +     return err;
> > >
> > On error, if kmsan_vmap_pages_range_noflush() succeed you do not do a
> > proper cleanup?
> >
> > i.e. to cleanup KMSAN metadata: kmsan_vunmap_range_noflush(addr, end);
> >
> 
> The KMSAN metadata is cleaned up by the caller: on error vmap calls
> vunmap(area->addr), which reaches kmsan_vunmap_range_noflush() through
> remove_vm_area() -> free_unmap_vmap_area() -> vunmap_range_noflush().
> That is the same contract as the pre-existing vmap_pages_range() path,
> which likewise relied on the caller's vunmap() to clean up. So there
> is no behavioral
> change here.
> 
Right. With better naming:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki



