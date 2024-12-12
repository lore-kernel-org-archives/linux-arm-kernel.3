Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EEBE77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 14:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vCud+Oh/vKVKffBhg7z6UvUqZzNo4nac369fgG30QU=; b=w7Kq87FfjTZNdIXf63xOpVNHp2
	OfyQh1oCKZRH32r1srulzzsbURT8bUkO5wOj94/b58eCY6tnOD4zYrK10bLd0o48tG3Gqs4ZUAC1Y
	MpDSJq8xd+RpPo6D/PEmBjKrs0yX0mvz2t7qklGtsxhUXDI55RSE3tj4Pwq9KSUhf5z+mzfWDSxc8
	u/4jqk9LPmSpOa7fathxXXdH7iHjyrK9QeF34fGwNWDIIHejwFEvrvYbKC+8HZxXIxzzMSs0YUM7M
	BYs8vNgmLVqH0CVeMnwtlrCpUiayVBCCKwAU85JMJJl/iW8/LoeeR4hFaedINsCWmjDG5u0027/nV
	qw2e96Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLkJV-00000000d8Y-3cft;
	Thu, 12 Dec 2024 14:37:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLkIQ-00000000cxi-0ZVu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 14:36:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79ADF153B;
	Thu, 12 Dec 2024 06:36:31 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6876F3F58B;
	Thu, 12 Dec 2024 06:36:02 -0800 (PST)
Date: Thu, 12 Dec 2024 14:35:56 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH v2] arm64: signal: Ensure signal delivery failure is
 recoverable
Message-ID: <Z1r0zO3BrYrt1xNY@e133380.arm.com>
References: <20241210160940.2031997-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210160940.2031997-1-kevin.brodsky@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_063606_217624_5AB313F2 
X-CRM114-Status: GOOD (  26.51  )
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

Hi,

On Tue, Dec 10, 2024 at 04:09:40PM +0000, Kevin Brodsky wrote:
> Commit eaf62ce1563b ("arm64/signal: Set up and restore the GCS
> context for signal handlers") introduced a potential failure point
> at the end of setup_return(). This is unfortunate as it is too late
> to deliver a SIGSEGV: if that SIGSEGV is handled, the subsequent
> sigreturn will end up returning to the original handler, which is
> not the intention (since we failed to deliver that signal).
> 
> Make sure this does not happen by calling gcs_signal_entry()
> at the very beginning of setup_return(), and add a comment just
> after to discourage error cases being introduced from that point
> onwards.
> 
> While at it, also take care of copy_siginfo_to_user(): since it may
> fail, we shouldn't be calling it after setup_return() either. Call
> it before setup_return() instead, and move the setting of X1/X2
> inside setup_return() where it belongs (after the "point of no
> failure").
> 
> Background: the first part of setup_rt_frame(), including
> setup_sigframe(), has no impact on the execution of the interrupted
> thread. The signal frame is written to the stack, but the stack
> pointer remains unchanged. Failure at this stage can be recovered by
> a SIGSEGV handler, and sigreturn will restore the original context,
> at the point where the original signal occurred. On the other hand,
> once setup_return() has updated registers including SP, the thread's
> control flow has been modified and we must deliver the original
> signal.
> 
> Fixes: eaf62ce1563b ("arm64/signal: Set up and restore the GCS context for signal handlers")
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
> v1..v2:
> * Added a short comment in setup_rt_frame() after the call to
>   setup_return() to discourage adding failure points there.
>   [Dave's suggestion]

Assuming that this was the only change, I was OK for you to add:

Reviewed-by: Dave Martin <Dave.Martin@arm.com>

> 
> Cc: broonie@kernel.org
> Cc: catalin.marinas@arm.com
> Cc: Dave.Martin@arm.com
> Cc: will@kernel.org
> ---
>  arch/arm64/kernel/signal.c | 48 ++++++++++++++++++++++++++------------
>  1 file changed, 33 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c

[...]

> @@ -1537,14 +1553,16 @@ static int setup_rt_frame(int usig, struct ksignal *ksig, sigset_t *set,

[...]

>  		err = setup_return(regs, ksig, &user, usig);
> -		if (ksig->ka.sa.sa_flags & SA_SIGINFO) {
> -			err |= copy_siginfo_to_user(&frame->info, &ksig->info);
> -			regs->regs[1] = (unsigned long)&frame->info;
> -			regs->regs[2] = (unsigned long)&frame->uc;
> -		}
> -	}
> +
> +	/*
> +	 * We must not fail if setup_return() succeeded - see comment at the
> +	 * beginning of setup_return().
> +	 */
>  
>  	if (err == 0)
>  		set_handler_user_access_state();
> 
> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> -- 
> 2.47.0
> 
> 

Cheers
---Dave

