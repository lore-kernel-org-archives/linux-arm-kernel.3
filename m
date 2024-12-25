Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36BEE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 10:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xs07k9sBVuvh/SWXPPrrTz7GlQVJCBDuTKuCMZ2un6w=; b=ubMx1v7SoM5HINQ++tmfcfVmNo
	UmdTX1GdFLTWZrFr/P9OErjo8GjdFfhVTWyFlGIRCndC3+iLzxdBDEjT/pG6SewaKLkDBUzZ1ntTf
	xYuQ3n/EyUlCFlCb90A598efffmx1Bjfq5D/TEPM0BVFW/vJwn44FLEXFzqiaGhfzq2SWq1HdU5vJ
	rlIkICoO52Ku1qtNczfIj7WLkWu089oCh4lViZo35Tfb+2V/j8xESl9pcNCE306CgQYo+56RcyGWK
	GXxDMG38avXJe+njWK42jFA6kMSXdqV8qefQT9fSAgVzqANiPdHGOTGQpHSMhTe88w8SdRL6d2DnI
	dVdNU4Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQOuW-0000000DfFr-3P7A;
	Wed, 25 Dec 2024 10:46:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQOpb-0000000Debn-1l4H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 10:41:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP4RjEl009822;
	Wed, 25 Dec 2024 10:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xs07k9sBVuvh/SWXPPrrTz7G
	lQVJCBDuTKuCMZ2un6w=; b=SfqRyBPZomsbuhEu3vahUa4Q9ufSnrksj/IC0iRI
	cw8Joddd7CfFq+nKrPZX3ktMCYb4jdNUwP9BuWRq9gLOyIMSGbMcAU7+ZPnkw0Ru
	aj0ZnmAORsgPFdDNaoxvLpJohV8O/5PeJumjK4ruVRqYlpCe2M5hZviGIYA3dUPQ
	I6OI2xCqfWKE8mmrFBjnUx7s5hWuK7yUqKWlcYAUE2Xl+isVR5O6R33GWL6ziHg1
	6xOQoNk1I3WUOjCP24/Sicaqp0lVWskRe3SUv80tXcU+9Vca67gfix0101BEWJ4W
	p7b1xXROG7LAChHlHQrdS0/vAZZB5/nrvanoaNIZxoTyzw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rad81p93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 10:41:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BPAfTdX018034
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 10:41:29 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Dec 2024 02:41:26 -0800
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: Tao Zhang <quic_taozha@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Mao Jinlong <quic_jinlmao@quicinc.com>
Subject: [PATCH v3 2/3] coresight-tpdm: Add support to select lane
Date: Wed, 25 Dec 2024 18:41:06 +0800
Message-ID: <20241225104107.13425-3-quic_jinlmao@quicinc.com>
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
X-Proofpoint-GUID: 7bSl9MWRezvuIT6iuURWcEb15WMLPR1o
X-Proofpoint-ORIG-GUID: 7bSl9MWRezvuIT6iuURWcEb15WMLPR1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412250094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_024135_581725_6980CE9D 
X-CRM114-Status: GOOD (  17.45  )
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

From: Tao Zhang <quic_taozha@quicinc.com>

TPDM MCMB subunits supports up to 8 lanes CMB. For MCMB
configurations, the field "XTRIG_LNSEL" in CMB_CR register selects
which lane participates in the output pattern mach cross trigger
mechanism governed by the M_CMB_DXPR and M_CMB_XPMR regisers.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../testing/sysfs-bus-coresight-devices-tpdm  |  8 +++
 drivers/hwtracing/coresight/coresight-tpdm.c  | 51 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpdm.h  |  3 ++
 3 files changed, 62 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
index bf710ea6e0ef..6428d3ac22b0 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
@@ -257,3 +257,11 @@ Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_t
 Description:
 		(RW) Set/Get the MSR(mux select register) for the CMB subunit
 		TPDM.
+
+What:		/sys/bus/coresight/devices/<tpdm-name>/mcmb_trig_lane
+Date:		Nov 2024
+KernelVersion	6.14
+Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Description:
+		(RW) Set/Get which lane participates in the output pattern
+		match cross trigger mechanism for the MCMB subunit TPDM.
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 525f671dd97d..d92667cab872 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -252,6 +252,18 @@ static umode_t tpdm_cmb_msr_is_visible(struct kobject *kobj,
 	return 0;
 }
 
+static umode_t tpdm_mcmb_is_visible(struct kobject *kobj,
+				    struct attribute *attr, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	if (drvdata && tpdm_has_mcmb_dataset(drvdata))
+		return attr->mode;
+
+	return 0;
+}
+
 static void tpdm_reset_datasets(struct tpdm_drvdata *drvdata)
 {
 	if (tpdm_has_dsb_dataset(drvdata)) {
@@ -1021,6 +1033,34 @@ static ssize_t cmb_trig_ts_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(cmb_trig_ts);
 
+static ssize_t mcmb_trig_lane_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n",
+			  (unsigned int)drvdata->cmb->mcmb.trig_lane);
+}
+
+static ssize_t mcmb_trig_lane_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf,
+				    size_t size)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if ((kstrtoul(buf, 0, &val)) || (val >= TPDM_MCMB_MAX_LANES))
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	drvdata->cmb->mcmb.trig_lane = val;
+
+	return size;
+}
+static DEVICE_ATTR_RW(mcmb_trig_lane);
+
 static struct attribute *tpdm_dsb_edge_attrs[] = {
 	&dev_attr_ctrl_idx.attr,
 	&dev_attr_ctrl_val.attr,
@@ -1183,6 +1223,11 @@ static struct attribute *tpdm_cmb_msr_attrs[] = {
 	NULL,
 };
 
+static struct attribute *tpdm_mcmb_attrs[] = {
+	&dev_attr_mcmb_trig_lane.attr,
+	NULL,
+};
+
 static struct attribute *tpdm_dsb_attrs[] = {
 	&dev_attr_dsb_mode.attr,
 	&dev_attr_dsb_trig_ts.attr,
@@ -1249,6 +1294,11 @@ static struct attribute_group tpdm_cmb_msr_grp = {
 	.name = "cmb_msr",
 };
 
+static struct attribute_group tpdm_mcmb_attr_grp = {
+	.attrs = tpdm_mcmb_attrs,
+	.is_visible = tpdm_mcmb_is_visible,
+};
+
 static const struct attribute_group *tpdm_attr_grps[] = {
 	&tpdm_attr_grp,
 	&tpdm_dsb_attr_grp,
@@ -1260,6 +1310,7 @@ static const struct attribute_group *tpdm_attr_grps[] = {
 	&tpdm_cmb_trig_patt_grp,
 	&tpdm_cmb_patt_grp,
 	&tpdm_cmb_msr_grp,
+	&tpdm_mcmb_attr_grp,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index 0dac1a061ea4..6b8341e9f2d1 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.h
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -45,6 +45,9 @@
 /* MAX number of DSB MSR */
 #define TPDM_CMB_MAX_MSR 32
 
+/* MAX lanes in the output pattern for MCMB configurations*/
+#define TPDM_MCMB_MAX_LANES 8
+
 /* DSB Subunit Registers */
 #define TPDM_DSB_CR		(0x780)
 #define TPDM_DSB_TIER		(0x784)
-- 
2.17.1


