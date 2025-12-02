Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004F2CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 12:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjvXFl+YDPwNn37ZKCQYR1cgKQu3GtTxv4a8M91x/24=; b=bjXs7DcB3lvmohiVHDgubhow5n
	DGc8XhV3GaLl7+WMb9AzSSABh2QqsUkPYLVwE+IdJpI1PA6UcSBLQISdRihlsG+IX4JJxZRlgTDtR
	CA2ZtGDcb4l1Oz05fjO0229Zke63u3Z4AbxpVRf5tgVw8c4BBMB0RAN4Lia8n/8ki0bdn9KLUfJfY
	hNdv8sBypr8GbsQCsCMAvcz3JFuFS8CXVTE9XzopQNdjPfnPtJbzfNyG5av6iBf299pmtBfd38m8y
	FxedHZ8h2HR6axEfxL4XwjVOrBRrzWdy2h3Griw7FIfHVhZHqSr7oIpLeAbbxySemLs3VLqw306ZI
	ZntrrBCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQPDB-00000005MMq-1hNV;
	Tue, 02 Dec 2025 12:10:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQPD9-00000005MMT-12PQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 12:10:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3456153B;
	Tue,  2 Dec 2025 04:10:18 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BD723F73B;
	Tue,  2 Dec 2025 04:10:23 -0800 (PST)
Message-ID: <47da45df-b75f-46e8-9839-97d869b43afc@arm.com>
Date: Tue, 2 Dec 2025 12:10:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/19] coresight: trbe: Add static key for bypassing
 trigger mode
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
 <20251201-trbe_buffer_refactor_v1-1-v1-15-7da32b076b28@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-15-7da32b076b28@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_041027_336556_8FDD8A1B 
X-CRM114-Status: GOOD (  19.21  )
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
> To avoid complexity, if any CPU in the system has the fill mode erratum,
> the driver will not use trigger mode, it simply rolls back to fill mode
> only and apply the workaround on it.
> 
> Add a static key to control trigger mode bypassing.  During each CPU
> probe, the key is enabled when the relevant erratum is detected.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 941aa46e9b11f60c707eb40093964de454a3fd83..8390d0a8fe23d35945610df15f21751279ee37ee 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -17,6 +17,7 @@
>   
>   #include <asm/barrier.h>
>   #include <asm/cpufeature.h>
> +#include <linux/jump_label.h>
>   #include <linux/kvm_host.h>
>   #include <linux/vmalloc.h>
>   
> @@ -147,6 +148,12 @@ struct trbe_drvdata {
>   	struct platform_device *pdev;
>   };
>   
> +DEFINE_STATIC_KEY_FALSE(trbe_trigger_mode_bypass);
> +
> +#define trbe_trigger_mode_need_bypass(cpudata)		\
> +	(trbe_may_overwrite_in_fill_mode((cpudata)) ||	\
> +	 trbe_may_write_out_of_range((cpudata)))
> +

Please make that a static inline function.

>   static void trbe_check_errata(struct trbe_cpudata *cpudata)
>   {
>   	int i;
> @@ -1306,6 +1313,14 @@ static void arm_trbe_register_coresight_cpu(struct trbe_drvdata *drvdata, int cp
>   
>   	dev_set_drvdata(&trbe_csdev->dev, cpudata);
>   	coresight_set_percpu_sink(cpu, trbe_csdev);
> +
> +	/*
> +	 * If any CPU cannot use trigger mode, bypass the mode globally for
> +	 * consistent tracing behaviour.
> +	 */
> +	if (trbe_trigger_mode_need_bypass(cpudata))
> +		static_branch_enable(&trbe_trigger_mode_bypass);

You only need to enable this once, not for every CPU.

Suzuki


> +
>   	return;
>   cpu_clear:
>   	cpumask_clear_cpu(cpu, &drvdata->supported_cpus);
> 


