Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7382DF89256
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 10:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=; b=HhBRoIFhozGKG+XRNbsvSxMiUU
	hNPMr2N/Jjf1SSG5xe3whMNU+AiU72TqNNRFdb3X67/Ddqlinw4UR3wdTFutgsw9p3WfM/bumetJE
	XvxfJN0cEROimOxbgsvu6wo0Uc1coFlftMixIIm/orDXS1ouxuzUtw13GvKcMcO96hVxHEZEJwFe9
	W7ZzfjIveNnyGj+76pZ344y6P/dVf3pvSs9AROv5Hnw8AohWsduwJtqUjlFT/8ekZKZlQE/JXMVrX
	O/TrBKMZCyiyd3OJHkk84MrDPqiai02jyNO465BKgwssM8a9Z0u7n5385bv3CBM55+S/reQ0JgVGA
	TBM1xACA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8mZ-00000008Tgp-0HRS;
	Tue, 21 Apr 2026 10:56:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8mW-00000008TfO-03GQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 10:56:41 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LA6CgP1834915
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 10:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=; b=GeoJybMEmBngamUt
	0Apgufr0QpAMNtezGVorcHVZMx/CMveSithnwQp5Taz5ZGaRDRZxeBXKMJ4JlVQV
	RxVh4hAWCkQtUwD0xtKobM/XeTESt4qoPETKECWp1Vue9gY4ZLdkHQ3lhargy8Jy
	sz+cQmlsxknJ9B7qqtvcmDI4IHG7kOX4Z+cTOtKZz3X/cHizEGlgqd9JyanIny5g
	MuNmVxeImrzdj0cFBHfQvbw15ovHItmMWJDB9PGqy+RhtviurV43MYKRPCST64O4
	X/wH3y1I6u/ODq5nF4s9AKt1tgFvFHqKgQxTgADqcJ4VEB0bWnQOZM9B/P6vP84u
	Yys9AA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp76gr58q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 10:56:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76c2bb3149so1945286a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 03:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776768998; x=1777373798; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=;
        b=GVmt2ymsvDafveIC6r967dsWNF8MovL7lG24bKcjADjO+fBmub8Jf5FaA+Ejn23dWW
         dnvI3anFdEKZ/q0QBdILSYTifvAPfXgihvcV/LeXbVu7q6XYXypbjKho7JmDdoyfZq+/
         EAeD9YffhsQd969VpqpIiNSxYfDBQCBaIJFJUlB8sgYzaUvh81H6P2RA1LTXuBJMNQ0L
         v+EP8juwGif1lzIIczuDk+XTR3+RlatAf73Y8qYUXTcn0dd96jKVpL77av1pF9/ruij7
         aFYERsw45yRisgyihs4zXbTa7BhwsBN8/jK9YpbZANg1SSdjSIIszneHL2MynF+cTs06
         JP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768998; x=1777373798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=;
        b=ojYsGBMLvKQe/sNqCdNw2C9fiEz3nODKJVJe3uuskchcYIV8db8qKLzLka5A6SWJab
         BO0MJVTT2K0OGPSVp1vwCN6OjxzRgzG8+pL/9DurFITQxVvEkR2kiUsX/qo5FyKa7T0w
         Dv9zHZTSAVWeV0dAqBT38gmHozXOIXB7k4Uw/NqsaDb22INEDAifjWQvsjPla0/PxHO+
         tH0MFMVya4xWPfhXNHEeXiUE4IwiJtghxsWKwhpCEWp4tceUPluAtjLz4RPOwzfVoHiv
         NgchcLFJdsf3gETYvCIh4YNnBljZSQp+2rIFYP16969pUVFhOlEH0K71h0rFV9dA0/CC
         hH7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+ATR+092F3oPIBWFCDQK+4b3SjjCk004KvqDGm5dQ8ZkKSBikUPXeRPb4MGvJUksIvwMFlaSfKgQ0735WxA8Jx@lists.infradead.org
X-Gm-Message-State: AOJu0YwBojWR/pfuZRW0SyFhfUUTniWounnVRm4S7kKJ/UoTkvmb4lTx
	qsdIpR0jmsML8IkbK6u0UFbOkdY+sqkEol4QTLahLZ2/2yzC3HWiLzyFd8I7BuVCku8H2HKI36f
	/DyioSp1bS3UfxiRuKjlFm2YVquj6W0s3wFlE0BS4UaKl8BoV0tjOt9EFUWIldUeTx2v4leFgJ9
	vTCw==
