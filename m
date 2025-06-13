Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F378C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 07:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YQgpJS6ry5iZMhsW2xSDfHWIqEsddGqeA1Qe+msXQA=; b=TKETydJQmCMXl+9C1tnCMrL8UN
	+LzIfxpj4KVb4sM3hyOoT1VEIJvBAA8fkMmzGcPaaZZix6eb2+LDT/L3275FHMoNYlYQuHwMuxh/Y
	n8BwYvKB0e50aq8Cl/+iybMFniNZV/ThZXWUM8FxomMi7fP2J0AQuvzlkxsMrtVP2nsIH/87a5rgO
	Cd8e1e2SEfJy9GUcubNsOjUf4/GLCg9VxToIkhhRj31W3/44efjq3ppEJOYP75JYogi+Fexsb5C9R
	Kea2O8Hz1VxTlDESfdGU6r1gLPhxU1Y2sSoqPnLx932znYdCWIw8TbICr+P3Ie7h+bew2IIjycXM1
	8jc11u5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzEo-0000000FhSf-1XYG;
	Fri, 13 Jun 2025 07:54:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPz85-0000000FfOF-2FWC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 07:47:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1AA61D14;
	Fri, 13 Jun 2025 00:46:52 -0700 (PDT)
Received: from [10.164.146.16] (J09HK2D2RT.blr.arm.com [10.164.146.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBB693F59E;
	Fri, 13 Jun 2025 00:47:10 -0700 (PDT)
Message-ID: <831db1e9-ed27-4116-b43b-ac580603d7ac@arm.com>
Date: Fri, 13 Jun 2025 13:17:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/13] arm64: debug: call step handlers statically
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
 <20250609173413.132168-5-ada.coupriediaz@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250609173413.132168-5-ada.coupriediaz@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_004713_670392_DED047A2 
X-CRM114-Status: GOOD (  34.16  )
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

On 09/06/25 11:04 PM, Ada Couprie Diaz wrote:
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
> the appropriate one by checking the source EL of the exception.
> Add a stand-in that returns DBG_HOOK_ERROR when the configuration
> options are not enabled.
> 
> Unify the naming of the handler to XXX_singlestep_handler(), making it
> clear they are related.

Makes sense.

> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ---
>  arch/arm64/include/asm/kgdb.h      |  9 +++++++++
>  arch/arm64/include/asm/uprobes.h   |  9 +++++++++
>  arch/arm64/kernel/debug-monitors.c | 25 ++++++-------------------
>  arch/arm64/kernel/kgdb.c           | 17 +++--------------
>  arch/arm64/kernel/probes/uprobes.c |  9 +--------
>  5 files changed, 28 insertions(+), 41 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kgdb.h b/arch/arm64/include/asm/kgdb.h
> index 82a76b2102fb..fa0c1edb8a65 100644
> --- a/arch/arm64/include/asm/kgdb.h
> +++ b/arch/arm64/include/asm/kgdb.h
> @@ -26,6 +26,15 @@ extern int kgdb_fault_expected;
>  
>  int kgdb_brk_handler(struct pt_regs *regs, unsigned long esr);
>  int kgdb_compiled_brk_handler(struct pt_regs *regs, unsigned long esr);
> +#ifdef CONFIG_KGDB
> +int kgdb_singlestep_handler(struct pt_regs *regs, unsigned long esr);
> +#else
> +static inline int kgdb_singlestep_handler(struct pt_regs *regs,
> +	unsigned long esr)
> +{
> +	return DBG_HOOK_ERROR;
> +}
> +#endif
>  
>  #endif /* !__ASSEMBLY__ */
>  
> diff --git a/arch/arm64/include/asm/uprobes.h b/arch/arm64/include/asm/uprobes.h
> index 3659a79a9f32..5858e436a5a7 100644
> --- a/arch/arm64/include/asm/uprobes.h
> +++ b/arch/arm64/include/asm/uprobes.h
> @@ -29,5 +29,14 @@ struct arch_uprobe {
>  };
>  
>  int uprobe_brk_handler(struct pt_regs *regs, unsigned long esr);
> +#ifdef CONFIG_UPROBES
> +int uprobe_singlestep_handler(struct pt_regs *regs, unsigned long esr);
> +#else
> +static inline int uprobe_singlestep_handler(struct pt_regs *regs,
> +	unsigned long esr)
> +{
> +	return DBG_HOOK_ERROR;
> +}
> +#endif
>  
>  #endif
> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index 15d7158a7548..b156bef7f61e 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -200,30 +200,17 @@ void unregister_kernel_step_hook(struct step_hook *hook)
>  }
>  
>  /*
> - * Call registered single step handlers
> + * Call single step handlers
>   * There is no Syndrome info to check for determining the handler.
> - * So we call all the registered handlers, until the right handler is
> - * found which returns zero.
> + * However, there is only one possible handler for user and kernel modes, so
> + * check and call the appropriate one.
>   */
>  static int call_step_hook(struct pt_regs *regs, unsigned long esr)
>  {
> -	struct step_hook *hook;
> -	struct list_head *list;
> -	int retval = DBG_HOOK_ERROR;
> +	if (user_mode(regs))
> +		return uprobe_singlestep_handler(regs, esr);
>  
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
> -	}
> -
> -	return retval;
> +	return kgdb_singlestep_handler(regs, esr);
>  }
>  NOKPROBE_SYMBOL(call_step_hook);
>  
> diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
> index b5a3b9c85a65..8f6ce2ea005c 100644
> --- a/arch/arm64/kernel/kgdb.c
> +++ b/arch/arm64/kernel/kgdb.c
> @@ -250,7 +250,7 @@ int kgdb_compiled_brk_handler(struct pt_regs *regs, unsigned long esr)
>  }
>  NOKPROBE_SYMBOL(kgdb_compiled_brk_handler);
>  
> -static int kgdb_step_brk_fn(struct pt_regs *regs, unsigned long esr)
> +int kgdb_singlestep_handler(struct pt_regs *regs, unsigned long esr)

