Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C485C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TixM1+IUrYtSdrp0PZoLfQTpUcfWhPbpy3zROHng5c=; b=jmIeVVoNHskjF0GBM59en6S/DK
	wY1uSkM//Fh75nZtIHhYfpF/bNRgRc+7xuIO9wtnEjZMiAtYuR85d2mX+hG3fnAXtM9Kol8tg9IIH
	lRub/IA9eYxZtLiZLOOPPDCcL7FTOzQ/bX5ANP5zYY6F/Rg/z5Xcbw60ua5ZeR34/Vy+9b7NLBjtn
	bzOdrXL4ZYDQFpJbBIdqtvTJzyxDPEnD6eugl63XmP3ZFVA1JV8EoWI2D/f8ZLo/0IST1OudKkU83
	7LvlY6KFGUq0QYliFikwLUmc0B+v9KXJGe6L7Jnrchj6s9j+Lq0Wvi6JRo+fnTdH6GVvvtMBuEJjG
	+hnTS94Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mu3-0000000BgmO-1ceP;
	Thu, 24 Sep 2026 17:06:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mu1-0000000Bgm1-1BPJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:06:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D1EF601DE;
	Thu, 24 Sep 2026 17:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305E71F000FF;
	Thu, 24 Sep 2026 17:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790269592;
	bh=9TixM1+IUrYtSdrp0PZoLfQTpUcfWhPbpy3zROHng5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=btBZn0S9HCNXjZe78EQsL/onpDdftjtBgAhc7zkF9MAd7ZxdIvXKc52S7kB3QRR2r
	 whw0vvQkjE+AGmj39xNkQyG9q4EI3f2yGyJWCLID36R0LijAmvVKr/Xf1IfJOhKHFm
	 SG+c6PT6vnS4xhtWi2qvmm8B+PUlMOu9OF5BkpsLhhH5Vi5RiR6c3ztfZtKihJCCsm
	 t1JeQfD4QZgbUCcCB2XZKsJdpTgJD+s0RQ8Yc0bpWl1q+In26PWBQeIFpnk4UZwBmF
	 /Xfg0Y6QiO7CQqsUE0jzOE+S2ENZv+Uzsg3NGUuDEu04o7EMetVMsb9szct3iZDnow
	 CNoW6ITZHfoPw==
Date: Thu, 24 Sep 2026 20:06:26 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, liulhong617 <liulhong617@gmail.com>
Subject: Re: [PATCH] arm64: mm: Fix pfn_is_map_memory() misreporting mapped
 memory
Message-ID: <arVYkqm6wG5oQFD2@kernel.org>
References: <20260908162033.74509-1-vladimir.murzin@arm.com>
 <947a1506-dfe4-4906-9673-6a7227946433@app.fastmail.com>
 <a2b4186d-b3b0-4543-9f77-505e8ae67ae8@arm.com>
 <01f1f6d9-e10f-43f9-b731-f6393010a11c@app.fastmail.com>
 <aqv5MMXg45a_zEy-@kernel.org>
 <bdb4e693-883f-4b8f-9aa5-16649548b975@app.fastmail.com>
 <arIXL3CeIvE5HdoF@kernel.org>
 <7a6793e4-b2ef-46e0-a068-9166d3f10ea3@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a6793e4-b2ef-46e0-a068-9166d3f10ea3@app.fastmail.com>
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

