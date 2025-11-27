Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0435D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 14:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NGhO3m20hNBLQgRoRe5aCNIWN6lSYGzFhhL4/I6i0M=; b=rvAU5RwN08PI4eNLytxNmLqm0m
	n5aTU37LW9EKL50h7qY175ySkGMZq4e8FH8k+ZZpVWSqMoUTK+R2SRU42DzRhYYoQZIYkseYW3VpH
	r6ldrC9CjtLMxnAqEvJnVD+5bqDUOsjhZSmM3WqGcw/7Ss4cuFy/zBbiqsZOoEQUbwjGLKkxn2YQV
	gmBIDDK4KLQkxBKbt81Za1FmcupQUf1QBjCsNRE0i+/f1SuXxCoVn2HjB5Y0fV9DKEIxDd2mMjHwZ
	to+uwaYrCnybFZ6JE4J3niiztj9sP0FZ44AgB574HwPWiCMo14k6oSkVfvMaE1XdGyvaOLg6fy9We
	RsgpmjXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOdJA-0000000Go3u-11TC;
	Thu, 27 Nov 2025 14:49:20 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOdJ8-0000000Go3S-0Heq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 14:49:19 +0000
Date: Thu, 27 Nov 2025 15:49:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764254955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7NGhO3m20hNBLQgRoRe5aCNIWN6lSYGzFhhL4/I6i0M=;
	b=Pliw/Hg2CT43fdJgplojXUFqZWA2AK9IGFihMdPAPz54Y8g0mjc85DdYd2Uo6AllcFjoiT
	9VFWW866CG15H8AZg/JOkeXYUoDhKfKcxkPBufmmf31b+Tni2xhvwJ6vE14mXJrqCOEcP0
	d+Jt8lZF5hv5n1mjHJ0kkReygCl30hEonK/PRRaU104CqK4tSZLtYY/ytzUKnDDAFYM56t
	nSDG11BcPSSmZC+LG4P3Ucp1u/pEVab4lb9MPVaD/bferdR2FOke+brgUytotq5Sev6xIe
	1uaZtYHsYuGKahn5mbDONskt7U1CBXWwRR4AMWm1Cw9C0rCqvWuWOYljP/axIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764254955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7NGhO3m20hNBLQgRoRe5aCNIWN6lSYGzFhhL4/I6i0M=;
	b=tk/qR6wXFEg1BUpfHcBHWK5zjR3/ybtkL+SBbbbMbUDbtuwWcXISYr74nD3EOKGwFa5B+2
	Kr1OcIdXS+VWX2CQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: viro@zeniv.linux.org.uk, will@kernel.org, nico@fluxnic.net,
	rmk+kernel@armlinux.org.uk, linux@armlinux.org.uk,
	david.laight@runbox.com, rppt@kernel.org, vbabka@suse.cz,
	pfalcato@suse.de, brauner@kernel.org, lorenzo.stoakes@oracle.com,
	kuninori.morimoto.gx@renesas.com, tony@atomide.com, arnd@arndb.de,
	akpm@linux-foundation.org, punitagrawal@gmail.com, hch@lst.de,
	jack@suse.com, rjw@rjwysocki.net, marc.zyngier@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	wozizhi@huaweicloud.com, liaohua4@huawei.com, lilinjie8@huawei.com,
	pangliyuan1@huawei.com, wangkefeng.wang@huawei.com
Subject: Re: [RFC PATCH v2 2/2] ARM/mm/fault: Enable interrupts before
 sending signal
Message-ID: <20251127144913.arc7keYZ@linutronix.de>
References: <20251127140109.191657-1-xieyuanbin1@huawei.com>
 <20251127140109.191657-2-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251127140109.191657-2-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_064918_272304_0A1BB6F1 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
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

On 2025-11-27 22:01:09 [+0800], Xie Yuanbin wrote:
> --- a/arch/arm/mm/fault.c
> +++ b/arch/arm/mm/fault.c
> @@ -184,10 +184,13 @@ __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,
>  	struct task_struct *tsk = current;
>  
>  	if (addr > TASK_SIZE)
>  		harden_branch_predictor();
>  
> +	if (IS_ENABLED(CONFIG_PREEMPT_RT))
> +		local_irq_enable();

This shouldn't be limited to CONFIG_PREEMPT_RT. There is nothing wrong
with enabling it unconditionally.

>  #ifdef CONFIG_DEBUG_USER
>  	if (((user_debug & UDBG_SEGV) && (sig == SIGSEGV)) ||
>  	    ((user_debug & UDBG_BUS)  && (sig == SIGBUS))) {
>  		pr_err("8<--- cut here ---\n");
>  		pr_err("%s: unhandled page fault (%d) at 0x%08lx, code 0x%03x\n",

Sebastian

