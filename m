Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2EFC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 16:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ula104aVcKi/gPbLIe1VwoE4MuJLu2HHKxa4BLTzj8=; b=4CSQ3czE5vklSp
	VgNWNA8hDIA9qZo+4R7LZxm3MCPP3zLC7UMpoPSdzjgZFjLRbN9lQGTmTwNeJkn7S+xDtxUPKFhFu
	Y8PMA+Qj7GMCpSHY5Z8yHDfESFSoz6gbFd0ADTpdo3KiEoUTKVdpqjKMptarRAOqR2btswFBRqGSI
	OgbxKnR6D8lchqo9ZELy7AnPNd2IUk7inCBSyQagRaw3lXxzUzIHILpyu48/+flSBWbdxiMVkzm57
	jVA0HXvR5Q3SJAMGtENfUjGwQsqxJtV4KjyO2FSrNWIdNGmNxAkpCXxGmlJDk1zNcUUcRBjwdRtcH
	9I/08Seqz2laOat+V4zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKLE-0000000DG1i-0p9K;
	Tue, 05 Aug 2025 16:16:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJFp-0000000D6Kk-0n3c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 15:07:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77E4C2BCE;
	Tue,  5 Aug 2025 08:06:56 -0700 (PDT)
Received: from [10.1.29.177] (e137867.arm.com [10.1.29.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 423853F673;
	Tue,  5 Aug 2025 08:07:00 -0700 (PDT)
Message-ID: <44fd646c-4e31-4ca6-9e22-f715ad19e0d7@arm.com>
Date: Tue, 5 Aug 2025 16:06:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 5/7] arm64: entry: Refactor
 preempt_schedule_irq() check code
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-6-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250729015456.3411143-6-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_080705_302603_CBECB977 
X-CRM114-Status: GOOD (  22.90  )
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

On 29/07/2025 02:54, Jinjie Ruan wrote:
> ARM64 requires an additional check whether to reschedule on return
> from interrupt. So add arch_irqentry_exit_need_resched() as the default
> NOP implementation and hook it up into the need_resched() condition in
> raw_irqentry_exit_cond_resched(). This allows ARM64 to implement
> the architecture specific version for switching over to
> the generic entry code.
I was a bit confused by this, as I didn't see the link with the generic 
entry
given you implement `raw_irqentry_exit_cond_resched()` in arch/arm64
as well in this patch : I expected the arm64 implementation to be added.
I share more thoughts below.

What do you think about something along those lines ?

	Compared to the generic entry code, arm64 does additional checks
	when deciding to reschedule on return from an interrupt.
	Introduce arch_irqentry_exit_need_resched() in the need_resched() condition
	of the generic raw_irqentry_exit_cond_resched(), with a NOP default.
	This will allow arm64 to implement its architecture specific checks when
	switching over to the generic entry code.

> [...]
> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> index b82032777310..4aa9656fa1b4 100644
> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c
> @@ -142,6 +142,20 @@ noinstr irqentry_state_t irqentry_enter(struct pt_regs *regs)
>   	return ret;
>   }
>   
> +/**
> + * arch_irqentry_exit_need_resched - Architecture specific need resched function
> + *
> + * Invoked from raw_irqentry_exit_cond_resched() to check if need resched.
Very nit : "to check if resched is needed." ?
> + * Defaults return true.
> + *
> + * The main purpose is to permit arch to skip preempt a task from an IRQ.
If feel that "to avoid preemption of a task" instead of "to skip preempt 
a task"
would make this much clearer, what do you think ?
> + */
> +static inline bool arch_irqentry_exit_need_resched(void);
> +
> +#ifndef arch_irqentry_exit_need_resched
> +static inline bool arch_irqentry_exit_need_resched(void) { return true; }
> +#endif
> +

I've had some trouble reviewing this patch : on the one hand because
I didn't notice `arch_irqentry_exit_need_resched()` was added in
the common entry code, which is on me !
On the other hand, I felt that the patch itself was a bit disconnected :
we add `arch_irqentry_exit_need_resched()` in the common entry code,
with a default NOP, but in the same function we add to arm64,
while mentioning that this is for arm64's additional checks,
which we only implement in patch 7.

Would it make sense to move the `arch_irqentry_exit_need_resched()`
part of the patch to patch 7, so that the introduction and
arch-specific implementation appear together ?
To me it seems easier to wrap my head around, as it would look like
"Move arm64 to generic entry, but it does additional checks : add a new
arch-specific function controlling re-scheduling, defaulting to true,
and implement it for arm64". I feel it could help making patch 7's
commit message clearer as well.

 From what I gathered on the archive `arch_irqentry_exit_need_resched()`
being added here was suggested previously, so others might not have the
same opinion.

Maybe improving the commit message and comment for this would be enough
as well, as per my suggestions above.


Otherwise the changes make sense and I don't see any functional issues !

Thanks,
Ada


