Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B6EC5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 07:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukVR+AuN0YlVKXcTRxC5DqtbC9esjl1rpJTgI/ymezA=; b=bKDqDlBYfDvut+DX/IN4Jxm1+d
	sowRD78a03+fBn1f177HI1mJGaFNUVXrv7nKinEQ9Klm6QGcsAOc7j8LK5mlHo0awbqADkXitvCZ6
	FiLuaWW5Qj8vq3VvXHl02ximRJ6QZs5Xvpe5ao7x6q1gCG/g4/VFOXRln3aekCC0Q3CY0vVWcMyXz
	iQv8gC1W8iam++x2zVQnYB6atIrCgEK11pbQ5uJ1CqL3xSficuPDUhffUWrWkr0HFToFK2Pc2Bxh5
	i+NmdhaGdc0GZUCYYD8Pmd2WDBDptCjMOyzeDFCTDh5yNgEqlHnzAMZF1m7+ShR+M+CLT/rAAqfZh
	zXY9if6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJeV-0000000CUVW-1q7e;
	Tue, 02 Jun 2026 07:35:07 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJeT-0000000CUUt-0Dkk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 07:35:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so98897425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 00:35:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780385703; cv=none;
        d=google.com; s=arc-20240605;
        b=JADV5YyeigSAcB5xTC9G+ya3yy1CpqWEQbWoCunovrOSQYb/+G+R9lBKsF56jIQIjY
         lRU+BcBRCwoP0CoYvTAlewZkH4AifFoLbecGzwviXozrzcq5Pezpoqx3M+3GNko1XKPz
         Y8peY0ntEp8p2GdHsldw7xTw8rTBN5fgXQveeGsIS5owZWMS+c0W3+0Rc/dX10whZF4j
         RQmappxa/Hf4CUOC0cIwZam7wMybmWwStYWWhdjJ7d4fSWCzCxSiHZsmttAtek+zlOY1
         53sOmxZwdzfzJwtlZFnDPMR2OUZDpSpdQXYLbdC6FpC1lSXhxLlcAAeX8OSQZsVGO0dJ
         01EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ukVR+AuN0YlVKXcTRxC5DqtbC9esjl1rpJTgI/ymezA=;
        fh=QtZL6DzqhFzysFqAIRWSPFB8UR/+rUNDDQAstqgSZDI=;
        b=MdT6woGi/S/OMRd42TuU5usDL7yBVLfcYZiZPDGcKKaQ/7AJExNBNL1EzYbZO4r8Bc
         6OG0+p5z/UeOG/e30cRbo42ujPcBwcAaJQaY/RnfpNZen2VtfG9Lv+3cgQ8iCoxhvl+d
         35zvrX1fzJFshEfLRaMUjMOgf/SAF3UMwUsWwP8Ml1iSO/rgdE9e+K/k6Sb1kZWCfFKJ
         y52tTSKo2KzCWeBBL77zaDksukp5sfz86qAY9UFxi0hhHXQj6VLnewcx+Mpo0tAL9OGW
         hKSyjubayrHdfLLv++EDVRzOMZlnmNPxnuZ1mzi8AW7jiyJSrZ8DIZIB4pEFPCNcvp4t
         FxUw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780385703; x=1780990503; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukVR+AuN0YlVKXcTRxC5DqtbC9esjl1rpJTgI/ymezA=;
        b=V+Oi/rROS7wFs2yIWYT32UAQxOxSNSM5FbiJSM8Hh/Bfdbb3A8I2IjdSJ41s0Ah+ZH
         auOXhH5rW3A4Uivc8WDwwftDmGQ2O84y6Z0lpPpGyHZyfN0M6x1nmhP5tdW1mO3fQH67
         6Cd58njhk0QPluU8ZeCPRNRnxdSm7KkH7lIcmCcmqRNPf+dP4C2TKfzjMXxl9FR82wsN
         ObxOyLnczxeQRHxIcIYePGXhtjkaCE6Q2WRq/rv1oDgNfpvYNaaqFQQ1/yV3kgN8OGCG
         MU1QSW8+enokywWLAOBMTduS1aqLbrkX9kqKMORV1+ncZglQqVZIA2RjCHh/PiwRJLOZ
         h1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780385703; x=1780990503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ukVR+AuN0YlVKXcTRxC5DqtbC9esjl1rpJTgI/ymezA=;
        b=nuIaKxo37/ccSzbXZPJIXQScEg+pC8OZQ+d4OKXJVPJTaVtD2whNFKeD14ktDgsVJg
         ok+Nl+8upsuJUcUJmwDuS1u+1lu+y1o02TgDFmqZ1tHnmxZE7ojRZEMI+z90Kn5QOykn
         LwAuZEBGzdLaD5d7CnhvmgSN5z05dFed5NSGd/z4pLfqz2WJZof9ycI/QSBIRThNFFD5
         owLXLAfCMJQgSa/5jSU9GAXC3j9lXE3o2achwYBDH5kDD2xOHYcwhFbbWBZTCsFKnith
         RZMe+jKiws12Y2KPDHOjlV9q8zC+/B2S/guHo9woDYBkeVCSww6ziiupzU2xg4Uoc6s+
         euAg==
