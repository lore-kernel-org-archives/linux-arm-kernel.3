Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AC2C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 06:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSUon0Ye+JTXHkgGPecismrQ6aWB6KUmBQxrnhvgcgA=; b=e+tDc+4g1CmjyBWL4JkSbzOmE1
	FiZm91qqLjHh8uKRo8+JSQ+0ubhEwYb8y3hwc38/G/BmWS6BOOjYyYwAdXGnK2X3n1eQBMag0yceF
	GroQS3gLQbsZhfp5NkuKy7fuEJmysTIckUPO+Yma5x+8YKYDIkobcTNOl+xwCcrNr578w4QOgjA3I
	Y1GXbnqsR80xP9iAYYvadiR+wqCCeLceFeIC/UJD+gkHaDdhdSbJcj/3qjtr2wu6+8Ni7LsXY9Uma
	8NK+jMakcpfrJ3uxlsXYZhXn9q9EcrAuDY4njpYNCS7H+9X/uVv5Y0lvmYiYjTKlowVgIwWvqDlCo
	31s56eVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Rs0-0000000DXpP-2kA0;
	Fri, 18 Sep 2026 06:14:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Rrv-0000000DXoI-1kxk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 06:14:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 239B14451B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3D01F008A3
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789712083;
	bh=mSUon0Ye+JTXHkgGPecismrQ6aWB6KUmBQxrnhvgcgA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JRu9qUjQXlRcjBdYLmYId5fUC6gNDmR6uvG9HayWY2hzLkH+HiGKuskUL/ctLgP2U
	 Ob9+gFsoHQpIkKakYQSc0AbdsDy6276zAapXDiWaE9paVunN0VkmUUpMNDSDscA4Dw
	 TvkGHI+97S2SioWsf3/Ey/5smgTkPfQZu5lwVDNsJ+wK04tjbiBQI+ETfTKpxJYqhm
	 sMx5mw0Ln8+FkO+cAoi9V3yM+cMQj4udf54sUfcPw2eDg4/WPE53GkFK1qwojK1mdl
	 O8XwhWGUjhPRf0KLJ2oE243yp5Fxp0NBITZRZQCQ4NAar+SXKaC++dyEEH2NBA+Z/g
	 G9Cm/SO1Eid+g==
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcbe208so5839316d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 23:14:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx2JOP59iqje8sgmMz/aWa9Rzgbll4WNDG+jc4rhR9jY22g9liIzoTqstQCiA2IQNqfyBt/ifWc6JNchPEozLFt@lists.infradead.org
X-Gm-Message-State: AFuF++lW4uycFKSqK98PozvEXfWgVO/Yjm7Dgb7Otf97d5Ro4UcxsQGa
	f+aeJM52sSqJZnqjcabegwkEcoSEpuCL51VxNRMr5GaDNbKDnZxh8BDIe1a91rigWGry8tHaZ/q
	tfzIUJ8taoDkc1xWkIm9mEfT2E1DRXV4=
X-Received: by 2002:a05:620a:17a3:b0:939:e735:c50e with SMTP id
 af79cd13be357-93bdc6a6970mr193841685a.13.1789712082223; Thu, 17 Sep 2026
 23:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
 <20260917052933.188679-4-jiangwenxiaomi@gmail.com> <27072d94-13bf-4bea-948a-d8a67976601e@kernel.org>
 <CAHKocdE_zyUQT459AiTBDzQHk0jh+VpXuSMDdgHjkg-dAkgBNg@mail.gmail.com>
 <CAGsJ_4yJ-KCHbJ9S2GKXfO51KB8g-y2Q_MikqE9-6VesR-RC9Q@mail.gmail.com> <2462f67c-f7d3-4eb3-a093-6a338ef49f14@kernel.org>
