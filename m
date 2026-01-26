Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E64C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 07:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=; b=sw/5H77uFs25TVBd5AD8/IWvIz
	IaLJyqwrT3PQge0pbgoiFqNJrZ6KveNRg7bmNia8ccJShhH1iCOt4K80LDvG1tnHMc/EZ0ZOY7lpO
	2zgsSDyVl9mdDrPdHuXFmA+xCfXGmFkato6k56aKGCQRhmP9Kal+VeU9faoBOz1KAdBqUf2qz3aZn
	OG3OJida6bceektXG8ssXVerjfBYgiailI3ONyA8KKcb6Fq1ZKTGQ6sVr1b3qSLZ0VFOAwdNAuE7I
	qtk2SUot9LfwUQS9YXbBl7YOtIWOEmqFlxy+T9Rb/0pWHa8LgShNBCwNNRhpltl2dTs+//qyoNJNL
	B2wN2rVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHL2-0000000C33d-0Fha;
	Mon, 26 Jan 2026 07:48:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHKx-0000000C32e-3wVs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 07:48:41 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PNxj3Z1075287
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 07:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=; b=d/Yev7/cZxugBpeD
	9l2PwbnzFBbmG9ZLhBNgadDdH10geyFaOaaA3puQgI6ldvBa5XTtKrHUwL+yAcp6
	3wsVUYsLTeLNPJebWQ0Bzj5HZGcE9u8fEw2uKRN7NPFbcCg3y8WOFfox15d+eC8y
	xmBE0+b1pE+Xzx4CRriZUjIJY0oJHgL250B2BBjKUtz2Mzy2yLpYCF8lvhOj56om
	daYTpSZa7whHC2BG+UD3IqIDn6/nkzwhnozBbj06uHdudayUURJYQgySFM+xSgI4
	viJBH6BDDwkvfGzXoiC3TgOD6BefHXtXNi+V/NqDhNbT6abzXKFotrXh388T3DAN
	24YyKA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9f3s2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 07:48:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81e81fbbb8cso3915499b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 23:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769413718; x=1770018518; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=;
        b=j1yiBdRNforQM1xG0s0gIo2fywbLpP0a4yYjLFQb+wVi0s2MpGj5YFtfXx0scySRKA
         9mM9464ljA8+TmUUDfL8vYHn8uZa55ftW3Fb4PEheeGvBZmE+YKGHEwl7ql29bedFXmF
         KcZuCCPOsZWoZTp5AuO/zJQTG3PL6AnQQIp/adBT3oRh71cAhGxWFI02RYBxV1G92e1z
         9fNhvKJSozeFMMjJ1cJHtlqUhIFAGgznl5H8EY0eB2fNPSqq+w4p9TnHtKOeohzQr4LJ
         6MqYWWQqXrdmxok2UgLQA7sMR7wrFripv1U9ZZYghPuJDnN+XGx0tFshN6TEMpgSNSxX
         dnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769413718; x=1770018518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=;
        b=Ya5Gpgl5bohS0WHhlpAjTJF7ETljf7qG3rVEWMKwhMVmBJmb6Jh5jHsa4eFe/e3Ntr
         IDo7S8g/KGourr8HRIp3r5PvbxETsJ+4kqADJu75fEp6fuA+TIYtC7qs8ZVtsHHy6JYw
         Zo9+yZfDOZ8cGLtAU/kvg3Ztkkr9pPtilM3j+t3kRoLW2YqhzgduUuMgUgJ6oQir9kuK
         wplsLkCc8RSpuLQddA+RqFYbWgwbKb34FwzzWQs4lPjJxtaa/SL5gYJ7hXPuGke9C85b
         d1cbwL56U86pg4ITY+U8ahSQttZe+UpxeZ5GBYFpdXfuYGmYnu61nIzlRbN46Mnj+FRy
         0gmw==
X-Forwarded-Encrypted: i=1; AJvYcCWIdBZiHPXHN575b5WzkJ3VvVYQZR/qOI/3zPUT16oYgIzZfBHVJuT6/Usx/FTxCNIbJmlqc5BeCz+BZ3DMfoPF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxmin18itFZiJAE4TkPZEcxkuQA3J1PfRMnG2Cs1om29I+DvrUX
	zX/ze2xuWH944uBHE101ygpH1demZqKt9ALGYub4Xh33ypaoguvkNNeraolJ8IxG8962yaOMnoq
	IjUtN7BQ5iWFfghGNma74S0iAvDJkOXVS61GqujVDBqczd3otx29wAS6eenJFkLB5payWgtp4Qq
	7+fg==
