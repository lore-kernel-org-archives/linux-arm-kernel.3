Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B6DF588C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oFRakf6lHXk2uTIRmWYfHYwFcUQnWemf7iIiOoObAk=; b=J/jJSQvL9XRvJOYlAYZegpx3Ba
	puON9mm/NqnaFVF08BbLB0CT30PmozPmUpFjn8XmKER7w0N3HxHXyIjdks8QkWxXelxQj71/5ccdx
	8M2W/uUF+LZNedS+8E1bHit9XvF3hNWQf6ixg0dGtUbBaju5mA8UVkpPna7c7Yrdy+mtocIJYq/VW
	PU8SlPWU+5WhidLf39vXKDlSi/a96W5P2woa//h/1iCfqrB0yB4HcjeuzCgALOBAK5BkRBcADdYwo
	VnRTudnZOMaYht8yk8qlEE+3Mab83ys177jVkIbpHdZn1d2a+jvVLVsTTtFDQ+LtxXIzy1TWj8PYe
	yiJobKjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoKk-00000006wya-1aht;
	Mon, 20 Apr 2026 13:06:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoKi-00000006wyA-0Kp4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 13:06:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 702FD1516;
	Mon, 20 Apr 2026 06:06:26 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07E2E3F915;
	Mon, 20 Apr 2026 06:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776690392; bh=jUHoAfol7T9iVj6kVSoAI99u9qvpdPyDeTW7xW5DPdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pdRU18wSpeyGyG4SP+DC+hW+lfoV/t93MQa7+7vni/K/TFjx3Kxt6CqfDH+sf0Ruk
	 pGseLRVJlJ6yBXiPoDSbqZX8hGeF/9p2cr3uGcx5JYy806ik1e1yFZXO8xfYYrxnCm
	 cji1Y1r8criycxoFI9wngD72a/2zIYNsxrq3RpDM=
Date: Mon, 20 Apr 2026 14:06:23 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, leo.bras@arm.com, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	palmer@dabbelt.com, paulmck@kernel.org, puranjay@kernel.org,
	usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH RFC] arm64/irqflags: force inline of
 arch_local_irq_enable()
Message-ID: <aeYkz_4WKDdb1NTp@J2N7QTR9R3>
References: <20260420-arm64_always_inline-v1-1-dba919cf46bc@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-arm64_always_inline-v1-1-dba919cf46bc@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_060636_205063_FF98708E 
X-CRM114-Status: GOOD (  34.98  )
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

On Mon, Apr 20, 2026 at 05:42:11AM -0700, Breno Leitao wrote:
> arch_local_irq_enable() is a small wrapper that dispatches between two
> unmask paths: __daif_local_irq_enable() on most systems, and
> __pmr_local_irq_enable() on builds that use GIC PMR-based masking
> (Pseudo-NMI). Both leaf primitives are already __always_inline; the
> wrapper itself is plain "static inline".
> 
> In practice the compiler does not always inline the wrapper. 

I think this was my mistake, and we should have marked all the helpers
as __always_inline for noinstr safety, as x86 did in commit:

  7a745be1cc90 ("x86/entry: __always_inline irqflags for noinstr")

I think we should mark all of the following as __always_inline in one
go:

* arch_local_irq_enable()
* arch_local_irq_disable()
* arch_local_save_flags()
* arch_irqs_disabled_flags()
* arch_irqs_disabled()
* arch_local_irq_save()
* arch_local_irq_restore()

... which then ensures noinstr safety, and has the side benefit of
giving nicer traces as you're suggesting here.

Are you happy to try that?

Mark.

> When it gets emitted out-of-line, samples taken inside it during the
> post-WFI IRQ unmask in default_idle_call() show up as
> arch_local_irq_enable overhead in profiles, with default_idle_call()
> lost from the unwound chain.
> 
> This matters most at fleet scale. On a large arm64 fleet, the
> aggregate effect is that idle CPUs show up in fleet-wide profilers as
> "busy stuck in arch_local_irq_enable" instead of as idle
> (default_idle_call / cpu_startup_entry). Engineers looking at
> fleet-wide top-symbol dashboards see what looks like significant
> CPU-bound work in IRQ unmasking and chase a phantom hot path, when in
> fact the cost is the WFI wake-up cycle being attributed to the wrong
> function. Tooling has to special-case this symbol to suppress it,
> which is fragile across kernel versions. Inlining the wrapper makes
> idle CPUs appear idle in profiles - which is what they are.
> 
> The same misattribution affects driver stalls. arm64 PMU overflow is
> delivered as a regular IRQ (no NMI on default builds), so a driver
> that holds local_irq_disable() for milliseconds defers every PMU
> sample to the moment it calls local_irq_enable(). With the wrapper
> out-of-line, the resulting fat sample is credited to
> arch_local_irq_enable rather than to the driver, and the FP-unwinder
> points the call chain at the driver's caller instead of the driver
> itself (the immediate caller is skipped because arch_local_irq_enable
> is a leaf with no saved frame). The driver is still visible in the
> profile from its other samples, but the stall cost itself is
> mis-attributed and the chain leading to it is one frame off, making
> fleet-wide root-cause analysis harder than it needs to be. Inlining
> the wrapper attributes the stall sample to the driver function that
> actually held IRQs disabled.
> 
> Trade-offs:
> 
>  - Minor .text effect: every caller now expands the dispatch +
>    underlying primitive at its call site. system_uses_irq_prio_masking()
>    is a static-key check, so on non-pNMI systems the inlined body
>    collapses to a single MSR daifclr; on pNMI systems it collapses to a
>    single sysreg write.
> 
>  - Loss of a debugging convenience: there is no longer an
>    arch_local_irq_enable symbol to set a breakpoint on. Callers must be
>    targeted individually.
> 
>  - Compiler trust: __always_inline overrides size heuristics. The body
>    is small enough that this should be unobjectionable, but it is a
>    policy change.
> 
> This patch only flips arch_local_irq_enable(). The same reasoning
> applies to arch_local_irq_disable()/save()/restore() which share the
> identical static-inline-wrapper-around-__always_inline-primitives
> pattern. Holding those off until profiles motivate them.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  arch/arm64/include/asm/irqflags.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
> index d4d7451c2c129..505ef5be53a71 100644
> --- a/arch/arm64/include/asm/irqflags.h
> +++ b/arch/arm64/include/asm/irqflags.h
> @@ -40,7 +40,7 @@ static __always_inline void __pmr_local_irq_enable(void)
>  	barrier();
>  }
>  
> -static inline void arch_local_irq_enable(void)
> +static __always_inline void arch_local_irq_enable(void)
>  {
>  	if (system_uses_irq_prio_masking()) {
>  		__pmr_local_irq_enable();
> 
> ---
> base-commit: 615aad0f61e0c7a898184a394dc895c610100d4f
> change-id: 20260420-arm64_always_inline-6bc9dd3c17e6
> 
> Best regards,
> --  
> Breno Leitao <leitao@debian.org>
> 

