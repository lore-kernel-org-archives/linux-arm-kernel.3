Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B94FCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IioT8eni5JJe4Tsa75pm/0B/3IuJLRVJTGewS2qygYo=; b=maT1WUVzpRbrUNnYkS73dm9Hyw
	pNbHIiF75GETSy4KYoQK2VTTLC8/tNxXI9dBKJgwqJx70ZZB+0HvstaH1BW2PCJxWNHOsNVK4Lapu
	4Rf4qBPEpR4rtDT5LmvV7aCbD8neV9RNC5WmCVYotWp1lrhndLMzMhwvIctSP01lqG6c5odeGp9Nn
	LSqWlht3A+RZaG1NK6n3XwA9CbULSPt+Vy5L+Ynez9BSR40736ww5njjgTq5pGZoueSv4OSqeGTie
	odL2WtJWvBh4MjAzYPW9MLBUSaJSTTyBXPiZyXn2kIXV/JoCug+OkIT6SvR60DBP4eJMeaTYzFfAB
	1TVn5w6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQNHG-0000000AX4M-0Xkf;
	Fri, 22 May 2026 10:38:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQNHD-0000000AX3k-1I0J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:38:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97FF726BC;
	Fri, 22 May 2026 03:38:39 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A20B3F85F;
	Fri, 22 May 2026 03:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779446324; bh=RqkMYho4Yc7kOH0LueJfnc6XODgDoRr5RXGQOP2xdjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UspOzoJCY9ZHGdIe6Cyq0b0XfQrNkoc31Jtobq+h2ZXnoL67m4lM9te6G9lQ31fcE
	 C/jprDrxXZsnHPX1BAGqyqOsKbbv7G3ejV/aOZKPyAjHhx0fda5F+xWeyqlUHlKcV+
	 WX3LAGb/VFlU93zbcYID9+eyjTgopzgrgHu9OPMQ=
Date: Fri, 22 May 2026 11:38:40 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zeng Heng <zengheng@huaweicloud.com>
Cc: yezhenyu2@huawei.com, zhurui3@huawei.com, will@kernel.org,
	akpm@linux-foundation.org, npiggin@gmail.com,
	aneesh.kumar@kernel.org, peterz@infradead.org,
	linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, David Hildenbrand <david@kernel.org>,
	zengheng4@huawei.com
Subject: Re: [PATCH] arm64: tlb: Flush walk cache when unsharing PMD tables
Message-ID: <ahAyMO_6UcPc2q4U@arm.com>
References: <20260521073011.4121277-1-zengheng@huaweicloud.com>
 <ag8fHYL-S26uO0yZ@arm.com>
 <ag8hmZ3kjtJINyIT@arm.com>
 <b7098272-a348-d918-774a-d5d2645fc7f4@huaweicloud.com>
 <ahAsPU00ZTTJV3Ye@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahAsPU00ZTTJV3Ye@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_033847_585477_7925CE34 
X-CRM114-Status: GOOD (  23.73  )
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

On Fri, May 22, 2026 at 11:13:17AM +0100, Catalin Marinas wrote:
> On Fri, May 22, 2026 at 01:32:07PM +0800, Zeng Heng wrote:
> > On 2026/5/21 23:15, Catalin Marinas wrote:
> > > On Thu, May 21, 2026 at 04:05:07PM +0100, Catalin Marinas wrote:
> > > > On Thu, May 21, 2026 at 03:30:11PM +0800, Zeng Heng wrote:
> > > > > From: Zeng Heng <zengheng4@huawei.com>
> > > > > 
> > > > > When huge_pmd_unshare() is called to unshare a PMD table, the
> > > > > tlb_unshare_pmd_ptdesc() function sets tlb->unshared_tables=true
> > > > > but the aarch64 tlb_flush() only checked tlb->freed_tables to
> > > > > determine whether to use TLBF_NONE (vae1is, invalidates walk
> > > > > cache) or TLBF_NOWALKCACHE (vale1is, leaf-only).
> > > > > 
> > > > > This caused the stale PMD page table entry to remain in the walk cache
> > > > > after unshare, potentially leading to incorrect page table walks.
> > > > > 
> > > > > Fix by including unshared_tables in the check, so that when
> > > > > unsharing tables, TLBF_NONE is used and the walk cache is properly
> > > > > invalidated.
> > > > > 
> > > > > Here is the detailed distinction between vae1is and vale1is:
> > > > > 
> > > > > | Instruction Combination  | Actual Invalidation Scope                         |
> > > > > | ------------------------ | --------------------------------------------------|
> > > > > | `VAE1IS`  + TTL=`0`      | All entries at all levels (full invalidation)     |
> > > > > | `VAE1IS`  + TTL=`2` (L2) | Non-leaf at Level 0/1 + leaf at Level 2           |
> > > > > | `VALE1IS` + TTL=`0`      | Leaf entries at all levels (non-leaf not cleared) |
> > > > > | `VALE1IS` + TTL=`2` (L2) | Leaf entry at Level 2 only                        |
[...]
> > Per the ARM Architecture Reference Manual, whether only the last-level
> > page table entry is invalidated is determined by the instruction used
> > (vale1is for leaf entry only, vae1is for walk cache including leaf entry and
> > non-leaf entry), rather than the TTL field. The TTL field merely specifies
> > which level the leaf entry belongs to.
> 
> Ah, yes, you are right. The TTL is still 2 in this case for a huge pmd,
> we just want the walk cache leading to it to be invalidated. So no need
> for the additional tlb_get_level().

The Arm ARM is still unclear. The RVAE1IS has this wording:

  The TTL hint is only guaranteed to invalidate:

  - Non-leaf-level entries in the range up to but not including the
    level described by the TTL hint.

  - Leaf-level entries in the range that match the level described by
    the TTL hint.

But we don't have such wording around non-leaf-level entries for VAE1IS.
I presume it would be the same but I'll ask internally next week. In the
meantime, I'll take this patch.

-- 
Catalin

