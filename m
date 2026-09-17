Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B57C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKlGaZ7QcAexG2kTHUATEVY4bTePWKI9i02YcMMarMU=; b=UuJW2f9B5VnDx296/V083hL6b2
	R3kWiiUtlNu16DymzuGZlsMOvaVQL1pqSTaPqlt5Wlj7EUolDOGtjXkMIeVg/I5tNrnh5I4qzkh3N
	ns2b5ohZ3JSB5ok7UjYhZzpqXVqCzmTlMIGcFhdJ3OGAWurROU018tfCOup3U/iRRbbYwdBvrpFrz
	RyMtIGPIUsBBvXZH6ijC8uVKxSmfSZv18cvETMvXDRa3lx6536YMUDUgDrH1dHnGda9Tvz+wGKLBS
	dqp905RtmZFsc5Bic4m+SFKovRGuXXK+u//5An8WzPr2HwiaXD//+x6GEO85ngZjpj4WgVg/Gn/kC
	ASNw16Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DIL-0000000BYyA-34Eo;
	Thu, 17 Sep 2026 14:41:01 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DII-0000000BYwl-2ptk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:40:59 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ce364488dso2563705e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 07:40:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789656057; cv=none;
        d=google.com; s=arc-20260327;
        b=ph81OWrHYIE4vyYlEjXWTDI+Captl7y1iJQapQ7uyWBDGxwdn6nA3PpI+5No8KhbNy
         UtLpBl34xC8y8Q7PwPUmjt9uShAs+7NeoFTjTREZxHLkgP1SPkKKFJ++VmJwFKesT4d6
         9FEoZQhzRYkzMfoHy9pYB1JNbBn1/WJFdjZBQE8G4iCx90fwfGlr6FOk/o50OzjEErb8
         9cStznMmjYgzcKyYrsguP2Gm5gmqmmTSN7//MMvuWfw/TzWBa34rA6qIkhnzvoSimckY
         qzy7G8POZ8wezP/hzIIAu3FXtbLjC6G4yOofmGdwiBHwAWezXA76PUQ3/jVOaXf2qb8R
         r3tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tKlGaZ7QcAexG2kTHUATEVY4bTePWKI9i02YcMMarMU=;
        fh=osC0X4BiJeCkONrUa4u3gGpoFMatb6hNP6hw3ule2SQ=;
        b=kdm+gvXKHW2WERjcpRJs1jJwM5bJiSz4NX9getEjw+sd3ixKWX4e179bHDfoLflqaL
         9PZXlXgHaEox0f2hmBXDQ285qYrOEyu3QjBwV4dKeNAP8ODB+m4CST2nn++kxsgRMzZa
         xSUKkMVO1lqqZLXKis+3ugCNtO6ajf2lujj9PygDjV1A9vCKiZgqwWYznRl/4Pt5aDch
         Uf55pUFdE4t55I4TyX86xXYbmMQNGRDeB5MOg0It1RhLIWdWhHdqvmnsuswL4QGlFON7
         B3A5/BYEVlnvAdP77rx/SvQXIDc3vQed7/eV2tlVIQr0fJTHDQPXEvldbUTU6xG1TLoD
         uK5A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789656057; x=1790260857; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tKlGaZ7QcAexG2kTHUATEVY4bTePWKI9i02YcMMarMU=;
        b=rXd+MMoSsEBEV5mkmqUHZ6R9BpTgUawWec4rxhVKmYFCQPGtpPKbY8Egx7JQqMpGOC
         k2DTUUrSJ3jhgdkgjnB2cmYOvRRB6x0FEllPLdiEznUDHDmOACTjvEh1edsYiifK1sPe
         10MCrfykvK2hBJUFy5g22e39PHO3/wANF5/PuerniQfdKVvJSIeKxr5BKD5bEORUJSvE
         oa47VYs7hGxOrXsgIB41E1QZWSC1s4IwkeQ2O3nTWstyBBInqWX8zuRl/S1Ovnq0izzx
         a7yMwh7A7BcJsOqQZs0mM+r8ApiUMVAu8TpYymbtzjxMKx9Ye6bGExXlwfCIyFP1oPfF
         1lGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789656057; x=1790260857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKlGaZ7QcAexG2kTHUATEVY4bTePWKI9i02YcMMarMU=;
        b=e6Ko+vsrJQSla8qLFrNqprfbviFbaxcenJZQuNBJXycE9opeNjgxbe+Gjh6gPJ4n4d
         xZ+EFxcKtfRKyx6WdsOETXCOlyvIBGLM4ThyOb1Shi1jMdYrkMEYGV0VruDwzQ6gLgu1
         +6A5QVXgTKcR48IdBJkytHOFPr7zo3Ncip5VJ3I1NyQw2TqmGth2id2dq5OpdQU41+U+
         nZ+9Ym7UKjHkQCtygmWfZOrohDLcMqM5Et+zKHJiW234TfJ87Kwsim2WcUCQ/VOQ7AQt
         t4xhakeMspfsHyOrk37dHfRzoym/oqzmjRUVzM92/ZHI0zifVBew7aWR3CNAhVNF2TG6
         hCpg==
X-Forwarded-Encrypted: i=1; AKwUvBxmMpUJxLE4MOadSDCFkkJ9H+Lhu3tFh1jq/xVDiP4RuNQgJo/MUvbzneCSBq1SGJ+vHutuqAX+PbmgBa1WndP7@lists.infradead.org
X-Gm-Message-State: AFuF++niC4IsyPRqQF3/CZnaw3dF0wwWOknVoy9Nmv79dDSlKNb1uc1G
	h9TTz+JHS9udJL/xkYz7rConA+Vl4GLLN/4flBzm2KZoJ9euikuUoTYKdo1Mi4kJZ0TFghN77MN
	Wyc9Y73RFiWHlNajaZpj4w85+5QqOmZU=
