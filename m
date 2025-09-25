Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63ECBCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 10:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iydgY1LUDTo5t6BA4ObGI8R41OpdAyNguw2a/tO9Pqs=; b=VePy/1ZTc489VFKdWMdLWwViS3
	q014+xpa2dn3D5W5JJ7K8S6CdrLm7pQUG05xGtc5aLuMfUEfcmSP6L12w4Kl9cbkbiJWlceQrPN0z
	PwZqP/MgPrBpYyU580DIoqosMFmVWRPXcjDXIe6EYzPMaSyPSTSyYJZr1YcxQ3Gq2CNtZ9HcYIvbs
	DXkvi+uheAUGxrWBCWU2N+JMprmeDBcz7CCVJYAD3LtZumrjFhOvUoCHAvV4jCt+Q69XHjA3KZZJo
	5XhU7KTzpycDjmUODCof52cPzQ1nBu2VKclNAANGyF/LPrG38NWBz+Kr63hFqxrz+WsTkvJjYYo7i
	6C5p3zUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1jRH-00000008Crs-0rin;
	Thu, 25 Sep 2025 10:43:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1jRD-00000008CoZ-3Jla
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 10:43:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P8Fd0A018220
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 10:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iydgY1LUDTo5t6BA4ObGI8R41OpdAyNguw2a/tO9Pqs=; b=nRkrYaX0ccm+54Gc
	xR009GHxidyIx+sqYaaV8OCNgLJKyVp7yyS6spKnGID/LTtNgbbi9WMOf19sQLS9
	0UtSri5YorUNZqKjA6efgsfCj2tWXKbSs+cGjLvAnJjKuKng7u58sOyk3YpyIYRW
	DBSTNbZzAzKlCnf8fj9Ok34j3yy71k/JrM+0dHJyZAIgaH7MtjxRQ5k6sDy5V+7i
	LEknfjsbx/sIw2tFedPl06VqKQu9XDX4IwYGZe8i7HZtm3IVaBGkp9gTaWTp5ynp
	C9BV2NQMEZ884DP0dzBQBKXp2CWcJhLQhaobHoVo2wxyjW1x8cvFwq0YsMKZoslP
	qUfjAw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kkbre5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 10:42:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-26985173d8eso14592315ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 03:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758796977; x=1759401777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iydgY1LUDTo5t6BA4ObGI8R41OpdAyNguw2a/tO9Pqs=;
        b=GtO6SXBdZLAsdYC2KRwkxfEq/v0hEyu2AL0WxYPbGmM9ivZq+qWlhzKz8Xyqpnnq9i
         /FFdmz4+yypbzqM/+OKJvzFiw6zQ8tz09YSAw1C/qASTTJCSvoe+9Pa5uZENJvgDrEnW
         Mgv5/e0SqHmxAcY0pCzCs4UBTBDeMZjwH+Lp8I5y910PIcZT/L2Oddn3KeplXj0oDApd
         ciU1OtOIRIFQ5eiDopDb1r1XAJ+6uv+rJigMZZv3AEhcJgK0P/DWj/PDI/7S9vNPfcGV
         3mN0igu3NBtBoRqF4WbuOPoX12Df100LGKv6VNSNl/N8P/4yGREzzYhuVBnczd24/xVo
         IBXg==
X-Forwarded-Encrypted: i=1; AJvYcCXLtW38VfypASRXfH8ISVlGMGLkJpjf8ivm04MyaJYmpDo33iIKRVZJjdAp4sVJLVt8CaThNTtA9JFAn5WevwT/@lists.infradead.org
X-Gm-Message-State: AOJu0YyTskTRAay2LQmkAPZUVjfOr9CWPi86u9wAJp6nhkyjMoRkDerN
	wRWSKkNrzkTaaISjEoHhmNhQjWgQr/zYlMPLyRDizlFvvzBz37x7u8oKlVD2HZdfb2lj8CUO6tQ
	h4S7mBxq1+NNrcOV24U703aG+cVJbwhEMfdJZeq9O9q7Tw9MwcpA1XC+4o2Km9ZIlPH6w6VAS7W
	c4VQ==