In-Reply-To: <2462f67c-f7d3-4eb3-a093-6a338ef49f14@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Fri, 18 Sep 2026 14:14:31 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zMG6v-ioi8-NhveqowPVAnsHkFCNy_c7+KHDMRW3JH-Q@mail.gmail.com>
X-Gm-Features: AcwNN1X6q5f1Ex-rUff9-91gcAaVXuwTbEB0wMz6EV5siIJ-q7nSpPx4G64lSm8
Message-ID: <CAGsJ_4zMG6v-ioi8-NhveqowPVAnsHkFCNy_c7+KHDMRW3JH-Q@mail.gmail.com>
Subject: Re: [PATCH v8 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge()
 for PTE-level block mappings
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org, 
	catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com, 
	will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, 
	anshuman.khandual@arm.com, david@kernel.org, dev.jain@arm.com, 
	jiangwen6@xiaomi.com, leo.yan@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org, 
	ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Sep 18, 2026 at 2:05=E2=80=AFPM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
>
>
> Le 17/09/2026 =C3=A0 23:44, Barry Song a =C3=A9crit :
> > On Thu, Sep 17, 2026 at 10:41=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmai=
l.com> wrote:
[...]

> >>>>
> >>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> >>>> index cdd68ed3ae1a9..349ced999f959 100644
> >>>> --- a/include/linux/pgtable.h
> >>>> +++ b/include/linux/pgtable.h
> >>>> @@ -2134,6 +2134,35 @@ static inline int pmd_free_pte_page(pmd_t *pm=
d, unsigned long addr)
> >>>>    }
> >>>>    #endif      /* CONFIG_HAVE_ARCH_HUGE_VMAP */
> >>>>
> >>>> +/*
> >>>> + * PTE-level block mappings for vmap.
> >>>> + *
> >>>> + * pte_set_huge() only has to be implemented by architectures whose
> >>>> + * arch_vmap_pte_range_map_size() can return a size other than PAGE=
_SIZE.
> >>>> + */
> >>>> +#ifndef __HAVE_ARCH_PTE_SET_HUGE
> >>>> +static inline void pte_set_huge(pte_t *ptep, unsigned long addr,
> >>>> +                             phys_addr_t phys, pgprot_t prot,
> >>>> +                             unsigned long size)
> >>>> +{
> >>>> +     WARN_ON_ONCE(1);
> >>>
> >>> BUILD_BUG_ON() would be better here.
> >>>
> >>> It should be possible because fallback arch_vmap_pte_range_map_size()
> >>> will constant-fold PAGE_SIZE so pte_set_huge() will never be called.
> >>>
> >>
> >> Agreed. These fallbacks exist only to keep the build working on
> >> architectures with PTE-level block mappings and should never actually
> >> be reached, so BUILD_BUG_ON() is right. I'll make that change in v9.
> >>
> >
> > I am not quite sure. It won't be called at runtime because
> > `vmap size`/`unmap size` return `PAGE_SIZE`, so the code won't
> > reach this branch. But it will still be built.
>
> The fallbacks are defined as:
>
> #ifndef arch_vmap_pte_range_map_size
> static inline unsigned long arch_vmap_pte_range_map_size(unsigned long
> addr, unsigned long end,
>                                                          u64 pfn, unsigne=
d int max_page_shift)
> {
>         return PAGE_SIZE;
> }
> #endif
>
> #ifndef arch_vmap_pte_range_unmap_size
> static inline unsigned long arch_vmap_pte_range_unmap_size(unsigned long
> addr,
>                                                            pte_t *ptep)
> {
>         return PAGE_SIZE;
> }
> #endif
>
> Therefore in:
>
>                  size =3D arch_vmap_pte_range_unmap_size(addr, pte);
>                  if (size !=3D PAGE_SIZE) {
>
> GCC knows 'size' is const and its value is PAGE_SIZE, so it won't emit
> the branch at all.
>
> It is call constant folding, some explanation here:
> https://en.wikipedia.org/wiki/Constant_folding
>
> >
> > So, would a `BUILD_BUG_ON()` trigger a build failure here?
>
> It shouldn't, if it does it is a compiled bug or this is because someone
> has redefined arch_vmap_pte_range_map_size() and not pte_set_huge()
> which we'd better know at build time rather than at runtime.

Thanks, Christophe. I was also thinking about compiler optimization. I
was just a bit worried that we're touching the common MM code, which
affects almost all architectures, so I'm not quite sure whether this is
supported by all GCC versions used by those architectures.

If it is supported by all of them, I agree that `BUILD_BUG_ON()` is a
perfect approach.

Best Regards
Barry

