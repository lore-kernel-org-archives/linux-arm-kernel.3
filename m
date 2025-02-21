Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446AAC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 07:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyE9hYqgwJ+fwXKcYbnbNKN+dKoR1uUu7EJFvLAMv7w=; b=an14/P0C2zekdkPQ/kOOeZhuId
	wh2fcbHdUICRgAaPnmOKIqCM7DawNhL0NKMonbdG0gQdhXUgCwedgzckuk7LBf6h4OOA1n/Cd+VVH
	E/58NJHvqj8wr2DpRaCckln26/o1QGInYX1Vz6kbCoEseQQxhsx9puwcXrzruIsmmMBX6e0CcT5sN
	/VMIl5gLcdItK3GqT8u8O8NG27SBjOAoq5wzQ1s+4qOwozC80EycHV1Zd4UB622VbgsMPdf/rLb09
	qSwoR40Zgp8ESPCdhHKy1WMjSD8q+j7tacAKXzqTcTdpQvOd4XUciyPS5PVgNpd5XxHcVgp10KnU7
	imGhSFpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlNkd-00000004ZRE-06p9;
	Fri, 21 Feb 2025 07:47:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlNez-00000004YL4-17sO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 07:41:22 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L6QGtE015051;
	Fri, 21 Feb 2025 07:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wyE9hYqgwJ+fwXKcYbnbNKN+dKoR1uUu7EJFvLAMv7w=; b=OJAsWwd8yMPx7sGT
	0ARVeBUk0GaT8r4aZNss0OivbhvyfhpxWbFNfCAn4hrahpip/yluQbtt1+S0dLrJ
	V4O3S87Jkkao0ZokaxmqLEylxK7DxcLsSH4MgRP1PXMTLZmAnp1uS++ypZ8MhDFi
	p6q3XzjkwhSCnPhDGsU5rmYKxVknBoIClUpAkkjkY/tIdAwEYhw4mlUinz1dcicJ
	o8DAgYewoSKkC8E1Ge/8PajxleYLoIk/oJ7snJU92QVbCUW7D8KaYwtEsI5Kf3nP
	DngeCnp2OPp2v96JytmdaVm3FQfTkFEA/kahBORjqnysEsBP9EPMJ+EmMXw5yliA
	Z9coxg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy18wn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 07:41:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L7fER0023875
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 07:41:14 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Feb 2025 23:41:08 -0800
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Fri, 21 Feb 2025 15:40:30 +0800
Subject: [PATCH 3/5] coresight-tnoc: add nodes to configure flush
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250221-trace-noc-driver-v1-3-0a23fc643217@quicinc.com>
References: <20250221-trace-noc-driver-v1-0-0a23fc643217@quicinc.com>
In-Reply-To: <20250221-trace-noc-driver-v1-0-0a23fc643217@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740123657; l=3878;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=4xpCXsw560jg661+9z67aa65t2gjEDVQA3Nb8Phphnc=;
 b=pfLNHLC7sg1JQjm5p9yhvb3z2ukPhpxlMTTBWhe8FVG+cJ9eu92mlqbVL09YNxNwKou9xkXxF
 zqHZh1E8kUsCMrLmq4KzfKnW1Xr5qHynHtVfty7u1IzdioL7Z8m2Rqb
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gkGmSD26LNx3FmcERZRXs6vGycHNu48j
X-Proofpoint-ORIG-GUID: gkGmSD26LNx3FmcERZRXs6vGycHNu48j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502210056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_234121_304555_5DBA1B2D 
X-CRM114-Status: GOOD (  16.20  )
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

Two nodes for configure flush are added here:
1. flush_req: write 1 to initiates a flush sequence.

2. flush_state: read this node to get flush status. 0: sequence in
progress; 1: sequence has been completed.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 73 ++++++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.h |  4 ++
 2 files changed, 77 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 11b9a7fd1efdc9fff7c1e9666bda14acb41786cb..25962af3850af106f7a8b7e1738ad93d44b81ee7 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -16,6 +16,78 @@
 #include "coresight-tnoc.h"
 #include "coresight-trace-id.h"
 
+static ssize_t flush_req_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf,
+			       size_t size)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct coresight_device	*csdev = drvdata->csdev;
+	unsigned long val;
+	u32 reg;
+
+	if (kstrtoul(buf, 10, &val))
+		return -EINVAL;
+
+	if (val != 1)
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	if (csdev->refcnt == 0) {
+		spin_unlock(&drvdata->spinlock);
+		return -EPERM;
+	}
+
+	reg = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
+	reg = reg | TRACE_NOC_CTRL_FLUSHREQ;
+	writel_relaxed(reg, drvdata->base + TRACE_NOC_CTRL);
+
+	spin_unlock(&drvdata->spinlock);
+
+	return size;
+}
+static DEVICE_ATTR_WO(flush_req);
+
+/*
+ * flush-sequence status:
+ * value 0: sequence in progress;
+ * value 1: sequence has been completed.
+ */
+static ssize_t flush_status_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct coresight_device	*csdev = drvdata->csdev;
+	u32 val;
+
+	spin_lock(&drvdata->spinlock);
+	if (csdev->refcnt == 0) {
+		spin_unlock(&drvdata->spinlock);
+		return -EPERM;
+	}
+
+	val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
+	spin_unlock(&drvdata->spinlock);
+	return sysfs_emit(buf, "%u\n", BMVAL(val, 2, 2));
+}
+static DEVICE_ATTR_RO(flush_status);
+
+static struct attribute *trace_noc_attrs[] = {
+	&dev_attr_flush_req.attr,
+	&dev_attr_flush_status.attr,
+	NULL,
+};
+
+static struct attribute_group trace_noc_attr_grp = {
+	.attrs = trace_noc_attrs,
+};
+
+static const struct attribute_group *trace_noc_attr_grps[] = {
+	&trace_noc_attr_grp,
+	NULL,
+};
+
 static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
 {
 	u32 val;
@@ -142,6 +214,7 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
 		return ret;
 
 	desc.ops = &trace_noc_cs_ops;
+	desc.groups = trace_noc_attr_grps;
 	desc.type = CORESIGHT_DEV_TYPE_LINK;
 	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
 	desc.pdata = adev->dev.platform_data;
diff --git a/drivers/hwtracing/coresight/coresight-tnoc.h b/drivers/hwtracing/coresight/coresight-tnoc.h
index b6bd1ef659897d8e0994c5e8514e8cbdd16eebd8..d0fe8f52709ff4147d66dbf90987595012cfaa4e 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.h
+++ b/drivers/hwtracing/coresight/coresight-tnoc.h
@@ -10,6 +10,10 @@
 
 /* Enable generation of output ATB traffic.*/
 #define TRACE_NOC_CTRL_PORTEN	BIT(0)
+/* Writing 1 to initiate a flush sequence.*/
+#define TRACE_NOC_CTRL_FLUSHREQ	BIT(1)
+/* 0: sequence in progress; 1: sequence has been completed.*/
+#define TRACE_NOC_CTRL_FLUSHSTATUS	BIT(2)
 /* Writing 1 to issue a FREQ or FREQ_TS packet*/
 #define TRACE_NOC_CTRL_FREQTSREQ	BIT(5)
 /* Sets the type of issued ATB FLAG packets. 0: 'FLAG' packets; 1: 'FLAG_TS' packets.*/

-- 
2.34.1


