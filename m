Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BABC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 11:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMB8ghyMQuT+XC9tlI2ESvX9kB+AAQwpREhffrh4yvA=; b=Gq3OKG28pp2H5X7IVS5oTF4zFB
	Gd8sl5JwuWO73c5zgPY9kWN1M5hORAX0hDMe43UJu4VNXTLsoWSWcaGH1vvfPG/ag1I5HsOyJeCVF
	ITPRENEPPRPIKBJ+/fRYxTkZAJsG30xnyEWMdiXNJUea0JeRfKm2AIrlLoo7OHact3+LFRWA0BL3L
	2N3DVOaIV2jMW1pZXOLOc9F3hOOPm8CkVKRgB77r0cYRxO3yuGGFZqsJnfJuhsIeDAKxlYc2orbx/
	U3p4bbuhBD80aToOry3wkLF4+/6y12BJtnVPIJcDyEzn/E12CNw7HlYXem/lGoRHX7oND0zx8Kk0o
	P4Icmjew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiu3L-0000000EiDU-3vvG;
	Fri, 14 Feb 2025 11:40:15 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1titlb-0000000Eea1-3Qd3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 11:21:57 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4395f66a639so12149395e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 03:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739532114; x=1740136914; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VMB8ghyMQuT+XC9tlI2ESvX9kB+AAQwpREhffrh4yvA=;
        b=CTGl6171Wog5Gp0p5C2Sv2IJijHopAs3FPkXY1wHGvZF6uaU2TfOw4lgG7sXjMEIM7
         gnK7ONDDfTiUharZ1lZbbYI8VgPRirB4IZQMhlb8Imk2xqnAkfoTwEjN/7qV4v+41AEy
         YulVPUJEHRevCfirwoy/fiHZqTT0whhtNLVBNCtLjh1moLlr2kVMBu2VTdRRnBkI46/J
         UQm8713mmVLbXwK44ZfdVLT/ZGIcG2vSETQPS0fXF5fvvNyYXlCUSBQVA2eRxXMY0lnH
         fu6N2MZOuH10fERb8VFj73rZ0pvChJiruA3Ju5VQxXQh61fQlOwOVkKAHHuWAIcY3hF3
         qNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739532114; x=1740136914;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VMB8ghyMQuT+XC9tlI2ESvX9kB+AAQwpREhffrh4yvA=;
        b=eB2tw6qxNNdAOwitcLTAhlhiqDMAU2ELJeNnJVN7iSw3rWwtHNK9+BPB3dzCcnaTEw
         rhiHs+gSVwAA5kEbhEuMPRZywnYbjD4AES2IWHODts9ZXh9MRT+Mm0+WuiWfcBGeIdvx
         QSOtKZmLl94L7lvqyDg7+3OxROs82koW1/TaRKYv7yXGuy4JaL304NXW9Mj4ssQfLOuB
         2LDkBdDk6YVtTsnSqZB/hiIcEeBxb/1Zpz6RcYuU7LXnX+kNqOaFcrn1W6sAskTjjmNz
         FhXsnUU8zNiROsp38h7AZd/GnGjHW9izaOFuHS89kY+uGnBj6Co+nA+yON13RJtQX2kW
         jDNA==
X-Forwarded-Encrypted: i=1; AJvYcCWn8+pJ6d/89JKFwpLdstYV/h8nlbocysNGQPEUuchQnlxtahKPJfo/XrKNQHsmqbZpxwruF3kC7ySn0jYVduQP@lists.infradead.org
X-Gm-Message-State: AOJu0YwcsXhdH3Fh60AtJLDLVrcY54AjuZ3O5UnHrNXIjgYf8oQVN0lk
	6iMiFI3kTD0zONMDjb1Ooh3FWqMxgOUFxA3jl2c+K8hUTwJ4g8mqdD2N3ZyhFnA=
X-Gm-Gg: ASbGnctMkBsjnhIMwjetY17BJXSRYSlKqdn74DLr+UpZ3UFOHxRcYr5kgebcxMx7Pi6
	wXjcghiDnmIfLku05lPmiFzoVWgAdxxGNi3W14xNCiDcG+snSboNvZsyG4ouhur51B1BWPmBCdr
	TFAjiUvIWLmc+jggA6VkPLek/+7A1GsTXxjfbYU1x0zZxmWWKugmdpq+dMa+RosqSg4YGg+0znt
	vKEFxV7N3Z6vIEDvxhADgSG/PXAgLGeCn3g4jfi5IHSz7YQqr6GAP2xY2APDQpvlMlu9z5P8+BK
	6OSoI1yFs0h4LlOa0Sx32xbiOA==
