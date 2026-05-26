Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7341CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 00:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8bg39MIcg+2fCN2CcreG9UKxic/kHUFI16hwnrIPTc=; b=teqX/LwKCxsjuMCmqkTAhgtd01
	QY6bAznOmPsieQuv0fmdMm3/rXKSnCpwMyUONij7p9SueCqq1Wg2EaqnXVtObAuik2enQBhAPzONt
	0zwSrfUPFlLMY20tiZlxgvcwd/OQNMCBYigyNKrK9kBZFDLF3QsqTUE1CEwehsWxSzhqLdeW1jRKT
	A5wmUYCWhhG2zXANZovU0xSNzfxxk50pr022QpVeA7UdD2N3MDD4WUlFL1XCQJwXwkwSyQd+8QfCP
	URgDIoRLpRqj7lMe4ktBcr+mtGmlQyExzd0N33Je3t89KJk1LZ+mg1f+umSTiHWrlEoT3QiujBcsn
	Mabm2jUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRfoc-00000000iXN-1Nqs;
	Tue, 26 May 2026 00:38:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRfoZ-00000000iWf-12sq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 00:38:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2625040258;
	Tue, 26 May 2026 00:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D88B41F000E9;
	Tue, 26 May 2026 00:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779755913;
	bh=+8bg39MIcg+2fCN2CcreG9UKxic/kHUFI16hwnrIPTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BDMv2isJG+a49bLqmydipTEXev0lODsV4+5mDUq3oczED3dZEF0iShW5RHdqk2O82
	 NFHC7OoCxoP8jXQeIKoyooWPI/+4fT2pOgT+STKnuHdzCExMt7DsrHg8efowqs11tZ
	 9rzy5QLcF8NrBJ/EJuL+tMx2Mb5FIRTQceHDmq1wcsFIQd0rqAF6Cm6asJFNzFcidL
	 HstRwuWkMFw/WZAApuU39gGNbrGFrgI4nO5mio4qQQ1h5bIm589dIUH7I30/NAsSgW
	 tq+j4jvQv4GCLwokY87SlHCWy8wZ3cbAN4EBpgaTBhVr6c2Z1lO2bzQszausBU44mE
	 XDfp60DN+jYIQ==
Date: Mon, 25 May 2026 19:38:29 -0500
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, alice.mei.rogers@gmail.com,
	dapeng1.mi@linux.intel.com, james.clark@linaro.org,
	leo.yan@linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
Subject: Re: [PATCH v9 07/23] perf evsel/evlist: Avoid unnecessary #includes
Message-ID: <ahTrhaHGEtHLEAIM@google.com>
References: <20260428071903.1886173-1-irogers@google.com>
 <20260522220435.2378363-1-irogers@google.com>
 <20260522220435.2378363-8-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260522220435.2378363-8-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_173835_327907_13146269 
X-CRM114-Status: GOOD (  11.65  )
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

On Fri, May 22, 2026 at 03:04:18PM -0700, Ian Rogers wrote:
> Use forward declarations and remove unnecessary #includes in
> evsel.h. Sort the forward declarations in evsel.h and evlist.h.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>

Acked-by: Namhyung Kim <namhyung@kernel.org>

Thanks,
Namhyung

> ---
>  tools/perf/util/evlist.h | 15 +++++++++------
>  tools/perf/util/evsel.h  | 20 +++++++++++---------
>  2 files changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/tools/perf/util/evlist.h b/tools/perf/util/evlist.h
> index e507f5f20ef6..e54761c670b6 100644
> --- a/tools/perf/util/evlist.h
> +++ b/tools/perf/util/evlist.h
> @@ -2,29 +2,32 @@
>  #ifndef __PERF_EVLIST_H
>  #define __PERF_EVLIST_H 1
>  
> +#include <signal.h>
> +
>  #include <linux/compiler.h>
>  #include <linux/kernel.h>
> -#include <linux/refcount.h>
>  #include <linux/list.h>
> +#include <linux/refcount.h>
> +#include <pthread.h>
> +#include <unistd.h>
> +
>  #include <api/fd/array.h>
>  #include <internal/evlist.h>
>  #include <internal/evsel.h>
>  #include <perf/evlist.h>
> +
>  #include "affinity.h"
>  #include "events_stats.h"
>  #include "evsel.h"
>  #include "rblist.h"
> -#include <pthread.h>
> -#include <signal.h>
> -#include <unistd.h>
>  
> -struct pollfd;
> -struct thread_map;
>  struct perf_cpu_map;
>  struct perf_stat_config;
> +struct pollfd;
>  struct record_opts;
>  struct strbuf;
>  struct target;
> +struct thread_map;
>  
>  /*
>   * State machine of bkw_mmap_state:
> diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
> index 927e5b4756cc..2221694bb819 100644
> --- a/tools/perf/util/evsel.h
> +++ b/tools/perf/util/evsel.h
> @@ -2,28 +2,30 @@
>  #ifndef __PERF_EVSEL_H
>  #define __PERF_EVSEL_H 1
>  
> -#include <linux/list.h>
>  #include <stdbool.h>
> -#include <sys/types.h>
> +
> +#include <linux/list.h>
>  #include <linux/perf_event.h>
>  #include <linux/types.h>
> +#include <sys/types.h>
> +
>  #include <internal/evsel.h>
>  #include <perf/evsel.h>
> +
>  #include "symbol_conf.h"
> -#include "pmus.h"
> -#include "pmu.h"
>  
> +struct bperf_follower_bpf;
> +struct bperf_leader_bpf;
> +struct bpf_counter_ops;
>  struct bpf_object;
>  struct cgroup;
> +struct hashmap;
>  struct perf_counts;
> +struct perf_pmu;
>  struct perf_stat_config;
>  struct perf_stat_evsel;
> -union perf_event;
> -struct bpf_counter_ops;
>  struct target;
> -struct hashmap;
> -struct bperf_leader_bpf;
> -struct bperf_follower_bpf;
> +union perf_event;
>  
>  typedef int (evsel__sb_cb_t)(union perf_event *event, void *data);
>  
> -- 
> 2.54.0.794.g4f17f83d09-goog
> 

