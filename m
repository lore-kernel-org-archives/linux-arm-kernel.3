Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A66C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPRFtAHzZQWHydTGNo3ljJMJ73rEWSyL6BImw2aNV9M=; b=yumfr0HTRvTmz+wzTI1EXXJxkj
	ozy/KuP5/lRoZ6vITR/EdOd28CrqKawpgEL0XS0dmDIFSoBcGAVu9lK5IFxSD1+dVyuJZYCecVneO
	imTJWC7KBQK+ffca3tyuZz/b4+8ElKOCxLPwt+t7U9OfQsClfEKyjj/1/x1cBVB0FtsQjrBl2KtKy
	VKwoIQ9VHJ6kE83oBk7GrPZFOAYJVL66VNYDNsyBXJXhvkq2xH735HteSf9K0VrVKeua5bW1x6u33
	EBXNG1GkfEc/ohGaUoB7oC33vAdxjdc4F/QyP5g4KzZieyQhh4rDUpO51kgLrav8Y7LHtneBD+1L6
	XhAqrXMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ION-0000000Bo8H-11dW;
	Wed, 09 Sep 2026 13:31:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IOH-0000000Bo5i-0Uca
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:31:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C458A42DF6;
	Wed,  9 Sep 2026 13:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85FBB1F00A3F;
	Wed,  9 Sep 2026 13:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788960664;
	bh=zPRFtAHzZQWHydTGNo3ljJMJ73rEWSyL6BImw2aNV9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gRagOKuHsFmJCMxP9lj6on44pV1/2vi35AdhDy4UCJYc3xjD42Do/THHV4P1R/bAk
	 qlz1qk8/OsSdUUTkDAci0x19tjtqZiCCWFxAXYoVaSHwMMWLN9EeXDtQSIzawW7HOC
	 tM6oEPS64Yah8NUJBTTguGDQnI19zFzyrA5uwa82nahqhALocXXFc2yEPsPS9XugAK
	 LFkmY29wesIN5RnCpD29M8o4jcccwOXg7dF73LxIJSiVz+BOjJp5qO5e+3AYRXGpVQ
	 d+3DwKmtICwdEQsrcz7kHn+vT31XA17qAk32NEwWsNnhaZuiA9zy+k6v0jHHCmLK0y
	 KOA5A7TvYcsGA==
Date: Wed, 9 Sep 2026 14:31:00 +0100
From: Will Deacon <will@kernel.org>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	liulhong617@gmail.com, ardb@kernel.org
Subject: Re: [PATCH] arm64: mm: Fix pfn_is_map_memory() misreporting mapped
 memory
Message-ID: <aqFflGnTdVQopWvQ@willie-the-truck>
References: <20260908162033.74509-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908162033.74509-1-vladimir.murzin@arm.com>
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

On Tue, Sep 08, 2026 at 05:20:33PM +0100, Vladimir Murzin wrote:
> Commit 7ace06a01efa ("arm64: mm: fix accidental linear mapping of
> no-map reserved memory") removed sub-page no-map regions from the
> linear mapping. However, pfn_is_map_memory() can still report that
> such a region is mapped.
> 
> For instance, with 64K pages, say we have
> 
> normal:        ...–0xa2007fff
> no-map: 0xa2008000–0xa200ffff
> normal: 0xa2010000–...
> 
> The range 0xa2000000–0xa200ffff is not linearly mapped, but
> pfn_is_map_memory(__phys_to_pfn(0xa2008000)) aligns the address to
> page granularity and passes 0xa2000000 to memblock_is_map_memory().
> That address belongs to the preceding normal memblock region, so the
> no-map region is ignored and the function returns true.
> 
> Fix that by checking if entire page is subset of memory block.
> 
> Fixes: 7ace06a01efa ("arm64: mm: fix accidental linear mapping of no-map reserved memory")
> Assisted-by: LLM
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/mm/init.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index fbf215ecc7d0..5da80e1e1727 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -172,7 +172,8 @@ int pfn_is_map_memory(unsigned long pfn)
>  	if (PHYS_PFN(addr) != pfn)
>  		return 0;
>  
> -	return memblock_is_map_memory(addr);
> +	return memblock_is_region_memory(addr, PAGE_SIZE) &&
> +		memblock_is_map_memory(addr);
>  }

Yuck, this is really grotty :(

Can we at least predicate the extra memblock_is_region_memory() check on
having a page-size > 4k?

Will

