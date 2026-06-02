Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936C4C5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 07:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eoOkMm4OeQAfjk4gTQ8GixghnDTp8Phdv+rBtxWQnF0=; b=pvgklHuodMKC60SLWI5stmc7+q
	w9YGk6Gc2eoJzx7Wnyf6pVvz5aBSOaSU8wkiSOE6djnJlRhQ8XjiOzVNzf9dpQyy6ZE31u23lxGPp
	T65lVHmN+kEn0gRDhaqINg2/NvlUTBQTk+zmNI6mnnLBFOD36SPcXsjytbxWZB2qT7UelLY+V7Meq
	JMv6n0c/yVdvVT6JQD03CSEL+IblrOG9BOyHH5EpU4Pf2vesdE41HeHHoCOIY9aE05NMEN0y3BU1Y
	f1SWqWtasd+lBVzuH3mFsxa+oFac1PmuFgw/x5FIyBecgJ443+PIE/8jnEV2bnw1TQxR/gg21diuF
	OSMIIz7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJoL-0000000CVD7-3wDJ;
	Tue, 02 Jun 2026 07:45:18 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJoJ-0000000CVCW-0fS6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 07:45:16 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso3413985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 00:45:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780386313; cv=none;
        d=google.com; s=arc-20240605;
        b=A8T8wcGP5woQNftnSXZXAmN8FulH3Fl4IniKdZijKctFQOmG3LH0v+81+NjeoT8LMa
         Y+EIK5S78LFxc0pCbQJ1JK6YoPEYsa+qhLVgRHfigrhr9HoXq3QOvWZiVEyecfAqzgsw
         KXv1Pvm7HxvVoNd2dDsUbOEmy4y/zFsLe7YKROdQ/D+CDA6KK7an+3DZ2EE/usofYP7Q
         4NU9t51W5nyM1skjW9PqkaakF7TdwvWAuJF4oNr5OhVkY0RBYBuDmOFLWxpaHw2d7PJM
         pm+25DedHChc7fpA8WPGf7FUba+ZAJP0JsnC7SB+l2GWQDDhPKlc5yeWvT91FozrTbFR
         Dlmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eoOkMm4OeQAfjk4gTQ8GixghnDTp8Phdv+rBtxWQnF0=;
        fh=doSRwzlcOz87VgpgMcsIDP1ncVwmJmrhnICqIeiJwI4=;
        b=Nb91V/P1+NzIyq6+6oJbIAqiULNo5Yr4P0VyNpFvKLjuvUGYaKWysjqoUWXVAseE9g
         fn6q0ngAPyPP8VjGgnlgfIwSKA6pujkf1w9r+Aeo6NQ5VoMr8PnSdfxajSw3IhncHAIx
         8NzBCwGbsX+pWDp8/0b+RjlxPOW3dQzJoVl4AyjTgNH3YnSpkRBgtQ0JELJVb9j4XuCL
         n08wlE+dQO37+TQXIl94qTt9/N16uk17FWwwwbTULIPMJ/hLacidG1D2jrYgr6tpFTcr
         jZ3MN8qaCBS36O+zK9SBpx0uRdNnEg6DREQzZesTRYJkcX9cYNWGlEIVRI7Ss7EyjgBR
         aYuQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780386313; x=1780991113; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eoOkMm4OeQAfjk4gTQ8GixghnDTp8Phdv+rBtxWQnF0=;
        b=lwqo6xOBn1lqO2fYh895f9lKRxyGMN5vKUhNPTyXDiWQZOXdqpPJU+iHOy8t5EdNtO
         c79x287qzh9b1VKLbgexcBDARZbxEL3Yra2k/JsVGpoWWg5e09uNn4Jq9KI4ooKy59aZ
         uzvYAvrBY2ef3Q0l8uQZIArC2LuyiweOYybiP4Fy+JWp6BHl9BK3HN8sJabbq3YlTnK4
         vM8jo4vyZXEofS1+dpWFVm1Nm2YfFQLPN9B59gYlb0ARmq5IdqNfmsEvdLKKkXC1sTcy
         33pf09hTaQwlKtQFWVsxAy5aI9Ur6t/VTAG93Pn9LWHA5lPxx9VCWbchQO2jsNFtTVnl
         +ZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780386313; x=1780991113;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoOkMm4OeQAfjk4gTQ8GixghnDTp8Phdv+rBtxWQnF0=;
        b=Tsq8kvJqDe+mk5cXg+KsdS2Si8zMAmG2X8Vi+fL3zLtUvpP8Mf4ko5tzrFgJfaWlQE
         fQQuaZEPnPmpjNJqHol18KRYst8ryWNtQbD7FRBfFSmWbUQQC5i/99zfE4GzaPZzytLW
         wbz0SKWoeKVe6xWlkx6bljj1dcL2pkIDUZEhPWIvzqwaP+g+LrOlhwDci6QtGv/x3HGA
         mySLus5ls9ZLt/T0nEJbTT9l3/Rrag/ilWNs3QiWmaPf5/AOWxnglli1LyXPSG0ZZVjI
         m/Sp+YvYi6SBS8aesWXaUhdxvrBVqpxxbhN4YEuQURemwcDohKnPYHmMfNVF5Se41IuZ
         ZJcg==
