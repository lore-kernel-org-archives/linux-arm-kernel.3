Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6753DE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 10:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HlOoiJCMGyMIEh0nKCSb1Xs96ze5Oz0wkDgGwqcYxas=; b=JmBSNLnVRqCWgzczdi/+JkhUN6
	rcn4WyG7/LDO3iqEVbJcmxDy+2oxAn246oABdG+7msEyHJZoR8FqY3abdwY43oIJa3MIZLBxynb3h
	oV82nIDhRzjknUFwn7aXAgE38OjcczqfZ878nn0P74gcN3tVQW3bMpl19bNoXXAmhWVQJLWJQleSg
	zfE+H/FyJHWJfBBlKyswTtv8TKhxk3L9Cp5JRtt405j6HPp3H28IiNKrIOSap+ouyOVFf2tAp/s+Q
	0lg7YJLCxzxs0g/kKt7Qr3C7jDbitzLUR/y91I6pez/aUP4/hPgIZBlVEp+DdCm/h959ooSSPokP8
	yttnj2rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQOtN-0000000Df8m-0QXx;
	Wed, 25 Dec 2024 10:45:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQOpZ-0000000DebN-3D6V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 10:41:35 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP3iU7i000530;
	Wed, 25 Dec 2024 10:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HlOoiJCMGyMIEh0nKCSb1Xs9
	6ze5Oz0wkDgGwqcYxas=; b=CIz/tSeVzNCNN9vdLxlOwXn/V0HIwagMNqV/sxJ9
	enoSrpX13S6RlK2t7AjOmDkCxYO7SMMLSsAoWlFq6/nxp9K8eFsAmXIdqWseCc5W
	bd81chdQbThabDNBEkKdsniTOo/uCsF6mVAgLtDnhjgqlOzSzMkOhAx0PnhNFXvi
	veoeWisr5ko4U/kDYvpD3W912PDBDc2ddtVt7R12d78//yXVKMSgXpRN+VFN08O1
	x3Q26tVlFnz+y6AISOk+gPPduzeJibitoHPSZ16AYGnRBmrOFiDY9oKAC3+lgtDQ
	/yuBdC0DCU9sQxZn38Gw+ooQO03tTEcXTvNUhSg3xGhrxg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rad81p8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 10:41:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BPAfQOp013300
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 10:41:26 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Dec 2024 02:41:23 -0800
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, Tao Zhang <quic_taozha@quicinc.com>
Subject: [PATCH v3 1/3] coresight-tpdm: Add MCMB dataset support
Date: Wed, 25 Dec 2024 18:41:05 +0800
Message-ID: <20241225104107.13425-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241225104107.13425-1-quic_jinlmao@quicinc.com>
References: <20241225104107.13425-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Zxm-AwyLD1OUsrcyXJExgVmMyHStQcHI
X-Proofpoint-ORIG-GUID: Zxm-AwyLD1OUsrcyXJExgVmMyHStQcHI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412250094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_024133_930413_3FD08459 
X-CRM114-Status: GOOD (  23.52  )
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

MCMB (Multi-lane CMB) is a special form of CMB dataset type. MCMB
subunit TPDM has the same number and usage of registers as CMB
subunit TPDM. MCMB subunit can be enabled for data collection by
writing 1 to the first bit of CMB_CR register. The difference is
that MCMB subunit TPDM needs to select the lane and enable it in
using it.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c |  7 ++--
 drivers/hwtracing/coresight/coresight-tpdm.c | 40 +++++++++++++++++---
 drivers/hwtracing/coresight/coresight-tpdm.h | 27 +++++++------
 3 files changed, 54 insertions(+), 20 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index bfca103f9f84..4b61b9840740 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/amba/bus.h>
@@ -68,11 +68,12 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
 	int rc = -EINVAL;
 	struct tpdm_drvdata *tpdm_data = dev_get_drvdata(csdev->dev.parent);
 
-	if (tpdm_has_dsb_dataset(tpdm_data)) {
+	if (tpdm_data->dsb) {
 		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
 				"qcom,dsb-element-bits", &drvdata->dsb_esize);
 	}
-	if (tpdm_has_cmb_dataset(tpdm_data)) {
+
+	if (tpdm_data->cmb) {
 		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
 				"qcom,cmb-element-bits", &drvdata->cmb_esize);
 	}
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index b7d99e91ab84..525f671dd97d 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/amba/bus.h>
@@ -21,6 +21,21 @@
 
 DEFINE_CORESIGHT_DEVLIST(tpdm_devs, "tpdm");
 
