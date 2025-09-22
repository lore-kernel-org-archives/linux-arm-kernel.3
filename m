Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C23CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 07:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3N5tLI3QFZgKJr8aSk7Tt1bHTMMq6mAfP+UBh3UAANo=; b=sQAU7VXlrwGl/YHX4cuNlrTvbL
	Z/OBCbMx9QT5tzEXq31kafsyN8hN5IuQ1CST7wUTxfqcKA2CFddGJlDSHHO+MVoTg9f9G2oqGepIQ
	OonLrNbciLNY85vlFbxKzmSPMZrUqBAssiDeIwJD7YoZQxmVtzuLVnAeF6z4gFlqgR3EAN3NOPh9Z
	XCp19FunFVyvzIcuX4lH2cgr5ZQ2rYLhCzWleNWqJOJXJ6V1zDF0tPnRk7p3zNRB+7Ui/z9IMIyTO
	IOA7GUetfEPRRM2CZanC+warEikLRVjhM5z+htxJbFELX/4w9t8Fzv2RhzRRWU3LHq8kZhqWOCKMZ
	Yx4ReL8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0b22-00000009LMt-2LOj;
	Mon, 22 Sep 2025 07:32:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0b1y-00000009LIG-48Z3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 07:32:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LMkdYw017562
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 07:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3N5tLI3QFZgKJr8aSk7Tt1bHTMMq6mAfP+UBh3UAANo=; b=G6qKN4W/pPo8R5Eu
	nJ/ordeftU8LHlSK1hjTxVyU8gG98QEFKYM3IiE/3nFb8N0taOQEoByOjyswhjaw
	aRlk3xIVaXBuFF5gMtYJ3kQoACwZ4BK1MfID7+eoaSn/3Rc4S1U1SGAuljOFZ21j
	ULrRTJ7M04o6Xukicb4+BXzLUk3dp6Ga4rqN0mktIuOGhH5qNfvkbSykIgOtxVmC
	NjMSBEzTNnK4Upid19vL74y70QanRFAq3yDQPmeCQBp4d7dF5z/nmv4Sc11wLsY5
	EsoUwDHcvzUoqS976bRzyFaoLZ4cVsmgBrPPKM75wp4N9lTYTbptz5UxKCFDgEgK
	v50cOQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499nekukq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 07:32:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244582bc5e4so45537975ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 00:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758526333; x=1759131133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3N5tLI3QFZgKJr8aSk7Tt1bHTMMq6mAfP+UBh3UAANo=;
        b=XV4megq1hDEjR6Pdb20axyzWOXPkiqytW3sTJ1XXoB0s5CbZ2+/VBZTWw8/YjT6toC
         cfB7FvCgKFfilbXghxiXUYm+hXEHw1hN5OEf9mtwgAMzytsHGWjbH5+HmONQZVtq1SpR
         9T6FpSTXo7Yrz0nqD0gZ9aIxR1tumuZsuorvgpBs6vQ7wi5m9DY7Xpreb5eID+YOc7K0
         dahfm9E7SDn2+1drDQQ/kQoNO3gmuGGvnOFA1RHrjoliliRsweQiboiLdmyRpWMEhPQ8
         U7ico/htsRq0iuxDUBMamQMQYFB+xeeEDBYLcWlhwfwnJ1H2CGTC4ozrjxr6/nK5Kzud
         Qc0g==
X-Forwarded-Encrypted: i=1; AJvYcCUWX9yEDvWNqNV70OnVN0AjjmQdlnwitbIjUIpqdbZYtHX5xWcKA1U5EZUBmfgPZd/ol5H7bfCaA5ueZhoTz87M@lists.infradead.org
X-Gm-Message-State: AOJu0YzNXPXcHjKkBntU1LI6JtkMS/vPy9BHHF5bmGtuIvQQkAtCnBKq
	fWB8YyFy0E2+HNId2bjPZGffwEk8tZ3zxtfs2Tq9FP45p8CIsEP1zqQQQIkiTB67JwTift9AWJ9
	FfzgD2fzNcqePV7RJYG46mZl4qOEDChvxgDZMr22eKB4QFFGmz6I7f7qQKh3R5fSwtzyNofuvOC
	iENapb3VFGmBC3
