Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBF8CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 07:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufG3sJi0LeG+2kPC0a9al27kJCVNII9Yo0Sf2m3fcC8=; b=CEz+psQtTW4qCjyoZS+GyD7m40
	A68UsBK/8gmNs4+ttz9VJeD2bc87CC3x80gJT06vR3bvSA6HR52I60AMIpfuC6m3Y7nNHSznmGZp8
	MrjPLgich0Tr8gASXqWtIjATN6Eqd9JZw0mgUg3QbpXaw7ajiM3eSB8eJuhMznffUcd9nYafvlxCw
	g81e6PqP4IPPMxjbDULB8Vj64CzV1BexVFm42gdNaM8ycFfkt2sLBSCwPST/1vQBMcU1Dksf3IBJt
	u7P10mzzG786dL3qdpCnv4w+nMOzeTqKcqmiz065jSTgGSPN9fCy7525LJrwMfuLiILZQ2kMasW4k
	r6hGUrog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0b22-00000009LMC-0sCV;
	Mon, 22 Sep 2025 07:32:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0b1w-00000009LFJ-3T9E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 07:32:14 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LNtglP005264
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 07:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ufG3sJi0LeG+2kPC0a9al27kJCVNII9Yo0Sf2m3fcC8=; b=gLrjZNXqOHVAt5k0
	NIsVpduON6SlA/lSw61zvy7VA0SfMpZAt4C55EWIFNVBGBXAm0Od+tyR5To+YJ7D
	2IjRE8bGYTsWqgDl82neXtuPBbJFOvW4ZeEWCJfQzyzClGfvQSxXLGYJH8Gzh6WD
	YKfn24h11svGzJUqIGcndKfwB1cp/UktQlUy5Jsn+Vdo0EdGTPjfIbyvgoSvVDyI
	KJPAP+1vpNP3MrdU30+np6c3hi5gJWqRcyu0xRlJgMoLwgENtYJI0R9nSq2WRrlE
	3WhRkqCeGqzd7mPVEdRh0OB6XFZp5kGA5XlZES0CpxgWWh3fKer3hg45PC6R124V
	EF+Zxw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnm181-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 07:32:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24ae30bd2d0so36809815ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 00:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758526330; x=1759131130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufG3sJi0LeG+2kPC0a9al27kJCVNII9Yo0Sf2m3fcC8=;
        b=Zstuh+CdHlBeYeTl1DboSQXBZht5Ul4XXkRKnd2NhMZKJyQJ20UnYcIldR2hnQ0JSI
         T/vF8uUmIlLyKyduMXqjwRx6rKBqM6Kati+caqD6E8nIVpYfvR618tck41InIKEoD7Im
         TcJkICDJWhoV79RBteJRJghsQMGi2+UxiRqCnnARR6VVXHW8ZTcT93rWnzvydZcEzse4
         LP4C9jqmEnkgq67dUGg1vKLLD2OPaX/3N6zlKs+Ec7E4Up4NKR9AH7ujfw4aEE+c04vx
         QhOSvOgWCHQt/tW0Xo1u/Wqf6YdpD6YWrKyaCPh0ALDF7otwYhrrY3xSMn1u0a8C/3Yi
         cRPw==
X-Forwarded-Encrypted: i=1; AJvYcCVLaK7Mgcre+ln4JygPMWWHDhjm/By8rzlQbKxOPvfd6bGWCXrGg0q0Hrv263SqKioOfRHyYHQlLx//sgowEUTo@lists.infradead.org
X-Gm-Message-State: AOJu0YyJgqHEnhSkq88JO863jWfwoCIV6uk+DsVXBx9Qu3FcEOgI/q9y
	DXAYRurUao3eM08FevqnQQBzYjvNHUR648/o0oMhTIGFrrIImfi3FRXLVXiamISizqPMOIRvgba
	ir0qb+GtCkJdHWayCR4aS367iubxPg4oPHars5t1GKpbfGnc5wGMkBldNh3RsD8w98qECYqC0fA
	Fd1LHvfR4EZkrx
