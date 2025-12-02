Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A9FD116F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 13:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aW6anQe+oLE0EKfJdPntunSgyOR4oOu5YRcRbL0hNo8=; b=yZgyoIUnjMQsOjuiD7Sfp4WJro
	FU050crGKQ8A049cKYkc3ImYS3TRXOaSwXEeSm8pUhj6o5U1sv7+b9i8FcmHvVlUp7Ror2wxpvlT5
	czgzppApO0TPsmseCZyfVxa/F0Vcuvlw/nIKVZwFn7ukXwg5jESYoPkZ4TAk6i6ILcSL5MXnqjFIb
	7IdM4CbUBIoi3cvOpWfc3bdkY+QihSIY4lJJg4Fs4s/WhFGQ6TARU+85OQ0VuWnfac7rTF9Kt5bsu
	lKEAEnt/0rpiT3nwNpukT+ZsjlIcMkWRL3MJDedZ2Zsm7eaC0QXWIUHlR6mllF/dfb3pat7vFevQ6
	5srUClgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQ2i-00000005PJ2-1A5W;
	Tue, 02 Dec 2025 13:03:44 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQ2c-00000005PGT-3fjm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 13:03:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aW6anQe+oLE0EKfJdPntunSgyOR4oOu5YRcRbL0hNo8=;
	b=lt78+yZYRHvYg5avVm+Rhd87KT9ImxmJ017DGVZpVir/urktGskUe7450cajX2iW46QJ3RNyW
	cog1/A/drM91gD8GLIy8N+QLuAdv6CUpUku1rFEaa0CilArBvwSuIIPUbeCVZ/D9RA76RXxmoc0
	5+uhZv1fpfUSWEfTIc1yEVk=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dLLVW0qkqzcb07;
	Tue,  2 Dec 2025 21:00:51 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 6AE79180B36;
	Tue,  2 Dec 2025 21:03:17 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 2 Dec 2025 21:03:16 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>
CC: <akpm@linux-foundation.org>, <brauner@kernel.org>,
	<catalin.marinas@arm.com>, <hch@lst.de>, <jack@suse.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
	<pangliyuan1@huawei.com>, <torvalds@linux-foundation.org>,
	<wangkefeng.wang@huawei.com>, <will@kernel.org>, <wozizhi@huaweicloud.com>,
	<xieyuanbin1@huawei.com>, <yangerkun@huawei.com>
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger sleep in RCU context
Date: Tue, 2 Dec 2025 21:02:24 +0800
Message-ID: <20251202130224.16376-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aS7e9CbQXS27sGcd@shell.armlinux.org.uk>
References: <aS7e9CbQXS27sGcd@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_050339_654651_A1576303 
X-CRM114-Status: GOOD (  35.45  )
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

