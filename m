Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61C6C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 06:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlagnvE3DvQDjl8NoW2g4NISDOA+5IeFliGdXmFMGmQ=; b=MOvb/VaNkzabzU7jp7hHgIGKw5
	g2mWr5jeRgb5Mvs2F/mfPMW4HZPd3B1skffN3FGc1Gdsj5O1TZOoW1gHmBX0F3utUk/CnkIHIaQ1h
	6DGRWVSxrB0jSLjmcz/jBf6N4QXCZOGjSP3zeUI54RSXiwg+kc+4fPhqH/CWYJenNqxDK/Eikhxp0
	mi3vE4zRg5KDgUeCZxdBykNy2PAk4KaUczgb1iOB04kL8l7rJPnIPuj6yRykOE1dqOtGs9jmfImtm
	M0G567r3XEV1tAN0W3Jf/rfiJ9ko/H2oAXxGF/oJqfq+pto0lRPO4C93tUzPYCbRDBEUWBLthgcaI
	09gqa8Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubD2D-00000001OtM-2t2Q;
	Mon, 14 Jul 2025 06:51:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCii-00000001M4N-3XCs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 06:31:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DM0SYI027348
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TlagnvE3DvQ
	Djl8NoW2g4NISDOA+5IeFliGdXmFMGmQ=; b=EydcAQoWsQEBxP6FdYgKjseL38I
	fxMHjTEaQ2QfOtVpm/IyxhqDcIc7M3kfeWf3o63w4PQMqOo01PDV4WgOjdkk4MZa
	wRHQCP7o+opE9Cb+C5F2N8huhmJ7Hr64aNO2aucATCjbFp5Ir2GyYlV2SSchm56w
	vgy/cC9NYtp+F3rvX2NY4AtzDGpLmxHkt//IQvlLDtB3x4bJ4v9pHnPJorQvMndr
	f5gVfftXQzhtZN6FhoUtyBKPmVlyXsop+Dlh/7b+gS0QusBlfnqH/I3wli+Exk6P
	Iofqsy74fdXKTl1HkeP0TzZoZaRjTjV5mVDc8pfCEuvThvgntr33iRhAkow==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37ufdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:31:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b3bc9d9590cso3833702a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 23:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752474682; x=1753079482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TlagnvE3DvQDjl8NoW2g4NISDOA+5IeFliGdXmFMGmQ=;
        b=NMzmHMoTQDaYV87WkONSZRSouwATAlbRzrD/J6HSrQVmOO9LJZUZnIT5Hf7IH4kzDb
         jsuirLlmm2rubWriBC+yQKoQiz7V362xAsXvcPzX/QRfVMs7YzhnFJWtNkD5A2yvmCgX
         XwAVN5NPuUotpWmw9C833nPeFYpCIjtbQB4fWDUFw2dULywlfuEukBPLDX6a2Tsvoh4p
         pB4+DsFXNI/06o8fSbxkB7Kb1tV241MarbTtI7tylaNmqmRGEIl1rM4yEMxAA1HaTtSK
         ajrhVVULIfUYjla/1th5B2iDw6jVkjMtwd3IyedNMom9/xe8qM9kowb4MQZ7abHkhngR
         YVFg==
X-Forwarded-Encrypted: i=1; AJvYcCXALMEFiddU4fXoyMd5+766fB4Ns11xHmipjSAWwUubjObnyAkvPxwY9L4R6ZV8UQ5jmYgKBffNuhaioQdY5DZq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/VqJWI5x1KkKvXLVvrHB/sIoxdFkJo4XwLt+rkNHNHWuhzVxe
	lWk6oj4as2g+7yBNY1PMDiBvGn3I5d8XylK7Q8QsrFeCtffKj/UQXiaxG3cMIyVxQAXW0EBb6U1
	gYhmwg9Ad2nHkomcyUR7/GY6LnSX9H9mYPEHd6oiiyOFYWaO46Z8FPCioT9DBg6R+PQcRKajeZL
	Y7IA==
X-Gm-Gg: ASbGncvG/Z70B/n+/BkoVUTH3952GCfse94HFPe/G0yCMjvNW/ewyopgVFpRUyydx2r
	K5WcURrjymOp+C0e7G4jzE1Vc7ZbGZJZssHcymfs0grsFQxMvn6LsBETK8BS2+24SCc0PjBTvGQ
	+bzm/7ayUSoCC+/V1fi6q+DKtRJZsrxjo4FkfmFUgfFZVQhQk/vBh8wXG/2XhIWcPu1ux2sBFdU
	d3B4lo8xWSTvOHvGIpvrcq9SaBc9dF+D9psJrv2EM0hFwiwkCTcGarhS7g+Ae4iMrx4RiBHD8Ik
	QiJ353HDYR2JeyBtIJwoJ967nU3/0X/DR6FPWlPVfknUNczoYNmOpKZCvwb06smhMYSTH0BWJva
	sWpvPQIThjmzJsoAqHRJz
X-Received: by 2002:a17:903:1b63:b0:235:caa8:1a72 with SMTP id d9443c01a7336-23dede81dc8mr190362775ad.30.1752474682370;
        Sun, 13 Jul 2025 23:31:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbnMsrBl15IDIkz0WDEDjeP9KCLJo7QcXtqpG3cv+ngO9fyVjCXyOrc3bIj9AbDNVdOY9SoA==
X-Received: by 2002:a17:903:1b63:b0:235:caa8:1a72 with SMTP id d9443c01a7336-23dede81dc8mr190362215ad.30.1752474681967;
        Sun, 13 Jul 2025 23:31:21 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4334005sm86138255ad.158.2025.07.13.23.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 23:31:21 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 RESEND 01/10] coresight: core: Refactoring ctcu_get_active_port and make it generic
Date: Mon, 14 Jul 2025 14:31:00 +0800
Message-Id: <20250714063109.591-2-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzNyBTYWx0ZWRfX9aApc/hz7n+O
 TVl50hDkZEbUxytOsqOoyNco7JiQGEnHl7JwqIWoSOyllcG0RMdBKHz9ZeP76+OBV5t5t8MUAyU
 L38xT/ykGpbdPVHe6mPP4zBVefBx3TN46vaFaPTh9dTcTTAl4n2G+y5bX+ONi1oUZBL1yV8Hts7
 m0otwfGwr2ffVrkyVs2kHeubfo6anHaEAt7B77eW29ITLP7vXY1XlOqI/OwAiBAeY/vEvVgZHlA
 Dvq83FW9RLD+ntrIc5rX5FwnfWZkX2zjbZ7LivNLDly/jlhyWcUcdFAn/omdGJwSLyIeh0ude08
 Li1eUTvo9N/35K95yaEMvW8ttfabrz6D1nRwS+aO35lEsjuqDhV9wAFn+JEOoYqcG9ja0YPvx8M
 5P2VxM+33Bi0T9IM51zJpCr9/CedgeZNqr4L3CLvQmopVF5VorIeRoLDHcmaPYCXMLCMpEfv
X-Proofpoint-GUID: X-97RRvZCDfVvXy4G8pfIJzCVzpeJzDb
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6874a43b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=UMME_An3wchvczm7DuYA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: X-97RRvZCDfVvXy4G8pfIJzCVzpeJzDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_233125_004601_1F48C2C1 
X-CRM114-Status: GOOD (  23.36  )
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
index 1accd7cbd54b..5297a5ff7921 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -580,6 +580,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
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


