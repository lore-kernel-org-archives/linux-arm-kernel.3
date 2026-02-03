Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAB8E83057
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 05:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=; b=oeMIz8QHuGqID12jBMlJKqGi0w
	BzKdyPgm1PDoWhBK4EP8/GZ68XI0eLFR4xm0Ucf2+UMG1hIeyJJeTvY09kdgJ9Eq3usift5DBzJCd
	3IFvRFb0Mo6HEUqxWUnr5ShxjYzRVGNMBzFvHYg2l9EO5hpEj1yUNtzm5YRCIQlMoY/P6LP5FxPYu
	NXMe2ywxtzSzkdEJoVRx4dDE22cnHlFqa6HAUFuV7haoC78ITQ22gOlmRPbDF4kRIPggh7r3UEb3x
	pGxDkMc4MJFXrLZF2QPJFtsccyFumCbnh++dfyWXZEwE5fgOAgpKbzNxOozXlPgocbzt21+0IP7Us
	nBdO+aNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9KO-000000068Nc-1y6o;
	Tue, 03 Feb 2026 05:51:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9KL-000000068MG-2WZ7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 05:51:54 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6134AiSS571041
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 05:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=; b=Kc5+5Aidb3REAC1G
	ke09e+x+zNjfgc3Myt2Df455wKfo6lNGhf1VNCeY5wj4zedcyDghrniCw4v2+vcB
	281+jmmbfFaBBEwNcjywDZxJSv5L1vyOJym4SObSqDHdKlunznDcSNup4w4w6LCr
	IC/YCsMSe4l8+oVj+gy3gJJZlp5abIxub8zL8LG9OmnhcveQ3xWSyyBL/oAeVRvN
	IMEzORnDEI843D3VElopMBndhoGAWw7Dj8kW1pchrj86CWB0ANgMUmJnhWtZORI9
	gPjreJDR6iX05Yv41esSyssUW2UkYp1jQ83UBeBnfXPqEtIU3sw75vnyhIQO9f12
	0bVUQQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tkmk396-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 05:51:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7b7f04a11so142202275ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 21:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770097912; x=1770702712; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=;
        b=RM4Oah/if34XfCOrrdgW9t8juenww8bWvUeqTFDs4fYOgaXqgQVZjsLaIrdXBt8UMZ
         TK196I+9+bI2mOo3wUlCmZkctTs7hBCM97xHwSt4QFvcjFCGj9oy44nPBO6cCQUsLjjZ
         WlS4c8xe+fUESSmZIWQKrozWY7hrGoXo/lzvytNUCg8/1A+kynj4mI+Io4Pp3QKTmkhU
         qW90+8+gu408haf5pbVAx7LyTSDCYjYahb4ffqpqsR2GkyegTgOzKZL3+wtKm2O487o5
         BvWQSsfKA5pBx/RaTCJR5THT6n7Iie6mFXVcoK2OsaMwZ+B0+3cNcv8c7kC2hcjgKCr8
         077g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770097912; x=1770702712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=;
        b=m/tKZGX/uMMjxxtsxEhyDttSUqEKyMOb7DJU3MstVRD9Jw6LTt8vxbHxfI7UrLminV
         7AwjDGH/+f+Pt/2z/1kYLKQZvWELlBsyblVgnTfbxK7KNRsi1y9cmucyRBcPLfItP2tQ
         5hDEMX2qSGH5O60Dx8n6AHOAGG4X7bMT5QGkYHExhsVZldpVZu58H9QcC4EXmk4OVWwp
         We728wl2whdenvx0hOUHq5mms+mRuR4qzS2y8iRmhB8a4QwbQNK8kkBgSdT3gD5FEmPC
         wYQHWDhNT6V0wcD9moVX8G4yf9TUp+Zj5mFO8/EfC5zQCWKfsEPXWjz33MkizYusQXEv
         3EEg==
X-Forwarded-Encrypted: i=1; AJvYcCVSzcxhsGFa74BqgfVgAiWiVnZ4VGMVa+FrTXyQftedphVtxRXzrQzYWxR7+ObLqRbsrHjbCiu49S0TBc5N6Y0S@lists.infradead.org
X-Gm-Message-State: AOJu0YwOiCiWZ43ZUuX3Ma19KC9U/sc5RBEpfQ4omSvkBUC8aw9Fx/jR
	msnjDtAic9wGN0ksj1+dJQcXtFd4s8+07zWVmFy+kLOmjBxkibnd9SthsSTsR1MzJSIuPwV94IC
	pW5TbcK45B1nbAXUfyR1wSM/PaaCvPC/K9a2R1dOVkQ3xW75ERqvxMW1UHpiaaGaVhu9amkjhjZ
	enIg==
