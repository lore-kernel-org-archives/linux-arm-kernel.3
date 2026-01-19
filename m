Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D438D29C28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 13:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8mB7pTfKgo6TU3cofXYIVhqXercAZT+bc3hmseIbds=; b=y3RRNk3120rj5LdrJ3bHVH1Flt
	h2WOh0zbht2o4F+NG4VKhuvOdIdUksphfx3OrK8tGU9ZYkbQs0/hFI55RR2ib0xzuKNGxMbqigBmX
	lShNgxXtx71v/BBd+84EobdeLmnDaPSID+B/crVeU7BQ3fGxAePpojZmXbSykVRlA7MX54FShOE0I
	ph3aw8j8CF+IRAsAUGEGYveM6xtFo17UCn8/DC8i98DHb+SWoOGhb9F8aDdT7sFwEcj28EVbTOnyX
	It9dHcrlPCDgRRjJ+/ttQgY1wrae4omv72qUhJirq42RrA4Hd7tlUqgmSuplpsrL28bvcM5Qi7/DR
	vqAAnBIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpmn-00000002CY9-2pn3;
	Mon, 19 Jan 2026 13:59:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpmj-00000002CXT-02kD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 13:59:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86661FEC;
	Mon, 19 Jan 2026 05:59:03 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B02033F7B4;
	Mon, 19 Jan 2026 05:59:09 -0800 (PST)
Date: Mon, 19 Jan 2026 13:59:07 +0000
From: Leo Yan <leo.yan@arm.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Thomas Falcon <thomas.falcon@intel.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] perf cs-etm: Fix decoding for sparse CPU maps
Message-ID: <20260119135907.GA2732125@e132581.arm.com>
References: <20260119-james-perf-coresight-cpu-map-segfault-v2-0-56b956a629ee@linaro.org>
 <20260119-james-perf-coresight-cpu-map-segfault-v2-1-56b956a629ee@linaro.org>
 <20260119111509.GD1286628@e132581.arm.com>
 <c50da3af-e6f5-4b40-bd25-1e37fd6bf0d5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c50da3af-e6f5-4b40-bd25-1e37fd6bf0d5@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_055913_088510_5DE5033F 
X-CRM114-Status: GOOD (  18.50  )
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

On Mon, Jan 19, 2026 at 02:11:43PM +0200, Adrian Hunter wrote:

[...]

> >>   0 0 0x200 [0x90]: PERF_RECORD_ID_INDEX nr: 4
> >>   ... id: 771  idx: 0  cpu: 2  tid: -1
> >>   ... id: 772  idx: 1  cpu: 3  tid: -1
> >>   ... id: 773  idx: 0  cpu: 2  tid: -1
> >>   ... id: 774  idx: 1  cpu: 3  tid: -1
> > 
> > Seems to me that this patch works around the issue by using the CPU ID
> > instead, but event->auxtrace.idx is broken.
> > 
> > Should we store the correct index in event->auxtrace.idx (e.g., in the
> > __perf_event__synthesize_id_index()) ?
>
> The idx value represents a perf events ring buffer.  Events on the same
> CPU can share the same ring buffer.  But in the case of per-thread
> recording, different threads have different ring buffers and therefore
> different idx values.
> 
> So I don't think the idx value is wrong.  It is just not the same thing
> as CPU number.

Thanks a lot for the explanation, this makes sense to me.

Leo

