Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34619D20680
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 12:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TjRPCXKx93O6s0+VRRmB6qbvgfcTph0rzx28MDwe14=; b=3EKDLUuNxMMBelCUG3YbBUefAv
	XhRR8cnfeVJ0efVkJ+mRecreV0ci71vbIrWzxDqlfpB9EQbgYaQvDW5aiSytiMky4xlpf3LrUcFCC
	I8rFTHWVX/P/SpoV6i+H9C/0gtyfbPl/LWmcPvScbh4n1K8b31zH9TQRW7DdMEucy6B6527L0uUAs
	T2IYcucI7GpY5ovrjKfVfYdlohy6e4td6Jt4JJ8OlMNQz3KV7OuR9GDWwY1sOzRGeXTid4BhXZKG+
	VuSfQNnwV6Zl3oBU+ULiyARdPSAKsvyvU9ndBjbqShw7HJZ0Km0vez48IUNMNLrS4VFpfKtTFnAGf
	XqCp1Sqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR8tv-000000080qh-29a0;
	Thu, 04 Dec 2025 12:57:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR8tt-000000080qI-0MZt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 12:57:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59344339;
	Thu,  4 Dec 2025 04:57:28 -0800 (PST)
Received: from [10.163.49.196] (unknown [10.163.49.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E5763F59E;
	Thu,  4 Dec 2025 04:57:30 -0800 (PST)
Message-ID: <fb3b495a-3e04-417f-a674-e1753fd85177@arm.com>
Date: Thu, 4 Dec 2025 18:27:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/19] coresight: trbe: Refactor status clearing
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
 <20251201-trbe_buffer_refactor_v1-1-v1-5-7da32b076b28@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-5-7da32b076b28@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_045737_191175_C4579773 
X-CRM114-Status: GOOD (  19.87  )
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
> If the driver does not clear the status when disabling the trace buffer
> unit, stale state will carry over to the next enable, though the driver
> clears it again on enable.

There is no problem now ! Because trbe_enable_hw() calls clr_trbe_status().

> 
> Explicitly clear status after the trace is disabled in the interrupt
> handling and when a perf session ends.  Keep the status for spurious
> interrupts for continuous tracing.

But is not that the behaviour already without this change ?

clr_trbe_status() in trbe_enable_hw() ensures that no TRBE session can be
started without first clearing the existing status. Still wondering what
is the purpose of this change ?

> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-trbe.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index e426991e2c2c398a9d3982e9d0f7f542e404cbab..9e565122816949b37b8ff5e4ba04cfbc317c6f25 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -629,7 +629,6 @@ static void trbe_enable_hw(struct trbe_buf *buf)
>  	WARN_ON(buf->trbe_hw_base < buf->trbe_base);
>  	WARN_ON(buf->trbe_write < buf->trbe_hw_base);
>  	WARN_ON(buf->trbe_write >= buf->trbe_limit);
> -	clr_trbe_status();
>  	set_trbe_base_pointer(buf->trbe_hw_base);
>  	set_trbe_write_pointer(buf->trbe_write);
>  
> @@ -1036,6 +1035,8 @@ static int arm_trbe_disable(struct coresight_device *csdev)
>  		return -EINVAL;
>  
>  	trbe_drain_and_disable_local(cpudata);
> +	clr_trbe_status();
> +
>  	buf->cpudata = NULL;
>  	cpudata->buf = NULL;
>  	cpudata->mode = CS_MODE_DISABLED;
> @@ -1151,6 +1152,10 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>  		return IRQ_NONE;
>  
>  	act = trbe_get_fault_act(handle, status);
> +
> +	if (act != TRBE_FAULT_ACT_SPURIOUS)
> +		clr_trbe_status();
> +
>  	switch (act) {
>  	case TRBE_FAULT_ACT_WRAP:
>  		truncated = !!trbe_handle_overflow(handle);
> 


