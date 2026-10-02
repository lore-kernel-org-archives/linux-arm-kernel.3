Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBA5CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 16:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQjHopb8NhH6xNf+FjGfW93qSf6JJu2G9VgOLE5itRw=; b=hslGI1iP8osEFoSgy/Y7ZjCUfJ
	ZCdigIWnYgUguzTLyL3D8HcGHZ7x1nWs9cYoMbUwS9yNlJCWntQEASSUrbmg+mzch/o07s/NIrmr6
	y7YbaqgW4TjlsbFTcio871qKVxqtSz8dRhZ12CCEaBmu5kdPqxkT4nMlXbPXfMGHAX6uZRNnI24RO
	kIquhspKgQnfZnA2ZENq9GTj8H7KOIXgZhwbng10R7tWdeA0Y7ftILjnhmzCypvSgMjLIAL5yj0sB
	jchgEfOn6ckFqwa64RjDp7XiUemvYAJ6U5bYKSlxrYEXRfehN4SIUaf9qf3xrtFLkeVbRNfGXB6NX
	s9qSzD3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfiF-0000000Bztz-0yUJ;
	Fri, 02 Oct 2026 16:02:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfiC-0000000BztY-2qNL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 16:02:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 231822F;
	Fri,  2 Oct 2026 09:02:11 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24F2D3F85F;
	Fri,  2 Oct 2026 09:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790956934; bh=8Sw75o9tjJqXSbACg19RtCfDI4XgP8f98T4pnm4S+Hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vj/w1WQZqhgkpRO8yRUNIPc/4HtLMagHMOlBiSw8k6qtwepsg8g5VnxAl1zMQn4aa
	 40oA/9bv7zhJxOpqplsJf83xqFXbg4wrXArgg2MEr4yA+ihsxcxfjvmYs1p5VhB/g7
	 Jj4Sxaty2UAUFrtegTmeMVeLC/KeBo2G4n3YsjFY=
Date: Fri, 2 Oct 2026 17:02:12 +0100
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
Subject: Re: [PATCH v3 1/4] perf: cs-etm: Don't add global v0 HW_IDs to
 unformatted queues
Message-ID: <20261002160212.GF1208404@e132581.arm.com>
References: <20261002-james-cs-hw_id-output-failure-v3-0-1d8b6ef339c8@linaro.org>
 <20261002-james-cs-hw_id-output-failure-v3-1-1d8b6ef339c8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-james-cs-hw_id-output-failure-v3-1-1d8b6ef339c8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_090216_754931_73915796 
X-CRM114-Status: GOOD (  12.40  )
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

On Fri, Oct 02, 2026 at 12:15:11PM +0100, James Clark wrote:
> In the case of mixed formatted and unformatted trace with v0 HW_IDs, or
> no HW_IDs at all resulting in the cs_etm__map_trace_ids_metadata()
> fallback, formatted queues will write their HW_IDs to unformatted
> queues. This will result in an assert because of multiple decoders on an
> unformatted queue.
> 
> Fix it by not inserting trace ID nodes on other unformatted queues. This
> isn't an issue for v0.1 HW_IDs because they aren't global so will only
> add to their own queue.
> 
> Fixes: 19c3e4db38c5 ("perf: cs-etm: Create decoders based on the trace ID mappings")
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

