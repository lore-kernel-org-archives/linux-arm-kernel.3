Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767D8C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 11:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bivTPowlGQmTy7yuDT95E9A5Mfe9xptdQTOsUs2Gez4=; b=NSKX3AjfJ3jXeB+rxo5yYCBl2p
	ZlGqyUMUUagBgKI7hznI/bBuq6XATX+UEmxNmHSBQn+fPXYUCS/SgqUWR8S2HeSBw8AjAXiKp0hg2
	/gY5YoeGrnNfCqAIyMtRZJDzB4VyDykSLXLKcAV+WB7RtDaAuxCRhLurgufpW7IPhFc0QkKocXWBS
	x6NfFqOr1Hld3qAr7No8FeONo03YFKer1Ni0gaKTIku2PGr3nmrHv/ItwxYlf6m91ZXRZiES5mX+9
	8yYp8kpRxBHyfQOwsgvmYifuvKmjAOD2RE+QNZFyBsNTmNzlKevDzfQQz2zbLizEfo98HeM78BBFN
	1zV0Rptg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txlDM-0000000AnyF-1fp8;
	Thu, 27 Mar 2025 11:16:00 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174] helo=mx0b-0016f401.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txlA3-0000000AnYX-1o26
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 11:12:36 +0000
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R75Ueg012794;
	Thu, 27 Mar 2025 04:12:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=b
	ivTPowlGQmTy7yuDT95E9A5Mfe9xptdQTOsUs2Gez4=; b=GCfVK1Fm9nYf1CVra
	aByeWaYFmg/DqXI+obKiwzGOpnU/R45mdYD/kjAVKdLpLPOjDIi5qOci89QBvVeo
	r7YF1YXxwig59jOGlf4HHbQCuHX6k1IORVKEscjdftPFaR88dSxIh1zxZ/c4QoIV
	UD3aFY3SVyNQV0o7ReWkh/CNDuTAE3rNemuUHWSlo11dBgyJR3M1oBLxcGb2F7ot
	H6tu8u5aT0ckZUr6PZyVTm/zw8G7jmIZIg9xY2gyH1dLQWqqJH3+FzjmyKiO0Bc7
	66CYncNhNZx5aonAjK0t+4aU7I2X+zztRkRlkIMK7QAI0PyxQZlO/kJr5vk8b2eH
	iVX7Q==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 45n1yv8gde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 04:12:26 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 27 Mar 2025 04:12:26 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 27 Mar 2025 04:12:26 -0700
Received: from optiplex.marvell.com (unknown [10.28.34.253])
	by maili.marvell.com (Postfix) with ESMTP id 8C3993F7060;
	Thu, 27 Mar 2025 04:12:21 -0700 (PDT)
From: Tanmay Jagdale <tanmay@marvell.com>
To: <suzuki.poulose@arm.com>, <mike.leach@linaro.org>,
        <james.clark@linaro.org>, <john.g.garry@oracle.com>,
        <leo.yan@linux.dev>, <will@kernel.org>, <acme@kernel.org>,
        <adrian.hunter@intel.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
        <sgoutham@marvell.com>, <gcherian@marvell.com>, <lcherian@marvell.com>,
        Tanmay Jagdale
	<tanmay@marvell.com>,
        James Clark <james.clark@arm.com>
Subject: [PATCH V3 1/2] perf: cs-etm: Fixes in instruction sample synthesis
Date: Thu, 27 Mar 2025 16:41:48 +0530
Message-ID: <20250327111149.461012-2-tanmay@marvell.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327111149.461012-1-tanmay@marvell.com>
References: <20250327111149.461012-1-tanmay@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: huwJN9WSawLQ9rR4h18eHSgrnx9flAsg
X-Authority-Analysis: v=2.4 cv=dKCmmPZb c=1 sm=1 tr=0 ts=67e5329a cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=Vs1iUdzkB0EA:10 a=M5GUcnROAAAA:8 a=7CQSdrXTAAAA:8 a=NoWHmBFwJINbK3vHNx0A:9 a=OBjm3rFKGHvpk9ecZwUJ:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: huwJN9WSawLQ9rR4h18eHSgrnx9flAsg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_041235_490437_EC80D79C 
X-CRM114-Status: GOOD (  19.12  )
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