X-Forwarded-Encrypted: i=1; AFNElJ+VU5hGaAByKYo/3ufVeDE36s7d9UIAoUa6RIAvax2qTA5PBeFODaC3b2BYD1kCG8nOdeDEsIRb/ixeUwgdrwJ1@lists.infradead.org
X-Gm-Message-State: AOJu0Yym0+O7SgBAEaltigQnXhprw9cEMdEwsDpH9NSpKE40/CBloby+
	nJNYMmUppSJmrpR5uqq4NKiyijJlDW91lgOyvUvdxcLBShTDHg9tnEiLzQ3j31XPWhJPsayeMkZ
	QIPA9dZDebdtGqheN043AUf+3Ba7uq7E=
X-Gm-Gg: Acq92OHHxuYV9428XLrfL4RPVKikYf29DWP1EVkzLwmF7oHrjOR5ZjD9L6EtQw5S0FB
	3tPYtY/YtIq/1bkaWnNcf716cpSKn9/kZIzULm6SGUDrcwZrtJnqaz2awf8Gn8bNX8AXzHt/bwu
	/Qp0m5IJKuC20Ql4EkVv1Aph59AnBJ297qMJ/IRhIzjaV+dRdnKPS4sH5o8JTnYjXML/ZcgGhjk
	7i0MddL+dNvOXbj0egsiNFJT6Upx2xt3FaL1is4AqbfOhM3DCf8xkkkdycBzVtk1jccT+vs0JNb
	V0DFm4JkVGiuCS6T4eU=
X-Received: by 2002:a05:600d:6446:10b0:48f:eb8b:997a with SMTP id
 5b1f17b1804b1-490a2965784mr191160295e9.31.1780386313064; Tue, 02 Jun 2026
 00:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
 <20260522053146.83209-4-jiangwenxiaomi@gmail.com> <ah3Cn3YnefIVJDo2@milan>
In-Reply-To: <ah3Cn3YnefIVJDo2@milan>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Tue, 2 Jun 2026 15:45:01 +0800
X-Gm-Features: AVHnY4LHIiZAvO6g2wLLYc8-PfJq3HI0lmGYLHd8htw04EtCN26_I2MET48q0q4
Message-ID: <CAHKocdGjD1Fmq9sE-Q4o-_KLz8qv5tXRXRaAZN3Ktw7YdA3+Dw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] mm/vmalloc: Extract vmap_set_ptes() to consolidate
 PTE mapping logic
To: Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	baohua@kernel.org, Xueyuan.chen21@gmail.com, dev.jain@arm.com, 
	rppt@kernel.org, david@kernel.org, ryan.roberts@arm.com, 
	anshuman.khandual@arm.com, ajd@linux.ibm.com, linux-kernel@vger.kernel.org, 
	jiangwen6@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_004515_334519_651CE251 
