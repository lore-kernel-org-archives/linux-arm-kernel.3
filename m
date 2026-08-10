Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B20C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 13:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hlrl3xze0yBKa+qAzlqk+6GMfYLXuGnJHmFyd3u5Lmc=; b=kKyCMhm11vezRpCzmv3H+JUxn8
	bgVmJ3jb161BCX6FsXGsMvFfzffvMAUQk97fYtiUa14E913/nObGUfUKcAKiSsKJy35m+V78R81xB
	SZt0G9mdYR9BobRWWijqQt5DC4wWrXaFYp849k2cfJsWyQfsmbSsVagW/q2RyRXyHz2XmgcmvZHcO
	cUZTx52KnPm1hAzYrp67DnNCYh0btVYPXuIggRSwrlLKwWtugYxA8TkEvxYC1eIKhuwWUg4d+xcIs
	j5JRM9AGyWEFLTslThwuGJJaBvmwFIV4wtGTj61EcomAhHqD09IPujv+AFdstfBdcr6DeO4Isz48W
	1yjVvZkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQAx-0000000Buia-19h5;
	Mon, 10 Aug 2026 13:36:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQAp-0000000Bugt-3FdG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 13:36:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 31B8960052;
	Mon, 10 Aug 2026 13:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E831F00A3A;
	Mon, 10 Aug 2026 13:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786368944;
	bh=hlrl3xze0yBKa+qAzlqk+6GMfYLXuGnJHmFyd3u5Lmc=;
	h=From:To:Cc:Subject:Date;
	b=gtgfW6K07wfpikyLhTN0/8c62690UmSrq9xyaCeGCIVIOu/0QV4UVko/rqe1wxWgX
	 8lLV4Z/1ZYljrZDs+r/MO28J/8XJiJscpnCMlo9byWhCCOa/rJwbRLHKoozCl9EOeh
	 tzakhVlSC1ViGcN+Y5RtxoB5CNyMrfL5mOi//joqmO9oMbs5VuOpsAm3lg+HOMh90z
	 mP2czSSbOuD+52OzEMkJxkcyTgMH49wJWwtzZHixS1Xfw/eyWtNlyN9Ay6r4iuf7iP
	 9juW6iAAo0H6OZNpSosCDZUE8JMMQhEhmrLp0z9Ss5HOjC6cdpptMa3BE5QVTnJfb/
	 AWBdx+OUpU/vQ==
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
Subject: [PATCH v7 0/3] perf/core: sched_task() dispatch and branch entry fixes
Date: Mon, 10 Aug 2026 06:35:33 -0700
Message-ID: <20260810133540.1947118-1-puranjay@kernel.org>
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
bpf_get_branch_snapshot() on arm64 and were carried in that series until
v6 [1]. They do not depend on it, so they go on their own; the version
number continues from that series to avoid two numbering schemes for the
same patches.

Patch 1 stops __perf_pmu_sched_task() passing a NULL pmu_ctx to
pmu->sched_task(). armv8pmu_sched_task() is the only implementation that
dereferences the argument, so the oops needs BRBE.

Patch 2 makes perf_pmu_sched_task() visit PMUs whose events are all
CPU-wide. They are skipped today on every switch to a task that has a
perf context but no event on that PMU, so branch records leak across the
task boundary with perf record -b -a. intel_pmu_lbr_add() calls
perf_sched_cb_inc() unconditionally, so x86 LBR is affected the same way.

Patch 3 has each caller fill struct perf_branch_entry in one assignment
rather than clearing the bitfields first, and drops
perf_clear_branch_entry_bitfields(). The helper had drifted from the
struct: new_type and priv were never cleared, and arm_pmuv3.c allocates
the per-CPU branch stack with kmalloc().

Tested on a 128 CPU arm64 machine with BRBE. A WARN_ON_ONCE() at the gate
patch 2 adds to perf_ctx_sched_task_cb() fires within seconds of running
perf record -b -a alongside a task-bound event pinned to a different CPU.
Also built for x86, which patch 3 touches.

Changes in v7:
- Patch 1: pass &cpc->epc unconditionally. cpc->task_epc is NULL there
  both before and after patch 2, so the conditional was dead.
- Patch 2: gate perf_pmu_sched_task() on cpc->task_epc alone. It is
  never set without a task context scheduled in, so the cpuctx->task_ctx
  test was redundant and the two gates are now inverses.
- Patch 3: fill the entry at each site instead of renaming the helper,
  as suggested by Peter.
- Dropped the v6 review tags, all three patches changed.

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
v6: https://lore.kernel.org/bpf/20260806135224.3267890-1-puranjay@kernel.org/

Puranjay Mohan (3):
  perf/core: Fix NULL pmu_ctx passed to pmu->sched_task()
  perf/core: Run sched_task() for PMUs with only CPU-wide events
  perf/core: Fill branch entries with a single assignment

 arch/x86/events/amd/brs.c   |  9 +++--
 arch/x86/events/amd/lbr.c   | 16 ++++-----
 arch/x86/events/intel/lbr.c | 65 ++++++++++++++++++++-----------------
 drivers/perf/arm_brbe.c     |  2 +-
 include/linux/perf_event.h  | 17 ----------
 kernel/events/core.c        | 15 ++++++---
 6 files changed, 58 insertions(+), 66 deletions(-)

-- 
2.53.0-Meta


