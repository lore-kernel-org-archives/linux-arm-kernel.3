Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA2AC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXqdDZMk2n2ZA2FZuhNJE90D+Z4Rs/KppQMaR2DzMcs=; b=opA42IJ/sdpDGeFdbHb9s9OtGh
	7LRD09o64Wdnnjlec8ottyGYSadXPzzvykPUFyzBvJ57aDSjl7Ha8i5EyItOJf1s6/ZovqRLkqAft
	hNssAehxh1E8e4p826OkuBHoo+UX/hUneGATEGk1d33cKUiyVVn8BBHGYg8SY5qtD13IivcxaiNPp
	dKEFbr3Vpiq1LRmqERk0PiRRjXhhuQq5Mn4CCG7k2/ZvPMrZmEMCp++p866OITPqXSHYe3dOsX2Kp
	dvJ+rApgHqGTfeTngXt7kbISZphSmQhsj8s+guJGZfb+my7sXs09cX3WhjzKWzN8Fa80ynvWkDMij
	yaKC44DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TKg-0000000DjVZ-1jS2;
	Fri, 18 Sep 2026 07:48:30 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TKe-0000000DjV1-0ypT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 07:48:29 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-486e1a044c5so239280f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 00:48:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789717705; cv=none;
        d=google.com; s=arc-20260327;
        b=BvKfRfJpePpJq3v4Pc5v2UxVBvjJwcrJ6ShCjv5b4Z+t5BNk6nt2RT+Az6A7EjWyBX
         a6p8yK3cv3UG+xQzXFpIuTMikmafH8FPexZJzbTjyI/f1V6Em786mr2P9V49EkVnzMVf
         gCtB4u8gYegx2pEdsymmB5F5ZVisjndpwDTmCcz6YyOFLxe3odmYBrQKVP5sMEBHEe1z
         dAsMVbnl+D0pL08E9zGN0V7vTfuFMdYoWhe2CmY/SGYlF6D7hN6ACJ/rjJn8z5NfIp7d
         KjCmiBOFgdGSO3kMBvobfnfQF1AukJfhmAUQTXwwdd9tvrMN8BC8ugFR9a2n12BF/YpJ
         WhnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MXqdDZMk2n2ZA2FZuhNJE90D+Z4Rs/KppQMaR2DzMcs=;
        fh=LNjqnn65tV56eot5djRi7yTmtyEi7Wr/mtVKECfvtFM=;
        b=Ou/sglvM9KRBU2DNPxY/gqXyULIKUolQvgZxdAgK5Rji4V6cVWA8jFNPZkwHTvB8vW
         nfiRADUD0vUJempyqRadZt/mPfBOS2tvVSmltn5NlliFnL+UlLQp5CgSkHVWc0En1PdP
         7aozIT1NGss6+q9v7LL9/pVyG3NFZ0uVZhF2vxusYd5f6IAB1T/bmuPt7NDJnEz7gQxn
         f0bXsERzUxkulZ8p/5GCjvDWkwGuBA9huUEH/licxvDaEK0hzRWi0dTI7URwqJlez+Pu
         7nOqBBCRCDqBZhTClEDorqxTQBzdW8eCuhschQvc6h0DZtGCmZwCV/qqVYxFMcUDGFqk
         w06Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789717705; x=1790322505; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MXqdDZMk2n2ZA2FZuhNJE90D+Z4Rs/KppQMaR2DzMcs=;
        b=SsMYonO9NA7MqDQ9ncnLT06KBC5R1BCLyeBBCRfOF2enKL79wBEBUJaeJSwhqNREaP
         OFOgFbDqJ3E4CutDHQ+vbhrG+lHQbywmdSk+lCJW4xRUdZECtqcgprzN35ZyX6za6A33
         6ejlLh+E/qIQdsKspiDKyww5YD5qCt/zvE/v4WIMeRSuhSHFxsR/6f/CBdprxSZl1faB
         Xk8ukeJe8ee+e6+Y9frjDBNnuExwO+HORmIwm0tOzEMm3IxGWuCt1++PjQns1L0yCbPp
         MJ11UCHBvOMJr5b4/BgH++njtraEEBb7vZdPkkQ6bi6uco7KklwqEzho4kN72mMn3/NH
         QFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717705; x=1790322505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXqdDZMk2n2ZA2FZuhNJE90D+Z4Rs/KppQMaR2DzMcs=;
        b=UVoMqo2GEh9DabJg8OqOj6yTligbjazLFNmEimZL+mofrtj3N20h6OdXFVITH/qkCk
         7s0kf16st1LhXci4ZrHz27PNe77qW8/0mY/lWb1s3qpDJgcw74J8Faw8ObiIg76ya1om
         9lEbP+t8u4TejaWNdK11DKoLUQenyI53NS7aHacIxnl9zEDoVCh92dTg1nQqUIQ9Zn27
         6BgAirPJCIPNIwRcrB/xWejSd+loUZKVDjf6KPYRexCvBJoh9O6VqqkAKowENvNFSApC
         AIMJuvXKX/r/k0YeFsujXgEIQ7fbF1UYN0Q1Stu19iHIoRHeNOV30NrjhNZmUckdXGso
         /0EQ==
