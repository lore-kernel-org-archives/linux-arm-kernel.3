Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E466CE7542A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 09:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjPxjq1G/MyM9wZuLe71IZ2aZxQ93j8UibxFtFmopSw=; b=XyO7pfm3BJxP7xvrxFNrYJIE9a
	IbAJ9Ao2SS/NOzv7Ydis1xKBUb/bY++kVk0zC7G2uH/xYu0lP7KC3NMkK66npmY4T645eErnFmqAV
	e/KrendCPn05py0fGZcCN3KAcUdRfgmW70D8bki8l0PCNqYhdNkGFk7cLqdGwI1SMEm7yFRQ7mD8I
	cx9e5N2tH1JPPPj3a3AW1nKDvl5wsvEX6VUjjpt1JuQr4QkpzVCkE+ROK22v4NbTRJd+GZXvw9toL
	57pwVyoi24xtATmJ/N3grx1l7Yj+1R66o8UBg0F+WYdZUgOkix3IYdi0GATNeRFkKwWxKWvUzfqcQ
	NFr/clsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYKps-0000000GbZ7-2wOD;
	Wed, 24 Dec 2025 09:07:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYKpp-0000000GbX8-1PTB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 09:07:10 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8SjKD1207083
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 09:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TjPxjq1G/MyM9wZuLe71IZ2aZxQ93j8UibxFtFmopSw=; b=XDscumjdhCvlQT0G
	q/9wE09bSUcmwIuE36rs2C8PAN+c2FqQGvH5yPCoK7Joxyw7LiB6wnNw/XiQyszL
	zIiQLONjVDYIqKe3I4DerP76VUks8T+Ass1tJAeCHoQLPDPPk4T9HHdW5PavM5tP
	IVdtHwplSEnwect+0F9iZqLWORvzi0j4RFOQBTGi7s5D28xrZf3Td37e5E3bdXoW
	tiR+mTJfPfynHIIX0XKKHKJYrnbX+VdpLjeBzc7hCAQDlm7RqtzwguAsiwXcNwkF
	FkTuONKTrRzHgseEoMFFG/Q3usNstR+OhI33uItnb/vC5/RZbh0XkxcXvS/HNfAp
	D8KHIA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r1mjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 09:07:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0b7eb0a56so151659365ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 01:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766567227; x=1767172027; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjPxjq1G/MyM9wZuLe71IZ2aZxQ93j8UibxFtFmopSw=;
        b=PSo1im2uMOnUxZP2V6W3BXa0QAXtAF/rshOV2huL6x5EXN3QzYP5Jn1ygb+EupiR7Z
         uxAOYcRzIWekmLsDNWwm0KfRtReSnKapBozmsHpKh0nOnxcuXeJjLSSTPt8P2wZUpID/
         1uFbqkagufMcWSQzhXlgQJxsx/5xe3I+Xvov7YtXF+tyqL9Biw4DGP4n1l9T4G90NdnD
         2GVFCTya8cyLGBKZeqoK+LNc7I1S5OrrvZCUxHwXeyiqjr7GNUcysPs07Da/tz5vOPtU
         vAPQe4pMx/WL01MIkuJCHQfXT3KE97mxchHh36Xf1Zjer1eTqXB0dlUqPZ4Oc9xTXAj0
         czXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766567227; x=1767172027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TjPxjq1G/MyM9wZuLe71IZ2aZxQ93j8UibxFtFmopSw=;
        b=c3yklVhiVtl7YQOeUqLcCs97dAWeXbHfqd8JtwT57TJ6W916QeyIME8Sf31vQ0xCuM
         SLU9S+wO7MLqnh3VXlnv2AT47G5mVRPjLZIzPCwdOYVqi3AbzcjVt5Izan6MCRla21mN
         qQPW4Glt3miOAdREvf7AMSlabHzd1sJHzwaWfnXsaKJZNIxPVVX4mxzkAjFOn1QgTw0F
         g+0EbDlEs+UevJmZfp8liTllUW841sxun3GierToXIIFkAgLLE//qyre6CLGXvr/l0Pq
         vLb4tueF6ax0rKvT3a8V8423ZEOPD5SfYepLtRYqeEe8qnSUHnHi24wVmmNuXDOvG9xl
         LXqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz3t3rGQMuppomZVWetHAJ53Onm4IKsVLA56pScZDr94+/4xcvQtlY6Le6J7OWSf/bHa8wnTTms1FyzzmjlIN4@lists.infradead.org
