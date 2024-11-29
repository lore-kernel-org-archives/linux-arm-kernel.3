Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0E4D729FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 19:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLl9vk5dgctHUc2bnikWJY3UhD8TXKVYTkADy1AgSJ0=; b=LMMWEFx4936eFP0PvyxqGfr3E5
	LLAGH9SLUKpMt3YtUc8wfPyE7s7+ihvid9/hW3wsD6aSewCJpyRggCyoFCxeiLr9//bK8W8hdVR0N
	HoLjB5ftTIzARAg+sbcirr/zCOw5ntjXlNF0osaYkZ2ZFxzlqnXWUK15y0YLxu7bC3QgiDaVbcoMY
	yx2GiBxA2SE8XGHuj6rES6buyZkpidc25kLEhQweTyerLs0WAArtfczYxX/3z96QhQUq9RcXq8cGk
	rnv0DihWg1qIiCTWh3p3gnQg0MnmI6hmweaVsj/H8Q1wPGdmC6rQL6PRSMy8Bm/JuskkufZjQUeK5
	0XMTwnKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH6px-00000000rGh-1LTJ;
	Fri, 29 Nov 2024 19:39:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH6ox-00000000rA2-4BEf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 19:38:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9126BA40F90;
	Fri, 29 Nov 2024 19:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE7AC4CECF;
	Fri, 29 Nov 2024 19:38:27 +0000 (UTC)
Date: Fri, 29 Nov 2024 19:38:25 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Yang Shi <yang@os.amperecomputing.com>,
	Baruch Siach <baruch@tkos.co.il>, will@kernel.org,
	ptesarik@suse.com, hch@lst.de, jiangyutang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: fix zone_dma_limit calculation
Message-ID: <Z0oYMXMGYgXoyon7@arm.com>
References: <20241125171650.77424-1-yang@os.amperecomputing.com>
 <87ttbu8q7s.fsf@tarshish>
 <98583682-a95e-440e-bd89-03828998b48e@os.amperecomputing.com>
 <Z0dbsRCsWT3hiVds@arm.com>
 <7720d275-bc52-49c3-949a-6a6a32157418@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7720d275-bc52-49c3-949a-6a6a32157418@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_113832_099362_28AEE997 
X-CRM114-Status: GOOD (  21.85  )
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

On Fri, Nov 29, 2024 at 06:06:50PM +0000, Robin Murphy wrote:
> On 2024-11-27 5:49 pm, Catalin Marinas wrote:
> > If IORT or DT indicate a large mask covering the whole RAM (i.e. no
> > restrictions), in an ideal world, we should normally extend ZONE_DMA to
> > the same.
> 
> That's not right, ZONE_DMA should still be relatively limited in size
> (unless we really do only have a tiny amount of RAM) - just because a DT
> dma-ranges property says the system interconnect can carry >32 address bits
> in general doesn't mean that individual device DMA masks can't still be
> 32-bit or smaller. IIRC we're still implicitly assuming that if DT does
> describe an offset range into "high" RAM, it must represent a suitable
> lowest common denominator for all relevant devices already, and therefore we
> can get away with sizing ZONE_DMA off it blindly.

Fine by me to keep ZONE_DMA in the low range always. I was thinking of
only doing this if ZONE_DMA32 is enabled.

> After staring at it for long enough, I think $SUBJECT patch is actually
> correct as it is.

Thanks Robin for having a look. Can I add your reviewed-by?

> In fact I'm now wondering why the fix was put inside
> max_zone_phys() in the first place, since it's clearly pointless to clamp
> DMA_BIT_MASK(32) to U32_MAX in the dma32_phys_limit case...

I came to the same conclusion. I think it might have been some left-over
from when we had a ZONE_DMA32 in the above 4GB (AMD Seattle?). Than we
changed it a few times but only focused on this function for setting the
limits.

> However the commit message is perhaps not as clear as it could be -
> technically we are correctly *calculating* the appropriate effective
> zone_dma_limt value within the scope of zone_sizes_init(), we're just
> failing to properly update the actual zone_dma_limit variable for the
> benefit of other users.

I'll have a look next week at rewriting the commit message, unless Yang
does it first. I'm planning to queue this patch for -rc2.

-- 
Catalin

