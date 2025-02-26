Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3BBC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 02:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qje131Rr/amQVhvj70xbXZpmuSbemZIWtBdEryaf1k=; b=S4DVNPT0UUpVFNt3kayR3k0vIu
	YThaj5fZUhaVLxr5ZfzxA/Sda1XhrS4QRR0YgG13WWd9IlDx8Klyxre9Wxkv2n2LaZu9uiuVrLbO4
	+64uysn1z7wVhRc7UA3TCF+ZSFFmFIqedlFg0sEGRyKLgX3/wa5G6oSbH5aXxoR9PBAtBDaW0VQ6U
	P15D6232HSRPnrFi7DLjE0gje1IDS+IGZpKLBsJsYGEiXNZ2nQpmA9QrC1wm2eXoB3QqLrdm29EZd
	WBsUQfgQidhVAbDfTKPawWhDaXaF2h2fznfQh0Li+iSmyukaosGhUBVJqX1g07XtsdgwDHyOEoXGJ
	erX700Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7ZC-00000002E1C-2g71;
	Wed, 26 Feb 2025 02:54:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7PA-00000002Cb3-3Lrj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 02:44:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMYC7m013332;
	Wed, 26 Feb 2025 02:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4qje131Rr/amQVhvj70xbXZpmuSbemZIWtBdEryaf1k=; b=iB0/40cLtS2jMtoE
	2xqPyfrplp8K4/2tvuRqOZhsydJnUT3lcGgE0cyUuvOJYShdAiomQ0XQVX7uF1F1
	6zfxYdiPyHtIg2hMVEqM3eqEv1JhXAPc2sGDMsIesJ290kVuGv4KAkbHHKHOKbAX
	hSqb69g01H0l9h2/Wh+1asAEqFm988s0XOKl+9x6ELvtfYjWpWlUEztRtM2LeSBx
	r/iwHLacVaovpH1Sbbqxxc+OwPsu94OkEC4AGkioK5rgVhncEr5Cmp0B7lJBc688
	8O95B6OwH229qBQdIyA0L+98qfs8jTzmbIS/p8JyFs1MH1qR/iGk8UGQ3x7TXXje
	K9AUcA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk8g39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 02:44:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q2i4qX020810
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 02:44:04 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Feb 2025 18:44:00 -0800
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <johan@kernel.org>,
        <dmitry.baryshkov@linaro.org>, <maz@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <konradybcio@kernel.org>
Subject: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Date: Wed, 26 Feb 2025 08:13:38 +0530
Message-ID: <20250226024338.3994701-3-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226024338.3994701-1-quic_sibis@quicinc.com>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Las44SGPqOcA59WC_rZmPZqYiM8Ve5Nh
X-Proofpoint-ORIG-GUID: Las44SGPqOcA59WC_rZmPZqYiM8Ve5Nh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_184412_956078_B8B1BCF4 
X-CRM114-Status: GOOD (  19.85  )
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

The addition of per message-id fastchannel support check exposed
a SCP firmware bug which leads to a device crash on X1E platforms.
The X1E firmware supports fastchannel on LEVEL_GET but fails to
have this set in the protocol message attributes and the fallback
to regular messaging leads to a device crash since that implementation
has a bug for all the X1E devices in the wild. Fix this by introducing
a quirk that selectively skips the per message-id fastchannel check only
for the LEVEL_GET message on X1E platforms.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 drivers/firmware/arm_scmi/driver.c    |  5 +++--
 drivers/firmware/arm_scmi/perf.c      | 30 +++++++++++++++++++++------
 drivers/firmware/arm_scmi/powercap.c  |  8 +++----
 drivers/firmware/arm_scmi/protocols.h |  2 +-
 4 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 9313b9020fc1..b182fa8e8ccb 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1903,7 +1903,8 @@ static void
 scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
 			     u8 describe_id, u32 message_id, u32 valid_size,
 			     u32 domain, void __iomem **p_addr,
