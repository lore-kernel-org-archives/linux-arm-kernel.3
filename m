Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FA2C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 04:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=es38YOVu5vYbvKWbHCodQvRPZdZLg3ThA+Wr0Te0wSQ=; b=Knrycntd5P8p8RXmOnXnfKPnR9
	O/3/JxThYgdHqpgIOLIAlFJVArf/isRgFG+AoixvYjEgB/wgJVehod5eM/r8iuaH3qA+fnzmvgtsl
	YRzNC9mGxZPDZUulq8pEde9X7WKL34Py5MOD7LuZRQNX1oKaGzyr7nkLQR7JBmFksi1v/ivnKfknj
	FQxpLP85Aye2VQ7xXT0/BprR/HbqCYrqsRVT+YXUV6xwYqbiJ/hsFtA8Ghlyun2/qRGy6vgzlEb7f
	v2IujPCS3ijj85mh6BWxBSlGJtDcccWezLkRdH/xH/bYfYYH42/97I9cmfpCtUzLa3yg+2GlKzRXu
	C1cziyxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPCnZ-00000008oar-3n7N;
	Wed, 11 Jun 2025 04:10:49 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPClO-00000008oJr-05Nt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 04:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749614908; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=es38YOVu5vYbvKWbHCodQvRPZdZLg3ThA+Wr0Te0wSQ=;
	b=JviSMO/ktuC+7bBcvUcMJzGD4ztV8e690O/OzAbItxEmNR4cGN4tFEWuI9JHhfYBesZqhn20GbKQ3663bTbhl/bEgU4HPMW4k14aUlguk1Aun4ZfqAVRk00UjyakSOoUxESo4RkMpeLf2AtKMyASz7Df43lO0Z/RbYKCRa7VbY4=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WdbeqMK_1749614906 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 11 Jun 2025 12:08:26 +0800
Date: Wed, 11 Jun 2025 12:08:26 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Robin Murphy <robin.murphy@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Baruch Siach <baruch@tkos.co.il>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] arm64/mm: Lift the cma address limit when
 CONFIG_DMA_NUMA_CMA=y
Message-ID: <aEkBOqvxXaVXU0fQ@U-2FWC9VHC-2323.local>
References: <20250521014701.73046-1-feng.tang@linux.alibaba.com>
 <aEhnELJQLw8S8Bho@arm.com>
 <98c0b70a-0cbd-46fd-b481-7663905bb8dc@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <98c0b70a-0cbd-46fd-b481-7663905bb8dc@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_210834_846670_CD23819C 
X-CRM114-Status: GOOD (  46.38  )
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

Add Marek Szyprowski

Thanks Catalin and Robin for the comments and suggestions!

On Tue, Jun 10, 2025 at 08:46:38PM +0100, Robin Murphy wrote:
> On 2025-06-10 6:10 pm, Catalin Marinas wrote:
> > On Wed, May 21, 2025 at 09:47:01AM +0800, Feng Tang wrote:
> > > When porting an cma related usage from x86_64 server to arm64 server,
> > > the "cma=4G" setup failed on arm64, and the reason is arm64 has 4G (32bit)
> > > address limit for cma reservation.
> > > 
> > > The limit is reasonable due to device DMA requirement, but for NUMA
> > > servers which have CONFIG_DMA_NUMA_CMA enabled, the limit is not required
> > > as that config already allows cma area to be reserved on different NUMA
> > > nodes whose memory very likely goes beyond 4G limit.
> > > 
> > > Lift the cma limit for platform with such configuration.
> > 
> > I don't think that's the right fix. Those devices that have a NUMA node
> > associated may be ok to address memory beyond 4GB. The default for
> > NUMA_NO_NODE devices is still dma_contiguous_default_area. I also don't
> > like to make such run-time decisions on the config option.
> 
> Indeed, the fact that the kernel was built with the option enabled says
> nothing at all about the needs of whatever system we're actually running on,
> so that's definitely wrong. This one is also the kind of option which may
> well be enabled in a multi-platform distro kernel, since it only adds a tiny
> amount of code with no functional impact on systems which don't explicitly
> opt in, but offers a useful benefit to those which can and do.

