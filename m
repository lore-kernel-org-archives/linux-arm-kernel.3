Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0ABC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfptLJpLwa1HkLn6r+lnBSBB9zhrI022aUyQ/n+iqZI=; b=HygwKjRWk6VPBvgzGKtH1D/ouO
	vd+VlNVNfzDAkBzuKa4zmII/Cs6jEKu7YDTZJnekdibVkH7rUzw6OYtvmEs2QV0BFBeQc+O3Bcr2F
	S/ru7F9gdxKzHSyD7eoR/IXLOK3mqZKs/HBz17O1gke6Wr8EBpwNoJ+bMFyt5cem8YtypCS99mxh8
	hB+Mt55hNdhkUaeVFUpclaQFL15zWcvF6chjjQQu6Lf1HFQCTWMcgcSCqsVxI0uuL+RD+0FLZR7wI
	u5OvUevDlay1M1MtK2atPPsiAuGuZGHCg1q2YtnAVX0R46ozsbx+m0KJQlFyKylJfF528Car+Yv7D
	WZrdEDDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UCp-0000000DqhT-3ypW;
	Fri, 18 Sep 2026 08:44:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UCn-0000000DqhH-3FF8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 08:44:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B2B743E23
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 08:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7421F0089F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 08:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789721065;
	bh=yfptLJpLwa1HkLn6r+lnBSBB9zhrI022aUyQ/n+iqZI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WKQpoPYKtLvvrsANllnpazyBLjRD4QmuKuAgFZJ+R23L2z9t4yAN+ACJErx1PPLcp
	 YtolKadJaCrAtitOs8awaYY/VMbJ8Q6/L36/H0qNStZMmY1edyfG1bkb+dO8M0daCj
	 25bn53UilLvQYI1zKM5frfrxRWf45TEef5EH/K6kUxnvY0h3OG0YNQ241FqO+AVgh5
	 /1vNxD6Ah+KlqPlGnrXYjy62/4wfCjSsu3CmlZ2awkanq/i4MdIQk5y6nr/N5thZul
	 tzkhmvRWaSDcQUfWZGzo2paV/vNvrN2/R03Ja6OCm+ttH82QbijLXDvQ6H9U3Cp01O
	 nYQuqkIXgMEBw==
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109f067cso53924285a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 01:44:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByoUAJsQA/AQAhcSzJ+n1rRaipd8bXS2f7XnV2H2Cv4GqdG97atP8MJYWlKerCobXebvwOK7MTibbJLXbsQgmSM@lists.infradead.org
X-Gm-Message-State: AFuF++kW3Y6kn8GtYaIJPKmcyfSufWqLcM+SpFpfUJ/SNRHzHZ6ub0kg
	nfdTpXXoys7zvc5qrLh3JALtgWpq4iU3JKl8YRvCuFZPcm/N8/Wh8RxZopLID8dACvmZF2cWLr5
	24r2z/8mq4dojvLeaD6zp1HnP+HH7PHk=
X-Received: by 2002:a05:620a:280a:b0:936:dbd7:fcb3 with SMTP id
 af79cd13be357-93bdc6de89amr218538285a.21.1789721064703; Fri, 18 Sep 2026
 01:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
 <20260917052933.188679-3-jiangwenxiaomi@gmail.com> <58e3b456-7389-4752-8de5-1cc82964c3c7@kernel.org>
In-Reply-To: <58e3b456-7389-4752-8de5-1cc82964c3c7@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Fri, 18 Sep 2026 16:44:13 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wKG91hd1Y3W4mbdh6B8Kq09JyDjyvXeeCmQj+L6bHm2A@mail.gmail.com>
X-Gm-Features: AcwNN1U1UKmWK4_bdU3CXRYgsAbkO0CRi4o48diyrNchNw7WdNKVQp3kHhkJ8xY
Message-ID: <CAGsJ_4wKG91hd1Y3W4mbdh6B8Kq09JyDjyvXeeCmQj+L6bHm2A@mail.gmail.com>
Subject: Re: [PATCH v8 02/10] powerpc/8xx: add pte_set_huge()
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

On Fri, Sep 18, 2026 at 2:14=E2=80=AFPM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
>
>
> Le 17/09/2026 =C3=A0 07:29, Wen Jiang a =C3=A9crit :
> > From: Wen Jiang <jiangwen6@xiaomi.com>
> >
> > vmap installs PTE-level block mappings (SZ_16K/SZ_512K on powerpc/8xx)
> > by reusing set_huge_pte_at(), a HugeTLB helper gated by
> > CONFIG_HUGETLB_PAGE. This makes the feature silently unavailable on
> > CONFIG_HUGETLB_PAGE=3Dn kernels and couples mm/vmalloc.c to HugeTLB
> > internals it does not otherwise need.
> >
> > Add pte_set_huge() to powerpc/8xx, next to the existing
> > pmd_clear_huge()/pud_clear_huge() in mm/nohash/8xx.c. It builds the hug=
e
> > PTE and writes it into the backing cells directly, without going throug=
h
> > set_huge_pte_at(), so it does not depend on CONFIG_HUGETLB_PAGE.
> >
> > No pte_clear_huge() is needed: 8xx does not implement
> > arch_vmap_pte_range_unmap_size(), so the vmap unmap path never takes th=
e
> > block-mapping branch.
> >
> > In practice PPC_8xx selects HUGETLBFS unconditionally, so
> > CONFIG_HUGETLB_PAGE=3Dn does not occur there today; this is a decouplin=
g
> > cleanup rather than a new configuration.
>
> 8xx selects CONFIG_HUGETLB_PAGE because it uses set_huge_pte_at() to map
> kernel text with large pages. That was added by commit 34536d780683
> ("powerpc/8xx: Add a function to early map kernel via huge pages")
>
> But now pte_set_huge() could be used instead in
> __early_map_kernel_hugepage() and then CONFIG_HUGETLB_PAGE could be remov=
ed.

Hi Christophe,

Do you mean the code below? If so, it sounds like a good place to
clean this up for powerpc as a separate cleanup patch.

diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 2518d2a6bdb4..830cdb391161 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -87,9 +87,7 @@ static int __ref
__early_map_kernel_hugepage(unsigned long va, phys_addr_t pa,
        if (WARN_ON(!ptep))
                return -ENOMEM;

-       set_huge_pte_at(&init_mm, va, ptep,
-                       arch_make_huge_pte(pfn_pte(pa >> PAGE_SHIFT,
prot), shift, 0),
-                       1UL << shift);
+       pte_set_huge(ptep, va, pa, prot, 1UL << shift);

        return 0;
 }
diff --git a/arch/powerpc/platforms/Kconfig.cputype
b/arch/powerpc/platforms/Kconfig.cputype
index f0adbf7ecb7f..efba4d960083 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -41,7 +41,6 @@ config PPC_8xx
        select FSL_SOC
        select PPC_KUEP
        select HAVE_ARCH_VMAP_STACK
-       select HUGETLBFS

 config 44x
        bool "AMCC 44x, 46x or 47x"

>
> >
> > There is no caller yet: mm/vmalloc.c is converted later in this series,
> > once the generic fallbacks are in place.
> >
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
>
> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Best Regards
Barry

