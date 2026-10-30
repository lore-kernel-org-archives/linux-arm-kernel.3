Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F013B606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NlNDuORD;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hhXSUoDb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oFKk3nS8ygAMMKPXq4vJYs4te07iMMKNC18Bp28fxl0=; b=NlNDuORDdE2JnX
	KjBMcLq04fJvtNKoGMaYZG7DWtTMfCirz+L0Mp/SLOevnG+KAxcbg2ou5VkQmL6ugWAuYYUNEU6V/
	0bnb9tbKERERzchGUwn0PCanwKvT0QBhh8Ee+nkrQDlQg7Ky/CDzqMA2+PdHQLmyZLIV6pCQZ5/f/
	iFcrwNFxuebKMUPjn3zj4dakaGOFYC6h/eqVbTBKKxJwHk0K382jccZq1KB4lm6ocCtBc/iU5pOFj
	cQvWx8L3wpUA1rI82WY52ijD0rhWsnpUGImXg5neMbxU7zxreCAmWldstxkC3WiFWaUhbIEo0AzUR
	i5YbLxqkc802C4ald9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoIk-0000000Bxax-0Cpq;
	Fri, 30 Oct 2026 15:13:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoId-0000000BxVg-3kjU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:13:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFE2C1682;
	Fri, 30 Oct 2026 08:13:43 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C55553F59E;
	Fri, 30 Oct 2026 08:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793373227; bh=7CV+vccRraYgpJImEBwcbhSmVEjGGmLdDw8Q04EKyoc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hhXSUoDblqOq8UxHX3oLB+3Pe4xGy/baC4SBOUNjxZNPmLTBTYCID8/ecwBanBkcN
	 QjV0d9rPIY50GP39GFCCo0e/mivCpzTZnpGTX3xWqOukEdtass0yRYEx68JGTPj63s
	 GbviI9VkJX0TK+l4Ifxb7Sb+uhTGj5Tl88LXf+GE=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 30 Oct 2026 15:13:16 +0000
Subject: [PATCH v3 09/14] perf cs-etm: Classify exception calls using the
 exception packet
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-perf_cs_etm_fix_non_taken-v3-9-7629b52ab047@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793373201; l=6528;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=7CV+vccRraYgpJImEBwcbhSmVEjGGmLdDw8Q04EKyoc=;
 b=JApVF8Y5pkMSUWor+afQ3A9VImE97UZ3hN9tl9dmXmX7rUkAdjkaexKacxE2NBWA0C3R+boJm
 bnwE0iK/1FbAQFusHyI2o/8Ip8SCjk0SmzZCqXm5yulaH0NiLLoNL9x
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_081348_437383_5FDF31D0 
X-CRM114-Status: GOOD (  17.35  )
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

ETMv4 and ETE use the same exception number for SVC, HVC and SMC.
Identify SVC by inspecting the instruction before the preferred return
address in the exception packet.

Preserve the exception level and preferred return address from OpenCSD,
and use them with the packet's ISA in cs_etm__is_syscall() and
cs_etm__is_sync_exception(). This makes exception call classification
independent of the preceding instruction range.

Name the exception address pref_ret_addr in an anonymous union shared
with the range end_addr, keeping the packet layout unchanged. Name the
cs_etm__is_svc_instr() address argument ret_addr and document that it
checks the instruction immediately before the return address.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  7 ++++++-
 tools/perf/util/cs-etm.c                        | 21 ++++++++++-----------
 tools/perf/util/cs-etm.h                        |  5 ++++-
 3 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 911bb28db2985bc65828ad342ca5b0a8bb903e47..ccae10e6cdad55607e092b90a1a940103fa050d7 100644
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
+		packet->pref_ret_addr = elem->en_addr;
 
 	return ret;
 }
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index a9191c06060a2455e8bf1cd5f00fb9e92904eefa..14a6466255017386addaee539141bf89b6dcf76f 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -2061,7 +2061,7 @@ static int cs_etm__exception(struct cs_etm_traceid_queue *tidq)
 	 * to generate branch sample for the instruction range before the
 	 * exception is trapped to kernel or before the exception returning.
 	 *
-	 * The exception packet includes the dummy address values, so don't
+	 * The exception packet does not describe an instruction range, so don't
 	 * swap PACKET with PREV_PACKET.  This keeps PREV_PACKET to be useful
 	 * for generating instruction and branch samples.
 	 */
@@ -2192,9 +2192,10 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 	return 1;
 }
 
