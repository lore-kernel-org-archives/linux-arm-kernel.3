Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94B3C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 15:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihSNpLvz2f4+8FIZZMG1ZEp+CWcYDIKxB5ANvZipWCQ=; b=SjutZ0EIKP3QaTFwJFcQJB86zW
	9m46dTqyvaTQ9L4XwJHcMYd1CU9VQMT92Xjp9DV4+TP+WvF/cMm6w/1CUrbirgju3JQhA47QS+m2C
	4Vvs0AK7cp/kBBV191IUXL5SRtLagPzCSg14TCIwjvVZh/8WIvZ9cyuPW9qTEOM748hcS9eX7zwWl
	9TeXvOhnTBal5HsgNhvwWyZtr+cicEmmIdrEB094vQqZH6I/LqKKL+rxP4slWxYWn34owJX63hQ+F
	17JDcjcqp4awOdtzcSfAy9PHo5YUEt1w6i3Mu8goQ86zNtzTc6LM+JYqLB7sK//MTxpN3rQ5As70E
	jq6fbz8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzFgM-00000002gK1-1wFY;
	Wed, 26 Aug 2026 15:36:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzFgK-00000002gJS-15pJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 15:36:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B974E16F2;
	Wed, 26 Aug 2026 08:36:46 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39C5D3F85F;
	Wed, 26 Aug 2026 08:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787758610; bh=46kJdOmXXA9Z+Clpn0ggxkzOHrhLi8hXcwdHrQbxIh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UtDqSkEP6QMvh9X8Jt3OFI4rFoDesCHjx1iYM8Pqo3ayQAp06DXPXTO+5x/wEQizj
	 GXJHR0cHK6MSTuBGAiBGVTsgdj6VLzyYkLe411Ex/sT+BJ3Pc3m8GAcLjfS62aVGxg
	 EuXQW9cuZiyiANPbLqSWFeHiWMyORfmVn4X08Xhw=
Date: Wed, 26 Aug 2026 16:36:48 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 03/14] perf cs-etm: Turn on context packet timestamps
 in per-thread mode
Message-ID: <20260826153648.GK8904@e132581.arm.com>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
 <20260821-james-cs-unformatted-per-thread-fix-v2-3-00c4fd0701b4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-3-00c4fd0701b4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_083652_343432_8C14F971 
X-CRM114-Status: GOOD (  16.05  )
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

On Fri, Aug 21, 2026 at 10:49:01AM +0100, James Clark wrote:

> @@ -453,13 +453,22 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
>  	 */
>  	evsel__set_sample_bit(cs_etm_evsel, CPU);
>  
> -	/*
> -	 * Also the case of per-cpu mmaps, need the contextID in order to be notified
> -	 * when a context switch happened.
> -	 */
>  	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
> +		/*
> +		 * Timestamps are required to interleave samples from different
> +		 * CPUs.
> +		 */
>  		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
> +		/* Context IDs are required to associate trace to a process */
>  		evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
> +	} else {
> +		/*
> +		 * Enable context packet timestamps only (no periodic

> +		 * timestamps). Even in per-thread mode with a single process we
> +		 * still need to correlate trace to a specific mmap around
> +		 * execs, which can be done with just context packet timestamps.

Could we use terminology that is aligned with the ETM spec?

  "Disable periodic timestamps but generate timestamps for trace
   synchronization  ... to a specific mmap around execs, which
   can be done with just timestamps of trace synchronization."

> +		 */
> +		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", UINT64_MAX);

It seems this will eventually convert UINT64_MAX to 0xf for the
timestamp bit field. Why not use 0xf directly to avoid confusion?

>  	}
>  
>  	/*
> 
> -- 
> 2.43.0
> 