X-Gm-Gg: ASbGnctwRLF/l65q2/URDl5H+r/LViEoh1lwIPWNu9FL19hn47NeE06ESByMMsG5kCd
	877QFPUF7iPepCtz1DH2SVRUwewdunpb/gbbDs9ZITXm4AgFKTfb+lGVOfvu6Lsud/WSTmoKLXX
	yKQBV5G9u45Gnj+zBceLDwYraO/EN2vgHGM0LoLD9EkaTSuflqO7fL4plNX+K5o3C9PwmPVsNzQ
	7vRt++HXO3J4/y7JWUHmI1mAp4a+7M4LR72sa4PFtPTQ1BnEwKsUw5QutIQqmlaH8VN4iaVNG3v
	gHXlrwD51OsFsHg/cMYXRKKCnStNvJPSXBAt/X8AxRJhBAmBR9nuNfx74Bmr3sWGDwdSDOd6IK6
	BJn6tYkAym9bXBmg/LH6MJvwl+Y0=
X-Received: by 2002:a17:903:290:b0:26a:8171:daf7 with SMTP id d9443c01a7336-26a8171dbcamr144038885ad.16.1758526333378;
        Mon, 22 Sep 2025 00:32:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrjdy+3gQ0Ckc111ovJBlOudtAqjxxrwVxBY0OTwFUQoacjxSsxerG+Ve2uf3azlenKLYxhw==
X-Received: by 2002:a17:903:290:b0:26a:8171:daf7 with SMTP id d9443c01a7336-26a8171dbcamr144038595ad.16.1758526332857;
        Mon, 22 Sep 2025 00:32:12 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269800529cdsm123806865ad.22.2025.09.22.00.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 00:32:12 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 15:31:41 +0800
Subject: [PATCH RFC 3/3] coresight: change the sink_ops to accept
 coresight_path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-fix_helper_data-v1-3-905e8115a24e@oss.qualcomm.com>
References: <20250922-fix_helper_data-v1-0-905e8115a24e@oss.qualcomm.com>
In-Reply-To: <20250922-fix_helper_data-v1-0-905e8115a24e@oss.qualcomm.com>
To: Carl Worth <carl@os.amperecomputing.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758526319; l=12603;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=/OVN9onjWXrmzDeRCV9TCbuim8Q2z/iTEnPS+UpvrJg=;
 b=yjdgpXl8vW4xTp2hslzPYuXiQmOE6NEJnVtvWgcpwFYiyjbJn4J48GaabGorqnsnOx2zEOY2T
 FvnmObwuuw5DBPKP5yZirqWf9NjTomMu399enIdFXqE5RV0QrtMnutQ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: BZEhTYloNsyVD4lo8IOUvTTCPDH-_UQL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDA0MSBTYWx0ZWRfX+aXvMAgE39Av
 +H7ag1+25qFCU5//AGLOTztVo/kxGU2uMgqerduTK8oVfdzvQrZw/m98kN7Ryg3Qp6xc7dXbdGR
 Q0B3Df4BEdr7iv5Pchda3BBFpdT2WAIydd+ncI7+4bALb6drfx19tYog/0q6adT80az021E5rzx
 kAWa6Z1WaRwJg4GSaMRUrJWFN/p23LHxVDJ7bnJjmwW56SMDIvEB9a4KJjbtEavHpfqxKbyiu6D
 8neHWmajTBBit/uPx2CVgv3Z1iwjHXGPiO6TPJUirXCbIQI0Lm8Jmim33AjX07vz+WbFEF0ZD2Z
 IdQhgw7khMGkxGh0XPkpLnjfPEBVXU/S72ZiCRObk2+Zd7hzDbKdMGIihlTVGA7qfLLxpuXlb22
 7EcVkL81
X-Authority-Analysis: v=2.4 cv=b+Oy4sGx c=1 sm=1 tr=0 ts=68d0fb7e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=t4OZSbUdKNgAmLiGTPYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: BZEhTYloNsyVD4lo8IOUvTTCPDH-_UQL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_003215_064669_51CAF04F 
X-CRM114-Status: GOOD (  21.54  )
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
index a54241ae9aa1..fc7004081caa 100644
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


