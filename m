Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA1DC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JABMeoeyFaaaFpqJPJOTzlNu/8zJuRJe3EDdSamTHBc=; b=piJJgt8XjGjbdH
	Pxf5E8BfEBwfsQ2Swg8t4nrHG8xr6FcjAy+ZLSKEgpjieQSLI19AEPqY5Q3ieNjLgBHFfP0H1KJPw
	M8N6mITW/MlwH6COlcPA8w/R/tUAqWKgpgSGfmLdxLwrhpbVxX5MaJbvyCgpdO0pAY/XZB4tFBZKn
	ZC+4xaZrSj4tlvzOmQu1NcQe1XCrJoYD1js+5yzDog6rs5dwsa55w1NotKFdgTc5Iq2iV30IKOfxi
	OlVhSDhw4p3ZvN1G2nMdlYUASk+QXK8thjhFHS6iWNS7IlcD7+v30EEc8SNZxVUMNvpw32/RRkpfs
	5rbUW+MSGcUPqE+GEpuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPC-00000007Heg-0I10;
	Tue, 15 Sep 2026 15:49:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VP9-00000007HdL-3Tbz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:49:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 044491570;
	Tue, 15 Sep 2026 08:49:00 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39FEF3F882;
	Tue, 15 Sep 2026 08:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487343; bh=3fePGUpcFKcyg8Wmo61Zos3owlK/geK2GV8guwQ9n+k=;
	h=From:Subject:Date:To:Cc:From;
	b=sdb0u63EAITu5AIbhYgw8fQlKTjNqyAS1DJhxJi1Y9UeOhZaIa3LmsG5GNzD82k4g
	 nkR4SGWkINzJ/M0VSxM64psGlDurfep/ECzQwnlZYdnQ8WKfvAw84uA0qbVc3YVpz5
	 ND+X3byucoD4FQXlpGjEDYqgpvV7aTG07dAJkbVs=
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH 00/25] CoreSight / perf: Support AUX sampling
Date: Tue, 15 Sep 2026 16:48:46 +0100
Message-Id: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN5oqWoC/x3MSwqAMAwA0atI1ha02Fq8ikgpGjXgpyQqgnh3i
 8u3mHlAkAkFmuwBxouE9i2hzDPo57BNqGhIBl1oWzhtVeDV9+LljHHnw4fz9hLWuKDStbG2MpU
 xzkHqI+NI9/9uu/f9AApfwmBrAAAA
X-Change-ID: 20260826-arm_cs_support_aux_sample-275664545588
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487340; l=6419;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=3fePGUpcFKcyg8Wmo61Zos3owlK/geK2GV8guwQ9n+k=;
 b=5Ldui6l9hwo13O0cxQcRs2k0r7j9TBAfT7JQ4cWIE7ds+u+5rm0MDfZjOG0drt26+lm7Htc8F
 avasupR7zFWChnez0rEmbcdX0xqgFbcGtVdNp6R9HXG9SSq6oa3Rtht
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084907_965974_98DFAB66 
X-CRM114-Status: GOOD (  16.13  )
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

This series adds AUX sampling support to Arm CoreSight. A PMU sample can
carry a window of recent AUX trace, which perf generates callchain and
branch stack for the sampled thread. This provides execution history for
context-based profiling.

The series can be divided into four parts:

1. Patches 01 ~ 03 for event core:

   The perf event core changes warn on non-positive AUX snapshot
   returns before checking alignment padding. Space for a non-zero AUX
   payload has already been reserved, so a zero return leaves that
   payload unwritten. CoreSight fills unavailable trace with zeros and
   returns the requested size.

   It also prevents AUX sampling and pause/resume from nesting through
   an NMI. A driver guard alone can leave perf's pause state
   (aux_paused) inconsistent with the hardware state. The event core
   ensures only one AUX callback is exclusively invoked.

   Export the output copy helpers so CoreSight can fill sample payloads
   when the driver is built as a module.

2. Patches 04 ~ 09 for ETM perf:

   The ETM perf changes separate the lifetime of the published CoreSight
   context from that of the AUX output handle.

   Centralize buffer updates, and end AUX output when throttling stops
   an event without PERF_EF_UPDATE so a later restart can acquire a
   fresh handle.

   Make hardware-state transitions reflect completed operations.

