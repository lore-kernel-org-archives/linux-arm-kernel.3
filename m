Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF254D116F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 12:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bv6FNmQgXR9qpcczZxhW58dosw4Ft1+3/5wNm2tvsTw=; b=CBy9ja09y2ulLaqNT53pkEZZP1
	mCb6EJBUf01JmnG+jvIRHpVxCwLA4MC/obyKRAg58cP9/VFSqWLcYNdRgmSDdOwDz3B9ueNLlas2M
	dOkTnf5t4Nh48Vp/iskIwJAWoD41hZEoCVXmsPLrS+ox1/A/9faKsBsWY5kZzX0FAdJqlov4/MwhY
	rXupcl7UAlYrpfgy4QHNemiPSnXDSNersZGRZfBBXMSBAeoYGd7Gbr+lKtobDq4pG6YwKYQVdZT/2
	avRf7F1jj0hzfmawu+dCDc0l0jQTYESzElHBmkgk8fhkGVgIl53RUSKZcmM1LA6xQzrhxMwN9tWFS
	NLLY13PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQP3O-00000005Lhz-1rdY;
	Tue, 02 Dec 2025 12:00:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQP3L-00000005Lhc-3V2R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 12:00:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C2D6153B;
	Tue,  2 Dec 2025 04:00:11 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C13823F73B;
	Tue,  2 Dec 2025 04:00:16 -0800 (PST)
Message-ID: <be0b9b11-19d6-4d8c-910c-17773a4a2df0@arm.com>
Date: Tue, 2 Dec 2025 12:00:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/19] coresight: trbe: Always check fault action when
 updating buffer
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
 <20251201-trbe_buffer_refactor_v1-1-v1-10-7da32b076b28@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-10-7da32b076b28@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_040020_001780_0E5067C7 
X-CRM114-Status: GOOD (  22.30  )
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

On 01/12/2025 11:22, Leo Yan wrote:
> The current code checks the fault action only via the IRQ status bit,
> which is unreliable due to possible hardware latency.
> 
> Move the fault action check out of the IRQ status condition.  This also
> causes the buffer size to be calculated for non-WRAP and fault cases,
> which is fine since the write pointer is trusted for the calculation.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 17 +++--------------
>   1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index f56ecdeaa6596afb440e4d53732e08a85f9bf89d..e579ea98523c24d23a0cd265dcdd0a46b52b52da 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -806,7 +806,6 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>   	enum trbe_fault_action act;
>   	unsigned long size, status;
>   	unsigned long flags;
> -	bool wrap = false;
>   
>   	WARN_ON(buf->cpudata != cpudata);
>   	WARN_ON(cpudata->cpu != smp_processor_id());
> @@ -858,21 +857,11 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>   		 */
>   		clr_trbe_irq();
>   		isb();
> -
> -		act = trbe_get_fault_act(handle, status);
> -		/*
> -		 * If this was not due to a WRAP event, we have some
> -		 * errors and as such buffer is empty.
> -		 */
> -		if (act != TRBE_FAULT_ACT_WRAP) {
> -			size = 0;
> -			goto done;
> -		}
> -
> -		wrap = true;
>   	}
>   
> -	size = trbe_get_trace_size(handle, buf, wrap);
> +	act = trbe_get_fault_act(handle, status);

Also act is valid only when there is an IRQ ?

> +
> +	size = trbe_get_trace_size(handle, buf, act == TRBE_FAULT_ACT_WRAP);

We have certain assumptions in trbe_get_trace_size(), which may be
broken with this change.

e.g., if we get a fatal error, we don't detect that the buffer is empty
and may trigger a WARN_ON() on systems with CPU erratum as below ?

>         /*                                                                      
>          * If the TRBE is affected by the following erratum, we must fill           
>          * the space we skipped with IGNORE packets. And we are always          
>          * guaranteed to have at least a PAGE_SIZE space in the buffer.         
>          */                                                                     
>         if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE) &&
>             !WARN_ON(size < overwrite_skip))                                    
>                 __trbe_pad_buf(buf, start_off, overwrite_skip); 



Suzuki


>   
>   done:
>   	local_irq_restore(flags);
> 


