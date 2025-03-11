Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F11C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 07:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QseqWoIJEXuhd7bqjUyBMJtRFk5kFyQA7tGu7/U5rgE=; b=c9f691tYMXeeszqVEspBhMHGPO
	dY2T+scRuuwqgibY/jR1u/A0l62CynvALNvYRbw7eY8gXTmKyokzVS1zykDGcaOA+0J7prZBG593+
	gyRNAET3JqZkOhHkXCuxdncnWCuJ1dOtII7D2Jd3zQ4Rtm3cwyfuQx6TBk8b/dzhch+gLZfV2SOKa
	38QwED/WsWwvcoxNCJgnGFChK9/ue7ssuHRmjYioCjcrctMw/2Lj1Y+Mn6IhGZingfupF57UBTh9l
	dAc1/oeOOV54TX7a6IvJ+PklzWamCY77OQ/YCiRcb6N5YfFiWBbMFdmvbsY2leF9YVo2nDh3n3I2z
	8koFBwNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trteJ-00000004ngm-0QV6;
	Tue, 11 Mar 2025 07:03:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trtcd-00000004nUL-2Ybu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 07:01:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F1A15C1D0B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 06:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D44C4CEEA
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 07:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741676510;
	bh=NYpMFSFioxP0BDXcrp91NdHA4R23AuwevDcHkXFs29w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KhZ1Vvbn2E+uWzLbb2rBfD2fqm9l/BDOzeI0IPyVR4cH0Qm3D3nrBMF0A8GNJyBCi
	 9hPcos/k+doE1mIA6jvafzS8UCTo3OBrU3Y5FH4Bkcwt2a7deSPGSYbi5/ie2sy/tB
	 g/0HJmcOYSn2EAn0Kg5wqAYKZHUSMQmAOJCiosHHxovrGPMa3IWUIYfvG6cYQbHPgC
	 DNQx6snJKrgxCOAgFbdyavzENUDUHAV1DwOFsKC4BNGG2E3A3VuHm60eYWy6Ik3fkf
	 pf2e8iWrwxA6TutUcjqjiUKykgXATYodjiedA/XItPnwo+ShO628aOKbW3lVy9LEzL
	 3ELJofGwhiySg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-548409cd2a8so4903321e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 00:01:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXEkcs5QHRtzbOa9RG4bleI1TshfHueJPRFkkJHgOxdsZs+rAynf+BRXBs/45JovO6fRJSlggF3blE4kV7UTwY@lists.infradead.org
X-Gm-Message-State: AOJu0YwR2fP2q5oahPdcxXlSUAlG5cCzHeyymiy0vPfWzL1yo1tKlzOV
	MT/CovJSfw2GpALZwtZCY4WJbG7HswFQsWij7Tj0H+yijMbUmcDLXVFPnehtVBFxWRAXRfyWTX8
	ow12t9ngOcUNIsyHSHnbel0NhH44=
X-Google-Smtp-Source: AGHT+IGj4bqDcD2GusV6EM0Jsr/+sWNy5/2k6laSOSvgDcGl3/HW28mt5hvK8V6tYoRDUgnBEu/JI0jD8Nh8m8eqHGI=
X-Received: by 2002:a05:6512:1112:b0:545:1ce0:6407 with SMTP id
 2adb3069b0e04-54990e6767dmr5134155e87.27.1741676508573; Tue, 11 Mar 2025
 00:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250310183011.2591600-2-ardb+git@google.com> <2931b574-35ff-4a3e-b073-47ca94c45787@arm.com>
In-Reply-To: <2931b574-35ff-4a3e-b073-47ca94c45787@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 11 Mar 2025 08:01:37 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHmOFN4+4sNSbHKbsYjEAW0Y1tbbYOD3ZA+++Q9nbnSzg@mail.gmail.com>
X-Gm-Features: AQ5f1JpOEJKxbfofUpSt0bEanNlnuyUp-YQuFSHfpCfZjKtOWA5Ovd5_hJ79YKA
Message-ID: <CAMj1kXHmOFN4+4sNSbHKbsYjEAW0Y1tbbYOD3ZA+++Q9nbnSzg@mail.gmail.com>
Subject: Re: [PATCH] arm64/kernel: Always use level 2 or higher for early mappings
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	mark.rutland@arm.com, will@kernel.org, catalin.marinas@arm.com, 
	Ryan Roberts <ryan.roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_000151_735152_A2D31631 
X-CRM114-Status: GOOD (  33.52  )
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

On Tue, 11 Mar 2025 at 05:12, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 3/11/25 00:00, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > The page table population code in map_range() uses a recursive algorithm
> > to create the early mappings of the kernel, the DTB and the ID mapped
> > text and data pages, and this fails to take into account that the way
> > these page tables may be constructed is not precisely the same at each
> > level. In particular, block mappings are not permitted at each level,
> > and the code as it exists today might inadvertently create such a
> > forbidden block mapping if it were used to map a region of the
> > appropriate size and alignment.
> >
> > This never happens in practice, given the limited size of the assets
> > being mapped by the early boot code. Nonetheless, it would be better if
> > this code would behave correctly in all circumstances.
> >
> > So only permit block mappings at level 2, and page mappings at level 3,
> > for any page size, and use table mappings exclusively at all other
> > levels. This change should have no impact in practice, but it makes the
> > code more robust.
> >
> > Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> > Reported-by: Ryan Roberts <ryan.roberts@arm.com>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/arm64/kernel/pi/map_range.c | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
> > index 2b69e3beeef8..025bb9f0aa0b 100644
> > --- a/arch/arm64/kernel/pi/map_range.c
> > +++ b/arch/arm64/kernel/pi/map_range.c
> > @@ -40,17 +40,10 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
> >       /* Advance tbl to the entry that covers start */
> >       tbl += (start >> (lshift + PAGE_SHIFT)) % PTRS_PER_PTE;
> >
> > -     /*
> > -      * Set the right block/page bits for this level unless we are
> > -      * clearing the mapping
> > -      */
> > -     if (protval)
> > -             protval |= (level < 3) ? PMD_TYPE_SECT : PTE_TYPE_PAGE;
> > -
> >       while (start < end) {
> >               u64 next = min((start | lmask) + 1, PAGE_ALIGN(end));
> >
> > -             if (level < 3 && (start | next | pa) & lmask) {
> > +             if (level < 2 || (level == 2 && (start | next | pa) & lmask)) {
> >                       /*
> >                        * This chunk needs a finer grained mapping. Create a
> >                        * table mapping if necessary and recurse.
> > @@ -64,6 +57,14 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
> >                                 (pte_t *)(__pte_to_phys(*tbl) + va_offset),
> >                                 may_use_cont, va_offset);
> >               } else {
> > +                     /*
> > +                      * Set the right block/page bits for this level unless
> > +                      * we are clearing the mapping
> > +                      */
> > +                     if (protval)
> > +                             protval |= (level == 2) ? PMD_TYPE_SECT
> > +                                                     : PTE_TYPE_PAGE;
> > +
> >                       /*
> >                        * Start a contiguous range if start and pa are
> >                        * suitably aligned
>
> LGTM and as Ryan mentioned, D128 ready as well !
>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

Thanks, both, but the patch is actually buggy so I'll need to respin this.

