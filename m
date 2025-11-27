Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346EBD11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HU3w7T7/CJ23RmFckNbl8jjkBn0H0DiBC+ZxGjEKYAI=; b=jF/mbT4hk76Slq7PGBnFtddUwj
	9XIVrtpdUR0zKi2W3FgGvb6YPygkUai4xpgkNMCW7s2u1rVOJn3MWRlu0a6t+49BP8B1qmZR2sL1M
	Q8yGD4ZmyYsMr3yXfc3j4BZukGqGnrWLqOUOiSbE5Fr+ZG5+xPzzAFvfSdfSRRmf3SWFe+L14bi38
	IcDXfKMxtMjhiEpfNMfsB2cfmPKeW/RbtdFilCx1rAF9KGslUSj1M8Tb2dRoYjWanQAAzeCee0PiK
	tOAcPYCoP0ZAF1c6kuqembaryoPiC/nDtzH7TuwF0ZmXwzuGBxew4kLItxeEfz6xPhDCRAJbDngtT
	kKQdL6vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOarE-0000000GWjJ-0FKg;
	Thu, 27 Nov 2025 12:12:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOarA-0000000GWir-47hJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:12:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 300161477;
	Thu, 27 Nov 2025 04:12:08 -0800 (PST)
Received: from [10.57.87.167] (unknown [10.57.87.167])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B11653F73B;
	Thu, 27 Nov 2025 04:12:13 -0800 (PST)
Message-ID: <b1dae5a7-27bd-42de-bcce-9fd3c2b1c178@arm.com>
Date: Thu, 27 Nov 2025 12:12:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC/RFT PATCH 0/6] Improve get_random_u8() for use in randomize
 kstack
Content-Language: en-GB
To: Ard Biesheuvel <ardb+git@google.com>, linux-hardening@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Kees Cook <kees@kernel.org>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jeremy Linton <jeremy.linton@arm.com>,
 Catalin Marinas <Catalin.Marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20251127092226.1439196-8-ardb+git@google.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20251127092226.1439196-8-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_041217_252015_BF241BA4 
X-CRM114-Status: GOOD (  18.05  )
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

On 27/11/2025 09:22, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Ryan reports that get_random_u16() is dominant in the performance
> profiling of syscall entry when kstack randomization is enabled [0].
> 
> This is the reason many architectures rely on a counter instead, and
> that, in turn, is the reason for the convoluted way the (pseudo-)entropy
> is gathered and recorded in a per-CPU variable.
> 
> Let's try to make the get_random_uXX() fast path faster, and switch to
> get_random_u8() so that we'll hit the slow path 2x less often. Then,
> wire it up in the syscall entry path, replacing the per-CPU variable,
> making the logic at syscall exit redundant.

I ran the same set of syscall benchmarks for this series as I've done for my 
series. 

The baseline is v6.18-rc5 with stack randomization turned *off*. So I'm showing
performance cost of turning it on without any changes to the implementation,
then the reduced performance cost of turning it on with my changes applied, and 
finally cost of turning it on with Ard's changes applied:

arm64 (AWS Graviton3):
+-----------------+--------------+-------------+---------------+-----------------+
| Benchmark       | Result Class |   v6.18-rc5 | per-task-prng | fast-get-random |
|                 |              | rndstack-on |               |                 |
+=================+==============+=============+===============+=================+
| syscall/getpid  | mean (ns)    |  (R) 15.62% |     (R) 3.43% |      (R) 11.93% |
|                 | p99 (ns)     | (R) 155.01% |     (R) 3.20% |      (R) 11.00% |
|                 | p99.9 (ns)   | (R) 156.71% |     (R) 2.93% |      (R) 11.39% |
+-----------------+--------------+-------------+---------------+-----------------+
| syscall/getppid | mean (ns)    |  (R) 14.09% |     (R) 2.12% |      (R) 10.44% |
|                 | p99 (ns)     | (R) 152.81% |         1.55% |       (R) 9.94% |
|                 | p99.9 (ns)   | (R) 153.67% |         1.77% |       (R) 9.83% |
+-----------------+--------------+-------------+---------------+-----------------+
| syscall/invalid | mean (ns)    |  (R) 13.89% |     (R) 3.32% |      (R) 10.39% |
|                 | p99 (ns)     | (R) 165.82% |     (R) 3.51% |      (R) 10.72% |
|                 | p99.9 (ns)   | (R) 168.83% |     (R) 3.77% |      (R) 11.03% |
+-----------------+--------------+-------------+---------------+-----------------+

So this fixes the tail problem. I guess get_random_u8() only takes the slow path 
every 768 calls, whereas get_random_u16() took it every 384 calls. I'm not sure 
that fully explains it though.

But it's still a 10% cost on average.

Personally I think 10% syscall cost is too much to pay for 6 bits of stack 
randomisation. 3% is better, but still higher than we would all prefer, I'm sure.

Thanks,
Ryan

> 
> [0] https://lore.kernel.org/all/dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com/
> 
> Cc: Kees Cook <kees@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Jeremy Linton <jeremy.linton@arm.com>
> Cc: Catalin Marinas <Catalin.Marinas@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Jason A. Donenfeld <Jason@zx2c4.com>
> 
> Ard Biesheuvel (6):
>   hexagon: Wire up cmpxchg64_local() to generic implementation
>   arc: Wire up cmpxchg64_local() to generic implementation
>   random: Use u32 to keep track of batched entropy generation
>   random: Use a lockless fast path for get_random_uXX()
>   random: Plug race in preceding patch
>   randomize_kstack: Use get_random_u8() at entry for entropy
> 
>  arch/Kconfig                       |  9 ++--
>  arch/arc/include/asm/cmpxchg.h     |  3 ++
>  arch/hexagon/include/asm/cmpxchg.h |  4 ++
>  drivers/char/random.c              | 49 ++++++++++++++------
>  include/linux/randomize_kstack.h   | 36 ++------------
>  init/main.c                        |  1 -
>  6 files changed, 49 insertions(+), 53 deletions(-)
> 
> 
> base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d


