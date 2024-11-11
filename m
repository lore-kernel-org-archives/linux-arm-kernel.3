Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37914D2E9C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 08:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hQU6KnGzF3CcDjw3gTR/1Ls1/iYTm36QhtQ1MFcGZU=; b=LJfGgEi7SCb6tEha1es/cs3ftM
	2xrLuwuQlRFZwuEZ3UnVgjbe07BaPS4i179TDMRJY3fgQzFiVY0LtrtyVy/Ffg8CJ1cAQpEkC6wBT
	2NLZ2tRWP/DWfAy4jn3Q8LU3AGim/SWoEYoLyAaQH/ASZmesxUCjQXS3t4rthOLC1jbNYHYgkVay1
	9HcelQGLYrSH6H/Oxwt16O+hoTsv97XkmKgfv0XNpBoBE619qq5XzEAuhEh5MX/fcPWEdEzUrmESY
	Wzju7YYI7izlwhwXPyTtz5Q9ZgXelK8RfnRxo/snc1oLaDPE2OkFzOtroKHQwvDSPjqU7VQUtFTlh
	9VPHEM4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQBU-0000000GugX-1jVR;
	Mon, 11 Nov 2024 08:54:08 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPx7-0000000Gpsy-0kRp;
	Mon, 11 Nov 2024 08:39:19 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xn2wb1nvlz10VB1;
	Mon, 11 Nov 2024 16:37:19 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 3DA53140257;
	Mon, 11 Nov 2024 16:39:11 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 11 Nov 2024 16:39:09 +0800
CC: <yangyicong@hisilicon.com>, Xu Yang <xu.yang_2@nxp.com>, John Garry
	<john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, James Clark
	<james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, Leo Yan
	<leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
	<mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
	<namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang
	<kan.liang@linux.intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen
	<chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>, Athira Rajeev
	<atrajeev@linux.vnet.ibm.com>, Ben Zong-You Xie <ben717@andestech.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>, Sandipan Das
	<sandipan.das@amd.com>, Benjamin Gray <bgray@linux.ibm.com>, Ravi Bangoria
	<ravi.bangoria@amd.com>, =?UTF-8?Q?Cl=c3=a9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>, "Masami Hiramatsu (Google)"
	<mhiramat@kernel.org>, Dima Kogan <dima@secretsauce.net>, "Dr. David Alan
 Gilbert" <linux@treblig.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Junhao He <hejunhao3@huawei.com>
Subject: Re: [PATCH v2 8/8] perf pmu: Move pmu_metrics_table__find and remove
 ARM override
To: Ian Rogers <irogers@google.com>
References: <20241107162035.52206-1-irogers@google.com>
 <20241107162035.52206-9-irogers@google.com>
 <5a57de7c-924e-ccd6-8981-b9fddc647465@huawei.com>
 <CAP-5=fWw04Qi+3=y7M4uMrhgrFWpnF7mZ09yb4v0P0qFT1Gfnw@mail.gmail.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <e8603b0c-86db-c258-179a-f228c43ebf0b@huawei.com>
Date: Mon, 11 Nov 2024 16:39:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAP-5=fWw04Qi+3=y7M4uMrhgrFWpnF7mZ09yb4v0P0qFT1Gfnw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_003917_594872_DD178083 
X-CRM114-Status: GOOD (  20.48  )
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

On 2024/11/10 0:10, Ian Rogers wrote:
> On Sat, Nov 9, 2024 at 2:54 AM Yicong Yang <yangyicong@huawei.com> wrote:
>>
>> Hi,
>>
>> On 2024/11/8 0:20, Ian Rogers wrote:
>>> Move pmu_metrics_table__find to the jevents.py generated pmu-events.c
>>> and remove indirection override for ARM. The movement removes
>>> perf_pmu__find_metrics_table that exists to enable the ARM
>>> override. The ARM override isn't necessary as just the CPUID, not PMU,
>>> is used in the metric table lookup. On non-ARM the CPU argument is
>>> just ignored for the CPUID, for ARM -1 is passed so that the CPUID for
>>> the first logical CPU is read.
>>
>> Since the logic here's already been touching, is it possible to step it further to just
>> ignore the CPUID matching when finding the system metrics/events tables? It's may not be
>> that reasonable for finding a system metrics/events from the CPUID, since one system PMU may
>> exists on different platforms with different CPU types.
> 
> The issue is for conciseness reasons we let metrics and metric
> thresholds refer to other metrics, for example:
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/perf/pmu-events/arch/x86/icelakex/icx-metrics.json#n78
> ```
>     {
>         "BriefDescription": "This category represents fraction of
> slots where no uops are being delivered due to a lack of required
> resources for accepting new uops in the Backend",
>         "MetricExpr": "topdown\\-be\\-bound / (topdown\\-fe\\-bound +
> topdown\\-bad\\-spec + topdown\\-retiring + topdown\\-be\\-bound) + 5
> * cpu@INT_MISC.RECOVERY_CYCLES\\,cmask\\=1\\,edge@ / tma_info_slots",
>         "MetricGroup": "TmaL1;TopdownL1;tma_L1_group",
>         "MetricName": "tma_backend_bound",
>         "MetricThreshold": "tma_backend_bound > 0.2",
>         "MetricgroupNoGroup": "TopdownL1",
>         "PublicDescription": "This category represents fraction of
> slots where no uops are being delivered due to a lack of required
> resources for accepting new uops in the Backend. Backend is the
> portion of the processor core where the out-of-order scheduler
> dispatches ready uops into their respective execution units; and once
> completed these uops get retired according to program order. For
> example; stalls due to data-cache misses or stalls due to the divider
> unit being overloaded are both categorized under Backend Bound.
> Backend Bound is further divided into two main categories: Memory
> Bound and Core Bound. Sample with: TOPDOWN.BACKEND_BOUND_SLOTS",
>         "ScaleUnit": "100%"
>     },
> ```
> 
> The system metrics were added on top of this and we never rethought
> the design. For a metric to refer to another metric there needs to be
> some kind of place we look up from and for that we use the CPUID
> associated table. Perhaps the easiest thing is that if no CPUID table
> is matched we have an empty table.
> 

thanks for the clarificaiton. ok then it's different from my problem and I
shouldn't have mixed them up.

Thanks.

