Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C70D2CDE3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 04:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NCGGMRgXFwoB+/O8Ag1a06NOwL9qJIcxpoSFTEUSgvA=; b=g5WcQHEYRsoxagjDAQeZ3nh4Tu
	pIcu8ZK1PC9xhGdedKD/XLDV70KmAMhx9jkFn8cgiUdqQdZzy6Bl1tljOCr8j0MxH61cOVmZOPp14
	1zEoFASoukw+68IwDKH3qRTqlrjVtjzLZ9uRL6kOC4NsUhV9XBdGURieMjyvPMouOvCLdSo4InODc
	fYbvP293q8j+SrlbmpBQku8wGmN7ruyev7R5UI3DppntVwp2/EHxGR7Hwh0LGQ7pCqBSJg2aexOZO
	05QwPyFyEmKY9iqwmgg5EL6oM2DAjz6SVhIWlZTghGya/kRgGh8vYtYJW5jwp1A8KNkHHjhSWIxFD
	2zRFu69w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRNk0-0000000922L-25It;
	Fri, 05 Dec 2025 04:48:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRNjy-0000000921u-2Zl4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 04:48:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9170B339;
	Thu,  4 Dec 2025 20:48:13 -0800 (PST)
Received: from [10.163.52.42] (unknown [10.163.52.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 321A23F86F;
	Thu,  4 Dec 2025 20:48:14 -0800 (PST)
Message-ID: <c22b084b-3853-405d-8b43-397786af7be9@arm.com>
Date: Fri, 5 Dec 2025 10:18:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/19] perf: cs-etm: Set watermark for AUX trace
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
 <20251201-trbe_buffer_refactor_v1-1-v1-19-7da32b076b28@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-19-7da32b076b28@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_204822_741516_2D9324A2 
X-CRM114-Status: GOOD (  14.32  )
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

On 01/12/25 4:52 PM, Leo Yan wrote:
> The default watermark is half of the total buffer size. In many cases,
> the tool can not be notified with sufficient free space, especially when
> profiling with small AUX buffer (e.g., 64KiB).

Could not smaller AUX buffer be prevented for TRBE instead ?

> > Setting watermark to quarter of the buffer to notifies the tool to read
> data earlier and prevents the data loss.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/perf/arch/arm/util/cs-etm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
> index ea891d12f8f40beebf8dee1d3db71cad701f5666..649b8b0d0f92b4af45fb97db9da3c5ccf24a978b 100644
> --- a/tools/perf/arch/arm/util/cs-etm.c
> +++ b/tools/perf/arch/arm/util/cs-etm.c
> @@ -424,6 +424,13 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
>  		pr_debug2("%s snapshot size: %zu\n", CORESIGHT_ETM_PMU_NAME,
>  			  opts->auxtrace_snapshot_size);
>  
> +	if (!opts->auxtrace_snapshot_mode && !opts->auxtrace_sample_mode) {
> +		size_t aw = opts->auxtrace_mmap_pages * (size_t)page_size / 4;
> +		u32 aux_watermark = aw > UINT_MAX ? UINT_MAX : aw;
> +
> +		cs_etm_evsel->core.attr.aux_watermark = aux_watermark;
> +	}
> +
>  	/*
>  	 * To obtain the auxtrace buffer file descriptor, the auxtrace
>  	 * event must come first.
> 


