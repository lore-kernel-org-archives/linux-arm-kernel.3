Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B292AD29FEF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 11:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJ6dfr1MPfK7S3AFOxxq0CxMRPanMuTmtXtjiMjLMYE=; b=poi683Jk7X5RJXBrrxgUAat8bG
	F/YW0OfKRVQQzX1EPrwmEmeOyGlyH0b70jNhdvSVvQoZPez5FNiTCPGhKBuL/YWM1D1OvJJVYk/qR
	ItVz5OJRoHdQ/rO5hC238AokwbR3K5X9OtcDSOwcd7ilGFMVjUIq+chS6K8zKVG0joWSTj4WmZCOa
	ToXZdxMptnvqfjx6BtddTEKBKpQ8F9nylp/ev9MpTEMQCMgbDeFQuPGs5ZxDgENVG2zQGn2hdpnd8
	o9Kt0B1bzDZoXIqoAzKq/vz77IRU8i1GE6JBU48GCtn/4aP2YEDbvHwmdgxjm+3AubCmb1t1LGz7p
	/LFIuLTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzLu-000000090Zw-3dBP;
	Wed, 14 Jan 2026 11:47:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzLo-000000090V9-40s1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 11:47:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CF09339;
	Wed, 14 Jan 2026 03:47:41 -0800 (PST)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA3DD3F59E;
	Wed, 14 Jan 2026 03:47:44 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	jonathan.cameron@huawei.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v2 07/17] firmware: arm_scmi: Use new Telemetry traces
Date: Wed, 14 Jan 2026 11:46:11 +0000
Message-ID: <20260114114638.2290765-8-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114114638.2290765-1-cristian.marussi@arm.com>
References: <20260114114638.2290765-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_034749_075851_7ACE8F22 
X-CRM114-Status: GOOD (  15.08  )
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

Track failed SHMTI accesses and received notifications.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/telemetry.c | 57 ++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 16bcdcdc1dc3..443e032a3553 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -25,6 +25,8 @@
 #include "protocols.h"
 #include "notify.h"
 
+#include <trace/events/scmi.h>
+
 /* Updated only after ALL the mandatory features for that version are merged */
 #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
 
@@ -1366,8 +1368,10 @@ static void scmi_telemetry_tdcf_blkts_parse(struct telemetry_info *ti,
 
 	/* Check for spec compliance */
 	if (USE_LINE_TS(payld) || USE_BLK_TS(payld) ||
-	    DATA_INVALID(payld) || (PAYLD_ID(payld) != 0))
+	    DATA_INVALID(payld) || (PAYLD_ID(payld) != 0)) {
+		trace_scmi_tlm_access(0, "BLK_TS_INVALID", 0, 0);
 		return;
+	}
 
 	/* A BLK_TS descriptor MUST be returned: it is found or it is crated */
 	bts = scmi_telemetry_blkts_lookup(ti->ph->dev, &ti->xa_bts, payld);
@@ -1376,6 +1380,9 @@ static void scmi_telemetry_tdcf_blkts_parse(struct telemetry_info *ti,
 
 	/* Update the descriptor with the lastest TS*/
 	scmi_telemetry_blkts_update(shmti->last_magic, bts);
+
+	trace_scmi_tlm_collect(bts->last_ts, (u64)payld,
+			       bts->last_magic, "SHMTI_BLK_TS");
 }
 
 static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
@@ -1393,8 +1400,10 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 	/* Is thi DE ID know ? */
 	tde = scmi_telemetry_tde_lookup(ti, de_id);
 	if (!tde) {
-		if (mode != SCAN_DISCOVERY)
+		if (mode != SCAN_DISCOVERY) {
+			trace_scmi_tlm_access(de_id, "DE_INVALID", 0, 0);
 			return;
+		}
 
 		/* In SCAN_DISCOVERY mode we allocate new DEs for unknown IDs */
 		tde = scmi_telemetry_tde_get(ti, de_id);
@@ -1462,6 +1471,8 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 		tde->last_ts = tstamp;
 	else
 		tde->last_ts = 0;
+
+	trace_scmi_tlm_collect(0, tde->de.info->id, tde->last_val, "SHMTI_DE_UPDT");
 }
 
 static int scmi_telemetry_tdcf_line_parse(struct telemetry_info *ti,
@@ -1507,8 +1518,10 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 		fsleep((SCMI_TLM_TDCF_MAX_RETRIES - retries) * 1000);
 
 		startm = TDCF_START_SEQ_GET(tdcf);
-		if (IS_BAD_START_SEQ(startm))
+		if (IS_BAD_START_SEQ(startm)) {
+			trace_scmi_tlm_access(0, "MSEQ_BADSTART", startm, 0);
 			continue;
+		}
 
 		/* On a BAD_SEQ this will be updated on the next attempt */
 		shmti->last_magic = startm;
@@ -1520,18 +1533,25 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 
 			used_qwords = scmi_telemetry_tdcf_line_parse(ti, next,
 								     shmti, mode);
-			if (qwords < used_qwords)
+			if (qwords < used_qwords) {
+				trace_scmi_tlm_access(PAYLD_ID(next),
+						      "BAD_QWORDS", startm, 0);
 				return -EINVAL;
+			}
 
 			next += used_qwords * 8;
 			qwords -= used_qwords;
 		}
 
 		endm = TDCF_END_SEQ_GET(eplg);
