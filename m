Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A1CCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 16:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDJ6GaR8btOeox+OA2bzSS79dpgrA+s1+6/cQu5Nvyg=; b=sgc8MZwRUQpEW836yThD9/qCWH
	dt4KYXnG59mU6snZeHTuOTTn7N/jnysroYnz2/zhSQtGZZtF9/6sBRg2Edxobn1gN3IoBoyaGAXMV
	AP5IBZZxew5A/1gAI+NEbA2Dg9ulm6yOnIqb9OdP3sYH96f0R+RSnrZfDHKpYptXrP6cZkkun64Uz
	utqVOpb0+5cGJLGKnVC90vqP0H4yaKL2Vb010p1dhDO8I06Un+kZb4THJBrxn+7N51/YlHezuBp/f
	1J5iesQCCJK95hQy5+bqrE5gQ3o7HP3o1N6/FuzJfF2jZfAg9vEeVwzZmH8Bmq5jsOhmoUxXnoa/v
	W/YWqzBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjrT-000000046vz-0Kem;
	Thu, 11 Sep 2025 16:09:27 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjrQ-000000046uf-33zy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 16:09:25 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45cb5492350so7154345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 09:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757606963; x=1758211763; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HDJ6GaR8btOeox+OA2bzSS79dpgrA+s1+6/cQu5Nvyg=;
        b=Gg4WCYYt0T0m0rUx1Z/tV+2oNcOP2zpIBojxNRztchVSIy33QcAbRTHPb5KfmBHPUH
         /3Kw5GoEIgadNZ+82sGW3QOeoMlZoQ5CcfDri+IGf+xXDo8cfde7OYA8uN6nmTsnWsGw
         pzmB+fKl9JuJKIjte/kKZWLEC6eD9vq1vc+rypqlt6XSMF5bxnOcsLPgkIB7kRkpx1SO
         dq01viOCvz91kx9Oc5fSueD1MGvneVNSITBGVzTNWUc3o5CriYY0q6ywohlMJy76pjgL
         REZ6xNaBrmIh/Za+HncP1LeTdOTf9aeb2MS73XAJz79l56QY39OM7WsM0guUlWEUGglQ
         QgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757606963; x=1758211763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HDJ6GaR8btOeox+OA2bzSS79dpgrA+s1+6/cQu5Nvyg=;
        b=cHWYjs1j/oijXuj9Xs9sET+Q8ogooUYqJEeBgmaIotAkuGHzV0nEY9KZSRSwmKRag+
         WQHiaVDvXUJZ3cZBf7vuy2EycYk8c/GWdrojj852uQD4DAMouZvf7gwH87E1ZtgY8BQs
         x79bJkOj682oDpXUsMTL8R3n/r2rXOwTkjz2KEZYKu5RLYc7MS2ymJC+05OM4xEQ03ir
         R+Hga4uS5t0Z8KhazrDXND6xH8T04Lq5NK6JMNHj4lp9IG4Ywto44If067ZA2eApCWxt
         siMQ8uRBEd/PvwqbsMoCBeJiihEjVE77umJ9kzsc4kpR+7IBxn+i9MtSi+azLudUNPW4
         ByFg==
X-Forwarded-Encrypted: i=1; AJvYcCX+++LWIdhMAQCCJUEMqWi2Z9q14u2mPenoHOwyZ/uA2oYIhTK2svnnoBuepI/R3SJmicLB99S02FJ/F6d+dQ3z@lists.infradead.org
X-Gm-Message-State: AOJu0YzMnbxdbvY0ymxSZZ+C28Fqe3W4wRfU1qx7J25wn+M/+GXvpY08
	iyT1zL3d+a840faKqpcvPkOklma/ShU8idQjbLBGO/cVW+8tqeuuILZDaqxQYSnnI4E=
X-Gm-Gg: ASbGncvv87rBFxPUao3U61csYmwRA/g7d3K+JT7EPexbAprH1eBWn7l4gMAtK8O/s66
	iz6bnpFC2AdXw6bf2ysnzsyj/Qin7xbsPhfxJqgo0AfiWoKAVM4dG+F/sOyvQXdVNVGw1nxhkbR
	/Clyx3n7F6XO/H0UXdrk+vSYT0OY3mpToqfAl09HVXwNedfBiE5qTOnN7vS6CoysOuKsjVTG8ny
	HVJJGkbyfZxaAQelnhpn8dhPZYXJxmsryRJ/XYTE4rVqIDbxtRwSUrdFATPGOZZS6rmRMkGhIxK
	ElKsE3V/STEZHImEk3By3mfUUJ2i9DKHufp26wmTmTxq9PCuhebzD4alRDM6gwVkyLdvvjnhMvX
	xpGiQ065M5WZLOFccFU52zRylL0q0uymfCKrvoA==
