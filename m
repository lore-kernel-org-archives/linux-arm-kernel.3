Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1826C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 16:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=te8IhI4xwAzF7vm7X/2Es0UaIQpwnetHXhVePooTAMA=; b=DGPtceQWe4voRWM5tOz6dnou4d
	yfpeH0GqcTqfUJeLoinPD+Vp3IjOxDCmb0/pdFOqqCutSIQppNVM3J8qi/XwwpImOK+my98CldioX
	+MlIU4pP+X+0UXC8YHJhyV769ZNBHDnsyVZJOUtk6wGzFZ7Qz2r7b7R/AoG7GVBVjLRDXWP4POszm
	oI52kWUj6UfV0BKJEWn5GOFPotMPPt6kpCbJN2pgto2puERNzh4nRZqIjJn+WJis1u1QMVlfJmsvY
	a63MYm1KpUpUef6gdNWOktuJM3Q7PRlz+F2thGQrQ/lXcK/+IzusxYpyM2/wTFAqvrlXeLnqc4gWS
	nL0U25Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfgl-00000003Jj9-2Lgx;
	Mon, 10 Mar 2025 16:09:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treKv-00000002xlt-2EZB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 14:42:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEE0416F2;
	Mon, 10 Mar 2025 07:42:43 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06F7F3F673;
	Mon, 10 Mar 2025 07:42:30 -0700 (PDT)
Date: Mon, 10 Mar 2025 14:42:24 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] arm64/mm: Create level specific section mappings in
 map_range()
Message-ID: <Z876UI5-xGRHl4td@J2N7QTR9R3.cambridge.arm.com>
References: <20250310062812.216031-1-anshuman.khandual@arm.com>
 <Z87FFqV03Pd0-NXl@J2N7QTR9R3.cambridge.arm.com>
 <b1fb982a-4936-4c18-aaad-3e8e8f61bccc@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1fb982a-4936-4c18-aaad-3e8e8f61bccc@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_074233_665303_542BB51C 
X-CRM114-Status: GOOD (  47.44  )
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

On Mon, Mar 10, 2025 at 01:48:53PM +0000, Ryan Roberts wrote:
> On 10/03/2025 10:55, Mark Rutland wrote:
> > On Mon, Mar 10, 2025 at 11:58:12AM +0530, Anshuman Khandual wrote:
> >> Currently PMD section mapping mask i.e PMD_TYPE_SECT is used while creating
> >> section mapping at all page table levels except the last level. This works
> >> fine as the section mapping masks are exactly the same (0x1UL) for all page
> >> table levels.
> >>
> >> This will change in the future with D128 page tables that have unique skip
> >> level values (SKL) required for creating section mapping at different page
> >> table levels. Hence use page table level specific section mapping macros
> >> instead of the common PMD_TYPE_SECT. While here also ensure that a section
> >> mapping is only created on page table levels which could support that on a
> >> given page size configuration otherwise fall back to create table entries.
> >>
> >> Cc: Catalin Marinas <catalin.marinas@arm.com>
> >> Cc: Will Deacon <will@kernel.org>
> >> Cc: Ryan Roberts <ryan.roberts@arm.com>
> >> Cc: Ard Biesheuvel <ardb@kernel.org>
> >> Cc: linux-kernel@vger.kernel.org
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> >> ---
> >> This patch applies on v6.14-rc6
> >>
> >> Changes in V2:
> >>
> >> - Dropped PGD_TYPE_SECT macro and its instance from map_range()
> >> - Create table entries on levels where section mapping is not possible
> > 
> > On the last version, there was talk of an extant bug:
> > 
> >   https://lore.kernel.org/all/5f1b36e2-6455-44d9-97b0-253aefd5024f@arm.com/
> > 
> > ... did that turn out to not be the case?
> 
> In the absence of Ard (or anyone else) telling me it's not a bug, then I'll
> continue to assert that it is a bug, and should have a Fixes tag, and Cc stable.

Ok -- can we please have a description of the bug, and a fix
specifically for that, before we try to reshape this for D128?

IIUC the problem is that for a sufficiently large (and aligned) extent
of physical memory, we might try to create a block mapping larger than
the HW supports?

With that in mind, my earlier comment about LPA2 and blocks at level-0
is particularly relevant...

