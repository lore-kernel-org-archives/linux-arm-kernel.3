Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E817E98DEC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 06:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLBqq1Ga3quq8yhCCoDLuhaEl8VPL3r4ILjvN9DeBME=; b=brqQDcQ9o//FGrwGottj+nVi9g
	krFpnTFr3m/SfybTwdZ/94xjXt8GFc1yEv7Lu6dmp9Bj0sFid+MwJOeFq6JF+zTiBVYf1Omhe6SHA
	Uhtxu8Jfx1TNSafNHpOLni7Knrh2PLEecQetMjejrNnVGqYvXsHuhFZh0Ob5Iy+FpbQHE1paKeT4Z
	UQ2Jnu7yAQe+s9/SRFgGPzbFdJcA1v/qoOj6juVc6ArBtfAV4jFD0zpHIGZMKWwDN9KnxNZwggcxc
	2Emm/hyuIzkwUHaZV7BYKHXLdPlTgfHuhrU0gpf+JV/KauN28wIvHuswbQirQfQnHHpb2WAWUSvm/
	6FcrK6pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPh2-0000000HJBT-3lKG;
	Mon, 23 Feb 2026 06:45:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPh0-0000000HJAA-0XtH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 06:45:19 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNb2NB3378176
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLBqq1Ga3quq8yhCCoDLuhaEl8VPL3r4ILjvN9DeBME=; b=mhGmyFwvDVVEi/7Q
	AgewNAIbJw7C1+2DMq+kuog2SX1rLWtDTsD4DOnIHEK72ZvDFr9dSwJn0srVCjmm
	ZroJWtCNG8gKFpFJ5wG/9HEpyAND4aa2uLLaoPkuabEDOVyi1HES9xxppgcQZQxE
	s2AVdSsfjSO4payuZg+gJ27NNya6VTB/y0xdQlpHfFXfJXrikhY1G5X3mx1Fbyh3
	hJxC1VgdPSK3yM6IikY9sTQIl9JeIMojQctH3udksoI02//IgQ3G8XIkV3qlbnya
	7nfsEkjl1JMaX7377vf5ej9dCE6W88j/oN8alEH1LvWz/omp1WKmeOziAO4uje94
	dmn2eQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wk3n31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:45:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354bc535546so4303072a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 22:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829117; x=1772433917; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLBqq1Ga3quq8yhCCoDLuhaEl8VPL3r4ILjvN9DeBME=;
        b=TzfJwmcM2U4vMAV/ZJQLGYv1flFnjfLx1rnqrb5k/uvHSgT8iofTreQogkkVc8vEqJ
         Yygsp3ZZntWkz5NZdBJ3atQbU/16urmvBXAYjpF3ZTeKFQYtvJcbvB31yyed0cXPyIr2
         Nr9ERNMramEmSxO7Wa3aPDMMEep2wW4wqjWK/54mMOWFvRXlDmWhFElq1PO7IqCZeOcO
         uukmfyM8zSSrNy7gJi9KdvdJmnK21Sl8vvrhwdHBk66ZSwhejp9W0gMiiQ7uiGsetFVI
         qBwLs2iEKFulXuE7IefB6FNTSl89mYLH+tHh3pF4VlGxOkoq2clyEUSW0zJQO5hgdy0F
         PH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829117; x=1772433917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oLBqq1Ga3quq8yhCCoDLuhaEl8VPL3r4ILjvN9DeBME=;
        b=BbU1LSoLW6bhxlwX2k8koXRzDX50n4mBLfecX4u6cn9b8nMLXqxuvCqk9Tro4MNnPh
         WWqYQ/+czsueBOWBAc/jKT01toZ0kIYCAqP8UF0d1SmdjG/P6FI499AsbbOgQNpqv9mI
         m+KdQEGrsB7BeQaqUORFw34aPIIj7Ek57h0LkF02lWcjVOBDXFOWiY7MldZOKSrpibnX
         H/3XYlfY+0uBlXlLoP7KOtsvP0CpLzK6dfmuUYqqnYFzOooiGSJD93VsJW7xm8UTTmh2
         NP1GZQ/i7x7vTD9lV4Uao1AmIfj2a3kxvmn92eSo078ueF/6Lrj9zqKrXtsEB51F6Z+i
         R+mw==
X-Forwarded-Encrypted: i=1; AJvYcCW2VO2yAcW++Wvwl2Bzo/FI4RG4RiJ+l2i9SSCMwmhAVDS2UJRDi9GduwjxMpJkVEC+VLw5z4l7KVlREWcvF+ZZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzIh8WTJmSeAocCpA5Qe9T6jQcjY00XgUV3qShPJS1RJwIMgrna
	Ia4XggmqYZtbJ0e04DHf0YvPanE7GAtosrjA8rq8F0tJeDiBBUGzmuMprEsias4xB6jkoTyGz6D
	lI8U6ZpnE/d+2chnHXy3k41hWjdyR3T8OtjU91nmtThUymWMLLpR8ljPwprg8oeGmmDqqYCl56w
	xaAg==
