Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB34C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 15:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18PhGo/QNVLQ2LKEYrY3mJck1ZQ8LPpXzGjk0H0sbLE=; b=WhpdgIBm25lu3BiiEEwwfENrae
	ztss9dOAhVJ1qVCEf/u+y+vp2b2O5NkPrl8+q8SWpA2TBsK7tVk7RlANzX3Phe/N6aHUyYNIC0swl
	H6nQDVwCxoZ4wyB2E0s45Q/OqPd1xBorV00kP2RxZxG7csWbRHmtm0Aduw7DkN6lTkE5ADGUfd9eE
	+jZuCg2DRNu099QLsLq0Tms8l95VIteYlPL4kaOtBEy2yir4LwLPP5ZnafVLW9tIhFrsQu+hkPhlz
	oeesHucZmeGSia52l6LUSZctKMYZCyUbaFR/pKdCzy+Z2q7liEOzUYspKP6U29CLOEpFyX0jcedwy
	+Xt0r1cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiiW-0000000Esj0-1CjT;
	Fri, 04 Jul 2025 15:52:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXigA-0000000EsUC-2nwn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 15:50:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08ECB153B;
	Fri,  4 Jul 2025 08:50:05 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81EC03F66E;
	Fri,  4 Jul 2025 08:50:18 -0700 (PDT)
Date: Fri, 4 Jul 2025 16:50:16 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexandru Elisei <Alexandru.Elisei@arm.com>,
	Anshuman Khandual <Anshuman.Khandual@arm.com>,
	Rob Herring <Rob.Herring@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Robin Murphy <Robin.Murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] perf: arm_spe: Disable buffer before writing to
 PMBPTR_EL1 or PMBSR_EL1
Message-ID: <20250704155016.GI1039028@e132581.arm.com>
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
 <20250701-james-spe-vm-interface-v1-2-52a2cd223d00@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-james-spe-vm-interface-v1-2-52a2cd223d00@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_085022_800366_F3FC6538 
X-CRM114-Status: GOOD (  24.17  )
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

On Tue, Jul 01, 2025 at 04:31:58PM +0100, James Clark wrote:

[...]

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
> +

An important thing is about sequence:
As described in arm_spe_pmu_disable_and_drain_local(), should we always
clear ELs bits in PMSCR_EL1 before clear PMBLIMITR_EL1.E bit? As a
reference, we could see TRBE always clear ELx bits before disable trace
buffer.

And a trivial flaw:

If the TRUNCATED flag has been set, the irq_work_run() above runs the
IRQ work to invoke the arm_spe_pmu_stop() to disable trace buffer, which
clear SYS_PMBLIMITR_EL1.E bit. This is why the current code does not
explictly clear SYS_PMBLIMITR_EL1.E bit.

With this patch, the interrupt handler will clear SYS_PMBLIMITR_EL1.E
bit twice for a trunacated case.


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

I am a bit suspecious we can remove this isb().

As a reference to the software usage PKLXF in Arm ARM (DDI 0487 L.a),
after enable TRBE trace unit, an ISB is mandatory. Maybe check a bit
for this?

Thanks,
Leo

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
> 

