Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09175CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 02:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZjJVun8xN7GDkHYEL3bXr/VlWpA2YfoNARMcoM9xVw=; b=Rp4K9DIHXMo1jDdrfQokUZ+82t
	RmdlXpuJ3V1blOtZ5Jff53OMbbqPg3BEvfG5egMMhzfOEsztWI9FYi3zA7AybomVSr/rWK/2F0amP
	yf28XE27Eq8mNP8BiKfNM86lj19NaCQqdc7ofX5/KrmOY2k0q+sWuZ2V2gfwiamTDjdbRjw6nrLTu
	FSoCdxleQ8DlOrLZkpJKre2lo5679zzabSJb7A9gWJVp8vwiOybeupt2CfFmULXpj+cIdaL7V1FRN
	HkxSapjOQ5o6SWeRIKT3Ge0cMfTVff8YyzWQ8HJJbhlHprc/tLnACKsB1tzyC2jRtC/UjnzVsHZmX
	yDdy0L8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB1KG-0000000HBt2-1DB6;
	Mon, 28 Sep 2026 02:42:44 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB1KC-0000000HBsf-23sy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 02:42:42 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-48877902c99so2421286f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 19:42:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790563358; cv=none;
        d=google.com; s=arc-20260327;
        b=rSKfr3T8oEF4t+DV5OXAP13JzIjZgttbBYWO36pWeMg3WjkhcWY2LfJ2NU3RbTz5hm
         4PGRAbnw400T9U5BsEWIXng37TLbiBudJDub9dtOYlo7Skn/ZFl18H3NGxhD3lqDdej0
         cbxQvTbisWdQLZkN/eP3f34iKUFKWJuSfDinCoZ1EpqkuuRA8E4ClCmFd9XMsohevNB2
         bU6y8HRV8EfcJ9wsS1O0DTUGrZWFUfi81MfIV36dcjbf2PYp1NVSqKiIQ8s16Dx4eCgv
         +O9dIGmJ1PvwPuNCDGwvqIjPea/FAKQIaZdH1J+90a6glabNlEYusxQtLewPj1dHhG+Y
         qdjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YZjJVun8xN7GDkHYEL3bXr/VlWpA2YfoNARMcoM9xVw=;
        fh=DBB9ho4V88XRYnf6369SwpKNpcPWlIpq8M2Z25Grm9A=;
        b=fUVfhiszBUpFNtHPV2DNh1PNB90Swp6UBUl4SeSLz3V9u19rHWSCnQ/4l2p7fcQzRL
         6bTESFUW3Fdqogo1CXHbcUxRbhOiUgj3Gk7MggL8WWpCKefbPvdJQPvSiGtmTOvhMLWN
         3Eo403zs70fF1eFeRK+lvAgcrTgWJ4pUuxuzazcqpBGPbVhc034ro5sPhz95+/F6VJGL
         nDot/NAqiCB8dUc4t7PmueRDiauyMY9T2ZQrc2b5Oezo+hz+8efNZaDHyPuIxRvIONrU
         Y2u3VXlpRRATmEr2pYdSXcIIiPvJECOxD5ZRxjx2si2G4u2w8kOCK3VCJm5a8bt+bE1V
         Uc+g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790563358; x=1791168158; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YZjJVun8xN7GDkHYEL3bXr/VlWpA2YfoNARMcoM9xVw=;
        b=ieeiNZUlOzKmmeguq0q0o1yhJerr5/zr4EeIpWTxUEkdqJRHCb7RlnqZoQaA7/GLfD
         uMjzHsHEdx04/3Ga0dAtcwMnNEAinp/XrlfyWdWB0A7oKuYaWIhcspyPQE4VDoHQYB8h
         lkuNhoGnmNFFROAzhC+sblT0WOEhUuqOlKULQePuZBtm58g6P0qFxeuecQYQQYVGCth9
         x6Y4ps3QA95c+JZXnt1NG+1lTuo2CMgz8RkQJDbQrV+6dWAVHQgG4KBIzzTRoLqGDcLz
         5rWHrgwmQBgkpvzjGh7U2PeKGgiDZoCOysvDWEMNxl5NW3snpB/T8do6rGbDrH0t2Fbr
         +JFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790563358; x=1791168158;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZjJVun8xN7GDkHYEL3bXr/VlWpA2YfoNARMcoM9xVw=;
        b=QfEJ/GixBo4A5xBQVmjTD5IZqA+ksZ4k6DG1d7jQV3KSdRyag4ichbJoMOt/faYQsa
         ukMa2qRaZd0i7KCbkap871Rq6a4pmc/YkvMVz6lTNCQ3jtc5z6+2aFK9VYrVxVxdhCgg
         d3UTV4lRIf1oYhTg6odrhl42rFYiRT0azZOTcaJu5WIftTVq8gx868yd5WeksMlqOjSr
         7DgIzqnbRNcxsLg4zVE7T53AAxBWFZo7+sl0P+TZJEh+RgfC6SC0IXDYcfl8G3gdWqKM
         A29lHHedRTvlRYAaaUs0tJfTP6yXcUk3GbsAKF2djJ3EUR2ISfak9z5KFUPekyc4jXUN
         sUhA==