On Thu, Sep 24, 2026 at 12:59:15PM +0200, Ard Biesheuvel wrote:
> On Tue, 22 Sep 2026, at 07:50, Mike Rapoport wrote:
> > On Thu, Sep 17, 2026 at 05:17:45PM +0200, Ard Biesheuvel wrote:
> >> On Thu, 17 Sep 2026, at 16:29, Mike Rapoport wrote:
> >> > On Thu, Sep 17, 2026 at 02:34:57PM +0200, Ard Biesheuvel wrote:
> >> >> 
> >> >> 
> >> >> On Thu, 17 Sep 2026, at 14:26, Vladimir Murzin wrote:
> >> >> > On 9/16/26 11:13, Ard Biesheuvel wrote:
> >> >> >> (cc Mike)
> >> >> >> 
> >> >> >> On Tue, 8 Sep 2026, at 18:20, Vladimir Murzin wrote:
> >> >> >>> Commit 7ace06a01efa ("arm64: mm: fix accidental linear mapping of
> >> >> >>> no-map reserved memory") removed sub-page no-map regions from the
> >> >> >>> linear mapping. However, pfn_is_map_memory() can still report that
> >> >> >>> such a region is mapped.
> >> >> >>>
> >> >> >>> For instance, with 64K pages, say we have
> >> >> >>>
> >> >> >>> normal:        ...–0xa2007fff
> >> >> >>> no-map: 0xa2008000–0xa200ffff
> >> >> >>> normal: 0xa2010000–...
> >> >> >>>
> >> >> >>> The range 0xa2000000–0xa200ffff is not linearly mapped, but
> >> >> >>> pfn_is_map_memory(__phys_to_pfn(0xa2008000)) aligns the address to
> >> >> >>> page granularity and passes 0xa2000000 to memblock_is_map_memory().
> >> >> >>> That address belongs to the preceding normal memblock region, so the
> >> >> >>> no-map region is ignored and the function returns true.
> >> >> >>>
> >> >> >>> Fix that by checking if entire page is subset of memory block.
> >> >> >>>
> >> >> >>> Fixes: 7ace06a01efa ("arm64: mm: fix accidental linear mapping of 
> >> >> >>> no-map reserved memory")
> >> >> >>> Assisted-by: LLM
> >> >> >>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> >> >> >>> ---
> >> >> >>>  arch/arm64/mm/init.c | 3 ++-
> >> >> >>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >> >> >>>
> >> >> >>> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> >> >> >>> index fbf215ecc7d0..5da80e1e1727 100644
> >> >> >>> --- a/arch/arm64/mm/init.c
> >> >> >>> +++ b/arch/arm64/mm/init.c
> >> >> >>> @@ -172,7 +172,8 @@ int pfn_is_map_memory(unsigned long pfn)
> >> >> >>>  	if (PHYS_PFN(addr) != pfn)
> >> >> >>>  		return 0;
> >> >> >>>
> >> >> >>> -	return memblock_is_map_memory(addr);
> >> >> >>> +	return memblock_is_region_memory(addr, PAGE_SIZE) &&
> >> >> >>> +		memblock_is_map_memory(addr);
> >> >> >>>  }
> >> >> >>>  EXPORT_SYMBOL(pfn_is_map_memory);
> >> >> >>>
> >> >> >> memblock_is_region_memory() only tells you whether the range in
> >> >> >> question is covered by a single entry in memblock.memory.regions[].
> >> >> >> 
> >> >> >> memblock has other flags, which may or may not be set on sub-page
> >> >> >> regions too. So I don't think this is the right solution in the
> >> >> >> general case, even if it fixes your example.
> >> >> >> 
> >> >> >
> >> >> > Ack.
> >> >> >
> >> >> >> Given that the no-map attribute fundamentally only applies to page
> >> >> >> granular regions, it would make sense to round those outwards
> >> >> >> whenever they are created.
> >> >> >> 
> >> >> >> --- a/mm/memblock.c
> >> >> >> +++ b/mm/memblock.c
> >> >> >> @@ -1119,6 +1119,10 @@
> >> >> >>  int __init_memblock memblock_mark_nomap(phys_addr_t base, phys_addr_t size)
> >> >> >>  {
> >> >> >> +       phys_addr_t end = PAGE_ALIGN(base + size);
> >> >> >> +
> >> >> >> +       base &= PAGE_MASK;
> >> >> >> +       size = end - base;
> >> >> >>         return memblock_setclr_flag(&memblock.memory, base, size, 1, MEMBLOCK_NOMAP);
> >> >> >>  }
> >> >> >>  
> >> >> >> 
> >> >> >
> >> >> > Should the same be applied to memblock_clear_nomap()?
> >> >> >
> >> >> 
> >> >> Yes.
> >> >> 
> >> >> > This is indeed much nicer way to fix the problem! Now, when no-map is
> >> >> > rounded outwards, do we still need 7ace06a01efa?
> >> >> >
> >> >> 
> >> >> Probably not, but there are some corner cases to consider before we
> >> >> go down this route:
> >> >> - what happens when marking a range no-map where the outward rounding
> >> >>   would exceed the limits of the existing memblock memory range?
> >> >> - what happens when removing a non-page aligned region from memblock
> >> >>   that intersects with a (page aligned) no-map region?
> >> >
> >> > Another thing is that maybe we should force memblock.memory only to page
> >> > aligned ranges. x86 uses memblock_trim_memory() for that since, like,
> >> > forever.
> >> >
> >> 
> >> Interesting. It would make sense to do the same on arm64.
> >> 
> >> But if a NOMAP region ends in the middle of a page, that code will trim on
> >> both sides, and throw away the shared page entirely.
> >
> > Honestly, I think the whole sub-page NOMAP is firmware's problem.
> 
> Not entirely. The firmware does not know whether the OS will use 4k pages
> or 64k pages, and rounding up all reservations to 64k just in case might
> be wasteful.

I keep forgetting about 64k pages :)
 
> So I think it is reasonable to require 4k alignment for NOMAP regions,
> and the OS should decide whether to round outward or not. It does mean
> that the firmware should avoid treating the misaligned pieces at the
> edges as memory where it can place things like initrd etc.
> 
> > While
> > rounding up in _mark_nomap() makes sense because we cannot "not map" a
> > sub-page range, I would add a big fat WARN_ON("FIX YOUR FIRMWARE") if the
> > rounding actually happens.
> >
> 
> I don't think that is very productive for 4k -> 64k rounding.

I agree that the strict requirement should be for 4k.
Or without loss of generality "minimal supported base page size" :)
 
> > As for the trimming on arm64, I believe that's relevant, because again, we
> > cannot really work with sub-page ranges in memblock.memory and they are
> > anyway discarded by for_each_mem_pfn_range() that's used all over mm
> > initialization.
> >
> 
> Yeah I think the rounding is needed in any case, but I don't think it is
> the firmware's job to mark unrelated adjacent memory as no-map only because
> the OS might decide to use a coarser granule.
 
I afraid this will create weird edge cases where firmware mixes parts of a
64k pages for no-map and other things at 4k granularity.

-- 
Sincerely yours,
Mike.

