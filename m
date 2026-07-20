Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BBEC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vFiPyyxqygcPr9AB+QzIanv6PSd6terHfc4F9kMV64=; b=YCNfqQNEiIGZRq18Z71Zbj2SLC
	LNP3hKhz7iEAVq7z2fbVgW/6IdcLNN7wp90mQUwdsKrPFyROkDnN1NYvMP+Ifd9meGSbPhoIZopQ3
	uXsRul87l1sbeJuCFd7G9JpLqEWyiW/PJHC/zoeRdkYcRuwUhgo6s6XTZFhaDDsT/SaT4Cqqg8U+K
	CAg6eYB/rGqyXxEGs0Cf/P/jM3pJo4fjB/dRa/HssR6LhauGoKx73aWRo1pUANeRKoDfn1YPajLOV
	eiiJluNSUuVn117HYGidszY4TamFukafmxhJAgzN7oANkakitWjJ7gdz+eONWV8Pq9o81RAWvwkBZ
	D+e2puEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqjF-00000007M4e-1nFB;
	Mon, 20 Jul 2026 16:20:29 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqjC-00000007M40-1lis
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:20:27 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47362928f65so9362831f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:20:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784564424; cv=none;
        d=google.com; s=arc-20260327;
        b=DOzNMPTvA/zMEB1SsFZjUNMwH0m1csbe3iuYpilUctK5+Xmwa7KIY230AvNJKBdyIH
         rZpvUPKtZRNbjWtLnkuzCr5igU9Qu1ccrrGI+1AJo4Nx6JdKr+5fkOGEK7Nf3/v8BFOf
         J0uPLy+zdvfwTK3Gj37lIwUghuIt8BagUfGtNCboj2ph0e54uGFvrNVeYImYCANae5Dd
         QAHM/ad2aO6t/L1w+AWzFpZCiN9B2m/fJ3MFgbUtKNY6iEDNshdplTjcv/yDr+b2v+PU
         EHEyFB7735qNbLgKbHrR8GPjD+KEJic/NYovbzWi3Z9Q+b3fMME0jnlKY5kj9q8MWnW8
         UhKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/vFiPyyxqygcPr9AB+QzIanv6PSd6terHfc4F9kMV64=;
        fh=gDN44gVyhpwFv1yi1HHH12FrQldGr5UWLeLWooAfdOI=;
        b=qU83LNaka/LCnfcGVXfgwPbFtQmDnHelCiDekb+QHxiameLlHBDmdJs674gE4S8wv9
         Y292+O+AkH3WHHuXtPx5Ey/0BoMo8eUkbKvukuUJGUaj+Fo0mj2BBGdIDOq0bY5TbOHH
         3d8PRZW0jsy1007NeouloZsfw0xiaFO6h/wk7mYDGyPtpWUpaK/Mzdvk18puPlC4Uuty
         W6uYtiizxDrWW5+ZufJJi6uupyET8rU60zZHUljaVYoKc6CehFyossjnh1SowVpQPBPl
         QBUq7WvkOmiS3lH2+YSYUBXG4G+VIrzyFSbwENNDDTiFSw+aHH7k2Zp7Q9TRww768a/F
         WBGA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784564424; x=1785169224; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vFiPyyxqygcPr9AB+QzIanv6PSd6terHfc4F9kMV64=;
        b=la61CQfZcDk1XmQ5U0ztRY1jYB4eC7BRzpQe/M4lxdl5NGxRw5/DnM9WMlTC8DWj3w
         jlDAkJ/8Qv0CWoqCmnXqbvWnH4odqu7DWVPOfo6LwViELWXdbsyHrqK3EqnX0ENyHxUR
         /YHtm6Iq0+yi7Vd+spdqiMT2oWLCcxOQp1+pQxUHhLlR917pJpKsP/r8Oq6SzwM+Us2g
         vqylZaCX3RBfm35pnEEmgt3H/7gJwEos81fmULaDnlOvW5BsFfWn0y8xNLDugouzJ/zn
         cB7AgqhJmsAskydlqj6wrEyI8D50CAEVeLLFkGdTdTVS8Nl0Wb7udy55ErRcbGh4x16V
         qvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784564424; x=1785169224;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/vFiPyyxqygcPr9AB+QzIanv6PSd6terHfc4F9kMV64=;
        b=c/W9vYzqeVYcBlHQw15LvKROJDwqppqjg7ap1VrBHS98yv92l8r6/jI+d+D3IPgMmm
         OS8nAJgvF26K2AmdOUioBB3LfSV8cu8FWhW1iYOXA2+zR6frC+5ftc3ATPLZRRNvgl0j
         b00a0iA6NzX20sOeL4Ov1BghqTZyjSyKiwtjxwBiX573c7jQSZkD+RmewdxzS8Ja7j/4
         96UUvmlN2wxh4cTTPcmJMxereqdtNwUqXu3ccUEVTA2Q5oJ4dPPNYcn2Ot5NQacPA6ij
         PmWcP/Fifsjm/G1jOwPYKF+I5LasWlibDnIOyOWyEQ6pBwHY7KDTqK8r3XXKTrXoQNC/
         DQrQ==
