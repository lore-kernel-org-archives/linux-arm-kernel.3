Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AC8EA3C20
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 10:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/CrLVrNrD/BoMaAhUshUQsHT/vPQb3nnMxgKIza7ds=; b=xnuL+HWAeRoedHSmbP0k9T4hhC
	7pyAk08KoWZhbnsIx0QNnRJwdxEyiwe2EsKHTLaL5MKTg9Fx32xE+BE+g54VLgnB1d0hQaaq40P/m
	+qJnrQNr0K1u+z6VS13gJs+e47dex6E+thtrvHBKqlqqb/DB49JEnQAc+mIXf8ZwPdrR3MUh4TiIY
	Y5dARCnWd5WXiTfTRDuESNVH3/ql7PDioV/Q8GAnsl9O0tC9wJUUKhT5xTu0m3dPQ5ZYPvk3ShMYA
	ZUTipr4mcaYNSvGxSfu/fd1hPwUxW8TgU+rkiQ39wdHNW8qfntDyfw/z8fN+RS2Mfd0ZCtDMZj65/
	ifndtXjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmUk-0000000A9ER-3W8K;
	Thu, 09 Apr 2026 10:20:19 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmUi-0000000A9D4-3SdN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 10:20:18 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-38cd00b3b12so5476011fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 03:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775730014; x=1776334814; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u/CrLVrNrD/BoMaAhUshUQsHT/vPQb3nnMxgKIza7ds=;
        b=bHk5h/1T8mFk9tCy7DQkwxh2HBe78bb6KaxqG4Rb3Bl31WSnDwF/ooEHXpSFYNIN31
         cEWxsjtWAq4stO0Wwt1+RbR4ZHG956g64WZ57ECm5w1YAvs+QVOTXWImgk1n5T4OSnZ0
         yvQBp1bCXajAF6Tn9OgJVfO5Acgpzppy4/rgxiY7bkKEIrI/QzD4EcAsGhCu7KQ2aJrO
         JpDoynN3suw1vbNGRtAd7Ovoq85kODnIUspaNYKrHN0JTtRFJqmuHlua+6eXsvFnRl+m
         Tl6+gYElC8hOCUmWc+zTlY78tmHLsaqflFQbbqgyD7aeJZx+QyD9sqWwmVb/u1lRYVk8
         Tu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775730014; x=1776334814;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u/CrLVrNrD/BoMaAhUshUQsHT/vPQb3nnMxgKIza7ds=;
        b=CWlMYMXVU5Yt/mv3f3HOWZFeIRF0L0rREpLAE8Tv528ghdYHu7D88irD+luwOomHoT
         n7vhlbXT3MS1s1/HIe++DPCJwU+LH/cV1LRJoC1IWvUc3x1M3kvLoihNIHPMahyRCAxx
         v3abOsaLbijuiuQwfx5YtvY2lrDdSYpgo5KjZ/F0kfgUKywx3g8advx3ILRAPR3hj+rQ
         /rWSbsgT590lhaHg/SKp4hTxZVaHp5vpfr5lFptg8+nYSSzlbcEQUqJFFNCST+5Pw/9l
         dOS/sqHH+TSp4XDfVrAN5mMdS+mNCIVsACSYvI7a0u9XYvl3pu9ohT97tiyRSN0i9hhn
         9ung==
X-Forwarded-Encrypted: i=1; AJvYcCVbdbva2TQYp8lVhuAEXkcwMq03KqPatTpnkELIhdynJM2nKfzUkXuOAMI3JkWkdj835AcpAAGscKf8zXbvUaEw@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb3nyYr8nOTuqUpPq1rO7S9py4vNSGqPA2yhAn8hN1ceimWO4K
	FxwUZ6xeX02SiYxOp/T4Dwpk8EQNaeklh15FIXnD5pWS2RTAohV8hG+c
X-Gm-Gg: AeBDieuis6Byxfa23ZkSRT3Fu5QkM2jpdJpbFCPEALurvf03A8QftAXizqiUAaBg7ZA
	22867XQqLOMw9UULEvl8iscQPjkW9iGbDbdDuK+hZ/Hp+cF4TxF8xrzHqQ2/Aq/4CRV9ZDGjQf2
	kEVr9M3IOws7ulogCe9h97ksc7YrZaf/7K9QsPvqHNIxpSPEZlc2BbRnekZdmYP2qs+HAcG6a/O
	+HBpn6gwYkhxs/TYenzMdb+2VDjnvrbPJKB1jwURrd6MgDO2iv3csMEQ6au1I+3E+A6gzi1vbVl
	y22OtOhpPi+R9fED0kjvIk5PkMX/OYHR9pkXkfuiFKDyvGOwhAETiGfpB7nEmY9glJHsrh4pbcV
	GxeW3wh2g7/0c8CXDb7f8msyFbEDy0XN00NlBm8wvqWeS0WGV7PqFRVzmgCsKVtqG
