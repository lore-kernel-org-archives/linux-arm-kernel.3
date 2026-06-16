Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89431CD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 12:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrY935J+hSM69Iye4uJ/PYQuqFrUvW1UmaPi4e3ZBEM=; b=1KQbQNzCdBavebV7/SdgF1p9W6
	UiSEmRBAOAPoPvjN/gCaGv9KCMAcY8FsAaRek444I+vsnfZlS6sePPxfVBIwegFPgvPDee/2BhRsg
	Po+ozTtQDJ93xt8QLV0pDoHeUkQTdXUUcNR+n0B0bwMIaffs2OsvZELsS/5+VzQ/b0++P02Q8HBSo
	Mwn7MlpzryMoeX6wZ0pDLyqUrz9Yqr1EaVZsp8AtihWa8v61psm1XdoVyZe0WzMkkBqAzOOyWXK2c
	MUq9ZE5UtZ75WSKUEiuC/tGsCvB7Oyy7EaMhLPbKiALd4wihJjlLFvNzNkfVxkefESz3LTQ+Wur9Y
	7QtMkDcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTJf-0000000Fnmv-2hDi;
	Tue, 16 Jun 2026 12:54:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTJT-0000000Fnj6-4Baz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 12:54:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A5CD3D5D;
	Tue, 16 Jun 2026 05:54:36 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7FE43F915;
	Tue, 16 Jun 2026 05:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781614481; bh=SZCMbXqIZpc5Kw6xTc1qIEPXEmhDKCy5D5S6DrxbzL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lMg5hkSW4SJqERq0Z1kzZylQbb+Ji1hjTiwNaPoXjR5TlThXOa0+IxQojPJ6gy+KT
	 84E36Xy1wxRPsta1MJapZ6IhGS4BrKGeL1qGbrcIaV0GV5cuT5qm3peSHOqnbjmoIp
	 tgBrkXvU+/KiyKZm09avOVtTFUyrZa7Ti8w1/Bek=
Date: Tue, 16 Jun 2026 13:54:33 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: liuqiqi@kylinos.cn
Subject: Re: [PATCH] arm64: kgdb: Fix interrupt-induced single-step exception
Message-ID: <ajFHibvMJeJykb72@J2N7QTR9R3.cambridge.arm.com>
References: <20260615052903.207943-1-liuqiqi@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615052903.207943-1-liuqiqi@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_055444_308160_3C28B6D9 
X-CRM114-Status: GOOD (  21.54  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Tongbo Wei <kf.weitongbo@h3c.com>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Jun 15, 2026 at 01:29:03PM +0800, liuqiqi@kylinos.cn wrote:
> From: Qiqi Liu <liuqiqi@kylinos.cn>
> 
> After entering kdb due to breakpoint, when we execute 'ss' or 'go'
> (will delay installing breakpoints, do single-step first),
> and it will enter kdb again.
> We found that due to context switching caused by interrupt, 
> the instruction at ss is no longer the original breakpoint instruction.
> 
> Before the patch:
> [root@localhost ~]# echo g > /proc/sysrq-trigger
> Entering kdb (current=0xffff030004f2bc00, pid 8818) on processor 15 due to Keyboard Entry
> [15]kdb> bp sysctl_vm_numa_stat_handler
> Instruction(i) BP #0 at 0xffffae550650c810 (sysctl_vm_numa_stat_handler)
>     is enabled    addr at 0xffffae550650c810, hardtype=0 installed=0
> [15]kdb> g
> [root@localhost ~]# echo 1 > /proc/sys/vm/numa_stat
> Entering kdb (current=0xffff030004f2bc00, pid 8818) on processor 12 due to Breakpoint @ 0xffffae550650c810
> [12]kdb> g
> Entering kdb (current=0xffff030004f2bc00, pid 8818) on processor 12 due to Breakpoint @ 0xffffae550650c810
> [12]kdb> g
> 
> After the patch:
> [root@localhost ~]# echo g > /proc/sysrq-trigger
> Entering kdb (current=0xfffff010012c36400, pid 6488) on processor 41 due to Keyboard Entry
> [41]kdb> bp sysctl_vm_numa_stat_handler
> Instruction(i) BP #0 at 0xfffffd1768c2dc7c8 (sysctl_vm_numa_stat_handler)
>     is enabled    addr at ffffdf1768c2dc7c8, hardtype=0 installed=0
> [41]kdb> g
> [root@localhost ~]# echo 1 > /proc/sys/vm/numa_stat
> Entering kdb (current=0xfffff010012c36400, pid 6488) on processor 7 due to Breakpoint @ 0xfffffd1768c2dc7c8
> [7]kdb> g
> [root@localhost ~]#
> 
> Fixes: 44679a4f142b ("arm64: KGDB: Add step debugging support")
> Co-developed-by: Tongbo Wei <kf.weitongbo@h3c.com>
> Signed-off-by: Tongbo Wei <kf.weitongbo@h3c.com>
> Signed-off-by: Qiqi Liu <liuqiqi@kylinos.cn>
> ---
>  arch/arm64/kernel/kgdb.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
> index 968324a79a89..e9a246a0c34f 100644
> --- a/arch/arm64/kernel/kgdb.c
> +++ b/arch/arm64/kernel/kgdb.c
> @@ -101,6 +101,8 @@ struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
>  	{ "fpcr", 4, -1 },
>  };
>  
> +static DEFINE_PER_CPU(unsigned int, kgdb_pstate);
> +
>  char *dbg_get_reg(int regno, void *mem, struct pt_regs *regs)
>  {
>  	if (regno >= DBG_MAX_REG_NUM || regno < 0)
> @@ -207,6 +209,8 @@ int kgdb_arch_handle_exception(int exception_vector, int signo,
>  		err = 0;
>  		break;
>  	case 's':
> +		__this_cpu_write(kgdb_pstate, linux_regs->pstate);
> +		linux_regs->pstate |= PSR_I_BIT;
>  		/*
>  		 * Update step address value with address passed
>  		 * with step packet.
> @@ -252,9 +256,17 @@ NOKPROBE_SYMBOL(kgdb_compiled_brk_handler);
>  
>  int kgdb_single_step_handler(struct pt_regs *regs, unsigned long esr)
>  {
> +	unsigned int pstate;
>  	if (!kgdb_single_step)
>  		return DBG_HOOK_ERROR;
>  
> +	/* restore interrupt mask status */
> +	pstate = __this_cpu_read(kgdb_pstate);
> +	if (pstate & PSR_I_BIT)
> +		regs->pstate |= PSR_I_BIT;
> +	else
> +		regs->pstate &= ~PSR_I_BIT;

I don't think this is sufficient; see the comments from last time this
approach was proposed:

  https://lore.kernel.org/linux-arm-kernel/aNPiUbdRhaRklebF@J2N7QTR9R3/

I don't think we can solve this without enlightening the entry code.

Mark.

