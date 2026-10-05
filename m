Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21312CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 15:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQRqsPkAurv75//9Ydzt6MLOTRi0qmx6e8kNQi45+44=; b=jq4u8vl94jkkLdO7Kz1Jav1et3
	L5l3/sLHbHcCioIIbXNyx+vBxGVxD3917NJIr4Lee0sr3wLJKdR1o16lnpy6h4OjNh1WIZRMb4dMF
	g3HeuAVD+TR5X4lCR35WWL4HwdxYKdWVcrQ+EzMtprt0ubFoOzpd/cq0Xg5JGWoRJH3aDXBuNu9N9
	TfZkW8jUORoWg+89vRuuEzIFgo+U25Y0YZ7GrBfDpUKWEwyiLic9cdAwabDjlni4PDPdZlG2NJ3ej
	8So+JDb+wGiPf+oM1XDk8qgPFGyH2NdhJLp4Kq6RKgc/2k3ufLvFD6zu9J3FAI2xeqeRJ4ZtqOaOH
	ySe+65Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDktS-0000000Gmon-3pzK;
	Mon, 05 Oct 2026 15:46:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDktN-0000000Gmm5-1W0G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 15:46:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEDD4152B;
	Mon,  5 Oct 2026 08:46:12 -0700 (PDT)
Received: from [10.57.9.139] (unknown [10.57.9.139])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74EF93F66F;
	Mon,  5 Oct 2026 08:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791215176; bh=xGeq5sjx9eaLEDMjBTfqpruQ01UNAsCYZ0+dN1RMZXQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KOzJIn+bGIW6NU1Xx33KHwE/5cj0DOGw8D6P2vU6AiCyEd9gjEZKpAyDDFsJiKR4U
	 uR7cHNQriGaf6hzMGPgFd26YhcjpHY5T+bX9++s+XDiJBKb65r9abfpweJ0M6CbCUK
	 v0RV+vxW/Vr0peIfIesWvkrxuiuFTYoepguQOZ6I=
Message-ID: <254599ef-ace5-423b-bc31-56150909d96f@arm.com>
Date: Mon, 5 Oct 2026 17:46:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] perf/core: Return errors from
 perf_report_aux_output_id()
Content-Language: en-GB
To: James Clark <james.clark@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@arm.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20261001-james-cs-retry-hw_id-v1-0-4d45ab46cde7@linaro.org>
 <20261001-james-cs-retry-hw_id-v1-1-4d45ab46cde7@linaro.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261001-james-cs-retry-hw_id-v1-1-4d45ab46cde7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_084618_344681_259EE716 
X-CRM114-Status: GOOD (  17.50  )
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

Hi Peter, Arnaldo, Mark, Ingo et al



On 01/10/2026 15:21, James Clark wrote:
> It's useful to know if this failed or not so a retry can be attempted
> later. Return the error code or success.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>   include/linux/perf_event.h | 2 +-
>   kernel/events/core.c       | 6 ++++--
>   2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 48d851fbd8ea..01d318a4de50 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1896,7 +1896,7 @@ static inline struct fasync_struct **perf_event_fasync(struct perf_event *event)
>   }
>   
>   extern void perf_event_addr_filters_sync(struct perf_event *event);
> -extern void perf_report_aux_output_id(struct perf_event *event, u64 hw_id);
> +extern int perf_report_aux_output_id(struct perf_event *event, u64 hw_id);

This looks a trivial change with minor impact. Are you happy for me to
pull this via the coresight tree ? Please could I have an Ack on this ?


Cheers
Suzuki
>   
>   extern int perf_output_begin(struct perf_output_handle *handle,
>   			     struct perf_sample_data *data,
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index d7f3e2c2ecb1..232da3b6f393 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -10563,7 +10563,7 @@ static void perf_log_itrace_start(struct perf_event *event)
>   	perf_output_end(&handle);
>   }
>   
> -void perf_report_aux_output_id(struct perf_event *event, u64 hw_id)
> +int perf_report_aux_output_id(struct perf_event *event, u64 hw_id)
>   {
>   	struct perf_output_handle handle;
>   	struct perf_sample_data sample;
> @@ -10585,12 +10585,14 @@ void perf_report_aux_output_id(struct perf_event *event, u64 hw_id)
>   	ret = perf_output_begin(&handle, &sample, event, rec.header.size);
>   
>   	if (ret)
> -		return;
> +		return ret;
>   
>   	perf_output_put(&handle, rec);
>   	perf_event__output_id_sample(event, &handle, &sample);
>   
>   	perf_output_end(&handle);
> +
> +	return 0;
>   }
>   EXPORT_SYMBOL_GPL(perf_report_aux_output_id);
>   
> 


