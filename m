Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A61CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 10:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLPlknKStxzHQLun70iF8lyrWcWViBSqIF9JNqs4Tf0=; b=3fVQiNcElRJQjE5vTBVIZF/tWw
	sYVNO6rPgjWB2bwTHTRVM6wvxJhkmUt/pPQyZq44O4FZvQ9KQZcKW2M+WwVDxWpTLaCHwlSSgiczL
	xABnACvp06JRNJQOjDCiBrkq6s/DQqR5DBM/pROb4siOgLhv538VBvQYjDQLbFzKgnk4Fyqu/XsGj
	SqgIMwOjY6qlLAva4HZeCntIe2RkdpYK6wOoy5h9VspoPx7gWVW2MeqMyLG2niU2y3CkKANmZ5L91
	5n39hf/UPI9hYf2tnoJk2FA8HC6PRcF/MTccOcsqdvl5vKDQ3C9T08o8J6wb4N0HXXuSbaGG9GXl5
	YEE0PXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1jRS-00000008D2C-0FY6;
	Thu, 25 Sep 2025 10:43:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1jRH-00000008CrL-1s7F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 10:43:04 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9bRYh027760
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 10:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cLPlknKStxzHQLun70iF8lyrWcWViBSqIF9JNqs4Tf0=; b=VrgXwlh/JfBDkp/2
	it34a+B9Ip8eh034LmHAf4uYduz9tVZ0N82wLsjvmCaTvVpVu/jJ5qa348sBW1b4
	SZzoC8nm2M7Cjy4QVaPlMQT3Bo4ka0IGixumgcHY6Nu2BS8UMy3Bx0QISqVZSRVf
	cLwLS1OC1maUDHI+UqiKNBRIgFWxV6SzjAJB/VueNSRvwm2SZkkzCkqsBMXvAvjG
	s2f9o9TnYGR7Dsj9C5whunSiWyHXR1Sa8ZVCkAeTYikpdCD+ZNFgl3LWlPrcn/VE
	0OUIZ/UYRWpTLqowpPh4F9uha+xFo8u3IHRxlWcW5uGybW5flPtcAAVv64RsbliZ
	i9kb0w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmp05bn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 10:43:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2699ebc0319so9027765ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 03:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758796981; x=1759401781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLPlknKStxzHQLun70iF8lyrWcWViBSqIF9JNqs4Tf0=;
        b=Nskta1XxJPUu15vuwgNMzN2q2zOdYBpP8AWjR7TxEtUHmDq/lJCcGDmGt5Qvw9RhD5
         pCILPOyd/y9b1pd7IG5mAR3VG89EF7Ekx+RdoM/RL41XLH3ByaAlypAfs8sOIHyb+5Ey
         qwuFOTWKGE253Y97Ix6XOBHrOKRSGEqB8MbJcYiTs1Hg0I+GSeRQ9jeSoFm/1MP2I25Y
         4bDnY+6cDM+LqbshSkhwBxPxn8yv5ais61lbynUIfNFiM2YUX2JMnMLfvBAdrMJpQjt7
         8tRKdjT2ULKiu0T6W4ru8Voz4ByI9lpeuBzShhWewUWbnrDipS4uoqCca/5VYT/LJgkp
         6bHw==
X-Forwarded-Encrypted: i=1; AJvYcCWepdta3nG/lOgil/7Wzb3OPV+X5tD0H8GcM/wuxfSNitA2UA/CM1NpJMGUoVfSEPWapqqhkVky6H+suc+BoBK9@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwil/xsVOBXRbeVzioWNBmXww4ztf8UxMcmO0yYmtfa8SNYUIq
	0EsmFLxWGAQAFF3tJyqXc+HzPqCdXqVtdVih00uoW+yq3ZSilpc8mXsQ+PeQUEhUvXFebxp0zOX
	n53Xt9dyuEhAEiRxtlo1mdMi6n7yept9/8uIhuZXLyg2tsgZS0vC7ASH9dUXc0y8oe16jKgciBq
	g9+w==
