Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8C0CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=riURT7yHCOPZx38hIetmNcrk/xUqPrSJU9dLdU0LRDM=; b=AwfjKuYSMcx33H+YILMebrDkbe
	OxsSxOmITV6FEAcBuCVwT04jrlvyk0nC+lfhRqyNoNy5VFjdAlSsJlHcmzbRD4U0pEgk11kTT8oQ6
	E32ICO9KSzjmeEAQxRjcLmiQ9ozkIP9PMOnFupXLD8q/l1dvbhdeJ2tMbEvWG+rt+FrwQ/NPKyGf4
	pIuCDiFP3y5Rr09pF4SLJ4bqukPp+VClIJfR/Wk1YrVQciVO1MOkRkeIzQ7x+oCL+1qBrqCAfWSO3
	F1AtK2WqXdVCoI7q7W2b38uf/t59RuZyxy1wN37dRFQ4usMPK2qPyaicyEYS445Iaj3M9GRN1rQdA
	eW3dCgog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloGq-0000000Akas-13XP;
	Tue, 12 Aug 2025 12:38:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkVu-0000000AGP9-1Ws7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:37:47 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5Y7lb022400
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=riURT7yHCOP
	Zx38hIetmNcrk/xUqPrSJU9dLdU0LRDM=; b=GJKin4ldmrNMZD8zcr+1NHBAgdz
	//9AbRH4PQBcUZ9fxecK3iWVCNevMsUQte/Wa19fuvpNErwbWvdgEdtGLkJJ54AP
	6QAeJ7nuYET1jC7bT8urMGONOZ58wRSdeD5+WG1RoAnOrjryp5hdW5hQjFBiigWi
	sKtkF8ut80Y0AWUkhzTVbfSnQAkAhlYaFeDwx5ZKv2EBmFoVTA4DiOVa7FeSC1pE
	0mnzbdi8Xag38oKA/LfJenvYvulhigEPEVQtvUjuaoXUuKadvy5UoGYs/Oje5b+s
	1SYOGRR8kkdaPM45dusXOyT9nW/nzbU6MYQRYCbjs+VqwR6xjGCpurrsN8Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vja7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:37:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2fa1a84566so4552110a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987864; x=1755592664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riURT7yHCOPZx38hIetmNcrk/xUqPrSJU9dLdU0LRDM=;
        b=Seijt9pxg4qR9oGqJoSVnUZ3llkKte9Gc9Q4rLEmO4tyLn23L1BXkBHCLfk4Lp2H3X
         PF2vVCEc41me5lRG/gg+8kUWJKvAIwf6BN7O34CD9cGRwAj3U5CgVEDF8Lqwb13N3HnF
         u8FnU+iakqEKlGFd/XmTzQaxbQY76C2ORGzPPm/0+yVwAq2mzmXDXS/hQXvEPkbVGzcq
         fIiQdjDWULzQhPWoawU0yw7Xr3xj5Nn00jEv4cYI7VLSANcziReJkR6i9tzDefO3FXDe
         4XSC2A7WDt6m78FscONDeZz/6uWy66/3iMAu0JWUam1gkh5xllOjSsOILCN3BNaRjjFS
         046A==
X-Forwarded-Encrypted: i=1; AJvYcCXnZdQ0zdjlSzpQv8ECkvn6OABS29vJxAd3/WA9lT9KGWcPIcFqBCaioawTKHR9b0jzeaCJ0I5tRAQxqe6HToBz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy88YRYU46ipXeZJARMLIPtFHkvXeEmhfHpnfNrDFbSPugvQzEN
	vtZlaw5pO4tKkBicofKghLlbSXeLEOktjG3qZb1nX9mWBzLTrEbzSaH/ZF3/4Lz5rnJZvEACDlg
	xbQ9bncKhBLJ2T4V9RBDMtZUjo9gHDpKOjLVpiiOvUcTBIR4ZEVm3RrAZDg5Tnt1pgkFjNpQMIh
	0OpQ==
