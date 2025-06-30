Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BA1C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 05:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLSQ1ZPl2hlzwiP0TTFNenQzYQCYOeEdeV8G9/v6pa0=; b=YzVGQP6OnQe9+Fbg1jUsuYywn6
	E0yco8SkNFuEAA93rGb/u3+qTPL+hWdq+0LlZGo0mTm09Cx5tABUsurK4kePMGlWy73gT13u7le1n
	MzEeqQdgj/HbWNaMwrYjwShPdy1bs/146ug1pBwpwvK9qK5a2TKifmk02DQLFsKQQBdoU8Dzc5Gu3
	ZpVxPAdbuv52t2Jr9maXLTVDLGilH4wjje/UZH4zxWICrvet+0Q/A252LMv5P63xDpMyJlWKXn37n
	tk1HmgQ2NAxL0a/x5XgjNRNa6wy3QG7m+gWNcD3aHokAc1Pavz4e5YRgNMwlVnbbuflzd7v5E9atT
	PYOyCK2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW6q2-00000001FJJ-0Oqm;
	Mon, 30 Jun 2025 05:13:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW6ma-00000001F4a-0khk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 05:10:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61ABB1F60;
	Sun, 29 Jun 2025 22:10:03 -0700 (PDT)
Received: from [10.163.37.132] (unknown [10.163.37.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33BDC3F6A8;
	Sun, 29 Jun 2025 22:10:16 -0700 (PDT)
Message-ID: <bb7e5014-a32a-4630-b01f-9a74969c804f@arm.com>
Date: Mon, 30 Jun 2025 10:40:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] perf: arm_spe: Relax period restriction
To: Leo Yan <leo.yan@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, James Clark <james.clark@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org
References: <20250627163028.3503122-1-leo.yan@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250627163028.3503122-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_221020_260776_ABBB0E70 
X-CRM114-Status: GOOD (  22.76  )
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

On 27/06/25 10:00 PM, Leo Yan wrote:
> The minimum interval specified the PMSIDR_EL1.Interval field is a
> hardware recommendation. However, this value is set by hardware designer
> before the production. It is not actual hardware limitation but tools
> currently have no way to test shorter periods.
> 
> This change relaxes the limitation by allowing any non-zero periods,
> with simplifying code with clamp_t().
> 
> The downside is that small periods may increase the risk of AUX ring
> buffer overruns. When an overrun occurs, the perf core layer will
> trigger an irq work to disable the event and wake up the tool in user
> space to read the trace data. After the tool finishes reading, it will
> re-enable the AUX event.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
> 
> Changes from v2:
> - Updated comment for the difference between minimum interval
>   recommendation and hardware limitation (Anshuman).
> - Refactored with clamp_t().
> - Removed review tag as the refactoring.
> 
>  drivers/perf/arm_spe_pmu.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index 3efed8839a4e..369e77ad5f13 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -308,17 +308,21 @@ static u64 arm_spe_event_to_pmscr(struct perf_event *event)
>  
>  static void arm_spe_event_sanitise_period(struct perf_event *event)
>  {
> -	struct arm_spe_pmu *spe_pmu = to_spe_pmu(event->pmu);
>  	u64 period = event->hw.sample_period;
>  	u64 max_period = PMSIRR_EL1_INTERVAL_MASK;
>  
> -	if (period < spe_pmu->min_period)
> -		period = spe_pmu->min_period;
> -	else if (period > max_period)
> -		period = max_period;
> -	else
> -		period &= max_period;
> +	/*
> +	 * The PMSIDR_EL1.Interval field (stored in spe_pmu->min_period) is a
> +	 * recommendation for the minimum interval, not a hardware limitation.
> +	 *
> +	 * According to the Arm ARM (DDI 0487 L.a), section D24.7.12 PMSIRR_EL1,
> +	 * Sampling Interval Reload Register, the INTERVAL field (bits [31:8])
> +	 * states: "Software must set this to a nonzero value". Use 1 as the
> +	 * minimum value.
> +	 */
> +	u64 min_period = FIELD_PREP(PMSIRR_EL1_INTERVAL_MASK, 1);
>  
> +	period = clamp_t(u64, period, min_period, max_period) & max_period;
>  	event->hw.sample_period = period;
>  }
>  

