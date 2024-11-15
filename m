Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E7DD68BC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 15:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1RpKflVF0bebbJaxQf/ZXjTfRFvkv41edCIwaQJcQs=; b=xWwtUUZtCvS0SOwAmplh5k94re
	KGYi3NDyI5BxaPRYiojgY7SntNjUjktgaazT71NeZxJjRZ+impRf8I8BFuoI4kyfAXRoJC8mOJeJn
	qbCUQBr7QjtMziMb8g1WxcCoMiQch7R61OI4xWG9qy7N5HUue1Lxz/mBtv0HiD8FXlXikHBGKTU4V
	qqWfZiqZlXRy7Ol1LixQ2y96C2XKlcLWpWzAtT/7UVEoBjtrn2z24mxSmMCFHf8HLbCH7ZsjyVHEU
	QKQiN2cFhsG9BZpeOSFyjlxscrrbixGuD2WBJZMttimrizWAkmJ9OtdhOrr71ttv2fdfv1JdEFmtN
	q9Az+9/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tByNX-00000003BxM-2Eqf;
	Fri, 15 Nov 2024 15:36:59 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tByMb-00000003Bfm-1bcL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 15:36:02 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5cf9cd1120bso656115a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 07:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731684959; x=1732289759; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q1RpKflVF0bebbJaxQf/ZXjTfRFvkv41edCIwaQJcQs=;
        b=YT1DtuGV/sLL5tXE1CQS6q7X8nwmwEOG3DFvrbZLqpW/p6J5E4JEscLOPk/kzyBtWy
         XKOCok7VNITz9P402+DqRjKtlqVAZ0SVe4fqGl03bKXSLeuJe49pzdfa2kMb2xgp3Xdo
         pe4wt7Y729Z4wJraUsfhR39R2aWrnqZ4ah/Sw6ExVbhyyKw8nSy33XwObwuIPFAvj0Jv
         4e5yi1VUsTrkMR2DKj4Cl6w22E8oPCoXwq1RLVlZjUGcP23v4/bEX8Xhs5PyrdMcrOEs
         snqfd/GxNcACDuoclhu+aB1l62P+tELfDAOpIabhky2KSdCddA64j5G9lK26l4AGE3jy
         VOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731684959; x=1732289759;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q1RpKflVF0bebbJaxQf/ZXjTfRFvkv41edCIwaQJcQs=;
        b=rydL/WaFQUwDaL4fu5lF+cYlv+DQ3BbJ5Nqmo/pZ7SGr7Y+CqAotr6U1bn8+HwQtYY
         cVVB0z0bcWI59jC9WwojEZFv6bahqP9FDp6e8Gg5zWibsJ+M8L6f94CgGEzCbzhEwPH+
         f0RPkaCn5WZxalcZT87YJ7Ll8ZSXRD7Sl2C4SsEUtHkBMZeCmZF6t+2oHqlZHY6EgdJf
         PEJaeHZXFXl59eNT6pbmXB3UgdvnRo4P/SlT0F48yVPBDBmmDFUvh0zMJrUqvOBDY4iK
         M8mEwMOddmeAneeS99/BAv2bcETq7xo9Np6w8wsTPYzCYLHdyS94rMFZQvCriItKqJN3
         EBVA==
X-Forwarded-Encrypted: i=1; AJvYcCVFFi3cmsno+JFx+Hp8/gRBc3o03PVFoAw0c/dtT6w6CgU7BoIzFsRbkFqvOuHUDdxZYyPOg9huXHTxmv9YTKBb@lists.infradead.org
X-Gm-Message-State: AOJu0YzYtEvU1TwxcJFdD40IE70Ta81eqw7qVYCqHB1w10O1qR6qud5m
	7cufIp6qH795bwa7YfR31MNjaOyISUiqtBTJWg4c33HO9rjq77elddTl89OynV8=
