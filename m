Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C77CD2D8F7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 10:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otRALw76wrjOT40BHFRm6qs9y8bwFGtkYRtp9K4q9pI=; b=vyCz+SwbV4qOv/E3oyEPyIF4XM
	+ZP/vBo1vQeXa8hhxrHcmOchGyWAnk/Q3R0+qN+Cbja/Enmr76/SQCEdFXGXugz8JXuO8bm8yYDa0
	Gz9fWToo7IuzcVnTkGeMsyApFA7Mz2lf919fX264RoKA/bCmIFqMkeJv9/HfIJYCQ71V4+h9ZbmL/
	+HODYvAKeguhBZw3thJbZhgvjfazTq4bP1u5tmqAYKst7uI03btG9P6xuPX4haa4H0E3x9RL4B5Sl
	KLhWYLx/fW7ZpJfga9Xf2Yuo+pTRsh/Y4N7MD8U7fR7NRREZq3xEGiEYtJw62DmDdfQDc5Wbd40l0
	K5V2F+1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgbO-0000000E5me-3M5y;
	Tue, 27 Jan 2026 10:47:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgbO-0000000E5m9-1I3U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 10:47:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6163E600B0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E50C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769510837;
	bh=NgcZQPM56B0R2rDd+OZ+Z7xk1FAyH0scmoSUohCjNNA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BfY1NMCykH+rT2Vd+IIZIv5VeibMoWVJUlZoPodYIJI9rkrBXkXGIGKynUny9XW80
	 cxK5C9rGHtr54eGmOaoVUalMklILC/TtC2e/7ul30AjoohRuFqjEDz/KZ3Ek43/qLM
	 ceZkBSPUyYsdA8vzRW9MoLwlw+0T9W4P44bH5q+on6sJAuj1dCn9cYw77gQFeBBMuo
	 EvI54qa/1ZRs68+JeoehTuPdz5lr4TNEvswACXJzu3Q8a2L1oV+YQKruU9YYQnKhzt
	 y9TVFXZhwKHm2yQWeukY98ko7F8phpe5aJHq0aSz2E54RZOb+Wo6EPYwVgf34weOJc
	 JV0DuM8PSO0TQ==
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-350fe1f8ea3so2674001a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 02:47:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW0xVQDAvbBGl9vPFcDLsvZYtqkFX1o5ZIUHcROiC5j8PmWHNxhKODN3u0rrE5gQFqIoqbbrwZ0OUOFaDf2TLMY@lists.infradead.org
X-Gm-Message-State: AOJu0YzjdwrEjm5ajiHYc6U/gHxHNJLkHvnrb7M8p3Yp+9bMDHAprZ1z
	rzL1AVTN5+UjxZz4rQSBpMrlrYvVhaiwTza8uVKwtFWU0np+vED2y82i64v7R1V02B29AMmJ3YZ
	1hPn1kdimkiD7cyHyL7UMqlNRheso9qY=
X-Received: by 2002:a17:90a:c884:b0:353:3999:5c04 with SMTP id
 98e67ed59e1d1-353fed70e16mr1786608a91.17.1769510836548; Tue, 27 Jan 2026
 02:47:16 -0800 (PST)
MIME-Version: 1.0
References: <20260126092630.1800589-12-ardb+git@google.com>
 <20260126092630.1800589-20-ardb+git@google.com> <d0f2df03-21da-473f-ab89-64a964c18f08@arm.com>
 <CAMj1kXGsedZnV7GJZqo6Yfb4mi6YpMCu=fnHOwDib8-OxBij2g@mail.gmail.com> <1bd6e787-00af-4d4c-a882-a0b8fb7f6a2f@arm.com>
In-Reply-To: <1bd6e787-00af-4d4c-a882-a0b8fb7f6a2f@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 27 Jan 2026 11:47:05 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEJPPWe4JE7SBYuQMcdTwQHvPqBO9Djj=tcW3DsNknkpw@mail.gmail.com>
X-Gm-Features: AZwV_Qg8lKu-uI20uHzW8xMtxl2N0ls9Z64VrDBC_7ZMLKdMOXFmcoU5zbQe31U
Message-ID: <CAMj1kXEJPPWe4JE7SBYuQMcdTwQHvPqBO9Djj=tcW3DsNknkpw@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] arm64: mm: Don't abuse memblock NOMAP to check
 for overlaps
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, 
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

