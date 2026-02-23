Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60506E98DF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 06:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=; b=INbAc49hX95HnDjMyizlZbKjxc
	WYl14rbcnUvVz56uDag/48jyZNh3jZKIZIojzAZpScMq6y7fSBzuoUH1T91CkYDoV6nitrtRj/RU2
	PEhToEPe/w2qcgmATPTfaqXUITI1XO0iqz1jis1BE4TDmbEfBzUjjxYMvDBEtZ5r9vtsdG3sGXm3L
	8Fs66DNBsZUBg/rgi/Wc89fkdUmXfjt5N/R1URGJ1sTWVo+Am2DfgcgVsjkTdWciAwvwhhkreRf1X
	QVUMUSqjDD+t7X2fjTy7rldrbj1DYw+rzrFs7Yp7PXRW8RMKPHa03gO+3g0ffD+HiUoMMN6gKzCqP
	//osPSOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPrk-0000000HKRR-0djW;
	Mon, 23 Feb 2026 06:56:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPrh-0000000HKQo-1B0s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 06:56:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMUCHH1687472
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=; b=nOCpoty8Ol1Z/F+c
	STJO8lPVua66zACAjSvg9aDjtsDa8i67swd2frevuCLX7ZhniqB4FQzl7ztImc+B
	7VmkHkMk0D5yMAe6UPylmDJ9kTIjmYJMdcnrfXFzKxln73BIrx+BsGbYO4A8nCe2
	zN/r3lOrUsD8QX8PMoqoNNNdLLtzS2o8eEr+B2WHxskcO5dWdMgTHk0RFUacqwoZ
	uaMdxlZinw+tJhKiKi1GCroa3145SbdUqO/P63YVRi5qiZQ+mKTbcERTnxQEz0GJ
	ds4qOjRHrKGEpsxTMR/KXqO/oHKPePnV3a78ttp+ueGATNvQjKWhgmxb7tnd2IuE
	RhRJjw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9uq72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:56:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aae0d40a47so379972805ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 22:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829779; x=1772434579; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=;
        b=WFM06U3Jtf+qc4rqkpxM0tmOu/8LH3c9hhLjYDQxGav9QB1KO//kh1hzY2dQZY3+y5
         fi3IjA9UOjCIb58Kd42db0MdUz5k8j7Cex3ik6EMbP5W1+DvGXCJGc28GoErSmIt00VW
         KzrbKHOc1cbV5R41LNazb5ktF+JMKc/S/c7c1rucxF0852M42KYxXnpzpEIKnnEGV+5O
         lHcZBoZjStuRGoFrulYMJbRP7SaGbaYUxF3YQdiv3Hze0imPiSQkTUWPrPs6zQnfOko6
         HyFOhVAG1ZILJ4COyG/R97DFeQtBDswIgBdkr8jpjDegfSrWh24Y0N/3St5j3pVeNGnN
         iMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829779; x=1772434579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=;
        b=mwL8b3BnMdnE23gRZ8qVaYD1lwb+nD1qmIP2xU0uiMhzhJkFmZNz1yGYZe6WJcYq0e
         Y5yrH8mRC4XuqG49JB+ormQUSML2ERAqEj5tub+7/WA41zOaQ3HBQmOE4p9cDSqs9R16
         UcRsDumch4QsaqwOs32P5Cm+dhwy/ggZKCorfr6oXNNZlUlkOVEuf+RF+TnNcWZ1+XTL
         Wx5gqQ3pfn7jmhyBLzc7dHhNxCnSoNW/H9OljB+ibu1bIIR+9TBwi6SJnMA/T4/wGZ+u
         8wHxGXUdVFrbWYQ2N989ap2CH+YRz24T+eQvZd8EwzNMD3f2+pPZm5E+1bCLVoaARXRD
         FUfQ==
X-Forwarded-Encrypted: i=1; AJvYcCViFJD/VBaA3DJnDTGl+Nfgj2J4/3y7mMcdFY+b3WNqqrYRq6ZGRbjvxkgr4vRzc+Lm2gGhFX6G0LpVnYFnJCpF@lists.infradead.org
X-Gm-Message-State: AOJu0YxKlnjmT0BMxs3INErFyQ/WU0w20mFDnnKo1WYb+89yMvGWnYgy
	sJ/4XhPIsGOlHfsUiLNfru7ZJruKIQ2fU+COTV87LaaS73HDZLZLm/lNWOOdu8JFLkO2hBsluFi
	Xhmn1NsCuP4/L8V3QCCxLqYQZBETN7Q4w+DEGl82VgxQEn630+WbFOGQy9O9F7gfpljovoqYWSz
	q/Qw==
