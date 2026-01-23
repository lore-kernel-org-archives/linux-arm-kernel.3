Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2885FD6CFDE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 06:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3Z3rjhmNdGJCDWg2OgWwviEOCLrWrBdYmPVnd2329o=; b=cl/E2S+Z6aHSqakYkabUdrbdLH
	vVzkdJSqbSYBMjoYXNyOItDZ47mH89cCw0qP4GCUmtru9YUzzEGI2jVs3aNKBsdUjXKUKrLCOo06M
	rMyvjuQiigW5mzT3aCQf8/IXNGpHSl0BG2hSMa4jkDfBkykFMt6w8yNhSVmi1Ilto1aqacnuw/R6z
	hM6no5h8s/FPx/tBR0nRqVE0sP6VjO6lh8vfRDB9N9k2254TYFHInmeuihMR6tcWsDTWLLDJC80xb
	ITBHAhkd64ltLTsWPS+0mmaWkh+KlRDV+W6jrg9mkLSJGqdj1RggcXQoeH74m077UhF4iT+nBs+kg
	1Cpzn+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAtD-00000008JGl-1hjD;
	Fri, 23 Jan 2026 06:43:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAt6-00000008JEG-0c4O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 06:43:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0258443AFF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 06:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7290C19423
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 06:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769150596;
	bh=aqk2LM6hpgCOWfRb/Un7WlOl38/KprMa96AWrDKyW7U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kjOxoAKISOSipxhNkp7rcWXClzHO5+wQuY8f8sMdSLvB6df0sxsIcrwA/kv9Bu7/E
	 jrE7kBrIUvy1ocDNdaXtU6OKF+R7x41xcMrrnq+sOtCJjqNAYhaDr9jJfdGw2PzHeJ
	 iUOH0CcdGewOhrzCC2Lods9oUOKpxiiC+tisLhsZ70HGAzy5ADAVKIKDkp43pWvmx+
	 41Rg9WHt84DgcrdQKMxhswhcR4Nq3hTDLOgP/ANgQS6QPKIVH7+rfC6PYZ4wHJTr2F
	 QoY08v2/bQRP6AcgI3wec97UWQ52bDIq5rOrfqHFwWz59uwvxPqYG7U2yGSmLX8ALE
	 tonCMCVGJAPiA==
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c2dd0c24e5cso614749a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 22:43:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYXOReHdn9cv2ck5Qb3f6kxsBGJiReo42v17FN3DG4W+2ngOOs/Yz7JEf9hFqaJy0B4ZBrUf5dNqe1G5Lu0YsI@lists.infradead.org
X-Gm-Message-State: AOJu0YysvsBkn2NigzKCHuoLqj16IivmUXUUCNSjr67vY7xsQE692PmF
	ucP3mU4qo92K06pCOLGTZ5y6GlO7QPNZAyyuEs23NtXT1XN+lLNZ68pxJ+wpiCkK151ailpDPPE
	7sJgzIxvuNlh/7wJ+25ZgFxVDrIIRrIk=
X-Received: by 2002:a17:90b:48c7:b0:353:3f04:1b78 with SMTP id
 98e67ed59e1d1-35378ba82c3mr165587a91.4.1769150596446; Thu, 22 Jan 2026
 22:43:16 -0800 (PST)
MIME-Version: 1.0
References: <20260119164747.1402434-6-ardb+git@google.com> <20260119164747.1402434-7-ardb+git@google.com>
 <d5c7ed76-2b54-4c6e-961f-6ba1e4011467@arm.com>
In-Reply-To: <d5c7ed76-2b54-4c6e-961f-6ba1e4011467@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 23 Jan 2026 07:43:04 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG8Q+VjXP08-hZhQ16Fe39+_JiSpPfh389gQ7twHr7eBQ@mail.gmail.com>
X-Gm-Features: AZwV_Qha-p15Q9tTNXYW38TrzPMT-C7I_9EAbgr6vtgxZom2Hdl3sYGASm7Mtes
Message-ID: <CAMj1kXG8Q+VjXP08-hZhQ16Fe39+_JiSpPfh389gQ7twHr7eBQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: Move fixmap page tables to end of kernel image
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ryan Roberts <ryan.roberts@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_224320_220280_FA604EDC 
X-CRM114-Status: GOOD (  22.38  )
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

Hello Anshuman,

On Fri, 23 Jan 2026 at 07:12, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 19/01/26 10:17 PM, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Move the fixmap page tables out of the BSS section, and place them at
> > the end of the image, right before the init_pg_dir section where some of
> > the other statically allocated page tables live.
> >
> > These page tables are currently the only data objects in vmlinux that
> > are meant to be accessed via the kernel image's linear alias, and so
> > placing them together allows the remainder of the data/bss section to be
> > remapped read-only or unmapped entirely.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/arm64/kernel/vmlinux.lds.S | 5 +++++
> >  arch/arm64/mm/fixmap.c          | 7 ++++---
> >  2 files changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> > index ad6133b89e7a..df530e6f3e53 100644
> > --- a/arch/arm64/kernel/vmlinux.lds.S
> > +++ b/arch/arm64/kernel/vmlinux.lds.S
> > @@ -334,6 +334,11 @@ SECTIONS
> >       __pi___bss_start = __bss_start;
> >
> >       . = ALIGN(PAGE_SIZE);
> > +     .pgdir : {
> > +             __pgdir_start = .;
>
> Does __fixmap_pgdir_start with an end marker __fixmap_pgdir_end sound better ?
>

No. __pgdir_start covers the init_pg_dir as well. And I don't think we
should be adding end markers that we do not intend to use.

> > +             *(.fixmap_bss)
> > +     }
> > +
> >       __pi_init_pg_dir = .;
> >       . += INIT_DIR_SIZE;
> >       __pi_init_pg_end = .;
> > diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> > index c5c5425791da..b649ea1a46e4 100644
> > --- a/arch/arm64/mm/fixmap.c
> > +++ b/arch/arm64/mm/fixmap.c
> > @@ -31,9 +31,10 @@ static_assert(NR_BM_PMD_TABLES == 1);
> >
> >  #define BM_PTE_TABLE_IDX(addr)       __BM_TABLE_IDX(addr, PMD_SHIFT)
> >
> > -static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __page_aligned_bss;
> > -static pmd_t bm_pmd[PTRS_PER_PMD] __page_aligned_bss __maybe_unused;
> > -static pud_t bm_pud[PTRS_PER_PUD] __page_aligned_bss __maybe_unused;
> > +#define __fixmap_bss __section(".fixmap_bss") __aligned(PAGE_SIZE)
> > +static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __fixmap_bss;
> > +static pmd_t bm_pmd[PTRS_PER_PMD] __fixmap_bss __maybe_unused;
> > +static pud_t bm_pud[PTRS_PER_PUD] __fixmap_bss __maybe_unused;
> >
> >  static inline pte_t *fixmap_pte(unsigned long addr)
> >  {
>

