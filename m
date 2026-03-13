Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8F0107BCD5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 18:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/SCPIBP0E8zSGO0hizsZWcYBKZOPpavEOO6sCqHbHc=; b=OcXXP5eh2ANuJw80hQrrL36OfC
	w+UWb2moN9bE8pvN+jWNHoI73om2ZNcOG5f9Y96b+hSioN1GYsJth9cXg+s7vxy+soSE//LOcGpdL
	DN3J9JukS0PTIlrtzw+s782xA15TzOZOfdSaXRqnYqoGERxvQqBCsu1Jr/K43tIzMEw7KNi/VygaF
	YGz+pf10RK4iD6nmPfx/fx5oG6Pun04fqShFkTWQ7uBinatRhzp3bAhvjP9RDk457GQRD8lSr13qs
	RiZw4cbi8TCptgdBJI83jhct1rcI0eYn/Z/62Zgd5jJeX1RPpHvjFFMNQRQrhm62OYBPJxA5xCOEx
	MDpEASPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16s3-00000000qJe-18IM;
	Fri, 13 Mar 2026 18:04:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16s0-00000000qHo-1aSj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 18:04:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 63B366183E;
	Fri, 13 Mar 2026 18:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5ABBC19421;
	Fri, 13 Mar 2026 18:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773425059;
	bh=UAeqv1crTMesgqI0eCm4lZuBxl3uq8Ao0hE7O5sw9WE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ooJ+X7PMQ9BTWYXPnqO/Zh55gZVYU4rnSWaVcxDcl1xkU/bacj210ftMz7PkRx1Jc
	 gKHJoKGrntfXhMY48yLnx1kSYk7UEKIXNBaMHhC0msGBcRjbTACJ3NyNe/a2eeAdG7
	 tfoSE1FecLfvHPMZBTF9kYXL7PZu8nO4Td+exWMkEkOBi4NA95ej3/JokFg+ytZYmY
	 8qCByEvZD4lkHrVe2zByHAyjBSQ8+pPHqiKdtA3Zoxa8Dr8hOfp7xGm39l2Wb0jslt
	 v4JlNAXgPaTamB21vUEeQRmvQO2EzKA+GQCWX2L7tEMS9PJXVkZiKRlbeYwg78UNBv
	 8KdhcnQrqKyDg==
From: Puranjay Mohan <puranjay@kernel.org>
To: bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Rob Herring <robh@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH bpf 1/3] perf/arm_pmuv3: Fix NULL pointer dereference in armv8pmu_sched_task()
Date: Fri, 13 Mar 2026 11:03:32 -0700
Message-ID: <20260313180352.3800358-2-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260313180352.3800358-1-puranjay@kernel.org>
References: <20260313180352.3800358-1-puranjay@kernel.org>
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

This is easily triggered with:

  perf record -b -e cycles -a -- ls

which crashes on the first context switch with:

  Unable to handle kernel NULL pointer dereference at virtual address 00[.]
  PC is at armv8pmu_sched_task+0x14/0x50
  LR is at perf_pmu_sched_task+0xac/0x108
  Call trace:
    armv8pmu_sched_task+0x14/0x50 (P)
    perf_pmu_sched_task+0xac/0x108
    __perf_event_task_sched_out+0x6c/0xe0
    prepare_task_switch+0x120/0x268
    __schedule+0x1e8/0x828
    ...

perf_pmu_sched_task() invokes the PMU sched callback with cpc->task_epc,
which is NULL when no per-task events exist for this PMU. With CPU-wide
branch-stack events, armv8pmu_sched_task() is still registered and
dereferences pmu_ctx->pmu unconditionally, causing the crash.

The bug was introduced by commit fa9d27773873 ("perf: arm_pmu: Kill last
use of per-CPU cpu_armpmu pointer") which changed the function from
using the per-CPU cpu_armpmu pointer (always valid) to dereferencing
pmu_ctx->pmu without adding a NULL check.

Add a NULL check for pmu_ctx to avoid the crash.

Fixes: fa9d27773873 ("perf: arm_pmu: Kill last use of per-CPU cpu_armpmu pointer")
Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 drivers/perf/arm_pmuv3.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 8014ff766cff..2d097fad9c10 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1074,8 +1074,15 @@ static int armv8pmu_user_event_idx(struct perf_event *event)
 static void armv8pmu_sched_task(struct perf_event_pmu_context *pmu_ctx,
 				struct task_struct *task, bool sched_in)
 {
-	struct arm_pmu *armpmu = to_arm_pmu(pmu_ctx->pmu);
-	struct pmu_hw_events *hw_events = this_cpu_ptr(armpmu->hw_events);
+	struct arm_pmu *armpmu;
+	struct pmu_hw_events *hw_events;
+
+	/* cpc->task_epc is NULL when no per-task events exist for this PMU */
+	if (!pmu_ctx)
+		return;
+
+	armpmu = to_arm_pmu(pmu_ctx->pmu);
+	hw_events = this_cpu_ptr(armpmu->hw_events);
 
 	if (!hw_events->branch_users)
 		return;
-- 
2.52.0