X-Gm-Gg: ASbGnctxxj2PRjRbh2rV5xs0RHpx+cGDCLMz3LNoKISUk819T4r95dSqfe2S3/OR811
	yO9EcDRiCZoyQJPEc67YnJm+JeRGMyyhADWR1moI751G4SXra9XGrvcUx2TFNGAw3zXPSC/hg38
	lG2oCwSt7Te6P8ZbXr9X5fFPWJbSZ7ptWmipcnYxkPUk6HNb3mj6rk99cOEdkXkKR0KM43vzHT7
	GiP4JJZYu82GgvvJhqtjkPL8zhFgijY0T5UmGkTg9zos2Y1IMbWbiGk7VwKTu6KJPK5/NiyhELU
	HuvMGd5SVLTGZVLH+eXM4gOcffrqjre4ebOLsicG95WXutOaSPFYwrU4fPBMTfHgmsrO1/GWgkr
	/RcaWkZ4nGU/FSNb0Plg=
X-Received: by 2002:a17:902:e74f:b0:240:11be:4dd3 with SMTP id d9443c01a7336-242fc230cd9mr37045505ad.3.1754987863925;
        Tue, 12 Aug 2025 01:37:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5dAbW2Log0v6AuB3l+T7D5XFDndUH0k2jF1NznPuDRg5AqrmtsIfJngtinh2TBDJFxMffEA==
X-Received: by 2002:a17:902:e74f:b0:240:11be:4dd3 with SMTP id d9443c01a7336-242fc230cd9mr37045195ad.3.1754987863460;
        Tue, 12 Aug 2025 01:37:43 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-243086849b3sm1915345ad.175.2025.08.12.01.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:37:43 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 1/9] coresight: core: Refactoring ctcu_get_active_port and make it generic
Date: Tue, 12 Aug 2025 16:37:23 +0800
Message-Id: <20250812083731.549-2-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
References: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX3LOrLNOlAfp4
 WxX587ic/BKuKwsdvaQhLa3TGV0aC1teUxYMztroWwYvoEkHywsiOae2E3lD3dx+i4bbqJI089o
 EuehROSqO/yMgPndc9FGzNV1PZE57MSEJaSgxIhLakR6pB78qVCvKxAhcAmjWRrTG/jgciyHtc8
 T3CPSsVxWLFPhghXvBJqCu7UkZQ/mEahIV2fhIoT0j3vR25oR/fVQbL1Xh9PLWdjsho/6KrjKzC
 5XeMiZOhYSur6UOW3oz4AN5mSDqMwVqnJ6Hrjz5/UQ/HdgfX1U6bvkIgjmjjp4iJMODGanZnSTY
 hgpWzte4fDskifw/qST4z+8siA3CwjToGX/+7skBLr07JyGViGJiOvg2NHQWq8336x0Fm/UPAnL
 p+1vxLnG
X-Proofpoint-GUID: JOcdcPnpss8kjMbgv41CvmUMVS5YmnbS
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689afd59 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=UMME_An3wchvczm7DuYA:9
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: JOcdcPnpss8kjMbgv41CvmUMVS5YmnbS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_013746_519939_D04C1CDF 
X-CRM114-Status: GOOD (  22.79  )
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
 drivers/hwtracing/coresight/coresight-core.c  | 24 +++++++++++++++++++
 .../hwtracing/coresight/coresight-ctcu-core.c | 19 +--------------
 drivers/hwtracing/coresight/coresight-priv.h  |  2 ++
 3 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 1accd7cbd54b..042c4fa39e55 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -580,6 +580,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port_dest: get the in-port number of the dest device
+ * that is connected to the src device.
+ *
+ * @src: csdev of the source device.
+ * @dest: csdev of the destination device.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port_dest(struct coresight_device *src,
+			       struct coresight_device *dest)
+{
+	struct coresight_platform_data *pdata = dest->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (pdata->in_conns[i]->src_dev == src)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port_dest);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index c6bafc96db96..3bdedf041390 100644
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
+	port_num = coresight_get_in_port_dest(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 33e22b1ba043..e51b22b8ebde 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -156,6 +156,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port_dest(struct coresight_device *src,
+			       struct coresight_device *dest);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);
-- 
2.34.1