X-Gm-Gg: ASbGncvifqiprFsLTjljGEpd7CBz6KGNbuSe0WCRq+Wa44QvvVzEpx68aPBPhg+0Ffv
	VUw2QWPcmUkoO3VgRHbCnb3sQ9CA0z296dwP6byrbDF1KCNxHX5yEH2V8pgWgTrU1M7K5MypXGJ
	eXaIAnh0TYp9+3wwIgAjUzD7SXjR4KrtPOmBXMxb3fynGxVn7oAx5a1iEAJTFcGwK0Lb9KIVG4k
	8EWzbteXZxw2FQEH4O77woXnUKgXmlWvnZu1FeY+Zy+zHg59Aw4wZCV+mgpnNTupkl6+VHFjqE1
	tHlI46If8HuurYIP2x2/e4f/vB0BmIgcVG43X/ROb6D84Q01Vifq/H5RLhrWeIi1YOWb/Fcq92g
	ADA22X1HQJq/kEHFYyRcQ1tBOavs=
X-Received: by 2002:a17:903:b43:b0:267:776b:a31a with SMTP id d9443c01a7336-27ed4a3de4emr32276735ad.29.1758796977379;
        Thu, 25 Sep 2025 03:42:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxKVDsVMPULyZ/DU5Ie+q6w5upoknAYNtCbzBGaI7SzJWJ9721tGfRbvvNYwecSStc7+vR7g==
X-Received: by 2002:a17:903:b43:b0:267:776b:a31a with SMTP id d9443c01a7336-27ed4a3de4emr32276355ad.29.1758796976753;
        Thu, 25 Sep 2025 03:42:56 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6727ea7sm21046845ad.61.2025.09.25.03.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:42:56 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 18:42:32 +0800
Subject: [PATCH v2 2/3] coresight: change helper_ops to accept
 coresight_path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-fix_helper_data-v2-2-edd8a07c1646@oss.qualcomm.com>
References: <20250925-fix_helper_data-v2-0-edd8a07c1646@oss.qualcomm.com>
In-Reply-To: <20250925-fix_helper_data-v2-0-edd8a07c1646@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Carl Worth <carl@os.amperecomputing.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758796966; l=10066;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=/5pkXjPpN0sngp2+34OymDrtqBNoNX+U7d/io6qp5Es=;
 b=MsffQBQWUdHv31AvMS22ul6FI3b0OlhsBajjXz/doH874bxtxhasuYMtcKNlFmlWiF6xuDUNO
 KcGTMe63BuFCIVyFUvUbbz3YcHdaEJi5F/UxjgVQjlY/INrSJadb3RW
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: eT9YVolAEJDbjiBDzD579ISkk27C59Zl
X-Proofpoint-ORIG-GUID: eT9YVolAEJDbjiBDzD579ISkk27C59Zl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfXxaj4yP6EZkxG
 O9DdrMPeACE+nUIixbiwPN913SeqSpvfyl0PEm1dzvDZhM1qIdW37ZsylIdmfoD6+y+Zo9/Iw2c
 J5wvwglU9y47LFtfsYOzoOb712LMtGa3PxWFQhF6rwb6WCAS/YT0wWLL216pYBqVHPa4KTX3JA5
 Vml6e7TpJwWdLlLSkJkWhI+G7pNmr9Zkc89dbr4tz6OJ3ywKpd9ROejuXSIh58uxWKEXRNYOWd8
 zSBwbW0Ec93oZLKTd0b0YQ7nEKsMRNvQ/roSeZx9lVx+rC6uTlXjBSV7byDq4QSKxzvc1FOQpSn
 HLZbQnLWNQoEzbx5aZSSADUAcGFfiEOLKDeyYWBYlMVbJ/EUPS6+RX/3xAMGIk0W2Qbw+qnpTJL
 8/hiWq1F
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d51cb2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=vzhER2c_AAAA:8 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=Gv9EIBWDmE4dLvOUe8gA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=0YTRHmU2iG2pZC6F1fw2:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_034259_962998_EC147951 
X-CRM114-Status: GOOD (  20.58  )
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

