Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC720C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 06:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PmfoLsnHoO6ugPoCT2FbLQfUxlVhokGzSc2sK0KEJls=; b=23cMUi3ngWQDGoSh63vB+SNNLN
	m+SFbguSvjCeUl8kzWTLpenqu6hWTJ0l2I2UNZn1GChHsNd8IaOMm51MkmD5ybIElTCpXWqnWMwje
	Q+KVWpFo7PAkWdIjnhL4pJJEU88Uq/VJyhUpQ+r/djG42QRCEm5N3tHQRnVNCFGQyEEqGHcwC4Z3h
	1TRNMO1mYq6/x7DSAb/fwYcx8RtG1fT9OAwnQHSosk3OhGZ92gKS1Xer+bpVUkMrclyii3TtF70vG
	2WBKX8ncQvQdKVml3aiXOltDtbmWRGE99vsWLlg1RxAJshBy2LIQgiPJd0LNTX6hXSj5qaXbVM0Fe
	n9EjHIVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thjeg-00000002gWa-1rFB;
	Tue, 11 Feb 2025 06:21:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thjdG-00000002gH4-3Liv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 06:20:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AHtKqM006114
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 06:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PmfoLsnHoO6ugPoCT2FbLQfUxlVhokGzSc2
	sK0KEJls=; b=eigp1VWp5nVTf0KQP6yjFDkyyX5X5U06pT4TJeXqO5lv+B6HlpR
	uJfHxALBL9C7eR/WArTvQBXcPmQHPMswTtJQrBFJfQ8GXTyl675ZwCzI9fKqHj57
	wIO28zez1tv8OytZY+vmk0o1do9qARFop098Df2qFHwmmnEFpR+e4wYZV8QBxf3p
	xbKkxgziB+diQC4h14QZW2/NO/ry+Vy3XTG2p3YTRgeDdVKZR2/nRhebMrAbLMpx
	ht6PLEclxIPtb+4ZIgxh/V2zFK8IKfgM6wT+ryTFigx2sklbO263uzrflAl9oE+l
	4Asm2zIbyj+Jx9mZr+VLlf5757Hw4eeLTUw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5mu22f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 06:20:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21f6a47d5d7so85808435ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 22:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739254827; x=1739859627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PmfoLsnHoO6ugPoCT2FbLQfUxlVhokGzSc2sK0KEJls=;
        b=D5W1NoTvM0iOZunB6R/NOmh6fk7G1Ve/QBT/R4/mOjMWaloZyrnADdHOF/PM6TpMQh
         heYFILXafDOfpdl7F+QGgyXuM8zL/89ZcC11llpdi5nvJP1lmogsxD1+oydLjmQvrLWR
         etR1NA+VFshe6H6KKYp7wn69ukJUV2nw8znrD6b1sucOCJd+Q+1SmRtCb3oZt2oW/v4e
         3y7yP+oMnKgfoXtny17KcjyeGf6G+V7vbBrOqyGGv0o5boxTLmGzJLc9Cbu3IBfGWfGO
         qID1ThQXa2HAujuQ4NNVmaaVginkuQdmfmoleWLfmQdJj7MrU6EAymCLrtGiQ+WSvR51
         m9Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUPC2a/iuf2k7weoQWluXkt5Z/ibT5zY+niONhZv0tE2NqkTRPnZ5RdFb/5rFTQr3P8Gtxwi5aotYAA9InL5bMc@lists.infradead.org
X-Gm-Message-State: AOJu0YwB9IJC0RfdrHRyjVqUh0Q5IzWIpslKLeKpAcRT3IfdmF0NZ2Pm
	Di56Qi43+DS3PeuRf3b6v099FIFbELLIk5F3SPXjn/XR+LUtpyhYbAf59u2Gnj5M24qExLEBj30
	yzxWOCf83MPxmxUHXkDKDdPSeQwrtkY4o4MrUZ5mQxjy+6d/++meRwiu0+5B5jnRa2URvu7RGhA
	==
X-Gm-Gg: ASbGnctdaHgABlR4653eosyEXQ81LuktxpwEoPYehpu0FtAhaAYyxdSywucsLNgNu6C
	L6msyVsJhNEk2R2etrPcldeUjM9bpuJGYxj53ZjUNED9Yt180j6+VaK1OC39NIzLYElrR1xaWt2
	8dt/93O2lgqT7M8QY1A+Js6Ddib5Dhixpdi1J7Vy56hgWvSH2u6G7xGPT1hT5O93gOxyvyxTIAh
	DIm0A2FE2xlHLHjLtBUAg0UnS631LM90jmCSqw3LfrufyvI2SMZr5GM8Rwq7lEuNNESFMdM/72+
	Iw7t58r/qPkb5CJ3qW2PKUpTGVY7P4+NAtHI4bVyG1PX/1cTb0EHh48YVo6m
X-Received: by 2002:a17:902:c94a:b0:21f:8099:72d9 with SMTP id d9443c01a7336-21f8099743emr141631465ad.27.1739254827003;
        Mon, 10 Feb 2025 22:20:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8R2QdzknMDBUU94uiL8esTvNXjuwN7R3CfQRpNwhxgCNE7bLwMl3dtL8F/4NjvQMUdhd4iw==