X-Google-Smtp-Source: AGHT+IHC1K05OWMY1r66dsv/3HqdN4RQ44rdAWDIfnre4gXGKY06JyEB7tot1W+W3P3i5F/tU2MN3Q==
X-Received: by 2002:a5d:6dac:0:b0:38d:c433:a97 with SMTP id ffacd0b85a97d-38dea2ece71mr12206225f8f.47.1739532113922;
        Fri, 14 Feb 2025 03:21:53 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439618ab352sm41836795e9.40.2025.02.14.03.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 03:21:53 -0800 (PST)
Message-ID: <aa347f0f-ebd3-4744-9053-14dab87d06b8@linaro.org>
Date: Fri, 14 Feb 2025 11:21:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: arm64: Fix compilation error
To: Leo Yan <leo.yan@arm.com>
References: <20250214111025.14478-1-leo.yan@arm.com>
Content-Language: en-US
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250214111025.14478-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_032155_872307_EC535A81 
X-CRM114-Status: GOOD (  17.52  )
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



On 14/02/2025 11:10 am, Leo Yan wrote:
> Since the commit dc6d2bc2d893 ("perf sample: Make user_regs and
> intr_regs optional"), the building for Arm64 reports error:
> 
> arch/arm64/util/unwind-libdw.c: In function ‘libdw__arch_set_initial_registers’:
> arch/arm64/util/unwind-libdw.c:11:32: error: initialization of ‘struct regs_dump *’ from incompatible pointer type ‘struct regs_dump **’ [-Werror=incompatible-pointer-types]
>     11 |  struct regs_dump *user_regs = &ui->sample->user_regs;
>        |                                ^
> cc1: all warnings being treated as errors
> make[6]: *** [/home/niayan01/linux/tools/build/Makefile.build:85: arch/arm64/util/unwind-libdw.o] Error 1
> make[5]: *** [/home/niayan01/linux/tools/build/Makefile.build:138: util] Error 2
> arch/arm64/tests/dwarf-unwind.c: In function ‘test__arch_unwind_sample’:
> arch/arm64/tests/dwarf-unwind.c:48:27: error: initialization of ‘struct regs_dump *’ from incompatible pointer type ‘struct regs_dump **’ [-Werror=incompatible-pointer-types]
>     48 |  struct regs_dump *regs = &sample->user_regs;
>        |                           ^
> 
> To fix the issue, use the helper perf_sample__user_regs() to retrieve
> the user_regs.
> 
> Fixes: dc6d2bc2d893 ("perf sample: Make user_regs and intr_regs optional")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/arch/arm64/tests/dwarf-unwind.c | 2 +-
>   tools/perf/arch/arm64/util/unwind-libdw.c  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/arch/arm64/tests/dwarf-unwind.c b/tools/perf/arch/arm64/tests/dwarf-unwind.c
> index b2603d0d3737..440d00f0de14 100644
> --- a/tools/perf/arch/arm64/tests/dwarf-unwind.c
> +++ b/tools/perf/arch/arm64/tests/dwarf-unwind.c
> @@ -45,7 +45,7 @@ static int sample_ustack(struct perf_sample *sample,
>   int test__arch_unwind_sample(struct perf_sample *sample,
>   		struct thread *thread)
>   {
> -	struct regs_dump *regs = &sample->user_regs;
> +	struct regs_dump *regs = perf_sample__user_regs(sample);
>   	u64 *buf;
>   
>   	buf = calloc(1, sizeof(u64) * PERF_REGS_MAX);
> diff --git a/tools/perf/arch/arm64/util/unwind-libdw.c b/tools/perf/arch/arm64/util/unwind-libdw.c
> index e056d50ab42e..b89b0a7e5ad9 100644
> --- a/tools/perf/arch/arm64/util/unwind-libdw.c
> +++ b/tools/perf/arch/arm64/util/unwind-libdw.c
> @@ -8,7 +8,7 @@
>   bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
>   {
>   	struct unwind_info *ui = arg;
> -	struct regs_dump *user_regs = &ui->sample->user_regs;
> +	struct regs_dump *user_regs = perf_sample__user_regs(ui->sample);
>   	Dwarf_Word dwarf_regs[PERF_REG_ARM64_MAX], dwarf_pc;
>   
>   #define REG(r) ({						\

Reviewed-by: James Clark <james.clark@linaro.org>