X-Gm-Message-State: AOJu0YxE6d4HG9Yyz1v8X8pEkvn/iQmy97lnOc/TbvSVmdnaAy40Xjem
	ZGF9gt+1V812YKSO/8Mef5AiEU2HWl3AlKDiZEocctPB4+XP7GfBuZTjrV3bkZYPRBK+bKyc0Px
	Y9IzxqQKx5JMLOXs8wyXqtp1H6OQQkS+pWLfTq36JXrWzqOQkAm8a3aanosbReMLSZebDqDqNVY
	q2opCHcFGzfg==
X-Gm-Gg: AY/fxX5M9Z7J6Ev8lIwKCsteD8fzAwAzt844XNMbu4cBdTlsIwYt8xVS/ffWMtYYGtT
	9/pj514g9+mxvTE7j7hBT3nXLJGqhTkD/Li3Yu//pj0NtDeGvy5wSskx+d7FhZf20NCqragz1iD
	OLRbklMQa43SzCyRu/ZcyYOEGbwXwPLDOKMk+u/ysDDADEzIXk0jxs1dxYQ6IioEE3bLtSuWisU
	9dq9uJtkXtm8S38T5aVoNqtpydpAeIBiXYxRy2llpnAuFONwbWfoJwKGRgLnNkcg2Qd/+6Srcbp
	ofm2F6bqVYhQ4uqkClt1o3lmWZLsKiJ9xUighseI06sWuQQwz1d4+V+/lfYwd+rwG1HCcd/2CpP
	M1K6pPOFVhruoVH0+4eBbIYJCAmCaaB+nfRu1TLBUbF24k2RmHpivy8/wYVUeU8g8iZuy4oPA
X-Received: by 2002:a17:902:e552:b0:2a0:8360:3a74 with SMTP id d9443c01a7336-2a2f2835cfdmr127686905ad.51.1766567226997;
        Wed, 24 Dec 2025 01:07:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUOmvjkE5jwGJCb1wUcNBlhuAbPgrp6XJATw6fq12VDVQFcyEJstSLNscyietWEtLwkYnlwA==
X-Received: by 2002:a17:902:e552:b0:2a0:8360:3a74 with SMTP id d9443c01a7336-2a2f2835cfdmr127686615ad.51.1766567226479;
        Wed, 24 Dec 2025 01:07:06 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm148418095ad.21.2025.12.24.01.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:07:06 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:06:11 +0800
Subject: [PATCH v9 1/8] coresight: core: Refactoring ctcu_get_active_port
 and make it generic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-enable-byte-cntr-for-ctcu-v9-1-886c4496fed4@oss.qualcomm.com>
References: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
In-Reply-To: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
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
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766567215; l=3769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=x79EOx0VHbHe/nWXls6UDtNS83yDuFtih92LzPbC2MY=;
 b=Ah6yDC0yixoVi0q8wSVIKghtnnoYfvtBJTeVvk+aonsv3NXB7C4bH8t4+1K3l/vrrufgWoUar
 EQUzPjule/GCEB4sXHar2a67gpPHVoCFrE9le94DD2JN/ELf3ckIfg8
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: GEXT2H_kZ9v7AU-fBD9T9SGfaS9sLZ0S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3OCBTYWx0ZWRfXwHo7j1XpICmt
 /VDfnrED4wNw/SG1P8rGXVeKpkB/AvOfdqhHptwATMihS+cN7aXyTot0J6GrjxEwHX+tfBDmCpr
 2uwItgw2jjJbWEfOc1PnPuncJPHsLFlfFQzONQNvPcyS1GaUmMlhevX59rIlT3m7xfIc4ZzUlk6
 8P9pFFcPXPqClLiJ9CM9FqIu4bN4jX7jbsJa6azrCIv1pBo3oVTajseyAC3fjwwWHwSvZe1A/+p
 Qeq8kX6V4SmHdY287iIPkimsSWPA2pD0ro2CA07Ezpoy7lTw4oEIDAZXGr+wasGv8AiglLzIMrB
 8Lx0fpaQ50Z7Ccu7+k5uRi1tAy1ADj1NppDKqggO9w4oJTlL6WoKcF6NM55vm4oDO9D/cQkFgIB
 7SWCYK+hKDbfEjga/xGfHpz6HMUtjHZRlgFYy3YGOr2ccUbZCGeME8j87NRnUO3DhO7Em/Em83s
 crROgRw5hEIU14IumFg==
X-Proofpoint-GUID: GEXT2H_kZ9v7AU-fBD9T9SGfaS9sLZ0S
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694bad3c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_010709_534314_2712435B 
X-CRM114-Status: GOOD (  22.33  )
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
index c660cf8adb1c..0e8448784c62 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -585,6 +585,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @csdev where a @remote
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