X-Forwarded-Encrypted: i=1; AHgh+RotM9w/0mN/mvgEG/uYP5gS470/eRS7z91B6IC5UWSDm4Fbn1ovS76c3CYJZj7U1+jCzlHFk7ODLMfC8Dm/LZx7@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg1tItfFDMYZfvAp2ltgYl47clJ6AZ8WCznzumhVdvuwYdT2nd
	7edLSfo3fgkXAwRw6aWwi/Ny1rpVABo6g8N8I2srzTRcu+XgQgTnQegiwD4zdTTXxdmn5GJBzM9
	0gozcJe6qGJ1U7RnihEj5DJ1NcD/PPbE=
X-Gm-Gg: AR+sD12VfeWqNghwVJID2aRFYMpSN41ZBpLVKcwmuVLZlwAU6s5DG51YSZYbxgPTETe
	anACzoOHAJIe0Py2TjwpbhM2CoBed+HgVxbg+QrYcEZh9H4jSloTap61k9/xMIZZh0yk+v9A2Y+
	2Ze7rLJW/dLmZ9JwNwMSLyKnPetZNZrsnEETUJMn1UAT3G2WN9RQqJOc4nApT21hCZKeePffkly
	kXJdUu9s3nJSyxXZP/lpTxokFEcj4PRzrk90BVYaJzDlOKiDMNHdtHOjlNuZ8Xi2LDNtKzFdQ==
X-Received: by 2002:a05:6000:1867:b0:474:18d9:8371 with SMTP id
 ffacd0b85a97d-47f6232f892mr18800180f8f.28.1784564423558; Mon, 20 Jul 2026
 09:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
 <20260715120813.3609949-7-jiangwen6@xiaomi.com> <fbea7f50-ee00-4466-8788-1cc78303f5bc@kernel.org>
 <e650604f-316c-48f6-8279-05c162bcdf21@arm.com>
In-Reply-To: <e650604f-316c-48f6-8279-05c162bcdf21@arm.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Tue, 21 Jul 2026 00:20:11 +0800
X-Gm-Features: AUfX_mzdfBVwd0mjN4bJsO5McXaUPCM3nRHEVhS23VrexlpfVv3MRB_TTgQn5iw
Message-ID: <CAHKocdEeYvdWq2hoot2cbJ1jhKnZbkbayRX841_gdv5gntQ4cw@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: Dev Jain <dev.jain@arm.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org, catalin.marinas@arm.com, 
	linux-mm@kvack.org, urezki@gmail.com, will@kernel.org, 
	Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, anshuman.khandual@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rppt@kernel.org, ryan.roberts@arm.com, baohua@kernel.org, 
	Wen Jiang <jiangwen6@xiaomi.com>, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_092026_497197_A8C34058 
X-CRM114-Status: GOOD (  33.71  )
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

On Mon, 20 Jul 2026 at 15:50, Dev Jain <dev.jain@arm.com> wrote:
>
> [------]
>
> >> +
> >> +    nr_contig = num_pages_contiguous(&pages[idx], max_steps);
> >> +    if (nr_contig < 2)
> >> +            return 0;
> >> +
> >> +    order = ilog2(nr_contig);
> >> +    pfn = page_to_pfn(pages[idx]);
> >> +
> >> +    /* Limit order by pfn alignment */
> >> +    if (pfn > 0)
> >> +            order = min_t(int, order, __ffs(pfn));
> >
> > Wouldn't it make sense to determine that before you call num_pages_contiguous?
> > Because then, you can just scan to that maximum instead of the given nr_pages.
>
> Right!
>
>

