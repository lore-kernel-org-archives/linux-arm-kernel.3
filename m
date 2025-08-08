Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8953CC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 12:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTMlv/CPObrGdfQP1uPB6iaFp9qrdznYL0UG417IkoA=; b=V5fNg3iaHAzjQdsHGOqifU33pZ
	+Z+592zpi5gNZleXyqm7pJ4Oa5jh5DMnKl+Q1zCRnvDi3ZnFNVHbrNuj5DF74gorqYyg7dH3eAlU2
	dPWUt6kSmLqJT0B+BI2jiYI3Q69ymqqgAMORyxl2CIpJEX+ybl8hrMST6EUSTYbxB3av476hiUJPG
	zbvYUnfBmBnWPE+lFFv61XTMa/AIu1psT+tL6WAE1a37zLuCcyJoY58/r5vnT/o0WRsCZ1AZ0MYsJ
	DajO3/RrR4cgEMpdeU/mY2ksIN4wOiQ2qbbwcKAAD8qfIXlEh5ezpQgPIUkow9eJJ32puSyUHsOgr
	YcLg5XvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukM1r-00000002mRG-27G7;
	Fri, 08 Aug 2025 12:16:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLOG-00000002gw3-1S7M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 11:36:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D57ED5C6357;
	Fri,  8 Aug 2025 11:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8ED3C4CEED;
	Fri,  8 Aug 2025 11:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754652963;
	bh=vTmugflEoGFXoJA3tltonWAXPsq5xeMoDkED8MRWRHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EWfVJJIDr9nvA0Llj2nUrRf5FX1RpUEOH5rRAbMH2PqApAGKY1LX6BllliUWgi59H
	 Um9PVyoqqN+97pRxiteY5zSgNgAdfK2wCJX3hVW3cyz7XWJETpKHR2jE6SxFPUB4EK
	 +P+MgCPqWTuT2iPex3foRFmdTj6MLhJnk8skr/DhoLF/xosbLDz3kVKNdwBSx1fnP3
	 GorBGEgryoZhL1Vb5H42r0P+hHXwpId4tdmKRBAdLgfckQ6P5U8OB2S/iY7t5e6zfA
	 D8NfM6CTDck2NqJi3OdeVMx8BdrsCqmzJZZhe6p3LhHiWSzuQPkgvCtdO3IYJQvSVd
	 7KPpdfjS9yxAA==
Date: Fri, 8 Aug 2025 12:35:57 +0100
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, maz@kernel.org,
	broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
	wangkefeng.wang@huawei.com, baohua@kernel.org,
	jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com,
	prime.zeng@hisilicon.com, xuwei5@huawei.com,
	yangyicong@hisilicon.com, linuxarm@huawei.com,
	tiantao6@hisilicon.com
Subject: Re: [RFT PATCH] arm64: atomics: prefetch the destination prior to
 LSE operations
Message-ID: <aJXhHVEIdafxcLP_@willie-the-truck>
References: <20250724120651.27983-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724120651.27983-1-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_043604_459837_2386C05D 
X-CRM114-Status: GOOD (  23.35  )
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

On Thu, Jul 24, 2025 at 08:06:51PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> commit 0ea366f5e1b6 ("arm64: atomics: prefetch the destination word for write prior to stxr")
> adds prefetch prior to LL/SC operations due to performance concerns -
> change the cacheline status from exclusive could be significant. This is
> also true for LSE operations, so prefetch the destination prior to LSE
> operations.
> 
> Tested on my HIP08 server (2 * 64 CPU) using `perf bench -r 100 futex all`
> which could stress the spinlock of the futex hash bucket:
>                         6.16-rc7 patched
> futex/hash(ops/sec)     171843   204757 +19.15%
> futex/wake(ms)          0.4630   0.4216 +8.94%
> futex/wake-parallel(ms) 0.0048   0.0039 +18.75%
> futex/requeue(ms)       0.1487   0.1508 -1.41%
> (2nd validation)                 0.1484 +0.2%
> futex/lock-pi(ops/sec)  125      126    +0.8%
> 
> For a single wake test for different threads number using `perf bench
> -r 100 futex wake -t <threads>`:
> threads 6.16-rc7 patched
> 1       0.0035   0.0032 +8.57%
> 48      0.1454   0.1221 +16.02%
> 96      0.3047   0.2304 +24.38%
> 160     0.5489   0.5012 +8.69%
> 192     0.6675   0.5906 +11.52%
> 256     0.9445   0.8092 +14.33%
> 
> There're some variation for close numbers but overall results
> look positive.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
> 
> RFT for tests and feedbacks since not sure it's general or just the optimization
> on some specific implementations.
> 
>  arch/arm64/include/asm/atomic_lse.h | 7 +++++++
>  arch/arm64/include/asm/cmpxchg.h    | 3 ++-
>  2 files changed, 9 insertions(+), 1 deletion(-)

One of the motivations behind rmw instructions (as opposed to ldxr/stxr
loops) is so that the atomic operation can be performed at different
places in the memory hierarchy depending upon where the data resides.

For example, if a shared counter is sitting at a level of system cache,
it may be optimal to leave it there so that CPUs around the system can
post atomic increments to it without forcing the line up and down the
cache hierarchy every time.

So, although adding an L1 prefetch may help some specific benchmarks on
a specific system, I don't think this is generally a good idea for
scalability. The hardware should be able to figure out the best place to
do the operation and, if you have a system where that means it should
always be performed within the CPU, then you should probably configure
it not to send the atomic remotely rather than force that in the kernel
for everybody.

Will

