Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856C5D2D8F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 11:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmMOKN2qirqA2KNNzaLYt6+LCGkhJTLmZz5dG7ntt0s=; b=NJjbMc1C/ms49MamXu7hAzvG9p
	OUbqutv1K47iqm1UPNLMsmetC10iXIy9HJWe3gWA5hQT6vnqu6yDy+PyVmKUNCpI8EGE8PFSHoczn
	51AUH/bLYDy+SeVYk1330ZLTnRSFTPynb44xXOPPK9/LqhGaRdb0laAI3nUgKj3VEvGaYl1T7tFOf
	/ma2PQXbWTshwZug3PohepZV2+CorVNJxOJR183UJQWTNY4H14+cdvbxWV/MUONTXNZ+YsQkgQknO
	vsKzab4KiEmWBoMlJucjO9X1n+pGf56uDOHA7mKL7a8rWLwiNKld4UV0/86tqap2trYnQZ/bG2NxK
	0CvgF0PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgr5-0000000E7M8-0bA7;
	Tue, 27 Jan 2026 11:03:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgqu-0000000E7KY-1F3m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 11:03:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 47FE160127
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 11:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B56C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 11:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769511799;
	bh=2zl+QHThtfZjXts0MeAz4C6OC5tpxFYl74GDP/a4psU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RQJ1hv5xcVN1fPSKnBiuM1DkSaOGPWKS2cqyrdGBvX15FHK4meoa6oiTn0GP1+/su
	 duxH+jNnt5u2tO3jdvBLW3TYsKwizh5gyusGgFSg65PH1mRnGRAh7dhpyIIh/iWOEv
	 qD2VRnb6zAcJjcCn/AFKVjzTzpts54IQQZIZdfjCnGgJn8I8KVap9LHpMLT1rQU5Eq
	 1NBE5DW58dw9SLbwFOSoouZK1qi/spD1OB7p5ZvRj3TLAToJ4aiBjeY6qd3UES7Y34
	 V/hDvauLT9czIXopkcffArRlPizhPXbTynoSdfXgcPdpHsa+wIVpluWhfrFwuS0Kpj
	 pywDwIQ563PQg==
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a12ebe4b74so54176515ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 03:03:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWB547F9gpMzVXptNcsRYKAAWQkZHYmlI7RI3hUVxSBE7MOqytCRpv1op78QBi7TSXW1S7WZ04ApKQnWxAqVo4P@lists.infradead.org
X-Gm-Message-State: AOJu0YzNolJ9ksdVdWNKbI9AlkVk3dq1cJ51onIyvnzJ9EZDpL375Rwf
	rFwJOiTLLGS+5CDjSnlHJZtPG8s3c15IMbR7pVgnAf+M+3ZEX51tgHeGw9pJOr6J3GaAuYHd6Xb
	Q+U1Ylq/yTtMUXmTW/GBnIiJPemNE+Tk=
X-Received: by 2002:a17:903:8cd:b0:2a7:ca83:5b7a with SMTP id
 d9443c01a7336-2a870db1634mr13667515ad.18.1769511798451; Tue, 27 Jan 2026
 03:03:18 -0800 (PST)
MIME-Version: 1.0
References: <20260126092630.1800589-12-ardb+git@google.com>
 <20260126092630.1800589-20-ardb+git@google.com> <d0f2df03-21da-473f-ab89-64a964c18f08@arm.com>
 <CAMj1kXGsedZnV7GJZqo6Yfb4mi6YpMCu=fnHOwDib8-OxBij2g@mail.gmail.com>
 <1bd6e787-00af-4d4c-a882-a0b8fb7f6a2f@arm.com> <CAMj1kXEJPPWe4JE7SBYuQMcdTwQHvPqBO9Djj=tcW3DsNknkpw@mail.gmail.com>
 <678f6b3f-8d1a-4253-8125-28b8ee89842b@arm.com>
In-Reply-To: <678f6b3f-8d1a-4253-8125-28b8ee89842b@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 27 Jan 2026 12:03:07 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHA_ndSDVtJ+obzh1ijPd_vuKQTiA+S1xZ=aqOcnbitmA@mail.gmail.com>
X-Gm-Features: AZwV_QhWBxfymrsXCgAe2ln0V05e7v6FCgkhTR5LOPngaK-F6uDSwWmEBOeeCTU
Message-ID: <CAMj1kXHA_ndSDVtJ+obzh1ijPd_vuKQTiA+S1xZ=aqOcnbitmA@mail.gmail.com>
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

