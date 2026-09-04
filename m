Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3182DC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 17:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEG6zW5bP4zT2Cs2whGQzFr5A7FIBlbJEl9+03v1+YU=; b=YXxQLim6fJ0aaNs2VcFall/OVL
	XAF4LCYxISBUGg5pKtH3VtLEg3GJK1nQvjc5PvDco5nC1yirVSecMpvctNhF5zUqhLCqddbiqE9KZ
	MOVZ/XhsNcqis0Z9jm7B3dM22TQBjjXwlWsDq3blk+sb1lYaBYI4hVUTdl2SAASXiCVfwOVX+zpDc
	LCDoqegLQUrL2byrCQSW4mxbYCzFw4sgGm5kWUVKNGT7RR7M0gjk64GxhDinUCGzsJeq+ZMjvOhBP
	dnDSw/0nJHi44whQKH8oblp+ESdrSGg3ytwA8lgZsQFt0iO/GeqMIxhD+BSha2WxGjIo1/ZXcNbYk
	f1W4jSGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XyQ-00000002vTM-43hl;
	Fri, 04 Sep 2026 17:45:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XyO-00000002vSS-3Loi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 17:45:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 756BD152B;
	Fri,  4 Sep 2026 10:45:02 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D10EE3F7D8;
	Fri,  4 Sep 2026 10:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788543906; bh=ZHXUHTgBsZEh26fOHvyKJbcpT9hW8hW0zSA/LhXujMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ant9XImYbJ1oD8BB/rZzmbivZPPVSpgcETqcOYR77mr9o02NdUMD5vBbh/6N7Rbhq
	 KHanHAa47oO5iVgVq/N0Jhp5HMw14aZ4BSfjHBTfyqq/Ry2bGemuxyl5VXLtTNwvAj
	 7FiFx6kWYhydHlfvYMrKHMPeX4kZHEs/Mxoid3iM=
Date: Fri, 4 Sep 2026 18:45:03 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] perf: cs-etm: Respect --no-itrace option
Message-ID: <20260904174503.GC8904@e132581.arm.com>
References: <20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org>
 <20260821-james-cs-hw_id-output-failure-v1-4-9d532ddabcc3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-james-cs-hw_id-output-failure-v1-4-9d532ddabcc3@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_104508_878940_C863EDA9 
X-CRM114-Status: GOOD (  14.57  )
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

On Fri, Aug 21, 2026 at 10:50:32AM +0100, James Clark wrote:

[...]

> @@ -3603,27 +3603,49 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
>  	int err = 0;
>  	int aux_hw_id_found;
>  	int i;
> -	u64 *ptr = NULL;
> +	u64 *ptr = (u64 *) auxtrace_info->priv;
>  	u64 **metadata = NULL;
>  
> -	/* First the global part */
> -	ptr = (u64 *) auxtrace_info->priv;
> -	num_cpu = ptr[CS_PMU_TYPE_CPUS] & 0xffffffff;
> +	etm = zalloc(sizeof(*etm));
> +	if (!etm)
> +		return -ENOMEM;
> +
> +	session->auxtrace = &etm->auxtrace;
> +	etm->auxtrace.free = cs_etm__free;
> +	etm->auxtrace.evsel_is_auxtrace = cs_etm__evsel_is_auxtrace;
> +	etm->auxtrace.process_event = cs_etm__process_event;
> +	etm->auxtrace.process_auxtrace_event = cs_etm__process_auxtrace_event;
> +	etm->auxtrace.flush_events = cs_etm__flush_events;
> +	etm->auxtrace.free_events = cs_etm__free_events;
> +	etm->pmu_type = (unsigned int) ((ptr[CS_PMU_TYPE_CPUS] >> 32) & 0xffffffff);
> +
> +	/*
> +	 * Don't go further than the minimum required to identify this event as
> +	 * auxtrace with cs_etm__evsel_is_auxtrace() so unleader_auxtrace()
> +	 * works.
> +	 */
> +	if (auxtrace__dont_decode(session))
> +		return 0;

TBH, I don't look in details, currently auxtrace__dont_decode() only
exits in the common util/auxtrace.c, why other AUX trace can work well
the option but cs-etm.c needs particular initialization?

Seems to me, we even don't need to do any initialization in cs-etm.c
if the no-itrace flag is set.

