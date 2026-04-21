Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB95F8FA94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 16:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uues4jM9eRuiyjVaYX9ROVehxbZRCK1lE5/reXXszyU=; b=UGEOyN9IwnVDy85Hj1c/NDo1sC
	2nsXyWvpablOnlrTalqa3nGr/eLHRSnmyV7TaJ4DuiwPEusRyLCmZvgte2+fw+vqv21Qd5UFHK74b
	9ydFdrMo5UJpvCfzVDjZq7KC73PM/P7fqAynySixLR4d8pNndUeHVc0nI20QW6ea6Jv473W2HV2y6
	iuGDF0V6tp3E8t+3XzQw/Jfs4tLq/nPnE8ovTDIZiwyBxEJxX31Ahm/RfCmPxiCDN/q2eBBB9DlDH
	F8kq8z0xfJHrWJ+e8499UPAPMVYE9jPl3eNt7+tarXc6GLl9+xjHH6cPjka906tB79U8zsFmxeb/r
	zNuYaK0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDdS-00000008tG2-39WN;
	Tue, 21 Apr 2026 16:07:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDdP-00000008tFc-1m3R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 16:07:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6050927B5;
	Tue, 21 Apr 2026 09:07:28 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 431073F7B4;
	Tue, 21 Apr 2026 09:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776787653; bh=CDkKQiqxepZsm3g5zz3MhhTKvWeprAVSa8SwY/NAmv0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MMSpracRIYBWr4vxYzHZdqydWWnRv1Jvqv2cJR702cQ8+3V76wRqnw3kh8up4+sAR
	 8rgojzGQoI6gqmfVgDwmhUUwSN//8j9a9c0dfULW488Q3hYRNy8NAwLL649UTPLZBR
	 j7HpRe63kzdLOFj5ZDOZ19Xg3Qv9MiRcjuU7ZArs=
From: Leonardo Bras <leo.bras@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	palmer@dabbelt.com,
	paulmck@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	rmikey@meta.com,
	kernel-team@meta.com
Subject: Re: [PATCH v2] arm64/irqflags: __always_inline the arch_local_irq_*() helpers
Date: Tue, 21 Apr 2026 17:07:25 +0100
Message-ID: <aeegvdLT_z9ESKYV@devkitleo>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421-arm64_always_inline-v2-1-c59d1400514d@debian.org>
References: <20260421-arm64_always_inline-v2-1-c59d1400514d@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_090735_654079_B5EA2069 
X-CRM114-Status: GOOD (  24.03  )
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
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> Changes in v2:
> - Expand the functions that uses always_inline in arm64
> - Link to v1: https://patch.msgid.link/20260420-arm64_always_inline-v1-1-dba919cf46bc@debian.org
> ---
>  arch/arm64/include/asm/irqflags.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
> index d4d7451c2c129..a8cb5a5c93b78 100644
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
> @@ -68,7 +68,7 @@ static __always_inline void __pmr_local_irq_disable(void)
>  	barrier();
>  }
>  
> -static inline void arch_local_irq_disable(void)
> +static __always_inline void arch_local_irq_disable(void)
>  {
>  	if (system_uses_irq_prio_masking()) {
>  		__pmr_local_irq_disable();
> @@ -90,7 +90,7 @@ static __always_inline unsigned long __pmr_local_save_flags(void)
>  /*
>   * Save the current interrupt enable state.
>   */
> -static inline unsigned long arch_local_save_flags(void)
> +static __always_inline unsigned long arch_local_save_flags(void)
>  {
>  	if (system_uses_irq_prio_masking()) {
>  		return __pmr_local_save_flags();
> @@ -109,7 +109,7 @@ static __always_inline bool __pmr_irqs_disabled_flags(unsigned long flags)
>  	return flags != GIC_PRIO_IRQON;
>  }
>  
> -static inline bool arch_irqs_disabled_flags(unsigned long flags)
> +static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
>  {
>  	if (system_uses_irq_prio_masking()) {
>  		return __pmr_irqs_disabled_flags(flags);
> @@ -128,7 +128,7 @@ static __always_inline bool __pmr_irqs_disabled(void)
>  	return __pmr_irqs_disabled_flags(__pmr_local_save_flags());
>  }
>  
> -static inline bool arch_irqs_disabled(void)
> +static __always_inline bool arch_irqs_disabled(void)
>  {
>  	if (system_uses_irq_prio_masking()) {
>  		return __pmr_irqs_disabled();
> @@ -160,7 +160,7 @@ static __always_inline unsigned long __pmr_local_irq_save(void)
>  	return flags;
>  }
>  
> -static inline unsigned long arch_local_irq_save(void)
> +static __always_inline unsigned long arch_local_irq_save(void)
>  {
>  	if (system_uses_irq_prio_masking()) {
>  		return __pmr_local_irq_save();
> @@ -187,7 +187,7 @@ static __always_inline void __pmr_local_irq_restore(unsigned long flags)
>  /*
>   * restore saved IRQ state
>   */
> -static inline void arch_local_irq_restore(unsigned long flags)
> +static __always_inline void arch_local_irq_restore(unsigned long flags)
>  {
>  	if (system_uses_irq_prio_masking()) {
>  		__pmr_local_irq_restore(flags);
> 
> ---
> base-commit: bee6ea30c48788e18348309f891ed8afbf7702ac
> change-id: 20260420-arm64_always_inline-6bc9dd3c17e6
> 
> Best regards,
> --  
> Breno Leitao <leitao@debian.org>
> 


Looks correct to what was discussed in V1. FWIW:

Reviewed-by: Leonardo Bras <leo.bras@arm.com>


