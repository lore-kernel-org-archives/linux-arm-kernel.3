Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BDCC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 04:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1UTSXGSQkkvgkrqYy9bvZK/+3gHrgJ5ygCju4XwVTg=; b=XoIIa/66A43ajbm9fOl4L458zI
	B/hJGXryhVIV+NNlNx7IQvG8hNdDT57hvQxvbNqgIRemkgxlwp1F9PudzUL5vZpsJE2acMgzI3a+Z
	pUCqEqkxTMIwaa7j0VmUJ77xwxpGGZWbjzT64/Dcxu5bsOzLTI4CrJFG/MZimUg+REP9rnYqxR0V6
	pQs6Pi72AkhvGau7wQj7DzoCqJwYCConcjlyzMOoWBOLGIMyEf93Y2oHkxfr6tLlS7QW/S8d6t+Nz
	ugFDlfC/oEUzuGCON7WasGmVbkLZ5JV31km4VwLe3giRgvxY+YZI5E/e9ugcx8x6HGoY72EC+XAoh
	/p2RXyeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3n0I-000000080HJ-3Xze;
	Tue, 08 Sep 2026 04:00:14 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3n0F-000000080Gr-1IfW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 04:00:13 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=d1UTSXGSQkkvgkrqYy9bvZK/+3gHrgJ5ygCju4XwVTg=;
	b=mchR9rE2nyqD1cIlEWA9dMP6ivzol7DreZVvnwQZqpOLftIlidfw9ttxQTJoMno9RoWwG+xI2
	pv0uE7+l2byS8sk7aSoLqYNRT4ztah/riAGlbDZ4qEBxK2C76J7ZrybIKd5ZsmC72N7+yT7mspj
	S6YnIBW1dSuGNVbfrgoX3Dg=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hf90g6P19z1prM0;
	Tue,  8 Sep 2026 11:49:07 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 0E41440537;
	Tue,  8 Sep 2026 12:00:03 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 12:00:02 +0800
Message-ID: <90935a12-a728-4c73-a538-06752b783210@huawei.com>
Date: Tue, 8 Sep 2026 12:00:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/19] cpu/hotplug: Avoid busy-polling on archs where
 cpu_relax() is a no-op
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-4-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-4-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_210012_201958_B92904B1 
X-CRM114-Status: GOOD (  22.76  )
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



在 2026/9/8 0:40, Will Deacon 写道:
> On some architectures (such as arm64), cpu_relax() is effectively a NOP
> and so isn't particularly efficient when used in a tight polling loop

Yes, a "yield" instruction in aarch64 is essentially a nop, with no
power optimization effect.

However, x86 "PAUSE" provides power optimization benefits.

> such as the CPU state synchronisation in cpuhp_wait_for_sync_state().
> 
> Once an incoming CPU has reached the SYNC_STATE_ALIVE state, we know
> that it is executing within the kernel and so we can use the more
> efficient polling mechanism provided by the atomic_cond_read* API.

Right! Once the secondary CPU state transitions to SYNC_STATE_ALIVE, it
is already executing kernel C code.

> 
> Extend the generic implementation of arch_cpuhp_sync_state_poll() to
> take the state details as additional parameters and polling using
> atomic_cond_read_relaxed() instead of cpu_relax() once we have reached
> the alive state. No change on x86.

Right! x86 still use cpu_relax() for atomic_cond_read_relaxed().

And we can aslo mention that this also allow RISC-V to leverage the
Zawrs extension for low-power stalling instead of busy-wasting cycles
with cpu_relax().

> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/x86/kernel/smpboot.c  |  2 +-
>  include/linux/cpuhotplug.h |  2 +-
>  kernel/cpu.c               | 13 +++++++++----
>  3 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index ba01a9e919b7..362f85cbdbaf 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -1138,7 +1138,7 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
>  		pr_info("CPU %u is now offline\n", cpu);
>  }
>  
> -void arch_cpuhp_sync_state_poll(void)
> +void arch_cpuhp_sync_state_poll(atomic_t *st, int old)
>  {
>  	if (smp_ops.poll_sync_state)
>  		smp_ops.poll_sync_state();
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index feb32949aeea..bbcee650155f 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -509,7 +509,7 @@ static inline void cpuhp_online_idle(enum cpuhp_state state) { }
>  struct task_struct;
>  
>  void cpuhp_ap_sync_alive(void);
> -void arch_cpuhp_sync_state_poll(void);
> +void arch_cpuhp_sync_state_poll(atomic_t *st, int old);
>  void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu);
>  int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle);
>  bool arch_cpuhp_init_parallel_bringup(void);
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index 97a9bfe4edad..d9fe204f02cb 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -303,7 +303,13 @@ static inline void cpuhp_ap_update_sync_state(enum cpuhp_sync_state state)
>  	(void)atomic_xchg(st, state);
>  }
>  
> -void __weak arch_cpuhp_sync_state_poll(void) { cpu_relax(); }
> +void __weak arch_cpuhp_sync_state_poll(atomic_t *st, int old)
> +{
> +	if (old < SYNC_STATE_ALIVE)
> +		cpu_relax();
> +	else
> +		atomic_cond_read_relaxed(st, VAL != old);
> +}

With atomic_cond_read_relaxed(), we can use WFE to improve the power for
arm64.

>  
>  static bool cpuhp_wait_for_sync_state(unsigned int cpu, enum cpuhp_sync_state state,
>  				      enum cpuhp_sync_state next_state)
> @@ -328,7 +334,7 @@ static bool cpuhp_wait_for_sync_state(unsigned int cpu, enum cpuhp_sync_state st
>  			return false;
>  		} else if (now - start < NSEC_PER_MSEC) {
>  			/* Poll for one millisecond */
> -			arch_cpuhp_sync_state_poll();
> +			arch_cpuhp_sync_state_poll(st, sync);
>  		} else {
>  			usleep_range(USEC_PER_MSEC, 2 * USEC_PER_MSEC);
>  		}
> @@ -395,8 +401,7 @@ void cpuhp_ap_sync_alive(void)
>  	cpuhp_ap_update_sync_state(SYNC_STATE_ALIVE);
>  
>  	/* Wait for the control CPU to release it. */
> -	while (atomic_read(st) != SYNC_STATE_SHOULD_ONLINE)
> -		cpu_relax();
> +	atomic_cond_read_acquire(st, VAL == SYNC_STATE_SHOULD_ONLINE);

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  }
>  
>  static bool cpuhp_can_boot_ap(unsigned int cpu)


