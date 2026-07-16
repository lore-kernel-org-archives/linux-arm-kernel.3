Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24434C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 13:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqxxc5A53OKhz48FL6b7XXdZbwD1IyUVhQ5mJc6kbbQ=; b=jEKAhBy5oCvqy4v1iENQM/3dmO
	TskBVp7acoUNCAjJRHjeMXJXtgP8XXxaKblQ7Zr5Eimmbe4tllDz0EecsWIKgmDuOkRwQGJ5scC2g
	Q/7AqkLR0pf2xh6LJofqbZJev6lArSMKrrhblhej2CnS57jDhQc7OPA+ifs5Vt6U67W88siPxchfQ
	CWi4B4fd8qECBKagBnp7UnpG2E9LzBC5nOyzAUF0U15Q82vuN6UFnujODM62NLJj/B20+tNaaPenG
	2UFULT+f6VL17rRf11OyZ0wVMMKJTNiJJObUXhxQKWgi1iumSgdyABnfUk5HGB+7SQxr+a8GEeLjH
	kOpeqtzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMRB-0000000HPWr-2RNM;
	Thu, 16 Jul 2026 13:47:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMRA-0000000HPWk-18a1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 13:47:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D25B61385;
	Thu, 16 Jul 2026 13:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4621F00A3F;
	Thu, 16 Jul 2026 13:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784209659;
	bh=vqxxc5A53OKhz48FL6b7XXdZbwD1IyUVhQ5mJc6kbbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VaAqh2FVMX4C//uMyZqUF9Rj9Pn3qi94kohEi3Arw4kg7GN6F2fJPrpj1eJdfSC3G
	 R17ih9bnYM/9KKogFZD6ZIb4OAuJsTDeBVgYWCktZcHll6rPJUod5v4ppNFyJ6ZUE1
	 UVQ/VJXEaIjcv+0ga6ZlIMZ/hbsz7ysNZGD07me2ZNXQ0m0RC8UgnUHxj5vgRoTn/4
	 H949GtI8PqIZq636TkqbSGvNzW3TPeEKu5ZPt1U0qvAyyknBN0XzVyIL/hiWffJ4UW
	 r/9RtgGsy8KRHtbODcBXel3R2k/68W2AMj/VnaKyKma8WzVtHzEzbuzcqx9yf3RnWb
	 enbdap06JhsFA==
Date: Thu, 16 Jul 2026 14:47:24 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux@armlinux.org.uk, akpm@linux-foundation.org, xiqi2@huawei.com, 
	david@kernel.org, linusw@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	liaohua4@huawei.com, lilinjie8@huawei.com, sunnanyong@huawei.com
Subject: Re: [PATCH v4] ARM: mm: acquire mmap write lock around show_pte()
 for user faults
Message-ID: <aljg0sddPohJC5ij@lucifer>
References: <20260716014022.2823-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716014022.2823-1-xieyuanbin1@huawei.com>
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

