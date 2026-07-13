Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B942BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5G36xUDp/+xo7FopLJggCV+27wqN3Xdv6c2yGCmeMo=; b=SYLbQggsNlwGTcGa7gn22KRX0B
	lYYrnMc27gd/flVLPXwMs4TLI9Fnub6p76itlGcdPGcOtonxU77HtT3dYDYZkZNvsGHluPh+w7R9g
	A14kU5bWmwlJIEDuX/uHF9bsu+RrtEpPWN0J7LMYxBo7SEkDpjNcCDhc9WIo7w1ieMbsde/KeYFoQ
	6/rThIoUYmxJ6r9Im/oJwq1bHNS4TO7lowRzdvvgh0EjfXqOyffd7D0Lw1ZfH9Ri2Mtv+21ZdRWYK
	CGewZvRXr3u3GNzkqMfjTUPDpu6KnoZ4b+qZM76IcnOpIfkh702ZhuO1U2duH23ELZ+OpdnKHBT1b
	KBxAgzog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFgC-00000009BaY-3NC4;
	Mon, 13 Jul 2026 12:22:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFgA-00000009BZP-0LvO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:22:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A04071576;
	Mon, 13 Jul 2026 05:22:26 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEBF23F93E;
	Mon, 13 Jul 2026 05:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783945350; bh=4F779BI8cPAbpp/NjYy8NZd52ZbIYTATOk1EJiL4h4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hI1FXH9CotPrXE3rIVmdPaCwjxxGA7e/y9qehSCV0KZ78mQkyLxOsspsK/2cy6efD
	 Gam6BGO7RKe5Xs6ZGiXGLfoKJGR5c+5pAAwaYOL9XWHVfVOewiRWPpFOT8J6mQy0YG
	 ogSWQgRrEw7XWdIhmpdxDqBtpeSNd1s9U39ndi+U=
Date: Mon, 13 Jul 2026 13:22:24 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, leo.bras@arm.com,
	leitao@debian.org, julien.thierry.kdev@gmail.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: irqflags: Fix Pseudo-NMI state assertion failure
 during vpanic
Message-ID: <alTYgMwLaG5sk-P4@J2N7QTR9R3.cambridge.arm.com>
References: <20260713114459.833504-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713114459.833504-1-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_052234_212905_F33A89AE 
X-CRM114-Status: GOOD (  25.65  )
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

Jinjie,

Given this will obviously conflict with the NMI rework, and given that
you know that Vladimir and I are working in this area, you should CC us
on changes in this area so as to not fragment work.

On Mon, Jul 13, 2026 at 07:44:59PM +0800, Jinjie Ruan wrote:
> When CONFIG_ARM64_DEBUG_PRIORITY_MASKING is enabled, triggering an LKDTM
> HARDLOCKUP induces a warning at __pmr_local_irq_disable() inside
> vpanic().

Clearly this has never been tested before. What drove you to test this
specifically?

> This occurs because a Pseudo-NMI interrupts the locked-up CPU and updates
> ICC_PMR_EL1 to a transient composite state:
> 	GIC_PRIO_IRQON | GICV3_PRIO_PSR_I_SET (0xf0).
> 
> Then, vpanic() unconditionally calls local_irq_disable(), triggering
> the strict assertion which only expects pure IRQON or IRQOFF.

Is there any non-panic code which could run in this context and call
local_irq_disable()?

If not, I suspect it would be best to leave this as-is, and let it be
fixed by that rework. There are tonnes of other secondary warnings that
can be triggered by LKDTM tests, and I don't think this is very
important.

> Fix this by expanding the debugging whitelist in __pmr_local_irq_disable()
> to explicitly permit this valid Pseudo-NMI context flag where DAIF.IF is
> set to prevent NMI nesting.

Hmm... that'll silently miss cases where we're in this state and call:

	local_irq_disable();
	...
	local_irq_enable()

... where local_irq_enable() *cannot* work correctly, and will restore
the wrong state.

If we have anything of that shape, then we need more significant changes
here.

Mark.

