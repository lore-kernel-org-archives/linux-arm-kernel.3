Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BD7CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSlkzBUmp3M8NJ8QezoWTcsem1pj+Ihncq28ei+hc8U=; b=RNF592a5WdkyTKUcwj9NMsHgP0
	8xzGZAe/6BwTz8DilZcEsBsiLa2N2NKaoAq42R1O2J8yS6vKBWbjgM+D/Xspt2ONpwxW2IyFfH/mo
	5eACVmPwcJ4elHieOC3Gxv7hcSyyMjUDfUfUFgSluQfItR4uYtsFcHIoOIgwQFtPdRwPk93lhUcZK
	dM5hI5IVuQvAcvv8YfOPphUHe+ij9FxwPNgyO9XOyGOUMMUlLEGtWaZbs2p/tUQhe9xLJmYRSA92r
	Ljnte4tQxieKwHosMeEsmU6kBiVXZ/MzL/JG3QvICme7haIV8sbi8CcmBe4sjvFhuPmzXnhqjMYTO
	1HYLbyKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ5a-00000009avp-0OgJ;
	Thu, 01 Oct 2026 15:52:54 +0000
Received: from mail-ej2-x0c.google.com ([2a00:1450:4864:34::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ5X-00000009avA-2IAj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:52:52 +0000
Received: by mail-ej2-x0c.google.com with SMTP id a640c23a62f3a-c2e402001e8so112403666b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 08:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869970; x=1791474770; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fSlkzBUmp3M8NJ8QezoWTcsem1pj+Ihncq28ei+hc8U=;
        b=BL80l5Y6KMG2EwPZtSf74Aassrpyp2z/LVfZM4ryZqOgi8JOtHMiv8Fzo0CpgNjYtb
         EWaSGoZ0clUyIStq4aNlD0JrT9NiS2x7h2/Fo+IkypM4Zb9eW04Fn8SzkNkxjbkz4blI
         3y0DrvzWRd8C5vMZausmQ0Bil4Wk6Vp4Ospk/MZ2ttpO6qjoOQgDg0yrUCf6lMC0W0Rp
         FXhJo2tt6RjFQieHRA5O/9xR1JnckEAmJBmVMOqa3FYtmUWZbB95AK3lUNEfyiAokPlc
         Xgo0EW4igi3sIJdlCgL0lCJlbeN2MuEjL4S7gnwJMETAcILSmn7tB8dTEqkU3zH11a6P
         P+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869970; x=1791474770;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSlkzBUmp3M8NJ8QezoWTcsem1pj+Ihncq28ei+hc8U=;
        b=SbGENZhhUG+S+J3ZMW6il5vxXzcSNnEnw5sM3J4jvhWUntK5P8PN3cDQJ8FM9vmayy
         aahO8p/RBh5y29rzUzHr2swir2HJDh7+3x/8bcA/9XnN7OyQ4Z+OUR7AC8BXrxfNsjBi
         MVLg54QAGse7gfdQxcJpPFiOqbMLoZqwu+v0vUkhpsu9FG9eYL6Qs6I9fCxuqZlCzaWH
         nCNGr4cl2fE0o7g5Jb9g5k9mGpe9HCbbjm9VSxSbKJUfkge3yItzFa9bSgilZF2V/2T/
         BaPvqa49WlTWbr673GcGNHq3MYrzSeS+oUJxV4JwyssarsCmYeCNMwcAPlYV9G7PSY4s
         0rBg==
X-Forwarded-Encrypted: i=1; AKwUvBwxxUB2E/baXMYdwnbOg/bsIY5Nk9oNd99GQXaCOByioKF501UtaV3zi7XWUbrVXdZlcaZ5TwLuW94/pYIWvg5W@lists.infradead.org
X-Gm-Message-State: AFuF++l+B8WHcPnoUNnkbLTtY8d4f/zVfTQpIduQimehe+cLkDj3o1Ft
	Jv5men+3p/HOCxBMX5Io5ZWZRrfnE4ILC8Eekp4VGmZntUP7ukYrQ1DV
X-Gm-Gg: AYBFou0RO4Dwp9uHYtjzrJVu875U22drQP2EKZaXjKD/mEfGMCTZf/80z0uYZJ8uMW1
	DBoiwS7q2EgC6mvOuibY6cqfYq6rQ4qwJ7ZqzmJBniUy4+DYKSNHb14FziS0pum3uLiEZs0Or2p
	WjfZuZvPCeKFrd7DochlqnQcmm6BldInekM7vT5Q75i36SIIhQexJCIpXPlSeqCTfuUfRRNZqUQ
	z4lZa15vhyMiImqHUWH46cu8FVlGE3aug84/UPNsIonZXHfWd5s4G2KU0bUGA2QMsKTwgJhnddH
	oL7aYdf3p6c19ihGBJ2gHkgrthZMeYRFs2jyWXRqgQI5ffubsfCXYc/s89Bhe+PJiDA3Xw/vm6Q
	jry6S4AXWaB1/BUH020V+8Gm9nLo/YSdXudHWy/3BvlqAPFl7NEGql7OlXjyR7uw+HgedS/hnj4
	AkNkqC0dsGyWJ7m+XfhrWK3ZnvDBFrxzSxDxZgj7NkkPimrA==
X-Received: by 2002:a17:907:9406:b0:c2d:23af:5fcd with SMTP id a640c23a62f3a-c2e23e1fcd8mr487499166b.44.1790869969629;
        Thu, 01 Oct 2026 08:52:49 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31dc7393sm179858266b.65.2026.10.01.08.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:52:49 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 1 Oct 2026 17:52:46 +0200
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
Subject: Re: [PATCH v9 07/10] mm/vmalloc: extend page table walk to support
 larger page_shift sizes and eliminate page table rewalk
Message-ID: <ar6BzubFrn46vuTu@milan>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
 <20260923062832.479455-8-jiangwen6@xiaomi.com>
 <ar0nuJ7ocTMgbiMu@milan>
 <CAHKocdH-NeWYJBrCVfGctuDyh=D4a2YrzUf1VxB3cG7Di-EAMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHKocdH-NeWYJBrCVfGctuDyh=D4a2YrzUf1VxB3cG7Di-EAMw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_085251_600049_99A1172D 
X-CRM114-Status: GOOD (  18.82  )
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

> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index d475e52110e4a..6e0dec73107a7 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -558,8 +558,10 @@ void vunmap_range(unsigned long addr, unsigned long end)
> > >
> > >  static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
> > >               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> > > -             pgtbl_mod_mask *mask)
> > > +             pgtbl_mod_mask *mask, unsigned int shift)
> > >  {
> > > +     unsigned long pfn, size;
> > > +     unsigned int steps;
> > >       int err = 0;
> > >       pte_t *pte;
> > >
> > > @@ -590,9 +592,10 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
> > >                       break;
> > >               }
> > >
> > > -             set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
> > > -             (*nr)++;
> > > -     } while (pte++, addr += PAGE_SIZE, addr != end);
> > > +             pfn = page_to_pfn(page);
> > > +             size = vmap_set_ptes(pte, addr, end, pfn, prot, shift);
> > > +             steps = PFN_DOWN(size);
> > > +     } while (pte += steps, *nr += steps, addr += size, addr != end);
> > >
> > nr_mapped_pages?
> >
> 
> As noted in the patch 6 reply, I'll rename steps to nr_pages here as well.
> 
Thank you!

> > > +
> > > +                     if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot, shift)) {
> > > +                             *mask |= PGTBL_PMD_MODIFIED;
> > > +                             *nr += 1 << (PMD_SHIFT - PAGE_SHIFT);
> > >
> > *nr += 1 << (PMD_SHIFT - PAGE_SHIFT); --->  *nr += 1U << (PMD_SHIFT - PAGE_SHIFT);
> > as it used to be?
> >
> 
> Agreed, I'll use 1U.
> 
Thank you. With noted modifications:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

> > >
> > This is not about this patch but probably on that WARN_ON we should bail out
> > early.
> >
> 
> I'll send a separate cleanup patch changing it to:
> 
>         if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
>                 return -EINVAL;
> 
Sounds good.

--
Uladzislau Rezki

