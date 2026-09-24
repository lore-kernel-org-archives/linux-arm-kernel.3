Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9901C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QV0A0jsJAmJgwYWhzbSTCL6PO5PGPz9H5EEyRIUGM8s=; b=nNQOcQ+M0Ngtvp
	kCLyxvfdYMpjUM08dlbdQfFeLemVFTNas6SH/bwOxgoux8iiH5zTkL3KplmWp5meKGO4vTXzkWJHE
	tfltxJ3nd5YaXhyYa3RkolsDx3w5DKQMp/PkyGMES+SV0P1Xs5BKJLh+zDqLM5nz4rn5gBJVPATqC
	6F8eMeEWH2LH0cNeprAGVuWTpZoqJiJPuft9bWaJ2ZE/MMTeF9PVZZslU54ci5gSECSXKgVPuozAE
	umdVq65+taYLCMI1ZdfqMiHWDHVHyZrfeQsVQ//UjALND4dxQT7Z9QjbAGsTFgDh09Z7tsBD3IgD3
	Dila75mzA6Poby5yInNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9m7Z-0000000BZji-3BXk;
	Thu, 24 Sep 2026 16:16:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9m7W-0000000BZig-1z2z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:16:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0283F152B;
	Thu, 24 Sep 2026 09:16:21 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C385E3F86C;
	Thu, 24 Sep 2026 09:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790266584; bh=bOOJWOAbO0gDFgO8PblWIzaHwfRvGBO666n+MZ1kxXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=birMX9T01zpqA2jbnY8FhUCkU9qM54dzIQ5nOu1JUfPf7sPg9PAnTc8aGcG9Apzpx
	 9VNCZQ2WJpIj0PRu2acMxaGiFxDyINA+I1RLhfyWxId/tRrBGl/sMTvQ/DD8h9n6Jr
	 wo2n81Z7wOvRxXnwda1gw7lRQ2iOJYDzstY3Bd6k=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: (subset) [PATCH v4 00/21] Preemptible this_cpu_*() operations
Date: Thu, 24 Sep 2026 17:03:49 +0100
Message-ID: <179026582920.3572476.8424936957104740430.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260908151741.394589-1-mark.rutland@arm.com>
References: <20260908151741.394589-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_091626_628792_85886D39 
X-CRM114-Status: GOOD (  13.84  )
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
Cc: vladimir.murzin@arm.com, ryan.roberts@arm.com, usama.anjum@arm.com, peterz@infradead.org, maz@kernel.org, david.laight.linux@gmail.com, stable@vger.kernel.org, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, ruanjinjie@huawei.com, david@kernel.org, ljs@kernel.org, Will Deacon <will@kernel.org>, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 08 Sep 2026 16:17:20 +0100, Mark Rutland wrote:
> This series reworks arm64's this_cpu_*() operations such that they do
> not need to disable preemption. The scheme is described in detail in patch 13,
> and is similar to the approach Heiko Carstens applied to s390 [1], which
> inspired this series.
> 
> This scheme should build and function in all kernel configurations (e.g.
> regardless of KPTI, SW PAN, CNP, VA BITS), and has no dependency on new
> architectural features. The fixup logic should "just work" with kprobes,
> etc, and I don't expect that this will need to become more complicated.
> 
> [...]

Applied to arm64 (for-next/preemptible-this-cpu), thanks!

Patches 1-3 are already upstream as fixes (in -rc4, used as a base for
for-next/core). I fixed some minor comment typos in a couple of patches,
I haven't touched the code.

On v2, Usama reported performance regression in perf/sched and
perf/futex benchmarks that have not been addressed yet. It would be good
to run the tests again on this version, in case they were just noise. I
don't see why these would regress, maybe because of pt_regs being larger
and we get some more cache misses?

[04/21] arm64: cmpxchg: LL/SC: Avoid redundant extension
        https://git.kernel.org/arm64/c/78746ba584fc
[05/21] arm64: cmpxchg128: LSE: Remove redundant operands
        https://git.kernel.org/arm64/c/de2824489899
[06/21] arm64: preempt: Simplify and optimize __preempt_count_dec_and_test()
        https://git.kernel.org/arm64/c/1bee18253c2e
[07/21] arm64: preempt: Treat should_resched() as unlikely
        https://git.kernel.org/arm64/c/6254b223153d
[08/21] arm64: ptrace: Always inline pt_regs_[read,write}_reg()
        (no commit info)
[09/21] arm64: percpu: Factor out percpu offset asm
        https://git.kernel.org/arm64/c/b7f3aa93f407
[10/21] arm64: gpr-num: Add wxN aliases for wN registers
        https://git.kernel.org/arm64/c/47c62b09f03b
[11/21] arm64: gpr-num: add __GPR_NUM() helper
        https://git.kernel.org/arm64/c/05c44981d9ec
[12/21] arm64: entry: sdei: Restore all clobberable GPRs
        https://git.kernel.org/arm64/c/1e0a5cc90aab
[13/21] arm64: entry: sdei: Make 'tsk' available
        https://git.kernel.org/arm64/c/fb532fdb4430
[14/21] arm64: percpu: Add infrastructure for preemptible this_cpu_*() ops
        https://git.kernel.org/arm64/c/95d2c5f6663b
[15/21] arm64: percpu: Implement preemptible read/write ops
        https://git.kernel.org/arm64/c/6e2cec1c39b2
[16/21] arm64: percpu: Implement preemptible void RMW ops
        https://git.kernel.org/arm64/c/c7ac8f9baaef
[17/21] arm64: percpu: Implement preemptible return RMW ops
        https://git.kernel.org/arm64/c/6fe3da372d04
[18/21] arm64: percpu: Implement preemptible XCHG ops
        https://git.kernel.org/arm64/c/5e8ef5fb7720
[19/21] arm64: percpu: Implement preemptible CMPXCHG ops
        https://git.kernel.org/arm64/c/39d50a10e318
[20/21] arm64: percpu: Implement preemptible CMPXCHG128 ops
        https://git.kernel.org/arm64/c/c0ff52c3683c
[21/21] arm64: percpu: Remove _pcp_protect*() wrappers
        https://git.kernel.org/arm64/c/479671f943c9

