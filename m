Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB99ED2D8F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 10:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GuvIouN5vywq2Q9dQz97Mugz11Ghuzn0A74U+oqUs4I=; b=Cz0iyd/SQBSI1401cICabIvaLv
	TBZV3VcF6Mk6BUhiaAQEEsJKIlmJ0V3OY5xz18JaBlPbpeotc4QbxkR2F2gmlfY36LyV0yncnLn1q
	/Mcup/oDOI5c/62H8r9Zugu+yoDt0w6b1e6+5DpFHXUsJH5F1krFm2ILYt9HjMzPICWkNSxxKGhdc
	BLT0e/+1VpBmQCYrcud9169zUyOAUe/2qLhp7fvPaVfnZosexnrls/0Vkgkqc/7yJbwIrJkjivu5n
	Xdle1BtcMXq/85fHd/+BFL77epV8g4gwO3viEI5eP/cu63dziELXZECZS/fP5KQvsBjVVMruXRrIS
	/EyaBGeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgQw-0000000E4Gt-2XPK;
	Tue, 27 Jan 2026 10:36:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgQl-0000000E4FW-3fXl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 10:36:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 98E18443DC
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:36:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F684C2BCB4
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769510178;
	bh=JWTemWwM8d5hhy1rFLzCx4ZbXQ4gREt3z806buBxXvw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FSLjw3bd94FzMmh6MGlELk5hhjfx9ROvv6MbDiOH8uDFQe2XpMdUafdN7f4nnicLZ
	 4VRg7FPWoILKnntN6UbBx5EEZL6WAK5N8l0+nAmt5HckcvY5sNLaZnEiO6m5PdWIWw
	 mDQCZL+o0oruFF8FnNq3nR+R0leXdSYwpS+MvOYL96aubdKmCIjj9EusqYir7SodbA
	 vljJ4b04GsW3F1HNrlr2/C2JMVjoyqYG8zBUbG2e6w3qDcIDZ9EH6xzPzhw7M2H8y0
	 CuA+bfslR5smK0pfnyi1C4/qGHdxgVUaTcMibGHwQ0KICm84tumTz8fR0zEaItw7Tt
	 BxaIKz0tC+IMA==
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c626bd75628so1917702a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 02:36:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVcde7k4VkX6sz5zduTmkFKucrAxQNlPJnIjbdAn9Q4pOi2qPhg6ZZUuFotgwxcf17fLO2XtbPaoYIU1aLAZ6iB@lists.infradead.org
X-Gm-Message-State: AOJu0YztEWHG67gONUHQd+bWxco/3zbB8Mg5oE9EKmGZhY3waRMaP6K9
	715wsdPTQweoag7DSSMXJ+YV6kZ5DVzryMp4nINocNXWi4fNM2n1+xunZecc8tfAtLoo97bDPNy
	YcMs9uG02jLguharGI5mq0xtC3IuVHP4=
X-Received: by 2002:a17:90b:51c1:b0:34c:9cec:dd83 with SMTP id
 98e67ed59e1d1-353fed88ea4mr1233428a91.27.1769510177575; Tue, 27 Jan 2026
 02:36:17 -0800 (PST)
MIME-Version: 1.0
References: <20260126092630.1800589-12-ardb+git@google.com>
 <20260126092630.1800589-21-ardb+git@google.com> <62b1723a-2ff3-4cac-ad99-a0e8d388ef12@arm.com>
In-Reply-To: <62b1723a-2ff3-4cac-ad99-a0e8d388ef12@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 27 Jan 2026 11:36:06 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHh2X0fWSZtN_xYQCwwwWKFJfBXaCec-BGXp3FDhE6S5g@mail.gmail.com>
X-Gm-Features: AZwV_Qhbzo8JaH40i9sS1ev3RFs_7gBcKYuj7o2DgvCuXJsGAVkF_l4j0hvuOSk
Message-ID: <CAMj1kXHh2X0fWSZtN_xYQCwwwWKFJfBXaCec-BGXp3FDhE6S5g@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] arm64: mm: Map the kernel data/bss read-only in
 the linear map
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_023624_766774_01157BDB 
X-CRM114-Status: GOOD (  29.61  )
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

