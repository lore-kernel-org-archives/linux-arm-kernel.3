Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82489CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 20:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8BvETIjPd5PfbaKIiAAKVKxKxg0midjOyid0X2QG28=; b=3sZ8aQk5pjN+ucwxXxV3W8Q+vf
	Z1XGhLdc4zDheGwW74MANhkfGADhaKFhy5QQwMcPcJaBbJRYoZx1hbNbAgwD2MiVw/Iy+l77G+JNy
	TNhxPdHww1VrDwHvCY6IEx9puQLSjTQ1SBdDa0t07zDOfM6yM7unUo6m9XCkOlvKLmBesNxCVdVgU
	h22g1jyr3Oe8/uPEJuB7b74VWZPXvlrvvE71bAGi58x8hKErzCsdD7y3kvzqFen3r8JDCFdr3wQz9
	U+Agwyw9P0ZR8/taEhovg5CHbzUPGLFY2fWW5zR2aPgStwktMBl6kvg6kpjZKmSAFbMjFCJ//67zL
	oHlxNmcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1siL-0000000CnX6-0z1E;
	Thu, 25 Sep 2025 20:37:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1shw-0000000Cn7t-1ZAp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 20:36:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A99861692;
	Thu, 25 Sep 2025 13:36:43 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15BFA3F694;
	Thu, 25 Sep 2025 13:36:48 -0700 (PDT)
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
Subject: [PATCH 10/10] firmware: arm_scmi: Use new Telemetry traces
Date: Thu, 25 Sep 2025 21:35:54 +0100
Message-ID: <20250925203554.482371-11-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925203554.482371-1-cristian.marussi@arm.com>
References: <20250925203554.482371-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_133652_515910_66E4B0E3 
X-CRM114-Status: GOOD (  14.88  )
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
index f03000c173c2..aa706518e5b6 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -23,6 +23,8 @@
 #include "protocols.h"
 #include "notify.h"
 
+#include <trace/events/scmi.h>
+
 /* Updated only after ALL the mandatory features for that version are merged */
 #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
 
@@ -1021,8 +1023,10 @@ static void scmi_telemetry_tdcf_blkts_parse(struct telemetry_info *ti,
 
 	/* Check for spec compliance */
 	if (USE_LINE_TS(payld) || USE_BLK_TS(payld) ||
-	    DATA_INVALID(payld) || (PAYLD_ID(payld) != 0))
+	    DATA_INVALID(payld) || (PAYLD_ID(payld) != 0)) {
+		trace_scmi_tlm_access(0, "BLK_TS_INVALID", 0, 0);
 		return;
+	}
 
 	/* A BLK_TS descriptor MUST be returned: it is found or it is crated */
 	bts = scmi_telemetry_blkts_lookup(ti->dev, &ti->xa_bts, payld);
@@ -1031,6 +1035,9 @@ static void scmi_telemetry_tdcf_blkts_parse(struct telemetry_info *ti,
 
 	/* Update the descriptor with the lastest TS*/
 	scmi_telemetry_blkts_update(shmti->last_magic, bts);
+
+	trace_scmi_tlm_collect(bts->last_ts, (u64)payld,
+			       bts->last_magic, "SHMTI_BLK_TS");
 }
 
 static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
@@ -1046,8 +1053,10 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 
 	id = PAYLD_ID(payld);
 	de = xa_load(&ti->xa_des, id);
-	if (!de)
+	if (!de) {
+		trace_scmi_tlm_access(id, "DE_INVALID", 0, 0);
 		return;
+	}
 
 	tde = to_tde(de);
 	/* Update DE location refs if requested: normally done only on enable */
@@ -1094,6 +1103,8 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 		tde->last_ts = tstamp;
 	else
 		tde->last_ts = 0;
+
+	trace_scmi_tlm_collect(0, de->info->id, tde->last_val, "SHMTI_DE_UPDT");
 }
 
 static int scmi_telemetry_tdcf_line_parse(struct telemetry_info *ti,
@@ -1139,8 +1150,10 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 		fsleep((SCMI_TLM_TDCF_MAX_RETRIES - retries) * 1000);
 
 		startm = TDCF_START_SEQ_GET(tdcf);
-		if (IS_BAD_START_SEQ(startm))
+		if (IS_BAD_START_SEQ(startm)) {
+			trace_scmi_tlm_access(0, "MSEQ_BADSTART", startm, 0);
 			continue;
+		}
 
 		/* On a BAD_SEQ this will be updated on the next attempt */
 		shmti->last_magic = startm;
@@ -1152,18 +1165,25 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 
 			used_qwords = scmi_telemetry_tdcf_line_parse(ti, next,
 								     shmti, update);
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
@@ -1544,6 +1564,8 @@ static void scmi_telemetry_scan_update(struct telemetry_info *ti, u64 ts)
 			tde->last_ts = tstamp;
 		else
 			tde->last_ts = 0;
+
+		trace_scmi_tlm_collect(ts, de->info->id, tde->last_val, "FC_UPDATE");
 	}
 }
 
@@ -1622,8 +1644,11 @@ static int scmi_telemetry_tdcf_de_parse(struct telemetry_de *tde,
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
@@ -1639,11 +1664,16 @@ static int scmi_telemetry_tdcf_de_parse(struct telemetry_de *tde,
 		if (DATA_INVALID(payld))
 			return -EINVAL;
 
-		if (IS_BLK_TS(payld))
+		if (IS_BLK_TS(payld)) {
+			trace_scmi_tlm_access(tde->de.info->id,
+					      "BAD_DE_META", 0, 0);
 			return -EINVAL;
+		}
 
-		if (le32_to_cpu(payld->id) != tde->de.info->id)
+		if (le32_to_cpu(payld->id) != tde->de.info->id) {
+			trace_scmi_tlm_access(tde->de.info->id, "DE_INVALID", 0, 0);
 			return -EINVAL;
+		}
 
 		/* Data is always valid since NOT handling BLK TS lines here */
 		*val = LINE_DATA_GET(&payld->l);
@@ -1667,10 +1697,16 @@ static int scmi_telemetry_tdcf_de_parse(struct telemetry_de *tde,
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
@@ -1840,6 +1876,9 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
 			tde->last_ts = LINE_TSTAMP_GET(&payld->tsl);
 		else
 			tde->last_ts = 0;
+
+		trace_scmi_tlm_collect(timestamp, tde->de.info->id, tde->last_val,
+				       "MESSAGE");
 	}
 }
 
-- 
2.51.0


