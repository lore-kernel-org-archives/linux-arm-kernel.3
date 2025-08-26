Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD87CA0FEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 15:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWs3lajoANFG2rC/+GafuPrLOnPSD5jWhWk8n9ijiXo=; b=aYh8II2QtpdjO74i0Rlh6lvy6k
	GB6bhGL2G4Kee1vnN16f1gwJSje9LUkAuDu8Zzj2CgmRBDzF74qDCU13F60yLv4kh/EhwWYEWo8G7
	BEa1aW9T/wTB9w2CtMOftK+gfmpl4045w08w83D3rMx7HFPyj35HLWCZaXNvtXgoVI3KTnnikWxmf
	Pah1bj9WWTP/QxGgnKYgs+5rU+yUJQEhPsR93goOD3uBMDqEHBPyWdm8lJxaD5kYagHTOqlqPnUTw
	jfVI/+jUMxf2pVMj+IKrSrewnVe1s55+bj/nSmuozdzvATflE4w2tTQhSfLFg175iE7a5nxhtlPd5
	avDbUI7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqw2Z-0000000CXle-1e8p;
	Tue, 26 Aug 2025 15:56:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqvzo-0000000CWzP-0w3U;
	Tue, 26 Aug 2025 15:54:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39F0B1A25;
	Tue, 26 Aug 2025 08:53:54 -0700 (PDT)
Received: from [10.57.4.86] (unknown [10.57.4.86])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8041A3F694;
	Tue, 26 Aug 2025 08:53:54 -0700 (PDT)
Message-ID: <983df32a-ba74-421d-bc20-06e778b4d2c9@arm.com>
Date: Tue, 26 Aug 2025 16:53:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/19] perf: Introduce positive capability for sampling
To: Leo Yan <leo.yan@arm.com>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 mark.rutland@arm.com, acme@kernel.org, namhyung@kernel.org,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, kan.liang@linux.intel.com,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, coresight@lists.linaro.org,
 iommu@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <cover.1755096883.git.robin.murphy@arm.com>
 <ae81cb65b38555c628e395cce67ac6c7eaafdd23.1755096883.git.robin.murphy@arm.com>
 <20250826131124.GB745921@e132581.arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250826131124.GB745921@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_085404_355518_3E337AE0 
X-CRM114-Status: GOOD (  21.90  )
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

On 2025-08-26 2:11 pm, Leo Yan wrote:
> On Wed, Aug 13, 2025 at 06:01:08PM +0100, Robin Murphy wrote:
>> Sampling is inherently a feature for CPU PMUs, given that the thing
>> to be sampled is a CPU context. These days, we have many more
>> uncore/system PMUs than CPU PMUs, so it no longer makes much sense to
>> assume sampling support by default and force the ever-growing majority
>> of drivers to opt out of it (or erroneously fail to). Instead, let's
>> introduce a positive opt-in capability that's more obvious and easier to
>> maintain.
> 
> [...]
> 
>> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
>> index 369e77ad5f13..dbd52851f5c6 100644
>> --- a/drivers/perf/arm_spe_pmu.c
>> +++ b/drivers/perf/arm_spe_pmu.c
>> @@ -955,7 +955,8 @@ static int arm_spe_pmu_perf_init(struct arm_spe_pmu *spe_pmu)
>>   	spe_pmu->pmu = (struct pmu) {
>>   		.module = THIS_MODULE,
>>   		.parent		= &spe_pmu->pdev->dev,
>> -		.capabilities	= PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP_ITRACE,
>> +		.capabilities	= PERF_PMU_CAP_SAMPLING |
>> +				  PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP_ITRACE,
>>   		.attr_groups	= arm_spe_pmu_attr_groups,
>>   		/*
>>   		 * We hitch a ride on the software context here, so that
> 
> The change in Arm SPE driver looks good to me.
> 
> I noticed you did not set the flag for other AUX events, like Arm
> CoreSight, Intel PT and bts. The drivers locate in:
> 
>    drivers/hwtracing/coresight/coresight-etm-perf.c
>    arch/x86/events/intel/bts.c
>    arch/x86/events/intel/pt.c
> 
> Genearlly, AUX events generate interrupts based on AUX ring buffer
> watermark but not the period. Seems to me, it is correct to set the
> PERF_PMU_CAP_SAMPLING flag for them.

This cap is given to drivers which handle event->attr.sample_period and 
call perf_event_overflow() - or in a few rare cases, 
perf_output_sample() directly - to do something meaningful with it, 
since the intent is to convey "I properly handle events for which 
is_sampling_event() is true". My understanding is that aux events are 
something else entirely, but I'm happy to be corrected.

Otherwise, perhaps this suggests it deserves to be named a little more 
specifically for clarity, maybe PERF_CAP_SAMPLING_EVENTS?

Thanks,
Robin.

> A special case is Arm CoreSight legacy sinks (like ETR/ETB, etc)
> don't has interrupt. We might need set or clear the flag on the fly
> based on sink type:
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index f1551c08ecb2..404edc94c198 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -433,6 +433,11 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>          if (!sink)
>                  goto err;
>   
> +       if (coresight_is_percpu_sink(sink))
> +               event->pmu.capabilities = PERF_PMU_CAP_SAMPLING;
> +       else
> +               event->pmu.capabilities &= ~PERF_PMU_CAP_SAMPLING;
> +
> 
> Thanks,
> Leo


