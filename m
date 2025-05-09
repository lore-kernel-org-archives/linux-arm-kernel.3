Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585C7C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 01:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qUlw6MXgRmIJ/TnEGiIeEpLlPLIXvF+j6mjM5xXxL8=; b=Fps8ZBScjR/bdt3YtNv5aRKTsD
	+CVk+Sjhap7LeIIzS2vLYjbUIOdoJISmEtlZeuV6tJRkxU32rIJUmSvDginxocTJLPpRSNtmYpOSm
	2hcFAQIF8ZZglQ3yzo/AjEbODCnyCnL1s3Xoj1LzObiw08VeCwG7dA833lN90pCuVNF+asTA05JYp
	PfPxCS9X0HgaZg9j92z/cFsQUnIH9pMKC6s0x7G3MmVvlQZFD0PR6ecfrZ9kDcPbS6bKKs8bCAVNT
	E2vjrPMEfG2IHkuVPfrgs85jOd0kNVP/olfBFgs9p7XAE5OnovKKVLzp4rILLus1NFX/c96rOMMMN
	iWEFVELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDCys-00000002D4o-0nfC;
	Fri, 09 May 2025 01:56:54 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDCwY-00000002Cpa-0Iy8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 01:54:32 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4ZtsQr68Dbz1Z1Yl;
	Fri,  9 May 2025 09:50:44 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id 745B0180B52;
	Fri,  9 May 2025 09:54:21 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 9 May 2025 09:54:19 +0800
Subject: Re: [PATCH] perf kvm: Fix arm64 VM-EXIT event detection
To: Haixin Yu <yuhaixin.yhx@linux.alibaba.com>
CC: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, James
 Clark <james.clark@arm.com>, Mike Leach <mike.leach@linaro.org>, Leo Yan
	<leo.yan@linaro.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
	<mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung
 Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter
	<adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Shannon Zhao
	<shannon.zhao@linux.alibaba.com>, Sergey Senozhatsky
	<sergey.senozhatsky@gmail.com>
References: <ZNG9PNB-fEBNyK9E@B-Q60VQ05P-2326.local>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <33dd0a17-cf35-4b6b-9ee5-9983669cc98b@huawei.com>
Date: Fri, 9 May 2025 09:54:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <ZNG9PNB-fEBNyK9E@B-Q60VQ05P-2326.local>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_185430_421741_E4FDD992 
X-CRM114-Status: GOOD (  19.72  )
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

[ +Cc the original author of perf kvm stat ]

On 2023/8/8 11:57, Haixin Yu wrote:
> A VM-EXIT event shall start at kvm:kvm_exit, and end with the next
> kvm:kvm_entry. But it's reversed on arm64, which means the time running
> guest code in fact.

Good catch! It'd be great if Sergey could take a look.

> 
> Example:
> 
>  # perf kvm stat record -p 2772 -- sleep 1
> 
> Before this change:
> 
>  # perf kvm stat report
> 
> Analyze events for all VMs, all VCPUs:
> 
>     VM-EXIT Samples Samples%   Time%   Min Time   Max Time    Avg time
> 
>     IRQ      756     100.00%  100.00%   2.28us    3674.38us   1375.66us ( +-   4.34% )
> 
> Total Samples:756, Total events handled time:1039996.94us.
> 
> After:
> 
>  # perf kvm stat report
> 
> Analyze events for all VMs, all VCPUs:
> 
>     VM-EXIT Samples Samples%   Time%   Min Time   Max Time    Avg time
> 
>     IRQ     772      100.00%  100.00%   0.24us     62.86us    6.34us ( +-   3.55% )
> 
> Total Samples:772, Total events handled time:4890.80us.
> 
> IRQ average handled time decreases to 6us, which is a more rational result
> as KVM handles IRQ by returning to guest directly.
> 
> Signed-off-by: Haixin Yu <yuhaixin.yhx@linux.alibaba.com>
> ---
>  tools/perf/arch/arm64/util/kvm-stat.c | 24 +++---------------------
>  tools/perf/builtin-kvm.c              |  2 +-
>  2 files changed, 4 insertions(+), 22 deletions(-)
> 
> diff --git a/tools/perf/arch/arm64/util/kvm-stat.c b/tools/perf/arch/arm64/util/kvm-stat.c
> index 6611aa21cba9..eeb659ceedc2 100644
> --- a/tools/perf/arch/arm64/util/kvm-stat.c
> +++ b/tools/perf/arch/arm64/util/kvm-stat.c
> @@ -21,7 +21,7 @@ const char *kvm_events_tp[] = {
>  	NULL,
>  };
>  
> -static void event_get_key(struct evsel *evsel,
> +void exit_event_get_key(struct evsel *evsel,
>  			  struct perf_sample *sample,
>  			  struct event_key *key)
>  {
> @@ -40,27 +40,9 @@ static void event_get_key(struct evsel *evsel,
>  	}
>  }
>  
> -static bool event_begin(struct evsel *evsel,
> -			struct perf_sample *sample __maybe_unused,
> -			struct event_key *key __maybe_unused)
> -{
> -	return evsel__name_is(evsel, kvm_entry_trace);
> -}
> -
> -static bool event_end(struct evsel *evsel,
> -		      struct perf_sample *sample,
> -		      struct event_key *key)
> -{
> -	if (evsel__name_is(evsel, kvm_exit_trace)) {
> -		event_get_key(evsel, sample, key);
> -		return true;
> -	}
> -	return false;
> -}
> -
>  static struct kvm_events_ops exit_events = {
> -	.is_begin_event = event_begin,
> -	.is_end_event	= event_end,
> +	.is_begin_event = exit_event_begin,
> +	.is_end_event	= exit_event_end,
>  	.decode_key	= exit_event_decode_key,
>  	.name		= "VM-EXIT"
>  };
> diff --git a/tools/perf/builtin-kvm.c b/tools/perf/builtin-kvm.c
> index 71165036e4ca..498cd8e21134 100644
> --- a/tools/perf/builtin-kvm.c
> +++ b/tools/perf/builtin-kvm.c
> @@ -615,7 +615,7 @@ static const char *get_filename_for_perf_kvm(void)
>  
>  #if defined(HAVE_KVM_STAT_SUPPORT) && defined(HAVE_LIBTRACEEVENT)
>  
> -void exit_event_get_key(struct evsel *evsel,
> +void __weak exit_event_get_key(struct evsel *evsel,
>  			struct perf_sample *sample,
>  			struct event_key *key)
>  {

