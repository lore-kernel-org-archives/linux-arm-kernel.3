Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94C7CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 23:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/i0r8CSjkvOyfYzF5swg0iOz418PMdocvZNGpsIEKQ=; b=D7iGpxmIx5wQok/PwggIQuNz3X
	yf7gC/ReF/a9e0F6MDOydGIRtfRindihqCvhmK62LhQS24G0JC2jDb1FeizquoacuviGL1QSWzQIH
	rjGUy0sVTTCoXB6ErI9MWD8y6gr5GrpZ7633K+kdCWpyk7VTY7H+6yDLeJZiZGw5Z+xgIm4jIGmys
	IxZqCXPozDHvIw80T+LugCqHIpgjHv1a0j1BqXreZIem1lTtuV2ntf/zCBlnES4xKToExYsXdObFz
	dcRX74aU0XI4nl0uS64pyO4XXzAfJOxGxnjcPAfBPbz9AsRMeJA1FtX3t6VDsKGv0PHe9JAdVj8DO
	Ierq3QkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upy8B-00000005TEJ-1gs1;
	Sat, 23 Aug 2025 23:58:43 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upy5W-00000005T6L-0aOs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 23:55:59 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3c607029266so1149597f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 16:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755993356; x=1756598156; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/i0r8CSjkvOyfYzF5swg0iOz418PMdocvZNGpsIEKQ=;
        b=euLEL4sx7qxC8e+ucyu8p04lTXJubBzB+YWbAZ6FBqOKt0I8oxplzs++HquaOne+x4
         MYu0C/rbHi9Ot7xgL1iIf7FGE8f9qrHaWCOSzqGzSVdYW0+7EmNo1iqGRtW0InSix0PR
         lc6xdCWLGOmhLeVvukNM7ONWJLgt6NS5yXPxbF7bBfcw0dEVvQVSOEtt8vD93VgVCbCG
         81BWO3nkMs3ylmWszzImFBh79nWRNTK98/MZD7BsBvfEUwiVd6hcgm6gG5VEsQvSEK9b
         U/GNSkObQi714opWQB4Eh4YK5krdo7Ifx8S8x5tn/z8pCPTFLkKgUAu6q6Q/5ozpWqDj
         uPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755993356; x=1756598156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/i0r8CSjkvOyfYzF5swg0iOz418PMdocvZNGpsIEKQ=;
        b=qL70sV7h8vHf2BTu/19OPxAByph1XkYVO0eSI0/pYp/KwlwcgCJNguSzFMr79Pu2l7
         OS1VEMAmMVHRCASyj6E5x5P0SirSgIljj8q3raXDCIYHHM70oKAnaWuXt9qpQX+bWbVR
         5y35Zal35BtrrhQhuCBwMjzoU3mKZSmC+x2XrfhLVOyrFZUKwSnl/JbFcFOXoga+tBOQ
         NyRDO0QvOCmAdOZaHLLPb9a4Mpqf4fftVetKuRHAQbdPNh5YO98blx3tVBLlPXoM6cWO
         InYC7MxwlbGA/IwT1fVnINVl0t6shf+AFnMhuhL4Ot+vG3Rf00ts4uFZjBPDH7bjuZ1C
         s4fQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/GgE2U8UZtVq9tXKMwMjv2k5x/J88l4LA6G/+7z277fk+zcTdCyDz80edSvrC/ufK5uAbxmDYZo766tMlNKQg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7qWLVuzgLkzpkPzohXPK6wk9vNjAzXEY+iqxUXstVTgBpVyri
	1j//UgbrdclwFSRAs0Bb7przF4XfEEi4CmKKwPkCz5KghoM1GnCSd6yk0uaGyaQLLsWDd9GwNQM
	5gi3cp+Xs53wpE1uQZiGWZCpoA/e7NCM=
