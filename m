Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432B0C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 06:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXDZmqpfj9Oi17S+KvFoTK0GaAZ2Kfc438E97avizmc=; b=b+AzclXAc97A2BKhEeVRq9sp/7
	o9y7DYpuXozaHnhI0hXR2YAMW6zGMuDS2bk8yAjg/YobCZjiK+x23KG2C/8VwlwYnDLch4oNqnZ7g
	UTdz7FePgE4gNO3w24kBAkF76itlTVfbqgt9LUBsB/aqcbtvK8YEkg/uJT5PAs7eRuoPfaQXRbaXQ
	Us2kuGbvlj3jzBvx1huR9trg7TiQ2VrfiYrlkKApcluYNRIPqTOZRxO4vnce706+5i7s2FbuglemR
	gCw+naGBdTzH+PlkZ29sQCboGCobcj+0qQI3PfVUCcFTufqAFBkY0I9AXoelEGeOkVvBPIEhM+ZBk
	ynC65Azw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTwqs-00000004k3F-3eKJ;
	Tue, 24 Jun 2025 06:09:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTwm2-00000004j6e-3vQk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 06:04:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O3Dd6f016970
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SXDZmqpfj9O
	i17S+KvFoTK0GaAZ2Kfc438E97avizmc=; b=TyhHVy5rcxyPvLe/sRdeKCTKrzN
	qRApGnsNnaQf/VpGRLGJ3oUoWTW+DYHp6U+l7V+Flfx2eHPBQ55pPZdfAbgoz+ud
	Cohw3Ebp+ORsQebZD3culedijJ6er9q8F+7JV2D3CRQn4O1ohiLNMF1UNGPqCe5H
	voC96rCJa4PRb3fs8iQ8vuHG+65M5Gp2fMhBRoUlqZFyumsyejebSdevU9w8oYkY
	nrZwPo9z3zo56l7832wQh9ZNZc78zZwBR+w02RRij6k4m+A3xEsYEGHvg6+AdeLt
	X6Etjs3m4sL5Be+WF8r9PkwwqeDS8ZI0AZCjCYiPcsQoY7iWQruZjlNzX/g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f7ttt5m6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:04:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2356ce66d7cso64060325ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 23:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745089; x=1751349889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXDZmqpfj9Oi17S+KvFoTK0GaAZ2Kfc438E97avizmc=;
        b=Om/OzIxqjm+qJsgcCTJkvrLRJ9PnALzOB/u81SrYtEMBUC/gZekLvUUHBm/3R66iBz
         x1euzmLszM75nJAxdh42yOfKZMumqDExuds6x5ZCnaB/GXVugpjCz6ClGkRJfQQ/Fqoo
         xatzjBLwZlqLBCwFzD9qD7Kr8juVgXeKl4Vfpg2A4v+qVEi3uwehT8APy6iF0Y8QmKX2
         qglhB24E4+BgOYvIkY7D+kojya1W8MSSYgiptBdFRBPOtgMxTDYz9f5LMj0RxG7nRP95
         KiPmpV7UWses5+lBP2gdq6JwSfdGqJgJvni3vFE2JUbbLrTgQGafpOrlozJueNo9GXYS
         hbWg==
X-Forwarded-Encrypted: i=1; AJvYcCVgjFAMoxhYm8v4XX5ODFOqV/EDALZXsxfCBQRjWcaKx5oAv+8lhONrjeRxf6ALP4gGOQuPv1/Smk1ShouqjIfm@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3BtAhiqtMSbZbAKz1cHBIJWgKg5akpQgZqW+Vfklp3HNZK9sr
	6FDYQbH4+REhB3BIVQL3hJCVReoapPx4+4qPteTnzCUVGKKqemzaTH/nDaz6G1v4DvLc4gDnXyU
	eGnMOqzltJRFjazTshG1CWwxRfJ2NkEyGFuY3RNRpDDHG9IchHNYicRCFQLvBsd3/6aFNr5tjf0
	zOiA==
