Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DB1C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 12:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbGwZADL5Y87oVCXzEkLYxGUDy1vvUC8dlGfMGpBVDI=; b=g113VpmFaE35PxnWxVzPGPsZSO
	2lmfs90nTgMWEZibHK6yv2jjfe2slexAapxIUZEQ6wellBfW60/qiS9UCR2UbMbtZo2sEFypX3u79
	7FZBTe2cyw24XkpuwCpeAvIr0ugtSVBBSTbx25VJMtjH9+Undg5bbncclMJbQL9fs8X/xuP/SLrwQ
	mpK2hCbgKyI/aW8Y5fpsCjfdPh/x9GJdAR3lKdKsX/9c3MGHi64y/1TXKjlpyMcHKMCA4lH6VdvXH
	MftLh9SduqNQd5F6CtlgUchwCKzdPP+Q9wEYHyiV1MNZb39mTJWpfX2bxaXeqC+Jp+g+g1EKk5kgS
	QM0TJaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HXz-0000000Bg3M-3tIC;
	Wed, 09 Sep 2026 12:37:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HXy-0000000Bg3F-44DQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 12:37:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A3AA60218;
	Wed,  9 Sep 2026 12:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F2F1F00A3A;
	Wed,  9 Sep 2026 12:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788957421;
	bh=KbGwZADL5Y87oVCXzEkLYxGUDy1vvUC8dlGfMGpBVDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S4/1pmTA5TeeJmbyHhM3d6gQdjVAJmfXI+A6HeJrf+afK7asfVmvlItVWZEFGDBQg
	 71eUFp6E0mq0/e1RMn2MgswsOK5xn0rrxmzaSRZasThhE2d6/hK8gdHc4/mqo4jwjY
	 5Gtw0m/xY9mu5COxp4wtvTKdk6Q6OCz9RSNjzmyMoj2uxIJ+n0g3rDkykvUI7YbpIA
	 IbPfM5rQghACN+rECUcOzXzw2jwAjOBp3xlRGkUGu1o0x6E07SFnKuoctsGqtIEsel
	 oPbtusK8tUXl6ORQd9Bj/1jze3/5eigC6uGb3nz9w6iLm/En1mhwJEZF4kagb+YDof
	 5tjONB8OAYbjA==
Date: Wed, 9 Sep 2026 13:36:55 +0100
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
Message-ID: <aqFS58mJ4GJNrbZ2@willie-the-truck>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-10-will@kernel.org>
 <45c37592-f05d-4b1c-812b-0cb38d1c3e24@huawei.com>
 <ap_hR1mntzm-TZOP@willie-the-truck>
 <f01fc59e-5254-484d-adf9-8dd1c2e58d91@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f01fc59e-5254-484d-adf9-8dd1c2e58d91@huawei.com>
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