X-Gm-Gg: ASbGncs8JnsQYbVSx4uSPKXgmx1OgfKQofxWzlb/PGUTbDzsYcpxTNrX/uBIKcZAVsr
	zQdJ1P1niUlMFIbr/Vm70gmcEmMHASAO9WTofMGqqd4+2gt0oVysq65rda4unwRu15qzDc3Ci9G
	6z12t+MPu9+/TxRMqTRUCn3bHMQqIukFEwpw8iIc7gW+1dizmkLR/pR3Hc3OPmk1P6yzi2Xck4Y
	dYxrfV4dVnoQbHGZX5QWDzTG7A50YKmEUpnnmATM8bbZ6hd6BEQfOIv0UKZaLVBITDvgqNx3iW7
	DIEaRbA=
X-Google-Smtp-Source: AGHT+IHK1fFEfBRswoC+cOAU3MdBdRobccnz9keTzt26DXyo+x/aCKmIwF4hKmckMQOQbQ9SoFcLpAUeNsNYEcrqdFQ=
X-Received: by 2002:a05:600c:3596:b0:458:bd31:2c35 with SMTP id
 5b1f17b1804b1-45b517cca56mr65377045e9.25.1755993355886; Sat, 23 Aug 2025
 16:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250822041526.467434-1-CFSworks@gmail.com> <CAMj1kXH38gOUpDDdarCXPAY3BHBbuFzdD=Dq7Knsg-qHJoNqzQ@mail.gmail.com>
In-Reply-To: <CAMj1kXH38gOUpDDdarCXPAY3BHBbuFzdD=Dq7Knsg-qHJoNqzQ@mail.gmail.com>
From: Sam Edwards <cfsworks@gmail.com>
Date: Sat, 23 Aug 2025 16:55:44 -0700
X-Gm-Features: Ac12FXzGG0H-pxXhscueUgsXpOWwmZNae3mF28D68WdANbXrFVlmWCQ-8wPwR4Q
Message-ID: <CAH5Ym4gTTLcyucnXjxFtNutVR1HQ0G2k_YBSNO-7G3-4YXUtag@mail.gmail.com>
Subject: Re: [PATCH] arm64/boot: Zero-initialize idmap PGDs before use
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Baruch Siach <baruch@tkos.co.il>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_165558_204419_2D223B50 
X-CRM114-Status: GOOD (  39.25  )
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

On Sat, Aug 23, 2025 at 3:25=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> Hi Sam,
>
> On Fri, 22 Aug 2025 at 14:15, Sam Edwards <cfsworks@gmail.com> wrote:
> >
> > In early boot, Linux creates identity virtual->physical address mapping=
s
> > so that it can enable the MMU before full memory management is ready.
> > To ensure some available physical memory to back these structures,
> > vmlinux.lds reserves some space (and defines marker symbols) in the
> > middle of the kernel image. However, because they are defined outside o=
f
> > PROGBITS sections, they aren't pre-initialized -- at least as far as EL=
F
> > is concerned.
> >
> > In the typical case, this isn't actually a problem: the boot image is
> > prepared with objcopy, which zero-fills the gaps, so these structures
> > are incidentally zero-initialized (an all-zeroes entry is considered
> > absent, so zero-initialization is appropriate).
> >
> > However, that is just a happy accident: the `vmlinux` ELF output
> > authoritatively represents the state of memory at entry. If the ELF
> > says a region of memory isn't initialized, we must treat it as
> > uninitialized. Indeed, certain bootloaders (e.g. Broadcom CFE) ingest
> > the ELF directly -- sidestepping the objcopy-produced image entirely --
> > and therefore do not initialize the gaps. This results in the early boo=
t
> > code crashing when it attempts to create identity mappings.
> >
> > Therefore, add boot-time zero-initialization for the following:
> > - __pi_init_idmap_pg_dir..__pi_init_idmap_pg_end
> > - idmap_pg_dir
> > - reserved_pg_dir
>
> I don't think this is the right approach.
>
> If the ELF representation is inaccurate, it should be fixed, and this
> should be achievable without impacting the binary image at all.