On Tue, 27 Jan 2026 at 12:00, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 27/01/2026 10:47, Ard Biesheuvel wrote:
> > On Tue, 27 Jan 2026 at 11:39, Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>
> >> On 27/01/2026 10:27, Ard Biesheuvel wrote:
> >>> On Tue, 27 Jan 2026 at 11:21, Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>>>
> >>>> On 26/01/2026 09:26, Ard Biesheuvel wrote:
> >>>>> From: Ard Biesheuvel <ardb@kernel.org>
> >>>>>
> >>>>> Now that the DRAM mapping routines respect existing table mappings and
> >>>>> contiguous block and page mappings, it is no longer needed to fiddle
> >>>>> with the memblock tables to set and clear the NOMAP attribute. Instead,
> >>>>> map the kernel text and rodata alias first, avoiding contiguous
> >>>>> mappings, so that they will not be added later when mapping the
> >>>>> memblocks.
> >>>>
> >>>> Should we do something similar for kfence? Currently we have
> >>>> arm64_kfence_alloc_pool() which marks some memory NOMAP then
> >>>> arm64_kfence_map_pool() which PTE-maps it and clears NOMAP. Presumably we could
> >>>> rationalize into a single function that does it all, prior to mapping the bulk
> >>>> of the linear map?
> >>>>
> >>>
> >>> Yeah, good point - I did not spot that but I will address it in the
> >>> next revision.
> >>>
> >>>>>
> >>>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >>>>> ---
> >>>>>  arch/arm64/mm/mmu.c | 27 ++++++++------------
> >>>>>  1 file changed, 10 insertions(+), 17 deletions(-)
> >>>>>
> >>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> >>>>> index 80587cd47ce7..18415d4743bf 100644
> >>>>> --- a/arch/arm64/mm/mmu.c
> >>>>> +++ b/arch/arm64/mm/mmu.c
> >>>>> @@ -1149,12 +1149,17 @@ static void __init map_mem(void)
> >>>>>               flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
> >>>>>
> >>>>>       /*
> >>>>> -      * Take care not to create a writable alias for the
> >>>>> -      * read-only text and rodata sections of the kernel image.
> >>>>> -      * So temporarily mark them as NOMAP to skip mappings in
> >>>>> -      * the following for-loop
> >>>>> +      * Map the linear alias of the [_text, __init_begin) interval
> >>>>> +      * as non-executable now, and remove the write permission in
> >>>>> +      * mark_linear_text_alias_ro() above (which will be called after
> >>>>> +      * alternative patching has completed). This makes the contents
> >>>>> +      * of the region accessible to subsystems such as hibernate,
> >>>>> +      * but protects it from inadvertent modification or execution.
> >>>>> +      * Note that contiguous mappings cannot be remapped in this way,
> >>>>> +      * so we should avoid them here.
> >>>>>        */
> >>>>> -     memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
> >>>>> +     __map_memblock(kernel_start, kernel_end, PAGE_KERNEL,
> >>>>> +                    flags | NO_CONT_MAPPINGS);
> >>>>
> >>>> So the reason to disallow cont mappings is because we need to modify the
> >>>> permissions later? It _is_ safe to change permissions on a live contiguous
> >>>> mapping in this way. That was clarified in the architecture a couple of years
> >>>> back and we rely on it for contpte_wrprotect_ptes(); see comment there.
> >>>>
> >>>
> >>> OK, good to know - I was hoping to get your take on this ...
> >>>
> >>>> I think we could relax this?
> >>>>
> >>>
> >>> OK, I suppose that means that we can drop the NO_CONT_MAPPINGS here,
> >>> but we still need to map the kernel text/rodata alias initially to
> >>> ensure that no block mappings are created that would need to broken
> >>> down, right?
> >>
> >> Yes, but...
> >>
> >> I think your intent is that the multiple __map_memblock() calls are just
> >> controlling the allowed leaf mapping sizes.
> >
> > Indeed.
> >
> >> It becomes problematic if the 2
> >> calls use different permissions... which they do.
> >>
> >> PAGE_KERNEL vs pgprot_tagged(PAGE_KERNEL).
> >>
> >> Is it possible that the text/rodata section ends up tagged, which is not intended?
> >>
> >
> >
> > OK so toggling the R/O attribute on a live contiguous mapping is
> > permitted (provided that ultimately, the entire contiguous region is
> > updated accordingly) but the same doesn't apply to MT_NORMAL vs
> > MT_NORMAL_TAGGED, right?
>
> This is the rule:
>
> RJQQTC
> For a TLB lookup in a contiguous region mapped by translation table entries that
> have consistent values for the Contiguous bit, but have the OA, attributes, or
> permissions misprogrammed, that TLB lookup is permitted to produce an OA, access
> permissions, and memory attributes that are consistent with any one of the
> programmed translation table values.
>
> So, yes, it is fine to modify the attributes (and I assume the memory type
> counts as attributes) on the live mapping...
>

OK.

> >
> > So let's use just the same prot and flags for the initial mapping, and
> > use MT_NORMAL_TAGGED when we remap the text alias R/O.
>
> ...but that wasn't my point. I belive the intent is that all of the linear map
> uses MT_NORMAL_TAGGED except for the kernel text and rodata, which uses
> MT_NORMAL. In some configs (e.g. force_pte_mapping() == true), your change will
> result in all the linear map, including text and rodata being MT_NORMAL_TAGGED.
>

I didn't think that would matter tbh. But if it does, are we fine as
long as we change it back to MT_NORMAL by the time we remap the region
read-only?

