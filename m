Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E113FDEE29
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 16:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rj3QxB8QaXsD9NXUDbwPU1Wt9X0ndQz+gr6/KzPzyok=; b=HxagPPuRJvmmlmCSifvv6gMvDC
	T/7we0Ps6gc7QiuYZKfEP4YeEJet/kHa031BoBxy1/2JP91X6wrTo/e9bR/KVNp+Pj2L4f9bpbgJH
	PqM+PtkyNw6R8d9OtdZIzRccVulynbtDGCSxnGZMUEEeu0v9Skzon4+YZohzZCspMRGpvMb6/0IO6
	GuDFGlYd+W2KvyuqVj3tg+JvlmMsDn6654uAVnS8LeKhNJJpw1J70aKCHPLYzblJQrx7XWJuHsbrj
	9iLWk+vsO4hjxj/0bk69wY0DeN+JgSzLo0XELUwU3wkCerFtDWgFl08kVn/SFEHR+AfIzsOt7ZmHL
	Gi0Kk9JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxBQ-0000000BzNV-2dmr;
	Thu, 23 Apr 2026 16:45:44 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxBO-0000000BzN6-2BPz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 16:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rj3QxB8QaXsD9NXUDbwPU1Wt9X0ndQz+gr6/KzPzyok=; b=Eq2Q8m79i9v3IpWU+PsdQGhHKL
	xZgIfE52b4Pp8/M6gGF2v3Tx+bYVyCaZLIhkfb1PbQpgBgcU5JLyQ0d4NqQrLPidKAXM94li+AQn6
	icqbeoNPsd5L1cHZ5a/HpFrXaR/lPhWvqDZaur1v1LkLjZS8e081LYownzdZulkAY69fTWxES5LQt
	1TzoRK67SBKAHJ9uSGqpWyB7DNCRSipbBg7JonZglIfb9dVr3LwVhCVUywUIFavhw/wru2Xxthtjs
	a6tPf3PbdhqoGbLVfDqya3COL0uopQxxiqGQkJJZMuto8K7FdE+vJkV4QSaEzNsVz/UHHNT87QSWg
	VhWWMF4w==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wFxBH-002XLu-0S;
	Thu, 23 Apr 2026 16:45:35 +0000
Date: Thu, 23 Apr 2026 09:45:30 -0700
From: Breno Leitao <leitao@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, mark.rutland@arm.com
Cc: leo.bras@arm.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, 
	paulmck@kernel.org, puranjay@kernel.org, usama.arif@linux.dev, rmikey@meta.com, 
	kernel-team@meta.com
Subject: Re: [PATCH v2] arm64/irqflags: __always_inline the
 arch_local_irq_*() helpers
Message-ID: <aepMaa1AQoJO4lza@gmail.com>
References: <20260421-arm64_always_inline-v2-1-c59d1400514d@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-arm64_always_inline-v2-1-c59d1400514d@debian.org>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_094542_567246_A9B91B93 
X-CRM114-Status: GOOD (  15.25  )
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

On Tue, Apr 21, 2026 at 08:58:57AM -0700, Breno Leitao wrote:
> The arch_local_irq_*() wrappers in <asm/irqflags.h> dispatch between two
> underlying primitives: the __daif_* path on most systems, and the
> __pmr_* path on builds that use GIC PMR-based masking (Pseudo-NMI). The
> leaf primitives are already __always_inline, but the wrappers themselves
> are plain "static inline".
> 
> That is unsafe for noinstr callers: nothing prevents the compiler from
> emitting an out-of-line copy of e.g. arch_local_irq_disable(), and an
> out-of-line copy can be instrumented (ftrace, kcov, sanitizers), which
> breaks the noinstr contract on the entry/idle paths that rely on these
> helpers.
> 
> x86 hit and fixed exactly this class of bug in commit 7a745be1cc90
> ("x86/entry: __always_inline irqflags for noinstr").
> 
> Force-inline all of the arch_local_irq_*() wrappers so they cannot be
> emitted out-of-line:
> 
>   - arch_local_irq_enable()
>   - arch_local_irq_disable()
>   - arch_local_save_flags()
>   - arch_irqs_disabled_flags()
>   - arch_irqs_disabled()
>   - arch_local_irq_save()
>   - arch_local_irq_restore()
> 
> The primary motivation is noinstr safety. There is a useful side effect
> for fleet-wide profiling: when the wrapper is emitted out-of-line,
> samples taken inside it during the post-WFI IRQ unmask in
> default_idle_call() are attributed to arch_local_irq_enable rather than
> default_idle_call(), and the FP-unwinder loses default_idle_call() from
> the chain.