-			     struct scmi_fc_db_info **p_db, u32 *rate_limit)
+			     struct scmi_fc_db_info **p_db, u32 *rate_limit,
+			     bool skip_check)
 {
 	int ret;
 	u32 flags;
@@ -1919,7 +1920,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
 
 	/* Check if the MSG_ID supports fastchannel */
 	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
-	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes))
+	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes) && !skip_check)
 		return;
 
 	if (!p_addr) {
diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index c7e5a34b254b..5b4559d0b054 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -48,6 +48,10 @@ enum {
 	PERF_FC_MAX,
 };
 
+enum {
+	PERF_QUIRK_SKIP_FASTCHANNEL_LEVEL_GET,
+};
+
 struct scmi_opp {
 	u32 perf;
 	u32 power;
@@ -183,6 +187,7 @@ struct scmi_perf_info {
 	enum scmi_power_scale power_scale;
 	u64 stats_addr;
 	u32 stats_size;
+	u32 quirks;
 	bool notify_lvl_cmd;
 	bool notify_lim_cmd;
 	struct perf_dom_info *dom_info;
@@ -838,9 +843,10 @@ static int scmi_perf_level_limits_notify(const struct scmi_protocol_handle *ph,
 }
 
 static void scmi_perf_domain_init_fc(const struct scmi_protocol_handle *ph,
-				     struct perf_dom_info *dom)
+				     struct perf_dom_info *dom, u32 quirks)
 {
 	struct scmi_fc_info *fc;
+	bool quirk_level_get = !!(quirks & BIT(PERF_QUIRK_SKIP_FASTCHANNEL_LEVEL_GET));
 
 	fc = devm_kcalloc(ph->dev, PERF_FC_MAX, sizeof(*fc), GFP_KERNEL);
 	if (!fc)
@@ -849,26 +855,26 @@ static void scmi_perf_domain_init_fc(const struct scmi_protocol_handle *ph,
 	ph->hops->fastchannel_init(ph, PERF_DESCRIBE_FASTCHANNEL,
 				   PERF_LEVEL_GET, 4, dom->id,
 				   &fc[PERF_FC_LEVEL].get_addr, NULL,
-				   &fc[PERF_FC_LEVEL].rate_limit);
+				   &fc[PERF_FC_LEVEL].rate_limit, quirk_level_get);
 
 	ph->hops->fastchannel_init(ph, PERF_DESCRIBE_FASTCHANNEL,
 				   PERF_LIMITS_GET, 8, dom->id,
 				   &fc[PERF_FC_LIMIT].get_addr, NULL,
-				   &fc[PERF_FC_LIMIT].rate_limit);
+				   &fc[PERF_FC_LIMIT].rate_limit, false);
 
 	if (dom->info.set_perf)
 		ph->hops->fastchannel_init(ph, PERF_DESCRIBE_FASTCHANNEL,
 					   PERF_LEVEL_SET, 4, dom->id,
 					   &fc[PERF_FC_LEVEL].set_addr,
 					   &fc[PERF_FC_LEVEL].set_db,
-					   &fc[PERF_FC_LEVEL].rate_limit);
+					   &fc[PERF_FC_LEVEL].rate_limit, false);
 
 	if (dom->set_limits)
 		ph->hops->fastchannel_init(ph, PERF_DESCRIBE_FASTCHANNEL,
 					   PERF_LIMITS_SET, 8, dom->id,
 					   &fc[PERF_FC_LIMIT].set_addr,
 					   &fc[PERF_FC_LIMIT].set_db,
-					   &fc[PERF_FC_LIMIT].rate_limit);
+					   &fc[PERF_FC_LIMIT].rate_limit, false);
 
 	dom->fc_info = fc;
 }
@@ -1282,6 +1288,7 @@ static int scmi_perf_protocol_init(const struct scmi_protocol_handle *ph)
 {
 	int domain, ret;
 	u32 version;
+	struct device_node *np;
 	struct scmi_perf_info *pinfo;
 
 	ret = ph->xops->version_get(ph, &version);
@@ -1297,6 +1304,17 @@ static int scmi_perf_protocol_init(const struct scmi_protocol_handle *ph)
 
 	pinfo->version = version;
 
+	/*
+	 * Some X1E devices support fastchannel for LEVEL_GET but erroneously
+	 * says otherwise in the protocol message attributes. Add a quirk to
+	 * force fastchannel on LEVEL_GET to prevent crashes on such devices.
+	 */
+	np = of_find_compatible_node(NULL, NULL, "qcom,x1e80100");
+	if (np) {
+		pinfo->quirks = BIT(PERF_QUIRK_SKIP_FASTCHANNEL_LEVEL_GET);
+		of_node_put(np);
+	}
+
 	ret = scmi_perf_attributes_get(ph, pinfo);
 	if (ret)
 		return ret;
@@ -1315,7 +1333,7 @@ static int scmi_perf_protocol_init(const struct scmi_protocol_handle *ph)
 		scmi_perf_describe_levels_get(ph, dom, version);
 
 		if (dom->perf_fastchannels)
-			scmi_perf_domain_init_fc(ph, dom);
+			scmi_perf_domain_init_fc(ph, dom, pinfo->quirks);
 	}
 
 	ret = devm_add_action_or_reset(ph->dev, scmi_perf_xa_destroy, pinfo);
diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
index 1fa79bba492e..90e92fc432e3 100644
--- a/drivers/firmware/arm_scmi/powercap.c
+++ b/drivers/firmware/arm_scmi/powercap.c
@@ -720,23 +720,23 @@ static void scmi_powercap_domain_init_fc(const struct scmi_protocol_handle *ph,
 				   POWERCAP_CAP_SET, 4, domain,
 				   &fc[POWERCAP_FC_CAP].set_addr,
 				   &fc[POWERCAP_FC_CAP].set_db,
-				   &fc[POWERCAP_FC_CAP].rate_limit);
+				   &fc[POWERCAP_FC_CAP].rate_limit, false);
 
 	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
 				   POWERCAP_CAP_GET, 4, domain,
 				   &fc[POWERCAP_FC_CAP].get_addr, NULL,
-				   &fc[POWERCAP_FC_CAP].rate_limit);
+				   &fc[POWERCAP_FC_CAP].rate_limit, false);
 
 	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
 				   POWERCAP_PAI_SET, 4, domain,
 				   &fc[POWERCAP_FC_PAI].set_addr,
 				   &fc[POWERCAP_FC_PAI].set_db,
-				   &fc[POWERCAP_FC_PAI].rate_limit);
+				   &fc[POWERCAP_FC_PAI].rate_limit, false);
 
 	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
 				   POWERCAP_PAI_GET, 4, domain,
 				   &fc[POWERCAP_FC_PAI].get_addr, NULL,
-				   &fc[POWERCAP_FC_PAI].rate_limit);
+				   &fc[POWERCAP_FC_PAI].rate_limit, false);
 
 	*p_fc = fc;
 }
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index d62c4469d1fd..fe4c724caba3 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -280,7 +280,7 @@ struct scmi_proto_helpers_ops {
 				 u32 valid_size, u32 domain,
 				 void __iomem **p_addr,
 				 struct scmi_fc_db_info **p_db,
-				 u32 *rate_limit);
+				 u32 *rate_limit, bool skip_check);
 	void (*fastchannel_db_ring)(struct scmi_fc_db_info *db);
 	int (*get_max_msg_size)(const struct scmi_protocol_handle *ph);
 };
-- 
2.34.1


