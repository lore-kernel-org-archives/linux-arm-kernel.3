Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A38CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 08:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbeyQcKhhxhIbq1F4R725oBZU9OLEYQ5nmWp6dn4A9M=; b=gS06mB/7w2MsiXDUJSazDZ8aLQ
	SLpUgSaZjInDeAbANN/8Ot8lRBgPeYDjkKcMX4g2VLYxj85ppoCNgSiOxeLUP7i7YRsewKTxBwlO4
	voOjzQHNw1E5gp7h1VAAvpT4EQT+1hmVBGkra+Q4HSloV1Pbr1HXsaUJGUKCHQ1hZD6zOO+vrvl+9
	d8xJsuM4EhWtJGJetNvnBVNoryQd9yff212OpQ1VIWzog/mb6h/830xUj1pmmoId2lqj/g/GxrLFJ
	u4U+2/WnUQD9QdDaGgK4eI9yRZhReSi6NsprKL1KnHtzJz2cVQoD/7IkM7NnxtMmYYG1xUXt1S1SW
	zxeiImbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Dq3-0000000HDJi-1F51;
	Thu, 02 Apr 2026 08:55:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Dq1-0000000HDJ8-1Adk
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 08:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DbeyQcKhhxhIbq1F4R725oBZU9OLEYQ5nmWp6dn4A9M=; b=VlYV7YRQu9qt9gegmmVPXI3YYd
	L4JqR0gAd6uEQh7zI3njEAsLbnSEvsyLpjJYwHBhoegnnYGpnDPsGjKuH9tUdEH+wJfPC0XXXd3hW
	Iy9CFcWyblETg9wEgPzssVti9CIJHK5DUF0nbzMHH4hLwXItfcSuMCA1uQAzQ9ObVqWpczrJLvoun
	N+LNRNKC5gORqIM8O0vUc03HbZ1M3MIf/iHZ8I4SrrnQnI3AC8RFqTZfw/gVSmFYaWNsQTboN6C88
	qyv7zN/z9wKw+wJdWqPi8kIH5vDCoUV0xy2Ti09+YtbQ4xTnQD8PhnIciUR/Btw/Feh2SbDxY23Fq
	k8s5YZkw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Dpr-000000024Ip-2s7n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 08:55:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 104361A25;
	Thu,  2 Apr 2026 01:55:23 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40C923F915;
	Thu,  2 Apr 2026 01:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775120128; bh=HUBoVHsckwO6N4latD6vOejzyFA+Rxg9Tizm48i3nxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TglQgoXhVei8xi7VkJgRQD4LLcnJIghnDPsGsJC3qjDyl8sSRmXf0S5hVfWnxP7UI
	 6ELdDHkz41GsDtQU7zU9SdK8/2/yYQ/cqG7S4MN75MGSlcWEUjHKH0dz/+Di29Sgvl
	 Uj0Rls8WDQLth/VQn87sJiFFiadjJxqvMIJqrb/Q=
Date: Thu, 2 Apr 2026 09:55:26 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] perf arm_spe: Make a function to get the MIDR
Message-ID: <20260402085526.GE356832@e132581.arm.com>
References: <20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org>
 <20260401-james-spe-impdef-decode-v1-1-ad0d372c220c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-james-spe-impdef-decode-v1-1-ad0d372c220c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_095534_668665_75147703 
X-CRM114-Status: GOOD (  22.90  )
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

On Wed, Apr 01, 2026 at 03:25:49PM +0100, James Clark wrote:
> We'll need the MIDR to dump IMPDEF events in the next commits so extract
> a function for it.
> 
> No functional changes intended.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  tools/perf/util/arm-spe.c | 36 ++++++++++++++++++++++--------------
>  1 file changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 70dd9bee47c7..7447b000f9cd 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -958,14 +958,9 @@ static void arm_spe__synth_memory_level(struct arm_spe_queue *speq,
>  	}
>  }
>  
> -static void arm_spe__synth_ds(struct arm_spe_queue *speq,
> -			      const struct arm_spe_record *record,
> -			      union perf_mem_data_src *data_src)
> +static int arm_spe__get_midr(struct arm_spe *spe, int cpu, u64 *midr)
>  {
> -	struct arm_spe *spe = speq->spe;
> -	u64 *metadata = NULL;
> -	u64 midr;
> -	unsigned int i;
> +	u64 *metadata;
>  
>  	/* Metadata version 1 assumes all CPUs are the same (old behavior) */
>  	if (spe->metadata_ver == 1) {
> @@ -973,15 +968,28 @@ static void arm_spe__synth_ds(struct arm_spe_queue *speq,
>  
>  		pr_warning_once("Old SPE metadata, re-record to improve decode accuracy\n");
>  		cpuid = perf_env__cpuid(perf_session__env(spe->session));
> -		midr = strtol(cpuid, NULL, 16);
> -	} else {
> -		metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
> -		if (!metadata)
> -			return;
> -
> -		midr = metadata[ARM_SPE_CPU_MIDR];
> +		*midr = strtol(cpuid, NULL, 16);
> +		return 0;
>  	}
>  
> +	metadata = arm_spe__get_metadata_by_cpu(spe, cpu);
> +	if (!metadata)
> +		return -EINVAL;
> +
> +	*midr = metadata[ARM_SPE_CPU_MIDR];
> +	return 0;
> +}
> +
> +static void arm_spe__synth_ds(struct arm_spe_queue *speq,
> +			      const struct arm_spe_record *record,
> +			      union perf_mem_data_src *data_src)
> +{
> +	u64 midr;
> +	unsigned int i;
> +
> +	if (arm_spe__get_midr(speq->spe, speq->cpu, &midr))
> +		return;
> +
>  	for (i = 0; i < ARRAY_SIZE(data_source_handles); i++) {
>  		if (is_midr_in_range_list(midr, data_source_handles[i].midr_ranges)) {
>  			return data_source_handles[i].ds_synth(record, data_src);
> 
> -- 
> 2.34.1
> 
> 

