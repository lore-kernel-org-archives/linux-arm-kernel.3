Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B48C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 13:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IKqPFsGUTE/iktLHlZyo0CuSNyCusETSu5tRfe5rZ0I=; b=D4DoROR1obGpanbunSvlPbsrhb
	s3/j+0zWra44vfZGYN7iFVqAlPR8LtwSngL8pIB8th2m4LOITzGxJUYUEafSX60RsiAufVONF7Mbs
	aj0y+ffifTotF7EiWF/Hzgk048dbRG/JZTYAWZErwnH1/vU7A1CaeOnN/cbRYYIoY/uBrsB9BpGZn
	mcat0/47xe0CcAR+I6TYXW3pk7UAUmfAXuOYWkesjrq3/Ou9iBVDIJVxhwLzeTCLPA0AI7+PdGUC6
	ANRUXL/pJ5UgY8xgDGqUz2NYmiBq6+SDK9YHYF6yC7Torkqby3Sn/xMtJnif/25eraPmCIQBkS9Lc
	mxxOAA8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryX0-00000005wU5-36XE;
	Thu, 06 Aug 2026 13:53:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryWz-00000005wTz-25nd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 13:53:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9CFCD60A7D;
	Thu,  6 Aug 2026 13:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B221F000E9;
	Thu,  6 Aug 2026 13:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786024388;
	bh=IKqPFsGUTE/iktLHlZyo0CuSNyCusETSu5tRfe5rZ0I=;
	h=From:To:Cc:Subject:Date;
	b=ltDRo8L2l+ReTf9LHJZ1lbVO+HFjWO0EkdBg/v1r8yVCrfkqDWQPbxKpu7+/m85UW
	 EWsa7X+ULsG35QAAOGjWetSPRoWgy9hCyCIUGgxOeVnX7M6kLVvTgwKcN/3YTCKYdm
	 Q9FxcVWow/UIypSymxwQH7WVcMDoH5E0ca4/xWWiMNFyJuYPkQEj8lDOTR87HQ3YSm
	 ruoQsweYdo1x4c00BfM5mXDvvlIY4Jxf95mJX44Lib5cg53LvIL97Re1uhln/LF3cN
	 mC09R+aBNeG5aEH1m0C3IdaLbVju5VMi8QV/2DWCONtOzXWV2w8H8r0XbhmwA4iu0p
	 4apY1ZPUVJnuQ==
From: Puranjay Mohan <puranjay@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Usama Arif <usama.arif@linux.dev>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	x86@kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] perf/core: sched_task() dispatch and branch entry fixes
Date: Thu,  6 Aug 2026 06:52:20 -0700
Message-ID: <20260806135224.3267890-1-puranjay@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

These three fixes were found while adding BRBE support for
bpf_get_branch_snapshot() on arm64 and have been carried in that series
since v1 [1]. They do not depend on it, so they go on their own from
here; the version number continues from that series to avoid two
numbering schemes for the same patches.

Patch 1 stops __perf_pmu_sched_task() passing a NULL pmu_ctx to
pmu->sched_task(). armv8pmu_sched_task() is the only implementation that
dereferences the argument, so the oops needs BRBE.

Patch 2 makes perf_pmu_sched_task() visit PMUs whose events are all
CPU-wide. They are skipped today whenever the scheduled task has a perf
event of its own, so branch records leak across task boundaries with
perf record -b -a. intel_pmu_lbr_add() calls perf_sched_cb_inc()
unconditionally, so x86 LBR is affected the same way.

Dropping the early return alone leaves both dispatch paths running for
one case, so perf_ctx_sched_task_cb() gains a matching gate. The two
could instead be collapsed into perf_pmu_sched_task() alone, since
__perf_pmu_sched_task() already passes the same epc, but that would move
the callback out of the perf_ctx_disable() window for every PMU rather
than just that one case, which seemed like too much for a fix tagged for
stable.

Patch 3 clears struct perf_branch_entry with a single struct assignment.
perf_clear_branch_entry_bitfields() had drifted from the struct: new_type
and priv were never cleared, and arm_pmuv3.c allocates the per-CPU branch
stack with kmalloc().

Tested on a 128 CPU arm64 machine with BRBE. A WARN_ON_ONCE() at the gate
patch 2 adds to perf_ctx_sched_task_cb() fires within seconds of running
perf record -b -a alongside a task-bound event pinned to a different CPU.

Changes in v6:
- Split the sched_task() fix into patches 1 and 2; the NULL dereference
  and the missed dispatch are separate bugs with different reachability.
- Gate perf_ctx_sched_task_cb() on cpc->task_epc. v5 removed the early
  return in perf_pmu_sched_task() without it, so both paths ran for a
  task whose event for that PMU is pinned to another CPU. Caught by the
  WARN_ON_ONCE() described above.
- Tag patches 1 and 2 for stable.
- Send separately from the BRBE series, rebased onto tip perf/core.

[1] https://lore.kernel.org/all/20260616155716.2631508-1-puranjay@kernel.org/

Based on tip perf/core (f4dfab174244).

Puranjay Mohan (3):
  perf/core: Fix NULL pmu_ctx passed to pmu->sched_task()
  perf/core: Run sched_task() for PMUs with only CPU-wide events
  perf/core: Clear the whole branch entry in perf_clear_branch_entry()

 arch/x86/events/amd/brs.c   |  2 +-
 arch/x86/events/amd/lbr.c   |  2 +-
 arch/x86/events/intel/lbr.c |  6 +++---
 drivers/perf/arm_brbe.c     |  2 +-
 include/linux/perf_event.h  | 16 ++--------------
 kernel/events/core.c        | 15 +++++++++++----
 6 files changed, 19 insertions(+), 24 deletions(-)

-- 
2.53.0-Meta


