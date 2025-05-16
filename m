Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D445C5475C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 14:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmQwNOi/f6CluZRsIYvFpZaRwahVa9MuW5pU8l6vQl8=; b=Mz4gxmgBVuLCw0UzArOOkPkXpO
	bjlc6xmgrBzcXdRCorWD1AwGpyVBNb34IkG1ySUCdwVz4aKmbUm6lKtKC7r2nkJPGhaKPMO51cO1i
	E7r6FDRhIHFV5cWz8H9Hg49ramCPxOsXOXx3ML7rrmHM/7WWyGRUMZAVPjOykZlwbyx5IlfODDPzW
	z9O+6XFZ+Tv/i5qXpIpTa7ArmGAZ8WZ+kderuof7Wy4JIS4HocOWR74vKTrAFY7eWJrKmUS2aWzNn
	HVhVLz2+bFp2DG13vshgFSvJV3b3iUsLuRkji8V500SZfpy0wQuXBEcr1Ii1K9VVKGMGhmrcwLOl9
	5Bc7IrMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwL2-00000003iCE-0VVD;
	Fri, 16 May 2025 14:47:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvgG-00000003bl1-1KKh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 14:04:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D5A85C5610;
	Fri, 16 May 2025 14:02:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE4EC4CEE4;
	Fri, 16 May 2025 14:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747404295;
	bh=AcX7tJ/ZUkuJv8Tg+tmGlLiFwaFyI1AG9s7LQ2m9uK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWXEi9y0sujjRRuBmABfYG8aC8Yb7Ogj/u2xJ6sng23hf5pdWO2uNgvuZ7suPU89g
	 VuOGWbFRg0G4wOkLNGFvFjeRM03/+EX2ebf8mpM+ftoXYYW5TWTBNpKt2d1IWXM87n
	 si6S4k12240nPIvNtouc1TuXPp7VzoppyggtYqcCCJ3Mtz/q6UHkkiovr3bA5YwQPw
	 bvsaONlIpfUmZhIt2kfPfx/PST5Mi5+tl9UivVejq4c0RWDco1eOMGWGMEI1Phr482
	 GSlJDRrPzIxp+85quro+fUgIgRxIDepmx0Xk9fHJjDw8nm2BxRnMiw2v+vLKc4p6Ri
	 AHbivDFiHCJHA==
Date: Fri, 16 May 2025 15:04:50 +0100
From: Will Deacon <will@kernel.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	john.ogness@linutronix.de,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 17/22] arm64: mm: Add page fault trace points
Message-ID: <20250516140449.GB13612@willie-the-truck>
References: <cover.1745999587.git.namcao@linutronix.de>
 <554038c996662282df8a9d0482ef06f8d44fccc5.1745999587.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <554038c996662282df8a9d0482ef06f8d44fccc5.1745999587.git.namcao@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_070456_398064_773AB60B 
X-CRM114-Status: GOOD (  17.58  )
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

On Wed, Apr 30, 2025 at 01:02:32PM +0200, Nam Cao wrote:
> Add page fault trace points, which are useful to implement RV monitor which
> watches page faults.
> 
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm64/mm/fault.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index ef63651099a9..e3f096b0dffd 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -44,6 +44,9 @@
>  #include <asm/tlbflush.h>
>  #include <asm/traps.h>
>  
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/exceptions.h>
> +
>  struct fault_info {
>  	int	(*fn)(unsigned long far, unsigned long esr,
>  		      struct pt_regs *regs);
> @@ -559,6 +562,11 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
>  	if (kprobe_page_fault(regs, esr))
>  		return 0;
>  
> +	if (user_mode(regs))
> +		trace_page_fault_user(addr, regs, esr);
> +	else
> +		trace_page_fault_kernel(addr, regs, esr);

Why is this after kprobe_page_fault()?

It's also a shame that the RV monitor can't hook into perf, as we
already have a sw event for page faults that you could use instead of
adding something new.

Will