X-Gm-Gg: ASbGnctGX0bXZQKW6hxJ96ojrVbN1X1dX8bqUme4IYRkwdLaU+xTKkPvdnERMwV8rrG
	yEEcYUEoLE8AB4dHMyKyFwMRaG9RO0LGOumYARvbjiuIc+UVUlVMyKzQUWib9kkbnrrpZ5yK5Qb
	7odI8rkHf4JdHDkYqjDSDlCYlE9PNuYhrZbjj98PLt+/OPFgvfR7fzW6iN165ouGOAtHb46oV58
	ybYd21borTbUvQmV1OyaZH2UBgIjTmvtDqVqj5rF0m+TZKBt7ixBZZcY0QMWEtPM/o0mLvsjeZt
	1fRl8Gt5bbb+Qmm1xWEG9ZzFeGtyOvmVaoXje+SkSCUz4iobk1UqqrqYn+jRLkCWIsS8Eloq28m
	+Iw==
X-Received: by 2002:a17:903:18e:b0:234:9094:3fb1 with SMTP id d9443c01a7336-237d9a7321dmr269830855ad.35.1750745088726;
        Mon, 23 Jun 2025 23:04:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHGFVEgHMh2e65wgJoSytM+YbUXaFUdaLymaIwIAsqFFbJ5e27Dt9FJEOhG05p9+rpg/ktWw==
X-Received: by 2002:a17:903:18e:b0:234:9094:3fb1 with SMTP id d9443c01a7336-237d9a7321dmr269830575ad.35.1750745088368;
        Mon, 23 Jun 2025 23:04:48 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:04:47 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v3 01/10] coresight: core: Refactoring ctcu_get_active_port and make it generic
Date: Tue, 24 Jun 2025 14:04:29 +0800
Message-Id: <20250624060438.7469-2-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QINoRhLL c=1 sm=1 tr=0 ts=685a4002 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=UMME_An3wchvczm7DuYA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: SwgUhR982LP-Q8w37Tr2idkLUJfp7jmZ
X-Proofpoint-GUID: SwgUhR982LP-Q8w37Tr2idkLUJfp7jmZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MCBTYWx0ZWRfXxweNXp0H80wd
 BeToYoyGjIWTRSq4Mh9sYunEVeRGmssWwY26hecR5YgD+hJyRBHK39tstrJ1k+Ro1ReBdbmJd8I
 UMBxhd2aBvpNfQgrr7aStmImmmNCSYgPTGYVFndjqTSn/MZ+9ockfjEZHtmp8qvL9A8t7iyxz60
 LBpZko5gko17ak2t6nOInhvKPrRfyZNwh1woauf4/SVX75y4666yOjVI82io4GyS/SeREbfovYI
 FgNBrJBEAmMRAS9DE96g5dt2OOoEwBodMSBfqINdL58fmR1DFgCLKjgfVbtjomox8f5ROFempmC
 DSl/y19oSKWM3FFm5Pu94HUeVMh2jjDUH05xv4CShBDAXGXUyqkJJKEjAZWWEo+Ir/2HOp4KtBW
 Xdr1KKDjwI5ioZpkTQQ32RooX6YEF5AjDwp9/ovMhcX72Koyoe6npH4OPG9BiKd7Fk8QimaE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 clxscore=1011 mlxlogscore=999 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_230451_097025_1230465B 
X-CRM114-Status: GOOD (  22.88  )
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

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 24 +++++++++++++++++++
 .../hwtracing/coresight/coresight-ctcu-core.c | 19 +--------------
 drivers/hwtracing/coresight/coresight-priv.h  |  2 ++
 3 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fa758cc21827..8aad2823e28a 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -579,6 +579,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_port_helper: get the in-port number of the helper device
+ * that is connected to the csdev.
+ *
+ * @csdev: csdev of the device that is connected to helper.
+ * @helper: csdev of the helper device.
+ *
+ * Return: port number upson success or -EINVAL for fail.
+ */
+int coresight_get_port_helper(struct coresight_device *csdev,
+			      struct coresight_device *helper)
+{
+	struct coresight_platform_data *pdata = helper->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_port_helper);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index c6bafc96db96..28ea4a216345 100644
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
+	port_num = coresight_get_port_helper(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 33e22b1ba043..07a5f03de81d 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -156,6 +156,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_port_helper(struct coresight_device *csdev,
+			      struct coresight_device *helper);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);
-- 
2.34.1


