Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9379C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 12:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Prm+CQDluxaTSFpL/Dfdca60ckN7fzKC5qleb/U1w98=; b=H/ZoT6aM4I0Rlt4bbrVgqXNMbu
	b4NeBMJCM0tCsgg6QkYey3leiJo5kYdlKUUavobnXa8E7F5b26PwLuT3u9L3z1qwjeYjkZR5SjLZF
	0v/cfD5SVqXe1hm8FoRtAvzRBIVwERMSp7Q+dJcKgKHxVRqY7z/qlTeIqEr0znMWkQFcjzE7x8NR3
	shJyXcKOCiRgaARqrnNhs3vqwVLnGy4UpxYADAlDSJtda531GhCwY27FvWav05nHF5e92Hg95ip1v
	X7IALyha4lzwWG5xRZGjaVOMyxvycKXxjU2i76A/xsBmRRVL0LpMVVuiuSH5hsFB6RptEbjbtkckJ
	coo8nu4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSjL-0000000HN0W-3NCA;
	Mon, 10 Feb 2025 12:17:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSXf-0000000HLHF-3u3k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 12:05:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 408A21BC0;
	Mon, 10 Feb 2025 04:05:57 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D44E13F5A1;
	Mon, 10 Feb 2025 04:05:28 -0800 (PST)
Date: Mon, 10 Feb 2025 12:05:26 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, oleg@redhat.com,
	sstabellini@kernel.org, tglx@linutronix.de, peterz@infradead.org,
	luto@kernel.org, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kees@kernel.org, wad@chromium.org,
	akpm@linux-foundation.org, samitolvanen@google.com,
	masahiroy@kernel.org, hca@linux.ibm.com, aliceryhl@google.com,
	rppt@kernel.org, xur@google.com, paulmck@kernel.org, arnd@arndb.de,
	mbenes@suse.cz, puranjay@kernel.org, pcc@google.com,
	ardb@kernel.org, sudeep.holla@arm.com, guohanjun@huawei.com,
	rafael@kernel.org, liuwei09@cestc.cn, dwmw@amazon.co.uk,
	Jonathan.Cameron@huawei.com, liaochang1@huawei.com,
	kristina.martsenko@arm.com, ptosi@google.com, broonie@kernel.org,
	thiago.bauermann@linaro.org, kevin.brodsky@arm.com,
	joey.gouly@arm.com, liuyuntao12@huawei.com, leobras@redhat.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH -next v5 10/22] entry: Add
 arch_irqentry_exit_need_resched() for arm64
Message-ID: <Z6nrhhtTKQpScUd0@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-11-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-11-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_040536_021951_25A5D3EE 
X-CRM114-Status: GOOD (  19.76  )
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

On Fri, Dec 06, 2024 at 06:17:32PM +0800, Jinjie Ruan wrote:
> ARM64 requires an additional check whether to reschedule on return
> from interrupt.
> 
> Add arch_irqentry_exit_need_resched() as the default NOP
> implementation and hook it up into the need_resched() condition in
> raw_irqentry_exit_cond_resched().
> 
> This allows ARM64 to implement the architecture specific version for
> switching over to the generic entry code.

Please fold this into the earlier changes in this area mad over patches
6 to 8.

> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  kernel/entry/common.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> index b82032777310..4aa9656fa1b4 100644
> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c
> @@ -142,6 +142,20 @@ noinstr irqentry_state_t irqentry_enter(struct pt_regs *regs)
>  	return ret;
>  }
>  
> +/**
> + * arch_irqentry_exit_need_resched - Architecture specific need resched function
> + *
> + * Invoked from raw_irqentry_exit_cond_resched() to check if need resched.
> + * Defaults return true.
> + *
> + * The main purpose is to permit arch to skip preempt a task from an IRQ.
> + */
> +static inline bool arch_irqentry_exit_need_resched(void);
> +
> +#ifndef arch_irqentry_exit_need_resched
> +static inline bool arch_irqentry_exit_need_resched(void) { return true; }
> +#endif
> +
>  void raw_irqentry_exit_cond_resched(void)
>  {
>  	if (!preempt_count()) {
> @@ -149,7 +163,7 @@ void raw_irqentry_exit_cond_resched(void)
>  		rcu_irq_exit_check_preempt();
>  		if (IS_ENABLED(CONFIG_DEBUG_ENTRY))
>  			WARN_ON_ONCE(!on_thread_stack());
> -		if (need_resched())
> +		if (need_resched() && arch_irqentry_exit_need_resched())
>  			preempt_schedule_irq();
>  	}
>  }
> -- 
> 2.34.1
> 

