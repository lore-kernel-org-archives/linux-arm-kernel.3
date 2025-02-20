Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BC5C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 09:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJyVAzse7xLFb8xCPnWRvVTtifhlIa8lHqL9vpKMvTY=; b=en16qWr3jrQCZ6U6PFstAFY+WB
	2csMup5NTVrqVKBt1q8Ac/OoGKP+sY1OnIe9BjONrsXgsvfiwJ2s2kWiHJyQbAHAW5q65WsEq5uvW
	odgtdWyJmVGpk9/BtlETR91N/hX4LQZCGX2zLwEEl7KLrojjsm/Pvsjn6ZcBDUlMPcuzFKdoEbcDe
	sF7ETD6ns0cT55TTkuWggvHu32eDwnc2E0jB4lGcQvfz6m2euRkz+uaIm7xxOg3dnqD/VRJWzITb0
	sBA64AvWhTeKB26bZDCLufpH5SEKlVB/Q8OV5nDD5pDrQi0Nh/KlDH1sH7Y812Qrr67MXRyDkF+7d
	UMCnveDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl3D9-000000008kJ-0d1c;
	Thu, 20 Feb 2025 09:51:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl34S-000000005Ud-3XKw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 09:42:17 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6q7dM002872;
	Thu, 20 Feb 2025 09:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IJyVAzse7xLFb8xCPnWRvVTtifhlIa8lHqL9vpKMvTY=; b=htoHkTqewfmaGjOo
	dW53N/5j4HTrBOsS2f7HGFmNkTz/Fyaxa6L75W++F39UHaQcPtVMJXQpLhPgbqOy
	fNRttGQVqV+sYcvQO2o90cXoXCL1kd/shfGamPSzZKDDLEdY1+UJ9luy0Y5q3383
	aO11F7VW+yLM5yy7paiqhSJBJswnPfNuj9DCIX2YzuuNXDQ5U0ZGzzcFYKeLh/kZ
	Mvtq3h5FImopJGeBBU80NyGgwkQwB8PjkTUpH1fn5a2EdZoboW1ma/lxK6tz2U8n
	NDLdA+Y5DvKIxz9qI9/uI6VLxMBhJDOhDyd/SgWS02cFeCI5CX/yyP8LIKZAG9s8
	9n9EBw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy2dnqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 09:42:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51K9gBxk014611
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 09:42:11 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Feb 2025 01:42:06 -0800
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Thu, 20 Feb 2025 17:41:25 +0800
Subject: [PATCH 5/5] coresight-tnoc: add nodes to configure freq packet
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250220-trace-noc-driver-v1-5-15d78bd48e12@quicinc.com>
References: <20250220-trace-noc-driver-v1-0-15d78bd48e12@quicinc.com>
In-Reply-To: <20250220-trace-noc-driver-v1-0-15d78bd48e12@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: <kernel@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740044514; l=3505;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=D9nO0Rw8IFdx8/JC61W3qCybMF46rPTusGdMNvOiv98=;
 b=ytz5uErs24gdEcmBxtu39+tZCkTaeRzPZqkFSIlGu3N5H9CtOudTsRJnlEculWU/ssPHawnR+
 xqLzvW7E1mtCKwKVfl8Kw+cs2+1C1N6wX0DTNDJbc1E4lrTezhh8wpG
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3bG4iI2z1IT3A49eBuqdkjYEGYgTiFwY
X-Proofpoint-GUID: 3bG4iI2z1IT3A49eBuqdkjYEGYgTiFwY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_014216_916718_4BE2FFEA 
X-CRM114-Status: GOOD (  14.89  )
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

Three nodes for freq packet config are added here:

1. freq_type: used to set the type of issued ATB FREQ packets.
0: 'FREQ' packets; 1: 'FREQ_TS' packets.

2. freq_req_val: used to set frequency values carried by 'FREQ'
and 'FREQ_TS' packets.

3. freq_ts_req: writing '1' to issue a 'FREQ' or 'FREQ_TS' packet.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 97 ++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 3ff3504603f66bd595484374f1cdac90c528b665..629df98959d1bfb55771376fac2818a48cb9c259 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -112,10 +112,107 @@ static ssize_t flag_type_show(struct device *dev,
 }
 static DEVICE_ATTR_RW(flag_type);
 
+static ssize_t freq_type_show(struct device *dev,
+			      struct device_attribute *attr,
+			      char *buf)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n", drvdata->freq_type);
+}
+
+static ssize_t freq_type_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf,
+			       size_t size)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	if (val != 1 && val != 0)
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	if (val)
+		drvdata->freq_type = FREQ_TS;
+	else
+		drvdata->freq_type = FREQ;
+	spin_unlock(&drvdata->spinlock);
+
+	return size;
+}
+static DEVICE_ATTR_RW(freq_type);
+
+static ssize_t freq_req_val_show(struct device *dev,
+				 struct device_attribute *attr,
+				char *buf)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n", drvdata->freq_req_val);
+}
+
+static ssize_t freq_req_val_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf,
+				  size_t size)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	if (val) {
+		spin_lock(&drvdata->spinlock);
+		drvdata->freq_req_val = val;
+		spin_unlock(&drvdata->spinlock);
+	}
+
+	return size;
+}
+static DEVICE_ATTR_RW(freq_req_val);
+
+static ssize_t freq_ts_req_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf,
+				 size_t size)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct coresight_device	*csdev = drvdata->csdev;
+	unsigned long val;
+	u32 reg;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	if (csdev->refcnt == 0) {
+		spin_unlock(&drvdata->spinlock);
+		return -EPERM;
+	}
+
+	if (val) {
+		reg = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
+		reg = reg | TRACE_NOC_CTRL_FREQTSREQ;
+		writel_relaxed(reg, drvdata->base + TRACE_NOC_CTRL);
+	}
+	spin_unlock(&drvdata->spinlock);
+
+	return size;
+}
+static DEVICE_ATTR_WO(freq_ts_req);
+
 static struct attribute *trace_noc_attrs[] = {
 	&dev_attr_flush_req.attr,
 	&dev_attr_flush_status.attr,
 	&dev_attr_flag_type.attr,
+	&dev_attr_freq_type.attr,
+	&dev_attr_freq_req_val.attr,
+	&dev_attr_freq_ts_req.attr,
 	NULL,
 };
 

-- 
2.34.1


