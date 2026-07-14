Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF183C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/39pAIw3xbpK7+U4L+xZrNR+VURZcoyTnPopnGzZ1Ao=; b=nrv8IrpYzPAQ2avtK7firzkF1Z
	GFKPP4THERIYh0HvW4JL92wD/n8e9fAmny5Ma46jV1PWReIWmQtHY+h+gCv73VDtLTToXwJ4nRf7n
	0RAWaBVFSLKzVjBf5yfCd9Db4BfF7ATTHdFreGB8R0uYxRg/P/drvJJi8Ss6RBgFNDzZV0AxEVNFE
	KiVdEVYq+wLCUizGHC9Rmp4sgcNcW0T6v96yntJyaqT2HGW/zfngkcBup3thvrY5f3vImS6fRiqkK
	OzqnpTIE8uAd0Ars3nN2LUkA7KJdc5Pq0vzPErLD360ruIuZqm4vzRipd28EqhjA1GXzUqx/GQd+t
	pAB7DaJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWLr-0000000B0fE-0kIg;
	Tue, 14 Jul 2026 06:10:43 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWLn-0000000B0ax-1u1K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:10:41 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493f75f7172so25373725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 23:10:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784009437; cv=none;
        d=google.com; s=arc-20260327;
        b=sbwf48iaQYQl7k3+MLQz1MH3PuBI9GMAN1Z/4NVm5L2VSi8clhlbYOCJGx75l/rr1B
         hNvqI5bFzaBjHx1gmLEc7GZL+AgSRqMT/oHkEo2/OIJijpLdsBsT8m6OWGWZMdm8ELOe
         wQ6dKFbQZJNV1D2m9AELMhgpngCrHHaouXVoMaRASj2y+C/wyxqJW1vDzoywIdgToD9e
         wJxE3gMjli2tJaP6a1kg9SrqMSJJGt1cCrStskRlH6Hwm6n26XFmipdyVOLymEWQ8Zp1
         O+YsCmR7+/sl0ihYoE1M8gZPgRDUEEYplQBOwmlLGLzB7UOuQf2YYYaS8h8n3M9s4etA
         jl0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/39pAIw3xbpK7+U4L+xZrNR+VURZcoyTnPopnGzZ1Ao=;
        fh=eH70l/k/vc9XhkBb4mnNAlEU4I2bZMqpG8J8BYQF9Uk=;
        b=HkHrJ5OLi83aJ2k6TiKIasFp+rgWLblH4WCkbIIyLaABOrAM+uhdCLYA7z+bvmzRln
         mvQxiq/nTUGw+jeZDTJCev5B3jPeMhzEy7SQwSLx04RTLIAZTw8AbPEBWvJA1K9CNZL1
         lEDo6hf7I2MFE/ys0SizGcRCrGWNjg4cCdnNP9vMA5pwEdppIy4FmqKjGOImsLOU1vdJ
         2cWnCbtevTqi9GXtFD4GKSrJP7tv2TOJL44e/OEm+2aB9Bf/4jrUBTavpEUhn0Lot5CQ
         mzpp3FbzCp0wx/mOYoTZsLM/OWllYA9i5caTz6MRGYvkJmesU0P6U3BhqH7PEsFrvRN6
         sqHw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784009437; x=1784614237; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/39pAIw3xbpK7+U4L+xZrNR+VURZcoyTnPopnGzZ1Ao=;
        b=OYyavUoKruia4QPgkgxJfA7iU7I6LP4wB1BV2+AR6t4E+KQlmn7asnk+N5VLjYTzoC
         0VPSBnM5O/mb3xywr+QMttdRelqvTa6/XYXp3Peicr/1XVC9/TKoBbAsD2iYO4alKynw
         iDGQL/lONdCwMFtU2yyZmCxeg+frWKxCVM++qSUseOhC7eeNkzOtGnljorhOMd5zVkXU
         q7tOJ9HKZd8ME5q3K5qdcPGl63Uvw0nh3vbwYUjHBpB3r/LdXH2WnA8FSBYPx2ktDv4T
         mbbijrrHGSLlOp/vM8N9sSEZmXBsrM5MfpB23iq7ECRVZhbSr1DhVJ4TLvOcOsJKkqQz
         aqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784009437; x=1784614237;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/39pAIw3xbpK7+U4L+xZrNR+VURZcoyTnPopnGzZ1Ao=;
        b=EAu/H1QQ2WSeXKRQjUXGYcykif0xTgASfjdkVUUoyVEXvrXea5buWFWlxb4OapwCtc
         zsXLhp2LCmo9Ap+Wt4WYOI0REDzDlGhPRI9OW6psFCkTRqd5Xpw4hBd83QQjnlHRWC45
         u+mEHeWoGgFVYYuzLeOVfiCPeB3aVEGbrZA2tRiF7DSUq/XnLiQhpb0C3il18UP2V6tF
         E7KOkHxboTVdY52gxVzMDi4UBEefaSjOfnyxY3D3/MWwqeZOEpgfY5F4A4jDG+uKm6Z+
         YV9ONWxB9KSCjb2EqLN90Xf18a8J1UwEIAColHEcxdUTyuQpWeLNq3NC52hXMPAiNN6g
         Pseg==
