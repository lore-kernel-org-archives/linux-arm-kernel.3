Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A7DC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 19:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FdA1I4X/z02T/pBorurCb0SB7huV7FyubDXZyaiOvw=; b=QS+TmqoTg5LnBvbyKc6Vj7Picg
	nWfmad0u4X+Byktr6tNdRQmzfOsqFiOJTeVsWbs3fyxkq8XX+YeGZnNue9Heqljv4XYJt5yvyeVsU
	PDxSBt22Du8S62a2PeIOELq3l2lr4koe0ExBDMW683ANKMFaLlK0DziOIHrj+/qeEWSv0ZVd830cu
	izjyW1yRfH1gWgBnAv/ELN7ftjPjyzPEFepj6LpBgZUzFK2Kh0Yk7fn8rvmtvpbEvdKVZfe5AUX5a
	vFkSB+g2fEM4Try3/cMJ+cKmFnJXf2Rt7jn7gVkV6Vj8+Ihevj3nQEKNSwjLgCjWCfG5mornahb/5
	cGwqgThQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGDZ-0000000AIHF-3kpw;
	Tue, 21 Jul 2026 19:33:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGDY-0000000AIGo-25Rz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 19:33:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6DCE7600FC;
	Tue, 21 Jul 2026 19:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A751F00A3A;
	Tue, 21 Jul 2026 19:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784662407;
	bh=/FdA1I4X/z02T/pBorurCb0SB7huV7FyubDXZyaiOvw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZzX5MOPZIqlxtf7xnCkxodwEtL6NbQmF9POlxlqV+hH5Irh/xWkm9XsLXuey3l1b9
	 YGahHAAJpiU/ZKApjWs3VwWwcSKTjtATyIGAybPpS3YAF2LbkBzO8jFdDZv6WZNsET
	 +dcDT1eT2Up/P4e2HsDJ72zBOBoNnlwrFcbkfqqA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Graham Woodward <graham.woodward@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	nd@arm.com,
	mike.leach@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Namhyung Kim <namhyung@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.12 0433/1276] perf arm-spe: Use ARM_SPE_OP_BRANCH_ERET when synthesizing branches
Date: Tue, 21 Jul 2026 17:14:36 +0200
Message-ID: <20260721152455.792328239@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721152446.065700225@linuxfoundation.org>
References: <20260721152446.065700225@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
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

6.12-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Graham Woodward <graham.woodward@arm.com>

[ Upstream commit c1b67c85108f99af0a80aa9e59a2b94ad95428d7 ]

Instead of checking the type for just branch misses, we can instead
check for the OP_BRANCH_ERET and synthesise branches as well as
branch misses.

Signed-off-by: Graham Woodward <graham.woodward@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: Leo Yan <leo.yan@arm.com>
Cc: nd@arm.com
Cc: mike.leach@linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Link: https://lore.kernel.org/r/20241025143009.25419-3-graham.woodward@arm.com
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
Stable-dep-of: 059e9100d82a ("perf event: Fix size of synthesized sample with branch stacks")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/util/arm-spe.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index fcacdd87c0d2b4..ce34cc5a2e7163 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -71,7 +71,7 @@ struct arm_spe {
 	u64				llc_access_id;
 	u64				tlb_miss_id;
 	u64				tlb_access_id;
-	u64				branch_miss_id;
+	u64				branch_id;
 	u64				remote_access_id;
 	u64				memory_id;
 	u64				instructions_id;
@@ -668,8 +668,8 @@ static int arm_spe_sample(struct arm_spe_queue *speq)
 		}
 	}
 
-	if (spe->sample_branch && (record->type & ARM_SPE_BRANCH_MISS)) {
-		err = arm_spe__synth_branch_sample(speq, spe->branch_miss_id);
+	if (spe->sample_branch && (record->op & ARM_SPE_OP_BRANCH_ERET)) {
+		err = arm_spe__synth_branch_sample(speq, spe->branch_id);
 		if (err)
 			return err;
 	}
@@ -1269,12 +1269,12 @@ arm_spe_synth_events(struct arm_spe *spe, struct perf_session *session)
 	if (spe->synth_opts.branches) {
 		spe->sample_branch = true;
 
-		/* Branch miss */
+		/* Branch */
 		err = perf_session__deliver_synth_attr_event(session, &attr, id);
 		if (err)
 			return err;
-		spe->branch_miss_id = id;
-		arm_spe_set_event_name(evlist, id, "branch-miss");
+		spe->branch_id = id;
+		arm_spe_set_event_name(evlist, id, "branch");
 		id += 1;
 	}
 
-- 
2.53.0