X-Gm-Gg: ASbGncvX6/2GvCiuU3sKWghu+Lx9vOmR81aFhFA7ABrIEIMZd/hKALrHtu4ara5mHAr
	uPXWj9+QrlW+5GsWK8XVgerwJP5hGuzbrvJBds03G0xrypTcdZHBCii7sKuNKSalgnnyXotURu/
	hYC9bXKFbMD6Gb0B4EhZ/lsDWRpKDoP0TutuyZZfQNDjsprdlO7ub40YcrTfraxAh1PbI/9p9xB
	7bC0uim737Y0f+zE6hPGh0lwB2vo2cQ0TCr+XtM+aWCLH5cXJ8nH92s5WABLm9ILdJTP/mL4Nq9
	WbA2SN9Umq3qKx/Qy3uGpWtn2U921ySasbZ8nJe6y9uLpMnCxKCS3RAvjmZqKAZOJwK7jR6D110
	041liHcXOajvY0rshq+nHVWb0oaE=
X-Received: by 2002:a17:902:ced2:b0:271:ac7a:8f18 with SMTP id d9443c01a7336-27ed4a9615cmr40835615ad.43.1758796981004;
        Thu, 25 Sep 2025 03:43:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2SgLtjVZ5SV9a7Yca+ZIPmrp9cTi9AptrSWj/eCKVG3S2KJNj7dnuoNLHU1UfwZNdJgZ63w==
X-Received: by 2002:a17:902:ced2:b0:271:ac7a:8f18 with SMTP id d9443c01a7336-27ed4a9615cmr40835215ad.43.1758796980408;
        Thu, 25 Sep 2025 03:43:00 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6727ea7sm21046845ad.61.2025.09.25.03.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:43:00 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 18:42:33 +0800
Subject: [PATCH v2 3/3] coresight: change the sink_ops to accept
 coresight_path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-fix_helper_data-v2-3-edd8a07c1646@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758796966; l=12751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=SuUkpE58+WLzMO0NG55e+BFB60hihzNAcDbxPmKE41g=;
 b=gZFCNV/GB6vRv0QcjvrX0LfchqGF+8eMa33QBgjZ8jdi3pG6yUCouR1a9fHQYyh0vhFghQJ2C
 7+eDYTCMWcQCl6IowOT8eevpSCTQ/xowDlly2YC/8WFTWwsl00BP8jQ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d51cb6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=vzhER2c_AAAA:8 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=t4OZSbUdKNgAmLiGTPYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=0YTRHmU2iG2pZC6F1fw2:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: Nfjg3rNA4q_qFSrDVrQKjdpTdIlto80e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX7WV9f0lumDmu
 J4Au0wk3LjDqqOqJSX2kJTo8QPFCymqid7hilMCr9yF8Riqvt4T9Yno0K1SwuNtxjG/YPdy9N+S
 FLc6QsfDs8OcvqiXAF9zXxq2JUzAcS9PyzQ9VbJGRwS2K0VAyOhxYvo+QQNBL0UUIZXFjQ9jWKm
 NSWxqDAvHMIza8UieNYzlndm6Jt1yf6fliYP2AcPHsDDH/p3XcjhmoBKOPjZ9lR/+V9XXECy9N0
 xNJ41FgADY4e0TosY0luU2N3SL+V7r/ZA0+ByKkHz95TDnsBq3hOaOB1eQCX1WgIVgsnWaHO53Z
 qpbTwuhmu+m3hDcNJJe4pphmvpdNaBm++oM8/2Ee588kmkP40/7wxIi5tQKVb4Wvs0vt3Lz/xzS
 HGnl4HZ6
X-Proofpoint-GUID: Nfjg3rNA4q_qFSrDVrQKjdpTdIlto80e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_034303_609340_917BE07C 
X-CRM114-Status: GOOD (  21.91  )
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

Update the sink_enable functions to accept coresight_path instead of
a generic void *data, as coresight_path encapsulates all the necessary
data required by devices along the path.

