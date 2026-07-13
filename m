Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E318DC44507
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 18:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXGyKQ6JdDjSiIQ0uHEWB+8t3xTjKVA42cfdu1rPiOs=; b=YfxiTCUktBtq+Dd5Ec7gRHL25o
	jTI3VkvVhiBSJxi4LUr4LscA7fgsQEMLsJmQ026fIGRrzTMFy7Vz799C40Ot0X5Fx2VkJ22FSmQU0
	uyjdtMX2WmxRCq8FG4iwccHYnbT6MkqgjV+iZSRMo0bu7LKGokRIU33QnufpDb5Yobd8JVqzghUWD
	1tp6D5+9SFADG2nvDjET5tiKcQ5gLZ+YqG+zMmSvgz8zfkwbiAlCQK6edZR+ENvLMzKKVuGxSlM68
	onKMwI/LguSbsV3w254yJY+0AjNm/hNSBfTgt0Khd3bUdrPtqMdY1AH+nm2MfI/8VM5bsLJT2Hq3T
	9cobVMbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKxU-0000000AAEv-1osz;
	Mon, 13 Jul 2026 18:00:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKxQ-0000000AADM-2bTj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 18:00:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 592F11655;
	Mon, 13 Jul 2026 11:00:39 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67FA23F7D8;
	Mon, 13 Jul 2026 11:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783965643; bh=CUa2bT0eVTigehpKDFKSL6mjM9vm0Q7oszZakKLTV7k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c5VXTsaXuFy9OIMvv4QPf3V3m1OCyIhv5iZojp8nVOcbHbO4LjCdEtN1DD6nAjuq8
	 tQONb1oB5MuXlMad395EeccILRZgySeBDJ86dn/Ct6fZhlMp6zBMjw4XBiZGDdDaPZ
	 AswNx5qYMPvhpB2cY2/PxatcmIl65s4vRC/4v7Zc=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 13 Jul 2026 19:00:28 +0100
Subject: [PATCH 2/2] perf cs-etm: Centralize branch sample checks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-perf_cs_etm_fix_non_taken-v1-2-4561607fc69f@arm.com>
References: <20260713-perf_cs_etm_fix_non_taken-v1-0-4561607fc69f@arm.com>
In-Reply-To: <20260713-perf_cs_etm_fix_non_taken-v1-0-4561607fc69f@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783965636; l=2069;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=CUa2bT0eVTigehpKDFKSL6mjM9vm0Q7oszZakKLTV7k=;
 b=xAg5bgeFR2wRfmMeJIDvqLx43OH92ymyXh2TCTICDAbR78G0/5yuQL9QvIRa+JVkibGUhibBo
 bdwWcsyqNmWBkG9PcAJz3AYS1K23Cz0mYM5JjI+3tw4LzY0PzjK96e/
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_110044_760839_9379AD03 
X-CRM114-Status: GOOD (  12.14  )
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

cs_etm__sample() validates whether the previous packet should generate
a branch sample before calling cs_etm__synth_branch_sample(), while
cs_etm__flush() generates branch samples unconditionally.

Move the eligibility check into cs_etm__synth_branch_sample() so that
both paths apply the same rule: generate branch samples only for
discontinuity packets or range packets ending in a taken branch.

Fixes: d603b4e9f9c3 ("perf cs-etm: Generate branch sample when receiving a CS_ETM_TRACE_ON packet")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 05e698f666bbe07af9caeda1a673f22d7196817a..dec50e2cc7b7857a04f631b3e0e08beb6e7e280a 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1710,6 +1710,11 @@ static int cs_etm__synth_branch_sample(struct cs_etm_queue *etmq,
 		!(etm->branches_filter & tidq->prev_packet->flags))
 		return 0;
 
+	/* Generate branch sample only for tracing on or taken branches */
+	if (tidq->prev_packet->sample_type != CS_ETM_DISCONTINUITY &&
+	    !cs_etm__packet_has_taken_branch(tidq->prev_packet))
+		return 0;
+
 	perf_sample__init(&sample, /*all=*/true);
 	ip = cs_etm__last_executed_instr(tidq->prev_packet);
 
@@ -1946,21 +1951,9 @@ static int cs_etm__sample(struct cs_etm_queue *etmq,
 	}
 
 	if (etm->synth_opts.branches) {
-		bool generate_sample = false;
-
-		/* Generate sample for tracing on packet */
-		if (tidq->prev_packet->sample_type == CS_ETM_DISCONTINUITY)
-			generate_sample = true;
-
-		/* Generate sample for branch taken packet */
-		if (cs_etm__packet_has_taken_branch(tidq->prev_packet))
-			generate_sample = true;
-
-		if (generate_sample) {
-			ret = cs_etm__synth_branch_sample(etmq, tidq);
-			if (ret)
-				return ret;
-		}
+		ret = cs_etm__synth_branch_sample(etmq, tidq);
+		if (ret)
+			return ret;
 	}
 
 	cs_etm__packet_swap(etm, tidq);

-- 
2.34.1


