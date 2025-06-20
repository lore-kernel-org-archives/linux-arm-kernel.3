Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD28C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 19:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwr06MFvGVBzgSWZTSdVUltVi8gB5Z7/O162b21KKzU=; b=oM82jjv0fvdCOxxYdaMI1tA7pu
	6J3YueSRVP4wgyrdKzwxR7ac1Wx4v1l9Aqv93SkImUZh4VKFl/OBL1t2avHcmSgKQr80fQ5HeVimz
	C2pdagxR8zGzruzsdtyysusvF1buAbtKUuVHCkqDGjXI95gpSxOpNY1Oy82BIuUYGhqG8Lf8xhZvc
	biBozc9OTEVdEkRL92fQHfrRA+cnHn2E63WtukLfCDJtdTjdqn2ADoaETppni3kjVDrPX93NKwTL2
	FrAQyuve8nDA59J7Q+xGSg9Wmw7R6GMOITHHyiqs1yVFbGLJUicsaFTB+mi7XcjYCp4J1IjWMLQB2
	UOKJ8jQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uShhy-0000000GTR3-1nPJ;
	Fri, 20 Jun 2025 19:47:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uShQF-0000000GRRP-1JYY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 19:29:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28A8816A3;
	Fri, 20 Jun 2025 12:28:51 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6390F3F673;
	Fri, 20 Jun 2025 12:29:08 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [RFC PATCH 7/7] firmware: arm_scmi: Use new Telemetry traces
Date: Fri, 20 Jun 2025 20:28:13 +0100
Message-ID: <20250620192813.2463367-8-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250620192813.2463367-1-cristian.marussi@arm.com>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_122911_479019_EB6B33A4 
X-CRM114-Status: GOOD (  11.32  )
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

Track failed SHMTI accesses and notification updates.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/telemetry.c | 35 +++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 3cbad06251a9..7843ff802bd0 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -16,6 +16,8 @@
 #include "protocols.h"
 #include "notify.h"
 
+#include <trace/events/scmi.h>
+
 /* Updated only after ALL the mandatory features for that version are merged */
 #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
 
@@ -813,8 +815,10 @@ static int scmi_telemetry_tdcf_parse_one(struct telemetry_info *ti,
 	int used_qwords;
 
 	de = xa_load(&ti->xa_des, le32_to_cpu(payld->id));
-	if (!de || DATA_INVALID(payld))
+	if (!de || DATA_INVALID(payld)) {
+		trace_scmi_tlm_access(de->id, "DE_INVALID", 0, 0);
 		return -EINVAL;
+	}
 
 	used_qwords = 4;
 
@@ -840,6 +844,8 @@ static int scmi_telemetry_tdcf_parse_one(struct telemetry_info *ti,
 	else
 		tde->last_ts = 0;
 
+	trace_scmi_tlm_collect(0, de->id, tde->last_val, "SHMTI_UPDATE");
+
 	return used_qwords;
 }
 
@@ -864,8 +870,10 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 		fsleep((SCMI_TLM_TDCF_MAX_RETRIES - retries) * 1000);
 
 		startm = TDCF_START_SEQ_GET(tdcf);
-		if (IS_BAD_START_SEQ(startm))
+		if (IS_BAD_START_SEQ(startm)) {
+			trace_scmi_tlm_access(0, "MSEQ_BADSTART", startm, 0);
 			continue;
+		}
 
 		qwords = tdcf->prlg.num_qwords;
 		next = tdcf->payld;
@@ -874,14 +882,18 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 
 			used_qwords = scmi_telemetry_tdcf_parse_one(ti, next,
 								    update ? shmti : NULL);
-			if (qwords < used_qwords)
+			if (qwords < used_qwords) {
+				trace_scmi_tlm_access(0, "BAD_QWORDS", 0, 0);
 				return -EINVAL;
+			}
 
 			next += used_qwords * 4;
 			qwords -= used_qwords;
 		}
 
 		endm = TDCF_END_SEQ_GET(eplg);
+		if (startm != endm)
+			trace_scmi_tlm_access(0, "MSEQ_MISMATCH", startm, endm);
 	} while (startm != endm && --retries);
 
 	if (startm != endm)
@@ -1252,12 +1264,17 @@ static int scmi_telemetry_de_tdcf_parse(struct telemetry_de *tde,
 		fsleep((SCMI_TLM_TDCF_MAX_RETRIES - retries) * 1000);
 
 		startm = TDCF_START_SEQ_GET(tdcf);
-		if (IS_BAD_START_SEQ(startm))
+		if (IS_BAD_START_SEQ(startm)) {
+			trace_scmi_tlm_access(tde->de.id, "MSEQ_BADSTART",
+					      startm, 0);
 			continue;
+		}
 
 		payld = tde->base + tde->offset;
-		if (le32_to_cpu(payld->id) != tde->de.id || DATA_INVALID(payld))
+		if (le32_to_cpu(payld->id) != tde->de.id || DATA_INVALID(payld)) {
+			trace_scmi_tlm_access(tde->de.id, "DE_INVALID", 0, 0);
 			return -EINVAL;
+		}
 
 		//TODO BLK_TS
 		if (tstamp && USE_LINE_TS(payld) && TS_VALID(payld))
@@ -1266,6 +1283,9 @@ static int scmi_telemetry_de_tdcf_parse(struct telemetry_de *tde,
 		*val = LINE_DATA_GET(&payld->tsl);
 
 		endm = TDCF_END_SEQ_GET(tde->eplg);
+		if (startm != endm)
+			trace_scmi_tlm_access(tde->de.id, "MSEQ_MISMATCH",
+					      startm, endm);
 	} while (startm != endm && --retries);
 
 	if (startm != endm)
@@ -1412,6 +1432,9 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
 			tde->last_ts = LINE_TSTAMP_GET(&payld->tsl);
 		else
 			tde->last_ts = 0;
+
+		trace_scmi_tlm_collect(timestamp, tde->de.id, tde->last_val,
+				       "MESSAGE");
 	}
 }
 
@@ -1622,6 +1645,8 @@ static void scmi_telemetry_scan_update(struct telemetry_info *ti, u64 ts)
 			tde->last_ts = tstamp;
 		else
 			tde->last_ts = 0;
+
+		trace_scmi_tlm_collect(ts, de->id, tde->last_val, "FC_UPDATE");
 	}
 }
 
-- 
2.47.0