+/* Check whether the instruction before ret_addr is an SVC. */
 static bool cs_etm__is_svc_instr(struct cs_etm_queue *etmq,
 				 struct cs_etm_traceid_queue *tidq,
-				 struct cs_etm_packet *packet, u64 end_addr)
+				 struct cs_etm_packet *packet, u64 ret_addr)
 {
 	/* Initialise to keep compiler happy */
 	u16 instr16 = 0;
@@ -2215,7 +2216,7 @@ static bool cs_etm__is_svc_instr(struct cs_etm_queue *etmq,
 		 * with 16 bits instruction and has no definition for 32bits;
 		 * so below only read 2 bytes as instruction size for T32.
 		 */
-		addr = end_addr - 2;
+		addr = ret_addr - 2;
 		cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
 					    sizeof(instr16), (u8 *)&instr16);
 		if ((instr16 & 0xFF00) == 0xDF00)
@@ -2231,7 +2232,7 @@ static bool cs_etm__is_svc_instr(struct cs_etm_queue *etmq,
 		 * |  !1111  | 1 1 1 1 |        imm24            |
 		 * +---------+---------+-------------------------+
 		 */
-		addr = end_addr - 4;
+		addr = ret_addr - 4;
 		cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
 					    sizeof(instr32), (u8 *)&instr32);
 		if ((instr32 & 0x0F000000) == 0x0F000000 &&
@@ -2248,7 +2249,7 @@ static bool cs_etm__is_svc_instr(struct cs_etm_queue *etmq,
 		 * | 1 1 0 1 0 1 0 0 0 0 0 |  imm16  | 0 0 0 0 1 |
 		 * +-----------------------+---------+-----------+
 		 */
-		addr = end_addr - 4;
+		addr = ret_addr - 4;
 		cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
 					    sizeof(instr32), (u8 *)&instr32);
 		if ((instr32 & 0xFFE0001F) == 0xd4000001)
@@ -2267,7 +2268,6 @@ static bool cs_etm__is_syscall(struct cs_etm_queue *etmq,
 			       struct cs_etm_traceid_queue *tidq, u64 magic)
 {
 	struct cs_etm_packet *packet = tidq->packet;
-	struct cs_etm_packet *prev_packet = tidq->prev_packet;
 
 	if (magic == __perf_cs_etmv3_magic)
 		if (packet->exception_number == CS_ETMV3_EXC_SVC)
@@ -2280,8 +2280,8 @@ static bool cs_etm__is_syscall(struct cs_etm_queue *etmq,
 	 */
 	if (magic == __perf_cs_etmv4_magic || magic == __perf_cs_ete_magic) {
 		if (packet->exception_number == CS_ETMV4_EXC_CALL &&
-		    cs_etm__is_svc_instr(etmq, tidq, prev_packet,
-					 prev_packet->end_addr))
+		    cs_etm__is_svc_instr(etmq, tidq, packet,
+					 packet->pref_ret_addr))
 			return true;
 	}
 
@@ -2319,7 +2319,6 @@ static bool cs_etm__is_sync_exception(struct cs_etm_queue *etmq,
 				      u64 magic)
 {
 	struct cs_etm_packet *packet = tidq->packet;
-	struct cs_etm_packet *prev_packet = tidq->prev_packet;
 
 	if (magic == __perf_cs_etmv3_magic)
 		if (packet->exception_number == CS_ETMV3_EXC_SMC ||
@@ -2343,8 +2342,8 @@ static bool cs_etm__is_sync_exception(struct cs_etm_queue *etmq,
 		 * (SMC, HVC) are taken as sync exceptions.
 		 */
 		if (packet->exception_number == CS_ETMV4_EXC_CALL &&
-		    !cs_etm__is_svc_instr(etmq, tidq, prev_packet,
-					  prev_packet->end_addr))
+		    !cs_etm__is_svc_instr(etmq, tidq, packet,
+					  packet->pref_ret_addr))
 			return true;
 
 		/*
diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
index b81099c2b301c25f894cc9a50edfde87aceff49d..e40b9b7d0a9bd90f089c2f20527332264ead4249 100644
--- a/tools/perf/util/cs-etm.h
+++ b/tools/perf/util/cs-etm.h
@@ -174,7 +174,10 @@ struct cs_etm_packet {
 	enum cs_etm_sample_type sample_type;
 	enum cs_etm_isa isa;
 	u64 start_addr;
-	u64 end_addr;
+	union {
+		u64 end_addr;		/* Range packets */
+		u64 pref_ret_addr;	/* Exception packets */
+	};
 	u32 instr_count;
 	u32 last_instr_type;
 	u32 last_instr_subtype;

-- 
2.34.1


