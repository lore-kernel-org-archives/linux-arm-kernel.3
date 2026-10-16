Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F596CCF2C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 21:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPm26vsD7C2oD7LjNQsP2D7iLMxNFzVvLLOXAe/5a1Q=; b=cxYwxDD5M8oera9g8AdG9fgFL7
	ghpDOZha2FbhXlHow6eD1+ASOQ/rgTV2m2pDLuOKLKkV4ULTCOISEfogXgYdpABONXSdqth1xyyCj
	eOIugPOXwJj9OiqXj7ufkc1n57AcG3ntE3EGwFpHW1Yf+mD35Jog11TflhKSxBbh5HjkRdmmKRvBu
	ftrwfv5x1Ax1303r5S6we+H3mNjVGPBskSx2GQE8R2FHJZEXAlSeFu3UyXkF0dmdSsL5Prx+g/n8/
	qFI4Z2q/stvWMmTct7z/wfX2LzpCwvCJ0hH8F5UwyCY0C0mtrgonD4cLsO9hIMs1iXyhn4UCFF2Xf
	KizhXEsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpE5-000000044DV-3mow;
	Fri, 16 Oct 2026 21:12:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpDt-0000000446n-20u2
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 21:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PPm26vsD7C2oD7LjNQsP2D7iLMxNFzVvLLOXAe/5a1Q=; b=XIMOIiOvPGO5nPYj7f1TLiWzBg
	2LXDgz4wSWCt6siTLG9siAcG8+gwfIDDpXWtt2Jxm0VMq0zotvmuQmrD0rUd3c1LIGAd4lea9gKxB
	34mMpIIPrmBJs+8Qvbc+iMQgCRT+kb1uD5chE5GdpSvHr+IiEYeg87yAeI3kEbn3sdzqZM/pyT4tE
	BsKtkxOV61iF5Lcm2jbIF01Ifx7g0GQixRG2lX7JvmH5T9rTjMe0sbw6yEVFmpPAM3kfd9I99C+Ws
	+EXNlh/EctWrO4G3JEn2WgbvlqF26TWzuSknQEKhD8xpt0SVoIS4zlADpBnUtssO6wHvlBdBVNfi/
	5hJIoOHg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHpDo-00000001xTb-0VWJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 21:12:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74F2E1762;
	Fri, 16 Oct 2026 14:12:07 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 334E03F673;
	Fri, 16 Oct 2026 14:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792185130; bh=WinRZcQJ2thC4qrPCAsf4pxVvrWRPdI5x9Ud16MKKJ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WAIk804gq6YpDzW40p2RJT2iwnlgZCwKR9VkC9YbUjhuzMOMc7ouOSeZ9PEBHKQ7R
	 PQFlu2FyGQiI05YBA5rTg38vVzmGMeOgpDM9+hn7sZb49yC2GSatTmSn1+jgGMx/5m
	 4GqE95DuupSGmAAea3foFcM1apcSMcKlicJRfMFo=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 22:11:47 +0100
Subject: [PATCH v2 09/11] perf cs-etm: Reset per-thread decoder on CPU
 migration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_buffer_refactor_v2-v2-9-383ac26382fa@arm.com>
References: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
In-Reply-To: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792185112; l=3810;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=WinRZcQJ2thC4qrPCAsf4pxVvrWRPdI5x9Ud16MKKJ4=;
 b=E06a9BXdgsu4XZGeU2DFfO/qhH5ny03CnBjr0YDj0GJI+FHSjfVEySfflZHEnH1YQJS+D09j4
 A6EP5ytlyhmBO1NC49EZn6m+C671dZ3MfXfIg0Noc8dLyr8IMd6JKhC
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_221212_545659_9FD602AD 
X-CRM114-Status: GOOD (  18.85  )
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

In per-thread mode all AUX fragments for a thread are decoded by a
single decoder, even if the task migrates between CPUs. If independent
fragments come from different CPUs, the trace stream may not be
contiguous for that decoder context.

Retain the CPU from each AUX sample in its queued fragment. Compare the
preceding and fetched buffer CPUs in cs_etm__get_trace() and request a
reset when either CPU is unknown or their CPU IDs differ. Indexed files
can omit PERF_SAMPLE_CPU and hardware-ID records while remaining
decodable through TID matching and the legacy metadata mapping. An
unknown CPU therefore cannot establish trace continuity.

On 32-bit hosts, queuing a large AUX fragment can split it into several
buffers while returning only the final piece. Save the queue tail
before queuing and tag every newly added piece with the AUX sample CPU.
Do this after queuing to preserve CPU filtering based on the original
AUXTRACE record. Per-CPU fragments already match the sample CPU, so use
the same assignment in both modes.

Skip CPU comparisons for internally split continuation buffers, which
belong to the same AUX fragment. Keep AUX flags on the final piece so a
collision applies after the whole fragment.

Check CPU metadata even for empty fragments. Preserve any reset request
until the next nonempty block is decoded.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 6f95730fe3b94ae3f534eee505132a2efbc4ff96..8f04d7ceddd9d1f7ff22af234b19400efe27ba2b 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1486,6 +1486,16 @@ cs_etm__get_trace(struct cs_etm_queue *etmq)
 			   (old_buffer->aux_flags & PERF_AUX_FLAG_COLLISION)))
 		etmq->reset_decoder = true;
 
+	/*
+	 * Unknown or different CPUs cannot establish per-thread continuity.
+	 * Internally split buffers still belong to the same AUX fragment.
+	 */
+	if (etmq->etm->per_thread_decoding && old_buffer &&
+	    !aux_buffer->consecutive &&
+	    (old_buffer->cpu.cpu == -1 || aux_buffer->cpu.cpu == -1 ||
+	     old_buffer->cpu.cpu != aux_buffer->cpu.cpu))
+		etmq->reset_decoder = true;
+
 	return 0;
 }
 
@@ -3251,10 +3261,15 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 	if (aux_offset >= auxtrace_event->offset &&
 	    aux_offset + aux_size <= auxtrace_event->offset + auxtrace_event->size) {
 		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, auxtrace_event->cpu);
+		struct auxtrace_buffer *pos;
+		struct list_head *head;
 
 		if (!etmq)
 			return -EINVAL;
 
+		head = &etm->queues.queue_array[etmq->queue_nr].head;
+		pos = list_last_entry_or_null(head, struct auxtrace_buffer, list);
+
 		/*
 		 * If this AUX event was inside this buffer somewhere, create a new auxtrace event
 		 * based on the sizes of the aux event, and queue that fragment.
@@ -3272,9 +3287,22 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 		if (err)
 			return err;
 
-		if (buffer)
+		if (buffer) {
 			buffer->aux_flags = aux_event->flags;
 
+			/*
+			 * Preserve queue-time CPU filtering and tag every split
+			 * piece added after the previous tail, up to the returned
+			 * buffer, for migration detection.
+			 */
+			pos = list_prepare_entry(pos, head, list);
+			list_for_each_entry_continue(pos, head, list) {
+				pos->cpu.cpu = sample->cpu;
+				if (pos == buffer)
+					break;
+			}
+		}
+
 		format = (aux_event->flags & PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW) ?
 				UNFORMATTED : FORMATTED;
 		if (etmq->format != UNSET && format != etmq->format) {

-- 
2.34.1


