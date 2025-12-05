Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066B9D2CE1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 04:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ltcldI0o6DV1qdYyxuhmS7rkz02+SecPG9+6u3ng6I=; b=G92k5WFVZ6s0e+6WE+4R+f/0Xr
	5UM1NM4MGnrVVunVZGymiAB2dW6L7vIoAqsarxs4xtJYYpqmA+lH1072cYQHWwDURmibghZyqBr8A
	Fl1qKQyU9lqXhzvPydaY0b/AFEzpx87TC7qIsNUqc1WryxP2dabHgE307qZBaCmGssFlx/58EVl4B
	y2qh0mVJSJjjipt9fiQ//bcSFrdcaJcluyDF4VDirTrN+wkDo0fZuTJ+wSU2C8uxBKVQ+RUyONVih
	vboNalxvOrs7mb+Y07+9IopWpNpPKW1gzifDAQG3jlObk2zNVWmqUVl/6t3xt3z8yrEmkbowDNNIT
	g0ngKRig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRN9c-000000090R3-1g98;
	Fri, 05 Dec 2025 04:10:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRN9Z-000000090QW-1EbJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 04:10:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A61F7339;
	Thu,  4 Dec 2025 20:10:34 -0800 (PST)
Received: from [10.163.52.42] (unknown [10.163.52.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C7D03F86F;
	Thu,  4 Dec 2025 20:10:36 -0800 (PST)
Message-ID: <ae63c69c-eff9-4665-a9a6-d395e61bea86@arm.com>
Date: Fri, 5 Dec 2025 09:40:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/19] coresight: trbe: Refactor syndrome decoding
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Tamas Petz <tamas.petz@arm.com>,
 Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
 <20251201-trbe_buffer_refactor_v1-1-v1-6-7da32b076b28@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-6-7da32b076b28@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_201045_432288_43386273 
X-CRM114-Status: GOOD (  28.36  )
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

On 01/12/25 4:51 PM, Leo Yan wrote:
> It gives priority to TRBSR_EL1.EA (external abort); an external abort
> will immediately bail out and return an error.

This is an abrupt starting for a commit message without giving context.
The rationale for the change needs to be explained rather than details
of implementation.

> 
> Next, the syndrome decoding is refactored based on two levels of
> information: the EC (Event Class) bits and the BSC (Trace Buffer Status
> Code) bits.
> 
> If TRBSR_EL1.EC==0b000000, the driver continues parsing TRBSR_EL1.BSC to
> identify the specific trace buffer event.  Otherwise, any non-zero
> TRBSR_EL1.EC is treated as an error.
> 
> For error cases, the driver prints an error string and dumps registers
> for debugging.
> 
> No additional checks are required for wrap mode beyond verifying the
> TRBSR_EL1.WRAP bit, even on units with overwrite errata, as this bit
> reliably indicates a buffer wrap.

Should the errata related changes be done in a separate patch instead ?

> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-trbe.c | 60 +++++++++++++++++++++-------
>  drivers/hwtracing/coresight/coresight-trbe.h |  8 ++--
>  2 files changed, 51 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 9e565122816949b37b8ff5e4ba04cfbc317c6f25..28e2bfa68074f19ccaa4a737d00af577aea818fe 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -643,29 +643,61 @@ static void trbe_enable_hw(struct trbe_buf *buf)
>  static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *handle,
>  						 u64 trbsr)
>  {
> +	const char *err_str;
>  	int ec = get_trbe_ec(trbsr);
>  	int bsc = get_trbe_bsc(trbsr);
> -	struct trbe_buf *buf = etm_perf_sink_config(handle);
> -	struct trbe_cpudata *cpudata = buf->cpudata;
>  
>  	WARN_ON(is_trbe_running(trbsr));
> -	if (is_trbe_trg(trbsr) || is_trbe_abort(trbsr))
> -		return TRBE_FAULT_ACT_FATAL;
>  
> -	if ((ec == TRBE_EC_STAGE1_ABORT) || (ec == TRBE_EC_STAGE2_ABORT))
> -		return TRBE_FAULT_ACT_FATAL;
> +	if (is_trbe_abort(trbsr)) {
> +		err_str = "External abort";
> +		goto out_fatal;
> +	}
>  
> -	/*
> -	 * If the trbe is affected by TRBE_WORKAROUND_OVERWRITE_FILL_MODE,
> -	 * it might write data after a WRAP event in the fill mode.
> -	 * Thus the check TRBPTR == TRBBASER will not be honored.
> -	 */
> -	if ((is_trbe_wrap(trbsr) && (ec == TRBE_EC_OTHERS) && (bsc == TRBE_BSC_FILLED)) &&
> -	    (trbe_may_overwrite_in_fill_mode(cpudata) ||
> -	     get_trbe_write_pointer() == get_trbe_base_pointer()))
> +	switch (ec) {
> +	case TRBE_EC_OTHERS:
> +		break;

No message for this ?

> +	case TRBE_EC_BUF_MGMT_IMPL:
> +		err_str = "Unexpected implemented management";
> +		goto out_fatal;
> +	case TRBE_EC_GP_CHECK_FAULT:
> +		err_str = "Granule Protection Check fault";
> +		goto out_fatal;
> +	case TRBE_EC_STAGE1_ABORT:
> +		err_str = "Stage 1 data abort";
> +		goto out_fatal;
> +	case TRBE_EC_STAGE2_ABORT:
> +		err_str = "Stage 2 data abort";
> +		goto out_fatal;
> +	default:
> +		err_str = "Unknown error code";
> +		goto out_fatal;
> +	}
> +
> +	switch (bsc) {
> +	case TRBE_BSC_NOT_STOPPED:
> +		break;
> +	case TRBE_BSC_FILLED:
> +		break;
> +	case TRBE_BSC_TRIGGERED:
> +		err_str = "Unexpected trigger status";
> +		goto out_fatal;
> +	default:
> +		err_str = "Unexpected buffer status code";
> +		goto out_fatal;
> +	}

Just wondering if it would be cleaner to add a const char * based
static array mapping these EC/BSC codes with above error messages.
 
> +
> +	if (is_trbe_wrap(trbsr))

But what about TRBE affected with trbe_may_overwrite_in_fill_mode()
is that still being taken care of some how ?

>  		return TRBE_FAULT_ACT_WRAP;
>  
>  	return TRBE_FAULT_ACT_SPURIOUS;
> +
> +out_fatal:
> +	pr_err_ratelimited("%s on CPU %d [TRBSR=0x%016llx, TRBPTR=0x%016llx, TRBLIMITR=0x%016llx]\n",
> +			   err_str, smp_processor_id(), trbsr,
> +			   read_sysreg_s(SYS_TRBPTR_EL1),
> +			   read_sysreg_s(SYS_TRBLIMITR_EL1));

Right - comprehensive TRBE configuration register dump when a fatal
error happens.

> +	return TRBE_FAULT_ACT_FATAL;
>  }
>  
>  static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.h b/drivers/hwtracing/coresight/coresight-trbe.h
> index 45202c48accec7c86ba56130e2737bc2d1830fae..d7f7cd763c0c7139cf322b7336ee563073e3bea0 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.h
> +++ b/drivers/hwtracing/coresight/coresight-trbe.h
> @@ -35,9 +35,11 @@ static inline bool is_trbe_enabled(void)
>  	return trblimitr & TRBLIMITR_EL1_E;
>  }
>  
> -#define TRBE_EC_OTHERS		0
> -#define TRBE_EC_STAGE1_ABORT	36
> -#define TRBE_EC_STAGE2_ABORT	37
> +#define TRBE_EC_OTHERS			0x0
> +#define TRBE_EC_GP_CHECK_FAULT		0X1e
> +#define TRBE_EC_BUF_MGMT_IMPL		0x1f
> +#define TRBE_EC_STAGE1_ABORT		0x24
> +#define TRBE_EC_STAGE2_ABORT		0x25

Please do mention the document source for these new EC codes in the
commit message.

>  
>  static inline int get_trbe_ec(u64 trbsr)
>  {
> 