X-Gm-Gg: AYBFou1RYnMMU2Rrtogzi7ihpkwKhOStfEl8lQroZFLiGkfZYDGQG+M+AwXs1z9+L8F
	tImXXZRaOK+NHcwzHq/SmK9cnyZUBlAAb40nyut/F8LXRL8gx/6hHo0OQ52TCt7LAGD9L+DMMjq
	DDVVjwFpM03JjbdZLIE4Ys2OG3BOWm1RAlqVX5S7aPYOAS7U0ghw6dizxy0o6F6x2FSVPQ/95Ut
	vkPhK0SDOkddoTIDI93G5jZ1XzWKx2fF2d0dyzkcfszRTnyy9vJgC80+Ut4H6y6LrC5b15RALmk
	EaCro8cLmpVLoq8CRuTcmOPbmrkPuoFF5THYx8QSdNaHXO3LmlTE0ZFl
X-Received: by 2002:a05:600c:c490:b0:49c:e37e:4389 with SMTP id
 5b1f17b1804b1-49fbd1b7e82mr50298125e9.4.1789656056433; Thu, 17 Sep 2026
 07:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
 <20260917052933.188679-4-jiangwenxiaomi@gmail.com> <27072d94-13bf-4bea-948a-d8a67976601e@kernel.org>
In-Reply-To: <27072d94-13bf-4bea-948a-d8a67976601e@kernel.org>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Thu, 17 Sep 2026 22:40:46 +0800
X-Gm-Features: AcwNN1Xe57v3xkT9n8VgdwgVRkLfN2sWNkgkjHSUvI4F8KcWXjC4skCrmqkDzZ4
Message-ID: <CAHKocdE_zyUQT459AiTBDzQHk0jh+VpXuSMDdgHjkg-dAkgBNg@mail.gmail.com>
Subject: Re: [PATCH v8 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge()
 for PTE-level block mappings
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, baohua@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_074058_742655_29052161 
X-CRM114-Status: GOOD (  26.25  )
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

On Thu, 17 Sept 2026 at 22:00, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
>
>
> Le 17/09/2026 =C3=A0 07:29, Wen Jiang a =C3=A9crit :
> > From: Wen Jiang <jiangwen6@xiaomi.com>
> >
> > vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
> > huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
> > the feature silently unavailable on CONFIG_HUGETLB_PAGE=3Dn kernels and
> > couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.
> >
> > Now that arm64 and powerpc/8xx provide pte_set_huge() and
> > pte_clear_huge(), add the generic fallbacks next to the existing
> > pmd/pud_set_huge() family and convert vmap_pte_range() and
> > vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
> > around the block-mapping paths are dropped, so PTE-level block mappings
> > now also work on CONFIG_HUGETLB_PAGE=3Dn kernels, and mm/vmalloc.c no
> > longer includes <linux/hugetlb.h>.
> >
> > The fallbacks exist only to keep the build working on architectures
> > without PTE-level block mapping support. They are unreachable there:
> > the callers only run when arch_vmap_pte_range_map_size() or
> > arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
> > which requires an arch implementation. WARN_ON_ONCE() makes that
> > explicit rather than silently doing nothing.
> >
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > ---
> >   include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
> >   mm/vmalloc.c            | 19 ++++++-------------
> >   2 files changed, 35 insertions(+), 13 deletions(-)
> >
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index cdd68ed3ae1a9..349ced999f959 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -2134,6 +2134,35 @@ static inline int pmd_free_pte_page(pmd_t *pmd, =
unsigned long addr)
> >   }
> >   #endif      /* CONFIG_HAVE_ARCH_HUGE_VMAP */
> >
> > +/*
> > + * PTE-level block mappings for vmap.
> > + *
> > + * pte_set_huge() only has to be implemented by architectures whose
> > + * arch_vmap_pte_range_map_size() can return a size other than PAGE_SI=
ZE.
> > + */
> > +#ifndef __HAVE_ARCH_PTE_SET_HUGE
> > +static inline void pte_set_huge(pte_t *ptep, unsigned long addr,
> > +                             phys_addr_t phys, pgprot_t prot,
> > +                             unsigned long size)
> > +{
> > +     WARN_ON_ONCE(1);
>
> BUILD_BUG_ON() would be better here.
>
> It should be possible because fallback arch_vmap_pte_range_map_size()
> will constant-fold PAGE_SIZE so pte_set_huge() will never be called.
>

Agreed. These fallbacks exist only to keep the build working on
architectures with PTE-level block mappings and should never actually
be reached, so BUILD_BUG_ON() is right. I'll make that change in v9.

Thanks,
Wen
> > +}
> > +#endif
> > +
> > +/*
> > + * Likewise, pte_clear_huge() only has to be implemented by architectu=
res
> > + * whose arch_vmap_pte_range_unmap_size() can return a size other than
> > + * PAGE_SIZE.
> > + */
> > +#ifndef __HAVE_ARCH_PTE_CLEAR_HUGE
> > +static inline pte_t pte_clear_huge(pte_t *ptep, unsigned long addr,
> > +                                unsigned long size)
> > +{
> > +     WARN_ON_ONCE(1);
> > +     return __pte(0);
>
> Same I guess.
>
> > +}
> > +#endif
> > +
> >   #ifndef __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
> >   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >   /*