X-Gm-Gg: AeBDieumEpIVLenv5iANLlMg99atVB/2REKj3OgtfbcudvVc2CPC5aNBz+T3k4uaPwN
	aJSb5JdoxRTMdK4IPamIFyZ9R8n1YsP1aXW3lyd8xL38xXhuV9EAh8iqJfsN67EupPJSa9/D4Sy
	dCIPcMHhxMpv5/mXaT00uCE9w+6fGQCCEUVGQU+10f6miDSwhPP/NLQqvDNh+45OdHsM48PKzmh
	lKpB9zU890rwthHKNOcABteNDg/pA61tYHrAzENRA8xj693xNYFK7rOhj2l5LvCrbVUgRj9aHTS
	GLmwU3jMz/8fE36Z/tpizkgqDPTVJ6jnx+cjHhefqdQ1A9CodmGsLQCs1bdKNgX6DZTujUCHBra
	xIoWLgV5YkDAJVN8Z9j46qtdhT88BrMHNSywlefVAln/j4wjjKysu1De6uDK9KSFhjK7HRcoc70
	BBkNP0aJaDTXMfb8hziUY=
X-Received: by 2002:a05:6a00:a83:b0:82f:4bcb:a9d5 with SMTP id d2e1a72fcca58-82f8b387e8cmr15135272b3a.14.1776768998194;
        Tue, 21 Apr 2026 03:56:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:a83:b0:82f:4bcb:a9d5 with SMTP id d2e1a72fcca58-82f8b387e8cmr15135238b3a.14.1776768997708;
        Tue, 21 Apr 2026 03:56:37 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e982fd3sm17077339b3a.10.2026.04.21.03.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:56:37 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 18:55:52 +0800
Subject: [PATCH v17 3/7] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-enable-byte-cntr-for-ctcu-v17-3-9cf36ff55fc0@oss.qualcomm.com>
References: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
In-Reply-To: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776768976; l=5200;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0THtAIFi5jelKh7Fknxn2c5M5CE76ThTcdKm3o+68rg=;
 b=IfNyRA3MMtWPKSKkwi7v4iWcTDh/I/aVtZaIZtDxu2SqhaxcEJ5RqWM4Ax2oW/BsjCTcVEh56
 z6g3vcJa1twAvsV0woaMVwt9aqWa+lI1iWBnQUvc68LzdDBLo3azEbC
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwOCBTYWx0ZWRfXwbAcs8+EjxpI
 qOBycdXOa9CGl7kss243UG8ssSeLf4/G2Q31E7tegqc5Rmn8LldyXFGMFl1hrt8GDDHeulbhNYq
 rkfqkaUGGVZARUiX7w1IT0rvILbX89XOkuCOYM4UD2fo23Q7sunul/gQW+6/fRve5qmatepGv2A
 DxFNMMt0OOSStVsllQg9IQQp2xkDZgvjMY+I6OQEmPmaVMM031WkQHvma89RiiZia0y/OqG5BpA
 yfQRVtA6WYq8LR+kPSXOh/3jAtTtdMetPMfJitRze6T4YaALGDgv8Hbju0c77lJwihqqB2fNAm3
 RbkTjOoAAJGCVsRn/N5Kcs9zk5lYzfpW8rlbP8IqhennKGWsQByBFO95OjCg+TbCVzSs1s0nmdf
 ybpDcZb4+Z+H4YV7CUiWbGARo11ciC4dol+8WHTAJnEowKmQOvxzJsTFiQbDuOlOQ4Uv1CJ8o2R
 yWF9fTBQxwTtYIjgTCw==
X-Proofpoint-GUID: ELhcO32Fun0gWx4E5FJBP2CGvupEK5VH
X-Authority-Analysis: v=2.4 cv=crWrVV4i c=1 sm=1 tr=0 ts=69e757e7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ELhcO32Fun0gWx4E5FJBP2CGvupEK5VH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_035640_372196_A0F078CD 
X-CRM114-Status: GOOD (  17.73  )
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

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bac3278ef4dd..110eedde077f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -228,17 +228,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_prepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_prepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
@@ -250,17 +243,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_unprepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
@@ -287,15 +273,7 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
-	case TMC_CONFIG_TYPE_ETR:
-		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
-	}
-
-	return -EINVAL;
+	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
 static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
@@ -764,6 +742,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct tmc_sysfs_ops etb_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct tmc_sysfs_ops etr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -823,6 +813,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = "tmc_etb";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -835,6 +826,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
@@ -844,6 +836,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = "tmc_etf";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6e994678f926..a14645b04624 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -259,6 +259,7 @@ struct etr_buf_node {
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -290,6 +291,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
+	const struct tmc_sysfs_ops	*sysfs_ops;
+};
+
+/**
+ * struct tmc_sysfs_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct tmc_sysfs_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1