3. Patches 10 ~ 13 for TRBE driver:

   TRBE snapshot buffers need padding to meet the CPU's alignment and
   wrap constraints. Use circular buffer mode for overwrite snapshots,
   retaining Fill mode on CPUs that require the write out-of-range
   workaround.

   TRBE faults can still raise interrupts in circular mode. Track when
   the sink is handling an interrupt so an AUX sampling NMI can skip a
   snapshot while the interrupted handler is updating the buffer. Make
   repeated sink disable safe for deferred cleanup after a snapshot
   failure.

4. Patches 14 ~ 25 for AUX sampling and decoding:

   Shared atomic STOP and AUX action bits prevent an NMI stop from
   tearing down the context while pause, resume or snapshot accesses it.
   The AUX operation finishes and then completes the deferred stop,
   publishing the stopped state only after hardware teardown.

   Add snapshot_aux() to the CoreSight driver to pause the source, update
   the sink buffer, disable the path, copy the recent trace into the PMU
   sample, and then re-enable the path and resume the source.

   Patch 17 fixes history collection for zero-IP PMU samples. Perf clears
   the IP when a user-only sampling interrupt skids into the kernel, but
   the timestamp and TID remain valid for matching the trace history.

   In perf, decode each embedded payload as an independent trace window,
   selecting the decoder with the sampled CPU and using the sample's
   PID/TID and traced context IDs to attribute history to the sampled
   thread. Refactor common timeless decoding and history collection, and
   drain pending OpenCSD output so buffered history is not lost.

   Attach reconstructed callchains and branch stacks to the original PMU
   samples, preserving histories already present in the samples. Add a
   test, and document the recording and decoding workflow and its
   limitations.

The initial support targets unformatted trace from per-CPU sinks such as
TRBE. Shared formatted sinks such as ETR can mix trace from multiple CPUs,
consuming the limited sample window with execution unrelated to the
sampled thread.

This series is based on Amir's series "perf: Add CoreSight branch
history to existing samples" [1] for perf tool's branch / callchain
generating.

[1] https://lore.kernel.org/linux-perf-users/cover.1787005265.git.aaupov@fb.com/

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Leo Yan (25):
      perf/core: Reject non-positive AUX snapshot sizes
      perf/core: Prevent AUX sampling from racing with pause/resume
      perf/core: Export output copy helpers for CoreSight
      coresight: perf: End AUX output when an event is throttled
      coresight: perf: Extract AUX buffer update helper
      coresight: perf: Simplify flow for CPUs without a path
      coresight: perf: Validate the live context through its path
      coresight: perf: Validate context before resuming trace
      coresight: perf: Improve hardware state transitions
      coresight: trbe: Pad snapshot buffers
      coresight: trbe: Use circular buffer mode for snapshots
      coresight: trbe: Track per-CPU sink interrupt handling
      coresight: trbe: Handle an already disabled sink
      coresight: perf: Look up the trace path in etm_event_pause()
      coresight: perf: Serialize AUX pause and resume with event stops
      coresight: perf: Support AUX sampling with per-CPU sinks
      perf cs-etm: Allow history collection for samples with zero IP
      perf cs-etm: Unify timeless buffer decoding
      perf cs-etm: Propagate errors from trace queue flushing
      perf cs-etm: Drain pending packets before finishing trace blocks
      perf cs-etm: Complete packet draining with end of trace
      perf cs-etm: Centralize sample history collection
      perf cs-etm: Decode AUX samples into callchains and branch stacks
      perf test: Add CoreSight AUX sample decoding test
      Documentation: coresight: Document AUX sample decoding

 Documentation/trace/coresight/coresight-perf.rst |  39 ++
 drivers/hwtracing/coresight/coresight-etm-perf.c | 396 +++++++++++++-----
 drivers/hwtracing/coresight/coresight-etm-perf.h |   2 +
 drivers/hwtracing/coresight/coresight-trbe.c     | 122 ++++--
 include/linux/coresight.h                        |   2 +
 kernel/events/core.c                             |  26 +-
 kernel/events/ring_buffer.c                      |   2 +
 tools/perf/arch/arm/util/cs-etm.c                |   6 +
 tools/perf/tests/shell/coresight/aux_sample.sh   | 189 +++++++++
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c  |  39 ++
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.h  |   7 +
 tools/perf/util/cs-etm.c                         | 491 ++++++++++++++++-------
 12 files changed, 1040 insertions(+), 281 deletions(-)
---
base-commit: 134e1295eedfc9a3c6e4e63d8ef45dc63749449b
change-id: 20260826-arm_cs_support_aux_sample-275664545588

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


