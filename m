Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B80CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 14:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/z3TLk3YJ3zjJ3lq98822BJk5JYh6VxSRdK8UVMx+Ug=; b=m+UzAHInL4unnGuYNj3MsFMykR
	1IVLvTawRKyLDz2VlOrXaYdg3SGiRIkdJSmb16uKYdZi9JJQ55qECCHkX83BC+ntbvpBJfnhDRRiw
	YYghDCyv83IZU1zIssrK/zr3wZ2RSVJAogi7J7RpGogLb22cXgUiIRJC52AOeIGnyVL2/ornEQ2pj
	8RVvQm/HQE2mJk2vEcGo7Tx/e5I7XBOLsxcxrt9w/1U1eZ002/Y34I2Sh7+776/j8EWtpuRLHiLOF
	zRl80dHAzf/BCKEWf6IUl7fTjOIwGKJzAfAtotPB1h/q94lOkLYzCgrzDn2DXNkS7VJn5aqByu1/Q
	vVh2zVLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzT0-000000041Wq-3Uxt;
	Thu, 07 May 2026 14:12:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzSy-000000041VU-2ZGf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 14:12:42 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AOmNO879574
	for <linux-arm-kernel@lists.infradead.org>; Thu, 7 May 2026 14:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/z3TLk3YJ3zjJ3lq98822BJk5JYh6VxSRdK8UVMx+Ug=; b=mdfFPFxNy2sPNcjr
	j0FmFrSTwLflWsXzpHxg9Qh+5uXaCGTLpQ4MhjLyQ87pWQ7rSJ6A4b3q7Z8H9iAV
	EaIN2lNwHeJ8fQIxVHsV9SPPHcGqPklQP6l4nJPB0gETHTWd3onwwOAAJp37oc/8
	QayyM/qTfJzrzrl+pmMRbKsYgN6+crYiL6eImIXD5qUZAICULRJuFQAz8M2HQT2D
	/7czGFku1wAty209NJUGKRgy7OsxRyTRscRlEMIYTbz1rr+ip3DbUT0QVdhVKx6b
	VKhiu2bwbho0RD6w/8XVMzaqW3KJVXXCX2UWinpyA9Ud/KUTyfgp/nhUeEEbYwME
	TSFwyA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq25rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 14:12:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7977177675so454760a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 07:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163158; x=1778767958; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/z3TLk3YJ3zjJ3lq98822BJk5JYh6VxSRdK8UVMx+Ug=;
        b=cv/pZjTNx8b0QI3WrRCN7n+16XJ+47y1+zMQPBCv11mDc764M3z7TRXO9E5TRBrzyK
         hjMPOGN514R28BglIbiZUQnKgMCEb1qwmBg6PNIGT9PRFao7kN0kH0AMiJTemqmKNYU2
         TmCCWHhIKMAQu0ZjYxO41l6C5g06WALE+jyYUc5BhQiEa6XnZF7kIEbhYO142W3MtQWz
         WTznr4rNfNS0pC/zKP1xAFohU3UqGJzi+eF2oeX0ggHF6qrDzsviaCxYFNC/QccgTh6Y
         DBMz6Z9tAnHifQ8TPbSV14Ro2dbKQXxl0z2MiBLALWMlO3ELGqvNnKuYUYbkjQNYepO5
         D5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163158; x=1778767958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/z3TLk3YJ3zjJ3lq98822BJk5JYh6VxSRdK8UVMx+Ug=;
        b=En4aRwkZTwNov8wPnX4CacFHJnLZxO7tHZ+ucr20tNAIweYpXbSqDYgIdGiGsjd488
         /ZYjrIM4++AVjwp6awwtsGKDMxVxjlrLXiuq9jE/g9u+8lvLjngWR6/Eg+dSEmQDUy3M
         za1Eo9DRuiyvD/ZKLLMOp+9mwvbDcFmSN5XBxMyy8q2ccpr6ivsICopUl8AhHLPznoFv
         c7oNSSMVwy3u8E2xLwERd1MkQ0SLvJIHL3ZKd8BdZ0BSNyTl815UAgAuXr52p+Hv3aJ3
         I7BtWDux3o+DEP8rM9OoBghM3TRGy6poLz+AigEV0RIYfXTKaDoQNFymRT6UAkrmpPby
         8B2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8BY9hE3AJhl2KrJ5/YEfdLhOcaGD++6nvswEm8N2VKBomtMIQRZe800vSMQmUIQznBxFUp5FsGxgjL56/4RG7R@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2EcE/OKiVEgQYS+5bGEPONTAGCzObbPENvUVcvOBOEW4QFExY
	EnHJ4nWP7r5G4L42IICw0cSJMh7sb+0/n18+UwZZA8RXF68CLMn2CqeRXhIqInnHJiMPd6YW453
	eOitqrwRnGa9b4NQH4GDjBVES5p8CV6AoniwjmZoe4wKBq/XkcUYRweKU/SpIYy8JQEThIfnRKP
	nciA==
