Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709D8C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 18:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twM7ghcw6YchvkMFUkyO21QRS89zzLFjkjMUnOcDIKE=; b=dKh3pjiJ77Fe97Dfi4X2JY5ULA
	fJ/HwVSYPE0HRgj7ywbe8Qzdyun5AjUBFjjqsil8sbG7g5r00EqWHsgzkISlt2O38K26tvfI4wXSa
	ccNb+HGC4o+wtYGfHhQlMLDkU/08ymk/ZfPtmdgUt9xXpqAr7aRz9TZ+/BkgmKEkAxg/kCmTeViMt
	OPG0SMom5ylQWxndpXzDDZUmRjIaoO0wwRGlZXaWkIk6vLFbcNkPqNyK6MNj3i+iXmsVr/J6IxDFM
	95glRFcHSjPkvL8uc7FG/nJ2dNOAZkMCyeqmGJ2FAmDBpxCfknHba8Z1A8r3AAOuhI7OqQljhVWCB
	Kh4nHxXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKAT-0000000Dwwx-0xPd;
	Thu, 19 Jun 2025 18:39:21 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHT1-0000000DTub-2jxc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 15:46:21 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a53359dea5so585181f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 08:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750347978; x=1750952778; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=twM7ghcw6YchvkMFUkyO21QRS89zzLFjkjMUnOcDIKE=;
        b=d1XbS9MmcKLg9m6wphb5p56C6M9GNBGfj4JHX3ovFSrCSBmw+5HVbtqE41hk+8CRlp
         MU4PLtX/suIj2wgPu87MDWdhqfR0hhXsTcOfib0z0scPPJOQpjzO6Qc/B2KR3GMjhuCF
         GTLk8aguI5l4+A1MH5Bhx0q2+Tb/0i1+S1zoJKEER5xc74g0ha5nHAxBaBxf2wKWU2TI
         wJGvyg0dYA+oNSPRxoF/I6Pva5U8oQB8hj9zL/u3OppyUUCr/QHp56ruxCGyLpntj9t3
         FQFLiaTjXYUJnM4UBidkUtzSJ0+0WDeeBWZvK3TbJ+ePkzM/1xo7zI/naRurjy70GvBN
         Tu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750347978; x=1750952778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=twM7ghcw6YchvkMFUkyO21QRS89zzLFjkjMUnOcDIKE=;
        b=ZusEve4TE7lpW+oU5AXW5nEwuLk3PuWPGtedLfs/sqfkbJhsc84rQfDVhSXmP5pmUs
         P5SmpGTDs5pjwUEXNX7R3VZ3fK8uHvBR9Ck2dbLAXOlNSxc29OC6yCqUPaILb72Zsh0O
         elxB5D3tbw9z7BypJSGM41xcyGXcNoYZNRfUXehFbmjClAcem18pCvIaLrkh4maB6gSD
         jic7NhrSBIvM7PahD1qG7BLECqlFWbsBP4Xm1bAhJ1lspYxWzTmuCIpfSybjoNEflnD+
         ruMl4kvnESqcuDnwOUBsXlXc3NvAtImbfcSeLX1CE7dWDJO72lk1su5kTEZ02GQDLf9h
         pm/A==
X-Forwarded-Encrypted: i=1; AJvYcCWwO0B+yDrWQiBghBMHTljYDlxnCjm1s25kaAHW6no7qNdGhlSRGwYH8to67UseptAu61wtF1XuojDoMN3KyfN0@lists.infradead.org
X-Gm-Message-State: AOJu0YxsU+q7t++MEisCN30ZONe2hdkK1+M81ybQOVsuIqBUbgt2Irll
	DW2tm3sJoDTtRnN/sNPs5NFYD7YPAE1iDvdZI1ICShZKYNWXRHXe1v7753d4KAbd6Vk=
X-Gm-Gg: ASbGnctqvxgVuRCYdEakLAyDgVu1a0hcnfCNHivPDVFI2L3zSryVGECsNbmdqPweoFw
	y4XPIB/ZFqQxh1ZhnN7X3VLWWK+eNrBNM4xUI+aDeLuks20u7qcHGF5BTDeBGpFcafJyGK6VVKk
	CpyGInmUaDwiaSjw0U3wCPcXHjsRBTb235f5sCT2tPqZL043SLet+HBc0CyiVSHmg8qMf6pANNr
	ppu73PoSUpOR+O/AvPU9IH3s7vqhDVv2AXwzJnJdhE0q9FsOjlS5+OJBYMk+xMjchtiOofaO2Z8
	7pKkOTBHVrYTHK7kmQRj+r4ieN6TpeNiop4R08VC0Mjns4yUU9PJTO/lIVPfBg5uMsY=