This rename makes sense but as mentioned later kgdb_single_step_handler()
might save some changes in uprobes callback function.

>  {
>  	if (!kgdb_single_step)
>  		return DBG_HOOK_ERROR;
> @@ -258,11 +258,7 @@ static int kgdb_step_brk_fn(struct pt_regs *regs, unsigned long esr)
>  	kgdb_handle_exception(0, SIGTRAP, 0, regs);
>  	return DBG_HOOK_HANDLED;
>  }
> -NOKPROBE_SYMBOL(kgdb_step_brk_fn);
> -
> -static struct step_hook kgdb_step_hook = {
> -	.fn		= kgdb_step_brk_fn
> -};
> +NOKPROBE_SYMBOL(kgdb_singlestep_handler);
>  
>  static int __kgdb_notify(struct die_args *args, unsigned long cmd)
>  {
> @@ -301,13 +297,7 @@ static struct notifier_block kgdb_notifier = {
>   */
>  int kgdb_arch_init(void)
>  {
> -	int ret = register_die_notifier(&kgdb_notifier);
> -
> -	if (ret != 0)
> -		return ret;
> -
> -	register_kernel_step_hook(&kgdb_step_hook);
> -	return 0;
> +	return register_die_notifier(&kgdb_notifier);
>  }
>  
>  /*
> @@ -317,7 +307,6 @@ int kgdb_arch_init(void)
>   */
>  void kgdb_arch_exit(void)
>  {
> -	unregister_kernel_step_hook(&kgdb_step_hook);
>  	unregister_die_notifier(&kgdb_notifier);
>  }

kgdb_arch_init()/_exit() now deals only with kgdb_notifier registration
and un-registration only.
 >  
> diff --git a/arch/arm64/kernel/probes/uprobes.c b/arch/arm64/kernel/probes/uprobes.c
> index ad68b4a5974d..fefc990860bc 100644
> --- a/arch/arm64/kernel/probes/uprobes.c
> +++ b/arch/arm64/kernel/probes/uprobes.c
> @@ -182,7 +182,7 @@ int uprobe_brk_handler(struct pt_regs *regs,
>  	return DBG_HOOK_ERROR;
>  }
>  
> -static int uprobe_single_step_handler(struct pt_regs *regs,
> +int uprobe_singlestep_handler(struct pt_regs *regs,
>  				      unsigned long esr)

A small nit - if the kgdb handler be changed as kgdb_single_step_handler()
the above rename can be skipped.
 >  {
>  	struct uprobe_task *utask = current->utask;
> @@ -194,15 +194,8 @@ static int uprobe_single_step_handler(struct pt_regs *regs,
>  	return DBG_HOOK_ERROR;
>  }
>  
> -/* uprobe single step handler hook */
> -static struct step_hook uprobes_step_hook = {
> -	.fn = uprobe_single_step_handler,
> -};
> -
>  static int __init arch_init_uprobes(void)
>  {
> -	register_user_step_hook(&uprobes_step_hook);
> -
>  	return 0;
>  }
>  

The arch hook arch_init_uprobes() is redundant now and can be dropped.

static int __init arch_init_uprobes(void)
{
        return 0;
}
device_initcall(arch_init_uprobes);

git grep arch_init_uprobes
arch/arm64/kernel/probes/uprobes.c:static int __init arch_init_uprobes(void)
arch/arm64/kernel/probes/uprobes.c:device_initcall(arch_init_uprobes);

Otherwise LGTM.

