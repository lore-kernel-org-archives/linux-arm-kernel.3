Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7C8606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 23:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u2+tlyUf;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DovYU82b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2gyU4FV/WFSTsGeNbjBCNfLaH4XHuCLVYSeFIJFaY2E=; b=u2+tlyUf8oY+kY
	pbjU8lPuqHcZfp9pKm7UYeqALK5q76GoMluJu+JbgsizDZvlFPmDqwoey1/GyqPLh+i/t/r/4xJFK
	qkgyWqJmDAro1WzxSLhgNM9xXHAMBom/zTj0gB10vSsQ4CGbCG7CZ6FzhIQc+62H4sPDn5K8VRR2k
	nJAJp7RZj/mung++ZoGsaxLUX0DIBKcX6KhubblQENqkFKslydFx62p7MhoJ1ULoX0Y0odKRKkBv2
	JfRF72kgJw8VJuxV0kyRfscNsIWok3TRPFqEuBvkjwTk+a9qcDupdXbFjKVhfKbqxzsdASM49gtW7
	dCYMjEagCfbGralAP0BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONeU-00000003v5V-1AUP;
	Tue, 03 Nov 2026 23:10:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONeQ-00000003v0Q-34yg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 23:10:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 003811650;
	Tue,  3 Nov 2026 15:10:43 -0800 (PST)
Received: from e121740.manchester.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 498A73F673;
	Tue,  3 Nov 2026 15:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793747446; bh=9OuS1AmQkrtLM5/pdjJiFq8ElUOOpTMPp39eeGX6vyw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DovYU82bciD0ACMK+jqrPskFGljynb5aiBSLrMXIi8aDmzzdGB101D2q8d+4qLes/
	 4Rxc1UhgQkiocwoWHcrVXc2RrN/jqV19JMsEcU2U5TO2LKyxakgzKO/OmhtgJemBAY
	 5TQqbSsDwdDeqjD16lhRL0cLz3tz40Sw8JFsnECE=
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-pm@vger.kernel.org
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
	Cristian Marussi <cristian.marussi@arm.com>,
	Philip Radford <philip.radford@arm.com>
Subject: [PATCH v10 08/13] include: trace: Add new parameter to trace_scmi_fc_call
Date: Tue,  3 Nov 2026 23:10:02 +0000
Message-Id: <20261103231007.537082-9-philip.radford@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103231007.537082-1-philip.radford@arm.com>
References: <20261103231007.537082-1-philip.radford@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_151046_894979_529D8D53 
X-CRM114-Status: GOOD (  11.49  )
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

From: Cristian Marussi <cristian.marussi@arm.com>

Since SCMIv4.0 some of the supported Fastchannels can be configured using
an additional parameter like CPL_ID or Capability_ID.

Add equivalent support in the SCMI fastchannel traces to printout also such
parameter and fix all the existent call sites.

When such parameter is not used, it will simply show up as zero.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Philip Radford <philip.radford@arm.com>
---
 drivers/firmware/arm_scmi/perf.c     |  8 ++++----
 drivers/firmware/arm_scmi/powercap.c | 12 +++++++-----
 include/trace/events/scmi.h          | 12 +++++++-----
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index 7f283f457e02..88d614e3184b 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -552,7 +552,7 @@ static int __scmi_perf_limits_set(const struct scmi_protocol_handle *ph,
 		struct scmi_fc_info *fci = &dom->fc_info[PERF_FC_LIMIT];
 
 		trace_scmi_fc_call(SCMI_PROTOCOL_PERF, PERF_LIMITS_SET,
-				   dom->id, min_perf, max_perf);
+				   dom->id, 0, min_perf, max_perf);
 		iowrite32(max_perf, fci->set_addr);
 		iowrite32(min_perf, fci->set_addr + 4);
 		ph->hops->fastchannel_db_ring(fci->set_db);
@@ -636,7 +636,7 @@ static int __scmi_perf_limits_get(const struct scmi_protocol_handle *ph,
 		*max_perf = ioread32(fci->get_addr);
 		*min_perf = ioread32(fci->get_addr + 4);
 		trace_scmi_fc_call(SCMI_PROTOCOL_PERF, PERF_LIMITS_GET,
-				   dom->id, *min_perf, *max_perf);
+				   dom->id, 0, *min_perf, *max_perf);
 		return 0;
 	}
 
@@ -706,7 +706,7 @@ static int __scmi_perf_level_set(const struct scmi_protocol_handle *ph,
 		struct scmi_fc_info *fci = &dom->fc_info[PERF_FC_LEVEL];
 
 		trace_scmi_fc_call(SCMI_PROTOCOL_PERF, PERF_LEVEL_SET,
-				   dom->id, level, 0);
+				   dom->id, 0, level, 0);
 		iowrite32(level, fci->set_addr);
 		ph->hops->fastchannel_db_ring(fci->set_db);
 		return 0;
@@ -769,7 +769,7 @@ static int __scmi_perf_level_get(const struct scmi_protocol_handle *ph,
 	if (dom->fc_info && dom->fc_info[PERF_FC_LEVEL].get_addr) {
 		*level = ioread32(dom->fc_info[PERF_FC_LEVEL].get_addr);
 		trace_scmi_fc_call(SCMI_PROTOCOL_PERF, PERF_LEVEL_GET,
-				   dom->id, *level, 0);
+				   dom->id, 0, *level, 0);
 		return 0;
 	}
 
diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
index 530e42e6a1fd..b911d9164023 100644
--- a/drivers/firmware/arm_scmi/powercap.c
+++ b/drivers/firmware/arm_scmi/powercap.c
@@ -658,7 +658,7 @@ static int __scmi_powercap_cap_get(const struct scmi_protocol_handle *ph,
 	    dom->cpli[cpl_id].fc_info[POWERCAP_FC_CAP].get_addr) {
 		*power_cap = ioread32(dom->cpli[cpl_id].fc_info[POWERCAP_FC_CAP].get_addr);
 		trace_scmi_fc_call(SCMI_PROTOCOL_POWERCAP, POWERCAP_CAP_GET,
-				   dom->id, *power_cap, 0);
+				   dom->id, cpl_id, *power_cap, 0);
 		return 0;
 	}
 
@@ -791,7 +791,7 @@ static int __scmi_powercap_cap_set(const struct scmi_protocol_handle *ph,
 		iowrite32(power_cap, fci->set_addr);
 		ph->hops->fastchannel_db_ring(fci->set_db);
 		trace_scmi_fc_call(SCMI_PROTOCOL_POWERCAP, POWERCAP_CAP_SET,
-				   domain_id, power_cap, 0);
+				   domain_id, cpl_id, power_cap, 0);
 		ret = 0;
 	} else {
 		ret = pi->xfer_cap_set(ph, pc, cpl_id, power_cap, ignore_dresp);
@@ -900,7 +900,8 @@ static int scmi_powercap_avg_interval_get(const struct scmi_protocol_handle *ph,
 			POWERCAP_PAI_GET : POWERCAP_CAI_GET;
 
 		*val = ioread32(dom->cpli[cpl_id].fc_info[POWERCAP_FC_XAI].get_addr);
-		trace_scmi_fc_call(SCMI_PROTOCOL_POWERCAP, trace_cmd, domain_id, *val, 0);
+		trace_scmi_fc_call(SCMI_PROTOCOL_POWERCAP, trace_cmd, domain_id,
+				   cpl_id, *val, 0);
 		return 0;
 	}
 
@@ -973,7 +974,8 @@ static int scmi_powercap_avg_interval_set(const struct scmi_protocol_handle *ph,
 			POWERCAP_PAI_SET : POWERCAP_CAI_SET;
 		struct scmi_fc_info *fci = &pc->cpli[cpl_id].fc_info[POWERCAP_FC_XAI];
 
-		trace_scmi_fc_call(SCMI_PROTOCOL_POWERCAP, trace_cmd, domain_id, ivl, 0);
+		trace_scmi_fc_call(SCMI_PROTOCOL_POWERCAP, trace_cmd, domain_id,
+				   cpl_id, ivl, 0);
 		iowrite32(ivl, fci->set_addr);
 		ph->hops->fastchannel_db_ring(fci->set_db);
 		return 0;
@@ -1026,7 +1028,7 @@ static int scmi_powercap_measurements_get(const struct scmi_protocol_handle *ph,
 		/* See SCMIv4.0 3.10.2 - Payload is 32bit ONLY avg_power */
 		*avg_ivl = 0;
 		trace_scmi_fc_call(SCMI_PROTOCOL_POWERCAP, POWERCAP_MEASUREMENTS_GET,
-				   pc->id, *avg_power, *avg_ivl);
+				   pc->id, 0, *avg_power, *avg_ivl);
 		return 0;
 	}
 
diff --git a/include/trace/events/scmi.h b/include/trace/events/scmi.h
index b421c253df00..f15fdb246f01 100644
--- a/include/trace/events/scmi.h
+++ b/include/trace/events/scmi.h
@@ -8,13 +8,14 @@
 #include <linux/tracepoint.h>
 
 TRACE_EVENT(scmi_fc_call,
-	TP_PROTO(u8 protocol_id, u8 msg_id, u32 res_id, u32 val1, u32 val2),
-	TP_ARGS(protocol_id, msg_id, res_id, val1, val2),
+	TP_PROTO(u8 protocol_id, u8 msg_id, u32 res_id, u32 sub_id, u32 val1, u32 val2),
+	TP_ARGS(protocol_id, msg_id, res_id, sub_id, val1, val2),
 
 	TP_STRUCT__entry(
 		__field(u8, protocol_id)
 		__field(u8, msg_id)
 		__field(u32, res_id)
+		__field(u32, sub_id)
 		__field(u32, val1)
 		__field(u32, val2)
 	),
@@ -23,13 +24,14 @@ TRACE_EVENT(scmi_fc_call,
 		__entry->protocol_id = protocol_id;
 		__entry->msg_id = msg_id;
 		__entry->res_id = res_id;
+		__entry->sub_id = sub_id;
 		__entry->val1 = val1;
 		__entry->val2 = val2;
 	),
 
-	TP_printk("pt=%02X msg_id=%02X res_id:%u vals=%u:%u",
-		__entry->protocol_id, __entry->msg_id,
-		__entry->res_id, __entry->val1, __entry->val2)
+	TP_printk("pt=%02X msg_id=%02X res_id:%u sub_id:%u vals=%u:%u",
+		  __entry->protocol_id, __entry->msg_id,
+		  __entry->res_id, __entry->sub_id, __entry->val1, __entry->val2)
 );
 
 TRACE_EVENT(scmi_xfer_begin,
-- 
2.34.1