The existing method to synthesize instruction samples has the
following issues:
1. Branch instruction mnemonics were being added to non-branch
   instructions too.
2. Branch target address was missing

To fix the issues, start synthesizing the instructions from the
previous packet (tidq->prev_packet) instead of current packet
(tidq->packet). This way it's easy to figure out the target
address of the branch instruction in tidq->prev_packet which
is the current packet's (tidq->packet) first executed instruction.

Since we have now switched to processing the previous packet
first, we need not swap the packets during cs_etm__flush().

Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
Reviewed-by: James Clark <james.clark@arm.com>
---
 tools/perf/util/cs-etm.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 0bf9e5c27b59..ebed5b98860e 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1576,10 +1576,26 @@ static int cs_etm__synth_instruction_sample(struct cs_etm_queue *etmq,
 	sample.stream_id = etmq->etm->instructions_id;
 	sample.period = period;
 	sample.cpu = tidq->packet->cpu;
-	sample.flags = tidq->prev_packet->flags;
 	sample.cpumode = event->sample.header.misc;
 
-	cs_etm__copy_insn(etmq, tidq->trace_chan_id, tidq->packet, &sample);
+	cs_etm__copy_insn(etmq, tidq->trace_chan_id, tidq->prev_packet, &sample);
+
+	/* Populate branch target information only when we encounter
+	 * branch instruction, which is at the end of tidq->prev_packet.
+	 */
+	if (addr == (tidq->prev_packet->end_addr - 4)) {
+		/* Update the perf_sample flags using the prev_packet
+		 * since that is the queue we are synthesizing.
+		 */
+		sample.flags = tidq->prev_packet->flags;
+
+		/* The last instruction of the previous queue would be a
+		 * branch operation. Get the target of that branch by looking
+		 * into the first executed instruction of the current packet
+		 * queue.
+		 */
+		sample.addr = cs_etm__first_executed_instr(tidq->packet);
+	}
 
 	if (etm->synth_opts.last_branch)
 		sample.branch_stack = tidq->last_branch;
@@ -1771,7 +1787,7 @@ static int cs_etm__sample(struct cs_etm_queue *etmq,
 	/* Get instructions remainder from previous packet */
 	instrs_prev = tidq->period_instructions;
 
-	tidq->period_instructions += tidq->packet->instr_count;
+	tidq->period_instructions += tidq->prev_packet->instr_count;
 
 	/*
 	 * Record a branch when the last instruction in
@@ -1851,8 +1867,11 @@ static int cs_etm__sample(struct cs_etm_queue *etmq,
 			 * been executed, but PC has not advanced to next
 			 * instruction)
 			 */
+			/* Get address from prev_packet since we are synthesizing
+			 * that in cs_etm__synth_instruction_sample()
+			 */
 			addr = cs_etm__instr_addr(etmq, trace_chan_id,
-						  tidq->packet, offset - 1);
+						  tidq->prev_packet, offset - 1);
 			ret = cs_etm__synth_instruction_sample(
 				etmq, tidq, addr,
 				etm->instructions_sample_period);
@@ -1916,7 +1935,7 @@ static int cs_etm__flush(struct cs_etm_queue *etmq,
 
 	/* Handle start tracing packet */
 	if (tidq->prev_packet->sample_type == CS_ETM_EMPTY)
-		goto swap_packet;
+		goto reset_last_br;
 
 	if (etmq->etm->synth_opts.last_branch &&
 	    etmq->etm->synth_opts.instructions &&
@@ -1952,8 +1971,7 @@ static int cs_etm__flush(struct cs_etm_queue *etmq,
 			return err;
 	}
 
-swap_packet:
-	cs_etm__packet_swap(etm, tidq);
+reset_last_br:
 
 	/* Reset last branches after flush the trace */
 	if (etm->synth_opts.last_branch)
-- 
2.43.0


