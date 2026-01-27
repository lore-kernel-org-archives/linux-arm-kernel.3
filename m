Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1344D2D8F7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 10:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u60Xzd0qgFZzoqYRHokZT0nvEFxOWSZ0Jm9hUSWvCdU=; b=OXXkRsVV4wk4BgC9+48SJABL2E
	QQsf4zGnMzIcwVFpNgqr4IyxMokNJuYlJH4McrOQxVn3T5M3lMTktApyT5f40l2kCdzmaOLzMQBBM
	r4U804CnSv5EGxo0zoTYopFbTLuETxbZqjhG5OhT7LPayRyqyOnrJ0h5/qzqKczfZdoiz22FqcAve
	FJxYvZQCGjaKLjAnHRFJmUoH6pg6y70qDGhF7yzdK+C1ZbjK38DqS+5xDFWoKysgSA/vsWa7H5UXt
	5mBHynhx+MJxFqeebT7Sf+fPG64/ppTKzeTDZdoraVbCjwXNHLtEnaeVd0Dwg2WGA8dVOSAsRt5MZ
	748baP6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgiK-0000000E6UZ-2Mdv;
	Tue, 27 Jan 2026 10:54:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgiK-0000000E6UJ-03xR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 10:54:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 12286600AA
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6C5C116C6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769511266;
	bh=1zj6N7gTcxCu/r4o1le0S27hB0lFUZ+XfoNr6hf0nzc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q2+P0bVqe42G1GLBv9tLDdTmoYatmAYgpr2lebm9U+wYiBwQ7yRWZ/nz/ZzWEJ/3Q
	 5Y0F7WRyl30J3QvsIrugEB2vgX83ap8twZ/mDjV6W8G8D+nzJQHQdas68cNJgeE0kH
	 u7rxeQJsOawob8QQcEC1v4sd5k/58+pX3DCzdD9N26TeH8xY9N83FUN8CyUmXKBRIT
	 c+nyaQaA3DhPnjJy8dZRQacWuQV05tfCr+CzGhpFVgXQUfo/TJJCmDUFgG/B+UMD/B
	 PPAJWnmS6NJDwcrrONNHOoPOPHaH1QiPNfLhIf7OLh6CMA+JlYAEBZQd9zrbeOwKG7
	 OsZI8lJNlyp8A==
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c5f0edc20f2so1461872a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 02:54:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUkKggcXlxgPHsGE2KtGGOIhmZNpjHgZbvUMcQT5wePxfKhuwVGAgXO+pPVJJrWeTi7dlS54jVtJqHrtZTWW59Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh79aIDTYk0gx5KRNxLL/n4aR/rhp6mXfB3VB/lowoK+HPXiwv
	Foj0XQ/0dmBLbC5rp/gac5j/HCkPTOr4gmz13brd2OBxeLkH1oe/wd1G5Dcu221FuTQ3kQfHA5S
	Jr5SdGTUIcbududpIRkeqoCi3Ck7YZ0o=
X-Received: by 2002:a17:90b:384e:b0:340:b912:536 with SMTP id
 98e67ed59e1d1-353fed87a7amr1231123a91.31.1769511266354; Tue, 27 Jan 2026
 02:54:26 -0800 (PST)
MIME-Version: 1.0
References: <20260126092630.1800589-12-ardb+git@google.com>
 <20260126092630.1800589-22-ardb+git@google.com> <3d6b2d69-ba7c-4da0-80e1-d1b80da47696@arm.com>
In-Reply-To: <3d6b2d69-ba7c-4da0-80e1-d1b80da47696@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 27 Jan 2026 11:54:15 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHOkQKS4yP=mqsE-s-W0sg=cvrY6mx53WVQi0pOeLCDkQ@mail.gmail.com>
X-Gm-Features: AZwV_Qibxd-KFIZ9NRSH1JXOSfc8o1oX7aG6NgeR2e6yFoPlJ3Tc05yOx_4JMx8
Message-ID: <CAMj1kXHOkQKS4yP=mqsE-s-W0sg=cvrY6mx53WVQi0pOeLCDkQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] arm64: mm: Unmap kernel data/bss entirely from
 the linear map
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 27 Jan 2026 at 11:50, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 26/01/2026 09:26, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > The linear aliases of the kernel text and rodata are mapped read-only in
> > the linear map as well. Given that the contents of these regions are
> > mostly identical to the version in the loadable image, mapping them
> > read-only and leaving their contents visible is a reasonable hardening
> > measure.
>
> what about ro_after_init? Could that contain secrets that we don't want to leak?
> What is the advantage of leaving text/rodata ro in the linear map vs just
> umapping the whole lot?
>