X-Forwarded-Encrypted: i=1; AFNElJ9I8CU6/FgFELFAyzALiVpC8peC8FZHBke+o8QLFkDpFh4zLx/A+oBncGHRQ5y7/QkhtYeOdGlqaXDkRpU/sZ/G@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+GT++CB+3RZd3ZooG7W5tLqP7AlH1jXW/dfM87ZgdE7VfaqWP
	FKSPyQr2iPAMgIIdUTaUG6jUPw6pXd3JEL7GObpvRQazxfTTCO5FxXXl6rKR44hnp2J7UcgDaJf
	qyDGYeD7eMD/MjcO3dnNZV+4wpjPwk+4=
X-Gm-Gg: Acq92OHJFqR1/gGXSLEwQM5JcnLnUqbaw9aibARK2PB+EeC+PDQE5JbhpZV3u6SaSPa
	oNLtec22jd1Eb+ZymP7SIuIhJXwmT1PQ3fzTtnJ9nquNBSEgAl6BRIU62sJR29gruySqTFdKaox
	zFq0TqVSPxegtuK+AyTObRnzvxUWOfwNGAWb6ZbRp0N3encFXYeMCSnmFJfL5tfXj/u3ju+y/fi
	bM4NLg5LVyMmVCtDSZ8exj/ecPuWV3MiIbo47epv1Df4D4rZryp+aqcCU8RNZHDTNT05/udxhNq
	681pbswZvhl81L4M54g=
X-Received: by 2002:a05:600c:4755:b0:48a:76a3:2b9b with SMTP id
 5b1f17b1804b1-490a2932eeemr240653885e9.17.1780385702416; Tue, 02 Jun 2026
 00:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
 <20260522053146.83209-6-jiangwenxiaomi@gmail.com> <340c811e-2501-46c3-8a55-19e955c5ae8a@arm.com>
 <CAHKocdHOT13DHdz+DsT2BaP0EJSKdoWU2NO-wjFwB9+--CqsHw@mail.gmail.com> <176c83fb-edf0-47b3-9823-21a92ea8b4c7@arm.com>
In-Reply-To: <176c83fb-edf0-47b3-9823-21a92ea8b4c7@arm.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Tue, 2 Jun 2026 15:34:50 +0800
X-Gm-Features: AVHnY4LgVm8w4_ESczsHZQk87y_kO30ZzPvvzVwnQPOt19ls2ZKI3bcH0bmh51g
Message-ID: <CAHKocdGezCccpA3u8W2f7p2ZjyuW84b8zb7xYgt7e8BuO3RJ+w@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: Dev Jain <dev.jain@arm.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	urezki@gmail.com, baohua@kernel.org, Xueyuan.chen21@gmail.com, 
	rppt@kernel.org, david@kernel.org, ryan.roberts@arm.com, 
	anshuman.khandual@arm.com, ajd@linux.ibm.com, linux-kernel@vger.kernel.org, 
	jiangwen6@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_003505_233769_CAFDCB4D 