Agreed. I will check the PFN alignment limit first before calling
num_pages_contiguous() to avoid unnecessary scanning.

> >> +    unsigned int prev_shift = 0, idx = 0;
> >> +    unsigned long map_addr = addr, batch_end = addr;
> >> +    int err;
> >> +
> >> +    err = kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
> >> +                                         PAGE_SHIFT, GFP_KERNEL);
> >
> > Is the indentation on the second parameter line off?
> >

Will check this, thanks.

> >> +    if (err)
> >> +            goto out;
> >> +
> >> +    for (unsigned int i = 0; i < count; ) {
> >> +            unsigned int shift = PAGE_SHIFT +
> >> +                    get_vmap_batch_order(pages, prot, count - i, i);
> >
> > Having two indices, i and idx, is just confusing.
> >

How about renaming idx to batch_start? I think using i and batch_start
will make the logic much clearer.

> > The whole function is a bit overly complicated. Does it really buy us much to
> > batch over vmap_pages_range_noflush_walk() calling with the same shift?
>
> It will buy us more in the sense that, vmap() speed is sensitive to the number
> of pagetable walks. I think that is reflected by the ioremap(1MB) 1.35x speedup
> mentioned in the cover letter.
>
> In terms of callers, not sure. I would expect a caller to get the highest
> power of 2 from the total needed nr_pages, then get the next highest power
> of 2 from the remaining, and so on.
>
> For the arm64 TRBE usecase, the relevant code is the rb_alloc_aux_page() caller in
> kernel/events/ring_buffer.c. We may get multiple same order requests if can't
> get the first requested higher order.
>
> Since on the cover letter I see Wen and team have tested on boards, I lean
> towards saying it is reasonable to assume a usecase where such order
> fallback can happen.
>

Thanks. The batching is necessary because it significantly reduces
page table walks and effectively handles fallback scenarios (such as
the arm64 TRBE use case).

> But yeah the code for this currently is not so nice I agree.
>
> >
> >> +
> >> +            if (!i)
> >> +                    prev_shift = shift;
> >> +
> >> +            if (shift != prev_shift) {
> >> +                    err = vmap_pages_range_noflush_walk(map_addr, batch_end,
> >> +                                    prot, pages + idx, prev_shift);
> >> +                    if (err)
> >> +                            goto out;
> >> +                    prev_shift = shift;
> >> +                    map_addr = batch_end;
> >> +                    idx = i;
> >> +            }
> >> +
> >> +            /*
> >> +             * Once small pages are encountered, the remaining pages
> >> +             * are likely small as well.
> >
> > "small pages" is odd. Maybe
> >
> > "Once we fail to batch pages, we expect to fail batching for all remaining
> > pages, so just give up."
> >

Will update the comment.

> >> +             */
> >> +            if (shift == PAGE_SHIFT)
> >> +                    break;
> >> +
> >> +            batch_end += 1UL << shift;
> >> +            i += 1U << (shift - PAGE_SHIFT);
> >> +    }
> >> +
> >> +    /* Remaining */
> >> +    if (map_addr < end)
> >> +            err = vmap_pages_range_noflush_walk(map_addr, end,
> >> +                            prot, pages + idx, prev_shift);
> >> +
> >> +out:
> >> +    flush_cache_vmap(addr, end);
> >> +    return err;
> >> +}
> >> +
> >>  /**
> >>   * vmap - map an array of pages into virtually contiguous space
> >>   * @pages: array of page pointers
> >> @@ -3600,8 +3678,8 @@ void *vmap(struct page **pages, unsigned int count,
> >>              return NULL;
> >>
> >>      addr = (unsigned long)area->addr;
> >> -    if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
> >> -                            pages, PAGE_SHIFT) < 0) {
> >> +    if (vmap_pages_range_batched(addr, addr + size, pgprot_nx(prot),
> >> +                            pages) < 0) {
> >
> > Nit: single line would make that nicer to read.
> >
>

Once you confirm, I will send out a diff to address all the points
mentioned above. Thanks again for the review!

Best regards,
Wen

