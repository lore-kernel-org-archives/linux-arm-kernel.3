Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D87CCEE341
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 17:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1bdKCJguNNo3npvRZdd/mrwfB45m2a1qEzsSxHXqGA=; b=cTae9E+yanZKUY4NcYgH+xRrvw
	um+tkg24wEqp099YZYjg1qoTalrBY6SpXC28OqNL6Zbxq2WW3xOTEPqKDERtnNk9AdXxMzMLZ78LQ
	qHB1y743isjoXIfpZFs+S1xkPqW05GAy8zfclDGKjdr9jO5CYtOTskZLNvhW1rX/8wjUNFJNqBOlz
	xi4ZBvKKA0SBPhSCcwERjyr089y2IsjL57IIZKdxDbHwmjkmapbTB9W2hLjyoqfIe/5WvzizDvPLO
	+tesUThi+yqNoM/ULv9O6E0dUIHJhhCowfCZm3n9iW93EfamYHOS0PslTCqzGviSZGZD//WFemPcU
	POLbPjXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPHD-00000000piS-252W;
	Tue, 18 Nov 2025 17:13:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPHC-00000000pht-0LCv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 17:13:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB40E1691;
	Tue, 18 Nov 2025 09:13:49 -0800 (PST)
Received: from [10.57.39.196] (unknown [10.57.39.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27E0E3F66E;
	Tue, 18 Nov 2025 09:13:51 -0800 (PST)
Message-ID: <e37844e3-8810-42c1-bae1-30b2e7868b80@arm.com>
Date: Tue, 18 Nov 2025 18:13:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/11] entry: Add has_syscall_work() helper
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 akpm@linux-foundation.org, ldv@strace.io, macro@orcam.me.uk, deller@gmx.de,
 mark.rutland@arm.com, song@kernel.org, mbenes@suse.cz, ryan.roberts@arm.com,
 ada.coupriediaz@arm.com, anshuman.khandual@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, dvyukov@google.com, kmal@cock.li, lihongbo22@huawei.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251117133048.53182-1-ruanjinjie@huawei.com>
 <20251117133048.53182-10-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20251117133048.53182-10-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_091358_162242_39FDCCDC 
X-CRM114-Status: GOOD (  16.09  )
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

On 17/11/2025 14:30, Jinjie Ruan wrote:
> Add has_syscall_work() helper to facilitate reuse of this
> function in other places.
>
> No functional changes.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  include/linux/entry-common.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
> index cd6dacb2d8bf..e0f94e937e84 100644
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -44,6 +44,11 @@
>  				 SYSCALL_WORK_SYSCALL_EXIT_TRAP	|	\
>  				 ARCH_SYSCALL_WORK_EXIT)
>  
> +static inline bool has_syscall_work(unsigned long work)
> +{
> +	return unlikely(work & SYSCALL_WORK_ENTER);

I'm not sure this is a good idea, since the generic syscall machinery
has two separate sets of flags (SYSCALL_WORK_ENTER and
SYSCALL_WORK_EXIT). Of course we could reflect that in the helper's
name, but since it's only used twice after patch 10, maybe we don't need
a helper at all.

- Kevin

> +}
> +
>  /**
>   * syscall_enter_from_user_mode_prepare - Establish state and enable interrupts
>   * @regs:	Pointer to currents pt_regs
> @@ -91,7 +96,7 @@ static __always_inline long syscall_enter_from_user_mode_work(struct pt_regs *re
>  {
>  	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
>  
> -	if (work & SYSCALL_WORK_ENTER)
> +	if (has_syscall_work(work))
>  		syscall = syscall_trace_enter(regs, syscall, work);
>  
>  	return syscall;

