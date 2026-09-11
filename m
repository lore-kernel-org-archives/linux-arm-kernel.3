Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B79C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+CollVIs3WKtlsEgwjex5eGq8b1xHPyF3Fq5QdN4OI=; b=H5Jrw4+xu6hQ2pwyz89V0OinSr
	6U7scW59ivfBNzwXRHl2BgmfV4HS5E3x/s6lHemKbXKRk40XG4D0WsQIPoqKVvC27A/WjbfHZy2z2
	W4JDd0Y6Y0NKzQ7crJuRTQAGVv4eJ2cWWEYrlY30SSwx7KL7wCYPLOq1695fy+uBLg8apTUfnvaKr
	rvvB1MWOOEvAd2eTX/4L3vRunXS/WgjSmZGxMGUYlVbsj3lKM7IJqzuvPiWRTeaKYpo1YVFOPI4zi
	PGFl+A+h9GVWvk+pNh10utmjDR9wRKKYehCGiPOSns5TLiW9DtYcMy/oRrOqlflQ04uVwNQNLJlEm
	9Dn0zo9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50Tn-0000000Gdlf-1HsT;
	Fri, 11 Sep 2026 12:35:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50Tm-0000000GdlY-1lRx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 12:35:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 80FBA6020C;
	Fri, 11 Sep 2026 12:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199DF1F00893;
	Fri, 11 Sep 2026 12:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789130141;
	bh=m+CollVIs3WKtlsEgwjex5eGq8b1xHPyF3Fq5QdN4OI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EIwSTrTQe4v//APWTAoDrE6dmXEMd1LYs2GwTf0kUdXRnVk4oZV15LhPRZI8ympNt
	 VSC78vZ5GVhVGVq/0RLFA0INPCdOfJ7Wn0P08pCXWW+ikSVF3bYs3y+8gG+2rgYBBm
	 qNq3gfjXctPYJj/oLb9iWysry4TNvwaTNOJfcPFu1ApG1B50jEdHVMHXmVLZA/c7RW
	 b/d2qAMET1vA2FQ3+TyxaerLpYrW7nR4fgrHpUfgnoBgzypXLqBaincp6DxO2aaP+4
	 Xpy7KOMgj19it1yBhgajK+x8RhfrAWwl2pMajWGkAyG9B9bRMFMg3DShbzj/cHskzI
	 0bLoHtkepj4qw==
Date: Fri, 11 Sep 2026 13:35:36 +0100
From: Will Deacon <will@kernel.org>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	liulhong617@gmail.com, ardb@kernel.org
Subject: Re: [PATCH] arm64: mm: Fix pfn_is_map_memory() misreporting mapped
 memory
Message-ID: <aqP1mDC-gFhgHHZg@willie-the-truck>
References: <20260908162033.74509-1-vladimir.murzin@arm.com>
 <aqFflGnTdVQopWvQ@willie-the-truck>
 <8339f3d3-3f1b-44c6-b701-3d800642c5c8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8339f3d3-3f1b-44c6-b701-3d800642c5c8@arm.com>
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

On Thu, Sep 10, 2026 at 02:57:25PM +0100, Vladimir Murzin wrote:
> On 9/9/26 14:31, Will Deacon wrote:
> > On Tue, Sep 08, 2026 at 05:20:33PM +0100, Vladimir Murzin wrote:
> >> Commit 7ace06a01efa ("arm64: mm: fix accidental linear mapping of
> >> no-map reserved memory") removed sub-page no-map regions from the
> >> linear mapping. However, pfn_is_map_memory() can still report that
> >> such a region is mapped.
> >>
> >> For instance, with 64K pages, say we have
> >>
> >> normal:        ...–0xa2007fff
> >> no-map: 0xa2008000–0xa200ffff
> >> normal: 0xa2010000–...
> >>
> >> The range 0xa2000000–0xa200ffff is not linearly mapped, but
> >> pfn_is_map_memory(__phys_to_pfn(0xa2008000)) aligns the address to
> >> page granularity and passes 0xa2000000 to memblock_is_map_memory().
> >> That address belongs to the preceding normal memblock region, so the
> >> no-map region is ignored and the function returns true.
> >>
> >> Fix that by checking if entire page is subset of memory block.
> >>
> >> Fixes: 7ace06a01efa ("arm64: mm: fix accidental linear mapping of no-map reserved memory")
> >> Assisted-by: LLM
> >> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> >> ---
> >>  arch/arm64/mm/init.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> >> index fbf215ecc7d0..5da80e1e1727 100644
> >> --- a/arch/arm64/mm/init.c
> >> +++ b/arch/arm64/mm/init.c
> >> @@ -172,7 +172,8 @@ int pfn_is_map_memory(unsigned long pfn)
> >>  	if (PHYS_PFN(addr) != pfn)
> >>  		return 0;
> >>  
> >> -	return memblock_is_map_memory(addr);
> >> +	return memblock_is_region_memory(addr, PAGE_SIZE) &&
> >> +		memblock_is_map_memory(addr);
> >>  }
> > Yuck, this is really grotty :(
> > 
> > Can we at least predicate the extra memblock_is_region_memory() check on
> > having a page-size > 4k?
> > 
> 
> The same can happen with 4K page size and subpage no-map and I have not seen
> anything prohibiting subpage no-map ...

Ah yes, I made a similar observation during the review of the offending
commit. Oh well. Let's see what others think before we merge this.

Will

