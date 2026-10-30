Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4107C606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wd8B+6Zt;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RQomrtf8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vrFLm/cCax5yQI71l8CSG587q1vifAi7hQZt2T8Cg7s=; b=wd8B+6ZtmnSM1C
	lRSYK1YrktK1K9slvL9vHWQOcmh/0RavGwXP1Sk7Wssp/jVGGIP9DRFISzukroIpxnaQXvxXtpH9S
	VRD4nlE+gGh6qdtVFGiuagznLch3SdN4iM7YoItDCCBQyjKh8f5kMhnRk3EjWBakVcSGjf2kenmPv
	Tc6SnwiD4Hc6bKInaOFjYzBF1Ykj27mFgB9arbi0CEoBrhbkoQ53UY8L0O+ycrn1v8KF2k4TMx32m
	47c3KQwbzr+yBENl/VgNt+U+UgQndWmfNVP0uHBOlyk/2pDKuwKlkuVQPcnF6bIBbMucmCpz6o3sq
	UiqfRhd5lHaB3LgK0n1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoIj-0000000BxZi-2p1b;
	Fri, 30 Oct 2026 15:13:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoIY-0000000BxT6-3cwA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:13:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCCCD1BD0;
	Fri, 30 Oct 2026 08:13:38 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A41193F59E;
	Fri, 30 Oct 2026 08:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793373221; bh=9ktypl1JqI0GWoy1OCHdCp+amWjg+77FtBUCJzM1uhE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RQomrtf8+sgBKINaoHQMAlmUVuVhlfl8M1vvS0QUiWt4M8crnz6+AI0JE2WLt3K/0
	 V9fkSrUudlNWatWkFGfbhhZyizf/pWJd16VhJvNMcVAFovJCRgRXQs62Lspsou9aSU
	 2WR+qvYS/9NaoIBVcngBehERKkODxhAuI9XWCi3I=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 30 Oct 2026 15:13:14 +0000
Subject: [PATCH v3 07/14] perf cs-etm: Factor out final instruction sample
 synthesis
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-perf_cs_etm_fix_non_taken-v3-7-7629b52ab047@arm.com>
References: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
In-Reply-To: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Suyash Mahar <smahar@meta.com>, 
 Amir Ayupov <aaupov@fb.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793373201; l=3739;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=9ktypl1JqI0GWoy1OCHdCp+amWjg+77FtBUCJzM1uhE=;
 b=x4NYgbz3FMG00a7UH+RzdMK0YhVi7rrz8hLReaLrwJlij0ZmF10X2JUFCJ5tgK36/GfCX6pIz
 1KzkACdRPThAFtqZDkSBtAB5XNODWB9xefL/KeC0SF95KRWbsR3d5uD
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_081343_004760_B0280DE8 
X-CRM114-Status: GOOD (  18.21  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

cs_etm__flush() and cs_etm__end_block() duplicate the instruction sample
used to report the remaining branch history at the end of a trace.

Move this code into cs_etm__synth_last_instruction_sample(), preserving
the sample generation and instruction period reset.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 71 ++++++++++++++++++------------------------------
 1 file changed, 26 insertions(+), 45 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 7cb9f69ead2b134b62653f133da7bdec23aaf280..9abbbc28dd1e2a66eadd663ce18217cd62deb390 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1727,6 +1727,28 @@ static int cs_etm__synth_instruction_sample(struct cs_etm_queue *etmq,
 	return ret;
 }
 
+static int cs_etm__synth_last_instruction_sample(struct cs_etm_queue *etmq,
+						 struct cs_etm_traceid_queue *tidq)
+{
+	struct cs_etm_packet *packet = tidq->prev_packet;
+	int ret;
+
+	if (!etmq->etm->synth_opts.last_branch ||
+	    !etmq->etm->synth_opts.instructions)
+		return 0;
+
+	if (packet->sample_type != CS_ETM_RANGE)
+		return 0;
+
+	ret = cs_etm__synth_instruction_sample(etmq, tidq, packet,
+					       cs_etm__last_executed_instr(packet),
+					       tidq->period_instructions);
+	if (!ret)
+		tidq->period_instructions = 0;
+
+	return ret;
+}
+
 /*
  * The cs etm packet encodes an instruction range between a branch target
  * and the next taken branch. Generate sample accordingly.
@@ -2065,28 +2087,9 @@ static int cs_etm__flush(struct cs_etm_queue *etmq,
 	if (tidq->prev_packet->sample_type == CS_ETM_EMPTY)
 		goto swap_packet;
 
-	if (etmq->etm->synth_opts.last_branch &&
-	    etmq->etm->synth_opts.instructions &&
-	    tidq->prev_packet->sample_type == CS_ETM_RANGE) {
-		u64 addr;
-		/*
-		 * Generate a last branch event for the branches left in the
-		 * circular buffer at the end of the trace.
-		 *
-		 * Use the address of the end of the last reported execution
-		 * range
-		 */
-		addr = cs_etm__last_executed_instr(tidq->prev_packet);
-
-		err = cs_etm__synth_instruction_sample(
-			etmq, tidq, tidq->prev_packet, addr,
-			tidq->period_instructions);
-		if (err)
-			return err;
-
-		tidq->period_instructions = 0;
-
-	}
+	err = cs_etm__synth_last_instruction_sample(etmq, tidq);
+	if (err)
+		return err;
 
 	if (etm->synth_opts.branches &&
 	    tidq->prev_packet->sample_type == CS_ETM_RANGE) {
@@ -2108,8 +2111,6 @@ static int cs_etm__flush(struct cs_etm_queue *etmq,
 static int cs_etm__end_block(struct cs_etm_queue *etmq,
 			     struct cs_etm_traceid_queue *tidq)
 {
-	int err;
-
 	/*
 	 * It has no new packet coming and 'etmq->packet' contains the stale
 	 * packet which was set at the previous time with packets swapping;
@@ -2119,27 +2120,7 @@ static int cs_etm__end_block(struct cs_etm_queue *etmq,
 	 * event for the branches left in the circular buffer at the end of
 	 * the trace.
 	 */
-	if (etmq->etm->synth_opts.last_branch &&
-	    etmq->etm->synth_opts.instructions &&
-	    tidq->prev_packet->sample_type == CS_ETM_RANGE) {
-		u64 addr;
-
-		/*
-		 * Use the address of the end of the last reported execution
-		 * range.
-		 */
-		addr = cs_etm__last_executed_instr(tidq->prev_packet);
-
-		err = cs_etm__synth_instruction_sample(
-			etmq, tidq, tidq->prev_packet, addr,
-			tidq->period_instructions);
-		if (err)
-			return err;
-
-		tidq->period_instructions = 0;
-	}
-
-	return 0;
+	return cs_etm__synth_last_instruction_sample(etmq, tidq);
 }
 
 static int cs_etm__flush_stack_cb(struct thread *thread,

-- 
2.34.1