X-CRM114-Status: GOOD (  42.19  )
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

On Fri, 29 May 2026 at 13:57, Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 28/05/26 9:12 am, Wen Jiang wrote:
> > On Wed, 27 May 2026 at 16:28, Dev Jain <dev.jain@arm.com> wrote:
> >>
> >>
> >>
> >> On 22/05/26 11:01 am, Wen Jiang wrote:
> >>> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> >>>
> >>> In many cases, the pages passed to vmap() may include high-order
> >>> pages. For example, the systemheap often allocates pages in descendin=
g
> >>> order: order 8, then 4, then 0. Currently, vmap() iterates over every
> >>> page individually=E2=80=94even pages inside a high-order block are ha=
ndled
> >>> one by one.
> >>>
> >>> This patch detects physically contiguous pages (regardless of whether
> >>> they are compound or non-compound) by scanning with
> >>> num_pages_contiguous(), and maps them as a single contiguous block
> >>> whenever possible. The first page's pfn must be aligned to the
> >>> mapping order for the batched mapping to be used.
> >>>
> >>> Pages with the same page_shift are coalesced and mapped via
> >>> vmap_pages_range_noflush_walk() to avoid page table rewalk.
> >>>
> >>> As users typically allocate memory in descending orders (e.g.
> >>> 8 =E2=86=92 4 =E2=86=92 0), once an order-0 page is encountered, we s=
top scanning
> >>> for contiguous pages since subsequent pages are likely order-0 as wel=
l.
> >>>
> >>> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> >>> Co-developed-by: Dev Jain <dev.jain@arm.com>
> >>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> >>> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> >>> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> >>> ---
> >>>  mm/vmalloc.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++=
--
> >>>  1 file changed, 80 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> >>> index deb764abc0571..50642246f4d40 100644
> >>> --- a/mm/vmalloc.c
> >>> +++ b/mm/vmalloc.c
> >>> @@ -3542,6 +3542,84 @@ void vunmap(const void *addr)
> >>>  }
> >>>  EXPORT_SYMBOL(vunmap);
> >>>
> >>> +static inline int get_vmap_batch_order(struct page **pages,
> >>> +             unsigned int max_steps, unsigned int idx)
> >>> +{
> >>> +     unsigned int nr_contig;
> >>> +     int order;
> >>> +
> >>> +     if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP) ||
> >>> +                     ioremap_max_page_shift =3D=3D PAGE_SHIFT)
> >>
> >>
> >> Why bail out on ioremap_max_page_shift =3D=3D PAGE_SHIFT? The code
> >> path for ioremap is different from vmap right?
> >>
> >>
> >
> > ioremap_max_page_shift is under CONFIG_HAVE_ARCH_HUGE_VMAP which
> > controls both ioremap and vmap huge mappings.
>
> I don't get it. So with this patch if nohugeiomap is passed on kernel
> cmdline, then vmap-huge is also disabled. That does not sound correct.
> Currently ioremap_max_page_shift does not play at all with the normal
> vmap code path. It is only involved in ioremap_page_range().

You're right, vmap path should not be affected by ioremap. I'll remove it.

> >>> +             return 0;
> >>> +
> >>> +     nr_contig =3D num_pages_contiguous(&pages[idx], max_steps);
> >>> +     if (nr_contig < 2)
> >>> +             return 0;
> >>> +
> >>> +     order =3D fls(nr_contig) - 1;
> >>> +
> >>> +     if (arch_vmap_pte_supported_shift(PAGE_SIZE << order) =3D=3D PA=
GE_SHIFT)
> >>> +             return 0;
>
> Also, for arches where this function does not do anything special
> (i.e return PAGE_SHIFT), we will effectively not do any huge mappings
> for them.

Agreed, I'll add PMD-level handling here. Will reference your vm_shift() he=
lper.

