Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A67C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 16:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1Au+hE/4622pg0iW4e56YFidMHjPdVgcjm7MV6g6kg=; b=izYKlk5eqYXoqd+ABVamYyO+oj
	omHy7qzCEtc6ZFvBsCUubGfXLwFAcnqVrmqN7QQ9A3fOuEkh6Y1rymof1VCIew+xv0iPoJ10pss/Q
	RlCJWg60JBurHg7FlXs0HtljxD3NNyvvOmU+iK754Fo4J4Fi6o9bqTFMGkdZH9nlWBTYvOUrkuHWL
	/FGllU2k60cvRqO89eBkCUuYI0E31rNUECXoRy4UAaacVc+KYR4oxzgrdGDpz9TyxeIBMyBRMSh73
	0kXVMqnRbpvc7aMmH5Zhl9IfvRP5PYyB9ryy4c6h8pzvqvAD0/ZstrsFMIYfq4cNijv59juu3GdDh
	dLqdFjsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPXk-0000000DSrF-07ND;
	Tue, 20 May 2025 16:10:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHP0e-0000000DN6O-1RSt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:36:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8876A5C4BE5;
	Tue, 20 May 2025 15:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFF3C4CEE9;
	Tue, 20 May 2025 15:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747755363;
	bh=+wyKi8BKfm78vRCoH0hmobvrlp0knZMxDkxoL/Ni2Sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=goVNIgGMCHxL6SgsqwhtSFoaQfOajrsuoMSfZaDGx1aUU+PXUG0dXjqWY+mPbaLyz
	 fd38nbuFooRKT6dpP0kBNiyYk67NE3tNYRFEDLmKIUz7gulUhpmx84dtTKaEbyW1XH
	 eY33rL+hq+JBq22XMDo/OwzzQuZCMwuZERdd1wu3UkXxN9/QhZ30gNWTLUNP3oyAZ/
	 coJmldqaXDEcrCVkUBG5L4w3Nfi1pvZhfeblYuJmqVbdZBsYObs6Ah2vFgHVERzlyW
	 1jxSXlWB7Fg5LsL/13vYkLzCFFVKoxnDDZ7xc13jCwHAF7vGVy76jAizXHmyJRVHnX
	 M+P2KCPsXIPuQ==
Date: Tue, 20 May 2025 16:35:58 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v2 03/11] arm64: debug: call step handlers statically
Message-ID: <20250520153558.GC18901@willie-the-truck>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-4-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512174326.133905-4-ada.coupriediaz@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_083604_493319_6BD00DDA 
X-CRM114-Status: GOOD (  32.19  )
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

On Mon, May 12, 2025 at 06:43:18PM +0100, Ada Couprie Diaz wrote:
> Software stepping checks for the correct handler by iterating over a list
> of dynamically registered handlers and calling all of them until one
> handles the exception.
> 
> This is the only generic way to handle software stepping handlers in arm64
> as the exception does not provide an immediate that could be checked,
> contrary to software breakpoints.
> 
> However, the registration mechanism is not exported and has only
> two current users : the KGDB stepping handler, and the uprobe single step
> handler.
> Given that one comes from user mode and the other from kernel mode, call
> the appropriate one by checking the source EL of the exception, if it
> is enabled.
> 
> Unify the naming of the handler to XXX_singlestep_handler(), making it
> clear they are related.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ---
>  arch/arm64/include/asm/kgdb.h      |  1 +
>  arch/arm64/include/asm/uprobes.h   |  1 +
>  arch/arm64/kernel/debug-monitors.c | 32 +++++++++++++-----------------
>  arch/arm64/kernel/kgdb.c           | 17 +++-------------
>  arch/arm64/kernel/probes/uprobes.c |  9 +--------
>  5 files changed, 20 insertions(+), 40 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kgdb.h b/arch/arm64/include/asm/kgdb.h
> index 82a76b2102fb..fd287ec38bb7 100644
> --- a/arch/arm64/include/asm/kgdb.h
> +++ b/arch/arm64/include/asm/kgdb.h
> @@ -26,6 +26,7 @@ extern int kgdb_fault_expected;
>  
>  int kgdb_brk_handler(struct pt_regs *regs, unsigned long esr);
>  int kgdb_compiled_brk_handler(struct pt_regs *regs, unsigned long esr);
> +int kgdb_singlestep_handler(struct pt_regs *regs, unsigned long esr);
>  
>  #endif /* !__ASSEMBLY__ */
>  
> diff --git a/arch/arm64/include/asm/uprobes.h b/arch/arm64/include/asm/uprobes.h
> index 3659a79a9f32..e44bbef40eca 100644
> --- a/arch/arm64/include/asm/uprobes.h
> +++ b/arch/arm64/include/asm/uprobes.h
> @@ -29,5 +29,6 @@ struct arch_uprobe {
>  };
>  
>  int uprobe_brk_handler(struct pt_regs *regs, unsigned long esr);
> +int uprobe_singlestep_handler(struct pt_regs *regs, unsigned long esr);
>  
>  #endif
> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index 4ece4a93b872..81b813e16842 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -200,30 +200,26 @@ void unregister_kernel_step_hook(struct step_hook *hook)
>  }
>  
>  /*
> - * Call registered single step handlers
> + * Call single step handlers
>   * There is no Syndrome info to check for determining the handler.
> - * So we call all the registered handlers, until the right handler is
> - * found which returns zero.
> + * However, there is only one possible handler for user and kernel modes, so
> + * check and call the appropriate one if it is enabled.
>   */
>  static int call_step_hook(struct pt_regs *regs, unsigned long esr)
>  {
> -	struct step_hook *hook;
> -	struct list_head *list;
> -	int retval = DBG_HOOK_ERROR;
> -
> -	list = user_mode(regs) ? &user_step_hook : &kernel_step_hook;
> -
> -	/*
> -	 * Since single-step exception disables interrupt, this function is
> -	 * entirely not preemptible, and we can use rcu list safely here.
> -	 */
> -	list_for_each_entry_rcu(hook, list, node)	{
> -		retval = hook->fn(regs, esr);
> -		if (retval == DBG_HOOK_HANDLED)
> -			break;
> +	if (user_mode(regs)) {
> +#if CONFIG_UPROBES

nit: this should be #ifdef and my compiler complains about that:

  | arch/arm64/kernel/debug-monitors.c:172:5: warning: 'CONFIG_UPROBES' is not defined, evaluates to 0 [-Wundef]

> +		return uprobe_singlestep_handler(regs, esr);
> +#else
> +		return DBG_HOOK_ERROR;
> +#endif

It would probably be cleaner to have a static inline definition of
uprobe_singlestep_handler() when !CONFIG_UPROBES that just returns
DBG_HOOK_ERROR.

>  	}
>  
> -	return retval;
> +#ifdef CONFIG_KGDB
> +	return kgdb_singlestep_handler(regs, esr);
> +#else
> +	return DBG_HOOK_ERROR;
> +#endif

Similarly here.

Will

