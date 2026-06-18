Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8DACD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 16:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFLqb3+sZ0NNGI77QPSt9wfmbDqD1RN96r5X08RgE3Q=; b=A0yn1XAz0vAW+Ocry6go9zrJ9Q
	DlCMF1zkvRU9EV22eq4iYUYAuX7VbUDhqfNGNKr3NSwSk2B7Iei0a4LZazl0OT6eT9tIika8HfV/C
	xZB0wuL9l8n/rvRUCiEQ8TOGbv3fDdrITY7q0XP9ICa21u7qZ5xbbjTb/BxTsz8Cspw/kwxtu5FJS
	LRs7qHbn4He0AOZSpBQ26BBpj+w3JW4CSdFfr2DIR5HTGuoPDn3QjJLwCD9jloEw5i9J99AWh1qlA
	0bk98iWDKS86FJ0EktorRJYixsHjO2NCvv5tb/B5ibOeEKowJCeewFL3eRUYgO9QvQ96TFP0bBGwS
	u+9ZgZuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waG0a-00000001bec-3OY0;
	Thu, 18 Jun 2026 16:54:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waG0Z-00000001beM-2CYM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 16:54:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F2AA160008;
	Thu, 18 Jun 2026 16:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128A41F000E9;
	Thu, 18 Jun 2026 16:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781801666;
	bh=xFLqb3+sZ0NNGI77QPSt9wfmbDqD1RN96r5X08RgE3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FK7DXe8jgEqKtnlrZZLmBp2e7bN2YkeOONyibF8h8B99VjBhCtkiiJs7RDrcXlmlI
	 hhe3LpB8cPiMOju0cGhRteDVTU5vH8poPa+VphRnzEiYMkzpkN28qZRWm5nsd0Wi1c
	 9QjtGfrEUvXVqASn4A6LWC8+Yr9Hm8uvhhHu8hpkALRrckCiMVBMWd9IIvXQSHiZzh
	 Vmnvgbij8ZqqYk8stSGNFngret9pZkkoj+lW8k99IXj0VRTVfAFnvK5dKq18NOSfp1
	 V5LP4hwMeUhHkpG4c866XYwp6IF/JOM7LyhXF622aCRyt4k2bI3Lwys2QAuFsRULwb
	 0Fg2q5lxoZ+tg==
Date: Thu, 18 Jun 2026 17:54:22 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: Avoid eager DVMSync reclaim batches with C1-Pro
 SME erratum
Message-ID: <ajQivugZfBzG4X2I@willie-the-truck>
References: <20260610104829.1157497-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610104829.1157497-1-catalin.marinas@arm.com>
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

On Wed, Jun 10, 2026 at 11:37:16AM +0100, Catalin Marinas wrote:
> The C1-Pro SME DVMSync workaround currently samples mm_cpumask() from
> arch_tlbbatch_add_pending(). It requires a DSB after every batched TLBI
> so that the mask read is ordered after the hardware DVMSync, defeating
> much of the reclaim batching benefit.
> 
> Introduce the sme_active_cpus mask tracking which CPUs run in user-space
> with SME enabled and use it for batch flushing instead of accumulating
> the mm_cpumask() of the unmapped pages.
> 
> Fixes: 0baba94a9779 ("arm64: errata: Work around early CME DVMSync acknowledgement")
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> ---
> 
> The dsb() in arch_tlbbatch_add_pending() -> sme_dvmsync_add_pending()
> did introduce a performance regression for kswapd. This patch restores
> the original behaviour with the barrier only issued when the TLB batch
> is flushed. The trade-off is that the IPIs are now sent to all CPUs
> running with SME enabled at EL0 even if the reclaimed pages do not
> belong to SME tasks. This is acceptable for current SME deployments.
> 
>  arch/arm64/include/asm/tlbbatch.h | 10 ++-----
>  arch/arm64/include/asm/tlbflush.h | 49 +++++--------------------------
>  arch/arm64/kernel/fpsimd.c        | 10 +++++--
>  arch/arm64/kernel/process.c       | 35 ----------------------
>  4 files changed, 17 insertions(+), 87 deletions(-)

Ok, so this partially undoes the work to mitigate the IPI-based DoS
reported by Sashiko, but only for the TLB batching case. The mm_cpumask()
is still used for the unbatched case.

It looks functionally correct to me, but it would be great to see some
Tested-by lines from people who are concerned about the performance...

Will