X-Google-Smtp-Source: AGHT+IECuVoSF3cpPActYMtkLKV2qemZdHFkwL1b+NBlkRP5B3JvLdOGBczovm4O75t7YTAzxqF8NQ==
X-Received: by 2002:a05:6402:34c4:b0:5cf:14fa:cd10 with SMTP id 4fb4d7f45d1cf-5cf754df234mr6631178a12.5.1731684958824;
        Fri, 15 Nov 2024 07:35:58 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.111])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf79c0ad15sm1676898a12.66.2024.11.15.07.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 07:35:58 -0800 (PST)
Message-ID: <215ca9a2-0a63-4d0c-8402-5cb1f2bb0794@linaro.org>
Date: Fri, 15 Nov 2024 15:35:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Refactor cpuid and metric table lookup code
To: Ian Rogers <irogers@google.com>, Xu Yang <xu.yang_2@nxp.com>
References: <20241107162035.52206-1-irogers@google.com>
Content-Language: en-US
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kan Liang <kan.liang@linux.intel.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Ben Zong-You Xie <ben717@andestech.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Sandipan Das
 <sandipan.das@amd.com>, Benjamin Gray <bgray@linux.ibm.com>,
 Ravi Bangoria <ravi.bangoria@amd.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Dima Kogan <dima@secretsauce.net>, "Dr. David Alan Gilbert"
 <linux@treblig.org>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241107162035.52206-1-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_073601_435297_7721A306 
X-CRM114-Status: GOOD (  16.14  )
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



On 07/11/2024 4:20 pm, Ian Rogers wrote:
> Xu Yang <xu.yang_2@nxp.com> reported issues with the system metric
> lookup:
> https://lore.kernel.org/linux-perf-users/20241106085441.3945502-1-xu.yang_2@nxp.com/
> These patches remove a lot of the logic relating CPUIDs to PMUs so
> that the PMU isn't part of the question when finding a metric table.
> For time reasons, it doesn't go as far as allowing system metrics
> without a metric table as a metric table is needed for metrics to
> refer to other metrics, and the refactoring of that resolution is a
> hassle.
> 
> Ian Rogers (7):
>    perf header: Move is_cpu_online to numa bench
>    perf header: Refactor get_cpuid to take a CPU for ARM
>    perf arm64 header: Use cpu argument in get_cpuid
>    perf header: Avoid transitive PMU includes
>    perf header: Pass a perf_cpu rather than a PMU to get_cpuid_str
>    perf jevents: Add map_for_cpu
>    perf pmu: Move pmu_metrics_table__find and remove ARM override
> 
> Xu Yang (1):
>    perf jevents: fix breakage when do perf stat on system metric
> 
>   tools/perf/arch/arm64/util/arm-spe.c     | 14 +---
>   tools/perf/arch/arm64/util/header.c      | 73 ++++++++++-----------
>   tools/perf/arch/arm64/util/pmu.c         | 20 ------
>   tools/perf/arch/loongarch/util/header.c  |  4 +-
>   tools/perf/arch/powerpc/util/header.c    |  4 +-
>   tools/perf/arch/riscv/util/header.c      |  4 +-
>   tools/perf/arch/s390/util/header.c       |  6 +-
>   tools/perf/arch/x86/util/auxtrace.c      |  3 +-
>   tools/perf/arch/x86/util/header.c        |  5 +-
>   tools/perf/bench/numa.c                  | 53 +++++++++++++++
>   tools/perf/builtin-kvm.c                 |  4 +-
>   tools/perf/pmu-events/empty-pmu-events.c | 39 ++++++-----
>   tools/perf/pmu-events/jevents.py         | 39 ++++++-----
>   tools/perf/pmu-events/pmu-events.h       |  2 +-
>   tools/perf/tests/expr.c                  |  5 +-
>   tools/perf/util/env.c                    |  4 +-
>   tools/perf/util/expr.c                   |  6 +-
>   tools/perf/util/header.c                 | 82 ++++++++----------------
>   tools/perf/util/header.h                 | 23 +++----
>   tools/perf/util/pmu.c                    | 25 --------
>   tools/perf/util/pmu.h                    |  2 -
>   tools/perf/util/probe-event.c            |  1 +
>   22 files changed, 189 insertions(+), 229 deletions(-)
> 

Reviewed-by: James Clark <james.clark@linaro.org>