> >> Changes in V1:
> >>
> >> https://lore.kernel.org/all/20250303041834.2796751-1-anshuman.khandual@arm.com/
> >>
> >>  arch/arm64/kernel/pi/map_range.c | 38 +++++++++++++++++++++++++++++---
> >>  1 file changed, 35 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
> >> index 2b69e3beeef8..25a70c675c4d 100644
> >> --- a/arch/arm64/kernel/pi/map_range.c
> >> +++ b/arch/arm64/kernel/pi/map_range.c
> >> @@ -11,6 +11,22 @@
> >>  
> >>  #include "pi.h"
> >>  
> >> +static bool sect_supported(int level)
> > 
> > What exactly is this function supposed to indicate?
> > 
> > Due to the 'default' case, it'll return true for level-3 tables where
> > sections/blocks aren't possible, but pages are. So maybe this is just
> > misnamed, and wants to be something like "leaf_supported()" ?
> 
> I always thought a "section" was (outdated?) linux terminology for a leaf
> mapping at any level. For my understanding, I think you're saying it
> specifically means a leaf mapping at any level other than the last level, so it
> is actually equivalent to a "block" mapping in the Arm ARM?

Yep -- "section" is old style terminology that's (roughly) equivalent to
"block" at level 2. When the arm64 port got written, the
"section"/"sect" terminology was inherited to mean "block" at any level.
Ideally we'd clean that up.

Historically ARM had "small pages", "large pages", "sections", and
"supersections".

See the ARMv7-A ARM (ARM DDI 0406C.d), page B3-1321.

> Either way, the intended semantic for this function is "is it valid to create a
> leaf mapping at the specified level?" where leaf = block or page.

Cool. With that in mind, having "leaf" in the name would be better.

Though TBH, maybe it makes more sense to split this up into separate
levels (as with the code in arch/arm64/mm/mmu.c) and handle each level
explicitly with a separate function. That way each level's check can be
handled within that level's function, and we can use the right types,
etc. It feels like that might be better for D128 in future?

Mark.

> 
> Thanks,
> Ryan
> 
> > 
> >> +{
> >> +	switch (level) {
> >> +	case -1:
> >> +		return false;
> >> +	case 0:
> >> +		if (IS_ENABLED(CONFIG_ARM64_16K_PAGES) ||
> >> +		    IS_ENABLED(CONFIG_ARM64_64K_PAGES))
> >> +			return false;
> >> +		else
> >> +			return true;
> > 
> > Surely:
> > 
> > 	case 0:
> > 		return IS_ENABLED(CONFIG_ARM64_4K_PAGES);
> > 
> > ... though that's only the case when LPA2 is supported and TCR_ELx.DS is
> > set.
> > 
> >> +	default:
> >> +		return true;
> > 
> > As above, what is this supposed to return for level-3 tables where
> > sections/blocks aren't possible?
> > 
> > Can we BUILD_BUG() for bogus levels?
> > 
> >> +	}
> >> +}
> >> +
> >>  /**
> >>   * map_range - Map a contiguous range of physical pages into virtual memory
> >>   *
> >> @@ -44,13 +60,29 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
> >>  	 * Set the right block/page bits for this level unless we are
> >>  	 * clearing the mapping
> >>  	 */
> >> -	if (protval)
> >> -		protval |= (level < 3) ? PMD_TYPE_SECT : PTE_TYPE_PAGE;
> >> +	if (protval && sect_supported(level)) {
> > 
> > The existing code is trying to find the leaf prot for a given level of
> > table, so as-is checking sect_supported() is at best misleading.
> > 
> > If we're going to do something different below based on
> > sect_supported(), I reckon this should be moved into the path where
> > sect_supported() returned true, maybe factored out into a helper for
> > clarity.
> > 
> > Mark.
> > 
> >> +		switch (level) {
> >> +		case 3:
> >> +			protval |= PTE_TYPE_PAGE;
> >> +			break;
> >> +		case 2:
> >> +			protval |= PMD_TYPE_SECT;
> >> +			break;
> >> +		case 1:
> >> +			protval |= PUD_TYPE_SECT;
> >> +			break;
> >> +		case 0:
> >> +			protval |= P4D_TYPE_SECT;
> >> +			break;
> >> +		default:
> >> +			break;
> >> +		}
> >> +	}
> >>  
> >>  	while (start < end) {
> >>  		u64 next = min((start | lmask) + 1, PAGE_ALIGN(end));
> >>  
> >> -		if (level < 3 && (start | next | pa) & lmask) {
> >> +		if ((level < 3 && (start | next | pa) & lmask) || !sect_supported(level)) {
> >>  			/*
> >>  			 * This chunk needs a finer grained mapping. Create a
> >>  			 * table mapping if necessary and recurse.
> >> -- 
> >> 2.25.1
> >>
> >>
> 