+static bool tpdm_has_dsb_dataset(struct tpdm_drvdata *drvdata)
+{
+	return (drvdata->datasets & TPDM_PIDR0_DS_DSB);
+}
+
+static bool tpdm_has_cmb_dataset(struct tpdm_drvdata *drvdata)
+{
+	return (drvdata->datasets & TPDM_PIDR0_DS_CMB);
+}
+
+static bool tpdm_has_mcmb_dataset(struct tpdm_drvdata *drvdata)
+{
+	return (drvdata->datasets & TPDM_PIDR0_DS_MCMB);
+}
+
 /* Read dataset array member with the index number */
 static ssize_t tpdm_simple_dataset_show(struct device *dev,
 					struct device_attribute *attr,
@@ -198,7 +213,7 @@ static umode_t tpdm_cmb_is_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
-	if (drvdata && tpdm_has_cmb_dataset(drvdata))
+	if (drvdata && drvdata->cmb)
 		return attr->mode;
 
 	return 0;
@@ -388,7 +403,7 @@ static void tpdm_enable_cmb(struct tpdm_drvdata *drvdata)
 {
 	u32 val, i;
 
-	if (!tpdm_has_cmb_dataset(drvdata))
+	if (!drvdata->cmb)
 		return;
 
 	/* Configure pattern registers */
@@ -415,6 +430,19 @@ static void tpdm_enable_cmb(struct tpdm_drvdata *drvdata)
 		val |= TPDM_CMB_CR_MODE;
 	else
 		val &= ~TPDM_CMB_CR_MODE;
+
+	if (tpdm_has_mcmb_dataset(drvdata)) {
+		val &= ~TPDM_CMB_CR_XTRIG_LNSEL;
+		/* Set the lane participates in the output pattern */
+		val |= FIELD_PREP(TPDM_CMB_CR_XTRIG_LNSEL,
+			drvdata->cmb->mcmb.trig_lane);
+
+		/* Set the enablement of the lane */
+		val &= ~TPDM_CMB_CR_E_LN;
+		val |= FIELD_PREP(TPDM_CMB_CR_E_LN,
+			drvdata->cmb->mcmb.lane_select);
+	}
+
 	/* Set the enable bit of CMB control register to 1 */
 	val |= TPDM_CMB_CR_ENA;
 	writel_relaxed(val, drvdata->base + TPDM_CMB_CR);
@@ -480,7 +508,7 @@ static void tpdm_disable_cmb(struct tpdm_drvdata *drvdata)
 {
 	u32 val;
 
-	if (!tpdm_has_cmb_dataset(drvdata))
+	if (!drvdata->cmb)
 		return;
 
 	val = readl_relaxed(drvdata->base + TPDM_CMB_CR);
@@ -542,12 +570,14 @@ static int tpdm_datasets_setup(struct tpdm_drvdata *drvdata)
 		if (!drvdata->dsb)
 			return -ENOMEM;
 	}
-	if (tpdm_has_cmb_dataset(drvdata) && (!drvdata->cmb)) {
+	if ((tpdm_has_cmb_dataset(drvdata) || tpdm_has_mcmb_dataset(drvdata))
+			&& (!drvdata->cmb)) {
 		drvdata->cmb = devm_kzalloc(drvdata->dev,
 						sizeof(*drvdata->cmb), GFP_KERNEL);
 		if (!drvdata->cmb)
 			return -ENOMEM;
 	}
+
 	tpdm_reset_datasets(drvdata);
 
 	return 0;
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index e08d212642e3..0dac1a061ea4 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.h
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef _CORESIGHT_CORESIGHT_TPDM_H
@@ -9,7 +9,7 @@
 /* The max number of the datasets that TPDM supports */
 #define TPDM_DATASETS       7
 
-/* CMB Subunit Registers */
+/* CMB/MCMB Subunit Registers */
 #define TPDM_CMB_CR		(0xA00)
 /* CMB subunit timestamp insertion enable register */
 #define TPDM_CMB_TIER		(0xA04)
@@ -28,6 +28,10 @@
 #define TPDM_CMB_CR_ENA		BIT(0)
 /* Trace collection mode for CMB subunit */
 #define TPDM_CMB_CR_MODE	BIT(1)
+/* MCMB trigger lane select */
+#define TPDM_CMB_CR_XTRIG_LNSEL		GENMASK(20, 18)
+/* MCMB lane enablement */
+#define TPDM_CMB_CR_E_LN		GENMASK(17, 10)
 /* Timestamp control for pattern match */
 #define TPDM_CMB_TIER_PATT_TSENAB	BIT(0)
 /* CMB CTI timestamp request */
@@ -112,11 +116,13 @@
  * PERIPHIDR0[0] : Fix to 1 if ImplDef subunit present, else 0
  * PERIPHIDR0[1] : Fix to 1 if DSB subunit present, else 0
  * PERIPHIDR0[2] : Fix to 1 if CMB subunit present, else 0
+ * PERIPHIDR0[6] : Fix to 1 if MCMB subunit present, else 0
  */
 
 #define TPDM_PIDR0_DS_IMPDEF	BIT(0)
 #define TPDM_PIDR0_DS_DSB	BIT(1)
 #define TPDM_PIDR0_DS_CMB	BIT(2)
+#define TPDM_PIDR0_DS_MCMB	BIT(6)
 
 #define TPDM_DSB_MAX_LINES	256
 /* MAX number of EDCR registers */
@@ -256,6 +262,9 @@ struct dsb_dataset {
  * @patt_ts:          Indicates if pattern match for timestamp is enabled.
  * @trig_ts:          Indicates if CTI trigger for timestamp is enabled.
  * @ts_all:           Indicates if timestamp is enabled for all packets.
+ * struct mcmb_dataset
+ * @mcmb_trig_lane:       Save data for trigger lane
+ * @mcmb_lane_select:     Save data for lane enablement
  */
 struct cmb_dataset {
 	u32			trace_mode;
@@ -267,6 +276,10 @@ struct cmb_dataset {
 	bool			patt_ts;
 	bool			trig_ts;
 	bool			ts_all;
+	struct {
+		u8		trig_lane;
+		u8		lane_select;
+	} mcmb;
 };
 
 /**
@@ -324,14 +337,4 @@ struct tpdm_dataset_attribute {
 	enum dataset_mem mem;
 	u32 idx;
 };
-
-static bool tpdm_has_dsb_dataset(struct tpdm_drvdata *drvdata)
-{
-	return (drvdata->datasets & TPDM_PIDR0_DS_DSB);
-}
-
-static bool tpdm_has_cmb_dataset(struct tpdm_drvdata *drvdata)
-{
-	return (drvdata->datasets & TPDM_PIDR0_DS_CMB);
-}
 #endif  /* _CORESIGHT_CORESIGHT_TPDM_H */
-- 
2.17.1