Tested-by: Carl Worth <carl@os.amperecomputing.com>
Reviewed-by: Carl Worth <carl@os.amperecomputing.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c     | 10 +++++-----
 drivers/hwtracing/coresight/coresight-dummy.c    |  2 +-
 drivers/hwtracing/coresight/coresight-etb10.c    |  8 ++++----
 drivers/hwtracing/coresight/coresight-etm-perf.c |  2 +-
 drivers/hwtracing/coresight/coresight-priv.h     |  3 +--
 drivers/hwtracing/coresight/coresight-sysfs.c    |  2 +-
 drivers/hwtracing/coresight/coresight-tmc-etf.c  | 10 ++++++----
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 10 ++++++----
 drivers/hwtracing/coresight/coresight-tpiu.c     |  2 +-
 drivers/hwtracing/coresight/coresight-trbe.c     |  4 ++--
 drivers/hwtracing/coresight/ultrasoc-smb.c       |  9 +++++----
 include/linux/coresight.h                        |  2 +-
 12 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index f44ec9e5b692..c660cf8adb1c 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -300,9 +300,10 @@ void coresight_add_helper(struct coresight_device *csdev,
 EXPORT_SYMBOL_GPL(coresight_add_helper);
 
 static int coresight_enable_sink(struct coresight_device *csdev,
-				 enum cs_mode mode, void *data)
+				 enum cs_mode mode,
+				 struct coresight_path *path)
 {
-	return sink_ops(csdev)->enable(csdev, mode, data);
+	return sink_ops(csdev)->enable(csdev, mode, path);
 }
 
 static void coresight_disable_sink(struct coresight_device *csdev)
@@ -501,8 +502,7 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
 	return 0;
 }
 
-int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
-			  void *sink_data)
+int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 {
 	int ret = 0;
 	u32 type;
@@ -532,7 +532,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 
 		switch (type) {
 		case CORESIGHT_DEV_TYPE_SINK:
-			ret = coresight_enable_sink(csdev, mode, sink_data);
+			ret = coresight_enable_sink(csdev, mode, path);
 			/*
 			 * Sink is the first component turned on. If we
 			 * failed to enable the sink, there are no components
diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index aaa92b5081e3..14322c99e29d 100644
--- a/drivers/hwtracing/coresight/coresight-dummy.c
+++ b/drivers/hwtracing/coresight/coresight-dummy.c
@@ -52,7 +52,7 @@ static int dummy_source_trace_id(struct coresight_device *csdev, __maybe_unused
 }
 
 static int dummy_sink_enable(struct coresight_device *csdev, enum cs_mode mode,
-				void *data)
+			     struct coresight_path *path)
 {
 	dev_dbg(csdev->dev.parent, "Dummy sink enabled\n");
 
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index 35db1b6093d1..6657602d8f2e 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -167,13 +167,13 @@ static int etb_enable_sysfs(struct coresight_device *csdev)
 	return ret;
 }
 
-static int etb_enable_perf(struct coresight_device *csdev, void *data)
+static int etb_enable_perf(struct coresight_device *csdev, struct coresight_path *path)
 {
 	int ret = 0;
 	pid_t pid;
 	unsigned long flags;
 	struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = data;
+	struct perf_output_handle *handle = path->handle;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
@@ -224,7 +224,7 @@ static int etb_enable_perf(struct coresight_device *csdev, void *data)
 }
 
 static int etb_enable(struct coresight_device *csdev, enum cs_mode mode,
-		      void *data)
+		      struct coresight_path *path)
 {
 	int ret;
 
@@ -233,7 +233,7 @@ static int etb_enable(struct coresight_device *csdev, enum cs_mode mode,
 		ret = etb_enable_sysfs(csdev);
 		break;
 	case CS_MODE_PERF:
-		ret = etb_enable_perf(csdev, data);
+		ret = etb_enable_perf(csdev, path);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 5c256af6e54a..17afa0f4cdee 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -527,7 +527,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 		goto fail_end_stop;
 
 	/* Nothing will happen without a path */
-	if (coresight_enable_path(path, CS_MODE_PERF, handle))
+	if (coresight_enable_path(path, CS_MODE_PERF))
 		goto fail_end_stop;
 
 	/* Finally enable the tracer */
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 33e22b1ba043..fd896ac07942 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -135,8 +135,7 @@ static inline void CS_UNLOCK(void __iomem *addr)
 }
 
 void coresight_disable_path(struct coresight_path *path);
-int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
-			  void *sink_data);
+int coresight_enable_path(struct coresight_path *path, enum cs_mode mode);
 struct coresight_device *coresight_get_sink(struct coresight_path *path);
 struct coresight_device *coresight_get_sink_by_id(u32 id);
 struct coresight_device *
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 5e52324aa9ac..d2a6ed8bcc74 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -215,7 +215,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 	if (!IS_VALID_CS_TRACE_ID(path->trace_id))
 		goto err_path;
 
