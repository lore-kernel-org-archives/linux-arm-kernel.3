Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B2DC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FX+ulTvKeH2tAXgFdwWmsnpZnFKY2vdgZHf6u/RdTO0=; b=oS2m5PSy/YJSU5Oo7lwnWfpdYb
	LUN5T0EKiHUDKoKPHxRZpvTu+q+s3TsNTTyQyQOJ0GQAklPKytZWSw+9buMtZcQBgBvWfMWVqDBHa
	0zmcX29+6GS7+rpSx2a22DSkNdn/FYdcad2bh5B35/yAneJvEe2xF3t0QFM0XMkplkqfbxj4wJOoZ
	WJAMhHBrLtQUsHlc+XTD23WdZRPWdBA/EAh1nRkSVVawpS2pWKLclDTtICkk4yye6CJixsO1LaXxS
	UkuqB4t2vvPazv8o5ZMXgypRd4GwsUOyVDgIFRDu/mVKEQRPvnoLqtx8PhRaNtHGN+axWa3RlEZjK
	gFJpib3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50nJ-0000000Ggho-3kOr;
	Fri, 11 Sep 2026 12:55:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50n6-0000000Ggfx-0GzW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 12:55:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 810CA6020C;
	Fri, 11 Sep 2026 12:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 120F91F00899;
	Fri, 11 Sep 2026 12:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789131339;
	bh=FX+ulTvKeH2tAXgFdwWmsnpZnFKY2vdgZHf6u/RdTO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IvOQoMpe8ugrrsDfGxDB3ZN+qFB9IZHhrpJWFvvHshfskJ7ECBSQdNCUU/LvgE6Hb
	 +5XWXw+RLRs/M0Gai2Q1WZfX9Idmq9soTOd7CDz8K7UzsqQRchMRKCsQozrj+n3Msj
	 ayvsbSv+M0GDuySwdwyT7+QQFuB0TMk5P8r8ZsmwTa/GSn6RhUbXCsXzQdrnRzACiE
	 zuEIi8oYM80BZX5sfPYcwnxiJmaFQAVgSk36iFj4cFCMwESzZKN18x2XZn3+mAjPVO
	 UsKieGMEQbsbn8sHrYR4stmAEC0ElsHTjXW9A3AcZs8qpHRftJoNoJ+cyUZ5uI1AOY
	 sTl3fn4b1SiNw==
Date: Fri, 11 Sep 2026 13:55:34 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 11/19] arm64: smp: Use generic HOTPLUG_SPLIT_STARTUP
 machinery for CPU onlining
Message-ID: <aqP6Rjzk8XmGmQQp@willie-the-truck>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-12-will@kernel.org>
 <2f75098e-bc2c-4692-8325-809983042a9d@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f75098e-bc2c-4692-8325-809983042a9d@huawei.com>
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

On Tue, Sep 08, 2026 at 07:35:46PM +0800, Jinjie Ruan wrote:
> 
> 
> 在 2026/9/8 0:40, Will Deacon 写道:
> > In preparation for enabling parallel bringup of secondary CPUs on arm64,
> > take the baby step of moving from HOTPLUG_CORE_SYNC_FULL to
> > HOTPLUG_SPLIT_STARTUP.
> > 
> > Rework the cpu_die_early() path to use a private cpumask, otherwise
> > clearing the incoming CPU from the present mask in the 'kick' stage will
> > prevent the hotplug stage machine from progressing and
> > arch_cpuhp_cleanup_kick_cpu() will not be called.
> > 
> > Signed-off-by: Will Deacon <will@kernel.org>
> > ---
> >  arch/arm64/Kconfig           | 2 +-
> >  arch/arm64/include/asm/smp.h | 1 +
> >  arch/arm64/kernel/smp.c      | 9 +++++----
> >  3 files changed, 7 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 89d1f0f2269c..fd8cf792b7fd 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -230,7 +230,7 @@ config ARM64
> >  	select HAVE_SYSCALL_TRACEPOINTS
> >  	select HAVE_KPROBES
> >  	select HAVE_KRETPROBES
> > -	select HOTPLUG_CORE_SYNC_FULL
> > +	select HOTPLUG_SPLIT_STARTUP
> >  	select HOTPLUG_SMT if HOTPLUG_CPU
> >  	select IRQ_DOMAIN
> >  	select IRQ_FORCED_THREADING
> > diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
> > index fe343c30d620..7b986a6a765b 100644
> > --- a/arch/arm64/include/asm/smp.h
> > +++ b/arch/arm64/include/asm/smp.h
> > @@ -89,6 +89,7 @@ asmlinkage void secondary_start_kernel(void);
> >  struct secondary_data {
> >  	struct task_struct *task;
> >  	long status;
> > +	cpumask_t cpu_died_early_mask;
> >  };
> >  
> >  extern struct secondary_data secondary_data;
> > diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> > index 00362ed6e1ab..c5e9d5d5e003 100644
> > --- a/arch/arm64/kernel/smp.c
> > +++ b/arch/arm64/kernel/smp.c
> > @@ -62,7 +62,7 @@
> >   * so we need some other way of telling a new secondary core
> >   * where to place its SVC stack
> >   */
> > -struct secondary_data secondary_data;
> > +struct secondary_data secondary_data = {};
> >  /* Number of CPUs which aren't online, but looping in kernel text. */
> >  static int cpus_stuck_in_kernel;
> >  
> > @@ -108,7 +108,7 @@ static int boot_secondary(unsigned int cpu, struct task_struct *idle)
> >  	return -EOPNOTSUPP;
> >  }
> >  
> > -int __cpu_up(unsigned int cpu, struct task_struct *idle)
> > +int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
> >  {
> >  	int ret;
> >  
> > @@ -146,6 +146,8 @@ void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
> >  		cpus_stuck_in_kernel++;
> >  		break;
> >  	case CPU_KILL_ME:
> > +		if (cpumask_test_cpu(cpu, &secondary_data.cpu_died_early_mask))
> > +			set_cpu_present(cpu, false);
> 
> Should we set_cpu_present(cpu, false) in CPU_STUCK_IN_KERNEL case, as we
> do not update to CPU_KILL_ME but CPU_STUCK_IN_KERNEL if
> CONFIG_HOTPLUG_CPU is not enabled

That's where we get to at the end of the series, but I can hoist this
check on 'secondary_data.cpu_died_early_mask' above the switch here to
keep that behaviour for bisection.

Will

