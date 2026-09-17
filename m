Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0339C982D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 13:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNgpEuFxkLpwQVUTRb/HejZ0tN6jXsHgSl5ZBTQhmMs=; b=Wii6z21aiv3T8O++IN1ouCJ6dt
	obIQcGo/joNwrGzH83nzjCGNYKYOWptyngVnyLW53sF+rsuH1FJSfyXxoAELcdm+zaJ7hx8TbFivh
	kax+puHm3sAJdI+rJ2PG2GRRei9uEHLx7mf1dU+/O5ghQcJxxcF+KweNRWQ+QBartVv/l1UeuwvnE
	5NgVFzhe2RkaakydKW15wdUQWlJdpT9tR+EMjNxLTh7p9lKME41jBnClLYU4jZ+s0GrVMqwViFdpm
	uWh3mk8M69H72QG6y4I8wVTfFrwVSLOJCy4N2hDHvvHkSyn+hRWzBpI4kLwW5qjjfFbqHrP0W/3mY
	ErxCg+Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Bw9-0000000BNWt-1DkC;
	Thu, 17 Sep 2026 13:14:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Bw6-0000000BNWV-3gjz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 13:13:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F4188600D4;
	Thu, 17 Sep 2026 13:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EAF31F000FF;
	Thu, 17 Sep 2026 13:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789650837;
	bh=PNgpEuFxkLpwQVUTRb/HejZ0tN6jXsHgSl5ZBTQhmMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n+iXY1iBZUiYhHQNX3M/KedAqPFUcruQCCfT+Jk8iObh88EdMCvSpWvKnffaB02Xo
	 agJz757+ipCx0fEOOG9hs/rCIzNI1q9suqvwygogxGEIGLE1C9Zr9c002GK9RFs+o5
	 ttBilpJFfy0p2Cg64LZ6qB2WnKg8T5fCVz/QvO4c4TShM+7kpLtOG1g1A6GItLtxMa
	 CiNmBKk3znnL5XXHqG/vKtJxD1fIiuioPRKURvHKoc+5NT5U2irwDk2suHKuDlcKuE
	 lmp/qV5ugvCwtOCqOt7vu9JahWqrm0GzUV7ZWQ+aIVe7VTilrQkBsQ1pfxsrRxW/nE
	 GuFCCseLX91iA==
Date: Thu, 17 Sep 2026 16:13:51 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, liulhong617 <liulhong617@gmail.com>
Subject: Re: [PATCH] arm64: mm: Fix pfn_is_map_memory() misreporting mapped
 memory
Message-ID: <aqvnj4jzxG-pXvYh@kernel.org>
References: <20260908162033.74509-1-vladimir.murzin@arm.com>
 <947a1506-dfe4-4906-9673-6a7227946433@app.fastmail.com>
 <a2b4186d-b3b0-4543-9f77-505e8ae67ae8@arm.com>
 <01f1f6d9-e10f-43f9-b731-f6393010a11c@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01f1f6d9-e10f-43f9-b731-f6393010a11c@app.fastmail.com>
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

On Thu, Sep 17, 2026 at 02:34:57PM +0200, Ard Biesheuvel wrote:
> On Thu, 17 Sep 2026, at 14:26, Vladimir Murzin wrote:
> > On 9/16/26 11:13, Ard Biesheuvel wrote:
> >> (cc Mike)
> >> 
> >> On Tue, 8 Sep 2026, at 18:20, Vladimir Murzin wrote:
> >>> Commit 7ace06a01efa ("arm64: mm: fix accidental linear mapping of
> >>> no-map reserved memory") removed sub-page no-map regions from the
> >>> linear mapping. However, pfn_is_map_memory() can still report that
> >>> such a region is mapped.
> >>>
> >>> For instance, with 64K pages, say we have
> >>>
> >>> normal:        ...–0xa2007fff
> >>> no-map: 0xa2008000–0xa200ffff
> >>> normal: 0xa2010000–...
> >>>
> >>> The range 0xa2000000–0xa200ffff is not linearly mapped, but
> >>> pfn_is_map_memory(__phys_to_pfn(0xa2008000)) aligns the address to
> >>> page granularity and passes 0xa2000000 to memblock_is_map_memory().
> >>> That address belongs to the preceding normal memblock region, so the
> >>> no-map region is ignored and the function returns true.
> >>>
> >>> Fix that by checking if entire page is subset of memory block.
> >>>
> >>> Fixes: 7ace06a01efa ("arm64: mm: fix accidental linear mapping of 
> >>> no-map reserved memory")
> >>> Assisted-by: LLM
> >>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> >>> ---
> >>>  arch/arm64/mm/init.c | 3 ++-
> >>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> >>> index fbf215ecc7d0..5da80e1e1727 100644
> >>> --- a/arch/arm64/mm/init.c
> >>> +++ b/arch/arm64/mm/init.c
> >>> @@ -172,7 +172,8 @@ int pfn_is_map_memory(unsigned long pfn)
> >>>  	if (PHYS_PFN(addr) != pfn)
> >>>  		return 0;
> >>>
> >>> -	return memblock_is_map_memory(addr);
> >>> +	return memblock_is_region_memory(addr, PAGE_SIZE) &&
> >>> +		memblock_is_map_memory(addr);
> >>>  }
> >>>  EXPORT_SYMBOL(pfn_is_map_memory);
> >>>
> >> memblock_is_region_memory() only tells you whether the range in
> >> question is covered by a single entry in memblock.memory.regions[].
> >> 
> >> memblock has other flags, which may or may not be set on sub-page
> >> regions too. So I don't think this is the right solution in the
> >> general case, even if it fixes your example.
> >> 
> >
> > Ack.
> >
> >> Given that the no-map attribute fundamentally only applies to page
> >> granular regions, it would make sense to round those outwards
> >> whenever they are created.
> >> 
> >> --- a/mm/memblock.c
> >> +++ b/mm/memblock.c
> >> @@ -1119,6 +1119,10 @@
> >>  int __init_memblock memblock_mark_nomap(phys_addr_t base, phys_addr_t size)
> >>  {
> >> +       phys_addr_t end = PAGE_ALIGN(base + size);
> >> +
> >> +       base &= PAGE_MASK;
> >> +       size = end - base;
> >>         return memblock_setclr_flag(&memblock.memory, base, size, 1, MEMBLOCK_NOMAP);
> >>  }
> >>  
> >> 
> >
> > Should the same be applied to memblock_clear_nomap()?
> >
> 
> Yes.
> 
> > This is indeed much nicer way to fix the problem! Now, when no-map is
> > rounded outwards, do we still need 7ace06a01efa?
> >
> 
> Probably not, but there are some corner cases to consider before we
> go down this route:
> - what happens when marking a range no-map where the outward rounding
>   would exceed the limits of the existing memblock memory range?

AFAIR it's fine, memblock_isolate will clamp the update.
Didn't check the code though.

> - what happens when removing a non-page aligned region from memblock
>   that intersects with a (page aligned) no-map region?

It will make the nomap region non-page aligned.

-- 
Sincerely yours,
Mike.