Update the helper_enable and helper_disable functions to accept
coresight_path instead of a generic void *data, as coresight_path
encapsulates all the necessary data required by devices along the path.

Tested-by: Carl Worth <carl@os.amperecomputing.com>
Reviewed-by: Carl Worth <carl@os.amperecomputing.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c      | 10 +++++-----
 drivers/hwtracing/coresight/coresight-core.c      | 20 ++++++++++++--------
 drivers/hwtracing/coresight/coresight-ctcu-core.c |  9 +++------
 drivers/hwtracing/coresight/coresight-cti-core.c  |  5 +++--
 drivers/hwtracing/coresight/coresight-cti.h       |  5 +++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c   |  4 ++--
 drivers/hwtracing/coresight/coresight-tmc.h       |  3 ++-
 include/linux/coresight.h                         |  5 +++--
 8 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index a3ccb7034ae1..69b36bae97ab 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -397,7 +397,7 @@ static int catu_wait_for_ready(struct catu_drvdata *drvdata)
 }
 
 static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
-			  void *data)
+			  struct coresight_path *path)
 {
 	int rc;
 	u32 control, mode;
@@ -425,7 +425,7 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
 	etrdev = coresight_find_input_type(
 		csdev->pdata, CORESIGHT_DEV_TYPE_SINK, etr_subtype);
 	if (etrdev) {
-		etr_buf = tmc_etr_get_buffer(etrdev, cs_mode, data);
+		etr_buf = tmc_etr_get_buffer(etrdev, cs_mode, path);
 		if (IS_ERR(etr_buf))
 			return PTR_ERR(etr_buf);
 	}
@@ -455,7 +455,7 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
 }
 
 static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
-		       void *data)
+		       struct coresight_path *path)
 {
 	int rc = 0;
 	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
@@ -463,7 +463,7 @@ static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
 	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
 	if (csdev->refcnt == 0) {
 		CS_UNLOCK(catu_drvdata->base);
-		rc = catu_enable_hw(catu_drvdata, mode, data);
+		rc = catu_enable_hw(catu_drvdata, mode, path);
 		CS_LOCK(catu_drvdata->base);
 	}
 	if (!rc)
@@ -488,7 +488,7 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
 	return rc;
 }
 
-static int catu_disable(struct coresight_device *csdev, void *__unused)
+static int catu_disable(struct coresight_device *csdev, struct coresight_path *path)
 {
 	int rc = 0;
 	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 3267192f0c1c..f44ec9e5b692 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -355,17 +355,20 @@ static bool coresight_is_helper(struct coresight_device *csdev)
 }
 
 static int coresight_enable_helper(struct coresight_device *csdev,
-				   enum cs_mode mode, void *data)
+				   enum cs_mode mode,
+				   struct coresight_path *path)
 {
-	return helper_ops(csdev)->enable(csdev, mode, data);
+	return helper_ops(csdev)->enable(csdev, mode, path);
 }
 
-static void coresight_disable_helper(struct coresight_device *csdev, void *data)
+static void coresight_disable_helper(struct coresight_device *csdev,
+				     struct coresight_path *path)
 {
-	helper_ops(csdev)->disable(csdev, data);
+	helper_ops(csdev)->disable(csdev, path);
 }
 
-static void coresight_disable_helpers(struct coresight_device *csdev, void *data)
+static void coresight_disable_helpers(struct coresight_device *csdev,
+				      struct coresight_path *path)
 {
 	int i;
 	struct coresight_device *helper;
@@ -373,7 +376,7 @@ static void coresight_disable_helpers(struct coresight_device *csdev, void *data
 	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
 		helper = csdev->pdata->out_conns[i]->dest_dev;
 		if (helper && coresight_is_helper(helper))
-			coresight_disable_helper(helper, data);
+			coresight_disable_helper(helper, path);
 	}
 }
 
