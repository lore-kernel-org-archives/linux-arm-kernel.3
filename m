Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCFCC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 16:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Vzs4RPoAB8IyDCTY8D3iwCegfdVzlhzRVOMZeRxK9Y=; b=DOmr8nX14TAIJQ
	JdZwN5sJGam82m2fGol1x+TCj862NuVmYhAeW4DSMmAebzm8XIYtQhrJQuFQkmGkFTeMiMHdLA6VO
	LHC1r/4F2N/TyIcMeuYxqNV19enDdZ59JBt6U/jU7xwk51aXmqel5rLFmLO7WxRnM7Ed6c1odumuK
	dSAEZ1WOCG/QbckeAHI8AmkUaEkbrV63HQP5LLPl0iTCONSuwaGqHhmDfAMeUUfCxbnokZ+ODRMSF
	0diIJZQFOcNnfd/2/QIXlqZbSWnllLuWjEKSaNdyOREO9yrPORNLwyuV0Ae1f2U7khmPJq2DFTEnK
	0sv6x7jmlE2RVnEyLZAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKQR-0000000DGrp-3MNl;
	Tue, 05 Aug 2025 16:22:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJGV-0000000D6Tk-3EQI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 15:07:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18C202BF2;
	Tue,  5 Aug 2025 08:07:39 -0700 (PDT)
Received: from [10.1.29.177] (e137867.arm.com [10.1.29.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAE723F673;
	Tue,  5 Aug 2025 08:07:42 -0700 (PDT)
Message-ID: <fb0b7a92-09e8-41b2-9ae7-09fb9b453961@arm.com>
Date: Tue, 5 Aug 2025 16:07:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 7/7] arm64: entry: Switch to generic IRQ entry
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-8-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250729015456.3411143-8-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_080747_905754_958B5948 
X-CRM114-Status: GOOD (  33.73  )
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
Cc: mark.rutland@arm.com, sstabellini@kernel.org, puranjay@kernel.org, anshuman.khandual@arm.com, catalin.marinas@arm.com, liaochang1@huawei.com, oleg@redhat.com, kristina.martsenko@arm.com, linux-kernel@vger.kernel.org, broonie@kernel.org, chenl311@chinatelecom.cn, xen-devel@lists.xenproject.org, leitao@debian.org, ryan.roberts@arm.com, akpm@linux-foundation.org, mbenes@suse.cz, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Jinjie,

The code changes look good to me, just a small missing clean up I believe.

On 29/07/2025 02:54, Jinjie Ruan wrote:

> Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
> to use the generic entry infrastructure from kernel/entry/*.
> The generic entry makes maintainers' work easier and codes
> more elegant.
>
> Switch arm64 to generic IRQ entry first, which removed duplicate 100+
> LOC. The next patch serise will switch to generic entry completely later.
> Switch to generic entry in two steps according to Mark's suggestion
> will make it easier to review.

I think the commit message could be clearer, especially since now this 
series
only moves arm64 to generic IRQ entry and not the complete generic entry.

What do you think of something like below ? It repeats a bit less and I 
think
it helps understanding what is going on in this specific commit, as you 
already
have details on the larger plans in the cover.

	Currently, x86, Riscv and Loongarch use the generic entry code, which makes
	maintainer's work easier and code more elegant.
	Start converting arm64 to use the generic entry infrastructure
	from kernel/entry/* by switching it to generic IRQ entry, which removes 100+
	lines of duplicate code.
	arm64 will completely switch to generic entry in a later series.

> The changes are below:
>   - Remove *enter_from/exit_to_kernel_mode(), and wrap with generic
>     irqentry_enter/exit(). Also remove *enter_from/exit_to_user_mode(),
>     and wrap with generic enter_from/exit_to_user_mode() because they
>     are exactly the same so far.
Nit : "so far" can be removed
>   - Remove arm64_enter/exit_nmi() and use generic irqentry_nmi_enter/exit()
>     because they're exactly the same, so the temporary arm64 version
>     irqentry_state can also be removed.
>
>   - Remove PREEMPT_DYNAMIC code, as generic entry do the same thing
>     if arm64 implement arch_irqentry_exit_need_resched().
This feels unrelated, given that the part that needs 
`arch_irqentry_exit_need_resched()`
is called whether or not PREEMPT_DYNAMIC is enabled ?

Given my comments on patch 5, I feel that the commit message should mention
explicitly the implementation of `arch_irqentry_exit_need_resched()` and 
why,
even though it was already mentioned in patch 5.
(This is what I was referencing in patch 5 : as I feel it's useful to 
mention again
the reasons when implementing it, it doesn't feel too out of place to 
introduce
the generic part at the same time. But again, I might be wrong here.)

Then you can have another point explaining that 
`raw_irqentry_exit_cond_resched()`
and the PREEMPT_DYNAMIC code is removed because they are identical to the
generic entry code, similarly to your other points.
> Tested ok with following test cases on Qemu virt platform:
>   - Perf tests.
>   - Different `dynamic preempt` mode switch.
>   - Pseudo NMI tests.
>   - Stress-ng CPU stress test.
>   - MTE test case in Documentation/arch/arm64/memory-tagging-extension.rst
>     and all test cases in tools/testing/selftests/arm64/mte/*.
Nit : I'm not sure if the commit message is the best place for this, 
given you
already gave some details in the cover ?
But I don't have much experience here, so I'll leave it up to you and 
others !
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> [...]
> diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
> index db3f972f8cd9..1110eeb21f57 100644
> --- a/arch/arm64/kernel/signal.c
> +++ b/arch/arm64/kernel/signal.c
> @@ -9,6 +9,7 @@
>   #include <linux/cache.h>
>   #include <linux/compat.h>
>   #include <linux/errno.h>
> +#include <linux/irq-entry-common.h>
>   #include <linux/kernel.h>
>   #include <linux/signal.h>
>   #include <linux/freezer.h>
> @@ -1576,7 +1577,7 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
>    * the kernel can handle, and then we build all the user-level signal handling
>    * stack-frames in one go after that.
>    */
> -void do_signal(struct pt_regs *regs)
> +void arch_do_signal_or_restart(struct pt_regs *regs)
Given that `do_signal(struct pt_regs *regs)` is defined in 
`arch/arm64/include/asm/exception.h`,
and that there remains no users of `do_signal()`, I think it should be 
removed there.

Thanks,
Ada

