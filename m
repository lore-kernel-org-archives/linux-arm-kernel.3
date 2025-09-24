Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F8FCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 11:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVeEbXZHLLVdgtkq3Rt5skmTBi/qzB86iEFJYe7MbOY=; b=hy9JYsF36Oviz+srPfImyjRO19
	CJqR2tNFE+MCTYEzN4EKOrVLeJZP85Iiq4kzP9ofjxEutCgzqx0PoLabiMO9/IGTEYlH0UVkNe6Fm
	Kv/bKEaFSkW5H3ys5YQg7UhxQOORadYkuMQCRgdE1MwapvT1mmCUpGjFVqTqvk/M9E0wyKZEA+HFg
	oqQw7Ms+R15cW0Qczg0JlEe31zW4cw1nXjMyCl0ImrwbvrpnaoC4ao2CaFfcLwOgMdpJ82k7/pY60
	gWINZmIhXkPqIp9ALw5N1QZb/4jd/WiLE9aKdtCzTw63Bxt7FdhCobVcZQdj10cPlq9FddBuuOTwe
	d9lDPuIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1O9z-0000000HAEa-3szD;
	Wed, 24 Sep 2025 11:59:47 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1O9w-0000000HAAT-1r3b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 11:59:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1758715184; x=1790251184;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=GVeEbXZHLLVdgtkq3Rt5skmTBi/qzB86iEFJYe7MbOY=;
  b=JYX17GFJ/nrCmMemfao7zf+yrYc1YeDHWswf7Isie7W0HjZxrMB29MqC
   I/2nyNmbGtvjjmN+0cH+x9tCKNRow8wmfxQT6xjWZQGsIm/NamFYr1URj
   oBO2aYlAU06qlhSVtv+ajgFj9F7FGZ18cYQHrN31K33UWpqUv8M59+ZAv
   HCKK380cdwolYsuUB1FJKIgrxah4QUtTp8EVKOgRsppPNq5Roumar1jIv
   wZSroZVN79LparrPGgHXWzbay5eoYmlM9pnJvcKEnRibIva3Nz+bE73qE
   Gx6mQm5jaccatGplxLiUXv13NpbDA8ATgMHo+MREIey1kUh6lXTtB3jCP
   Q==;
X-CSE-ConnectionGUID: SEZAPg5SSv+Xkd0I3Bz+rQ==
X-CSE-MsgGUID: eazkGnp5TNGYZVKNdD1K2Q==
X-IronPort-AV: E=Sophos;i="6.18,290,1751234400"; 
   d="scan'208";a="46192635"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Sep 2025 13:59:39 +0200
X-CheckPoint: {68D3DD2B-5-690ADD0E-C022EA8D}
X-MAIL-CPID: EA6A543783A22A079A34EFAE6113B43F_3
X-Control-Analysis: str=0001.0A2D0325.68D3DD2B.0075,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DAD11611D7;
	Wed, 24 Sep 2025 13:59:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1758715174;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GVeEbXZHLLVdgtkq3Rt5skmTBi/qzB86iEFJYe7MbOY=;
	b=MiszbaIwL75n4NinMTq+BtlT448qY1P4vjFdNNNxGvnFo5VbY/XtEhFJx57K1X2drvQ8Wy
	eFHuNGbe+zA4jYso57yNiZDcPKjj30UANNnydpV8lMLt57Qz+2EdIANvQtyZDigrVlQRP2
	ThjtrAKGiMQhwQsXr6tTKoFhNeEKosH0CIqKc413ZDZQT3PRPlHH5KPEvWtCg7lyokJQMr
	Aey54GL7SRvgoJW7b44SH158DUntQm3nCjEN3ztKX8uwwlMUPP9tRmr9yFey34nuOXa2wm
	hRE4qUWIuBCM5kLf0QgnbQukWDG7pgJpaA8scFRKpdpXB/ChxnDRiWOQdBDXMQ==
Message-ID: <e347ec137033975423c262bc4dce1132e1de04fe.camel@ew.tq-group.com>
Subject: Re: [PATCH v6 1/2] arm64: entry: Skip single stepping into
 interrupt handlers
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, dianders@chromium.org,
  liwei391@huawei.com, mhiramat@kernel.org, maz@kernel.org, ardb@kernel.org,
  linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 will@kernel.org, catalin.marinas@arm.com, linux@ew.tq-group.com
