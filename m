Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A98D65C7E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 11:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kdBxF0wUURs2ZbWiGK5CsXFLJMqIEbQa/CUC2dXzTs=; b=3AWv4Nc2qOePVkqcTWEg/CJ3w2
	SytGY0hfgfqnqmhbDKrvtAn8oD9frDkBvnW79Gupgq4I5tVrJFjzJ3M93OQlg/lRUUaIHqib2nQ6L
	JA0rNAG/+tFIBeXwwLxl6qBf2gqJkq02zR8qwVpmE2QBry1MegrJJGssIMAbq2UBAPZRKCm9l49qK
	dOoWtQ3wbrVwuiehK3CLcvvq2fpT6IKJqoXd/6sZzNPni4+Dkg/qXTWh7iZsYC1Z1PHFaTvSS9WpE
	CX6cBVQ0khJMvpMAvtCsQuXCqpm6nDk1S94njq/Jxzosjox29zQmgSM683n4GjVT8vxjG+Hvu/NUV
	72QmthiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBYQ0-00000009nc8-1vX8;
	Thu, 14 Nov 2024 11:53:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXmj-00000009g7C-13KL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 11:13:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DCB91480;
	Thu, 14 Nov 2024 03:13:40 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37B6A3F6A8;
	Thu, 14 Nov 2024 03:13:09 -0800 (PST)
Date: Thu, 14 Nov 2024 11:12:59 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: tls: Fix context-switching of tpidrro_el0 when
 kpti is enabled
Message-ID: <ZzXbMXd5K5RmITJX@J2N7QTR9R3>
References: <20241114095332.23391-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114095332.23391-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_031313_360134_98A0407B 
X-CRM114-Status: GOOD (  20.05  )
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

On Thu, Nov 14, 2024 at 09:53:32AM +0000, Will Deacon wrote:
> Commit 18011eac28c7 ("arm64: tls: Avoid unconditional zeroing of
> tpidrro_el0 for native tasks") tried to optimise the context switching
> of tpidrro_el0 by eliding the clearing of the register when switching
> to a native task with kpti enabled, on the erroneous assumption that
> the kpti trampoline entry code would already have taken care of the
> write.
> 
> Although the kpti trampoline does zero the register on entry from a
> native task, the check in tls_thread_switch() is on the *next* task and
> so we can end up leaving a stale, non-zero value in the register if the
> previous task was 32-bit.
> 
> Drop the broken optimisation and zero tpidrro_el0 unconditionally when
> switching to a native 64-bit task.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: <stable@vger.kernel.org>
> Fixes: 18011eac28c7 ("arm64: tls: Avoid unconditional zeroing of tpidrro_el0 for native tasks")
> Signed-off-by: Will Deacon <will@kernel.org>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
> 
> You fix one side-channel and introduce another... :(
> 
>  arch/arm64/kernel/process.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 3e7c8c8195c3..2bbcbb11d844 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -442,7 +442,7 @@ static void tls_thread_switch(struct task_struct *next)
>  
>  	if (is_compat_thread(task_thread_info(next)))
>  		write_sysreg(next->thread.uw.tp_value, tpidrro_el0);
> -	else if (!arm64_kernel_unmapped_at_el0())
> +	else
>  		write_sysreg(0, tpidrro_el0);
>  
>  	write_sysreg(*task_user_tls(next), tpidr_el0);
> -- 
> 2.47.0.277.g8800431eea-goog
> 