X-Forwarded-Encrypted: i=1; AHgh+Rq0MUbXRuhmz8A9DYo/4AnAS4km4XaCLBDB5JQcgV8S4iWdjtk9v3LDpgtZm8uHFNrDHmEGffm1FhRxAltu/VTn@lists.infradead.org
X-Gm-Message-State: AOJu0Yy80giDaRXKMhucfHK/plcZV8cvOLioqoNwSyeRVtKpFwtjX9VV
	yIrchKMtieE/2LZmKGpgxqZecT3BMltd8rIUndwCeUTMYuvtW4t3tvkWpQibF0tCuSu/sSWKZ6k
	ZqG3mLUD83qX2sbdzg2bxMIXIVG2sxDI=
X-Gm-Gg: AfdE7cnaYMUDg0nEaFx1matZtq9R8Jv7OyKaSYEdrva+3UA72BI0jLm7vg16+yWluvz
	LP8KaqrL0Hd4bZ4eVmNhGWXjbt1NbUUrlB0h1rdsi7o4S+Q+6qeXtzMszBRDI9qvPLrmgsD/ShN
	Nes5jB+7gaBz95Op2iqpq6Ao4ZVMJxbRxoKMgzcn+ThPgq5+obiu6009xlfaSVV1YsCwarZk5hG
	iMAgIUXD+4/OsHfr5pvsZUo0C1wjwwhRb5/ji9bhdWehlSfWCXJzQX/NbUeC61hhdRHGSzMrA==
X-Received: by 2002:a05:600c:5392:b0:490:b00c:8e6a with SMTP id
 5b1f17b1804b1-493f8826bbfmr118663245e9.28.1784009437267; Mon, 13 Jul 2026
 23:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260709073823.6643-1-jiangwen6@xiaomi.com> <20260709073823.6643-5-jiangwen6@xiaomi.com>
 <85a3a79a-2a78-47ed-bd93-48e8f1967551@arm.com>
In-Reply-To: <85a3a79a-2a78-47ed-bd93-48e8f1967551@arm.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Tue, 14 Jul 2026 14:10:25 +0800
X-Gm-Features: AUfX_mzEw4BXfhOZBlRoqj1kqHJs057Yw2Bpm2f01kvdPVQVUYHHnqLAY8wPhow
Message-ID: <CAHKocdH0KYPaqkTOEE7n8vX4BFdgPvVbRsh3Vtb6MtvmCTn4XQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] mm/vmalloc: Extend page table walk to support
 larger page_shift sizes and eliminate page table rewalk
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, david@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rppt@kernel.org, ryan.roberts@arm.com, 
	"Barry Song (Xiaomi)" <baohua@kernel.org>, Wen Jiang <jiangwen6@xiaomi.com>, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_231039_525998_DEA4882C 
X-CRM114-Status: GOOD (  24.44  )
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

On Mon, 13 Jul 2026 at 21:49, Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 09/07/26 1:08 pm, Wen Jiang wrote:
> > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> >
> > vmap_pages_range_noflush_walk() (formerly vmap_small_pages_range_noflush())
> > provides a clean interface by taking struct page **pages and mapping them
> > via direct PTE iteration. This avoids the page table rewalk seen when
> > using vmap_range_noflush() for page_shift values other than PAGE_SHIFT.
> >
> > Extend it to support larger page_shift values, and add PMD- and
> > contiguous-PTE mappings as well. Rename it to vmap_pages_range_noflush_walk()
> > since it now handles more than just small pages.
> >
> > For vmalloc() allocations with VM_ALLOW_HUGE_VMAP, we no longer need to
> > iterate over pages one by one via vmap_range_noflush(), which would
> > otherwise lead to page table rewalk. The code is now unified with the
> > PAGE_SHIFT case by simply calling vmap_pages_range_noflush_walk().
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > Tested-by: Leo Yan <leo.yan@arm.com>
> > Reviewed-by: Dev Jain <dev.jain@arm.com>
> > ---
> >  mm/vmalloc.c | 81 ++++++++++++++++++++++++++++++----------------------
> >  1 file changed, 47 insertions(+), 34 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index d7fef85b241c4..d2a4d649af549 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -125,7 +125,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> >       pte_t *pte;
> >       u64 pfn;
> >       struct page *page;
> > -     unsigned long size = PAGE_SIZE;
> > +     unsigned long size;
> > +     unsigned int steps;
> >
> >       if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
> >               return -EINVAL;
> > @@ -147,8 +148,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> >               }
> >
> >               size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
> > -             pfn += PFN_DOWN(size);
> > -     } while (pte += PFN_DOWN(size), addr += size, addr != end);
> > +             steps = PFN_DOWN(size);
> > +     } while (pte += steps, pfn += steps, addr += size, addr != end);
>
> I think I had also recommended to put these vmap_pte_range() changes
> into the previous patch.
>

Hi Dev

I put this change in patch 4 following Uladzislau's earlier suggestion:

https://lore.kernel.org/linux-mm/ah3Cn3YnefIVJDo2@milan/

Uladzislau, do you have a preference on where this hunk should go?

Thanks,
Wen