+		if (startm != endm)
+			trace_scmi_tlm_access(0, "MSEQ_MISMATCH", startm, endm);
 	} while (startm != endm && --retries);
 
-	if (startm != endm)
+	if (startm != endm) {
+		trace_scmi_tlm_access(0, "TDCF_SCAN_FAIL", startm, endm);
 		return -EPROTO;
+	}
 
 	return 0;
 }
@@ -1923,6 +1943,8 @@ static void scmi_telemetry_scan_update(struct telemetry_info *ti, u64 ts)
 			tde->last_ts = tstamp;
 		else
 			tde->last_ts = 0;
+
+		trace_scmi_tlm_collect(ts, tde->de.info->id, tde->last_val, "FC_UPDATE");
 	}
 }
 
@@ -2001,8 +2023,11 @@ static int scmi_telemetry_tdcf_de_parse(struct telemetry_de *tde,
 		fsleep((SCMI_TLM_TDCF_MAX_RETRIES - retries) * 1000);
 
 		startm = TDCF_START_SEQ_GET(tdcf);
-		if (IS_BAD_START_SEQ(startm))
+		if (IS_BAD_START_SEQ(startm)) {
+			trace_scmi_tlm_access(tde->de.info->id, "MSEQ_BADSTART",
+					      startm, 0);
 			continue;
+		}
 
 		/* Has anything changed at all at the SHMTI level ? */
 		scoped_guard(mutex, &tde->mtx) {
@@ -2018,11 +2043,16 @@ static int scmi_telemetry_tdcf_de_parse(struct telemetry_de *tde,
 		if (DATA_INVALID(payld))
 			return -EINVAL;
 
-		if (IS_BLK_TS(payld))
+		if (IS_BLK_TS(payld)) {
+			trace_scmi_tlm_access(tde->de.info->id,
+					      "BAD_DE_META", 0, 0);
 			return -EINVAL;
+		}
 
-		if (PAYLD_ID(payld) != tde->de.info->id)
+		if (PAYLD_ID(payld) != tde->de.info->id) {
+			trace_scmi_tlm_access(tde->de.info->id, "DE_INVALID", 0, 0);
 			return -EINVAL;
+		}
 
 		/* Data is always valid since NOT handling BLK TS lines here */
 		*val = LINE_DATA_GET(&payld->l);
@@ -2046,10 +2076,16 @@ static int scmi_telemetry_tdcf_de_parse(struct telemetry_de *tde,
 		}
 
 		endm = TDCF_END_SEQ_GET(tde->eplg);
+		if (startm != endm)
+			trace_scmi_tlm_access(tde->de.info->id, "MSEQ_MISMATCH",
+					      startm, endm);
 	} while (startm != endm && --retries);
 
-	if (startm != endm)
+	if (startm != endm) {
+		trace_scmi_tlm_access(tde->de.info->id, "TDCF_DE_FAIL",
+				      startm, endm);
 		return -EPROTO;
+	}
 
 	guard(mutex)(&tde->mtx);
 	tde->last_magic = startm;
@@ -2230,6 +2266,9 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
 			tde->last_ts = LINE_TSTAMP_GET(&payld->tsl);
 		else
 			tde->last_ts = 0;
+
+		trace_scmi_tlm_collect(timestamp, tde->de.info->id, tde->last_val,
+				       "MESSAGE");
 	}
 }
 
-- 
2.52.0


