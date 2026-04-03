Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9E1E7E378
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 11:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQb1rPnTvoMn5siSRqNgBY6tc+dxHHuY1IfGWGD4G0c=; b=ed++Rx6+b6glCIDDMHO1kIALgu
	0CU2KsW/6mdxD71NOX1uI5QvBeGvESAVcZgyqJBtEaZ9nyCfgvXi/k/ic7ZtEj4kZ+IbdNRZjouGh
	V+rl0d9s6YHQO8u2CdOsJPZgrOg9zN0eQw2GrQ4P6FwL78Ws1SUvAxRf+WeByWY2C8sRCDR7fYigb
	VYAAQzVUOfURtQ6AYqsVqFkbiebWjmZHSdlB5NN7Q8Fue/GbaTWmEtTqGTb7wJTNVN9A7Lu3zS9cV
	/8kVm6M4R2AcbJx00Rg6YX8JLadgITIz21/cVx1H5Y3kPmc2X/a0NU+Jq/cczC7FazFS6BPZQy/G7
	bbJNJOsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cq1-00000001y2f-1LYl;
	Fri, 03 Apr 2026 11:37:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cpx-00000001y0n-3BhU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 11:37:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B3BE351B;
	Fri,  3 Apr 2026 04:37:10 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B9DF3F641;
	Fri,  3 Apr 2026 04:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775216235; bh=v+Q7pZKq6lYeuy+fosZKjc3aYlgbV5fzx5+MxAH6R84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GHoX3Dlj4K9QzbEsMUdodsAf5PGbxboE6BFRxb8iQwKuwa2NHLVTD8MoqipGLZ56K
	 oP5xraWseJ2TDBnk25ZsN+JjfqNRYOvhicd1woxOScDk32oNNSHbaVEPZNnxmmp/kw
	 My0syJ621qD3PGJmWIYd3+UxLa2pn5sp9rMjtOtw=
Date: Fri, 3 Apr 2026 12:37:12 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 4/4] arm64: errata: Work around early CME DVMSync
 acknowledgement
Message-ID: <ac-maGr18CPKvh0X@arm.com>
References: <20260402101246.3870036-1-catalin.marinas@arm.com>
 <20260402101246.3870036-5-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402101246.3870036-5-catalin.marinas@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_043717_968390_71BE45C9 
X-CRM114-Status: GOOD (  25.71  )
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

Some sashiko.dev feedback below:

On Thu, Apr 02, 2026 at 11:12:44AM +0100, Catalin Marinas wrote:
> +static inline void sme_dvmsync_add_pending(struct arch_tlbflush_unmap_batch *batch,
> +					   struct mm_struct *mm)
> +{
> +	if (!alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
> +		return;
> +
> +	/*
> +	 * Order the mm_cpumask() read after the hardware DVMSync.
> +	 */
> +	dsb(ish);
> +	if (cpumask_empty(mm_cpumask(mm)))
> +		return;

Mentioned in the cover letter already but sashiko highlighted it as
well: the dsb here adds a possible overhead. I did not notice any
difference in some hand/AI-crafted benchmarks using
madvise(MADV_PAGEOUT). In practice, this erratum affects systems with a
small number of CPUs, so the eager DVMSync won't matter.

> +void sme_enable_dvmsync(void)
> +{
> +	/*
> +	 * stop_machine() will invoke this function concurrently on all
> +	 * affected CPUs. Serialise the initialisation.
> +	 */
> +	raw_spin_lock(&sme_dvmsync_init_lock);
> +	if (!cpumask_available(sme_dvmsync_cpus) &&
> +	    !zalloc_cpumask_var(&sme_dvmsync_cpus, GFP_ATOMIC))
> +		panic("Unable to allocate cpumasks for the SME DVMSync erratum");
> +	raw_spin_unlock(&sme_dvmsync_init_lock);
> +
> +	cpumask_set_cpu(smp_processor_id(), sme_dvmsync_cpus);
> +}

I don't think sashiko is correct here. It said that zalloc_cpumask_var()
may sleep on PREEMPT_RT kernels but I thought passing GFP_ATOMIC should
be sufficient.

> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 489554931231..88426d8ae11c 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -26,6 +26,7 @@
>  #include <linux/reboot.h>
>  #include <linux/interrupt.h>
>  #include <linux/init.h>
> +#include <linux/cpumask.h>
>  #include <linux/cpu.h>
>  #include <linux/elfcore.h>
>  #include <linux/pm.h>
> @@ -339,8 +340,41 @@ void flush_thread(void)
>  	flush_gcs();
>  }
>  
> +#ifdef CONFIG_ARM64_ERRATUM_4193714
> +
> +static int arch_dup_tlbbatch_mask(struct task_struct *dst)
> +{
> +	if (!alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
> +		return 0;
> +
> +	if (!zalloc_cpumask_var(&dst->tlb_ubc.arch.cpumask, GFP_KERNEL))
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +static void arch_release_tlbbatch_mask(struct task_struct *tsk)
> +{
> +	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
> +		free_cpumask_var(tsk->tlb_ubc.arch.cpumask);
> +}
> +
> +#else
> +
> +static int arch_dup_tlbbatch_mask(struct task_struct *dst)
> +{
> +	return 0;
> +}
> +
> +static void arch_release_tlbbatch_mask(struct task_struct *tsk)
> +{
> +}
> +
> +#endif /* CONFIG_ARM64_ERRATUM_4193714 */
> +
>  void arch_release_task_struct(struct task_struct *tsk)
>  {
> +	arch_release_tlbbatch_mask(tsk);
>  	fpsimd_release_task(tsk);
>  }
>  
> @@ -356,6 +390,9 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
>  
>  	*dst = *src;
>  
> +	if (arch_dup_tlbbatch_mask(dst))
> +		return -ENOMEM;

This may indeed leak if the caller of arch_dup_task_struct() fails.
dup_task_struct() calls free_task_struct() on failure but not the
arch_release_task_struct().

The simplest fix is to just allocate the tlbbatch mask lazily via
arch_tlbbatch_add_pending(). The downside is that we need a GFP_ATOMIC
in there but that's only theoretical, such systems are built with
CPUMASK_OFFSTACK=n already and no allocation necessary anyway. The diff
on top would be:

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 88426d8ae11c..88904e47c7d9 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -342,15 +342,14 @@ void flush_thread(void)
 
 #ifdef CONFIG_ARM64_ERRATUM_4193714
 
-static int arch_dup_tlbbatch_mask(struct task_struct *dst)
+static void arch_dup_tlbbatch_mask(struct task_struct *dst)
 {
-	if (!alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
-		return 0;
-
-	if (!zalloc_cpumask_var(&dst->tlb_ubc.arch.cpumask, GFP_KERNEL))
-		return -ENOMEM;
-
-	return 0;
+	/*
+	 * Clear any inherited batch state. The cpumask is allocated lazily if
+	 * CPUMASK_OFFSTACK=y.
+	 */
+	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
+		memset(&dst->tlb_ubc.arch, 0, sizeof(dst->tlb_ubc.arch));
 }
 
 static void arch_release_tlbbatch_mask(struct task_struct *tsk)
@@ -361,9 +360,8 @@ static void arch_release_tlbbatch_mask(struct task_struct *tsk)
 
 #else
 
-static int arch_dup_tlbbatch_mask(struct task_struct *dst)
+static void arch_dup_tlbbatch_mask(struct task_struct *dst)
 {
-	return 0;
 }
 
 static void arch_release_tlbbatch_mask(struct task_struct *tsk)
@@ -390,8 +388,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 
 	*dst = *src;
 
-	if (arch_dup_tlbbatch_mask(dst))
-		return -ENOMEM;
+	arch_dup_tlbbatch_mask(dst);
 
 	/*
 	 * Drop stale reference to src's sve_state and convert dst to

-- 
Catalin

