Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE32C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxHmdfgYRRT7IkNi+RAR3ZuXldKLDuWjJ6YnOetEtWs=; b=SRfFmGIgPnu/0iprMzvu35XvBz
	uzK833ebJyZGXeVlwz6mA0B/GWDzP3gSGVQ2drDHzTYpc8CVua6StS513XrqwIwQvsm2TYIYsd48e
	zlfMBeGDhIjDP6dkIgPygWBtlBTcHMtRa7WlY41a5//NsEG0mSoBjORQintYjz6mTUQM7PMB9J8qe
	L+heDF01mm6zqFTyyWZQa85Gwe11AyBAJ1SUzEpBx8QlZVsLNNz4R0oBfF+NRcgtlomagLh/OIK5f
	M90i8s7kYqhPr/B8Ji1ERBzLGQQ0N9pfG/38DlK2rUPYxeKTUbGtq4AmwIPWhlRGi80d1jMnFwUAK
	4AJMNkvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbE7p-0000000E7Aq-35wM;
	Fri, 24 Jan 2025 07:29:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbE5C-0000000E6WL-0YHb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 07:26:27 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O6lRgs027809;
	Fri, 24 Jan 2025 07:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hxHmdfgYRRT7IkNi+RAR3ZuXldKLDuWjJ6YnOetEtWs=; b=VapIA8BPuLTC+XCQ
	f2IH/IwIxEVK01LwY/gy9nfLjbFmWcDB+cEV68md7OK9GwFGfi2evPi8/9lpD8Q0
	htSDN1autpNng6dhtwcRMxtm2HGjc4z17qyEMDLlxEt+wWRMlfHw5FdjSMzJYy3h
	THuBKVPUHwGO4eVs/ihIOmngGEtb4znakFJielRetSQwTPN5hztBUKyDIHmvye3Z
	SalFNy9C0BirT4ZmHmDNumdKqVNSyiPAHTi4UrYgW+6FnS15lSpQdfOpjgjLkygQ
	2+9sfgt0YW9c37NzzBJM+4iJTA7nzh3uk5IhXFiBT1PwwyMlpkBVQSOGX4P8sQHo
	JKbgIQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c5wfg2db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 07:26:16 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50O7QFwJ016501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 07:26:15 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 Jan 2025 23:26:10 -0800
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v9 2/6] Coresight: Add trace_id function to retrieving the trace ID
Date: Fri, 24 Jan 2025 15:25:33 +0800
Message-ID: <20250124072537.1801030-3-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124072537.1801030-1-quic_jiegan@quicinc.com>
References: <20250124072537.1801030-1-quic_jiegan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XWbpzBbX3E2gs5bO4oOZO-GN2cwpTFhm
X-Proofpoint-ORIG-GUID: XWbpzBbX3E2gs5bO4oOZO-GN2cwpTFhm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_02,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_232626_175026_32BE30A5 
X-CRM114-Status: GOOD (  15.03  )
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

Add 'trace_id' function pointer in ops. It's responsible for
retrieving the device's trace ID.

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-dummy.c | 13 +++++++++
 .../coresight/coresight-etm3x-core.c          | 29 +++++++++++++++++++
 .../coresight/coresight-etm4x-core.c          | 28 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-stm.c   | 13 +++++++++
 drivers/hwtracing/coresight/coresight-tpda.c  | 12 ++++++++
 include/linux/coresight.h                     |  5 ++++
 6 files changed, 100 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index 9be53be8964b..dfcf24e9c49a 100644
--- a/drivers/hwtracing/coresight/coresight-dummy.c
+++ b/drivers/hwtracing/coresight/coresight-dummy.c
@@ -41,6 +41,18 @@ static void dummy_source_disable(struct coresight_device *csdev,
 	dev_dbg(csdev->dev.parent, "Dummy source disabled\n");
 }
 
