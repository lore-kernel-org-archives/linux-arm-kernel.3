Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82352C98311
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rj79nPWv1tuwc4gmMfzokJTt77/w2020N1Ve/ImKMs=; b=xgIdyarRF//eCokpZHDZmgpfSm
	fbq9CEdzmFxtdMOHbQdEkQllR74d+elbaJsoQnFrY/YCcGXgFUutYENvRk8tsM4GTEJIzKuzImHa+
	nIzBDC7JqqGjEsAXjMOITD23bumZH7B+PCMan5uTDHjGb6lv76kh/PMaqN/tdxX63i5r4ITfEmFfq
	+Jo+gMn1SsmgxEN0u9PGVis+rSzBVnHQkM09OTw/mU+IK25mDmfD4L3cy0GqSTMy3c1Cbwo3EixRM
	fLmJKp6goich0EwX40gDkrL8FXhRnrs8mlyRo0Fv1tJ4bA72ZwEdr6K97oQmIuym/X4rplfgq+g8F
	XMuHTeMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Oo3-00000008iEG-1XqG;
	Wed, 23 Sep 2026 15:22:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Onb-00000008hyK-2ULf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:22:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4979C1D6F;
	Wed, 23 Sep 2026 08:22:15 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F9663F86F;
	Wed, 23 Sep 2026 08:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790176938; bh=hPqdR80akvK7Nfqzy3k8MnAmzU+aKUYR/Uuzx/bHgb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rvnX2tfWzMyqeIs2iJOYRIxwOhQO2Wh3jtiedIkrBrJ03RhUwDZUIBm8V3emR4JhR
	 3qiPoEcYo1An7jDY5YWWc203NLu1dXaHLF87T9XZdeThpJGcUDRbw0GH1eb3Im4NB/
	 fe9ETNTHLAq9CmEBVfE5kZjb8a9UmLF5TrrKzLGs=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 23 Sep 2026 16:21:49 +0100
Subject: [PATCH v2 09/14] perf cs-etm: Classify exception calls using the
 exception packet
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-perf_cs_etm_fix_non_taken-v2-9-6ab8c07a5455@arm.com>
References: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
In-Reply-To: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790176913; l=4462;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=hPqdR80akvK7Nfqzy3k8MnAmzU+aKUYR/Uuzx/bHgb8=;
 b=PnSsJFS+2FvuZNBiU02dhEYbvGfqez75wpNzNNCgPt5Rai7e9KtxQ4OW7KFOy6bs34jHyuQ/7
 dfiKaG22yKaBEglTDJ/AmusPDtSPnqe876q/+Fo/diFa8RLcGUoyuqY
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_082219_808668_E5224A57 
X-CRM114-Status: GOOD (  15.13  )
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

ETMv4 and ETE use the same exception number for SVC, HVC and SMC.
Identify SVC by inspecting the instruction before the preferred return
address in the exception packet.

Preserve the exception level and preferred return address from OpenCSD,
and use them with the packet's ISA in cs_etm__is_syscall() and
cs_etm__is_sync_exception(). This makes exception call classification
independent of the preceding instruction range.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  7 ++++++-
 tools/perf/util/cs-etm.c                        | 10 +++-------
 tools/perf/util/cs-etm.h                        |  1 +
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 469aba5e596a791289c5bcece132aba7b0baf6c3..48e8c355a3e495cc30dcb4056c04a034d10ce860 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -511,7 +511,8 @@ cs_etm_decoder__buffer_exception(struct cs_etm_queue *etmq,
 				 struct cs_etm_packet_queue *queue,
 				 const ocsd_generic_trace_elem *elem,
 				 const uint8_t trace_chan_id)
-{	int ret = 0;
+{
+	int ret = 0;
 	struct cs_etm_packet *packet;
 
 	ret = cs_etm_decoder__buffer_packet(etmq, queue, elem, trace_chan_id,
@@ -521,6 +522,10 @@ cs_etm_decoder__buffer_exception(struct cs_etm_queue *etmq,
 
 	packet = &queue->packet_buffer[queue->tail];
 	packet->exception_number = elem->exception_number;
+	if (elem->context.el_valid)
+		packet->el = elem->context.exception_level;
+	if (elem->excep_ret_addr)
+		packet->end_addr = elem->en_addr;
 
 	return ret;
 }
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index c8a92b5dba6001329d68766d540b9b7ead90e9e6..a40b3b2fe2e6318154111d9b7ebd05bee53934f1 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -2019,7 +2019,7 @@ static int cs_etm__exception(struct cs_etm_traceid_queue *tidq)
 	 * to generate branch sample for the instruction range before the
 	 * exception is trapped to kernel or before the exception returning.
 	 *
-	 * The exception packet includes the dummy address values, so don't
+	 * The exception packet does not describe an instruction range, so don't
 	 * swap PACKET with PREV_PACKET.  This keeps PREV_PACKET to be useful
 	 * for generating instruction and branch samples.
 	 */
@@ -2225,7 +2225,6 @@ static bool cs_etm__is_syscall(struct cs_etm_queue *etmq,
 			       struct cs_etm_traceid_queue *tidq, u64 magic)
 {
 	struct cs_etm_packet *packet = tidq->packet;
-	struct cs_etm_packet *prev_packet = tidq->prev_packet;
 
 	if (magic == __perf_cs_etmv3_magic)
 		if (packet->exception_number == CS_ETMV3_EXC_SVC)
@@ -2238,8 +2237,7 @@ static bool cs_etm__is_syscall(struct cs_etm_queue *etmq,
 	 */
 	if (magic == __perf_cs_etmv4_magic || magic == __perf_cs_ete_magic) {
 		if (packet->exception_number == CS_ETMV4_EXC_CALL &&
-		    cs_etm__is_svc_instr(etmq, tidq, prev_packet,
-					 prev_packet->end_addr))
+		    cs_etm__is_svc_instr(etmq, tidq, packet, packet->end_addr))
 			return true;
 	}
 
@@ -2277,7 +2275,6 @@ static bool cs_etm__is_sync_exception(struct cs_etm_queue *etmq,
 				      u64 magic)
 {
 	struct cs_etm_packet *packet = tidq->packet;
-	struct cs_etm_packet *prev_packet = tidq->prev_packet;
 
 	if (magic == __perf_cs_etmv3_magic)
 		if (packet->exception_number == CS_ETMV3_EXC_SMC ||
@@ -2301,8 +2298,7 @@ static bool cs_etm__is_sync_exception(struct cs_etm_queue *etmq,
 		 * (SMC, HVC) are taken as sync exceptions.
 		 */
 		if (packet->exception_number == CS_ETMV4_EXC_CALL &&
-		    !cs_etm__is_svc_instr(etmq, tidq, prev_packet,
-					  prev_packet->end_addr))
+		    !cs_etm__is_svc_instr(etmq, tidq, packet, packet->end_addr))
 			return true;
 
 		/*
diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
index b81099c2b301c25f894cc9a50edfde87aceff49d..4d03f2a680b58aacd91c9f6c957fb2d38e7ac2ad 100644
--- a/tools/perf/util/cs-etm.h
+++ b/tools/perf/util/cs-etm.h
@@ -174,6 +174,7 @@ struct cs_etm_packet {
 	enum cs_etm_sample_type sample_type;
 	enum cs_etm_isa isa;
 	u64 start_addr;
+	/* For exceptions: preferred return address, or CS_ETM_INVAL_ADDR. */
 	u64 end_addr;
 	u32 instr_count;
 	u32 last_instr_type;

-- 
2.34.1