X-Received: by 2002:a17:902:c94a:b0:21f:8099:72d9 with SMTP id d9443c01a7336-21f8099743emr141631165ad.27.1739254826545;
        Mon, 10 Feb 2025 22:20:26 -0800 (PST)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368cf7fcsm88738405ad.249.2025.02.10.22.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 22:20:25 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] Coresight: Improve the method for passing through perf handle
Date: Tue, 11 Feb 2025 14:20:21 +0800
Message-Id: <20250211062021.7013-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: udTuMU4jPAISvdG9qBwnteLiVGrEeJfD
X-Proofpoint-ORIG-GUID: udTuMU4jPAISvdG9qBwnteLiVGrEeJfD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_02,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=910 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_222030_973494_1C67F700 
X-CRM114-Status: GOOD (  20.08  )
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

From: James Clark <james.clark@linaro.org>

Currently, the perf handle is being passed to the sink device as a void
parameter with additional type conversion. Improve the method for
passing perf handle parameter to make the code more readable.

Signed-off-by: James Clark <james.clark@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
prerequisite-message-id: <20250207064213.2314482-5-quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-core.c    |  8 ++++----
 drivers/hwtracing/coresight/coresight-dummy.c   |  2 +-
 drivers/hwtracing/coresight/coresight-etb10.c   |  7 +++----
 drivers/hwtracing/coresight/coresight-priv.h    |  2 +-
 drivers/hwtracing/coresight/coresight-tmc-etf.c |  8 ++++----
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 11 +++++------
 drivers/hwtracing/coresight/coresight-tmc.h     |  2 +-
 drivers/hwtracing/coresight/coresight-tpiu.c    |  2 +-
 drivers/hwtracing/coresight/coresight-trbe.c    |  3 +--
 drivers/hwtracing/coresight/ultrasoc-smb.c      |  7 +++----
 include/linux/coresight.h                       |  2 +-
 11 files changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 3bdd6ebd4b6e..9246b46bdc3b 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -272,9 +272,9 @@ void coresight_add_helper(struct coresight_device *csdev,
 EXPORT_SYMBOL_GPL(coresight_add_helper);
 
 static int coresight_enable_sink(struct coresight_device *csdev,
-				 enum cs_mode mode, void *data)
+				 enum cs_mode mode, struct perf_output_handle *handle)
 {
-	return sink_ops(csdev)->enable(csdev, mode, data);
+	return sink_ops(csdev)->enable(csdev, mode, handle);
 }
 
 static void coresight_disable_sink(struct coresight_device *csdev)
@@ -448,7 +448,7 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
 }
 
 int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
