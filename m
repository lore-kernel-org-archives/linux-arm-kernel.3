Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD7EC1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 09:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1l7edTeasmoMFPJa7aEBSwFL/pdGW62t+1SXgjMizNw=; b=MQGlz0uidzrICF33JidRbworzG
	lhY6kQnfkozAbrwH0C3t8rM5zN+gjM+sX0h1y1abkIwyD00bRN4/CzsgNcjC6lit96csDk/nKVzWD
	HJtuLq5EINN288XiLloVQQfFz9KZSkc7QzGUf8s1nwEnLmTw+Ogu+hDioFpF9eSq8//V14HCEgJTi
	SzWbOvMz98S2qkSDELVcOipEm3EF/hMpbqb0LXXuTM+CQa2G4frc/FmPrXehdGKl0aE+Tv3T0mSAF
	+vY+j8Y2KM9E4f/TeaoyCXtDEuDmcT0UmpwH8MP9upPtpiJguI5HmHAG9pf7Tjj7Z+cNFxtmF3uCR
	Ud4kdF1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaWG-00000006uae-0XeO;
	Thu, 27 Feb 2025 09:49:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaB7-00000006rL0-30Ew
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 09:27:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R8n5mw002157;
	Thu, 27 Feb 2025 09:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1l7edTeasmoMFPJa7aEBSwFL/pdGW62t+1SXgjMizNw=; b=VwWV+QVIYrpjXcOG
	CM3KKCLtKafZtyZ7UGNICLSRtHB/JeKEatGw6IR2JItnFWqUUGxRV3EzyuhmIK/k
	+CFL5CeIaMpenqSwy27FHo0+y8lqU7Qk8tvUzTLXJhOJILx9T++TV68FoMw3SXMT
	vZ2Pt6+lKALaGtksQL2yezUeLK1T+Mf1PauyJ4tiu9tq+3RJIr1vqd9vPuB4t4Nn
	npB7dMsiFscXCC36FfAg7HLQ05+bDIpYdfBqyCgljI4WTT/B/M/K/TrjXT6/3YVp
	mRnd/pL+xlgZYePIBF2z/tKvwe7fuP/7bOC1gVJOF+9V+zvYy2kHRHDL6IHfIpr5
	FMOHLQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451pu9d4dj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 09:27:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51R9RUqG012443
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 09:27:30 GMT
Received: from ap-cloud-sh02-lnx.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 27 Feb 2025 01:27:25 -0800
From: songchai <quic_songchai@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Songwei Chai <quic_songchai@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3 7/7] coresight-tgu: add reset node to initialize
Date: Thu, 27 Feb 2025 17:26:40 +0800
Message-ID: <20250227092640.2666894-8-quic_songchai@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227092640.2666894-1-quic_songchai@quicinc.com>
References: <20250227092640.2666894-1-quic_songchai@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ez9pBtqEFL_RKGTRrdyRjH8hiiDxTHnL
X-Proofpoint-ORIG-GUID: ez9pBtqEFL_RKGTRrdyRjH8hiiDxTHnL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_012737_762687_108141A5 
X-CRM114-Status: GOOD (  17.99  )
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

From: Songwei Chai <quic_songchai@quicinc.com>

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes

Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
Signed-off-by: songchai <quic_songchai@quicinc.com>
---
 .../testing/sysfs-bus-coresight-devices-tgu   |  7 ++
 drivers/hwtracing/coresight/coresight-tgu.c   | 79 +++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index d88d05fbff43..8fb5afd7c655 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion   6.15
 Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
 Description:
                 (RW) Set/Get the counter value with specific step for TGU.
+
+What:           /sys/bus/coresight/devices/<tgu-name>/reset_tgu
+Date:           February 2025
+KernelVersion   6.15
+Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
+Description:
+                (Write) Reset the dataset for TGU.
diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
index 693d632fb079..b36ced761c0d 100644
--- a/drivers/hwtracing/coresight/coresight-tgu.c
+++ b/drivers/hwtracing/coresight/coresight-tgu.c
@@ -343,6 +343,84 @@ static ssize_t enable_tgu_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_tgu);
 
+/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
+static ssize_t reset_tgu_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	unsigned long value;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	int i, j, ret;
+
+	if (kstrtoul(buf, 0, &value))
+		return -EINVAL;
+
+	if (!drvdata->enable) {
+		ret = pm_runtime_get_sync(drvdata->dev);
+		if (ret < 0) {
+			pm_runtime_put(drvdata->dev);
+			return ret;
+		}
+	}
+
+	spin_lock(&drvdata->spinlock);
+	CS_UNLOCK(drvdata->base);
+
+	if (value) {
+		tgu_writel(drvdata, 0, TGU_CONTROL);
+
+		if (drvdata->value_table->priority)
+			memset(drvdata->value_table->priority, 0,
+			       MAX_PRIORITY * drvdata->max_step *
+				       drvdata->max_reg * sizeof(unsigned int));
+
+		if (drvdata->value_table->condition_decode)
+			memset(drvdata->value_table->condition_decode, 0,
+			       drvdata->max_condition_decode * drvdata->max_step *
+				       sizeof(unsigned int));
+
+		/* Initialize all condition registers to NOT(value=0x1000000) */
+		for (i = 0; i < drvdata->max_step; i++) {
+			for (j = 0; j < drvdata->max_condition_decode; j++) {
+				drvdata->value_table
+					->condition_decode[calculate_array_location(
+						drvdata, i, TGU_CONDITION_DECODE, j)] =
+					0x1000000;
+			}
+		}
+
+		if (drvdata->value_table->condition_select)
+			memset(drvdata->value_table->condition_select, 0,
+			       drvdata->max_condition_select * drvdata->max_step *
+				       sizeof(unsigned int));
+
+		if (drvdata->value_table->timer)
+			memset(drvdata->value_table->timer, 0,
+			       (drvdata->max_step) *
+				       (drvdata->max_timer_counter) *
+				       sizeof(unsigned int));
+
+		if (drvdata->value_table->counter)
+			memset(drvdata->value_table->counter, 0,
+			       (drvdata->max_step) *
+				       (drvdata->max_timer_counter) *
+				       sizeof(unsigned int));
+
+		dev_dbg(dev, "Coresight-TGU reset complete\n");
+	} else {
+		dev_dbg(dev, "Coresight-TGU invalid input\n");
+	}
+
+	CS_LOCK(drvdata->base);
+
+	drvdata->enable = false;
+	spin_unlock(&drvdata->spinlock);
+	pm_runtime_put(drvdata->dev);
+
+	return size;
+}
+static DEVICE_ATTR_WO(reset_tgu);
+
 static const struct coresight_ops_helper tgu_helper_ops = {
 	.enable = tgu_enable,
 	.disable = tgu_disable,
@@ -354,6 +432,7 @@ static const struct coresight_ops tgu_ops = {
 
 static struct attribute *tgu_common_attrs[] = {
 	&dev_attr_enable_tgu.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 