On Tue, 27 Jan 2026 at 11:39, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 27/01/2026 10:27, Ard Biesheuvel wrote:
> > On Tue, 27 Jan 2026 at 11:21, Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>
> >> On 26/01/2026 09:26, Ard Biesheuvel wrote:
> >>> From: Ard Biesheuvel <ardb@kernel.org>
> >>>
> >>> Now that the DRAM mapping routines respect existing table mappings and
> >>> contiguous block and page mappings, it is no longer needed to fiddle
> >>> with the memblock tables to set and clear the NOMAP attribute. Instead,
> >>> map the kernel text and rodata alias first, avoiding contiguous
> >>> mappings, so that they will not be added later when mapping the
> >>> memblocks.
> >>
> >> Should we do something similar for kfence? Currently we have
> >> arm64_kfence_alloc_pool() which marks some memory NOMAP then
> >> arm64_kfence_map_pool() which PTE-maps it and clears NOMAP. Presumably we could
> >> rationalize into a single function that does it all, prior to mapping the bulk
> >> of the linear map?
> >>
> >
> > Yeah, good point - I did not spot that but I will address it in the
> > next revision.
> >
> >>>
> >>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >>> ---
> >>>  arch/arm64/mm/mmu.c | 27 ++++++++------------
> >>>  1 file changed, 10 insertions(+), 17 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> >>> index 80587cd47ce7..18415d4743bf 100644
> >>> --- a/arch/arm64/mm/mmu.c
> >>> +++ b/arch/arm64/mm/mmu.c
> >>> @@ -1149,12 +1149,17 @@ static void __init map_mem(void)
> >>>               flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
> >>>
> >>>       /*
> >>> -      * Take care not to create a writable alias for the
> >>> -      * read-only text and rodata sections of the kernel image.
> >>> -      * So temporarily mark them as NOMAP to skip mappings in
> >>> -      * the following for-loop
> >>> +      * Map the linear alias of the [_text, __init_begin) interval
> >>> +      * as non-executable now, and remove the write permission in
> >>> +      * mark_linear_text_alias_ro() above (which will be called after
> >>> +      * alternative patching has completed). This makes the contents
> >>> +      * of the region accessible to subsystems such as hibernate,
> >>> +      * but protects it from inadvertent modification or execution.
> >>> +      * Note that contiguous mappings cannot be remapped in this way,
> >>> +      * so we should avoid them here.
> >>>        */
> >>> -     memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
> >>> +     __map_memblock(kernel_start, kernel_end, PAGE_KERNEL,
> >>> +                    flags | NO_CONT_MAPPINGS);
> >>
> >> So the reason to disallow cont mappings is because we need to modify the
> >> permissions later? It _is_ safe to change permissions on a live contiguous
> >> mapping in this way. That was clarified in the architecture a couple of years
> >> back and we rely on it for contpte_wrprotect_ptes(); see comment there.
> >>
> >
> > OK, good to know - I was hoping to get your take on this ...
> >
> >> I think we could relax this?
> >>
> >
> > OK, I suppose that means that we can drop the NO_CONT_MAPPINGS here,
> > but we still need to map the kernel text/rodata alias initially to
> > ensure that no block mappings are created that would need to broken
> > down, right?
>
> Yes, but...
>
> I think your intent is that the multiple __map_memblock() calls are just
> controlling the allowed leaf mapping sizes.

Indeed.

> It becomes problematic if the 2
> calls use different permissions... which they do.
>
> PAGE_KERNEL vs pgprot_tagged(PAGE_KERNEL).
>
> Is it possible that the text/rodata section ends up tagged, which is not intended?
>


OK so toggling the R/O attribute on a live contiguous mapping is
permitted (provided that ultimately, the entire contiguous region is
updated accordingly) but the same doesn't apply to MT_NORMAL vs
MT_NORMAL_TAGGED, right?

So let's use just the same prot and flags for the initial mapping, and
use MT_NORMAL_TAGGED when we remap the text alias R/O.

