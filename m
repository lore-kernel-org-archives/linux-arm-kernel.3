Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F007BC5AD44
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 19:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8jkYesDtxZLUw1KYa0xXV/V4KvRVoKhE6F8BgI4AfmA=; b=LsfEeOWerIkmQHQA7y2/Hji85s
	zmV090UGKrpPizpuXCribiLzw/Wlkx2eL4wNsSn97Jjr5T4ZXUuUHZbqRyL2+eDE0gH92MW1+2PgU
	gSQyajUp08ZExZQ7wXOQ0s//4CJ8A4dhvUM3cmMS8dfb4Pg/zLe4a3fqF7KU8/waWvCpx2UHnShWn
	+OEB4ZNoRZatV/JQAJa/r0sHxyXN63nKvuDwSlxqS7I2C/WLqJp9p4hbZ/pm7AXmCXT9ieAI8rR7W
	o+K8MjCZGCmLtRjcng28nwjR1tt2cZpOWRAYRx6JG9uBb9gkgzO7TIY14Eraws3XeQD9FvQ4Q/s+o
	0BdRpXQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsmTQ-00000009dYn-1q7x;
	Sat, 08 Aug 2026 19:12:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsmTN-00000009dYH-2Ufd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 19:12:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10619152B;
	Sat,  8 Aug 2026 12:12:41 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11BD13F86F;
	Sat,  8 Aug 2026 12:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786216365; bh=PJo0e87K0b7aftzvRmzyQXJCTjcTrGX4WcEBc3ZkxnU=;
	h=From:To:Cc:Subject:Date:From;
	b=CmzlonLmlBpocoeLxHVMGseJiXq5FWo3bMzAaATrmY8xYkC6cFmVX5G+/c5HKhoab
	 pJcpBl+5pZ8f/5pxzQr8fjzyQEhbNphlCDII6P6Q9CfdVcDuGRPV/BlHO3GKGcnhOt
	 AqB8IBz2JvGRbHRYrJqVGDGbgb5WBvxgioMLB5kQ=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	cristian.marussi@arm.com
Subject: [PATCH] include: trace: Use string helpers in msg_dump trace events
Date: Sat,  8 Aug 2026 20:12:34 +0100
Message-ID: <20260808191234.402312-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_121245_671814_325FE1FB 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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

Use proper available ftrace macros to handle tag strings of variable size,
to avoid wasting space using statically oversized arrays while risking to
expose stale stack data when such array is not properly padded when filled.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 include/trace/events/scmi.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/include/trace/events/scmi.h b/include/trace/events/scmi.h
index 703b7bb68e44..b421c253df00 100644
--- a/include/trace/events/scmi.h
+++ b/include/trace/events/scmi.h
@@ -7,8 +7,6 @@
 
 #include <linux/tracepoint.h>
 
-#define TRACE_SCMI_MAX_TAG_LEN	6
-
 TRACE_EVENT(scmi_fc_call,
 	TP_PROTO(u8 protocol_id, u8 msg_id, u32 res_id, u32 val1, u32 val2),
 	TP_ARGS(protocol_id, msg_id, res_id, val1, val2),
@@ -156,7 +154,7 @@ TRACE_EVENT(scmi_msg_dump,
 		__field(u8, channel_id)
 		__field(u8, protocol_id)
 		__field(u8, msg_id)
-		__array(char, tag, TRACE_SCMI_MAX_TAG_LEN)
+		__string(tag, tag)
 		__field(u16, seq)
 		__field(int, status)
 		__field(size_t, len)
@@ -168,7 +166,7 @@ TRACE_EVENT(scmi_msg_dump,
 		__entry->channel_id = channel_id;
 		__entry->protocol_id = protocol_id;
 		__entry->msg_id = msg_id;
-		strscpy(__entry->tag, tag, TRACE_SCMI_MAX_TAG_LEN);
+		__assign_str(tag);
 		__entry->seq = seq;
 		__entry->status = status;
 		__entry->len = len;
@@ -177,7 +175,7 @@ TRACE_EVENT(scmi_msg_dump,
 
 	TP_printk("id=%d ch=%02X pt=%02X t=%s msg_id=%02X seq=%04X s=%d pyld=%s",
 		  __entry->id, __entry->channel_id, __entry->protocol_id,
-		  __entry->tag, __entry->msg_id, __entry->seq, __entry->status,
+		  __get_str(tag), __entry->msg_id, __entry->seq, __entry->status,
 		__print_hex_str(__get_dynamic_array(cmd), __entry->len))
 );
 #endif /* _TRACE_SCMI_H */
-- 
2.54.0