X-Google-Smtp-Source: AGHT+IHPZ3rpyl9xqgnBk9lwQ4vqX9miW8Mb4X3QmnXktFb1xvjAPNm56H7S+6nNvI4nTnLVjGSlTg==
X-Received: by 2002:a05:6000:2007:b0:3e4:957d:d00 with SMTP id ffacd0b85a97d-3e646256c26mr14998738f8f.58.1757606962339;
        Thu, 11 Sep 2025 09:09:22 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607e2eb5sm3024223f8f.58.2025.09.11.09.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 09:09:21 -0700 (PDT)
Message-ID: <52e91a70-2626-4348-b7d3-db26cb3289d3@linaro.org>
Date: Thu, 11 Sep 2025 17:09:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/15] perf arm_spe: Refactor
 arm_spe__get_metadata_by_cpu()
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, German Gomez
 <german.gomez@arm.com>, Ali Saidi <alisaidi@amazon.com>
References: <20250731-arm_spe_support_hitm_overhead_v1_public-v4-0-58e5677a412b@arm.com>
 <20250731-arm_spe_support_hitm_overhead_v1_public-v4-13-58e5677a412b@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250731-arm_spe_support_hitm_overhead_v1_public-v4-13-58e5677a412b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_090924_800479_407117B6 
X-CRM114-Status: GOOD (  24.64  )
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



On 31/07/2025 2:25 pm, Leo Yan wrote:
> Handle "CPU=-1" (per-thread mode) in the arm_spe__get_metadata_by_cpu()
> function. As a result, the function is more general and will be invoked
> by a sequential change.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/arm-spe.c | 55 ++++++++++++++++++++++-------------------------
>   1 file changed, 26 insertions(+), 29 deletions(-)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 2ac10b8008527a066c9b2f67a22eb8511af9239a..3c32b9bc9c983370e37d871adeaa610bf5905c1d 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -317,15 +317,38 @@ static int arm_spe_set_tid(struct arm_spe_queue *speq, pid_t tid)
>   	return 0;
>   }
>   
> -static u64 *arm_spe__get_metadata_by_cpu(struct arm_spe *spe, u64 cpu)
> +static u64 *arm_spe__get_metadata_by_cpu(struct arm_spe *spe, int cpu)
>   {
> +	struct perf_cpu_map *cpus;
> +	struct perf_cpu perf_cpu;
>   	u64 i;
>   
>   	if (!spe->metadata)
>   		return NULL;
>   
> +	/* CPU ID is -1 for per-thread mode */
> +	if (cpu < 0) {
> +		/*
> +		 * On the heterogeneous system, due to CPU ID is -1,
> +		 * cannot confirm the data source packet is supported.
> +		 */
> +		if (!spe->is_homogeneous)
> +			return NULL;
> +
> +		cpus = perf_pmus__find_by_type(spe->pmu_type)->cpus;
> +		if (!cpus)
> +			return NULL;
> +
> +		/* In a homogeneous system, fetch the first CPU in the map. */
> +		perf_cpu = perf_cpu_map__cpu(cpus, 0);
> +		if (perf_cpu.cpu == -1)
> +			return NULL;
> +
> +		cpu = perf_cpu.cpu;
> +	}
> +
>   	for (i = 0; i < spe->metadata_nr_cpu; i++)
> -		if (spe->metadata[i][ARM_SPE_CPU] == cpu)
> +		if (spe->metadata[i][ARM_SPE_CPU] == (u64)cpu)
>   			return spe->metadata[i];
>   
>   	return NULL;
> @@ -914,9 +937,6 @@ static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
>   			      union perf_mem_data_src *data_src)
>   {
>   	struct arm_spe *spe = speq->spe;
> -	struct perf_cpu_map *cpus;
> -	struct perf_cpu perf_cpu;
> -	int16_t cpu_nr;
>   	u64 *metadata = NULL;
>   	u64 midr;
>   	unsigned int i;
> @@ -929,30 +949,7 @@ static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
>   		cpuid = perf_env__cpuid(perf_session__env(spe->session));
>   		midr = strtol(cpuid, NULL, 16);
>   	} else {
> -		/* CPU ID is -1 for per-thread mode */
> -		if (speq->cpu < 0) {
> -			/*
> -			 * On the heterogeneous system, due to CPU ID is -1,
> -			 * cannot confirm the data source packet is supported.
> -			 */
> -			if (!spe->is_homogeneous)
> -				return false;
> -
> -			cpus = perf_pmus__find_by_type(spe->pmu_type)->cpus;
> -			if (!cpus)
> -				return false;
> -
> -			/* In a homogeneous system, fetch the first CPU in the map. */
> -			perf_cpu = perf_cpu_map__cpu(cpus, 0);
> -			if (perf_cpu.cpu == -1)
> -				return false;
> -
> -			cpu_nr = perf_cpu.cpu;
> -		} else {
> -			cpu_nr = speq->cpu;
> -		}
> -
> -		metadata = arm_spe__get_metadata_by_cpu(spe, cpu_nr);
> +		metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
>   		if (!metadata)
>   			return false;
>   
> 

Reviewed-by: James Clark <james.clark@linaro.org>


