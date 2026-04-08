Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D81EDB7D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 01:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PvSElQ9F6N61e9A+Vu863iWo7S0YL3P0ONBPIWk59gU=; b=WDYkASEXVDvAYT
	Tm4XEExkBwzZUJwEnBg4immCe6uCeWvAKGEaKIyCs+r2MxC0c9PsYSdeU3cV8JDxKTh0tG9m4l5Si
	AoMEv0hSBB+9lTZA5yYnAJr4GsVNRWydk4YAn8iiBM1lJgSGKzDzX67EQeCNVk7kkKWyOY3mrEloG
	TVP/N2FKWKE4aeVizomtzn/hpSntmLnhzwf22vqT0qDCZ5SKfFdK0ELs1dc5LfrFt3C7vEAYE4EeE
	j5XaoZOPhq8Dw0T6sbX7sJhaowwDrbGvq57pWffbK0ENj5uGy6OzqAXpSxYUvGXxxP7ik1Tw7qTHX
	dUEGGJV0EuHMPkVLozJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAHYn-000000084wo-2e3B;
	Wed, 08 Apr 2026 01:18:25 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAHYk-000000084wR-22Oa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 01:18:24 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=PvSElQ9F6N61e9A+Vu863iWo7S0YL3P0ONBPIWk59gU=;
	b=spzu24sgV5nEXYyIJUMT0O1SHqQRgvZut/iMKs68bU8znws+T09C9I5OEWj4Be8B1zrczBzI3
	4+N08/sIcSOjdsVBCZo18S970U0PxAZpmnuE7UBHl8y309eM8P3FSOngjqmcur/wILENddQOMaK
	jzsk1GMo0z2bejijyzhbhw0=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4fr4m248FLz1cyTg;
	Wed,  8 Apr 2026 09:12:02 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id A583240539;
	Wed,  8 Apr 2026 09:18:15 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 8 Apr 2026 09:18:14 +0800
Message-ID: <5171cf88-94bc-f7ec-f79a-d56ed01290ef@huawei.com>
Date: Wed, 8 Apr 2026 09:18:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 02/10] entry: Remove
 local_irq_{enable,disable}_exit_to_user()
Content-Language: en-US
To: Mark Rutland <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
 <20260407131650.3813777-3-mark.rutland@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260407131650.3813777-3-mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_181822_876382_90C7D62F 
X-CRM114-Status: GOOD (  19.45  )
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
Cc: vladimir.murzin@arm.com, will@kernel.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2026/4/7 21:16, Mark Rutland wrote:
> The local_irq_enable_exit_to_user() and local_irq_disable_exit_to_user()
> functions are never overridden by architecture code, and are always
> equivalent to local_irq_enable() and local_irq_disable().
> 
> These functions were added on the assumption that arm64 would override
> them to manage 'DAIF' exception masking, as described by Thomas Gleixner
> in these threads:
> 
>   https://lore.kernel.org/all/20190919150809.340471236@linutronix.de/
>   https://lore.kernel.org/all/alpine.DEB.2.21.1910240119090.1852@nanos.tec.linutronix.de/
> 
> In practice arm64 did not need to override either. Prior to moving to
> the generic irqentry code, arm64's management of DAIF was reworked in
> commit:
> 
>   97d935faacde ("arm64: Unmask Debug + SError in do_notify_resume()")
> 
> Since that commit, arm64 only masks interrupts during the 'prepare' step
> when returning to user mode, and masks other DAIF exceptions later.
> Within arm64_exit_to_user_mode(), the arm64 entry code is as follows:
> 
> 	local_irq_disable();
> 	exit_to_user_mode_prepare_legacy(regs);
> 	local_daif_mask();
> 	mte_check_tfsr_exit();
> 	exit_to_user_mode();
> 
> Remove the unnecessary local_irq_enable_exit_to_user() and
> local_irq_disable_exit_to_user() functions.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> ---
>  include/linux/entry-common.h     |  2 +-
>  include/linux/irq-entry-common.h | 31 -------------------------------
>  kernel/entry/common.c            |  4 ++--
>  3 files changed, 3 insertions(+), 34 deletions(-)

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> 
> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
> index f83ca0abf2cdb..dbaa153100f44 100644
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -321,7 +321,7 @@ static __always_inline void syscall_exit_to_user_mode(struct pt_regs *regs)
>  {
>  	instrumentation_begin();
>  	syscall_exit_to_user_mode_work(regs);
> -	local_irq_disable_exit_to_user();
> +	local_irq_disable();
>  	syscall_exit_to_user_mode_prepare(regs);
>  	instrumentation_end();
>  	exit_to_user_mode();
> diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
> index 3cf4d21168ba1..93b4b551f7ae4 100644
> --- a/include/linux/irq-entry-common.h
> +++ b/include/linux/irq-entry-common.h
> @@ -100,37 +100,6 @@ static __always_inline void enter_from_user_mode(struct pt_regs *regs)
>  	instrumentation_end();
>  }
>  
> -/**
> - * local_irq_enable_exit_to_user - Exit to user variant of local_irq_enable()
> - * @ti_work:	Cached TIF flags gathered with interrupts disabled
> - *
> - * Defaults to local_irq_enable(). Can be supplied by architecture specific
> - * code.
> - */
> -static inline void local_irq_enable_exit_to_user(unsigned long ti_work);
> -
> -#ifndef local_irq_enable_exit_to_user
> -static __always_inline void local_irq_enable_exit_to_user(unsigned long ti_work)
> -{
> -	local_irq_enable();
> -}
> -#endif
> -
> -/**
> - * local_irq_disable_exit_to_user - Exit to user variant of local_irq_disable()
> - *
> - * Defaults to local_irq_disable(). Can be supplied by architecture specific
> - * code.
> - */
> -static inline void local_irq_disable_exit_to_user(void);
> -
> -#ifndef local_irq_disable_exit_to_user
> -static __always_inline void local_irq_disable_exit_to_user(void)
> -{
> -	local_irq_disable();
> -}
> -#endif
> -
>  /**
>   * arch_exit_to_user_mode_work - Architecture specific TIF work for exit
>   *				 to user mode.
> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> index 9ef63e4147913..b5e05d87ba391 100644
> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c
> @@ -47,7 +47,7 @@ static __always_inline unsigned long __exit_to_user_mode_loop(struct pt_regs *re
>  	 */
>  	while (ti_work & EXIT_TO_USER_MODE_WORK_LOOP) {
>  
> -		local_irq_enable_exit_to_user(ti_work);
> +		local_irq_enable();
>  
>  		if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
>  			if (!rseq_grant_slice_extension(ti_work & TIF_SLICE_EXT_DENY))
> @@ -74,7 +74,7 @@ static __always_inline unsigned long __exit_to_user_mode_loop(struct pt_regs *re
>  		 * might have changed while interrupts and preemption was
>  		 * enabled above.
>  		 */
> -		local_irq_disable_exit_to_user();
> +		local_irq_disable();
>  
>  		/* Check if any of the above work has queued a deferred wakeup */
>  		tick_nohz_user_enter_prepare();

