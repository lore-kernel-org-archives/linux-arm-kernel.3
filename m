Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD974CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 07:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLb5zfab531NYNRygT00FTgQk+urSL3aIgF+0s6ontE=; b=dXlKeVsbtIRv+8sLeBEhwlejD+
	kiEcpimSWSBurWdjYrWQo5ffadl8WMCMUYTcSmrq6Qd4YBv3MKpBNEI9+PifQ2dE/o8RoPs9UNb77
	kiF+uwMNvEJ/kRo3TmX02eGRWG5KgZFdeWkYti2J9M2pBPNB9i+zGPniLfqoCM5OS72wfAORVf6/o
	Jpwy32Cgfn/PrCNxf4wCZxk1DCSKLnaCNzSJnCR7Q24HrlIVgMF4ZL+mrmjux7eErjOBvmv4Tmk3u
	2w7k30vORP4IdqvJS9fCVfgYbjjEUlZscmJeo119nSMiLcpGOeVMbUSEc7tT4piIQ3/mbPhVCeChv
	fKz5AyaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszC1-0000000BTEz-2O9y;
	Mon, 01 Sep 2025 07:43:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usyUi-0000000BNpj-3FDA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 06:58:25 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VNoBrl015661
	for <linux-arm-kernel@lists.infradead.org>; Mon, 1 Sep 2025 06:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dLb5zfab531NYNRygT00FTgQk+urSL3aIgF+0s6ontE=; b=ZeEv75ndWYIPIdcP
	E/agYXZZYbvSkBnqiy3jcU84FG7VMCBsQKJFYt8MNzQwwpihzNg9H6xY7BR4iw0u
	T4Z5SUqoNwWOe29K5lY1aAl+Q6m47dIj5rxBe7zalIKdMDbkyNwYuG7rw3MWkx43
	/zFSQOB85IUlDL/4y0In1YFKTHkb3quSrOLZY6z3NhIWzVxKA5Kg3cyOF9PAgu53
	X51Rh5bIuX6cIBcJSIDMj0mGI+k8EyXgSL+U3r0jkwTX4Rj0Bd8hjym64mqlPUyb
	Qow1Gyb91VuNGM42Q3jKeXmzpyvipTJjCF58qfo/qQBV+bECK10ZAeDZRWbVUuy0
	y3lgrA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjbmk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 06:58:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b47174c667aso3247811a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 23:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756709902; x=1757314702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLb5zfab531NYNRygT00FTgQk+urSL3aIgF+0s6ontE=;
        b=n5UM3iQC3arY7NrdB5LJucvsx0WR+YG1zfw93kyT23FudapZhdOb6I5Nf4XnE9KLba
         p74PKNcbmPpV/vpL44ckySDNqcGgT7VABam6Qxfof7FO1fhw4ShSxKl7q7qvps4EbZGs
         cK9EakcZszmO9yUWPt8r0fRm7P69aLEVDUimfdgHa/OGbUVdSrMq+VfihUyMD0ANxumx
         ogMn0EsnPSRuJFbG2Kz0r7XoXKK+MK7FJ8lDptETEJXHsPs1K6BLjQ4BEymkLCXBODXo
         uVhndrmKiHFPda50UxOA5kU/dI+TQX/UG6VEiO0cdMmWyaAmKV7FpljpJzbdAlf+/VsR
         jTUg==
X-Forwarded-Encrypted: i=1; AJvYcCVY/1YUtnCD3TBjIG4TKWmT1LLmF3DDWgZRuN7epyoU6BsFNJN/Q43Q6lRKAR6fY7PKeJjz5Cko4ez6FQRq6Uli@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc8NNp1kL6BJ2VBQRqpn/4yJT5CALfsfk7JICSDskZpVIYRxej
	pb8I8ZBo+elI1GPIJachzT6R6/zi380Wi3keB1ac+Os0vE5vgrTd7H5yMt3jOMZE22hZXMlIUWa
	gqTXlqMK+R5xllPwFy2EXAtatnBG0FhI2E5XRAHkAF7hP9EeN7zk3MWQY7TLqXNAmQgGenD4RT1
	4cFJw+Vv7HLt0v
