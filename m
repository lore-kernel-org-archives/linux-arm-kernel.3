Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0E6606D80B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=psMtkJCC;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ejUyoupl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LT4QhNCuGhtvYaGuZ1YT+0MRJJqhUJ12cQ6XYhOTJgY=; b=psMtkJCCiaZ+QbRFtzMAB8ww1X
	RSwlf6BlLdp5sk4Dk7AR1pg420pSgXfz3rmMjQbpSqHWqIPVAaGtk0hHn0iFaw1R79p3T9BYXkTQI
	+zY4ihvfy1EKQPJvXT2Wj91ylyhsDid7RidIzDvPsDn2voUROjdQJA72yPJ+emJ4SyQHrjwgAdFGZ
	CdoxnwxAH8p16Hisvh95CkKr6md6QRb+d1ZS3k2m+0xpBwIuRL3x3KRvBGZTYCN3u0OiQvLnIDdRA
	Lj5yS+wiV1XkIZM49t/j8HWHcNeUAyTo4gdgZ8BFqPKhelSjPQe/vzh56v8gEjtglEA4lx7zeZjmZ
	HBDH/gtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObuV-00000005cft-45je;
	Wed, 04 Nov 2026 14:24:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObuS-00000005cfH-3Cqb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:24:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36AF81D34;
	Wed,  4 Nov 2026 06:24:12 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAD8A3F673;
	Wed,  4 Nov 2026 06:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793802255; bh=p/DbzJh9fxRbnRCpJa3VaWBb0VSwvoJXFXtDwP7M4UM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ejUyouplR6xIahybJGnDj5M0O72FEHZUsM4v7yfuiYbScyq64hyzW8kFrpxd5j3vu
	 pdyVMZvfh3SZPkOBo7jMB7qqAXuV9Zf7Z0zhGTI2WMSDrSCL9ZIUSxfLYOCY7oMGPC
	 4QacAJ6NY8RdcO9bbXighOJU3kREXelzU/b11eI4=
Date: Wed, 4 Nov 2026 14:24:12 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-doc@vger.kernel.org, John Garry <john.garry@linux.dev>
Subject: Re: [PATCH v3 04/18] perf cs-etm: Use per-CPU queues for per-thread
 mode
Message-ID: <20261104142412.GI9176@e132581.arm.com>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
 <20261102-james-cs-unformatted-per-thread-fix-v3-4-dbcb0c281b9b@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-4-dbcb0c281b9b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_062416_897421_71AF5092 
X-CRM114-Status: GOOD (  16.97  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 12:15:18PM +0000, James Clark wrote:

[...]

> @@ -2215,6 +2209,29 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
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
> +			tidq->frontend_thread = machine__findnew_thread(
> +				&etm->session->machines.host, -1,
> +				etmq->buffer->tid);
> +			tidq->decode_thread = machine__findnew_thread(
> +				&etm->session->machines.host, -1,
> +				etmq->buffer->tid);
> +		}
> +	}

Why not use PERF_RECORD_AUX events as an opportunity to update threads,
similar to how we handle PERF_RECORD_SWITCH_CPU_WIDE?

> +
>  	return 1;
>  }
>  
> @@ -3288,7 +3305,9 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
>  
>  	if (aux_offset >= auxtrace_event->offset &&
>  	    aux_offset + aux_size <= auxtrace_event->offset + auxtrace_event->size) {
> -		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, auxtrace_event->cpu);
> +		/* Old per-thread files have no CPU (before v6.4) */
> +		int queue_idx = sample->cpu == (u32)-1 ? 0 : sample->cpu;
> +		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, queue_idx);

For per-thread mode, auxtrace_event->cpu is -1. So this is why we
resort sample->cpu to retrieve CPU ID. This makes sense to me.