On Tue, Sep 08, 2026 at 07:25:54PM +0800, Jinjie Ruan wrote:
> 在 2026/9/8 18:19, Will Deacon 写道:
> > On Tue, Sep 08, 2026 at 04:55:36PM +0800, Jinjie Ruan wrote:
> >> I think we need to handle the printk problem before this patch as we
> >> discussed earlier.
> >>
> >> Otherwise defer the rcutree_report_cpu_starting() will trigger a
> >> false-positive lockdep"suspicious RCU usage" splat during early lock
> >> acquisitions as commit ce3d31ad3cac ("arm64/smp: Move
> >> rcu_cpu_starting() earlier") pointed out.
> > 
> > Sorry, I meant to mention this in the cover letter but forgot about it.
> > I'm not sure that ce3d31ad3cac ("arm64/smp: Move rcu_cpu_starting()
> > earlier") is still relevant with the latest printk/console/lockdep code.
> > I tried quite hard to trigger lockdep splats manually, but the only way
> > I could do it was by using the "%pS" specifier to print the name of a
> > symbol in a module, which would cause an RCU walk of the module symbols
> > in the kallsyms code! Manually calling WARN() or even rcu_read_lock() /
> > spin_lock() did _not_ trigger a splat.
> 
> Add "dyndbg="+p"" in cmdline, CONFIG_DEBUG_LOCK_ALLOC=y,
> CONFIG_PROVE_RCU_LIST=y, we can reproduce the warning as below:
> 
> I believe there is also a problem in the RISC-V code itself here as
> store_cpu_topology() is common for RISC-V.
> 
> [    0.335162] smp: Bringing up secondary CPUs ...
> [    0.345495]
> [    0.345513] =============================
> [    0.345523] WARNING: suspicious RCU usage
> [    0.345621] 7.3.0-rc2-00010-g2311ba2cd56f #500 Tainted: G        W
> [    0.345637] -----------------------------
> [    0.345646] kernel/locking/lockdep.c:3845 RCU-list traversed in
> non-reader section!!
> [    0.345659]
> [    0.345659] other info that might help us debug this:
> [    0.345659]
> [    0.345680]
> [    0.345680] RCU used illegally from offline CPU!
> [    0.345680] rcu_scheduler_active = 1, debug_locks = 1
> [    0.345725] locks held by swapper/1/0: 0, last CPU#1
> [    0.345743]
> [    0.345743] stack backtrace:
> [    0.345834] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Tainted: G        W
>          7.3.0-rc2-00010-g2311ba2cd56f #500 PREEMPT(full)
> [    0.345885] Tainted: [W]=WARN
> [    0.346077] Call trace:
> [    0.346102]  show_stack+0x20/0x38 (C)
> [    0.346153]  dump_stack_lvl+0xc4/0x150
> [    0.346176]  dump_stack+0x18/0x28
> [    0.346194]  lockdep_rcu_suspicious+0x170/0x238
> [    0.346217]  __lock_acquire+0xf08/0x1818
> [    0.346237]  lock_acquire+0x1e0/0x450
> [    0.346256]  _raw_spin_lock_irqsave+0x70/0xc0
> [    0.346277]  down_trylock+0x20/0x60
> [    0.346293]  __down_trylock_console_sem+0x4c/0x118
> [    0.346316]  vprintk_emit+0x2d8/0x3f8
> [    0.346333]  vprintk_default+0x40/0x58
> [    0.346350]  vprintk+0x3c/0x80
> [    0.346366]  _printk+0x64/0x98
> [    0.346386]  __dynamic_pr_debug+0x90/0xd8
> [    0.346406]  acpi_get_cache_info+0x140/0x1a0
> [    0.346430]  init_cache_level+0xec/0x110
> [    0.346450]  detect_cache_attributes+0x74/0x7c0
> [    0.346473]  update_siblings_masks+0x30/0x300
> [    0.346495]  store_cpu_topology+0x70/0xf0
> [    0.346515]  secondary_start_kernel+0xe0/0x178
> [    0.346535]  __secondary_switched+0xc0/0xc8

I was about to say "don't do this" but then I realised two things:

1. update_siblings_masks() can trigger lockdep splats outside of
   pr_debug() if RCU isn't up and running, e.g.:

    [    0.524042]  show_stack+0x18/0x24 (C)
    [    0.524519]  __dump_stack+0x28/0x38
    [    0.524546]  dump_stack_lvl+0x64/0x84
    [    0.524562]  dump_stack+0x18/0x24
    [    0.524576]  lockdep_rcu_suspicious+0x134/0x1cc
    [    0.524591]  __lock_acquire+0xee8/0x2cb0
    [    0.524606]  lock_acquire+0x11c/0x2fc
    [    0.524621]  _raw_spin_lock_irqsave+0x64/0x84
    [    0.524641]  of_find_property+0x2c/0x8c
    [    0.524659]  detect_cache_attributes+0x1c0/0x6d0
    [    0.524676]  update_siblings_masks+0x38/0x288
    [    0.524692]  store_cpu_topology+0x4c/0x58
    [    0.524706]  secondary_start_kernel+0xdc/0x1c8
    [    0.524722]  __secondary_switched+0x120/0x124

2. This code is running _after_ cpuhp_ap_sync_alive().

So for the next version, I'll reintroduce the call to
rcutree_report_cpu_starting(), but move it immediately after the call to
cpuhp_ap_sync_alive(). I think that will solve these issues, without
causing issues with the concurrent part of early boot and also without
reintroducing the early call to rcutree_report_cpu_dead().

Cheers,

Will

