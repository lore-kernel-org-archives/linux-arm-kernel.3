Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9596BCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 11:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhCWTM6Ii1l6S2oe3XXgHuHZrpzLjARW8ZxcE2WzEfI=; b=qDRXqlc1mzuNDJF0hfy5TWDBGt
	2IqxvN5aQouneIISeFHBPUNhqMic5VWLxcSmYTisebXNI3Xu7GCd/56c7mmDljKVWlcTxJfGwTVwR
	pQjzcD//E3s7Wz5Oh/DgpHFgPQDJykcgiufzTAifHdjFrdXVbAfOIyL706MD0bbr0iRSarwHKZP4e
	iwBryjkELdOnV8Ytb+Tiw7FWc3oRb7f6mwXVEbM6AcvUuPICgYdyuPKhiSCG74xJVegtW6RljNnWx
	cGy1FTBHa7fOBZK09WNRyVf5kLaMK6yPFf2BnCPLjPyjnHyJmrhCKa07EeRcJL6Fg4AWrhYf2NABV
	zjx7KZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQOMM-00000005Ive-04g7;
	Tue, 02 Dec 2025 11:15:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQOMK-00000005IvG-0yQ5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 11:15:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF76E153B;
	Tue,  2 Dec 2025 03:15:43 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DD7F3F59E;
	Tue,  2 Dec 2025 03:15:48 -0800 (PST)
Message-ID: <e315b489-2ebf-4ab6-8a60-347f1b1dca16@arm.com>
Date: Tue, 2 Dec 2025 11:15:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/19] coresight: trbe: Refactor AUX flag setting
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Tamas Petz <tamas.petz@arm.com>,
 Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
 <20251201-trbe_buffer_refactor_v1-1-v1-7-7da32b076b28@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-7-7da32b076b28@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_031552_431740_AA46F960 
X-CRM114-Status: GOOD (  24.70  )
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

On 01/12/2025 11:21, Leo Yan wrote:
> Rather than spreading AUX flag setting in different functions, use
> trbe_get_fault_act() as a central place for setting the flag.
> 
> Later we will support WRAP mode with continuous trace, so the WRAP
> event does not necessarily cause the trace discontinuity, change to
> check the stop status instead.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 38 +++++++++++++---------------
>   1 file changed, 17 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 28e2bfa68074f19ccaa4a737d00af577aea818fe..b06885a08e082fd34f68d9588518807b5c47c86e 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -265,25 +265,6 @@ static void trbe_reset_local(struct trbe_cpudata *cpudata)
>   	write_sysreg_s(0, SYS_TRBSR_EL1);
>   }
>   
> -static void trbe_report_wrap_event(struct perf_output_handle *handle)
> -{
> -	/*
> -	 * Mark the buffer to indicate that there was a WRAP event by
> -	 * setting the COLLISION flag. This indicates to the user that
> -	 * the TRBE trace collection was stopped without stopping the
> -	 * ETE and thus there might be some amount of trace that was
> -	 * lost between the time the WRAP was detected and the IRQ
> -	 * was consumed by the CPU.
> -	 *
> -	 * Setting the TRUNCATED flag would move the event to STOPPED
> -	 * state unnecessarily, even when there is space left in the
> -	 * ring buffer. Using the COLLISION flag doesn't have this side
> -	 * effect. We only set TRUNCATED flag when there is no space
> -	 * left in the ring buffer.
> -	 */
> -	perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
> -}
> -
>   static void trbe_truncate_event(struct perf_output_handle *handle)
>   {
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
> @@ -687,6 +668,23 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
>   		goto out_fatal;
>   	}
>   
> +	/*
> +	 * Mark the buffer to indicate that there was a WRAP event by
> +	 * setting the COLLISION flag. This indicates to the user that
> +	 * the TRBE trace collection was stopped without stopping the
> +	 * ETE and thus there might be some amount of trace that was
> +	 * lost between the time the WRAP was detected and the IRQ
> +	 * was consumed by the CPU.
> +	 *
> +	 * Setting the TRUNCATED flag would move the event to STOPPED
> +	 * state unnecessarily, even when there is space left in the
> +	 * ring buffer. Using the COLLISION flag doesn't have this side
> +	 * effect. We only set TRUNCATED flag when there is no space
> +	 * left in the ring buffer.
> +	 */
> +	if (!is_trbe_running(trbsr))

Is this really required ? There is a WARN_ON(is_trbe_running(trbsr))
above ?

> +		perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);

Also, setting this would unnecessarily mark COLLISION while stopping the
TRBE buffer normally (when called from arm_trbe_update_buffer), when
there is no WRAP event ?


> +
>   	if (is_trbe_wrap(trbsr))
>   		return TRBE_FAULT_ACT_WRAP;

Couldn't this be :

	/* Move the big fat comment here */
	if (is_trbe_wrap(trbsr)) {
		perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
		return TRBE_FAULT_ACT_WRAP;
	}

Suzuki



