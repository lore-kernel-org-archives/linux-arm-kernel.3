Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90F6C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 10:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wdl8c7M+tt14LjT7PIQXzPVgW6VzTHh7LoJtKwYpFJI=; b=1AD1vl1kWuFvdRoUz0ul5InI3F
	KStxsk3/uY3QqJeNk8cjNLMY8Nv3nG9c/wlyytcIQsm3CuROlbX+0B77MZKCr/t6EQKqj1kcmBvh4
	MSYN0g2oc10ulzTwQBT5Pqq0FxlNvJjYF+rO1j3WtzdZNdIr1PsasFsMtIM/9M1aOftFnCEErsE96
	lfdk5883BxTmSMhm6IJAsBIhvd6QVR2+SS0xb+2bBtdC2Utl28JY4Wp3Vw2x2cAGHqKFDnsIOpS7b
	MnOdx9wIGWmdrOMItq/rGF75M8zhGP+hgyGeXrv13G9Z1vcRwKarycdoaulYYXM6cjsMXzd/QlyCz
	tpyhjlFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3svn-00000008kZf-2XmY;
	Tue, 08 Sep 2026 10:19:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3svl-00000008kZQ-3QgU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 10:19:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 44164601DB;
	Tue,  8 Sep 2026 10:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDD31F00A3A;
	Tue,  8 Sep 2026 10:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788862797;
	bh=Wdl8c7M+tt14LjT7PIQXzPVgW6VzTHh7LoJtKwYpFJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VmsMtaEGtzt6PqruW8ixtkXnoOgjbEhTG3VYEP2wCc/2E9HpPHq2Pu/JI80gPN15R
	 /E/+J0RtCiZJZ6SuI03fsy1zJDXCO05pXgbXSBPF39TDkHs4BD+YQu3WxslJMbptBC
	 NZsINOo2eYQ6TV9iYFPFQCsJM2KSaN+4hwHwjA5JzEFYzldVgw5mE2KdT0Qrohrjwx
	 EemTmLTPUPBKCnHpsAKR9gxevstes22h/dhm5UqddCIvFtdcULq1JrItj3ApXl+IFJ
	 K5hdDbp9tOp3d7IrEI7vDTQUgMxaKC0XYoZDeYZVIOjiBucTmCjjZiP/AIxOliu6VA
	 DWJyC1mbvVGdw==
Date: Tue, 8 Sep 2026 11:19:51 +0100
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
Subject: Re: [PATCH 09/19] arm64: smp: Defer RCU registration during
 secondary CPU bringup
Message-ID: <ap_hR1mntzm-TZOP@willie-the-truck>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-10-will@kernel.org>
 <45c37592-f05d-4b1c-812b-0cb38d1c3e24@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45c37592-f05d-4b1c-812b-0cb38d1c3e24@huawei.com>
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

Hi Jinjie,

On Tue, Sep 08, 2026 at 04:55:36PM +0800, Jinjie Ruan wrote:
> 在 2026/9/8 0:40, Will Deacon 写道:
> > Calling rcutree_report_cpu_starting() early during boot can lead to
> > livelocks with the generic CPU hotplug mechanism if the boot CPU blocks
> > on an RCU grace period while the CPU being onlined is spinning in
> > cpuhp_ap_sync_alive().
> > 
> > In preparation for enabling the generic CPU hotplug code on arm64, split
> > up the trace_hardirqs_off() call during secondary CPU bringup so that we
> > update lockdep early but defer the tracing updates until after
> > notify_cpu_starting() has registered the new CPU with RCU, allowing us
> > to drop the explicit call to rcutree_report_cpu_starting() entirely.
> > 
> > Signed-off-by: Will Deacon <will@kernel.org>
> > ---
> >  arch/arm64/kernel/smp.c | 5 ++---
> >  include/linux/rcutree.h | 2 +-
> >  2 files changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> > index f4cabf9e19e6..ff68640d0c0b 100644
> > --- a/arch/arm64/kernel/smp.c
> > +++ b/arch/arm64/kernel/smp.c
> > @@ -217,8 +217,7 @@ asmlinkage notrace void secondary_start_kernel(void)
> >  	if (system_uses_irq_prio_masking())
> >  		init_gic_priority_masking();
> >  
> > -	rcutree_report_cpu_starting(cpu);
> > -	trace_hardirqs_off();
> 
> I think we need to handle the printk problem before this patch as we
> discussed earlier.
> 
> Otherwise defer the rcutree_report_cpu_starting() will trigger a
> false-positive lockdep"suspicious RCU usage" splat during early lock
> acquisitions as commit ce3d31ad3cac ("arm64/smp: Move
> rcu_cpu_starting() earlier") pointed out.

Sorry, I meant to mention this in the cover letter but forgot about it.
I'm not sure that ce3d31ad3cac ("arm64/smp: Move rcu_cpu_starting()
earlier") is still relevant with the latest printk/console/lockdep code.
I tried quite hard to trigger lockdep splats manually, but the only way
I could do it was by using the "%pS" specifier to print the name of a
symbol in a module, which would cause an RCU walk of the module symbols
in the kallsyms code! Manually calling WARN() or even rcu_read_lock() /
spin_lock() did _not_ trigger a splat.

Since that's not something I think we should be doing this early, I
decided to leave the code as-is unless I have a way to trigger a lockdep
splat with the relatively simple prints we have on the early error paths.

Will

