Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2492CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 05:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqM+UYl5Ep2S79EQYGJROVHEhouK99FGYuaHbmtW8fE=; b=C9S8hFGrfBZNJNiY6/NTm3pzyg
	Wvq0WJUOHsUiU+/NrB9Fo6K5FiP7N1oS9dXsN0s+FFpkjl1ycJ0MA7kiK8NHekyu644Bq/K6GHVJq
	lWWrQytBU/EvjkUBKIVHFfKcHFLYZkRn8mhJkC/L2NdRqdLESpJvEom0+WTMNgAgMgHoVvkgC/JD6
	KvANdNi5SX5OwJaE02RMUM5L4caKfz1IZglSDbjXYY7AinSqLwEghlMLaEi0Ez4pPlC10MhSUBZnR
	T1gKNp06EW2nfzYqyg/gL+wisgCeMdQ4wNTb+MMqP7ynhvwUpAlG+AuYhV3qX+l4eQiaf+63V8rOg
	eYqrkYVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BRH-0000000CHzd-26hr;
	Mon, 13 Oct 2025 05:49:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BRF-0000000CHyc-1ssx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 05:49:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nLhA005394
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 05:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pqM+UYl5Ep2S79EQYGJROVHEhouK99FGYuaHbmtW8fE=; b=lLBuu7unUB644u8V
	PBEcQL6gNjlZMPJbY/I6wz4Kh0zrMv6wWyNcoEqgP5TsMT2IgSuwZ8RNSMu9LTEE
	Kb7+s2ZZ7yeE42JWCPfX9QoAasn4Wi1GJxCBQxr7QfIcZl0n1u5Hwx/ffv/h4j+y
	7n+6ycap+g1Q/lZHY6kCBCbvxCkA9ZcVXMxu+A0qZlPndpSW+pwJWaDFWWKE61g/
	wJteoWEyt+rcWuDMdOhkrdEKy6+9OzyU+wO38F+YmeZQQNHGdcLQbzqDrYsgaHQq
	aQDBVTzp4PcGSlK4qkyk4TDXxCEzpOn7r5xjzM++0lzbPI4X8YdFHCt5DO0W45Vw
	Q6Lrhw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbs3cdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 05:49:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-798920399a6so6262695b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 22:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760334580; x=1760939380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqM+UYl5Ep2S79EQYGJROVHEhouK99FGYuaHbmtW8fE=;
        b=S0ztLZk9VIl8ekxS6rPBL9J1ETLmp00LBz/CmsjR/npzUl82ktoIkEDBFnPcv0Gi0f
         3N9Lmp6YXuO1kad7C6mnMYYhP1dtg4QSEeaSXo1Dj2em6aHXzCyW+4Hfhj97GAd3S17E
         6jltTdMiuV8P5VmOVYQ0KFEUtJhUezNgGnmRU7o7nZSoLtfuZrsRy97PZqmcmbsrXg33
         wTIFj/RcoE6nfynAvoLE4t8z8PAIf4rx3CFL77bLpPhr4Gfwc31MpqdzBTpCT/kwAYwh
         VGKq/7zmSQ6ZXEzhRyrzpmQJgyOPl7vrxeLquVjyuM30tr/w3cmnItu6xs+SvqliV6ar
         eDLw==
X-Forwarded-Encrypted: i=1; AJvYcCVr4cyv8O4YTdLMA3jwxVl0KuCh0O/ZNeGZFPXr/H6+jvHS46texoapsTJeubyKR2KeZY0nbEaIZgmq7cM2Uknk@lists.infradead.org
X-Gm-Message-State: AOJu0YxMyqjjuAgqE2vk4bBok8E8ERurczmmdZT/2ncb1WhX+roQkmRY
	u5/bcJWUm2MDyaZvDsOer3xd+Ct/iYExHRRg+mwkzMJ139f2qq5PO74psMww3u1sOac4ibNxFJO
	adxDXqoT2D2naj8pEeUz5KJu+fFF/NU0OK6Ly2djsSo7wKACc/21yKErGtt4YUBGxKCFdi5cHLQ
	tOpg==
