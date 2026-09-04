Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD78DC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 17:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bfT+TtoPamQz50P4aywYOlxazePc9Cp0ONjWBz7CCV8=; b=AHEPxmS4OsjMSjenEIGA1fhpxi
	K/tpuxsuHI0pO+AVbc+DZfVSUEurft9lfat7exuhL2euf+fKxiNZaFsQGM0oAdUlY5R1Paw/67UhD
	9PwVroPkw2KoUJVrdkRR+3/QRrHDXrG3a6irLTQQv6hxTP0HvPOCRvAvWzcJISIIuf8VNH63MvGAH
	ZAWSZxiFCANz3lJ0u11/pSddqLS+VFikJnqFMSlg5Tng48VWKzv80NvUJchFFR84dxLNDL3t0F0eD
	4mNRJrmWet1WLKF5pv+xOdGudOjGS6lxmnEoI3B0udHr4tFTOlcXg82wPYIB7KCBExbx4JENwiNHq
	KBIWvN3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XjH-00000002svD-23lL;
	Fri, 04 Sep 2026 17:29:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XjE-00000002sue-3lwV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 17:29:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14F4D152B;
	Fri,  4 Sep 2026 10:29:23 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EBB33F7D8;
	Fri,  4 Sep 2026 10:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788542966; bh=CYbT0EICvFO4nzwDktOwjU04hTdf9ERPnPZiM2RvGMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jeZ/UUElAWPbfMSrDM69zqOygXdFNpkmGU5/g6AutxRHmWyRISel218LM1n6lT9PW
	 8bA5zE2ysLfJX5s6nPF0E2DKAi8VOGNh/2FDpJexjFBBSkxh8LA6Pmr3OxCg+pAf5k
	 vSi9ZHewySrYelJlDD3DhhGMqByrJQyyuPWzfmho=
Date: Fri, 4 Sep 2026 18:29:24 +0100
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
Subject: Re: [PATCH 3/6] perf cs-etm: Synthesize missing HW_ID mappings for
 raw trace
Message-ID: <20260904172924.GB8904@e132581.arm.com>
References: <20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org>
 <20260821-james-cs-hw_id-output-failure-v1-3-9d532ddabcc3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-james-cs-hw_id-output-failure-v1-3-9d532ddabcc3@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_102929_061877_82CF0AA4 
X-CRM114-Status: GOOD (  13.19  )
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

On Fri, Aug 21, 2026 at 10:50:31AM +0100, James Clark wrote:

[...]

> +static int cs_etm__synth_unformatted_trace_ids(struct cs_etm_auxtrace *etm)
> +{
> +	struct auxtrace_queues *queues = &etm->queues;
> +
> +	for (unsigned int i = 0; i < queues->nr_queues; i++) {
> +		struct auxtrace_queue *queue = &queues->queue_array[i];
> +		struct cs_etm_queue *etmq = queue->priv;
> +		u64 *cpu_data;
> +		u8 trace_id;
> +		int ret;
> +
> +		if (list_empty(&queue->head) || !etmq || etmq->format != UNFORMATTED)
> +			continue;
> +
> +		if (!intlist__empty(etmq->traceid_list))
> +			continue;
> +
> +		cpu_data = get_cpu_data(etm, queue->cpu);
> +		if (!cpu_data)
> +			return -EINVAL;
> +
> +		ret = cs_etm__metadata_get_trace_id(&trace_id, cpu_data);
> +		if (ret)
> +			return ret;

Since this is an unformatted queue, can we simply ignore the trace ID?
Instead of fetching it from the metadata, we could insert 0 to create
the trace ID list.

This would also align with future refactoring to remove trace ID
handling for unformatted queues.

