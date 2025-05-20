Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B5AC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 16:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAcE/ZEvJhsxfpVLads3jYRvGAx3uiSebGd+h6delzs=; b=XS32bRKiMhYD2OGLloy3jzD3w0
	nydpDG4HAOX6+pJvZmPiMW0koJ3tjSadi+DLF2qKtlevsSYfV5XJ8WRqGPfVtNbC1whZ0kiNMy7RM
	JLXat6fB3J3RzCT4U9HjJ+dVSgUPWURY+AtvaU7MvHsgh1/4WWEw2PNhKMFDQjyF0/6qnrSeRnPWV
	K6xIa2oNIlbxB0FDKNkG6YwAy78s5R3GRinozpRvdCjxu6CvA0T6ki6tD3w2LZGKnxQWClCpq6uAe
	+r6XwX+7OhZMTJOawY2+0wd+B/fXLcPQl88jnYWgVZUx5Of02uLSXhzv7WHKd76YedIjEiLSDGvZ4
	wquXFFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPby-0000000DTl8-2Ree;
	Tue, 20 May 2025 16:14:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHP0z-0000000DNBV-04Mo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:36:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32AA05C51B9;
	Tue, 20 May 2025 15:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF07EC4CEE9;
	Tue, 20 May 2025 15:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747755384;
	bh=z1oLcAfDC7HA7EWSzuTVentAA2Fs7TrZ9xCwfYAvd/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sxgXxTglWlTDXD2kcalA5nO/tRW1a6XTo/596FVZgFxjD3CjzOzRV/eq1iBEEqcdM
	 46d42bT4kUFmIfEG9s2h5HEBjZleZpIdsQKayyHWmKVrtUSgpwP0QPW3sFMaRr8AWY
	 Dw0ZNl5+6V//rD2gfS+Oi0sQNmtmvIxi2daohBBRBI/TWx7MoxMeVrC2r/V23jaEEW
	 PClTmavX2qhDN7kxYy3cZQ33iZ4iaWqHw1BsqW0WoEwmsev7zI/js0n6t1dEuRY5wK
	 bjimKkLImKr/5SVzKLi4BatsBaGE6bkBmrwSGsER2AMhpxuTc5oddUPmGR0hhGAlUS
	 h3Ez0bh1JvbQQ==
Date: Tue, 20 May 2025 16:36:19 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v2 05/11] arm64: entry: Add entry and exit functions for
 debug exceptions
Message-ID: <20250520153619.GE18901@willie-the-truck>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-6-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512174326.133905-6-ada.coupriediaz@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_083625_097484_F96F8735 
X-CRM114-Status: GOOD (  20.81  )
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

On Mon, May 12, 2025 at 06:43:20PM +0100, Ada Couprie Diaz wrote:
> Duplicate the `debug_exception_entry()` and `debug_exception_exit()`

nit: it's debug_exception_enter().

> functions from mm/fault.c, as they are needed to split
> the debug exceptions entry paths from the current unified one.
> The original will be removed in a cleanup patch.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ---
>  arch/arm64/kernel/entry-common.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index b260ddc4d3e9..92d78b329e67 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -418,6 +418,28 @@ static inline void fp_user_discard(void)
>  	}
>  }
>  
> +/*
> + * In debug exception context, we explicitly disable preemption despite
> + * having interrupts disabled.
> + * This serves two purposes: it makes it much less likely that we would
> + * accidentally schedule in exception context and it will force a warning
> + * if we somehow manage to schedule by accident.
> + */
> +static void debug_exception_enter(struct pt_regs *regs)
> +{
> +	preempt_disable();
> +
> +	/* This code is a bit fragile.  Test it. */
> +	RCU_LOCKDEP_WARN(!rcu_is_watching(), "exception_enter didn't work");
> +}
> +NOKPROBE_SYMBOL(debug_exception_enter);
> +
> +static void debug_exception_exit(struct pt_regs *regs)
> +{
> +	preempt_enable_no_resched();
> +}
> +NOKPROBE_SYMBOL(debug_exception_exit);

Could you make these externally visible (i.e. drop the 'static') so that
you can remove the definitions from mm/fault.c at the same time? Then
you could add the 'static' back at the end when there are no more
external callers.

Will

