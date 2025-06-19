Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B23BC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h6tLRoSMhyB2Mg2bQkNb3+AueLmOySEOVo0oHYZX6VI=; b=FNu0zmPS94oQRck7vEivLDRTWQ
	lbP41dCgOeLPVebEfzmRy8QOdHA2IM7qkTs9kKP5cReyfmUftQNxAaIxN+BPRSQ7/VMy5PNMCFDMr
	+TFLxklKI4+d7MbemkaQFQi/kPWdcrCiUejaDQ+eQ2+4IV4h8ClcPgYtFB7ONtQybgyb5vOpCQyup
	QyRrYeiTe2Suj42K/hsP2B6XIUz39gLs51ppYPVCmJWVfl6uoP1wCtrYqCG2GmG/b/Hj6BuYJP5QI
	QKYA/rGIiBpTXu671D0ynso/427hRT6XhKg8EwsOl9LAgUdgiILFa9mCNYInDh5Xki8M6ZOMGHZF7
	woBZxz1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHTm-0000000DVAH-2m5C;
	Thu, 19 Jun 2025 15:47:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEFq-0000000D1ll-0hdf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:20:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC59012FC;
	Thu, 19 Jun 2025 05:20:09 -0700 (PDT)
Received: from oss-apollo7005.oss.cambridge.arm.com (oss-apollo7005.oss.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 760423F66E;
	Thu, 19 Jun 2025 05:20:28 -0700 (PDT)
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	luke.parkin@arm.com,
	philip.radford@arm.com
Subject: [PATCH 3/4] include: trace: Add inflight_xfer counter tracepoint
Date: Thu, 19 Jun 2025 12:20:03 +0000
Message-Id: <20250619122004.3705976-4-philip.radford@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250619122004.3705976-1-philip.radford@arm.com>
References: <20250619122004.3705976-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_052030_297345_4D95C646 
X-CRM114-Status: GOOD (  10.34  )
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

Add tracepoint for inflight_xfers and patch all related callsites.

Signed-off-by: Philip Radford <philip.radford@arm.com>
---
 drivers/firmware/arm_scmi/driver.c   |  4 ++--
 drivers/firmware/arm_scmi/raw_mode.c |  5 +++--
 include/trace/events/scmi.h          | 24 ++++++++++++++----------
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 5a4dac27afdf..c6657582c9ab 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1443,7 +1443,7 @@ static int do_xfer(const struct scmi_protocol_handle *ph,
 
 	trace_scmi_xfer_begin(xfer->transfer_id, xfer->hdr.id,
 			      xfer->hdr.protocol_id, xfer->hdr.seq,
-			      xfer->hdr.poll_completion);
+			      xfer->hdr.poll_completion, 0);
 
 	/* Clear any stale status */
 	xfer->hdr.status = SCMI_SUCCESS;
@@ -1479,7 +1479,7 @@ static int do_xfer(const struct scmi_protocol_handle *ph,
 		info->desc->ops->mark_txdone(cinfo, ret, xfer);
 
 	trace_scmi_xfer_end(xfer->transfer_id, xfer->hdr.id,
-			    xfer->hdr.protocol_id, xfer->hdr.seq, ret);
+			    xfer->hdr.protocol_id, xfer->hdr.seq, ret, 0);
 
 	return ret;
 }
diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 3d543b1d8947..2ccb6b3f0e64 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -475,7 +475,8 @@ static void scmi_xfer_raw_worker(struct work_struct *work)
 			raw->desc->ops->mark_txdone(rw->cinfo, ret, xfer);
 
 		trace_scmi_xfer_end(xfer->transfer_id, xfer->hdr.id,
-				    xfer->hdr.protocol_id, xfer->hdr.seq, ret);
+				    xfer->hdr.protocol_id, xfer->hdr.seq,
+				    ret, 0);
 
 		/* Wait also for an async delayed response if needed */
 		if (!ret && xfer->async_done) {
@@ -642,7 +643,7 @@ static int scmi_do_xfer_raw_start(struct scmi_raw_mode_info *raw,
 
 	trace_scmi_xfer_begin(xfer->transfer_id, xfer->hdr.id,
 			      xfer->hdr.protocol_id, xfer->hdr.seq,
-			      xfer->hdr.poll_completion);
+			      xfer->hdr.poll_completion, 0);
 
 	ret = raw->desc->ops->send_message(rw->cinfo, xfer);
 	if (ret) {
diff --git a/include/trace/events/scmi.h b/include/trace/events/scmi.h
index 127300481123..703b7bb68e44 100644
--- a/include/trace/events/scmi.h
+++ b/include/trace/events/scmi.h
@@ -36,8 +36,8 @@ TRACE_EVENT(scmi_fc_call,
 
 TRACE_EVENT(scmi_xfer_begin,
 	TP_PROTO(int transfer_id, u8 msg_id, u8 protocol_id, u16 seq,
-		 bool poll),
-	TP_ARGS(transfer_id, msg_id, protocol_id, seq, poll),
+		 bool poll, int inflight),
+	TP_ARGS(transfer_id, msg_id, protocol_id, seq, poll, inflight),
 
 	TP_STRUCT__entry(
 		__field(int, transfer_id)
@@ -45,6 +45,7 @@ TRACE_EVENT(scmi_xfer_begin,
 		__field(u8, protocol_id)
 		__field(u16, seq)
 		__field(bool, poll)
+		__field(int, inflight)
 	),
 
 	TP_fast_assign(
@@ -53,11 +54,12 @@ TRACE_EVENT(scmi_xfer_begin,
 		__entry->protocol_id = protocol_id;
 		__entry->seq = seq;
 		__entry->poll = poll;
+		__entry->inflight = inflight;
 	),
 
-	TP_printk("pt=%02X msg_id=%02X seq=%04X transfer_id=%X poll=%u",
-		__entry->protocol_id, __entry->msg_id, __entry->seq,
-		__entry->transfer_id, __entry->poll)
+	TP_printk("pt=%02X msg_id=%02X seq=%04X transfer_id=%X poll=%u inflight=%d",
+		  __entry->protocol_id, __entry->msg_id, __entry->seq,
+		  __entry->transfer_id, __entry->poll, __entry->inflight)
 );
 
 TRACE_EVENT(scmi_xfer_response_wait,
@@ -90,8 +92,8 @@ TRACE_EVENT(scmi_xfer_response_wait,
 
 TRACE_EVENT(scmi_xfer_end,
 	TP_PROTO(int transfer_id, u8 msg_id, u8 protocol_id, u16 seq,
-		 int status),
-	TP_ARGS(transfer_id, msg_id, protocol_id, seq, status),
+		 int status, int inflight),
+	TP_ARGS(transfer_id, msg_id, protocol_id, seq, status, inflight),
 
 	TP_STRUCT__entry(
 		__field(int, transfer_id)
@@ -99,6 +101,7 @@ TRACE_EVENT(scmi_xfer_end,
 		__field(u8, protocol_id)
 		__field(u16, seq)
 		__field(int, status)
+		__field(int, inflight)
 	),
 
 	TP_fast_assign(
@@ -107,11 +110,12 @@ TRACE_EVENT(scmi_xfer_end,
 		__entry->protocol_id = protocol_id;
 		__entry->seq = seq;
 		__entry->status = status;
+		__entry->inflight = inflight;
 	),
 
-	TP_printk("pt=%02X msg_id=%02X seq=%04X transfer_id=%X s=%d",
-		__entry->protocol_id, __entry->msg_id, __entry->seq,
-		__entry->transfer_id, __entry->status)
+	TP_printk("pt=%02X msg_id=%02X seq=%04X transfer_id=%X s=%d inflight=%d",
+		  __entry->protocol_id, __entry->msg_id, __entry->seq,
+		  __entry->transfer_id, __entry->status, __entry->inflight)
 );
 
 TRACE_EVENT(scmi_rx_done,
-- 
2.25.1


