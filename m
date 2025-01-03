Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F79EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 08:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5N5j49qb40ciUR+bGHh2V03POIqUVYWD42BjBmCTvUM=; b=SONrFwIQ9hpwcRYt+X1HrIVnoC
	5yR35AMPoz5VtYN2GMqv1ej/QO04wymodwgMlytYdoGNfkO+RzasHVcjr+9aKwofPgUuck2MN5C/o
	ec2sOZDRK+jrgjLu5XwViECDnixGsdqTsd9SJhAqfsAUDLl+q4TTXq85eaqlQmtBNaESMw0ScIPMi
	p11HwYqLFCjRGiYbwhjuU8HLio6w0usOFAZwyyYCVro1dGWuLjGMfaw4m2agYViGJwZOD+o+SMJlt
	0bkaLCo12NtIyxYIQ0VzzIRUaC0X/WK3X4EnX4H6RGcJSMmy9qY+HHz8SSKShufzpI6bTXEwUkuXL
	j0jwUKSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTcfA-0000000CQ3c-3X7V;
	Fri, 03 Jan 2025 08:04:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTcdy-0000000CPst-4BOJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 08:02:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5037G05R011625;
	Fri, 3 Jan 2025 08:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5N5j49qb40ciUR+bGHh2V0
	3POIqUVYWD42BjBmCTvUM=; b=FE044CN73Amh1ZR4H3PBbDeAYORf2JIlz4OgAD
	y4RAOBBHSEM1qhimQiqjpzKdzxd2bztzF/QohOkqcJ+W9qDwbblEBRMeW6b7R21D
	koMwqnkmBRh2ObcQa10/HXM1McjthObh7XSfRtOFii3A8Mdmy3RRAqVQjqILpqH/
	vbOWu69LHEUPIqY2+TQ+WGcrGOtA656Bk+ocj9pl+5Wdn98oVRpdO2ZtuQ8V8x4/
	ywNmxmoCUa1wkqiWUDVuuxK3XMywV3ECXBwoIgnxvgIaigXKgD3PZD76UIy2idWQ
	dH6o5oLrgNyjrWKOODMh51NJanNPJPdAfENhAAVjdyLCEI9A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xbbp037e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 08:02:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50382ka3025017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 08:02:46 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 3 Jan 2025 00:02:41 -0800
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Fri, 3 Jan 2025 16:01:54 +0800
Subject: [PATCH] coresight-tmc: stop disabling tmc when flush timeout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250103-fix_cpu_hung-v1-1-a7b9b3893d44@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAHGZd2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQwNj3bTMivjkgtL4jNK8dN0k00RLU0Nzy8SURBMloJaColSgPNi46Nj
 aWgB8lWKNXgAAAA==
X-Change-ID: 20250103-fix_cpu_hung-b5a95179ada4
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: <kernel@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735891361; l=3946;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=mHCVMcot2Zwb+s1j6evKoS89X4IykPu7hzPnsebYG0Q=;
 b=thL05qqkoOMJGWFsAJOl0U4XDF8EFiIG4B1kMc2HiQiJWyivOahUPpTWLlb9ddrAbY3+f96SI
 4hXcanDZoslCS1AGP68/YDi5Xx1QvJxD1PwmKHN+q0rT0BvBZeuHKVw
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: o7QuROQGLRAtYOtN6LQEQCnznVNsNqzf
X-Proofpoint-GUID: o7QuROQGLRAtYOtN6LQEQCnznVNsNqzf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 impostorscore=0 adultscore=0 mlxlogscore=886
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_000255_152871_2EB6F7E1 
X-CRM114-Status: GOOD (  16.16  )
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

When multiple ETMs are enabled simultaneously, the time required
to complete a flush in the process of reading the TMC device node
may exceed the default wait time of 100us. If the TMC capture is
stopped while any ETM has not completed its flush, it can cause
the corresponding CPU to hang.
Fix the by checking the TMCReady bit after the flush. If TMCReady
bit is set, TraceCaptEn bit can be clear; otherwise, return directly
and stop the TMC read.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etf.c | 17 +++++++++++++++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 22 +++++++++++++++++-----
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index d4f641cd9de69488fe3d1c1dc9b5a9eafb55ed59..bded290c42891d782344d9a6e63ebdbed6719133 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -80,11 +80,21 @@ static void tmc_etb_dump_hw(struct tmc_drvdata *drvdata)
 	return;
 }
 
-static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
+static int __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
 {
+	int rc;
+
 	CS_UNLOCK(drvdata->base);
 
 	tmc_flush_and_stop(drvdata);
+
+	rc = tmc_wait_for_tmcready(drvdata);
+	if (rc) {
+		dev_err(&drvdata->csdev->dev,
+			"Failed to disable : TMC is not ready\n");
+		CS_LOCK(drvdata->base);
+		return rc;
+	}
 	/*
 	 * When operating in sysFS mode the content of the buffer needs to be
 	 * read before the TMC is disabled.
@@ -94,6 +104,7 @@ static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
 	tmc_disable_hw(drvdata);
 
 	CS_LOCK(drvdata->base);
+	return 0;
 }
 
 static void tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
@@ -650,7 +661,9 @@ int tmc_read_prepare_etb(struct tmc_drvdata *drvdata)
 			ret = -EINVAL;
 			goto out;
 		}
-		__tmc_etb_disable_hw(drvdata);
+		ret = __tmc_etb_disable_hw(drvdata);
+		if (ret)
+			goto out;
 	}
 
 	drvdata->reading = true;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index a48bb85d0e7f44a25b813f3c828cc3d705d16012..63a1f7501562fa0b5c2fe6ea53dce4d82842bec3 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1135,11 +1135,21 @@ static void tmc_etr_sync_sysfs_buf(struct tmc_drvdata *drvdata)
 	}
 }
 
-static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
+static int __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 {
+	int rc;
+
 	CS_UNLOCK(drvdata->base);
 
 	tmc_flush_and_stop(drvdata);
+
+	rc = tmc_wait_for_tmcready(drvdata);
+	if (rc) {
+		dev_err(&drvdata->csdev->dev,
+			"Failed to disable : TMC is not ready\n");
+		CS_LOCK(drvdata->base);
+		return rc;
+	}
 	/*
 	 * When operating in sysFS mode the content of the buffer needs to be
 	 * read before the TMC is disabled.
@@ -1150,7 +1160,7 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 	tmc_disable_hw(drvdata);
 
 	CS_LOCK(drvdata->base);
-
+	return 0;
 }
 
 void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
@@ -1779,9 +1789,11 @@ int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 	}
 
 	/* Disable the TMC if we are trying to read from a running session. */
-	if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
-		__tmc_etr_disable_hw(drvdata);
-
+	if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS) {
+		ret = __tmc_etr_disable_hw(drvdata);
+		if (ret)
+			goto out;
+	}
 	drvdata->reading = true;
 out:
 	spin_unlock_irqrestore(&drvdata->spinlock, flags);

---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20250103-fix_cpu_hung-b5a95179ada4

Best regards,
-- 
Yuanfang Zhang <quic_yuanfang@quicinc.com>


