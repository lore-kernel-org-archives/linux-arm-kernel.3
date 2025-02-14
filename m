Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38375C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 03:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shVIUco9/xvOchbwtVKLxUb0GSGyhJfXjcxn1Rws5Kc=; b=Eg6y9nWDVdYNTOeP1NC5hPrFB4
	DVI/UiM4ih8bNUuS08kUMTeiSalUDhF6OqOAt6p7DN+PRK3yR3nSgCSqSPz0j6fNXFzszuDT2PUkd
	9IA8uPtS7/Or/nIQnL48uecWaArIYCGtmKJIBBrwrA7uQj8HEX7+GSsGSjoVJSOrV9qiJlY7SU2NH
	Fe6Uun4ftAcZ/afFM+i7FtQ9bkxAbCZDIakiVUt6vObduVBI+3OYNKjfQYKNdwH7jxsJESjZ5zwho
	MiyhKJe4A8EoaSS4NXQke4siz2FhF1Cm5mkmCfPH9m9f/8vee0OrC6hxJ0WgMXjrI1cuWCugattUt
	9uWPTrBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1timC5-0000000DSv7-2jLM;
	Fri, 14 Feb 2025 03:16:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tildc-0000000DNWS-0Eem
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 02:41:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DL5eZt000335;
	Fri, 14 Feb 2025 02:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	shVIUco9/xvOchbwtVKLxUb0GSGyhJfXjcxn1Rws5Kc=; b=YMx5anMJEGDdwE6D
	jbDyYBwLQiVVF1/h9w6BK2FzkGsXZxL961p5Z8IL7G4Dx9LuVhf+GXcsuylW1kfG
	mPqKzzC+MmhATqAUlIbvIKdV8EiAPlVd008KAIc0h+TUkoqUR8sWwxiG92T5FzoY
	kHsxm+4VJ8oTR/PArFLsjLEwkUPqvEfFRIvby3oPCkc06kNJPF2db6t+urgQJ5Qc
	/rChS7co+JQQTNUEQvQ2TZUY0YftWqpDdtdsXvqGCM4hiccqOeWzTgKFjMpjmigt
	BhnsJe4QntYwa2JyZoAon2Ds55p0accJEIUu7WTxRsjL+n1g+B63wRX2f8xMY3Po
	groBqw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44seq026fj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 02:40:58 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51E2evpt019823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 02:40:57 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Feb 2025 18:40:51 -0800
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
Subject: [PATCH v11 2/7] Coresight: Add trace_id function to retrieving the trace ID
Date: Fri, 14 Feb 2025 10:40:16 +0800
Message-ID: <20250214024021.249655-3-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250214024021.249655-1-quic_jiegan@quicinc.com>
References: <20250214024021.249655-1-quic_jiegan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bf4tGJ1ITfWfDn0_1fD1OglXpQVnmeC1
X-Proofpoint-ORIG-GUID: bf4tGJ1ITfWfDn0_1fD1OglXpQVnmeC1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_09,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_184108_218176_79E758F8 
X-CRM114-Status: GOOD (  17.12  )
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

Co-developed-by: James Clark <james.clark@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 27 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-dummy.c | 11 ++++++++
 .../coresight/coresight-etm3x-core.c          |  1 +
 .../coresight/coresight-etm4x-core.c          |  1 +
 drivers/hwtracing/coresight/coresight-stm.c   | 11 ++++++++
 drivers/hwtracing/coresight/coresight-tpda.c  | 11 ++++++++
 include/linux/coresight.h                     |  8 ++++++
 7 files changed, 70 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 0a9380350fb5..6cad777757f3 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -23,6 +23,7 @@
 #include "coresight-etm-perf.h"
 #include "coresight-priv.h"
 #include "coresight-syscfg.h"