X-Gm-Gg: AZuq6aLZ8mkGUBpIJqoKX4bBbaYHwlRN6OSwpwPHpBUH3fNT2Fb5I6HTlMBl8rx7cVT
	KSl+lk7dQtcib+U+mLnQBHBv9U0KlUnn1l9rLAB6oYckoua/8WuLoLQRkdNaIMcuBVntkJt5oxk
	R9MvNg+G+ICzqt2eks7cziboOA3NO4c0EWTvU2qci2ngqRNFo4eDcDF+FfRt0edNw+n52gs57gC
	oF+/syUI/a5ZG1Vzt5JgKBRAOhso+aBYv6IXKcBCY61kd1noqF+Eujbvyw4gGwGxOPtvz7Ma9RP
	u0qcLSIrTU1LrBo+nY45dcjduwJYl2VZr0u/WFZJ+UzJjMvr0KnZwfudMlQNVAKrIamDGQGd7gG
	Keql7P3JWkaNRK04EoDgvNoLkDZXEntUC+KiO01yEaRvrCKaF41SW/EJemjsexesfJgYmWYqoLc
	afOzw7WSxMjJne
X-Received: by 2002:a05:6a20:958e:b0:38b:e9eb:b12b with SMTP id adf61e73a8af0-39545f5619bmr6143369637.41.1771829116904;
        Sun, 22 Feb 2026 22:45:16 -0800 (PST)
X-Received: by 2002:a05:6a20:958e:b0:38b:e9eb:b12b with SMTP id adf61e73a8af0-39545f5619bmr6143347637.41.1771829116409;
        Sun, 22 Feb 2026 22:45:16 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71839d6sm6483993a12.6.2026.02.22.22.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:45:16 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:44:39 +0800
Subject: [PATCH 3/8] coresight: tmc: Introduce tmc_sysfs_ops to wrap sysfs
 read operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v1-3-042fb35bd37e@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829096; l=5212;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=wH5nsU/eD/1ygNqCsVaoWKHsLxpu0A62Fho+0L9SEqE=;
 b=/Ol5kPXNRuyJ8aJ1B7Rj8Vw2iXt3pEy61jXNtUqmXNvS31VweILr/0p2h37cdoRqTQekIAjUV
 rSAmP6UDBNHA4nLOVAzsdsz+bUgp5Md1LtWq/TO8oHVt2/H4L16pMoQ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=699bf77d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OCBTYWx0ZWRfX1/unZ6iZ9Oqq
 Lpa3Kr3b0I3LiiFuOfVh2cIX7Ufld1pnhDp4maKuxDvB/gzwY47+X+c7dhnl0W6S524I11aVCwB
 e5qtGorLL5lpVQAEqayQ7IE1qjIVGlSSaCaT1TABiwmZ57LnMpMoB/gVvcUbooU0p8yZJ/cP072
 Uy8zVdux9tbQLjm2OmkXFPFs9ch1+1SbkSE5HuQpPQ2yL0I+kWloHrORIAiYhpYGslfT+5y4nWo
 HkWPTU22LEm68cOO85OZMqPA3K9iWatV2tAvsn54nwyXZs3o8/jOS2w99AKgbwNFe3lpyxSv3Ga
 1ZOdafu3zHvbdGps0Vhn+Y/djhzGccAUOAIQMLG1XmsBeHuHdwTQb4Gfyz/9LbN8hg7mjFtoxkA
 aSFsarAVa07MrRkKwN/pFcoP3C9ay/71ltHgPjKjgwKz5oZkxQ14ziBIchlLpQQISywt+im5iAA
 yE2cpRUz9orkmcMtSQA==
X-Proofpoint-ORIG-GUID: Fa1g8dSG74lIA1g86cidvC4Zt1teGfOs
X-Proofpoint-GUID: Fa1g8dSG74lIA1g86cidvC4Zt1teGfOs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_224518_184928_5ECAB350 
X-CRM114-Status: GOOD (  17.25  )
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

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations, for reading
trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 1ea255ffa67c..32ca2ec994de 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -232,17 +232,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_prepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_prepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
@@ -254,17 +247,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_unprepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
@@ -291,15 +277,7 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
-	case TMC_CONFIG_TYPE_ETR:
-		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
-	}
-
-	return -EINVAL;
+	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
 static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
@@ -769,6 +747,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct tmc_sysfs_ops etb_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct tmc_sysfs_ops etr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -828,6 +818,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = &etb_devs;
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -841,6 +832,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
@@ -849,6 +841,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = &etf_devs;
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 57d8394d09b7..92ffaf771fea 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -260,6 +260,7 @@ struct etr_buf_node {
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
  * @reading_node: Available buffer_node for byte-cntr reading.
+ * @sysfs_ops:	Read operations for sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -292,6 +293,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
 	struct etr_buf_node     *reading_node;
+	const struct tmc_sysfs_ops	*sysfs_ops;
+};
+
+/**
+ * struct tmc_sysfs_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct tmc_sysfs_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1


