Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828F7C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 12:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUTttIpSoEbrqzIAFewsOzRHbZsHATQkzCLZ8QFt84A=; b=ZGdd/1qHCtxddPEJIJ2yt8Km5K
	1k0bdXaxuD5AQEellrlq1s0W462gG8UuLUcQRTtfHd+hCQsrdEZA3DB1+Aqm8lh0P4K2yOJQZU7lB
	J4mtRm7bk7VLw08yU91H4z1b8Q/rh0YVMwVvKIhhuWW/bsOa+9oo7PIffyXple6osmLZk1Nz0Agns
	rUMAId6yS1ufRFBaAam29dCXB8pnzZoAal7cfs5GienFA81AWnbQK89+mWqIeeRkk2kCnK6CnlR3i
	1+9ANDG7UTJh82H33aakENm8OILHg93OnAfjwHwYFR5Ev5Mh9LuJ4Z9R18aj5WzskzNEMJ/4JpIQB
	wZN1VL+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTW1-00000008Zkt-0sFo;
	Wed, 09 Jul 2025 12:03:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRkC-00000008Fs5-2VE0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:09:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9060F153B;
	Wed,  9 Jul 2025 03:09:28 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82CB43F694;
	Wed,  9 Jul 2025 03:09:38 -0700 (PDT)
Date: Wed, 9 Jul 2025 11:09:32 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <Anshuman.Khandual@arm.com>,
	Rob Herring <Rob.Herring@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Robin Murphy <Robin.Murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] perf: arm_spe: Disable buffer before writing to
 PMBPTR_EL1 or PMBSR_EL1
Message-ID: <aG4_3D1RG8CWncBF@raptor>
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
 <20250701-james-spe-vm-interface-v1-2-52a2cd223d00@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-james-spe-vm-interface-v1-2-52a2cd223d00@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_030940_747023_E7370077 
X-CRM114-Status: GOOD (  34.07  )
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

Hi James,

On Tue, Jul 01, 2025 at 04:31:58PM +0100, James Clark wrote:
> DEN0154 states that writes to PMBPTR_EL1 or PMBSR_EL1 must be done while
> the buffer is disabled (PMBLIMITR_EL1.E == 0). Re-arrange the interrupt
> handler to always disable the buffer for non-spurious interrupts before
> doing either.
> 
> Most of arm_spe_pmu_disable_and_drain_local() is now always done, so for
> faults the only thing left to do is clear PMSCR_EL1.
> 
> Elaborate the comment in arm_spe_pmu_disable_and_drain_local() to
> explain the ramifications of not doing it in the right order.
> 
> Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/perf/arm_spe_pmu.c | 33 +++++++++++++++++++++------------
>  1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index 6235ca7ecd48..5829947c8871 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -559,7 +559,12 @@ static void arm_spe_perf_aux_output_end(struct perf_output_handle *handle)
>  
>  static void arm_spe_pmu_disable_and_drain_local(void)
>  {
> -	/* Disable profiling at EL0 and EL1 */
> +	/*
> +	 * To prevent the CONSTRAINED UNPREDICTABLE behavior of either writing
> +	 * to memory after the buffer is disabled, or SPE reporting an access
> +	 * not allowed event, we must disable sampling before draining the
> +	 * buffer.
> +	 */
>  	write_sysreg_s(0, SYS_PMSCR_EL1);
>  	isb();
>  
> @@ -661,16 +666,24 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
>  	 */
>  	irq_work_run();
>  
> +	/*
> +	 * arm_spe_pmu_buf_get_fault_act() already drained, and PMBSR_EL1.S == 1
> +	 * means that StatisticalProfilingEnabled() == false. So now we can
> +	 * safely disable the buffer.
> +	 */
> +	write_sysreg_s(0, SYS_PMBLIMITR_EL1);
> +	isb();
> +
> +	/* Status can be cleared now that PMBLIMITR_EL1.E == 0 */
> +	write_sysreg_s(0, SYS_PMBSR_EL1);

I've been trying to figure out if we need an ISB here to order clearing the
service bit before the PMBLIMITR_EL1 write in arm_spe_perf_aux_output_begin().

arm_spe_perf_aux_output_begin() is called only when the buffer is full, and this
rules out the event having the discard attribute (buffer management events are
not generated in discard mode).

If a new buffer cannot be allocated (perf_aux_output_begin() returns NULL), then
PMBLIMITR_EL1.E remains 0, so no need to order the two writes.

The only other path remaining in arm_spe_perf_aux_output_begin() is
reprogramming the buffer, in which case there's an ISB before the write to
PMBLIMITR_EL1.

In conclusion, I think it's correct not to have an ISB here.

> +
>  	switch (act) {
>  	case SPE_PMU_BUF_FAULT_ACT_FATAL:
>  		/*
> -		 * If a fatal exception occurred then leaving the profiling
> -		 * buffer enabled is a recipe waiting to happen. Since
> -		 * fatal faults don't always imply truncation, make sure
> -		 * that the profiling buffer is disabled explicitly before
> -		 * clearing the syndrome register.
> +		 * To complete the full disable sequence, also disable profiling
> +		 * at EL0 and EL1, we don't want to continue at all anymore.
>  		 */
> -		arm_spe_pmu_disable_and_drain_local();
> +		write_sysreg_s(0, SYS_PMSCR_EL1);

Before:

arm_spe_pmu_buf_get_fault_act:
  <drain buffer>
  ISB
arm_spe_pmu_disable_and_drain_local:
  PMSCR_EL1 = 0
  ISB		# disables profiling
  <drain buffer>
  PMBLIMITR_EL1=0
PMBSR_EL1=0
ERET		# synchronizes the two writes above

Now:

arm_spe_pmu_buf_get_fault_act:
  <drain buffer>
  ISB
PMBLIMITR_EL1=0
ISB 		# disables profiling
PMBSR_EL1=0
PMSCR_EL1=0
ERET		# synchronizes the two writes above

This looks correct to me.

Thanks,
Alex

>  		break;
>  	case SPE_PMU_BUF_FAULT_ACT_OK:
>  		/*
> @@ -679,18 +692,14 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
>  		 * PMBPTR might be misaligned, but we'll burn that bridge
>  		 * when we get to it.
>  		 */
> -		if (!(handle->aux_flags & PERF_AUX_FLAG_TRUNCATED)) {
> +		if (!(handle->aux_flags & PERF_AUX_FLAG_TRUNCATED))
>  			arm_spe_perf_aux_output_begin(handle, event);
> -			isb();
> -		}
>  		break;
>  	case SPE_PMU_BUF_FAULT_ACT_SPURIOUS:
>  		/* We've seen you before, but GCC has the memory of a sieve. */
>  		break;
>  	}
>  
> -	/* The buffer pointers are now sane, so resume profiling. */
> -	write_sysreg_s(0, SYS_PMBSR_EL1);
>  	return IRQ_HANDLED;
>  }
>  
> 
> -- 
> 2.34.1
> 