X-Forwarded-Encrypted: i=1; AKwUvBw3yLRxQIFWlc7DBBnRozyt4uf7Ax9Ta9ZG1IZrUpZlbod65zkJ+7RVufjVhtZ9sEZ1PqGT/A8jBSzue6LE5Wp+@lists.infradead.org
X-Gm-Message-State: AFq9FYIhhB3AWKEQ/V9AP+Um7u4WVd+X47j3ABObRh2bav1mXhuwIsi3
	WWV/HtL4RwgTdr6GapCnrXveA31M+LRMiVn7tHTqh9o2dspX7irBa1CkptpPcK8sTGEWF43/yWI
	bEpzLtlxPWusZn0WJDhTQ010Qf3+TWOk=
X-Gm-Gg: AYBFou3hK1xj8J99Mv8AtS29ytmyQMVy3lPvV6+O4FQndWz+VnXe3RGqS6eP2s43CPq
	thN6sdcrxeKb4Zg0f8ABcR2+AAYMkBahJXl1eEycHV/x+RFEU/xjzyUSli91anl300uUr9SDqgu
	cLWKq33Y30fBil7ikvRM/raB5F02/1fLfCXw90mP/d76s9pz21lyQZ84KXbYeLEFvgIwPFoSu9x
	5J5dut9wJmkwRDoPL+Ci1xcJvbg9CQDMDyBeHtdN51pVxY9zTCiON0ljZrHuwgUItfvW+VS4gCM
	wOYGr1Xoiz5W0+YGvOVprMYjoNmCDDrSHnq8R5vNay4IbDzEln5HqHam
X-Received: by 2002:a05:6000:385:b0:488:8cde:aaf5 with SMTP id
 ffacd0b85a97d-4888cdead77mr6051154f8f.2.1790563357707; Sun, 27 Sep 2026
 19:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260923062832.479455-1-jiangwen6@xiaomi.com> <20260923062832.479455-2-jiangwen6@xiaomi.com>
 <CAGsJ_4xQhmRigaV_2G3pdOgk5mvC6HNzqCyUdRY3RSG8-QNC-Q@mail.gmail.com>
In-Reply-To: <CAGsJ_4xQhmRigaV_2G3pdOgk5mvC6HNzqCyUdRY3RSG8-QNC-Q@mail.gmail.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Mon, 28 Sep 2026 10:42:26 +0800
X-Gm-Features: AclHuK-tj6RxDkR8fHhPZoG4i4S4CyEDCcJlFwKY4ZUdtlHJk_F2XqaylhywMI4
Message-ID: <CAHKocdFUw3BDjKwGhE+gMxyVXmMWtX4pP8brY3dBOhYhYoCgdg@mail.gmail.com>
Subject: Re: [PATCH v9 01/10] arm64/mm: add pte_set_huge() and pte_clear_huge()
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, chleroy@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_194240_572940_D669684E 
X-CRM114-Status: GOOD (  21.04  )
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

On Thu, 24 Sept 2026 at 05:30, Barry Song <baohua@kernel.org> wrote:
>
> On Wed, Sep 23, 2026 at 2:28=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmail.c=
om> wrote:
> >
> > vmap installs PTE-level block mappings (PTE_CONT on arm64) by reusing
> > set_huge_pte_at() and huge_ptep_get_and_clear(), which are HugeTLB
> > helpers gated by CONFIG_HUGETLB_PAGE. This makes the feature silently
> > unavailable on CONFIG_HUGETLB_PAGE=3Dn kernels and couples mm/vmalloc.c=
 to
> > HugeTLB internals it does not otherwise need.
> >
> > Add pte_set_huge()/pte_clear_huge() to arm64, joining the existing
> > pmd_set_huge()/pud_set_huge() family in mm/mmu.c. They build on
> > __set_ptes() and __get_and_clear_full_ptes() directly, so they do not
> > depend on CONFIG_HUGETLB_PAGE.
> >
> > There is no caller yet: mm/vmalloc.c is converted later in this series,
> > once the generic fallbacks are in place.
> >
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
>
> LGTM. Please see the comment below.
>
> Reviewed-by: Barry Song <baohua@kernel.org>
>
> [...]
>
> > +void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
> > +                 pgprot_t prot, unsigned long size)
> > +{
> > +       unsigned long pfn =3D __phys_to_pfn(phys);
> > +       pte_t pte =3D pte_mkcont(pfn_pte(pfn, prot));
> > +       unsigned int nr =3D size >> PAGE_SHIFT;
> > +
> > +       VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
> > +       VM_WARN_ON(!IS_ALIGNED(addr, CONT_PTE_SIZE));
> > +       VM_WARN_ON(!IS_ALIGNED(pfn, CONT_PTES));
> > +
> > +       __set_ptes(&init_mm, addr, ptep, pte, nr);
>
> You have patch 4 to revert the `clear_flush()` modification from
> 06fc959fcff ("arm64/mm: Support huge pte-mapped pages in vmap").
>
> I guess you may still need to guard against the case I mentioned in my
> reply to patch 4:
> https://lore.kernel.org/linux-mm/CAGsJ_4xiLScr2PrPu7Eem73GvPCtsuYd3J05kW3=
SC4QSs5Q4aQ@mail.gmail.com/
>
> Something like this:
> VM_WARN_ON (pte_valid(__ptep_get(ptep)));
>

Hi Barry,

Agreed. I'll add this. The vmap path should never see a valid=E2=86=92valid=
 transition,
but an explicit assert makes that contract visible.

Thanks,
Wen.