-	ret = coresight_enable_path(path, CS_MODE_SYSFS, NULL);
+	ret = coresight_enable_path(path, CS_MODE_SYSFS);
 	if (ret)
 		goto err_path;
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index 0f45ab5e5249..8882b1c4cdc0 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -246,13 +246,14 @@ static int tmc_enable_etf_sink_sysfs(struct coresight_device *csdev)
 	return ret;
 }
 
-static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
+static int tmc_enable_etf_sink_perf(struct coresight_device *csdev,
+				    struct coresight_path *path)
 {
 	int ret = 0;
 	pid_t pid;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = data;
+	struct perf_output_handle *handle = path->handle;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
@@ -304,7 +305,8 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
 }
 
 static int tmc_enable_etf_sink(struct coresight_device *csdev,
-			       enum cs_mode mode, void *data)
+			       enum cs_mode mode,
+			       struct coresight_path *path)
 {
 	int ret;
 
@@ -313,7 +315,7 @@ static int tmc_enable_etf_sink(struct coresight_device *csdev,
 		ret = tmc_enable_etf_sink_sysfs(csdev);
 		break;
 	case CS_MODE_PERF:
-		ret = tmc_enable_etf_sink_perf(csdev, data);
+		ret = tmc_enable_etf_sink_perf(csdev, path);
 		break;
 	/* We shouldn't be here */
 	default:
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b9bdbc745433..bf08f6117a7f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1726,13 +1726,14 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
 	return size;
 }
 
-static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
+static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
+				    struct coresight_path *path)
 {
 	int rc = 0;
 	pid_t pid;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = data;
+	struct perf_output_handle *handle = path->handle;
 	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
@@ -1780,13 +1781,14 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 }
 
 static int tmc_enable_etr_sink(struct coresight_device *csdev,
-			       enum cs_mode mode, void *data)
+			       enum cs_mode mode,
+			       struct coresight_path *path)
 {
 	switch (mode) {
 	case CS_MODE_SYSFS:
 		return tmc_enable_etr_sink_sysfs(csdev);
 	case CS_MODE_PERF:
-		return tmc_enable_etr_sink_perf(csdev, data);
+		return tmc_enable_etr_sink_perf(csdev, path);
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 9463afdbda8a..aaa44bc521c3 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -75,7 +75,7 @@ static void tpiu_enable_hw(struct csdev_access *csa)
 }
 
 static int tpiu_enable(struct coresight_device *csdev, enum cs_mode mode,
-		       void *__unused)
+		       struct coresight_path *path)
 {
 	struct tpiu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 43643d2c5bdd..293715b4ff0e 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1013,11 +1013,11 @@ static int __arm_trbe_enable(struct trbe_buf *buf,
 }
 
 static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
-			   void *data)
+			   struct coresight_path *path)
 {
 	struct trbe_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
-	struct perf_output_handle *handle = data;
+	struct perf_output_handle *handle = path->handle;
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
 
 	WARN_ON(cpudata->cpu != smp_processor_id());
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
index 26cfc939e5bd..8f7922a5e534 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.c
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
@@ -213,10 +213,11 @@ static void smb_enable_sysfs(struct coresight_device *csdev)
 	coresight_set_mode(csdev, CS_MODE_SYSFS);
 }
 
-static int smb_enable_perf(struct coresight_device *csdev, void *data)
+static int smb_enable_perf(struct coresight_device *csdev,
+			   struct coresight_path *path)
 {
 	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = data;
+	struct perf_output_handle *handle = path->handle;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 	pid_t pid;
 
@@ -240,7 +241,7 @@ static int smb_enable_perf(struct coresight_device *csdev, void *data)
 }
 
 static int smb_enable(struct coresight_device *csdev, enum cs_mode mode,
-		      void *data)
+		      struct coresight_path *path)
 {
 	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
 	int ret = 0;
@@ -261,7 +262,7 @@ static int smb_enable(struct coresight_device *csdev, enum cs_mode mode,
 		smb_enable_sysfs(csdev);
 		break;
 	case CS_MODE_PERF:
-		ret = smb_enable_perf(csdev, data);
+		ret = smb_enable_perf(csdev, path);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 2bee2e3bb1c6..56d0108658db 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -367,7 +367,7 @@ enum cs_mode {
  */
 struct coresight_ops_sink {
 	int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
-		      void *data);
+		      struct coresight_path *path);
 	int (*disable)(struct coresight_device *csdev);
 	void *(*alloc_buffer)(struct coresight_device *csdev,
 			      struct perf_event *event, void **pages,

-- 
2.34.1


