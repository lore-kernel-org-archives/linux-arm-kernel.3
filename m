Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA271C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 09:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xc9hZbGL4Z8kE1LiNA9thro19FzeNutdm/vI7po0tz8=; b=n3p9m3/ZSMa7wWjyvU+orf9yuh
	IEgyTeSAfqFohVzdsVRbR/0sJLPaTKUOuJ+CBFqxoYxKsTuYWDjLDLaS3MCbnWCVPOJHIODHBaNKa
	al8u8Rg0utWlJ+x8/Kp3eN2ouOQkFEN9Uij64zZGxJyPMj5JX5/u1zJMvCtEtoZltBR0dvbJHrefH
	jYbVrMBnJo+Gb+5FSZUejO2OFSRcKqg/Y3qogy6thQkDimuYS9+oOMVqqPnoC6BDUHLWhoEyv6oiE
	fi+w5PftxISbFuxEXAKjojTG5fRGwKIHb0EIlCIkUSE41KCmsj4sb/r9RMpuzVyuzLY0JdSbmsHRS
	DuvD5uyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78dl-0000000B1xf-48LF;
	Thu, 17 Sep 2026 09:42:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78dk-0000000B1x2-1j8M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 09:42:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8746E60204;
	Thu, 17 Sep 2026 09:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFBE1F00893;
	Thu, 17 Sep 2026 09:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789638167;
	bh=Xc9hZbGL4Z8kE1LiNA9thro19FzeNutdm/vI7po0tz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nGEH+r1z8QrmojwMkChmFMouRM0ggrGJWXli5RKeT/rRvesjfsgUMp7adXGBSpDZj
	 LTERzZcaJfNWFWbiPJC8UtwyrwNCNIO+iRymkMsk6x+7XA0PaC9uOKR6YrhwCMfX9Z
	 bNERDzFIGuMzUMBjD+vteFgajJTrNt2vXkMJwsYkY88qaFHFoMMWDIs+2E1qotLzJc
	 NS9LFeVJ5Tmbsm22FX5WGyKZ9s2810poAdB3TyA8jlHrLWMm7x3UhAVpx+q0sI72/d
	 XRxESX88veYGDczQqIppu/pHublR3GGmVd84+WWA/t+wUDb0Ky/21PTXlhsz7KtuM2
	 UWSLcTi4j/TIA==
Date: Thu, 17 Sep 2026 12:42:41 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, liulhong617 <liulhong617@gmail.com>
Subject: Re: [PATCH] arm64: mm: Fix pfn_is_map_memory() misreporting mapped
 memory
Message-ID: <aqu2EReSAxYG_8sb@kernel.org>
References: <20260908162033.74509-1-vladimir.murzin@arm.com>
 <947a1506-dfe4-4906-9673-6a7227946433@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <947a1506-dfe4-4906-9673-6a7227946433@app.fastmail.com>
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

On Wed, Sep 16, 2026 at 12:13:21PM +0200, Ard Biesheuvel wrote:
> (cc Mike)
> 
> On Tue, 8 Sep 2026, at 18:20, Vladimir Murzin wrote:
> > Commit 7ace06a01efa ("arm64: mm: fix accidental linear mapping of
> > no-map reserved memory") removed sub-page no-map regions from the
> > linear mapping. However, pfn_is_map_memory() can still report that
> > such a region is mapped.
> >
> > For instance, with 64K pages, say we have
> >
> > normal:        ...–0xa2007fff
> > no-map: 0xa2008000–0xa200ffff
> > normal: 0xa2010000–...
> >
> > The range 0xa2000000–0xa200ffff is not linearly mapped, but
> > pfn_is_map_memory(__phys_to_pfn(0xa2008000)) aligns the address to
> > page granularity and passes 0xa2000000 to memblock_is_map_memory().
> > That address belongs to the preceding normal memblock region, so the
> > no-map region is ignored and the function returns true.
> >
> > Fix that by checking if entire page is subset of memory block.
> >
> > Fixes: 7ace06a01efa ("arm64: mm: fix accidental linear mapping of 
> > no-map reserved memory")
> > Assisted-by: LLM
> > Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> > ---
> >  arch/arm64/mm/init.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> > index fbf215ecc7d0..5da80e1e1727 100644
> > --- a/arch/arm64/mm/init.c
> > +++ b/arch/arm64/mm/init.c
> > @@ -172,7 +172,8 @@ int pfn_is_map_memory(unsigned long pfn)
> >  	if (PHYS_PFN(addr) != pfn)
> >  		return 0;
> > 
> > -	return memblock_is_map_memory(addr);
> > +	return memblock_is_region_memory(addr, PAGE_SIZE) &&
> > +		memblock_is_map_memory(addr);
> >  }
> >  EXPORT_SYMBOL(pfn_is_map_memory);
> > 
> 
> memblock_is_region_memory() only tells you whether the range in
> question is covered by a single entry in memblock.memory.regions[].
> 
> memblock has other flags, which may or may not be set on sub-page
> regions too. So I don't think this is the right solution in the
> general case, even if it fixes your example.
> 
> Given that the no-map attribute fundamentally only applies to page
> granular regions, it would make sense to round those outwards
> whenever they are created.
> 
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -1119,6 +1119,10 @@
>  int __init_memblock memblock_mark_nomap(phys_addr_t base, phys_addr_t size)
>  {
> +       phys_addr_t end = PAGE_ALIGN(base + size);
> +
> +       base &= PAGE_MASK;
> +       size = end - base;
>         return memblock_setclr_flag(&memblock.memory, base, size, 1, MEMBLOCK_NOMAP);
>  }

Makes sense to me, just lacks kernel-doc update ;-)

> Note that I recently removed the frivolous use of MEMBLOCK_NOMAP in
> __map_mem() so the remaining calls should mostly be true reservations
> originating from the boot environment.

There is still riscv :)

-- 
Sincerely yours,
Mike.