X-CRM114-Status: GOOD (  27.95  )
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

On Tue, 2 Jun 2026 at 01:34, Uladzislau Rezki <urezki@gmail.com> wrote:
>
> On Fri, May 22, 2026 at 01:31:43PM +0800, Wen Jiang wrote:
> > Extract the common PTE mapping logic from vmap_pte_range() into a
> > shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
> > PTE mappings in a single function, preparing for the next patch which
> > will extend vmap_pages_pte_range() to also use this helper.
> >
> > The #ifdef CONFIG_HUGETLB_PAGE guard is moved inside vmap_set_ptes(),
> > so callers no longer need to handle the conditional compilation.
> >
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > ---
> >  mm/vmalloc.c | 49 ++++++++++++++++++++++++++++++++++---------------
> >  1 file changed, 34 insertions(+), 15 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 2c2f74a07f396..53fd4ee460ea4 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -91,6 +91,35 @@ struct vfree_deferred {
> >  static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);
> >
> >  /*** Page table manipulation functions ***/
> > +
> > +/*
> > + * Set PTE mappings for the given PFN. Try CONT_PTE mappings first when
> > + * supported, otherwise fall back to PAGE_SIZE mappings.
> > + *
> > + * Return: mapping size.
> > + */
> > +static __always_inline unsigned long vmap_set_ptes(pte_t *pte,
> > +             unsigned long addr, unsigned long end, u64 pfn,
> > +             pgprot_t prot, unsigned int max_page_shift)
> > +{
> > +#ifdef CONFIG_HUGETLB_PAGE
> > +     if (max_page_shift > PAGE_SHIFT) {
> > +             unsigned long size;
> > +
> > +             size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
> > +             if (size != PAGE_SIZE) {
> > +                     pte_t entry = pfn_pte(pfn, prot);
> > +
> > +                     entry = arch_make_huge_pte(entry, ilog2(size), 0);
> > +                     set_huge_pte_at(&init_mm, addr, pte, entry, size);
> > +                     return size;
> > +             }
> > +     }
> > +#endif
> > +     set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
> > +     return PAGE_SIZE;
> > +}
> > +
> >  static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> >                       phys_addr_t phys_addr, pgprot_t prot,
> >                       unsigned int max_page_shift, pgtbl_mod_mask *mask)
> > @@ -98,7 +127,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> >       pte_t *pte;
> >       u64 pfn;
> >       struct page *page;
> > -     unsigned long size = PAGE_SIZE;
> > +     unsigned long size;
> > +     unsigned int steps;
> >
> >       if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
> >               return -EINVAL;
> > @@ -119,20 +149,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> >                       BUG();
> >               }
> >
> > -#ifdef CONFIG_HUGETLB_PAGE
> > -             size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
> > -             if (size != PAGE_SIZE) {
> > -                     pte_t entry = pfn_pte(pfn, prot);
> > -
> > -                     entry = arch_make_huge_pte(entry, ilog2(size), 0);
> > -                     set_huge_pte_at(&init_mm, addr, pte, entry, size);
> > -                     pfn += PFN_DOWN(size);
> > -                     continue;
> > -             }
> > -#endif
> > -             set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
> > -             pfn++;
> > -     } while (pte += PFN_DOWN(size), addr += size, addr != end);
> > +             size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
> > +             steps = PFN_DOWN(size);
> > +     } while (pte += steps, pfn += steps, addr += size, addr != end);
> >
> >       lazy_mmu_mode_disable();
> >       *mask |= PGTBL_PTE_MODIFIED;
> > --
> > 2.34.1
> >
> IMO, we should add just a helper with "no functional change" and second
> patch will extend it.
>
> Otherwise you added a helper which has already been slightly modified.
>
> --
> Uladzislau Rezki

Make sense, will split it, the steps/loops refactoring will move into patch 4.

Thanks,
Wen