On Thu, Jul 16, 2026 at 09:40:22AM +0800, Xie Yuanbin wrote:
> When CONFIG_DEBUG_USER=y, and cmdline "user_debug=31" is set,
> a user fault may trigger show_pte() without any lock.
> If another thread in the same process concurrently calls munmap(),
> the page table pages may be freed while show_pte() is still traversing
> them, causing a use-after-free in show_pte().
>
> If CONFIG_ARM_LPAE=y, this may cause a kernel panic if the pages table
> of PMD are freed when show_pte() is running.
>
> Acquire mmap_write_lock() around show_pte() for user faults to fix the
> contention.
>
> For user faults, additionally restrict that show_pte() is called only
> when the addr is a user-space address (addr < TASK_SIZE). This is because
> the lock of tsk->mm only protects the virtual memory of user address space,
> furthermore, dumping the page tables of a kernel-space address for user
> faults is unnecessary and may have security implications.
>
> Keep everything unchanged for kernel faults, because the kernel is
> already in the "oops" state, acquiring a lock may risk a deadlock.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Fixes: 6d021b724481 ("ARM: dump pgd, pmd and pte states on unhandled data abort faults")
> Depends-on: <20260629123349.134224-1-xieyuanbin1@huawei.com>
> Depends-on: 59e4f3b45b96 ("ARM: ensure interrupts are enabled in __do_user_fault()")
>
> Cc: Russell King <linux@armlinux.org.uk>
> Suggested-by: Lorenzo Stoakes <ljs@kernel.org>
> Co-developed-by: Qi Xi <xiqi2@huawei.com>
> Signed-off-by: Qi Xi <xiqi2@huawei.com>
> Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
> For __do_user_fault(), it must be a user fault, so the
> judgement of user_mode(regs) can be omitted.
>
> For do_DataAbort(), it may be a user fault or a kernel fault. If it is
> a kernel fault, it must be a kernel oops, the kernel will die soon.
> Also, a user program may be constructed to trigger
> do_DataAbort()->show_pte(), as described in this mail:
> Link: https://lore.kernel.org/20260625100031.25088-1-xieyuanbin1@huawei.com
>
> For user faults, it is safe to acquire mmap_write_lock(), because
> we never return to user with mmap lock held or pagefault disabled.
>
> Note that, due to the lack of ARMv4T for testing, this patch does not
> fix the issue in baddataabort()->show_pte().
>
> V3->V4:
>   - Keep nothing change for kernel faults.
>   - Change mmap read lock to write lock.
>   - Restrict that show_pte() is called only when the addr
>     is a user-space address (addr < TASK_SIZE).
>
>  arch/arm/mm/fault.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
> index c68677503532..0a09d4ff7718 100644
> --- a/arch/arm/mm/fault.c
> +++ b/arch/arm/mm/fault.c
> @@ -174,21 +174,25 @@ __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,
>  	struct task_struct *tsk = current;
>
>  	local_irq_enable();
>
>  #ifdef CONFIG_DEBUG_USER
>  	if (((user_debug & UDBG_SEGV) && (sig == SIGSEGV)) ||
>  	    ((user_debug & UDBG_BUS)  && (sig == SIGBUS))) {
>  		pr_err("8<--- cut here ---\n");
>  		pr_err("%s: unhandled page fault (%d) at 0x%08lx, code 0x%03x\n",
>  		       tsk->comm, sig, addr, fsr);
> -		show_pte(KERN_ERR, tsk->mm, addr);
> +		if (likely(addr < TASK_SIZE)) {
> +			mmap_write_lock(tsk->mm);
> +			show_pte(KERN_ERR, tsk->mm, addr);
> +			mmap_write_unlock(tsk->mm);
> +		}
>  		show_regs(regs);
>  	}
>  #endif
>  #ifndef CONFIG_KUSER_HELPERS
>  	if ((sig == SIGSEGV) && ((addr & PAGE_MASK) == 0xffff0000))
>  		printk_ratelimited(KERN_DEBUG
>  				   "%s: CONFIG_KUSER_HELPERS disabled at 0x%08lx\n",
>  				   tsk->comm, addr);
>  #endif
>
> @@ -632,21 +636,29 @@ do_DataAbort(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
>
>  	if (!inf->fn(addr, fsr & ~FSR_LNX_PF, regs))
>  		return;
>
>  	if (likely(user_mode(regs)))
>  		local_irq_enable();
>
>  	pr_alert("8<--- cut here ---\n");
>  	pr_alert("Unhandled fault: %s (0x%03x) at 0x%08lx\n",
>  		inf->name, fsr, addr);
> -	show_pte(KERN_ALERT, current->mm, addr);
> +	if (likely(user_mode(regs))) {
> +		if (addr < TASK_SIZE) {
> +			mmap_write_lock(current->mm);
> +			show_pte(KERN_ALERT, current->mm, addr);
> +			mmap_write_unlock(current->mm);
> +		}
> +	} else {
> +		show_pte(KERN_ALERT, current->mm, addr);
> +	}
>
>  	arm_notify_die("", regs, inf->sig, inf->code, (void __user *)addr,
>  		       fsr, 0);
>  }
>
>  void __init
>  hook_ifault_code(int nr, int (*fn)(unsigned long, unsigned int, struct pt_regs *),
>  		 int sig, int code, const char *name)
>  {
>  	if (nr < 0 || nr >= ARRAY_SIZE(ifsr_info))
> --
> 2.53.0
>

Cheers, Lorenzo

