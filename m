Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F4EC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kX9SCcD5vFsKVtPD6ROHec7ImckWMkHUM4/C9zZQT/Y=; b=MJypphXVmUWj2Sfgg78vjVKOJA
	sZoaQhpYEgMqqIeKUFuMFsP2RX+zbL/5tGlDkJ1OXycGR51kuqrwR+W0pyXjXoxKl14qflFrMdRMA
	T/I7eobIK4smIEFuVdjbHGkFYy+yptzdpLkD3o9VGRob4WaIKJACJCew0uH9jJRVZnMjnN+PoXha+
	BfSj+Tw+go+/JCpojTVcV2OY1/vMCkadp+yLIexrc1xf4TqvLEJkWwnTq67IuhNo29Qgm7mZCjJoC
	+dhcxMMOjOC1NGwC3HHNtRZA9gGrabfJ/k4xWBnRfU7q4PdugsX1kmWHlgSLZAk3uKjTtA7L+Kwry
	vhIHBjBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u505F-00000009Cms-3Ijo;
	Wed, 16 Apr 2025 10:33:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ziE-000000095LE-1cpP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 10:09:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 951555C5B9B;
	Wed, 16 Apr 2025 10:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9D0C4CEE2;
	Wed, 16 Apr 2025 10:09:43 +0000 (UTC)
Date: Wed, 16 Apr 2025 11:09:41 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ross Stutterheim <ross.stutterheim@garmin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Mike Rapoport <rppt@linux.ibm.com>, ross.sweng@gmail.com,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] arm/memremap: fix arch_memremap_can_ram_remap()
Message-ID: <Z_-B5fAhZzShX34I@arm.com>
References: <20250414133219.107455-1-ross.stutterheim@garmin.com>
 <20250414142140.131756-1-ross.stutterheim@garmin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414142140.131756-1-ross.stutterheim@garmin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_030946_485077_A7C660C9 
X-CRM114-Status: GOOD (  21.62  )
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

On Mon, Apr 14, 2025 at 09:21:40AM -0500, Ross Stutterheim wrote:
> commit 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure
> presence of linear map") added the definition of
> arch_memremap_can_ram_remap() for arm[64] specific filtering of what pages
> can be used from the linear mapping. memblock_is_map_memory() was called
> with the pfn of the address given to arch_memremap_can_ram_remap();
> however, memblock_is_map_memory() expects to be given an address for arm,
> not a pfn.
> 
> This results in calls to memremap() returning a newly mapped area when
> it should return an address in the existing linear mapping.
> 
> Fix this by removing the address to pfn translation and pass the
> address directly.
> 
> Fixes: 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure presence of linear map")
> Signed-off-by: Ross Stutterheim <ross.stutterheim@garmin.com>

I think you could also add:

Cc: <stable@vger.kernel.org>

> ---
>  arch/arm/mm/ioremap.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mm/ioremap.c b/arch/arm/mm/ioremap.c
> index 748698e91a4b..27e64f782cb3 100644
> --- a/arch/arm/mm/ioremap.c
> +++ b/arch/arm/mm/ioremap.c
> @@ -515,7 +515,5 @@ void __init early_ioremap_init(void)
>  bool arch_memremap_can_ram_remap(resource_size_t offset, size_t size,
>  				 unsigned long flags)
>  {
> -	unsigned long pfn = PHYS_PFN(offset);
> -
> -	return memblock_is_map_memory(pfn);
> +	return memblock_is_map_memory(offset);
>  }

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Not sure how Russell picks patches up these days (I used to send them to
the patch system -
https://www.arm.linux.org.uk/developer/patches/info.php).

It might be simpler with git send-email (that's the alias I had):

  git send-email --add-header="KernelVersion: $(git describe --abbrev=0)" --no-thread --suppress-cc=all --to="patches@armlinux.org.uk"

-- 
Catalin