On Tue, 2 Dec 2025 12:43:32 +0000, Russell King (Oracle) wrote:
> We have another issue in the code - which has the branch predictor
> hardening for spectre issues, which can be called with interrupts
> enabled, causing a kernel warning - obviously not good.
>
> There's another issue which PREEMPT_RT has picked up on - which is
> that delivering signals via __do_user_fault() with interrupts disabled
> causes spinlocks (which can sleep on PREEMPT_RT) to warn.
>
> What I'm thinking is to address both of these by handling kernel space
> page faults (which will be permission or PTE-not-present) separately
> (not even build tested):
>
> diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
> index 2bc828a1940c..972bce697c6c 100644
> --- a/arch/arm/mm/fault.c
> +++ b/arch/arm/mm/fault.c
> @@ -175,7 +175,8 @@ __do_kernel_fault(struct mm_struct *mm, unsigned long addr, unsigned int fsr,
>
>  /*
>   * Something tried to access memory that isn't in our memory map..
> - * User mode accesses just cause a SIGSEGV
> + * User mode accesses just cause a SIGSEGV. Ensure interrupts are enabled
> + * here, which is safe as the fault being handled is from userspace.
>   */
>  static void
>  __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,
> @@ -183,8 +184,7 @@ __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,
>  {
>  	struct task_struct *tsk = current;
> 
> -	if (addr > TASK_SIZE)
> -		harden_branch_predictor();
> +	local_irq_enable();
>
>  #ifdef CONFIG_DEBUG_USER
>  	if (((user_debug & UDBG_SEGV) && (sig == SIGSEGV)) ||
> @@ -259,6 +259,38 @@ static inline bool ttbr0_usermode_access_allowed(struct pt_regs *regs)
>  }
>  #endif
>
> +static int __kprobes
> +do_kernel_address_page_fault(unsigned long addr, unsigned int fsr,
> +			     struct pt_regs *regs)
> +{
> +	if (user_mode(regs)) {
> +		/*
> +		 * Fault from user mode for a kernel space address. User mode
> +		 * should not be faulting in kernel space, which includes the
> +		 * vector/khelper page. Handle the Spectre issues while
> +		 * interrupts are still disabled, then send a SIGSEGV. Note
> +		 * that __do_user_fault() will enable interrupts.
> +		 */
> +		harden_branch_predictor();
> +		__do_user_fault(addr, fsr, SIGSEGV, SEGV_MAPERR, regs);
> +	} else {
> +		/*
> +		 * Fault from kernel mode. Enable interrupts if they were
> +		 * enabled in the parent context. Section (upper page table)
> +		 * translation faults are handled via do_translation_fault(),
> +		 * so we will only get here for a non-present kernel space
> +		 * PTE or kernel space permission fault. Both of these should
> +		 * not happen.
> +		 */
> +		if (interrupts_enabled(regs))
> +			local_irq_enable();
> +
> +		__do_kernel_fault(mm, addr, fsr, regs);
> +	}
> +
> +	return 0;
> +}
> +
>  static int __kprobes
>  do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
>  {
> @@ -272,6 +304,8 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
>  	if (kprobe_page_fault(regs, fsr))
>  		return 0;
>
> +	if (addr >= TASK_SIZE)
> +		return do_kernel_address_page_fault(addr, fsr, regs);
>
>  	/* Enable interrupts if they were enabled in the parent context. */
>  	if (interrupts_enabled(regs))
>
> ... and I think there was a bug in the branch predictor handling -
> addr == TASK_SIZE should have been included.
>
> Does this look sensible?

Hi, Russell King!

This patch removes
```c
	if (addr > TASK_SIZE)
		harden_branch_predictor();
```
from do_user_fault(), and adds it to do_page_fault()->
do_kernel_address_page_fault().

However, do_user_fault() is not only called by do_page_fault(). It is
also called by do_bad_area(), do_sect_fault() and do_translation_fault().
I am not sure that if this will lead to some missing
harden_branch_predictor() mitigation.

What about something like this:
```patch
diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 2bc828a1940c..5c58072d8235 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -270,10 +270,15 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 	vm_flags_t vm_flags = VM_ACCESS_FLAGS;

 	if (kprobe_page_fault(regs, fsr))
 		return 0;

+	if (unlikely(addr >= TASK_SIZE)) {
+		fault = 0;
+		code = SEGV_MAPERR;
+		goto bad_area;
+	}

 	/* Enable interrupts if they were enabled in the parent context. */
 	if (interrupts_enabled(regs))
 		local_irq_enable();
diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 5c58072d8235..f8ee1854c854 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -184,10 +184,13 @@ __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,
 	struct task_struct *tsk = current;
 
 	if (addr > TASK_SIZE)
 		harden_branch_predictor();
 
+	if (IS_ENABLED(CONFIG_PREEMPT_RT))
+		local_irq_enable();
+
 #ifdef CONFIG_DEBUG_USER
 	if (((user_debug & UDBG_SEGV) && (sig == SIGSEGV)) ||
 	    ((user_debug & UDBG_BUS)  && (sig == SIGBUS))) {
 		pr_err("8<--- cut here ---\n");
 		pr_err("%s: unhandled page fault (%d) at 0x%08lx, code 0x%03x\n",
```

Thanks very much!

Xie Yuanbin