X-Gm-Gg: ASbGncv8PKkKQhyknkLlj9E0y4DfVe7V2GO7jwNud1viwWql8RPG2vCqAUygVATkq9Q
	ipbPW+RvNdS6bVGJn5A9uGanyFNR+pB3JxbSrw0vMjz+Nyrl96+PRHJU7o6fNP4+exgXnkJckvW
	sE6tJkGUVav9gCb6/xhtp1oQo+qnsmrUg44GoqnbvIgZk/SuRdRxI7z37etFk0D1ltef4Wig9MU
	SYeblyl9dA1v2C6kAvihNeqBFTPANw4nf+PAbsMdYEREL9zRJR1+B08UxRZcbaQ//Vr5rk0EIn9
	KQE05Fj4yopaBJ7ioL339GErZNghdK2zCxeeDIZ5T/wM3XFnE+Pbb07lvvYh+W2yasy8/Ed1RpE
	LetOT2D5Cx96dL+3EE1dte2+jQgw=
X-Received: by 2002:a17:903:40c5:b0:269:96db:939 with SMTP id d9443c01a7336-269ba5628e6mr143483875ad.58.1758526329881;
        Mon, 22 Sep 2025 00:32:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1Vp6gvYIR1bXT5jSRLeA0Dq+/XmIuZlyLKdJBmXmf3ry7gid2Ea6v/MpWbW0ZGZhIjTy0jw==
X-Received: by 2002:a17:903:40c5:b0:269:96db:939 with SMTP id d9443c01a7336-269ba5628e6mr143483585ad.58.1758526329364;
        Mon, 22 Sep 2025 00:32:09 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269800529cdsm123806865ad.22.2025.09.22.00.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 00:32:09 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 15:31:40 +0800
Subject: [PATCH RFC 2/3] coresight: change helper_ops to accept
 coresight_path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-fix_helper_data-v1-2-905e8115a24e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758526319; l=9918;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=QEBlXI+s6Pg9S40qJyLflLft2wUwobd5Tsvp12e09dc=;
 b=9NtI1pfDUEbYlQdKKADnRMqgOTdWi9zQ4N7QotfDx+WNujMbQNXirNSlwc3H1Mp0+vyG7Wy3v
 vgZg2zNM47kCzuIl/l8+qeCXInuxQ+ksbRFx6UE3t+X8YxzA3XfmwkE
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d0fb7b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Gv9EIBWDmE4dLvOUe8gA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: viaQ4iLhbd0amyY1-IO5kMMGmdBdVfE7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX7+enNwfIvnlC
 h/WzbJhq6e8j11YgPJTN7S45uGRV0Oq7gjh4k1roHmYSNj/ZfPV58dFd+0foJA26rF+rFoxohYs
 k54ZKhYhZjNmCMsJpikApEsQEGkKhWl8lcq7OfGLhlMJTzbpE5e2p8aDDbJWw4jPbmt/0sLc5S1
 XVv98ai9qDhv5PEI6ol51fQvdOrmNFfLT4rAeHKfDgFlw3aZaaVk5qogjH3mepvjt10do4E8VrC
 savUFuAE/4iqmJR14RpBYY+O0CC1ySI3R/yJl6HV7v9lxLsikjoN74HZtg4bSQYhgls1N3VSnVz
 6Qtl3CPc5fa1mn82kvLk6toPNbqXC0KInWsMrfH7ropLhfhYDqcOtPOOm7xtsVCl5rySWsRQFxO
 oD/jJ6yR
X-Proofpoint-GUID: viaQ4iLhbd0amyY1-IO5kMMGmdBdVfE7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_003213_018138_6003D111 
X-CRM114-Status: GOOD (  20.33  )
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
index 4591121ae1d4..a54241ae9aa1 100644
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