-			  void *sink_data)
+			  struct perf_output_handle *handle)
 {
 	int ret = 0;
 	u32 type;
@@ -478,7 +478,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 
 		switch (type) {
 		case CORESIGHT_DEV_TYPE_SINK:
-			ret = coresight_enable_sink(csdev, mode, sink_data);
+			ret = coresight_enable_sink(csdev, mode, handle);
 			/*
 			 * Sink is the first component turned on. If we
 			 * failed to enable the sink, there are no components
diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index d9a811d44885..42de46949d73 100644
--- a/drivers/hwtracing/coresight/coresight-dummy.c
+++ b/drivers/hwtracing/coresight/coresight-dummy.c
@@ -51,7 +51,7 @@ static int dummy_source_trace_id(struct coresight_device *csdev, __maybe_unused
 }
 
 static int dummy_sink_enable(struct coresight_device *csdev, enum cs_mode mode,
-				void *data)
+				struct perf_output_handle *handle)
 {
 	dev_dbg(csdev->dev.parent, "Dummy sink enabled\n");
 
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index aea9ac9c4bd0..e373b0f590bf 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -167,13 +167,12 @@ static int etb_enable_sysfs(struct coresight_device *csdev)
 	return ret;
 }
 
-static int etb_enable_perf(struct coresight_device *csdev, void *data)
+static int etb_enable_perf(struct coresight_device *csdev, struct perf_output_handle *handle)
 {
 	int ret = 0;
 	pid_t pid;
 	unsigned long flags;
 	struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = data;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
@@ -224,7 +223,7 @@ static int etb_enable_perf(struct coresight_device *csdev, void *data)
 }
 
 static int etb_enable(struct coresight_device *csdev, enum cs_mode mode,
-		      void *data)
+		      struct perf_output_handle *handle)
 {
 	int ret;
 
@@ -233,7 +232,7 @@ static int etb_enable(struct coresight_device *csdev, enum cs_mode mode,
 		ret = etb_enable_sysfs(csdev);
 		break;
 	case CS_MODE_PERF:
-		ret = etb_enable_perf(csdev, data);
+		ret = etb_enable_perf(csdev, handle);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index c10dd3643854..eca06a89843f 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -134,7 +134,7 @@ static inline void CS_UNLOCK(void __iomem *addr)
 
 void coresight_disable_path(struct coresight_path *path);
 int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
-			  void *sink_data);
+			  struct perf_output_handle *handle);
 struct coresight_device *coresight_get_sink(struct coresight_path *path);
 struct coresight_device *coresight_get_sink_by_id(u32 id);
 struct coresight_device *
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index d4f641cd9de6..fdf1c2511d67 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -244,13 +244,13 @@ static int tmc_enable_etf_sink_sysfs(struct coresight_device *csdev)
 	return ret;
 }
 
-static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
+static int tmc_enable_etf_sink_perf(struct coresight_device *csdev,
+				    struct perf_output_handle *handle)
 {
 	int ret = 0;
 	pid_t pid;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = data;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
@@ -302,7 +302,7 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
 }
 
 static int tmc_enable_etf_sink(struct coresight_device *csdev,
-			       enum cs_mode mode, void *data)
+			       enum cs_mode mode, struct perf_output_handle *handle)
 {
 	int ret;
 
@@ -311,7 +311,7 @@ static int tmc_enable_etf_sink(struct coresight_device *csdev,
 		ret = tmc_enable_etf_sink_sysfs(csdev);
 		break;
 	case CS_MODE_PERF:
-		ret = tmc_enable_etf_sink_perf(csdev, data);
+		ret = tmc_enable_etf_sink_perf(csdev, handle);
 		break;
 	/* We shouldn't be here */
 	default:
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index a48bb85d0e7f..2d0bd06bab2a 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1252,9 +1252,8 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 }
 
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
-				   enum cs_mode mode, void *data)
+				   enum cs_mode mode, struct perf_output_handle *handle)
 {
-	struct perf_output_handle *handle = data;
 	struct etr_perf_buffer *etr_perf;
 
 	switch (mode) {
@@ -1642,13 +1641,13 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
 	return size;
 }
 
-static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
+static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
+				    struct perf_output_handle *handle)
 {
 	int rc = 0;
 	pid_t pid;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = data;
 	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
@@ -1696,13 +1695,13 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 }
 
 static int tmc_enable_etr_sink(struct coresight_device *csdev,
-			       enum cs_mode mode, void *data)
+			       enum cs_mode mode, struct perf_output_handle *handle)
 {
 	switch (mode) {
 	case CS_MODE_SYSFS:
 		return tmc_enable_etr_sink_sysfs(csdev);
 	case CS_MODE_PERF:
-		return tmc_enable_etr_sink_perf(csdev, data);
+		return tmc_enable_etr_sink_perf(csdev, handle);
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 2671926be62a..e991afd43742 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -336,7 +336,7 @@ struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
-				   enum cs_mode mode, void *data);
+				   enum cs_mode mode, struct perf_output_handle *handle);
 extern const struct attribute_group coresight_etr_group;
 
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 97ef36f03ec2..ccf463ac7bf5 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -75,7 +75,7 @@ static void tpiu_enable_hw(struct csdev_access *csa)
 }
 
 static int tpiu_enable(struct coresight_device *csdev, enum cs_mode mode,
-		       void *__unused)
+		       struct perf_output_handle *__unused)
 {
 	struct tpiu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index fff67aac8418..a0914d10ed47 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1011,11 +1011,10 @@ static int __arm_trbe_enable(struct trbe_buf *buf,
 }
 
 static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
-			   void *data)
+			   struct perf_output_handle *handle)
 {
 	struct trbe_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
-	struct perf_output_handle *handle = data;
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
 
 	WARN_ON(cpudata->cpu != smp_processor_id());
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
index dc3c9504dd7c..1574b5067206 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.c
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
@@ -213,10 +213,9 @@ static void smb_enable_sysfs(struct coresight_device *csdev)
 	coresight_set_mode(csdev, CS_MODE_SYSFS);
 }
 
-static int smb_enable_perf(struct coresight_device *csdev, void *data)
+static int smb_enable_perf(struct coresight_device *csdev, struct perf_output_handle *handle)
 {
 	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = data;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 	pid_t pid;
 
@@ -240,7 +239,7 @@ static int smb_enable_perf(struct coresight_device *csdev, void *data)
 }
 
 static int smb_enable(struct coresight_device *csdev, enum cs_mode mode,
-		      void *data)
+		      struct perf_output_handle *handle)
 {
 	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
 	int ret = 0;
@@ -261,7 +260,7 @@ static int smb_enable(struct coresight_device *csdev, enum cs_mode mode,
 		smb_enable_sysfs(csdev);
 		break;
 	case CS_MODE_PERF:
-		ret = smb_enable_perf(csdev, data);
+		ret = smb_enable_perf(csdev, handle);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 55bb825d509e..937a8d4f815b 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -363,7 +363,7 @@ enum cs_mode {
  */
 struct coresight_ops_sink {
 	int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
-		      void *data);
+		      struct perf_output_handle *handle);
 	int (*disable)(struct coresight_device *csdev);
 	void *(*alloc_buffer)(struct coresight_device *csdev,
 			      struct perf_event *event, void **pages,
-- 
2.34.1


