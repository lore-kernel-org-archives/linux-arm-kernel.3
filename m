Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DA7C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 07:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARB5psRXmL5x7dm7O2B78qjvJCsCcFRky0xfe+WKbYI=; b=B4/1+TizxUsXajwVYnqQEJB8z7
	d7U9aNeLtcxmwjMfZ8fPd5eiYvU6U5Fzy2Zb1rvIBk6TQgmugg4hclgRUlDDujmzZstUijW3jtvCY
	AGRGjHPV2YOVCxulLuuJtRgl4jv9AKU4T0sWHGioXooFXGVy3MTY/U1IAZX8OOSTdfgpGvz+yYhUr
	JLvEcslVPsv91tustBr1ufg4VnYMc8nGPG1SdPJYwsk7dYLIuXtJAFrUVeGQtIlP0cnFvr4KRvAl4
	gDl+sCNAR82ga2Z+Af7BcuHzevptL8jyfBD+ArgYWSzRVn1w1Vac+V7ctUonglLsNT4+Ag2hQR/kA
	q7UK/KKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlNm4-00000004Zds-39bl;
	Fri, 21 Feb 2025 07:48:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlNf2-00000004YLX-2v22
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 07:41:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L6P0Vh020486;
	Fri, 21 Feb 2025 07:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ARB5psRXmL5x7dm7O2B78qjvJCsCcFRky0xfe+WKbYI=; b=XVcdcZLZjmO/eHXn
	rygMPFqcYazBbvtMPas59fSobdtqBGggV98jH7N/23t+Uavc0gKBCEGX7NiwOlby
	DBcgIXzT1tQdIVDV1ZTp/GiHcGdP0fZq3x8AA8pOFBJ/RlwMpMwC7eDn85F74xEQ
	oE3z0H5p/sNrpUfr6J6W5vjZyvWU05Mve4lSKvwU54q7n4LKY6RclIUWl1b7qzFo
	6hAOxEf5JFFyOg6WzkHUiKQNpC2VpH+tXLeRpd1nLeI+7voNJRzyc4UEcqdG4y8x
	m2u6IidlNt8JkHX2qxyCcouEPrGTIYHwGNpzqsvSpTXOeHiwDNKR6o5RrXI2P3Oq
	SlBvOQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x06t3mnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 07:41:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L7fH1B023914
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 07:41:17 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Feb 2025 23:41:11 -0800
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Fri, 21 Feb 2025 15:40:31 +0800
Subject: [PATCH 4/5] coresight-tnoc: add node to configure flag type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250221-trace-noc-driver-v1-4-0a23fc643217@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740123657; l=2045;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=XbTCKvIMDyl2DMpRiyDboA4ABVpbG+2OBuCevF1YKhI=;
 b=h3lN4iyQ0R343+Tv1yEdSNH4l3a9RPQjnnZKzRHrQmEvHRCk5ITMKEmvSl8fVDScZXHJYZwAd
 c56GsTc/3e1A/pdWKj91JFAozUJAvOJFskVabypMRqgX+/hwU4blmWt
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: q4I_8HE6VWh_Gifj3GpvwNgPP_kw408E
X-Proofpoint-GUID: q4I_8HE6VWh_Gifj3GpvwNgPP_kw408E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 mlxlogscore=953 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_234124_731195_F2F7163D 
X-CRM114-Status: GOOD (  14.56  )
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

flag_type：used to set the type of issued ATB FLAG packets.
0: 'FLAG' packets; 1: 'FLAG_TS' packets.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 42 +++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 25962af3850af106f7a8b7e1738ad93d44b81ee7..3ff3504603f66bd595484374f1cdac90c528b665 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -26,7 +26,7 @@ static ssize_t flush_req_store(struct device *dev,
 	unsigned long val;
 	u32 reg;
 
-	if (kstrtoul(buf, 10, &val))
+	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
 	if (val != 1)
@@ -73,9 +73,49 @@ static ssize_t flush_status_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(flush_status);
 
+/*
+ * Sets the type of issued ATB FLAG packets:
+ * 0: 'FLAG' packets;
+ * 1: 'FLAG_TS' packets.
+ */
+static ssize_t flag_type_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf,
+			       size_t size)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 10, &val))
+		return -EINVAL;
+
+	if (val != 1 && val != 0)
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	if (val)
+		drvdata->flag_type = FLAG_TS;
+	else
+		drvdata->flag_type = FLAG;
+	spin_unlock(&drvdata->spinlock);
+
+	return size;
+}
+
+static ssize_t flag_type_show(struct device *dev,
+			      struct device_attribute *attr,
+			      char *buf)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n", drvdata->flag_type);
+}
+static DEVICE_ATTR_RW(flag_type);
+
 static struct attribute *trace_noc_attrs[] = {
 	&dev_attr_flush_req.attr,
 	&dev_attr_flush_status.attr,
+	&dev_attr_flag_type.attr,
 	NULL,
 };
 

-- 
2.34.1