+static int dummy_source_trace_id(struct coresight_device *csdev, enum cs_mode mode,
+				 struct coresight_trace_id_map *id_map)
+{
+	struct dummy_drvdata *drvdata;
+
+	if (csdev == NULL)
+		return -EINVAL;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+	return drvdata->traceid;
+}
+
 static int dummy_sink_enable(struct coresight_device *csdev, enum cs_mode mode,
 				void *data)
 {
@@ -59,6 +71,7 @@ static int dummy_sink_disable(struct coresight_device *csdev)
 static const struct coresight_ops_source dummy_source_ops = {
 	.enable	= dummy_source_enable,
 	.disable = dummy_source_disable,
+	.trace_id = dummy_source_trace_id,
 };
 
 static const struct coresight_ops dummy_source_cs_ops = {
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index c103f4c70f5d..74c6a2ffd07a 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -697,10 +697,39 @@ static void etm_disable(struct coresight_device *csdev,
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
 }
 
+static int etm_trace_id(struct coresight_device *csdev, enum cs_mode mode,
+			struct coresight_trace_id_map *id_map)
+{
+	struct etm_drvdata *drvdata;
+	int trace_id;
+
+	if (csdev == NULL)
+		return -EINVAL;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+	switch (mode) {
+	case CS_MODE_SYSFS:
+		trace_id = etm_read_alloc_trace_id(drvdata);
+		break;
+	case CS_MODE_PERF:
+		trace_id = coresight_trace_id_read_cpu_id_map(drvdata->cpu, id_map);
+		if (IS_VALID_CS_TRACE_ID(trace_id))
+			drvdata->traceid = (u8)trace_id;
+		break;
+	default:
+		trace_id = -EINVAL;
+		break;
+	}
+
+	return trace_id;
+}
+
+
 static const struct coresight_ops_source etm_source_ops = {
 	.cpu_id		= etm_cpu_id,
 	.enable		= etm_enable,
 	.disable	= etm_disable,
+	.trace_id	= etm_trace_id,
 };
 
 static const struct coresight_ops etm_cs_ops = {
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2c1a60577728..e8934a9df928 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1060,10 +1060,38 @@ static void etm4_disable(struct coresight_device *csdev,
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
 }
 
+static int etm4_trace_id(struct coresight_device *csdev, enum cs_mode mode,
+			 struct coresight_trace_id_map *id_map)
+{
+	struct etmv4_drvdata *drvdata;
+	int trace_id;
+
+	if (csdev == NULL)
+		return -EINVAL;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+	switch (mode) {
+	case CS_MODE_SYSFS:
+		trace_id = etm4_read_alloc_trace_id(drvdata);
+		break;
+	case CS_MODE_PERF:
+		trace_id = coresight_trace_id_read_cpu_id_map(drvdata->cpu, id_map);
+		if (IS_VALID_CS_TRACE_ID(trace_id))
+			drvdata->trcid = (u8)trace_id;
+		break;
+	default:
+		trace_id = -EINVAL;
+		break;
+	}
+
+	return trace_id;
+}
+
 static const struct coresight_ops_source etm4_source_ops = {
 	.cpu_id		= etm4_cpu_id,
 	.enable		= etm4_enable,
 	.disable	= etm4_disable,
+	.trace_id	= etm4_trace_id,
 };
 
 static const struct coresight_ops etm4_cs_ops = {
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index b581a30a1cd9..13efd5c2e0c4 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -281,9 +281,22 @@ static void stm_disable(struct coresight_device *csdev,
 	}
 }
 
+static int stm_trace_id(struct coresight_device *csdev, enum cs_mode mode,
+			struct coresight_trace_id_map *id_map)
+{
+	struct stm_drvdata *drvdata;
+
+	if (csdev == NULL)
+		return -EINVAL;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+	return drvdata->traceid;
+}
+
 static const struct coresight_ops_source stm_source_ops = {
 	.enable		= stm_enable,
 	.disable	= stm_disable,
+	.trace_id	= stm_trace_id,
 };
 
 static const struct coresight_ops stm_cs_ops = {
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 189a4abc2561..3632c1791c96 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -241,9 +241,21 @@ static void tpda_disable(struct coresight_device *csdev,
 	dev_dbg(drvdata->dev, "TPDA inport %d disabled\n", in->dest_port);
 }
 
+static int tpda_trace_id(struct coresight_device *csdev)
+{
+	struct tpda_drvdata *drvdata;
+
+	if (csdev == NULL)
+		return -EINVAL;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+	return drvdata->atid;
+}
+
 static const struct coresight_ops_link tpda_link_ops = {
 	.enable		= tpda_enable,
 	.disable	= tpda_disable,
+	.trace_id	= tpda_trace_id,
 };
 
 static const struct coresight_ops tpda_cs_ops = {
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 157c4bd009a1..82fbcc70a21c 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -368,6 +368,7 @@ struct coresight_ops_sink {
  * Operations available for links.
  * @enable:	enables flow between iport and oport.
  * @disable:	disables flow between iport and oport.
+ * @trace_id:	Collect the traceid.
  */
 struct coresight_ops_link {
 	int (*enable)(struct coresight_device *csdev,
@@ -376,6 +377,7 @@ struct coresight_ops_link {
 	void (*disable)(struct coresight_device *csdev,
 			struct coresight_connection *in,
 			struct coresight_connection *out);
+	int (*trace_id)(struct coresight_device *csdev);
 };
 
 /**
@@ -385,6 +387,7 @@ struct coresight_ops_link {
  *		is associated to.
  * @enable:	enables tracing for a source.
  * @disable:	disables tracing for a source.
+ * @trace_id:	collect the traceid.
  */
 struct coresight_ops_source {
 	int (*cpu_id)(struct coresight_device *csdev);
@@ -392,6 +395,8 @@ struct coresight_ops_source {
 		      enum cs_mode mode, struct coresight_trace_id_map *id_map);
 	void (*disable)(struct coresight_device *csdev,
 			struct perf_event *event);
+	int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
+			struct coresight_trace_id_map *id_map);
 };
 
 /**
-- 
2.34.1