On Tue, 27 Jan 2026 at 11:33, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 26/01/2026 09:26, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > On systems where the bootloader adheres to the original arm64 boot
> > protocol, the placement of the kernel in the physical address space is
> > highly predictable, and this makes the placement of its linear alias in
> > the kernel virtual address space equally predictable, given the lack of
> > randomization of the linear map.
> >
> > The linear aliases of the kernel text and rodata regions are already
> > mapped read-only, but the kernel data and bss are mapped read-write in
> > this region. This is not needed, so map them read-only as well.
> >
> > Note that the statically allocated kernel page tables do need to be
> > modifiable via the linear map, so leave these mapped read-write.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/arm64/include/asm/sections.h |  1 +
> >  arch/arm64/mm/mmu.c               | 10 ++++++++--
> >  2 files changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/sections.h b/arch/arm64/include/asm/sections.h
> > index 51b0d594239e..f7fe2bcbfd03 100644
> > --- a/arch/arm64/include/asm/sections.h
> > +++ b/arch/arm64/include/asm/sections.h
> > @@ -23,6 +23,7 @@ extern char __irqentry_text_start[], __irqentry_text_end[];
> >  extern char __mmuoff_data_start[], __mmuoff_data_end[];
> >  extern char __entry_tramp_text_start[], __entry_tramp_text_end[];
> >  extern char __relocate_new_kernel_start[], __relocate_new_kernel_end[];
> > +extern char __pgdir_start[];
> >
> >  static inline size_t entry_tramp_text_size(void)
> >  {
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index 18415d4743bf..fdbbb018adc5 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -1122,7 +1122,9 @@ static void __init map_mem(void)
> >  {
> >       static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
> >       phys_addr_t kernel_start = __pa_symbol(_text);
> > -     phys_addr_t kernel_end = __pa_symbol(__init_begin);
> > +     phys_addr_t init_begin = __pa_symbol(__init_begin);
> > +     phys_addr_t init_end = __pa_symbol(__init_end);
> > +     phys_addr_t kernel_end = __pa_symbol(__pgdir_start);
> >       phys_addr_t start, end;
> >       phys_addr_t early_kfence_pool;
> >       int flags = NO_EXEC_MAPPINGS;
> > @@ -1158,7 +1160,9 @@ static void __init map_mem(void)
> >        * Note that contiguous mappings cannot be remapped in this way,
> >        * so we should avoid them here.
> >        */
> > -     __map_memblock(kernel_start, kernel_end, PAGE_KERNEL,
> > +     __map_memblock(kernel_start, init_begin, PAGE_KERNEL,
> > +                    flags | NO_CONT_MAPPINGS);
> > +     __map_memblock(init_end, kernel_end, PAGE_KERNEL,
> >                      flags | NO_CONT_MAPPINGS);
>
> I'm probably being dumb again... why map [init_end, kernel_end) RW here, only to
> remap RO below? Why not just map RO here?
>

Because the loop that iterates over the memblocks will remap it RW
again anyway, so whether we map RW or RO at this point is irrelevant.
This call just needs to occur here to ensure that no block mappings
needs to be broken up later.


> >
> >       /* map all the memory banks */
> > @@ -1172,6 +1176,8 @@ static void __init map_mem(void)
> >                              flags);
> >       }
> >
> > +     __map_memblock(init_end, kernel_end, PAGE_KERNEL_RO,
> > +                    flags | NO_CONT_MAPPINGS);
>
> This seems iffy since __map_memblock() doesn't flush the tlb. If you want to
> update an existing mapping you want to be calling update_mapping_prot() right?
>

Fair enough - I'll use that here.

