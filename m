Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22691D1039E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 16:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVSNNU3ldaQrvvEZ/fKg4y/TbfjXa9imyGEwHgZTKHo=; b=2ZcMBiZghdXu4Kem7XUd1od8Yl
	5eSPaEzwB306l1ycsTAEad27ZfS89c1dAPgOhA/Ae8VEN2ekUfUHvSOVRmrioW46Y5sXxLknHSROJ
	tcgAlvaCEh5DfjqE7/sa6xiqt6jaTJawig6Sn1GIGDeztnbQEf8FmGQLTM/7QAFg/GbbuFx1+dvg3
	FNHa6qtobpOcsksJCqvHj2NSU9zoJ12x8PxC2SEIJBK8Sojs/l2HGciL+ywapRdKMQ8lyPl+Cr2T4
	f4jZqVKDvdvfVPRorSPq3Utu5QRe9l02h+fNSYBSgMID7fIby6m+Z+elYlGg3Js2JrZkOiFlDWozg
	lyFhWaog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Mkb-00000004L9o-2zDP;
	Fri, 25 Oct 2024 16:01:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LL6-000000041NV-2KRx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:30:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E74A7339;
	Fri, 25 Oct 2024 07:31:25 -0700 (PDT)
Received: from VDW30FN91H.arm.com (unknown [10.57.79.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F3AB53F73B;
	Fri, 25 Oct 2024 07:30:53 -0700 (PDT)
From: Graham Woodward <graham.woodward@arm.com>
To: acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	irogers@google.com,
	james.clark@linaro.org,
	mike.leach@linaro.org,
	leo.yan@linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: nd@arm.com,
	Graham Woodward <graham.woodward@arm.com>
Subject: [PATCH v1 2/4] perf arm-spe: Use ARM_SPE_OP_BRANCH_ERET when synthesizing branches
Date: Fri, 25 Oct 2024 15:30:07 +0100
Message-Id: <20241025143009.25419-3-graham.woodward@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241025143009.25419-1-graham.woodward@arm.com>
References: <20241025143009.25419-1-graham.woodward@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_073056_731909_AE92EE0D 
X-CRM114-Status: GOOD (  10.39  )
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

Instead of checking the type for just branch misses, we can instead
check for the OP_BRANCH_ERET and synthesise branches as well as
branch misses.

Signed-off-by: Graham Woodward <graham.woodward@arm.com>
---
 tools/perf/util/arm-spe.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 49b763807360..e60e21d24735 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -68,7 +68,7 @@ struct arm_spe {
 	u64				llc_access_id;
 	u64				tlb_miss_id;
 	u64				tlb_access_id;
-	u64				branch_miss_id;
+	u64				branch_id;
 	u64				remote_access_id;
 	u64				memory_id;
 	u64				instructions_id;
@@ -672,8 +672,8 @@ static int arm_spe_sample(struct arm_spe_queue *speq)
 		}
 	}
 
-	if (spe->sample_branch && (record->type & ARM_SPE_BRANCH_MISS)) {
-		err = arm_spe__synth_branch_sample(speq, spe->branch_miss_id);
+	if (spe->sample_branch && (record->op & ARM_SPE_OP_BRANCH_ERET)) {
+		err = arm_spe__synth_branch_sample(speq, spe->branch_id);
 		if (err)
 			return err;
 	}
@@ -1385,12 +1385,12 @@ arm_spe_synth_events(struct arm_spe *spe, struct perf_session *session)
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
2.40.1