Hi Ard,

I don't believe I can declare the ELF output "inaccurate" per se,
since it's the linker's final determination about the state of memory
at kernel entry -- including which regions are not the loader's
responsibility to initialize (and should therefore be initialized at
runtime, e.g. .bss). But, I think I understand your meaning: you would
prefer consistent load-time zero-initialization over run-time. I'm
open to that approach if that's the consensus here, but it will make
`vmlinux` dozens of KBs larger (even though it keeps `Image` the same
size).

>
> > - tramp_pg_dir # Already done, but this patch corrects the size
> >
>
> What is wrong with the size?

On higher-VABIT targets, that memset is overflowing by writing
PGD_SIZE bytes despite tramp_pg_dir being only PAGE_SIZE bytes in
size. My understanding is that only userspace (TTBR0) PGDs are
PGD_SIZE and kernelspace (TTBR1) PGDs like the trampoline mapping are
always PAGE_SIZE. Please correct me if I'm wrong; I might be misled by
how vmlinux.lds.S is making space for those PGDs. :)

(If you'd like, I can break that one-line change out as a separate
patch to apply immediately? It seems like a more critical concern than
everything else here.)

Best,
Sam

>
> > Note, swapper_pg_dir is already initialized (by copy from idmap_pg_dir)
> > before use, so this patch does not need to address it.
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sam Edwards <CFSworks@gmail.com>
> > ---
> >  arch/arm64/kernel/head.S | 12 ++++++++++++
> >  arch/arm64/mm/mmu.c      |  3 ++-
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> > index ca04b338cb0d..0c3be11d0006 100644
> > --- a/arch/arm64/kernel/head.S
> > +++ b/arch/arm64/kernel/head.S
> > @@ -86,6 +86,18 @@ SYM_CODE_START(primary_entry)
> >         bl      record_mmu_state
> >         bl      preserve_boot_args
> >
> > +       adrp    x0, reserved_pg_dir
> > +       add     x1, x0, #PAGE_SIZE
> > +0:     str     xzr, [x0], 8
> > +       cmp     x0, x1
> > +       b.lo    0b
> > +
> > +       adrp    x0, __pi_init_idmap_pg_dir
> > +       adrp    x1, __pi_init_idmap_pg_end
> > +1:     str     xzr, [x0], 8
> > +       cmp     x0, x1
> > +       b.lo    1b
> > +
> >         adrp    x1, early_init_stack
> >         mov     sp, x1
> >         mov     x29, xzr
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index 34e5d78af076..aaf823565a65 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -761,7 +761,7 @@ static int __init map_entry_trampoline(void)
> >         pgprot_val(prot) &=3D ~PTE_NG;
> >
> >         /* Map only the text into the trampoline page table */
> > -       memset(tramp_pg_dir, 0, PGD_SIZE);
> > +       memset(tramp_pg_dir, 0, PAGE_SIZE);
> >         __create_pgd_mapping(tramp_pg_dir, pa_start, TRAMP_VALIAS,
> >                              entry_tramp_text_size(), prot,
> >                              pgd_pgtable_alloc_init_mm, NO_BLOCK_MAPPIN=
GS);
> > @@ -806,6 +806,7 @@ static void __init create_idmap(void)
> >         u64 end   =3D __pa_symbol(__idmap_text_end);
> >         u64 ptep  =3D __pa_symbol(idmap_ptes);
> >
> > +       memset(idmap_pg_dir, 0, PAGE_SIZE);
> >         __pi_map_range(&ptep, start, end, start, PAGE_KERNEL_ROX,
> >                        IDMAP_ROOT_LEVEL, (pte_t *)idmap_pg_dir, false,
> >                        __phys_to_virt(ptep) - ptep);
> > --
> > 2.49.1
> >