+#include "coresight-trace-id.h"
 
 /*
  * Mutex used to lock all sysfs enable and disable actions and loading and
@@ -1515,6 +1516,32 @@ void coresight_remove_driver(struct amba_driver *amba_drv,
 }
 EXPORT_SYMBOL_GPL(coresight_remove_driver);
 
+int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
+			       struct coresight_device *sink)
+{
+	int trace_id;
+	int cpu = source_ops(csdev)->cpu_id(csdev);
+
+	switch (mode) {
+	case CS_MODE_SYSFS:
+		trace_id = coresight_trace_id_get_cpu_id(cpu);
+		break;
+	case CS_MODE_PERF:
+		trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink->perf_sink_id_map);
+		break;
+	default:
+		trace_id = -EINVAL;
+		break;
+	}
+
+	if (!IS_VALID_CS_TRACE_ID(trace_id))
+		dev_err(&csdev->dev,
+			"Failed to allocate trace ID on CPU%d\n", cpu);
+
+	return trace_id;
+}
+EXPORT_SYMBOL_GPL(coresight_etm_get_trace_id);
+
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
 MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index 9be53be8964b..c47f0382b943 100644
--- a/drivers/hwtracing/coresight/coresight-dummy.c
+++ b/drivers/hwtracing/coresight/coresight-dummy.c
@@ -41,6 +41,16 @@ static void dummy_source_disable(struct coresight_device *csdev,
 	dev_dbg(csdev->dev.parent, "Dummy source disabled\n");
 }
 
+static int dummy_source_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
+				 __maybe_unused struct coresight_device *sink)
+{
+	struct dummy_drvdata *drvdata;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	return drvdata->traceid;
+}
+
 static int dummy_sink_enable(struct coresight_device *csdev, enum cs_mode mode,
 				void *data)
 {
@@ -59,6 +69,7 @@ static int dummy_sink_disable(struct coresight_device *csdev)
 static const struct coresight_ops_source dummy_source_ops = {
 	.enable	= dummy_source_enable,
 	.disable = dummy_source_disable,
+	.trace_id = dummy_source_trace_id,
 };
 
 static const struct coresight_ops dummy_source_cs_ops = {
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index c103f4c70f5d..a38e72ef8e79 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -701,6 +701,7 @@ static const struct coresight_ops_source etm_source_ops = {
 	.cpu_id		= etm_cpu_id,
 	.enable		= etm_enable,
 	.disable	= etm_disable,
+	.trace_id	= coresight_etm_get_trace_id,
 };
 
 static const struct coresight_ops etm_cs_ops = {
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2c1a60577728..1a993d5380e7 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1064,6 +1064,7 @@ static const struct coresight_ops_source etm4_source_ops = {
 	.cpu_id		= etm4_cpu_id,
 	.enable		= etm4_enable,
 	.disable	= etm4_disable,
+	.trace_id	= coresight_etm_get_trace_id,
 };
 
 static const struct coresight_ops etm4_cs_ops = {
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index b581a30a1cd9..64fcfa916562 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -281,9 +281,20 @@ static void stm_disable(struct coresight_device *csdev,
 	}
 }
 
+static int stm_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
+			__maybe_unused struct coresight_device *sink)
+{
+	struct stm_drvdata *drvdata;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+
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
index 189a4abc2561..d80b6427e5a6 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -241,9 +241,20 @@ static void tpda_disable(struct coresight_device *csdev,
 	dev_dbg(drvdata->dev, "TPDA inport %d disabled\n", in->dest_port);
 }
 
+static int tpda_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
+			 __maybe_unused struct coresight_device *sink)
+{
+	struct tpda_drvdata *drvdata;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+
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
index 157c4bd009a1..70407d61262e 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -368,6 +368,7 @@ struct coresight_ops_sink {
  * Operations available for links.
  * @enable:	enables flow between iport and oport.
  * @disable:	disables flow between iport and oport.
+ * @trace_id:	alloc or read the traceid.
  */
 struct coresight_ops_link {
 	int (*enable)(struct coresight_device *csdev,
@@ -376,6 +377,8 @@ struct coresight_ops_link {
 	void (*disable)(struct coresight_device *csdev,
 			struct coresight_connection *in,
 			struct coresight_connection *out);
+	int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
+			struct coresight_device *sink);
 };
 
 /**
@@ -385,6 +388,7 @@ struct coresight_ops_link {
  *		is associated to.
  * @enable:	enables tracing for a source.
  * @disable:	disables tracing for a source.
+ * @trace_id:	alloc or read the traceid.
  */
 struct coresight_ops_source {
 	int (*cpu_id)(struct coresight_device *csdev);
@@ -392,6 +396,8 @@ struct coresight_ops_source {
 		      enum cs_mode mode, struct coresight_trace_id_map *id_map);
 	void (*disable)(struct coresight_device *csdev,
 			struct perf_event *event);
+	int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
+			struct coresight_device *sink);
 };
 
 /**
@@ -697,4 +703,6 @@ int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
 
 void coresight_remove_driver(struct amba_driver *amba_drv,
 			     struct platform_driver *pdev_drv);
+int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
+			       struct coresight_device *sink);
 #endif		/* _LINUX_COREISGHT_H */
-- 
2.34.1


