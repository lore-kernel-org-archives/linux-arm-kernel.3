Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AFDC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 19:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLN7V2oWLw8xqVPEjGbL/fX++HTVrZe5VeMr25yIw24=; b=1Dr5bJF5Jyvd87IBXEp60UtF7U
	a5xV6Dg4kCbaQm5JJcyr+DXyL9WT1cfHIhNlpMIWon+x0J4uKpkF8Je32vZ9lB2wYnHgC6X/Xi2O2
	sO61vW1kFEdujHeYZVWwDU5Z+i/ext9AidS/mRr7L2N+FPfr0Zvk1kTHc1kZ2C68kdHU1uvaMFt94
	ZYcO9JyTMAXH9A32XQbnbfIBJ3uCjLLseUdtQ70+E78ppeQUqPg5GfHAw/0Z72z/dm1phKdUuw0Ld
	vnD0K6RQEk6/g88113pS3Vz42SeDXzofSW8uEo8ITLi1XyzXpQItazSZH/bc7n6PN6T810JdVUemb
	hg2QMQrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzIxa-00000002ujq-3SD8;
	Wed, 26 Aug 2026 19:06:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzIxX-00000002uj3-3TYI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 19:06:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94DB11684;
	Wed, 26 Aug 2026 12:06:44 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DB1F3F85F;
	Wed, 26 Aug 2026 12:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787771208; bh=EvX9hjJQNlHdQ2n4/j/cdAJB6GCLhsmKnhtWPB0i/h4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q+lryBCtJfeYE/bzVCJZh41V83hBMXowfmP9LW4P9jBzC/U1VZH7RRtVaeS4Qwsqj
	 ZMBVrnRzfhvk8w9VqkKjdRoN8yso28+o3aK8to87g2y1PGEEWWgAZzEQ3PR6QHGVqn
	 x0nX4wQFHPQBHKQpAO9ep3ICKaTl1EKaOjycWG8Q=
Date: Wed, 26 Aug 2026 20:06:45 +0100
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
Subject: Re: [PATCH v2 04/14] perf cs-etm: Use per-CPU queues for per-thread
 mode
Message-ID: <20260826190645.GL8904@e132581.arm.com>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
 <20260821-james-cs-unformatted-per-thread-fix-v2-4-00c4fd0701b4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-4-00c4fd0701b4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_120652_040661_02EF708B 
X-CRM114-Status: GOOD (  36.99  )
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

On Fri, Aug 21, 2026 at 10:49:02AM +0100, James Clark wrote:
> This fixes two problems, firstly per-thread mode didn't support multiple
> threads well or at all because we always use queue 0 and assumed it was
> for a single thread. However, Perf attaches to all child threads of one
> process or allows multiple threads to be specified on the commandline.
> This meant that trace before a context packet could use the wrong MMAP
> for decoding, and threads running concurrently wouldn't be interleaved
> properly.

If I connect this with patch 03, I understand "a context packet" here as
the trace synchronization with a timestamp, which is needed to correlate
with MMAP records.

What I don't quite understand is how switching to multiple queues fixes
the "trace before a context packet" case. Wouldn't decoding still need
to wait until the first timestamp/context information is available?

> The second problem is that we'd put all HW_IDs into queue 0, so if a
> thread runs on multiple CPUs then it would receive multiple HW_IDs and
> trigger the assert that unformatted trace should only have 1 decoder
> per-CPU:
> 
>   $ perf record --per-thread -e cs_etm//u -- taskset --cpu-list 0 \
>      taskset --cpu-list 1 true
>   $ perf script
> 
>   perf: util/cs-etm.c:3381: cs_etm__create_queue_decoders: Assertion `decoders == 1' failed.

Seems the commit log misses to explain how to fix issue.

> Fixes: 9182f04a85b2 ("perf cs-etm: Pass unformatted flag to decoder")
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  tools/perf/util/cs-etm.c | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index d423f1cb408f..ccf886efff95 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -295,9 +295,6 @@ static int cs_etm__insert_trace_id_node(struct cs_etm_queue *etmq,
>  
>  static struct cs_etm_queue *cs_etm__get_queue(struct cs_etm_auxtrace *etm, int cpu)
>  {
> -	if (etm->per_thread_decoding)
> -		return etm->queues.queue_array[0].priv;
> -
>  	if (cpu < 0 || cpu >= (int)etm->queues.nr_queues)
>  		return NULL;
>  
> @@ -1268,7 +1265,7 @@ static int cs_etm__setup_queue(struct cs_etm_auxtrace *etm,
>  	queue->priv = etmq;
>  	etmq->etm = etm;
>  	etmq->queue_nr = queue_nr;
> -	queue->cpu = queue_nr; /* Placeholder, may be reset to -1 in per-thread mode */
> +	queue->cpu = queue_nr;
>  	etmq->offset = 0;
>  	etmq->sink_id = SINK_UNSET;
>  
> @@ -2160,6 +2157,7 @@ static void cs_etm__flush_all_stack(struct cs_etm_queue *etmq)
>   */
>  static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
>  {
> +	struct cs_etm_auxtrace *etm = etmq->etm;
>  	int ret;
>  
>  	/* The current block is not finished */
> @@ -2188,6 +2186,27 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
>  	 */
>  	cs_etm__flush_all_stack(etmq);
>  
> +	/*
> +	 * Per-thread mode still uses a queue for each CPU, but that CPU can run
> +	 * different threads. When the TID from the AUX record on a CPU changes,
> +	 * re-initialize the thread using the AUX record/buffer fragment TID so
> +	 * we can start decoding even if the context ID packet was cropped or
> +	 * they're disabled.
> +	 */
> +	if (etm->per_thread_decoding) {
> +		struct cs_etm_traceid_queue *tidq = cs_etm__etmq_get_traceid_queue(etmq,
> +							CS_ETM_PER_THREAD_TRACEID);
> +
> +		if (thread__tid(tidq->decode_thread) != etmq->buffer->tid) {
> +			thread__zput(tidq->frontend_thread);
> +			thread__zput(tidq->decode_thread);
> +			tidq->frontend_thread = machine__findnew_thread(&etm->session->machines.host,
> +									-1, etmq->buffer->tid);
> +			tidq->decode_thread = machine__findnew_thread(&etm->session->machines.host,
> +								      -1, etmq->buffer->tid);
> +		}
> +	}

This works if the auxtrace fragment initially represents trace from that
TID. However, doesn't this introduce an assumption that an AUX fragment
contains trace from only one thread?

It seems this assumption impacts the kernel patch [1], the tool's
implementatoin imposes the limitation that driver to cannot support
multiple threads run concurrently with shared sink.

Would it be better to enable contextidr for per-thread mode and rely on
Context ID packets to update the thread context? We could then reuse
cs_etm__etmq_update_thread() / cs_etm__etmq_update_decode_context()
rather than relying on the AUX fragment TID for this purpose.

[1] https://lore.kernel.org/linux-arm-kernel/d833aeed-7376-48af-b772-4fe4ac66471d@linaro.org/