X-Gm-Gg: AZuq6aL9h8z4uCYgbu2Ezwo8QzQ4Y8qLFrA0BuDhZLdxipyXn+kTRAYxjVWb4MEp2Z6
	LRTa4Wf8UZOSUPXtOccA1/xiaGf3lMeSFSAooga6lmlhUxLy/zAubFUKWrjB6NS9euGdOYMZjk8
	yha4ZL5wd+hCQqlQaRP5jWA+hDacHpEiNwycE5fMTIEe64FAvDZVvnPnAM+haS4D1WUxp5Au7Zo
	E0mjjgYSCwBCor+ECOWvWEy3xgyKmBOOYVhybAsEQtxuyZwLyYuj2o+/lmrBG2MtKGtTl3RhCQc
	R6+wyl/UgAEktSIkGbpkHTXa29tClRBPdrrdbDlT1MX26UqZ9OHjMb/XkT+7Fbb3wutGf8XFYT2
	2/yehw3YLvivNV55VitCpe7cjd4V8ye495gVfNBWCb+asJtsLeeOkd+93upABVILd2ovnF4PO
X-Received: by 2002:a17:903:3e15:b0:290:c516:8c53 with SMTP id d9443c01a7336-2a8d994f3a3mr92432475ad.40.1770097911520;
        Mon, 02 Feb 2026 21:51:51 -0800 (PST)
X-Received: by 2002:a17:903:3e15:b0:290:c516:8c53 with SMTP id d9443c01a7336-2a8d994f3a3mr92432175ad.40.1770097911032;
        Mon, 02 Feb 2026 21:51:51 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4189sm157424735ad.83.2026.02.02.21.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 21:51:50 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 13:51:17 +0800
Subject: [PATCH v12 1/8] coresight: core: Refactoring ctcu_get_active_port
 and make it generic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-byte-cntr-for-ctcu-v12-1-7bf81b86b70e@oss.qualcomm.com>
References: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
In-Reply-To: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770097896; l=3771;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=nzaF2yP3ATiqQC37LSxmXVL9MqWLOY4wwOUNTmvz/UA=;
 b=pWy43CaYoKueLn4k+QHMpLlbjvhPJdeqt0RH1YtNLHBUD5VRBzTiVeUCJeC3H6dSaokWtzCPc
 /0ltV4l8ISEAGDviAXJSq5VJuQ9V/sIUpTvPn+F4d+9g8UsK4JfocOf
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=TaebdBQh c=1 sm=1 tr=0 ts=69818cf8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: u4OSFyabGicciAj6Zz_Vn23iS2WvBNTZ
X-Proofpoint-ORIG-GUID: u4OSFyabGicciAj6Zz_Vn23iS2WvBNTZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NCBTYWx0ZWRfX4FJXQvnFNWox
 0wr9TMVLJkMl3J6dmDr+KIdK6ypbCJ0goOL7I0xwfZuFfbCJ9WU0tYXZAwaGbS0hC+TL8BMr0IT
 M6E6wq5mOHvfHbYc5sMiv7JgDncTvP3NaCW+mgDLvhwGJ38Q1xi9AfBF/4QjvdAvUaZzDhyHKXB
 zbc5G5Ay+APZ14W77V3zi6FN/Qf7h97sQWbnXzaCDIZHso1uM/fj8vGVsBEkhZQFkndNNNiJ6Gx
 Nk8f5DUpdu5bGvhre/9ABrmryQrhW1nb66pSZyblQda8L/mED5SosxmQHAVTM51o1R8jivtDgLt
 yhE0iYGu66ZzPChnt6iJ9QpBHkMWfVFJYDXe1rQTWmVmkfPSamEd+QTen+qnK7kv/TB3kwMXYW0
 /lfFu2/jU1WDFoKWKueKr+XUy0N+kw+nplknbiL9QWcz65KMftUWNsqLUe1Yz5Zb71wofmUscSV
 XRgPG4snk1efiJttx0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_215153_793665_B5735394 
X-CRM114-Status: GOOD (  22.70  )
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