X-Gm-Gg: AZuq6aLHan5al/UwoIZh5j+G5ZKf++dMRS7SQe1O4gIufd4NP4GtPiQsafERy6AMb/2
	WZNm7F33zKPY2MBKa8G03AL+MBYn4dttIRmgCvciATtDD/sOKIkJuS5+b9Ye6DPcBN6/9gSh7wE
	heGFT8vhZbLgo663IuHzN72Idg7YQZgDreor5SXhl6kP7ctWGUWsGVpSqvvEjp9qhbNaP2BSX6A
	KE1ovipjXLIlukB4rf8e5e6SgItz+m9+zUcU9FtBd0heFUajlfJ0eUqSODPglvX+fH/Z1GeqLgI
	62Rv/KVBL40xwW9a37AZHFgRGVu6VrSG866F87PfZNsvmFfSsBVZidF53qSpSHNP1WBYHvcCYmF
	hXmxh7ka6JPOUoLfuJOq9McvTjWTLjVaYsUVUSq5pfKjmiRDLdI8aRAnweUsts4H4qghAqDsJJa
	+L
X-Received: by 2002:a05:6a00:1390:b0:81f:d605:9c9c with SMTP id d2e1a72fcca58-823411dab8fmr3255318b3a.11.1769413718109;
        Sun, 25 Jan 2026 23:48:38 -0800 (PST)
X-Received: by 2002:a05:6a00:1390:b0:81f:d605:9c9c with SMTP id d2e1a72fcca58-823411dab8fmr3255298b3a.11.1769413717635;
        Sun, 25 Jan 2026 23:48:37 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8234fd9a5a7sm1223418b3a.63.2026.01.25.23.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 23:48:37 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 15:47:53 +0800
Subject: [PATCH v11 1/8] coresight: core: Refactoring ctcu_get_active_port
 and make it generic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-enable-byte-cntr-for-ctcu-v11-1-c0af66ba15cf@oss.qualcomm.com>
References: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
In-Reply-To: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769413705; l=3771;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=nzaF2yP3ATiqQC37LSxmXVL9MqWLOY4wwOUNTmvz/UA=;
 b=QeNbIgWPyFTfJk6iiSTrgbTwJU7oQXHAfz8GJngUGE8I+62rS3Ry99tFlTq72CFoIJnUMEUWn
 fp1jRqH4RBnBIyft11AyYgm6eQ0pe8pAFdmlSi1v9yz/z2yUYLsxanu
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=YLGSCBGx c=1 sm=1 tr=0 ts=69771c56 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qK2jWWlaqFtJ9zYMZtrtcpjpAyc1zipF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA2NiBTYWx0ZWRfX5HtmINrpVu7E
 8yvHML6n4g8G54GvChjvfPUg1I13HtDo9s45BlSj8oYsPmg14jqjPWJNS8r5aAOnD+T2kuNr7rV
 BhlUslTTHAvqpLayoNDa1ecwBOpvpU7hGx0V+xAjCaMZpSXxsrg7cX+Goa60n80enj9SVB8zMe/
 iAjWx1Bh/le8mAe+qu0OJdipXFFZVgi/vR05SG9pGTOsBnxEUyXwOyVAHVbCXU52F0N54oO15AM
 Ozr859mH5LFAKMfmRyPvS6sQsoaAnEEgwTHckZ0f0sQCs5hTFF/nhVq9ah9F4zMiKNIGPcEy/6f
 alyUVO3r5uLqea62R+VwDzsolUKLgUQxW9DN9SFj5ynMt9K9u0v1z/pzuQp+c1FtuvXECCZmthq
 dBhTEkQJUHl5EF6PTWaVCEzHRAn4q/L26PrA4FmPkT+WxScJ7tXJkyHxYcUgDJ0EEW0iYxkbrsz
 eFe0ZgZSjQtb0eEZRtw==
X-Proofpoint-ORIG-GUID: qK2jWWlaqFtJ9zYMZtrtcpjpAyc1zipF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_234840_043885_125A9296 
X-CRM114-Status: GOOD (  22.24  )
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

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 24 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 19 +-----------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index c660cf8adb1c..5f55f0c510e4 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -585,6 +585,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @remote where the @csdev
+ * device is connected to.
+ *
+ * @csdev: csdev of the device.
+ * @remote: csdev of the remote device which is connected to @csdev.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote)
+{
+	struct coresight_platform_data *pdata = remote->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index abed15eb72b4..78be783b3cb2 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -118,23 +118,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -147,7 +130,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
+	port_num = coresight_get_in_port(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index fd896ac07942..cbf80b83e5ce 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1