Unmapping it would be preferred, but there are some pieces (such as
the zero page and swapper_pg_dir) that are expected to be visible via
the linear map.

> >
> > Data and bss, however, are now also mapped read-only but the contents of
> > these regions are more likely to contain data that we'd rather not leak.
> > So let's unmap these entirely in the linear map when the kernel is
> > running normally.
> >
> > When going into hibernation or waking up from it, these regions need to
> > be mapped, so map the region initially, and toggle the valid bit so
> > map/unmap the region as needed.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/arm64/mm/mmu.c | 40 ++++++++++++++++++--
> >  1 file changed, 37 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index fdbbb018adc5..06b2d11b4561 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -24,6 +24,7 @@
> >  #include <linux/mm.h>
> >  #include <linux/vmalloc.h>
> >  #include <linux/set_memory.h>
> > +#include <linux/suspend.h>
> >  #include <linux/kfence.h>
> >  #include <linux/pkeys.h>
> >  #include <linux/mm_inline.h>
> > @@ -1027,6 +1028,31 @@ static void __init __map_memblock(phys_addr_t start, phys_addr_t end,
> >                                end - start, prot, early_pgtable_alloc, flags);
> >  }
> >
> > +static void remap_linear_data_alias(bool unmap)
> > +{
> > +     set_memory_valid((unsigned long)lm_alias(__init_end),
> > +                      (unsigned long)(__pgdir_start - __init_end) / PAGE_SIZE,
> > +                      !unmap);
> > +}
> > +
> > +static int arm64_hibernate_pm_notify(struct notifier_block *nb,
> > +                                  unsigned long mode, void *unused)
> > +{
> > +     switch (mode) {
> > +     default:
> > +             break;
> > +     case PM_POST_HIBERNATION:
> > +     case PM_POST_RESTORE:
> > +             remap_linear_data_alias(true);
> > +             break;
> > +     case PM_HIBERNATION_PREPARE:
> > +     case PM_RESTORE_PREPARE:
> > +             remap_linear_data_alias(false);
> > +             break;
> > +     }
> > +     return 0;
> > +}
> > +
> >  void __init mark_linear_text_alias_ro(void)
> >  {
> >       /*
> > @@ -1035,6 +1061,16 @@ void __init mark_linear_text_alias_ro(void)
> >       update_mapping_prot(__pa_symbol(_text), (unsigned long)lm_alias(_text),
> >                           (unsigned long)__init_begin - (unsigned long)_text,
> >                           PAGE_KERNEL_RO);
> > +
> > +     remap_linear_data_alias(true);
> > +
> > +     if (IS_ENABLED(CONFIG_HIBERNATION)) {
> > +             static struct notifier_block nb = {
> > +                     .notifier_call = arm64_hibernate_pm_notify
> > +             };
> > +
> > +             register_pm_notifier(&nb);
> > +     }
> >  }
> >
> >  #ifdef CONFIG_KFENCE
> > @@ -1163,7 +1199,7 @@ static void __init map_mem(void)
> >       __map_memblock(kernel_start, init_begin, PAGE_KERNEL,
> >                      flags | NO_CONT_MAPPINGS);
> >       __map_memblock(init_end, kernel_end, PAGE_KERNEL,
> > -                    flags | NO_CONT_MAPPINGS);
> > +                    flags | NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS);
> >
> >       /* map all the memory banks */
> >       for_each_mem_range(i, &start, &end) {
> > @@ -1176,8 +1212,6 @@ static void __init map_mem(void)
> >                              flags);
> >       }
> >
> > -     __map_memblock(init_end, kernel_end, PAGE_KERNEL_RO,
> > -                    flags | NO_CONT_MAPPINGS);
>
> In the previous patch, perhaps this should be moved to
> mark_linear_text_alias_ro() and combined with the update_mapping_prot() there?
>

Why? Isn't it better to just remap it r/o from the outset if it never
needs to be mapped r/w to begin with?

The same applies to the rodata region but -again- it is the root page
tables that are manipulated via the writable linear alias during boot.

I'll try to address all of that in the next rev - thanks.