X-Gm-Gg: ASbGncvfnb7TwJOv6OpHmXil+42Z0aKyKrBFLXbP4mfo7qut3BrFB2/Y4+PaYFUt2RI
	uQDk3SfrTisGsaxpmnYhIaGYUaqTyTekMeVQlryON6JT6p0mfgDsYy9AKvWnlvROL5hla4slzDi
	y4M2Z2GiqbjYPF9J8euNQXnREn0bIgW7rJLDyQaTbX+/FhrXjbUruoWkNtE30S3cppe91iTEBFt
	/JNh2jy87+vhAP2NSmYkAB8NfdZEGvbX1aInTn9oDHf2fizBohcov1IdhePgN7TiVuh6dUvtE7n
	M377M/hkP/yULOxd2pYJV5fuyy092so2oHl+sXrsDONravKtWq9HQ8Q0crnYKBhhW6XRQBl0NU/
	HWMmH9HJq5nqi9CBBY6VaSQ==
X-Received: by 2002:a05:6a20:42a3:b0:243:755:58b0 with SMTP id adf61e73a8af0-243d6f3b622mr9331542637.49.1756709902488;
        Sun, 31 Aug 2025 23:58:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHanZiPxSU1v9cAUvVnD8utRjYhNL8IT8UfQ2s9CDwfXiE+kciYJzMhomhFdanaIJbCuctfPA==
X-Received: by 2002:a05:6a20:42a3:b0:243:755:58b0 with SMTP id adf61e73a8af0-243d6f3b622mr9331519637.49.1756709902058;
        Sun, 31 Aug 2025 23:58:22 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd366f95asm8559358a12.51.2025.08.31.23.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 23:58:21 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Sun, 31 Aug 2025 23:58:15 -0700
Subject: [PATCH v4 3/3] coresight-tnoc: Add runtime PM support for
 Interconnect TNOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250831-itnoc-v4-3-f0fb0ef822a5@oss.qualcomm.com>
References: <20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com>
In-Reply-To: <20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756709897; l=1698;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=ZRqDRcqJUID9wiPQfpPR1WcEMamloLO0sgtrKILAjZ4=;
 b=RoLU+Iza7O5TpoVvMZwc23uQWSolFpj4SfzRxppOcKkPY6mZ4URDE1xbKH8DIs3/Ssnphy84n
 Npq7139DM2lCGohtCNFwcX+JVdamp1E/bBCAR9t71gZwSWk7If4/s7j
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b54410 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=qearADheJa7ujHrKWl4A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: RX19fZQ8_EovVIeqZntWodbGZeQblkMl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX6Nftl3Phgub+
 lPmlOlCna3d6KvkoDuTlifWJkC/3HrIb5K6XztV4+R2owFJLMxyNauFsFB0pH4pGoyw3CUt5eJq
 84xozDcbK+LhYBYKWNFu6FGa6c2m9wKTxVQ34mZXjOgqlqxD6L0oPGI3641zt0V0le+DQUTsE1L
 7jN7f1wPUhvWXxfzRmI9umqAppGrIUBWxuSksNuxno2QOthVbzje5G9A+iUsqYUIOOpgOROhU8G
 nBzlj9/JzNECTEPoxov2avw7F1N9d7D/iTmKcKYLhC6fdJv9INFtjGP6iEWJRZBXuFAnW5bLACb
 6aj7qpzXERY14vU1YghjwfjdGnNo+7YccUj79qaOdWidC3sadQ0ykyAlX6eqMVNz3occ8lb1qgt
 h+ZxkZWf
X-Proofpoint-ORIG-GUID: RX19fZQ8_EovVIeqZntWodbGZeQblkMl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_235824_931208_4ADA32A9 
X-CRM114-Status: GOOD (  17.07  )
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

This patch adds runtime power management support for platform-based
CoreSight Interconnect TNOC (ITNOC) devices. It introduces suspend and
resume callbacks to manage the APB clock (`pclk`) during device runtime
transitions.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 5be882300d79bc0173aa6a19d7da1d48c4aaca9c..2c5370497076536bfa868f0d80db775ef242968b 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -301,6 +301,28 @@ static void itnoc_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+#ifdef CONFIG_PM
+static int itnoc_runtime_suspend(struct device *dev)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(drvdata->pclk);
+
+	return 0;
+}
+
+static int itnoc_runtime_resume(struct device *dev)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(drvdata->pclk);
+}
+#endif
+
+static const struct dev_pm_ops itnoc_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(itnoc_runtime_suspend, itnoc_runtime_resume, NULL)
+};
+
 static const struct of_device_id itnoc_of_match[] = {
 	{ .compatible = "qcom,coresight-itnoc" },
 	{}
@@ -314,6 +336,7 @@ static struct platform_driver itnoc_driver = {
 		.name = "coresight-itnoc",
 		.of_match_table = itnoc_of_match,
 		.suppress_bind_attrs = true,
+		.pm = &itnoc_dev_pm_ops,
 	},
 };
 

-- 
2.34.1