X-Received: by 2002:a2e:bc27:0:b0:38a:5402:a9e9 with SMTP id 38308e7fff4ca-38d8d37ac6emr83380891fa.5.1775730013964;
        Thu, 09 Apr 2026 03:20:13 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd215cc94sm48932641fa.35.2026.04.09.03.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 03:20:13 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 9 Apr 2026 12:20:12 +0200
To: Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, akpm@linux-foundation.org, urezki@gmail.com,
	linux-kernel@vger.kernel.org, anshuman.khandual@arm.com,
	ryan.roberts@arm.com, ajd@linux.ibm.com, rppt@kernel.org,
	david@kernel.org, Xueyuan.chen21@gmail.com
Subject: Re: [RFC PATCH 5/8] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
Message-ID: <add9XGTYL9sYilqO@milan>
References: <20260408025115.27368-1-baohua@kernel.org>
 <20260408025115.27368-6-baohua@kernel.org>
 <c54e12b0-1a35-48e1-b243-991de246a8ca@arm.com>
 <CAGsJ_4yL3Y1Sr0MjTd6=ROC0jKf4JkCqNPODMh-m155rUFcS9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4yL3Y1Sr0MjTd6=ROC0jKf4JkCqNPODMh-m155rUFcS9g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_032016_945702_DB9FDAC6 
X-CRM114-Status: GOOD (  43.85  )
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

On Thu, Apr 09, 2026 at 05:54:55AM +0800, Barry Song wrote:
> On Wed, Apr 8, 2026 at 10:03 PM Dev Jain <dev.jain@arm.com> wrote:
> >
> >
> >
> > On 08/04/26 8:21 am, Barry Song (Xiaomi) wrote:
> > > In many cases, the pages passed to vmap() may include high-order
> > > pages allocated with __GFP_COMP flags. For example, the systemheap
> > > often allocates pages in descending order: order 8, then 4, then 0.
> > > Currently, vmap() iterates over every page individually—even pages
> > > inside a high-order block are handled one by one.
> > >
> > > This patch detects high-order pages and maps them as a single
> > > contiguous block whenever possible.
> > >
> > > An alternative would be to implement a new API, vmap_sg(), but that
> > > change seems to be large in scope.
> > >
> > > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > > ---
> > >  mm/vmalloc.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++--
> > >  1 file changed, 49 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index eba436386929..e8dbfada42bc 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -3529,6 +3529,53 @@ void vunmap(const void *addr)
> > >  }
> > >  EXPORT_SYMBOL(vunmap);
> > >
> > > +static inline int get_vmap_batch_order(struct page **pages,
> > > +             unsigned int max_steps, unsigned int idx)
> > > +{
> > > +     unsigned int nr_pages;
> > > +
> > > +     if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP) ||
> > > +                     ioremap_max_page_shift == PAGE_SHIFT)
> > > +             return 0;
> > > +
> > > +     nr_pages = compound_nr(pages[idx]);
> > > +     if (nr_pages == 1 || max_steps < nr_pages)
> > > +             return 0;
> >
> > This assumes that the page array passed to vmap() will have compound pages
> > if it is a higher order allocation.
> >
> > See rb_alloc_aux_page(). It gets higher-order allocations without passing
> > GFP_COMP.
> >
> > That is why my implementation does not assume anything about the property
> > of the pages.
> 
> If you’re asking about support for non-compound pages, I think
> that’s fine. My current use case is dma-buf, where pages are
> compound. I recall discussing this previously with David and
> Uladzislau.
> 
> If you’re working with non-compound pages, I’m happy to add
> support in the next version. I’m also happy to reuse some of your
> code and credit you as Co-developed-by if you’re willing. I actually
> prefer your __vmap_huge() name over my
> vmap_contig_pages_range().
> 
> Does that make sense to you?
> 
> >
> > Also it may be useful to do regression-testing for the common case of
> > vmap() with a single page (assuming it is common, I don't know), in
> > which case we may have to special case it.
> 
> I agree, so I had Xueyuan test single pages and highlighted this
> in the cover letter. There is no regression: "vmap() is 5.6×
> faster when memory includes some order-8 pages, with no
> regression observed for order-0 pages."
> 
> >
> > My implementation requires opting in with VM_ALLOW_HUGE_VMAP - I suspect
> > you may run into problems if you make vmap() do huge-mappings as best-effort
> > by default. I am guessing this because ...
> >
> > Drivers can operate on individual pages, so vmalloc() calls split_page()
> > and then does the block/cont mappings. This same issue should be present
> > with vmap() too? In which case if we are to do huge-mappings by default
> > then we can do split_page() after detecting contiguous chunks.
> >
> > But ... that may create problems for the caller of vmap() - vmap now
> > has the changed the properties of the pages.
> 
> I don’t see this as a problem at all. Splitting pages does not
> affect physical or virtual contiguity; it only changes the
> contents of struct page objects, not the PTE/PMD mappings.
> For ioremap, there isn’t even a struct page, yet the mappings
> can still be huge.
>
It would be good if you could combine the work together with Jain.

--
Uladzislau Rezki