Yep, the analysis from you two make sense to me. Will drop this patch.

> Furthermore, the justification doesn't add up at all - if the relevant
> devices could use the per-NUMA-node CMA areas, then... why not just have
> them use the per-NUMA-node CMA areas, no kernel change needed (and maybe a
> slight performance bonus too)? On the other hand, where those areas may or
> may not be allocated is entirely meaningless to NUMA_NO_NODE devices which
> wouldn't use them anyway.

The usage model ported from x86_64 is use "cma=4G@4G" in cmdline, and use
something like dma_alloc_from_continguous(NULL, 1 << 18, 18, false) to
get a huge buffer from 'dma_contiguous_default_area'

btw, I really like the 'numa_cma=' cmdline option, which helps our cma
usage a lot.

> > That said, maybe we should make the under-4G CMA allocation a best
> > effort. In the arch code, if that failed, attempt the allocation again
> > with a limit of 0 and maybe do a pr_notice() that CMA allocation in the
> > DMA zone failed.
> 
> TBH given that the command-line parameter can specify placement as well as
> size, I think it would make a lot of sense to allow that to override the
> default limit provided by the arch code. That would give users the most
> flexibility, at the minor cost of having to accept the consequences if they
> do specify something which ends up not working for some devices. Otherwise I
> fear that any attempt to make the code itself cleverer will just lead down a
> rabbit-hole of trying to second-guess the user's intent - if the size
> doesn't fit the limit, who says it's right to increase the limit rather than
> reduce the size? And so on...

Strongly agree. Some platforms may have the 32bit limit, and many other
platforms which don't have to suffer from the limit. This kind of
flexibility should benefit users widely.

Something like below?
---
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 8df0dfaaca18..6a93ad3e024d 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -222,7 +222,12 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
 	if (size_cmdline != -1) {
 		selected_size = size_cmdline;
 		selected_base = base_cmdline;
-		selected_limit = min_not_zero(limit_cmdline, limit);
+
+		selected_limit = limit_cmdline ?: limit;
+		if (limit_cmdline > limit)
+			pr_notice("User set cma limit [0x%llx] bigger than architectual value [0x%llx], will use the former\n",
+				limit_cmdline, limit);
+
 		if (base_cmdline + size_cmdline == limit_cmdline)
 			fixed = true;
 	} else {


Thanks,
Feng

> 
> Thanks,
> Robin.
> 
> > 
> > Adding Robin in case he has a different view.
> > 
> > > Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
> > > ---
> > >   arch/arm64/mm/init.c | 9 ++++++++-
> > >   1 file changed, 8 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> > > index b99bf3980fc6..661758678cc4 100644
> > > --- a/arch/arm64/mm/init.c
> > > +++ b/arch/arm64/mm/init.c
> > > @@ -312,6 +312,7 @@ void __init arm64_memblock_init(void)
> > >   void __init bootmem_init(void)
> > >   {
> > >   	unsigned long min, max;
> > > +	phys_addr_t cma_limit;
> > >   	min = PFN_UP(memblock_start_of_DRAM());
> > >   	max = PFN_DOWN(memblock_end_of_DRAM());
> > > @@ -343,8 +344,14 @@ void __init bootmem_init(void)
> > >   	/*
> > >   	 * Reserve the CMA area after arm64_dma_phys_limit was initialised.
> > > +	 *
> > > +	 * When CONFIG_DMA_NUMA_CMA is enabled, system may have CMA reserved
> > > +	 * area in different NUMA nodes, which likely goes beyond the 32bit
> > > +	 * limit, thus use (PHYS_MASK+1) as cma limit.
> > >   	 */
> > > -	dma_contiguous_reserve(arm64_dma_phys_limit);
> > > +	cma_limit = IS_ENABLED(CONFIG_DMA_NUMA_CMA) ?
> > > +			(PHYS_MASK + 1) : arm64_dma_phys_limit;
> > > +	dma_contiguous_reserve(cma_limit);
> > >   	/*
> > >   	 * request_standard_resources() depends on crashkernel's memory being
> > > -- 
> > > 2.39.5 (Apple Git-154)