X-Forwarded-Encrypted: i=1; AKwUvByoyouUO3CS2yUmhMgW12CUHErK4SRQg4Xab9ybINJ5AR6FxJgiJNluZZbHDzlq2GKD8u5nrj5RUuSJ4IPnaAeN@lists.infradead.org
X-Gm-Message-State: AFuF++mMRB05sGn/dPQ6RjUiyw/dP8qjNwixZzB8oEBGI/I5PEhxxLF8
	GYu4ElBKth2dznXaS+8yuqQd83M7E3j8TKGPSNbFbhpvyubRo6Pr4UkCI1XLIuOj93b+VXXI565
	nUR75QX/0BrRiHczGTdt+4Q4qR6PC0u4=
X-Gm-Gg: AYBFou1x62SmPT+91g8ij6nBGBpUpGy5pOmEppP40KGetnTpLAfwy+WL40Kyoaqz3EW
	whtGidWtemzQC+IF5v4b0CmEWb7XPSF7Vp6u8cZBGpkmnJfD+tTXKnGjt6/rUPfCHHBQ40oCnrY
	PyM4toFjd5W3CXGRRQmWkdsxeEjNM/JXD27VWkUfPiLcED5+/BxvWuD5SQ0/YFdv/Rv3hgYTSYQ
	ywXaQPyOAUHJhfPt9YfLyARxbdXJgMUoeeuSEY2i49fsMKuHVQ026LhGUybJDEwjA+jZGOgpu+c
	0UXajjXKqL6uxOfYKQmpvVaqN6sLDUNSsd8lPD7XV67Sqm9aN4Svs29Bw0+lPok0MeM=
X-Received: by 2002:a05:6000:4b13:b0:487:1687:197d with SMTP id
 ffacd0b85a97d-4871e212458mr1713724f8f.6.1789717705281; Fri, 18 Sep 2026
 00:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
 <20260917052933.188679-2-jiangwenxiaomi@gmail.com> <CAGsJ_4xujxpH6OuuUao2=TAjTMKhr77ufW6OoZuk-VB=YPd6fw@mail.gmail.com>
In-Reply-To: <CAGsJ_4xujxpH6OuuUao2=TAjTMKhr77ufW6OoZuk-VB=YPd6fw@mail.gmail.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Fri, 18 Sep 2026 15:48:13 +0800
X-Gm-Features: AcwNN1U7w_zpIxImLoNROHRiindh6mTvUu1jbd9liF3b4JQySYxKRKgU7ZyE2AY
Message-ID: <CAHKocdHS-D7Gg_n3razCrp-QT5seT4KWz9r1TSWVVwLFsZmU7Q@mail.gmail.com>
Subject: Re: [PATCH v8 01/10] arm64/mm: add pte_set_huge() and pte_clear_huge()
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
X-CRM114-CacheID: sfid-20260918_004828_299528_1164CFF5 
X-CRM114-Status: GOOD (  24.73  )
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

On Fri, 18 Sept 2026 at 07:22, Barry Song <baohua@kernel.org> wrote:
>
> On Thu, Sep 17, 2026 at 1:29=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmail.c=
om> wrote:
> >
> > From: Wen Jiang <jiangwen6@xiaomi.com>
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
> I tried to apply the patch to mm-new, but it doesn't apply.
>
> % git am raw
> Applying: arm64/mm: add pte_set_huge() and pte_clear_huge()
> error: patch failed: arch/arm64/mm/mmu.c:1872
> error: arch/arm64/mm/mmu.c: patch does not apply
> Patch failed at 0001 arm64/mm: add pte_set_huge() and pte_clear_huge()
> hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
>
> % patch -p1 < raw
> patching file 'arch/arm64/include/asm/pgtable.h'
> patching file 'arch/arm64/mm/mmu.c'
> 1 out of 1 hunks failed--saving rejects to 'arch/arm64/mm/mmu.c.rej'
>
>
> [...]
>
> > +void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
> > +                 pgprot_t prot, unsigned long size)
> > +{
> > +       unsigned long pfn =3D __phys_to_pfn(phys);
> > +       pte_t new_pte =3D pte_mkcont(pfn_pte(pfn, prot));
>
> Maybe we can drop the `new_` prefix.
>

Will do.

> > +       unsigned int nr =3D size >> PAGE_SHIFT;
> > +
> > +       VM_WARN_ON(!IS_ALIGNED(pfn, CONT_PTES));
> > +       VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
>
> Do we also need to check that `addr` is aligned?
>

Yes. arch_vmap_pte_range_map_size() already guarantees all three,
since we are already checking two of them here, we should complete the
set. I'll add it in v9.

Thanks,
Wen