X-Google-Smtp-Source: AGHT+IGk+fSWw92c++bpc7i/Gr3gKNqNYiyBN3xJ51nLOgbmRzfZpzuDswRZUzq8qOvuayUU7X849g==
X-Received: by 2002:a05:6000:2c13:b0:3a4:dd16:a26d with SMTP id ffacd0b85a97d-3a5723a56e7mr19198135f8f.38.1750347978077;
        Thu, 19 Jun 2025 08:46:18 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d1fsm19577766f8f.2.2025.06.19.08.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 08:46:17 -0700 (PDT)
Message-ID: <86dbeae7-7219-4c6d-9ef9-38838bd088ce@linaro.org>
Date: Thu, 19 Jun 2025 16:46:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] perf arm_spe: Add "events" entry in meta data
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>
References: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-0-6faecf0a8775@arm.com>
 <20250613-arm_spe_support_hitm_overhead_v1_public-v1-6-6faecf0a8775@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-6-6faecf0a8775@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_084619_851149_E0403DCC 
X-CRM114-Status: GOOD (  18.63  )
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



On 13/06/2025 4:53 pm, Leo Yan wrote:
> Add a new "events" entry in the meta data and dump it in raw data mode.
> 
> After:
> 
>    # perf script -D
>    ...
> 
>    0 0 0x470 [0x1f0]: PERF_RECORD_AUXTRACE_INFO type: 4
>      Header version     :2
>      Header size        :4
>      PMU type v2        :11
>      CPU number         :8
>        Magic            :0x1010101010101010
>        CPU #            :0
>        Num of params    :4
>        MIDR             :0x410fd0f0
>        PMU Type         :11
>        Min Interval     :256
>        Events           :0xffff000003fefffe
> 

Pending possibly renaming this field on patch 2

Reviewed-by: James Clark <james.clark@linaro.org>


>    ...
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/arch/arm64/util/arm-spe.c | 5 +++++
>   tools/perf/util/arm-spe.c            | 1 +
>   tools/perf/util/arm-spe.h            | 2 ++
>   3 files changed, 8 insertions(+)
> 
> diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
> index 4f2833b62ff55f3fd1dff3f032d6e06528460939..5cce5f29d8c7936cc4f424a09d50536644c17be9 100644
> --- a/tools/perf/arch/arm64/util/arm-spe.c
> +++ b/tools/perf/arch/arm64/util/arm-spe.c
> @@ -121,12 +121,17 @@ static int arm_spe_save_cpu_header(struct auxtrace_record *itr,
>   		/* No Arm SPE PMU is found */
>   		data[ARM_SPE_CPU_PMU_TYPE] = ULLONG_MAX;
>   		data[ARM_SPE_CAP_MIN_IVAL] = 0;
> +		data[ARM_SPE_CAP_EVENTS] = 0;
>   	} else {
>   		data[ARM_SPE_CPU_PMU_TYPE] = pmu->type;
>   
>   		if (perf_pmu__scan_file(pmu, "caps/min_interval", "%lu", &val) != 1)
>   			val = 0;
>   		data[ARM_SPE_CAP_MIN_IVAL] = val;
> +
> +		if (perf_pmu__scan_file(pmu, "caps/events", "%lu", &val) != 1)
> +			val = 0;
> +		data[ARM_SPE_CAP_EVENTS] = val;
>   	}
>   
>   	free(cpuid);
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index fdef6f743cf3c76b1dcdd57f5a2c297642fdd21a..55b8391990467c8b7818bb63de3545d94d021bb7 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -1532,6 +1532,7 @@ static const char * const metadata_per_cpu_fmts[] = {
>   	[ARM_SPE_CPU_MIDR]		= "    MIDR             :0x%"PRIx64"\n",
>   	[ARM_SPE_CPU_PMU_TYPE]		= "    PMU Type         :%"PRId64"\n",
>   	[ARM_SPE_CAP_MIN_IVAL]		= "    Min Interval     :%"PRId64"\n",
> +	[ARM_SPE_CAP_EVENTS]		= "    Events           :0x%"PRIx64"\n",
>   };
>   
>   static void arm_spe_print_info(struct arm_spe *spe, __u64 *arr)
> diff --git a/tools/perf/util/arm-spe.h b/tools/perf/util/arm-spe.h
> index 390679a4af2fb61419bc881b5dc43c01f1dd77d7..a47d3d8fc97e07d1bb41a6776133d0676c335613 100644
> --- a/tools/perf/util/arm-spe.h
> +++ b/tools/perf/util/arm-spe.h
> @@ -47,6 +47,8 @@ enum {
>   	ARM_SPE_CPU_PMU_TYPE,
>   	/* Minimal interval */
>   	ARM_SPE_CAP_MIN_IVAL,
> +	/* Supported events */
> +	ARM_SPE_CAP_EVENTS,
>   	ARM_SPE_CPU_PRIV_MAX,
>   };
>   
> 