> 
> 	# echo HARDLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT
> 	lkdtm: Performing direct entry HARDLOCKUP
> 	watchdog: CPU3: Watchdog detected hard LOCKUP on cpu 3
> 	...
> 
> 	CPU: 3 UID: 0 PID: 219 Comm: sh Not tainted 7.2.0-rc1 #341 PREEMPT
> 	Hardware name: linux,dummy-virt (DT)
> 	pstate: 00002005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> 	pc : lkdtm_HARDLOCKUP+0x64/0x78
> 	lr : lkdtm_HARDLOCKUP+0x64/0x78
> 	sp : ffffffc080b33ac0
> 	pmr: 000000c0
> 	x29: ffffffc080b33ac0 x28: ffffff80c3d61ac0 x27: 0000000000000000
> 	x26: 0000000000000000 x25: ffffff80c0f24800 x24: ffffff80c05495f0
> 	x23: ffffffc080b33c30 x22: ffffffc080b33c30 x21: ffffffed82f60bb0
> 	x20: 000000000000000b x19: ffffff80c339d000 x18: 0000000000000001
> 	x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000028
> 	x14: 0000000000000000 x13: 0000000000008000 x12: 0000000000000161
> 	x11: ffffffed837fb000 x10: 0000000000000000 x9 : 0000000000000001
> 	x8 : ffffffc080b339c8 x7 : ffffffc080b33ab0 x6 : ffffffc080b33a40
> 	x5 : ffffffc080b33a28 x4 : ffffffc080b34000 x3 : 0000000000000000
> 	x2 : 0000000100000000 x1 : 0000000100000000 x0 : 0000000000000001
> 	Call trace:
> 	 lkdtm_HARDLOCKUP+0x64/0x78 (P)
> 	 lkdtm_do_action+0x1c/0x38
> 	 direct_entry+0xd0/0x164
> 	 full_proxy_write+0x6c/0xa8
> 	 vfs_write+0xd0/0x354
> 	 ksys_write+0x68/0xfc
> 	 __arm64_sys_write+0x1c/0x28
> 	 invoke_syscall+0x9c/0x10c
> 	 el0_svc_common.constprop.0+0x40/0xe8
> 	 do_el0_svc+0x20/0x2c
> 	 el0_svc+0x5c/0x44c
> 	 el0t_64_sync_handler+0xa0/0xe4
> 	 el0t_64_sync+0x1ac/0x1b0
> 	Sending NMI from CPU 3 to CPUs 0-2,4-7:
> 	...
> 	------------[ cut here ]------------
> 	WARNING: arch/arm64/include/asm/irqflags.h:63 at vpanic+0x3a8/0x574, CPU#3: sh/219
> 	Modules linked in:
> 	CPU: 3 UID: 0 PID: 219 Comm: sh Not tainted 7.2.0-rc1 #341 PREEMPT
> 	Hardware name: linux,dummy-virt (DT)
> 	pstate: 200020c5 (nzCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> 	pc : vpanic+0x3a8/0x574
> 	lr : do_panic_on_target_cpu+0x0/0x1c
> 	sp : ffffffc08001bb10
> 	pmr: 000000f0
> 	x29: ffffffc08001bb10 x28: 00000000000000f0 x27: 0000000000000003
> 	x26: 0000000000000000 x25: ffffffed82b902f0 x24: ffffffed81cbba08
> 	x23: ffffffed830e2000 x22: ffffffed830e21a0 x21: ffffffc08001bbc0
> 	x20: ffffffed82b94078 x19: ffffffed8225fff8 x18: 00000000ffffffff
> 	x17: 666f735f6f645f5f x16: 205d3e3832353031 x15: ffffffed83b5bf3b
> 	x14: 0000000000000001 x13: ffffffed82bba668 x12: 0000000000000188
> 	x11: 0000000000000498 x10: ffffffed82c2a650 x9 : 0000000100110001
> 	x8 : ffffff80c3d61ac0 x7 : 0000000000000001 x6 : ffffffed81cbaca8
> 	x5 : ffffffc080b33980 x4 : ffffffc08001bc50 x3 : 0000000000000001
> 	x2 : ffffffed82b8f000 x1 : 00000000000000d0 x0 : 0000000000000001
> 	Call trace:
> 	 vpanic+0x3a8/0x574 (P)
> 	 do_panic_on_target_cpu+0x0/0x1c
> 	 add_taint+0x0/0xbc
> 	 watchdog_hardlockup_check+0x32c/0x3f8
> 	 watchdog_overflow_callback+0x34/0x44
> 	 __perf_event_overflow+0xfc/0x4ec
> 	 perf_event_overflow+0x30/0xf4
> 	 armv8pmu_handle_irq+0x114/0x1fc
> 	 armpmu_dispatch_irq+0x2c/0x68
> 	 handle_percpu_devid_irq+0xd4/0x268
> 	 handle_irq_desc+0x40/0x58
> 	 generic_handle_domain_nmi+0x28/0x50
> 	 __gic_handle_nmi.constprop.0+0x4c/0xa0
> 	 gic_handle_irq+0x38/0x2bc
> 	 call_on_irq_stack+0x30/0x48
> 	 do_interrupt_handler+0x80/0x94
> 	 el1_interrupt+0x90/0xac
> 	 el1h_64_irq_handler+0x18/0x24
> 	 el1h_64_irq+0x80/0x84
> 	 lkdtm_HARDLOCKUP+0x64/0x78 (P)
> 	 lkdtm_do_action+0x1c/0x38
> 	 direct_entry+0xd0/0x164
> 	 full_proxy_write+0x6c/0xa8
> 	 vfs_write+0xd0/0x354
> 	 ksys_write+0x68/0xfc
> 	 __arm64_sys_write+0x1c/0x28
> 	 invoke_syscall+0x9c/0x10c
> 	 el0_svc_common.constprop.0+0x40/0xe8
> 	 do_el0_svc+0x20/0x2c
> 	 el0_svc+0x5c/0x44c
> 	 el0t_64_sync_handler+0xa0/0xe4
> 	 el0t_64_sync+0x1ac/0x1b0
> 
> Cc: catalin.marinas@arm.com
> Cc: will@kernel.org
> Cc: stable@vger.kernel.org
> Fixes: 48ce8f80f5901 ("arm64: irqflags: Introduce explicit debugging for IRQ priorities")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/include/asm/irqflags.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
> index a8cb5a5c93b7..c5e3e9fe19a4 100644
> --- a/arch/arm64/include/asm/irqflags.h
> +++ b/arch/arm64/include/asm/irqflags.h
> @@ -60,7 +60,8 @@ static __always_inline void __pmr_local_irq_disable(void)
>  {
>  	if (IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING)) {
>  		u32 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
> -		WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr != GIC_PRIO_IRQOFF);
> +		WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr != GIC_PRIO_IRQOFF &&
> +			     pmr != (GIC_PRIO_IRQON | GICV3_PRIO_PSR_I_SET));
>  	}
>  
>  	barrier();
> -- 
> 2.34.1
> 
> 