@@ -479,7 +482,8 @@ void coresight_disable_path(struct coresight_path *path)
 EXPORT_SYMBOL_GPL(coresight_disable_path);
 
 static int coresight_enable_helpers(struct coresight_device *csdev,
-				    enum cs_mode mode, void *data)
+				    enum cs_mode mode,
+				    struct coresight_path *path)
 {
 	int i, ret = 0;
 	struct coresight_device *helper;
@@ -489,7 +493,7 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
 		if (!helper || !coresight_is_helper(helper))
 			continue;
 
-		ret = coresight_enable_helper(helper, mode, data);
+		ret = coresight_enable_helper(helper, mode, path);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index c586495e9a08..abed15eb72b4 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -156,17 +156,14 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 	return __ctcu_set_etr_traceid(csdev, traceid, port_num, enable);
 }
 
-static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode, void *data)
+static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
+		       struct coresight_path *path)
 {
-	struct coresight_path *path = (struct coresight_path *)data;
-
 	return ctcu_set_etr_traceid(csdev, path, true);
 }
 
-static int ctcu_disable(struct coresight_device *csdev, void *data)
+static int ctcu_disable(struct coresight_device *csdev, struct coresight_path *path)
 {
-	struct coresight_path *path = (struct coresight_path *)data;
-
 	return ctcu_set_etr_traceid(csdev, path, false);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 8fb30dd73fd2..bfbc365bb2ef 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -799,14 +799,15 @@ static void cti_pm_release(struct cti_drvdata *drvdata)
 }
 
 /** cti ect operations **/
-int cti_enable(struct coresight_device *csdev, enum cs_mode mode, void *data)
+int cti_enable(struct coresight_device *csdev, enum cs_mode mode,
+	       struct coresight_path *path)
 {
 	struct cti_drvdata *drvdata = csdev_to_cti_drvdata(csdev);
 
 	return cti_enable_hw(drvdata);
 }
 
-int cti_disable(struct coresight_device *csdev, void *data)
+int cti_disable(struct coresight_device *csdev, struct coresight_path *path)
 {
 	struct cti_drvdata *drvdata = csdev_to_cti_drvdata(csdev);
 
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index 8362a47c939c..4f89091ee93f 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -216,8 +216,9 @@ int cti_add_connection_entry(struct device *dev, struct cti_drvdata *drvdata,
 			     const char *assoc_dev_name);
 struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
 					   int out_sigs);
-int cti_enable(struct coresight_device *csdev, enum cs_mode mode, void *data);
-int cti_disable(struct coresight_device *csdev, void *data);
+int cti_enable(struct coresight_device *csdev, enum cs_mode mode,
+	       struct coresight_path *path);
+int cti_disable(struct coresight_device *csdev, struct coresight_path *path);
 void cti_write_all_hw_regs(struct cti_drvdata *drvdata);
 void cti_write_intack(struct device *dev, u32 ackval);
 void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value);
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 1040f73f0537..b9bdbc745433 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1325,9 +1325,9 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 }
 
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
-				   enum cs_mode mode, void *data)
+				   enum cs_mode mode,
+				   struct coresight_path *path)
 {
-	struct coresight_path *path = data;
 	struct perf_output_handle *handle = path->handle;
 	struct etr_perf_buffer *etr_perf;
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index cbb4ba439158..95473d131032 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -442,7 +442,8 @@ struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
-				   enum cs_mode mode, void *data);
+				   enum cs_mode mode,
+				   struct coresight_path *path);
 extern const struct attribute_group coresight_etr_group;
 
 #endif
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 2626105e3719..2bee2e3bb1c6 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -424,8 +424,9 @@ struct coresight_ops_source {
  */
 struct coresight_ops_helper {
 	int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
-		      void *data);
-	int (*disable)(struct coresight_device *csdev, void *data);
+		      struct coresight_path *path);
+	int (*disable)(struct coresight_device *csdev,
+		       struct coresight_path *path);
 };
 
 

-- 
2.34.1


