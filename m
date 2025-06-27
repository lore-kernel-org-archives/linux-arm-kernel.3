Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC92C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 11:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9hrPwmjnSB6AWXdVtBkaHk5BH94FzY2JHSeVWztRvQ=; b=ukGgXBvkaDNAGy7eIsokcyOQQa
	uFIKZmJO8ViUtoVMQXyEyQDfI35U/Nzpbw8wFtBstGzvxwInKuOxcIgjHhCpplGvgCtDqT12/PrPh
	tACHd9tTEIkfc5/NprL10JKecpzO3VxuFnvT7dCE7G9V9A/5UC/NwBP0nfp/bfyoFXCAycroI3VYZ
	CU3JWa/g4YDcHYrmxBPN2uJmpXvfAxoIknPpVVqDs7KpX1J9DV+Ylt/E4JxTkvdb44YBuYJdmBfKy
	Ow6sOKINzDnSnXaUGx9KKo6+/wJFI020ykYfA1/yrHBhiQ/ujapPIsWAroJrJ2Dgso3HKklqyzogf
	kyCk/8Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7Uz-0000000EWwZ-21lw;
	Fri, 27 Jun 2025 11:44:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7Rw-0000000EWQ5-1eAJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 11:40:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E4A31A00;
	Fri, 27 Jun 2025 04:40:36 -0700 (PDT)
Received: from [10.163.36.129] (unknown [10.163.36.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B0AA3F66E;
	Fri, 27 Jun 2025 04:40:51 -0700 (PDT)
Message-ID: <2996edbb-1223-4795-921b-fd86a4dc3f88@arm.com>
Date: Fri, 27 Jun 2025 17:10:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] perf: arm_spe: Relax period restriction
To: Leo Yan <leo.yan@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org
Cc: James Clark <james.clark@linaro.org>
References: <20250627091659.3316899-1-leo.yan@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250627091659.3316899-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_044056_490669_ECE79624 
X-CRM114-Status: GOOD (  21.22  )
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

On 27/06/25 2:46 PM, Leo Yan wrote:
> The minimum interval specified the PMSIDR_EL1.Interval field is a
> hardware recommendation. However, this value is set by hardware designer
> before the production. It may not accurately reflects actual hardware
> limitations, and tools currently have no way to test shorter periods.
> 
> This change relaxes the limitation by allowing any non-zero periods.
> This gives chance for experimenting smaller periods.

Is this going to be safe on all SPE implementations ?

> 
> The downside is that small periods may increase the risk of AUX ring
> buffer overruns. When an overrun occurs, the perf core layer will
> trigger an irq work to disable the event and wake up the tool in user
> space to read the trace data. After the tool finishes reading, it will
> re-enable the AUX event.
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/perf/arm_spe_pmu.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index 3efed8839a4e..e40e5daa838d 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -308,12 +308,16 @@ static u64 arm_spe_event_to_pmscr(struct perf_event *event)
>  
>  static void arm_spe_event_sanitise_period(struct perf_event *event)
>  {
> -	struct arm_spe_pmu *spe_pmu = to_spe_pmu(event->pmu);
>  	u64 period = event->hw.sample_period;
>  	u64 max_period = PMSIRR_EL1_INTERVAL_MASK;
>  
> -	if (period < spe_pmu->min_period)
> -		period = spe_pmu->min_period;
> +	/*
> +	 * As per the Arm ARM (DDI 0487 L.a), section D24.7.12 PMSIRR_EL1,
> +	 * Sampling Interval Reload Register, the INTERVAL field (bits [31:8])
> +	 * states: "Software must set this to a nonzero value."
> +	 */The motivation (as explained in the commit message) for using arch permitted
minimum value instead of the recommended (PMSIDR_EL1.Interval) value, should
be explained in the comment here as well.

> +	if (period < FIELD_PREP(PMSIRR_EL1_INTERVAL_MASK, 1))
> +		period = FIELD_PREP(PMSIRR_EL1_INTERVAL_MASK, 1);
Given that FIELD_PREP(PMSIRR_EL1_INTERVAL_MASK, 1) is a constant - should
not it be defined as a macro e.g PMSIRR_EL1_MINIMUM_INTERVAL or something
similar instead of deriving it twice.

>  	else if (period > max_period)
>  		period = max_period;
>  	else


