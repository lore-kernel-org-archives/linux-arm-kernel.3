Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8D1F31E22
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 14:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6rzWnss5mwBycv3niUfS6P/CpxzahiWocWAW0Ks5ck=; b=elsJMq6YE5piBzvtyxHrm7Gi8Y
	FzqSVvqervhGD9suSX8wRBFMlKWKuIr+jcOmc2dXEaCS2xl9zpEy5MOyxqL59m5e4I966dWZDr5YO
	pkrwOa9iUHSkXH/M0MVOQ720/g2pRGkxAxZaX9SJ5DTke1Crxi9/rStjIIprkuq/QNFVvxo4BovqV
	09Fs4CCbDGzK8PPzIW+wuvzBYK0qseG84Hx1OacIkMXc8ODsgXzO+kF4CEpkBOhorGwLBZh85pxod
	CmR9rfdPjqJFZrkv7hhZVBjK7+VvrLbnKpB4vNZcAlWTKDqHNZYP7AeoftxC+fq9JEbyzi70ESwV+
	jrBC/eFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqAu-0000000Af9K-0rlT;
	Thu, 09 Apr 2026 14:16:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqAp-0000000Af7n-40VR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 14:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=u6rzWnss5mwBycv3niUfS6P/CpxzahiWocWAW0Ks5ck=; b=quN3kbC2aNXq9A4MZ2/8PJT9l9
	bWybZToi8uNhnkYP1tTsdZRfg0fwjYmRvSzX4bMudwuKquG4k2eFTgNxK3X3rLSOi6Jz8NLAJG8F+
	LCV0YC1p2jiSsWg7TL+Hy95c96IquDh1wimq1cbVh6mS9qkrCZtvQvM5yuBOCU5a3zAQ5xQGww/bu
	2cBaN9NO829b8qabQQCA8p4LQiM0tlIEWI263Ifqpe9edUiq26jWbsMvzV8emLhs0yMxIHC2U+tEk
	Y3MvDDHS90/6r//g/gpuYUYBEn9M/iw4KOe4jAYllxAnrPVv/j0ucqsCIgJx2jIKn5aYYkmAGo5zQ
	QP8muUyQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50022)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wAqAh-000000003h0-1so4;
	Thu, 09 Apr 2026 15:15:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wAqAf-000000004Se-3nw1;
	Thu, 09 Apr 2026 15:15:49 +0100
Date: Thu, 9 Apr 2026 15:15:49 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Brian Ruley <brian.ruley@gehealthcare.com>
Cc: Steve Capper <steve.capper@arm.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/arm: pgtable: remove young bit check for
 pte_valid_user
Message-ID: <ade0lbA4h4etqLHa@shell.armlinux.org.uk>
References: <20260409125446.981747-1-brian.ruley@gehealthcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409125446.981747-1-brian.ruley@gehealthcare.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_071559_995120_BB41FDE3 
X-CRM114-Status: GOOD (  21.48  )
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

On Thu, Apr 09, 2026 at 03:54:45PM +0300, Brian Ruley wrote:
> Fixes cache desync, which can cause undefined instruction,
> translation and permission faults under heavy memory use.
> 
> This is an old bug introduced in commit 1971188aa196 ("ARM: 7985/1: mm:
> implement pte_accessible for faulting mappings"), which included a check
> for the young bit of a PTE. The underlying assumption was that old pages
> are not cached, therefore, `__sync_icache_dcache' could be skipped
> entirely.
> 
> However, under extreme memory pressure, page migrations happen
> frequently and the assumption of uncached "old" pages does not hold.

The first thing to point out is that PTEs that are marked as "old" are
not mapped into userspace. They need to take a fault to be marked
young, which will involve another call to set_pte(), at which point
pte_valid_user() should return true. Your assumption that this is
about "old" pages being uncached is totally incorrect - there has
never been such an assumption.

> Especially for systems that do not have swap, the migrated pages are
> unequivocally marked old. This presents a problem, as it is possible
> for the original page to be immediately mapped to another VA that
> happens to share the same cache index in VIPT I-cache (we found this
> bug on Cortex-A9). Without cache invalidation, the CPU will see the
> old mapping whose physical page can now be used for a different
> purpose, as illustrated below:



> 
>                 Core                      Physical Memory
>   +-------------------------------+     +------------------+
>   | TLB                           |     |                  |
>   |  VA_A 0xb6e6f -> pfn_q        |     | pfn_q: code      |
>   +-------------------------------+     +------------------+
>   | I-cache                       |
>   |  set[VA_A bits] | tag=pfn_q   |
>   +-------------------------------+
> 
> migrate (kcompactd):
>   1. copy pfn_q --> pfn_r
>   2. free pfn_q
>   3. pte: VA_a -> pfn_r
>   4. pte_mkold(pte) --> !young
>   5. ICIALLUIS skipped (because !young)

At this point, the hardware PTE will be set to zero and the TLB
invalidated. This _should_ mean that any future access should result
in a page permission fault being raised. That will then provoke the
MM to mark the PTE young, which will then result in set_ptes()
being called, and thus __sync_icache_dcache() will be called for
the _neew_ pte (which will be for pfn_r.)

> 
> pfn_src reused (OOM pressure):
>   pte: VA_B -> pfn_q (different code)
> 
> bug:
>                 Core                      Physical Memory
>   +-------------------------------+     +------------------+
>   | TLB (empty)                   |     | pfn_r: old code  |
>   +-------------------------------+     | pfn_q: new code  |
>   | I-cache                       |     +------------------+
>   |  set[VA_A bits] | tag=pfn_q   |<--- wrong instructions
>   +-------------------------------+
> 
> This was verified on ba16-based board (i.MX6Quad/Dual, Cortex-A9) by
> instrumenting the migration code to track recently migrated pages in a
> ring buffer and then dumping them in the undefined instruction fault
> handler. The bug can be triggered with `stress-ng':
> 
>   stress-ng --vm 4 --vm-bytes 2G --vm-method zero-one --verify
> 
> Note that the system we tested on has only 2G of memory, so the test
> triggered the OOM-killer in our case.

So you're saying that stress-ng doesn't reproduce this bug but triggers
the OOM-killer... confused.

Cortex-A9 has been around for a long time - I have systems that still
use Cortex-A9 every day without swap, and they have been rock solid.

If there was a bug like this, I would've expected to see problems, but
I'm not... so, I'm not convinced there's a problem here.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

