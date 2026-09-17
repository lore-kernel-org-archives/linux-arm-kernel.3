Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0D0C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 23:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMZh1YMYCYrRC2uuwUki1Jazz5iXTgol+eU8SrrfkyY=; b=tb9kHFgAW4ZjtGP3eq4uad9kp+
	Kl3RTQet3B7orflhJSoixs+E3aTpazKZ1GNWmhXjLQeYmnDExx96k5nraPFYGqHeEjsyrn5EUc6Ww
	Lky6C0EV2Tadwkk0I9HLmqPK191KH/LQQ1qs88QtMyJMEmkyEt+fivdX9IRvHMbmpdAPP2zUBeSJs
	Nz/hdiNDH0UlPpv/Zaor6Xf6PDkatWq/lLXoSsF2ClZ0sRW1fpDRmDgSsl4ILnOBnG0s0citT8eN8
	5rDf7yPtiSSb+39YnYSFmyeyrs97fOUS646mBcBSyzNgA9QDd18Emkwml6WllfD7HJYiJKpeBwVbO
	KgcfG8XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7LQu-0000000CmO0-0f1B;
	Thu, 17 Sep 2026 23:22:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7LQs-0000000CmNc-1Jcu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 23:22:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ABA8643FA7
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 23:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93BBC1F00893
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 23:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789687341;
	bh=tMZh1YMYCYrRC2uuwUki1Jazz5iXTgol+eU8SrrfkyY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UMyDXfFPJ6TD7VAJu/Wo9nOwx21vOAIJyHqkxfySfMaGoz3L5SRzIRuYI6+hBq5Fn
	 VDxtPogqxAZqT8pWf20ID37n7+Tnf1ShUmnTeR6Ws4U8ye+c5hV8nmnvdP/9SIaRz1
	 oVrxtZYf9D25VxY16SDLIkJw+KxWNVDWByqc7Bv821rdlnEV0ad0v/0J10dcDSxlBx
	 DUjrmnzdOgwZ5WBE8l1Rg98I3/mY5h/CmE2mnXbu9SnLwfE2Q9/STmdY1xkpDSRuvq
	 QubDsA6jFihfX+X0r3Vgzg14qdy25FbeEj7HpBIQnOY9UhbIVFC0VzepoarsGjndoF
	 thgumBxMGF03g==
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cc46c4so13179485a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 16:22:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw6h8RI43Utm1VezZFH8iCGqn7wd4lPcKlCG+B0qD0tIOINAAZ2n8fujKamp361WMObiJvMhq/5aVLhysPtg9kt@lists.infradead.org
X-Gm-Message-State: AFuF++latPsDhPnCLO5cadxn5gNbz730rjiTutGj+R22A0r6O7JHTpg2
	mgoBP/bV7oFbRHiKPEem2CHpCsquoHVMH2WDRjdK8lVAQq/2LCPcGWmcoxAUgFoq65K8KKec4wK
	QlPmSoQzqVPdJ9Gu0/pgvPFFKcPdSNUg=
X-Received: by 2002:a05:620a:294a:b0:93b:da60:a557 with SMTP id
 af79cd13be357-93bdc6d5b3amr95981185a.19.1789687340744; Thu, 17 Sep 2026
 16:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com> <20260917052933.188679-2-jiangwenxiaomi@gmail.com>
In-Reply-To: <20260917052933.188679-2-jiangwenxiaomi@gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 18 Sep 2026 07:22:09 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xujxpH6OuuUao2=TAjTMKhr77ufW6OoZuk-VB=YPd6fw@mail.gmail.com>
X-Gm-Features: AcwNN1WjNP8GdpSkB1mGsUq58TKlHY6lfOfrir1kzagtl_zxNQgmPbeTkRXOdwM
Message-ID: <CAGsJ_4xujxpH6OuuUao2=TAjTMKhr77ufW6OoZuk-VB=YPd6fw@mail.gmail.com>
Subject: Re: [PATCH v8 01/10] arm64/mm: add pte_set_huge() and pte_clear_huge()
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, chleroy@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
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

On Thu, Sep 17, 2026 at 1:29=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmail.com=
> wrote:
>
> From: Wen Jiang <jiangwen6@xiaomi.com>
>
> vmap installs PTE-level block mappings (PTE_CONT on arm64) by reusing
> set_huge_pte_at() and huge_ptep_get_and_clear(), which are HugeTLB
> helpers gated by CONFIG_HUGETLB_PAGE. This makes the feature silently
> unavailable on CONFIG_HUGETLB_PAGE=3Dn kernels and couples mm/vmalloc.c t=
o
> HugeTLB internals it does not otherwise need.
>
> Add pte_set_huge()/pte_clear_huge() to arm64, joining the existing
> pmd_set_huge()/pud_set_huge() family in mm/mmu.c. They build on
> __set_ptes() and __get_and_clear_full_ptes() directly, so they do not
> depend on CONFIG_HUGETLB_PAGE.
>
> There is no caller yet: mm/vmalloc.c is converted later in this series,
> once the generic fallbacks are in place.
>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>

I tried to apply the patch to mm-new, but it doesn't apply.

% git am raw
Applying: arm64/mm: add pte_set_huge() and pte_clear_huge()
error: patch failed: arch/arm64/mm/mmu.c:1872
error: arch/arm64/mm/mmu.c: patch does not apply
Patch failed at 0001 arm64/mm: add pte_set_huge() and pte_clear_huge()
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

% patch -p1 < raw
patching file 'arch/arm64/include/asm/pgtable.h'
patching file 'arch/arm64/mm/mmu.c'
1 out of 1 hunks failed--saving rejects to 'arch/arm64/mm/mmu.c.rej'


[...]

> +void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
> +                 pgprot_t prot, unsigned long size)
> +{
> +       unsigned long pfn =3D __phys_to_pfn(phys);
> +       pte_t new_pte =3D pte_mkcont(pfn_pte(pfn, prot));

Maybe we can drop the `new_` prefix.

> +       unsigned int nr =3D size >> PAGE_SHIFT;
> +
> +       VM_WARN_ON(!IS_ALIGNED(pfn, CONT_PTES));
> +       VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));

Do we also need to check that `addr` is aligned?

Best Regards
Barry