FWIW I run scripts/bloat-o-meter on the kernel with and without the
patch, and the the code size is mostly the same. here is the result:

	add/remove: 4/12 grow/shrink: 40/0 up/down: 1684/-652 (1032)
	Function                                     old     new   delta
	__schedule                                  8892    9024    +132
	irqentry_exit                                816     892     +76
	lockdep_hardirqs_off                         396     452     +56
	lock_is_held_type                            412     468     +56
	ct_idle_exit                                  76     132     +56
	cpu_idle_poll                                304     360     +56
	arch_stack_walk_reliable                    1152    1196     +44
	arch_stack_walk                             1184    1228     +44
	arch_bpf_stack_walk                          996    1040     +44
	lockdep_hardirqs_on                          464     504     +40
	el0_watchpt                                  576     616     +40
	el0_undef                                    560     600     +40
	el0_sys                                      560     600     +40
	el0_sve_acc                                  560     600     +40
	el0_svc                                      600     640     +40
	el0_sp                                       564     604     +40
	el0_softstp                                  728     768     +40
	el0_sme_acc                                  560     600     +40
	el0_pc                                       740     780     +40
	el0_mops                                     560     600     +40
	el0_inv                                      564     604     +40
	el0_interrupt                                656     696     +40
	el0_ia                                       716     756     +40
	el0_gcs                                      560     600     +40
	el0_fpsimd_exc                               560     600     +40
	el0_fpsimd_acc                               560     600     +40
	el0_fpac                                     560     600     +40
	el0_da                                       568     608     +40
	el0_bti                                      552     592     +40
	el0_brk64                                    560     600     +40
	el0_breakpt                                  720     760     +40
	asm_exit_to_user_mode                        416     456     +40
	__el0_error_handler_common                   592     632     +40
	cpuidle_enter_state                         1220    1248     +28
	check_preemption_disabled                    228     252     +24
	default_idle_call                            252     272     +20
	ct_kernel_enter                              388     404     +16
	ct_idle_enter                                 52      68     +16
	look_up_lock_class                           364     376     +12
	check_flags                                  492     504     +12
	__CortexA53843419_FFFF800081146000             -       8      +8
	__CortexA53843419_FFFF8000809C3004             -       8      +8
	__CortexA53843419_FFFF8000809AE000             -       8      +8
	__CortexA53843419_FFFF800080248004             -       8      +8
	__CortexA53843419_FFFF80008100C000             8       -      -8
	__CortexA53843419_FFFF8000809A9000             8       -      -8
	__CortexA53843419_FFFF8000809A8004             8       -      -8
	__CortexA53843419_FFFF800080448008             8       -      -8
	__CortexA53843419_FFFF8000801EE000             8       -      -8
	arch_local_irq_restore                        48       -     -48
	arch_local_save_flags                         80       -     -80
	arch_local_irq_save                           80       -     -80
	arch_local_irq_enable                         84       -     -84
	arch_local_irq_disable                        96       -     -96
	arch_irqs_disabled_flags                      96       -     -96
	arch_irqs_disabled                           128       -    -128
	Total: Before=163062863, After=163063895, chg +0.00%







