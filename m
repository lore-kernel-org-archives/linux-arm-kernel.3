Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19901C55175
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 14:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1skMGyWcIwP6d/wajOmln3d7RvV3oP+0pDqfsh/2McQ=; b=eGlwytfQEftjnMvcUsjBBQ4+g5
	48H7ma1UTmZ8Z4eCr1XjGC7gjHign7LNad5LRacsJywKS1/t/3SMExVON2IjOmRj7oAmqFI6ZfCIU
	N6Vz5ZOdmsPzNEm0KUwSILE+ygSwjvHFKjII34rpwnPxugmbGa5G6VKmXwHc2aJ+zddb5rkRDlXZo
	bFc/+V2ExiIALIS0sCZqYCSzt1P934ULesGKWd67VPjZw8q8/xkG3CQxSWmap9S2W2XvCpNVwqhNL
	Fk08QgBp/7t+f17U/P4FV3yw7df9ILdyVhi5PMxZVkyOnK7hTHUzSyhJm68HNwinWfZfFnJF4kSpp
	EtS/pTAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXdL-0000000FjvV-00K0;
	Sun, 02 Aug 2026 14:57:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXdI-0000000Fju2-2KGf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 14:57:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E197A1476;
	Sun,  2 Aug 2026 07:57:39 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 799983F632;
	Sun,  2 Aug 2026 07:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785682664; bh=CwJGWGgRXKnupukDLWD6QwCAt4HaM/Pbt3pAL9OqFfU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CK93mfpaxi7HZvdRQyJwgdfSl89hvI6wAhsvtqIYALBPzruwj3e/FAQugtf2k9YYH
	 WiXrVh8jGXiqpD4WXrZN9uSaBE+4hyPnO/BDwE86HnIAOBbtM9TrgwT3DJtsbje+QW
	 BCR24FvtJQjI8Jn+Ncd53HNCO1g0hBEcWHaVsk+E=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jic23@kernel.org,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v7 05/23] include: trace: Add Telemetry trace events
Date: Sun,  2 Aug 2026 15:56:00 +0100
Message-ID: <20260802145618.1952804-6-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260802145618.1952804-1-cristian.marussi@arm.com>
References: <20260802145618.1952804-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_075744_633119_956C99DD 
X-CRM114-Status: UNSURE (   9.13  )
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

Add custom traces to report Telemetry failed accesses and to report when DE
values are updated internally after a notification is processed.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 include/trace/events/scmi.h | 48 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/include/trace/events/scmi.h b/include/trace/events/scmi.h
index 703b7bb68e44..b70b26e467b8 100644
--- a/include/trace/events/scmi.h
+++ b/include/trace/events/scmi.h
@@ -7,7 +7,8 @@
 
 #include <linux/tracepoint.h>
 
-#define TRACE_SCMI_MAX_TAG_LEN	6
+#define TRACE_SCMI_MAX_TAG_LEN		6
+#define TRACE_SCMI_TLM_MAX_TAG_LEN	16
 
 TRACE_EVENT(scmi_fc_call,
 	TP_PROTO(u8 protocol_id, u8 msg_id, u32 res_id, u32 val1, u32 val2),
@@ -180,6 +181,51 @@ TRACE_EVENT(scmi_msg_dump,
 		  __entry->tag, __entry->msg_id, __entry->seq, __entry->status,
 		__print_hex_str(__get_dynamic_array(cmd), __entry->len))
 );
+
+TRACE_EVENT(scmi_tlm_access,
+	TP_PROTO(u64 de_id, unsigned char *tag, u64 startm, u64 endm),
+	TP_ARGS(de_id, tag, startm, endm),
+
+	TP_STRUCT__entry(
+		__field(u64, de_id)
+		__array(char, tag, TRACE_SCMI_TLM_MAX_TAG_LEN)
+		__field(u64, startm)
+		__field(u64, endm)
+	),
+
+	TP_fast_assign(
+		__entry->de_id = de_id;
+		strscpy(__entry->tag, tag, TRACE_SCMI_TLM_MAX_TAG_LEN);
+		__entry->startm = startm;
+		__entry->endm = endm;
+	),
+
+	TP_printk("de_id=0x%llX [%s] - startm=%016llX endm=%016llX",
+		  __entry->de_id, __entry->tag, __entry->startm, __entry->endm)
+);
+
+TRACE_EVENT(scmi_tlm_collect,
+	TP_PROTO(u64 ts, u64 de_id, u64 value, unsigned char *tag),
+	TP_ARGS(ts, de_id, value, tag),
+
+	TP_STRUCT__entry(
+		__field(u64, ts)
+		__field(u64, de_id)
+		__field(u64, value)
+		__array(char, tag, TRACE_SCMI_TLM_MAX_TAG_LEN)
+	),
+
+	TP_fast_assign(
+		__entry->ts = ts;
+		__entry->de_id = de_id;
+		__entry->value = value;
+		strscpy(__entry->tag, tag, TRACE_SCMI_TLM_MAX_TAG_LEN);
+	),
+
+	TP_printk("ts=%llu  de_id=0x%04llX  value=%016llu [%s]",
+		  __entry->ts, __entry->de_id, __entry->value, __entry->tag)
+);
+
 #endif /* _TRACE_SCMI_H */
 
 /* This part must be outside protection */
-- 
2.54.0


