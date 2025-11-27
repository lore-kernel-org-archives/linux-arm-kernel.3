Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70AFD11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHwvf2EyY5z8rGajo/bIcYXP7ktW3zH8ZISFpKuiCuc=; b=Ac46Uwto5+JhPhws8xWEMgf7ea
	mwxFN6J576Td8r4mhnQ7PnmnJPTGfwsCn9ZKDDR0f2jvbknTM5FwKUbu6oF9A2O/2+IVox0NYs6Kl
	W7FTsXsGx/Z1ZUC6QnVfAAHL37GdgaSDWsac7YYiCwkhgIXsJpdKMzq7VqDJ03y6CbzXfXux6pFWO
	ojY3SJcqeOnt8HkpTb9nqD/lcRR+alXmKbyQ6LREq38RPysCLY2b5j+hi+mLDlfNY8WnwVx13yXpy
	cCQrcoPSg4tvyhTNT38/Rk+E2woZrFYfVB2w9zmSE72QoRcT7RiCe746wPaMSarrOrcYwJ9AHT0+i
	d7cWLNHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOY6d-0000000GGOx-2QO8;
	Thu, 27 Nov 2025 09:16:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOY6a-0000000GGOa-1MZe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 09:16:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AC761477;
	Thu, 27 Nov 2025 01:15:51 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D2BF3F66E;
	Thu, 27 Nov 2025 01:15:54 -0800 (PST)
Date: Thu, 27 Nov 2025 09:15:49 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Onkarnath <onkarnath.1@samsung.com>
Subject: Re: [PATCH 1/1] arm64: Print slab alloc and free paths for addresses
 in registers
Message-ID: <aSgWxZaefCaXQSx8@J2N7QTR9R3>
References: <CGME20251127060246epcas5p3f7b044dec5c4860399801a811a04155d@epcas5p3.samsung.com>
 <20251127060227.3575956-1-onkarnath.1@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127060227.3575956-1-onkarnath.1@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_011600_528498_190749FB 
X-CRM114-Status: GOOD (  23.64  )
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
Cc: thuth@redhat.com, smostafa@google.com, ryan.roberts@arm.com, Sarvesh Kadam <s.kadam@samsung.com>, kees@kernel.org, catalin.marinas@arm.com, yeoreum.yun@arm.com, kevin.brodsky@arm.com, linux-kernel@vger.kernel.org, jeremy.linton@arm.com, song@kernel.org, broonie@kernel.org, r.thapliyal@samsung.com, maz@kernel.org, leitao@debian.org, maninder1.s@samsung.com, will@kernel.org, bigeasy@linutronix.de, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Nov 27, 2025 at 11:32:27AM +0530, Onkarnath wrote:
> When debugging use-after-free kernel oopses, knowing the allocation and
> freeing paths of an object is crucial. Like arm this patch enhances arm64
> debugging by checking if register addresses belong to a slab and printing
> their corresponding alloc and free paths.
> 
> For example x21 prints alloc and free path:
> 
> pc : crash_init+0x44/0x64 [crash]
> lr : crash_init+0x34/0x64 [crash]
> .....

These dots are hiding *tonnes* of lines.

Please see my response from the last time this was proposed:
  
  https://lore.kernel.org/linux-arm-kernel/ZcDa2RXC6z7XuwAD@FVFF77S0Q05N/

At a high level, I still don't think this is a good idea.

> Register x21 information: slab task_struct start ffff0000c3cc7000 data offset 64 pointer offset 0 size 3904 allocated at copy_process+0x1ac/0x14a4
>     kmem_cache_alloc_node_noprof+0x208/0x4a8
>     copy_process+0x1ac/0x14a4
>     kernel_clone+0x70/0x380
>     __arm64_sys_fork+0x40/0x7c
>     invoke_syscall+0x48/0x104
>     el0_svc_common.constprop.0+0x40/0xe0
>     do_el0_svc_compat+0x1c/0x34
>     el0_svc_compat+0x2c/0x90
>     el0t_32_sync_handler+0x88/0xac
>     el0t_32_sync+0x19c/0x1a0
>  Free path:
>     kmem_cache_free+0x3c0/0x430
>     free_task+0x54/0x80
>     __put_task_struct+0x100/0x15c
>     __put_task_struct_rcu_cb+0x14/0x20
>     rcu_core+0x264/0x680
>     rcu_core_si+0x10/0x1c
>     handle_softirqs+0x100/0x244
>     __do_softirq+0x14/0x20
> 
> Co-developed-by: Sarvesh Kadam <s.kadam@samsung.com>
> Signed-off-by: Sarvesh Kadam <s.kadam@samsung.com>
> Signed-off-by: Onkarnath <onkarnath.1@samsung.com>
> ---
>  arch/arm64/include/asm/system_misc.h |  1 +
>  arch/arm64/kernel/process.c          | 11 +++++++++++
>  arch/arm64/kernel/traps.c            |  2 +-
>  3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/system_misc.h b/arch/arm64/include/asm/system_misc.h
> index d316a804eb38..9cb9749d8853 100644
> --- a/arch/arm64/include/asm/system_misc.h
> +++ b/arch/arm64/include/asm/system_misc.h
> @@ -27,6 +27,7 @@ void arm64_notify_die(const char *str, struct pt_regs *regs,
>  
>  struct mm_struct;
>  extern void __show_regs(struct pt_regs *);
> +extern void __show_regs_alloc_free(struct pt_regs *regs);
>  
>  #endif	/* __ASSEMBLER__ */
>  
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index fba7ca102a8c..7738ec8e5cd5 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -199,6 +199,17 @@ static void print_pstate(struct pt_regs *regs)
>  	}
>  }
>  
> +void __show_regs_alloc_free(struct pt_regs *regs)
> +{
> +	int i;
> +
> +	/* check for x0 - x31 only */
> +	for (i = 0; i < 31; i++) {
> +		pr_alert("Register x%d information:", i);
> +		mem_dump_obj((void *)regs->regs[i]);
> +	}
> +}

The comment should say 'x31' rather than 'x30'.

> +
>  void __show_regs(struct pt_regs *regs)
>  {
>  	int i, top_reg;
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index 914282016069..3b01379b8880 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -189,7 +189,7 @@ static int __die(const char *str, long err, struct pt_regs *regs)
>  
>  	print_modules();
>  	show_regs(regs);
> -
> +	__show_regs_alloc_free(regs);
>  	if (user_mode(regs))
>  		return ret;

If the regs are user regs, then the registers do not contain kernel
addresses. We shouldn't interpret the registers in that case.

We use die() and __die() for many exceptions that are entirely unrelated
to use-after-free (e.g. BTI exceptions), so this is going to be noisy
for no benefit.

Mark.