X-Gm-Gg: AeBDiesqDQrffuv1DOga6VGH3wX/nOK4LhNiEOIkXRo2njeIb6Cf35kuoCtFEX1Cjka
	M8oNshz5bHjgyBvWOuL5Twk1Ll7tW+dwoh0WuWpJZMHk4c0UhO2DYRtVvWFAoPKzi7gVUqzRylG
	s3kGO54L00MY8UMuJYsI/Xn4pQBJcGUNEyf2MQHJa2duHTAu9xfzboI4sJMIjaaA9Tt+f73nERO
	bEbzkzsAvWzyPmAaJTQG4+y6SjspDxOUf5cmawhlDb4ertytXZiztAQUqr1NMj6n3Ki1GgiPTpk
	dhLVN00onDXl4fe4RRmiFUDUjKzIVo/6TrUDnyf6QF1HptP7/KasIJHBzBL9ZfJrFxzuCOhZK0O
	3gKbjhXdaXtKGizvdTtApsi0D8gsoGXGQnL4xo5eJOfeHwga8OD4Wo8yop8xleWbUo1sU7+aVsX
	KPlY79yZgPDta/Tzte7EM=
X-Received: by 2002:a05:6300:218a:b0:3a0:d88:6d6b with SMTP id adf61e73a8af0-3aa5ac0ddf5mr10192229637.49.1778163158485;
        Thu, 07 May 2026 07:12:38 -0700 (PDT)
X-Received: by 2002:a05:6300:218a:b0:3a0:d88:6d6b with SMTP id adf61e73a8af0-3aa5ac0ddf5mr10192166637.49.1778163157864;
        Thu, 07 May 2026 07:12:37 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b493c5sm2343072a12.28.2026.05.07.07.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:12:37 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:11:57 +0800
Subject: [PATCH v18 1/7] coresight: core: refactor ctcu_get_active_port and
 make it generic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable-byte-cntr-for-ctcu-v18-1-2b2d590463a3@oss.qualcomm.com>
References: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
In-Reply-To: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778163146; l=3816;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0XKtLb+KNpJzb2pfRF5CKuVsIlfPIhLw3pICGVnZtAs=;
 b=D5cf6pQGKCuusxfGdwFLVMla/i8jhs3iNib8sL+WsPnBr7WuT16FNM2Rk4aS7L5AhjxNGcrZb
 r6yv0LM/wAeAiYYRxxEr5kalsz3g+7nvRuAzWzkLh701BpKSL4wrbM6
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc9dd7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lyq7_Muqgj1vGRpOYO0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: KZlp0rakvyw2Gd6BiaWTG5pgBlBc9LUG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MiBTYWx0ZWRfX5q1Lp0Bb/luj
 GRrKIdt01vzSLIKDQjK5l1cvBkgLmBJ2FRrAwykNII1/GhUi4zf6U9eX3PzTt8IG9SBvhw37wjh
 imPn5HlBH0Btj2r+bEVSsSE2xKyPMhxmO+fcrMezTBclqkgXFkYoP23VyJD/xziYW8UPE6iO74d
 jr0jbG8yuPhxnrVe+8h7zbPP3gEAMrFNJuJrzsHIcepj8lArgz+PDedm+ocoIRa4PruCcAPJrui
 h1HqyrnZoNwuOAMSgKJvX4d8oZEmIuW94EDbAV0Jky7oTAJdb53ZEKtHu9kcTZg7o/1Zp1ekLl1
 9kve1NX74x5M2V3mAdgzXpnh6flKinbR6slDmU+ljjkbDfg8erilCLRbU7pbJknjxatf4EA+YBr
 Mkmapkrc6OkxqTPk0ga/g7UFROdFQ50aTtDEBNhLPs8HUg4frVxo18jba0KGMC8jVFKRvT8Vs5b
 RAGjPEg/n/ZUCrUbGCw==
X-Proofpoint-GUID: KZlp0rakvyw2Gd6BiaWTG5pgBlBc9LUG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_071240_776667_4F532F3B 
X-CRM114-Status: GOOD (  22.09  )
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
 drivers/hwtracing/coresight/coresight-core.c      | 27 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 19 +---------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46f247f73cf6..9e19d370c207 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -588,6 +588,33 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
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
+		if (!pdata->in_conns[i])
+			continue;
+
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
index 9043cad42f01..e8720026c9e3 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -116,23 +116,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
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
@@ -145,7 +128,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
+	port_num = coresight_get_in_port(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 1ea882dffd70..5532ec82e82c 100644
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