X-Gm-Gg: ATEYQzyg8+2pi1AUd1t9Phb7Hl96RymExeEz/bBmFVlMgO52wkoye5p8fl2xAnQNoeW
	UAaLQj/21kedgcrdZoAOLW6qPtR+JE26pbjIjTyclFEjHBdraywjgbOnjWNiPSbYn9lWkJw4wuw
	DQu9Zrtt3uQ2lzI6CAlzOYXEdh/4zNWIriMuRWG7TU0DnH4iVd5ZVSt282mxJ7b8FUDnbGkXYt/
	ysQhHhjNlTmYtAG5fs23lXB0imWM58scQulVjpVCgYT9cWAcV4iFMBF4pgJC+87jF+dzS7Le+Do
	bNA9cZapmxBHpZt4ILoZhxVu0Iudtw48mot9HP76DuYdPuA9n4Av6EvoqSQW4osIwB7WvFwc4jV
	A2znaQVICkucdOXcvKcDPwqGTcDQPoj8QYVnU2Myo6Qov4bazNCDAXRsJJBrjpuEugsoY17hYNa
	Rlp7m0tgjjWs0a
X-Received: by 2002:a17:903:46cf:b0:2aa:d7fe:8611 with SMTP id d9443c01a7336-2ad745053a1mr64820785ad.27.1771829778964;
        Sun, 22 Feb 2026 22:56:18 -0800 (PST)
X-Received: by 2002:a17:903:46cf:b0:2aa:d7fe:8611 with SMTP id d9443c01a7336-2ad745053a1mr64820505ad.27.1771829778495;
        Sun, 22 Feb 2026 22:56:18 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f619f8sm62249225ad.36.2026.02.22.22.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:56:17 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:55:41 +0800
Subject: [PATCH v13 1/8] coresight: core: Refactoring ctcu_get_active_port
 and make it generic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v13-1-9cb44178b250@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <Mike.Leach@arm.com>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829765; l=3771;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=nzaF2yP3ATiqQC37LSxmXVL9MqWLOY4wwOUNTmvz/UA=;
 b=94yEoy4nSurylGbRJ0V5DPEndCwAjFuBsRD2bm90sDL2wEYpjo+ftcY8uF8dOdxn5+dK39Pel
 aqeOr/cHOkmDuryVpmHsj9VAY7E/kW2NMP6mlBzkXRgdZD//Fi9xYV4
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OSBTYWx0ZWRfXxIakG/o6jmHk
 u7MKwI0nB6db9m2yK4K/CbKJbeCxXBjMSIhcduMHgLiIP7+cPT+/MxafF2PAd/7cYdsGQc4T1Ck
 vBAGYpLeRAByQd6/istOXLbYgbXA7/BSj3lGY5n5aBuIyCyOBfSS/AtBDb0TA1TI6Ao6ut+WIFf
 wNtcEpKJ1SFW7Mf5pweiD5qgqGzFGeue6KKBHIQT/iTT7He3DARo39jf9qLF3Sb7N3SJwXIZBOh
 09BPHp5PouPLDNlhf/HWbmkPaERqKUgNHDtxIzP1dESggl6iSR4TYttogXPo9ZYEjkN5ntJIGAB
 HQAgEQUy2PyWh30c4UGTI9WeSswef+TkKoiAck6ijAmnFRZUNgoC1pWJyuGRzv0ifYbabU+mIv4
 AmPMbI9hHtwGPg2o+Ii5+PJinm6mC5VJSiLBOdtM0kcS1UIvjX8U8Qm+N9ebueG3ZK1Spq9r9ge
 XUdDptS43gvMyXtPECw==
X-Proofpoint-GUID: ojczvV2w8PaEatJDgWp0xZ-8YDZQnw19
X-Proofpoint-ORIG-GUID: ojczvV2w8PaEatJDgWp0xZ-8YDZQnw19
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699bfa14 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_225621_436594_9C63F718 
X-CRM114-Status: GOOD (  23.01  )
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


