Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DA5CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 14:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGKT2H9oAVokplmogttxa64EvESiPBnR+MF25iKS56I=; b=uxOiRHKCRI3JPtdUKfOafJ8EdJ
	I9hCgDpzetBzKgdztKD9rtxRihld+FEJtw3Dfvlq6oL7/fS2NKi3rZ9pYNZky0KkTNOrzYsoh//9s
	Wavl9rg+b3A+FvIPQrMaMbKSXiz5PoeYUuwdI/DWNWVRDoB+GY8kkHl0cD95Jx5c8RBLXtFZkdKQd
	LG6+iu8X8HG6/B7sqUynYjRFFwknBc/1kVxJrlrJ1QnHGcw6X2OXzjFMkaF/v3Z0PHlY6AyO+pOHg
	60S86eBPgfXijI/s5GPRKtKVHIQQ7YyhNsOKu+FI1jm6P7utK5ZyXCnAGEYCZntY5Ipr6w//7b/Ys
	uG/0/oHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQTJ-0000000DDj7-3FIx;
	Tue, 02 Jun 2026 14:52:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQTH-0000000DDii-1u2y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 14:52:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BEE943D41;
	Tue,  2 Jun 2026 14:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18E51F00898;
	Tue,  2 Jun 2026 14:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780411919;
	bh=xGKT2H9oAVokplmogttxa64EvESiPBnR+MF25iKS56I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FA9PPqvBdIGb4pG0zB9lk0F6AvuqOvkWRIIve5mL+5kjKZBXObpADjkhMqWdT1QxL
	 j3rIK24SVpkXDle8LLaI/cRAy58+ZJzsHgONBjV+tHmm0p9XGCvP1phnmqiwSQwEE6
	 MAiNyOjgHI3B/ziUMS9EaNA8v5H66OUx63Y+7JZecaY6/2R2hob3imz8wxuCTbxWxD
	 kTLaa2TlZD8j3BtK8Wvc4i0zRsloMYGnPzDQ2y1KkJ+EjqQYfkBOKA4uSTvG2pAze3
	 v60BhJ0M4oXf4TmGKxhxG1LdRxsiJBewP6Sp/AMcerTBZe4tKpXR1FNk3OuxX+FB1b
	 csmkyREEaeC4w==
Date: Tue, 2 Jun 2026 15:51:54 +0100
From: Will Deacon <will@kernel.org>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: catalin.marinas@arm.com, ryan.roberts@arm.com, cl@gentwo.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [v7 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Message-ID: <ah7uCj2V11MnAlaR@willie-the-truck>
References: <20260519163657.1259416-1-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519163657.1259416-1-yang@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_075159_551501_26885DB7 
X-CRM114-Status: GOOD (  19.26  )
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

On Tue, May 19, 2026 at 09:36:57AM -0700, Yang Shi wrote:
> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
> rodata=full"), the direct mapping may be split on some machines instead
> keeping static since boot. It makes more sense to show the direct mapping
> use in /proc/meminfo than before.
> This patch will make /proc/meminfo show the direct mapping use like the
> below (4K base page size):
> DirectMap4K:       94792 kB
> DirectMap64K:     134208 kB
> DirectMap2M:     1173504 kB
> DirectMap32M:    5636096 kB
> DirectMap1G:    529530880 kB
> 
> Although just the machines which support BBML2_NOABORT can split the
> direct mapping, show it on all machines regardless of BBML2_NOABORT so
> that the users have consistent view in order to avoid confusion.
> 
> Although ptdump also can tell the direct map use, but it needs to dump
> the whole kernel page table. It is costly and overkilling. It is also
> in debugfs which may not be enabled by all distros. So showing direct
> map use in /proc/meminfo seems more convenient and has less overhead.
> 
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/mm/mmu.c | 192 +++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 171 insertions(+), 21 deletions(-)
> 
> v7: * Rebased to v7.1-rc4
>     * Changed "dm" to "lm" to follow ARM convention per Will
>     * Used __is_lm_alias() instead of reinventing a new helper per Will

Thanks, but Sashiko has pointed out a few nasty issues:

https://sashiko.dev/#/patchset/20260519163657.1259416-1-yang@os.amperecomputing.com

In particular, the potential for races updating the shared counters and
double-accounting of entries due to permission changes look like
interesting things to check.

Will