X-Gm-Gg: ASbGncvASkjRgq5SotJ4c4Iow0sTbDRaIN/xzeP8iV1IRqaZXD5JpYKBqhjSp9sjTP2
	2/bzUTZZzvnB5sGllQQA7hyztji2tPaGv2Hc3z5mbZ41FYQB2oKQxwZkSkjWHFmmytk6vIUew4B
	WqtZ7M0MT17JCz3YMnFX6z+WgsqYCVVGDt1MWAsjFosxHqUNG9tVLn//6vwAhyrepZnfdatxtCE
	wX8UzMQ689YRSWLi2kCyuGigGIHJp44NDkvZ8CkpzZPiKFEe+7yqD4ybjCOIn4FWn7/I9i/JoTV
	3myrTJyZoC5ibrdvy+w41rZGi8JDDXLjG/fBn6hmTfCggx8oRjOr5vay1PWkOucq1aQE6e3wnSk
	TOfHO0gqc/cVu1A6NdpxcYMiwh3U=
X-Received: by 2002:a05:6a20:7287:b0:243:b62c:8a7d with SMTP id adf61e73a8af0-32da8c0698amr27327317637.0.1760334580042;
        Sun, 12 Oct 2025 22:49:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNREKN6Vo4YJPJL/MKRuYdcr7vpsGeVnUs9KAW10bUA1dnxRhSmO4wSdBnBVPwOwya2HqrGA==
X-Received: by 2002:a05:6a20:7287:b0:243:b62c:8a7d with SMTP id adf61e73a8af0-32da8c0698amr27327291637.0.1760334579581;
        Sun, 12 Oct 2025 22:49:39 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e1336sm10129898b3a.59.2025.10.12.22.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:49:39 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 13:49:10 +0800
Subject: [PATCH v7 1/9] coresight: core: Refactoring ctcu_get_active_port
 and make it generic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-enable-byte-cntr-for-ctcu-v7-1-e1e8f41e15dd@oss.qualcomm.com>
References: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
In-Reply-To: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760334567; l=3773;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=UF8V6doJ/RVN7TVX01GECuJetJlOb+tUpatIsE1mFk4=;
 b=CtJZtP1Y5k1hcRal6gfRut6w/2WtFqP35DPw6mXyuwdY+O/ay38ux3ChldhebpmlOMoAEYO+j
 1v9jSBUD14mA+oV/pJl2XNBYyE68WQjKnb7lxIn3LgpW4r0QAvohSvc
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX+tQxZcLnPLIz
 8effHJHdkTm7q8UsUd8VfWOiS2HPlCOkmztg+QihPATln0SXRyNyfmKkg45np9i2wD0+AD0CAE+
 Eq++fEBHrLRGgOqMI8RZMmZ9/8jianQAO2RyHvq7H5G+bVWCptCvW8ZyvRzUNENOtyibqzdu/L/
 EE2UtPyofY0+G9IOeNUTEm1ucQECqESLcek//p+sm6p7AG0SHbDYI2tKb4p9YrwroOSBCvz5XnB
 aeJzkE2qLFEeM2kfe+XVok2MG3nepJLXW6A2I76whAF4mYXYXEJYCt8S0kCRGtGEhQXWnNIUsvr
 TNRLeYLyGjzod+ytH13MutodP0jXBSvmU+4EDwPYv5w9usMBXuMQHHpNFm4Nz7ZrF2khX23vWAe
 cux15faIs/casHpWy4YYqXynwETw+A==
X-Proofpoint-ORIG-GUID: oqq33P9hnvM8vNHjIi8MD-EFxXS9Qs15
X-Proofpoint-GUID: oqq33P9hnvM8vNHjIi8MD-EFxXS9Qs15
X-Authority-Analysis: v=2.4 cv=U7SfzOru c=1 sm=1 tr=0 ts=68ec92f5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_224941_499476_B3C90D07 
X-CRM114-Status: GOOD (  22.45  )
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
index 3267192f0c1c..eb6870425abc 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -581,6 +581,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
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
index c586495e9a08..a23ff6a6f83d 100644
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


