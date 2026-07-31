Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6192CC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTQyXQ+ZwgZu74MYRcL/BJqp9vaDuN2k5mnimlsQCkA=; b=ns504UfdAFx9WAr+g6iDhDUIqZ
	N2WHpx4DzoXPEHltX79/HysE3wEJvZY0PLsJb+yjLJtX/C67JRsK1A6Pf/wD1peBy35eGvLoGb9Kg
	N+4l/bkzSXkVgEuvPWeO6b715eXl9mk7NMqYME84u5NTItdqv37RYkKVyKNqLBi/1H0v73aF/r0gV
	huvYbJCiGYLLdoNwYxuSBR6YSsHabHYsYJ+nswuECmQniUspxDLwkkhBL9nDLD3yiq6b3iwBdQ6+l
	4NG4OgJFe1fwelQXAaW1gp/PD1esI4KgIQL/JgSF0IOxk9XAheYxY/NhSVNuo7QoIh2tCfaPZcl+/
	dUlcE/Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoTS-0000000Co0N-0sXm;
	Fri, 31 Jul 2026 14:44:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoSq-0000000CnQa-3M0e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:43:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E1A715A1;
	Fri, 31 Jul 2026 07:43:51 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F28F73F86F;
	Fri, 31 Jul 2026 07:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785509035; bh=PzWteN1QWhe4JHT13mQYIO/VwTEzMzEqxavV1NFDI60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pcxasyko5i49uIS+oUGkntoGeHocun8pEEhjyPS6VSLjVHtsstHkyXWkre7/nLS3u
	 6p/BfW98EegXis5Bmo7TW8gLY7DNOdmJ0s+6xPjxQSce28G5OJlL+eIUnpGGxafH+6
	 EsjrsYxJbcF2dSLF2CzOycTzN7EMm1rM5HaKl7L4=
Date: Fri, 31 Jul 2026 15:43:51 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Hongyan Xia <hongyan.xia@transsion.com>
Cc: Will Deacon <will@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiazi Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC PATCH 2/9] arm64/entry: Make debug_exception_enter/exit()
 noinstr
Message-ID: <amy0p2p2QMZtexhz@J2N7QTR9R3>
References: <cover.1785153469.git.hongyan.xia@transsion.com>
 <774d423f462ff2c245e5f796dad98dd1740fa5f7.1785153469.git.hongyan.xia@transsion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <774d423f462ff2c245e5f796dad98dd1740fa5f7.1785153469.git.hongyan.xia@transsion.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_074357_088532_5858F091 
X-CRM114-Status: GOOD (  21.68  )
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

On Mon, Jul 27, 2026 at 12:25:36PM +0000, Hongyan Xia wrote:
> From: Hongyan Xia <hongyan.xia@transsion.com>
> 
> Commit 879a6754d3d11e30af24b7dc486f561510d62641 ran into a crash because
> debug_exception_enter/exit() triggered page faults caused by perf dwarf
> call graph tracing. That patch was a band-aid on top. Instead of trying
> to band-aid all possible paths that can happen during instrumentation or
> perf tracing, simply make both functions noinstr.
> 
> Drop the RCU_LOCKDEP_WARN(): arm64_enter_el1_dbg() runs first and
> enters NMI context via ct_nmi_enter(), so RCU is always watching by the
> time debug_exception_enter() runs.
> 
> Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
> ---
>  arch/arm64/kernel/entry-common.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 466529cce1c3..f06b5e2437cd 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -293,20 +293,26 @@ static __always_inline void fpsimd_syscall_exit(void)
>   * accidentally schedule in exception context and it will force a warning
>   * if we somehow manage to schedule by accident.
>   */
> -static void debug_exception_enter(struct pt_regs *regs)
> +static void noinstr debug_exception_enter(struct pt_regs *regs)
>  {
> -	preempt_disable();
> -
> -	/* This code is a bit fragile.  Test it. */
> -	RCU_LOCKDEP_WARN(!rcu_is_watching(), "exception_enter didn't work");
> +	/*
> +	 * debug_exception_enter/exit() can be quite delicate. The normal
> +	 * preempt_disable/enable() can be instrumented or traced by perf,
> +	 * which leads to a can of worms including triggering page faults.
> +	 *
> +	 * Instead of trying to make all of them work properly here, just
> +	 * open-code the simpler version of preempt_disable/enable() and make
> +	 * enter/exit() both noinstr to avoid the entire complexity.
> +	 */
> +	__preempt_count_inc();
> +	barrier();
>  }
> -NOKPROBE_SYMBOL(debug_exception_enter);

This is an open-coded version of preempt_disable_notrace(), and there's
no reason the existing code needs to be out-of-line in the first place.
Please make this:

static __always_inline void debug_exception_enter(struct pt_regs *regs)
{
	preempt_disable_notrace();
}

> -static void debug_exception_exit(struct pt_regs *regs)
> +static void noinstr debug_exception_exit(struct pt_regs *regs)
>  {
> -	preempt_enable_no_resched();
> +	barrier();
> +	__preempt_count_dec();
>  }
> -NOKPROBE_SYMBOL(debug_exception_exit);

Similarly, this is an open-coded copy of
preempt_enable_no_resched_notrace(). Please make this:

static __always_inline void debug_exception_exit(struct pt_regs *regs)
{
	preempt_enable_no_resched_notrace();
}

In both cases I'm happy with keeping the regs argument for now.

Mark.