Date: Wed, 24 Sep 2025 13:59:32 +0200
In-Reply-To: <20230202073148.657746-2-sumit.garg@linaro.org>
References: <20230202073148.657746-1-sumit.garg@linaro.org>
	 <20230202073148.657746-2-sumit.garg@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_045944_832961_36DEAC31 
X-CRM114-Status: GOOD (  25.36  )
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

On Thu, 2023-02-02 at 13:01 +0530, Sumit Garg wrote:
> Currently on systems where the timer interrupt (or any other
> fast-at-human-scale periodic interrupt) is active then it is impossible
> to step any code with interrupts unlocked because we will always end up
> stepping into the timer interrupt instead of stepping the user code.
>=20
> The common user's goal while single stepping is that when they step then
> the system will stop at PC+4 or PC+I for a branch that gets taken
> relative to the instruction they are stepping. So, fix broken single step
> implementation via skipping single stepping into interrupt handlers.
>=20
> The methodology is when we receive an interrupt from EL1, check if we
> are single stepping (pstate.SS). If yes then we save MDSCR_EL1.SS and
> clear the register bit if it was set. Then unmask only D and leave I set.
> On return from the interrupt, set D and restore MDSCR_EL1.SS. Along with
> this skip reschedule if we were stepping.
>=20
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> Tested-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> Tested-by: Daniel Thompson <daniel.thompson@linaro.org>

Hi Sumit,

I was wondering what the status of this patch is. [1] sounds like there wer=
e
remaining concerns, but I'm not sure about the details.

The current state is very unsatisfactory, as I need to apply this patch eve=
ry
time I want to use KGDB on arm64. It is not only required for single-steppi=
ng,
but it also fixes 'continue' endlessly hitting the same breakpoint (until t=
he
breakpoint is deleted or disabled).

Best,
Matthias


[1] https://lkml.org/lkml/2023/2/22/49

> ---
>  arch/arm64/kernel/entry-common.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-c=
ommon.c
> index cce1167199e3..568481f66977 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -231,11 +231,15 @@ DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_con=
d_resched);
>  #define need_irq_preemption()	(IS_ENABLED(CONFIG_PREEMPTION))
>  #endif
> =20
> -static void __sched arm64_preempt_schedule_irq(void)
> +static void __sched arm64_preempt_schedule_irq(struct pt_regs *regs)
>  {
>  	if (!need_irq_preemption())
>  		return;
> =20
> +	/* Don't reschedule in case we are single stepping */
> +	if (regs->pstate & DBG_SPSR_SS)
> +		return;
> +
>  	/*
>  	 * Note: thread_info::preempt_count includes both thread_info::count
>  	 * and thread_info::need_resched, and is not equivalent to
> @@ -471,19 +475,33 @@ static __always_inline void __el1_irq(struct pt_reg=
s *regs,
>  	do_interrupt_handler(regs, handler);
>  	irq_exit_rcu();
> =20
> -	arm64_preempt_schedule_irq();
> +	arm64_preempt_schedule_irq(regs);
> =20
>  	exit_to_kernel_mode(regs);
>  }
> +
>  static void noinstr el1_interrupt(struct pt_regs *regs,
>  				  void (*handler)(struct pt_regs *))
>  {
> +	unsigned long mdscr;
> +
> +	/* Disable single stepping within interrupt handler */
> +	if (regs->pstate & DBG_SPSR_SS) {
> +		mdscr =3D read_sysreg(mdscr_el1);
> +		write_sysreg(mdscr & ~DBG_MDSCR_SS, mdscr_el1);
> +	}
> +
>  	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
> =20
>  	if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && !interrupts_enabled(regs))
>  		__el1_pnmi(regs, handler);
>  	else
>  		__el1_irq(regs, handler);
> +
> +	if (regs->pstate & DBG_SPSR_SS) {
> +		write_sysreg(DAIF_PROCCTX_NOIRQ | PSR_D_BIT, daif);
> +		write_sysreg(mdscr, mdscr_el1);
> +	}
>  }
> =20
>  asmlinkage void noinstr el1h_64_irq_handler(struct pt_regs *regs)

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