> >>> +
> >>> +     /* Ensure the first page's pfn is aligned to the order */
> >>> +     if (!IS_ALIGNED(page_to_pfn(pages[idx]), 1 << order))
> >>> +             return 0;
>
> This condition is a bit fragile. It may happen that we have, say 2^8
> contigous pages, but they are aligned to only 2^4. We are operating
> on a page array and have no idea if the caller has passed some
> random subrange of the array.
>
> I think the purpose of these checks is this - to do an early bailout
> if arch does not support huge mappings, or the alignment is not correct,
> instead of finding this out very deep into vmap_pages_range_noflush_walk.
>
> So you could do something like (completely untested and may miss some edg=
e cases):
>
> order =3D ilog2(nr_contig);
>
> order =3D min(order, __ffs(page_to_pfn(pages[idx])));
>
> order =3D vm_shift(PAGE_SIZE << order) - PAGE_SHIFT;
>
> Where vm_shift() is the helper I had used in my patch.
>

Will adopt this approach in v4.

Thanks for the through review!

> >>> +
> >>> +     return order;
> >>> +}
> >>> +
> >>> +static int vmap_batched(unsigned long addr, unsigned long end,
> >>> +             pgprot_t prot, struct page **pages)
> >>> +{
> >>> +     unsigned int count =3D (end - addr) >> PAGE_SHIFT;
> >>> +     unsigned int prev_shift =3D 0, idx =3D 0;
> >>> +     unsigned long start =3D addr, map_addr =3D addr;
> >>> +     int err;
> >>> +
> >>> +     err =3D kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
> >>> +                                             PAGE_SHIFT, GFP_KERNEL)=
;
> >>> +     if (err)
> >>> +             goto out;
> >>> +
> >>> +     for (unsigned int i =3D 0; i < count; ) {
> >>> +             unsigned int shift =3D PAGE_SHIFT +
> >>> +                     get_vmap_batch_order(pages, count - i, i);
> >>> +
> >>> +             if (!i)
> >>> +                     prev_shift =3D shift;
> >>> +
> >>> +             if (shift !=3D prev_shift) {
> >>> +                     err =3D vmap_pages_range_noflush_walk(map_addr,=
 addr,
> >>
> >> It would be worth documenting vmap_pages_range_noflush_walk() that
> >> it can take an array of pages which are not all contiguous, but it
> >> may have contiguous chunks, as hinted by page_shift.
> >>
> >> Otherwise this looks good.
> >>
> >>> +                                     prot, pages + idx,
> >>> +                                     min(prev_shift, PMD_SHIFT));
> >>> +                     if (err)
> >>> +                             goto out;
> >>> +                     prev_shift =3D shift;
> >>> +                     map_addr =3D addr;
> >>> +                     idx =3D i;
> >>> +             }
> >>> +
> >>> +             /*
> >>> +              * Once small pages are encountered, the remaining page=
s
> >>> +              * are likely small as well.
> >>> +              */
> >>> +             if (shift =3D=3D PAGE_SHIFT)
> >>> +                     break;
> >>> +
> >>> +             addr +=3D 1UL << shift;
> >>> +             i +=3D 1U << (shift - PAGE_SHIFT);
> >>> +     }
> >>> +
> >>> +     /* Remaining */
> >>> +     if (map_addr < end)
> >>> +             err =3D vmap_pages_range_noflush_walk(map_addr, end,
> >>> +                             prot, pages + idx, min(prev_shift, PMD_=
SHIFT));
> >>> +
> >>> +out:
> >>> +     flush_cache_vmap(start, end);
> >>> +     return err;
> >>> +}
> >>> +
> >>>  /**
> >>>   * vmap - map an array of pages into virtually contiguous space
> >>>   * @pages: array of page pointers
> >>> @@ -3585,8 +3663,8 @@ void *vmap(struct page **pages, unsigned int co=
unt,
> >>>               return NULL;
> >>>
> >>>       addr =3D (unsigned long)area->addr;
> >>> -     if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
> >>> -                             pages, PAGE_SHIFT) < 0) {
> >>> +     if (vmap_batched(addr, addr + size, pgprot_nx(prot),
> >>> +                             pages) < 0) {
> >>>               vunmap(area->addr);
> >>>               return NULL;
> >>>       }
> >>
>

