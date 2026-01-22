Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DCED2ED14
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 02:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrMZyOpw/ZRelpfuA7qROurtddaj0sg5lOXpksKz24E=; b=GGrFq6wPkVNXZp61XB/lscpm+4
	trXCNnQEtDKQvhcVbHJG8/JjJfpYTiSdr/eTpaNwxHQQwj5ndxDtcl8kkQmmsSPChCZYm8+PPqbUY
	eyKfl6MvoyxYFxJlzdZdh6QLAD6lHmoKlKLJqVTz39AUBvOfyeLM18nolk7hC6ErnE6gC77RzFuBO
	LstP1M+mR80AQYRILAMYvUpTtYL/pDmX6L8XCZzyQDlJ6yO3qABEkchItgqTuLhOJ968T2/R6Xvua
	sWLhURU/0AEylYaMTvJ1WmZ0m1zrqeX4k+7XkUme/tmCqBOpB1wACDXLd/2wdPuepKZyNz72GnVp/
	df9iGt8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vik86-00000006IoL-23x1;
	Thu, 22 Jan 2026 02:09:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vik83-00000006ImF-2O11
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 02:09:00 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LMUBhU4057305
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lrMZyOpw/ZRelpfuA7qROurtddaj0sg5lOXpksKz24E=; b=GNSVCC1Ga7J8TSot
	zNDR0RW+ICcJAGgI9B9Ri99awN6nVDURWz1RpPbNTcLaTUnn3JYPU1e4ZjW5DPuJ
	Qe2E6c8Rqb0ECwElqOW53gLg0NHSn2Y48NIAsVO4R0D4ZFSSZvAFjjNPbGQMs3UH
	I9xQVI3CLR7648IqVHZt2+RJHxYCB/fz/rIxQsiKnAusRbApB7l/ltjD0AQsySG+
	CEJQFTFyKhXrC33C0m0iv2VxlAdAT+cOuwK8xts6t3530jl0oPRzeWD+gM5Dr1em
	+bx3E0cYlhzgEvdTNg7CmGbqhIWX1DGxg8DfQRrvWdhJG+yi+3oltUN9r6kd9sL2
	49s1aw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7nbrg8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:08:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0f47c0e60so8832885ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 18:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769047737; x=1769652537; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrMZyOpw/ZRelpfuA7qROurtddaj0sg5lOXpksKz24E=;
        b=agoBvIbrQ/Ua8PaugHlfhOXfkaLYzD0w0IudEHfeqyQeAIUsFpz050N2XpRHIFDQZQ
         Lq/qnHSlcghwTL/BByCZMAFNjGu4uViVK2wS9x4F48/J36Hj/qjWP93T8QdtLMvFTRhu
         KXneHfCIneZz3sE8wuQM8QzYp3X3tl9+5EMhWpKkv3gESvgaG/hltkMuVU8wLa2LI2uz
         miQS/AA4mODFKX46QkrSWNYaNamJd4RotE0UkxFl/zdCzUNuyysXshhTNEmeZd2db4Nm
         oycyCEXUtAra2tFISLOHoPgbWguHiuS611sWOLVXCb57qNTvQ1MEAaJs4uwWVUyLQsh3
         uJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769047737; x=1769652537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lrMZyOpw/ZRelpfuA7qROurtddaj0sg5lOXpksKz24E=;
        b=SsDbcO6bIExkYPfSvhP6DZnZwZuVI+/va38wthaDTefWHorTDiFo7G2sJhKjcyangZ
         pQxsQAvLvUysp0pjLb6M2XP6+q6edv53J6ca1oc5AJAjKDMrEgZyHBqdjoWzduNbwZUM
         +TE33YtVpoDP8JA5kRkvF9+dw/tfAcex0kSELd7okG61LCFZZ0gGZIyXhFDyEfgv3WLP
         m9ggAMfaRTzAC6StPHvtbjBIv+Lfz0HUaE/vR5+FAcGnP3ln5QF6PNpCNAk1X2y0eydx
         99euxjw7pzRD3aYU7weiKcmaTPkdvC3zuDwkS3wRo1XuJKZmXiLgbCmWMTrUpLtSLY7Q
         HDIg==
X-Forwarded-Encrypted: i=1; AJvYcCVWL1u0+ntQvKVlDhIgrJmSBknhJItuQpQLb6ZF3PZoGhiXE9avSU2XnpQ0w6slHpXZBFgfX0vzqPA40HCAFYP9@lists.infradead.org
X-Gm-Message-State: AOJu0YyTep/ZBpMP/SHSYZJNs2w4KJ3bRL67sP/eKz68raUrWVYdIYAH
	veCbk50F+p1gwY2aNepqs+UczZk89ARpY8ipK8hJiNEVFWWxSrZriGuG2XS1fnMG6BcfvltAoZy
	gc3I2X/lCmO4SsE+nljKn2VgAKpUQB0TQjNtUOn06wgrZivbGhmcGx47+I7MjJADsBnFJ3RfA/M
	RAUQ==
X-Gm-Gg: AZuq6aLjp7qH5R2m0bd2zDJ+X0Ejo9pKjZUiUnmCvJlYmyhF7wt18qojwizUdK8A8Ba
	fJUswx5qdIFO1CsI2dn0+hzr/Y7V/+SIUMK1nrMHCcOXY+Xk7EDwffMq2ADE5PgzFXlAJr6JpSW
	QCA8gx83Fl73txo5QFvNT4zfJqEcJmfCKzHKCJr79zA8Z3Snzr09jPX5u9+LHs+SSaeWREor8OT
	LXrIzmM610sFhass+POoRUIlrXyjdSLa/qJomPKHNpiQr/jXHA38RxSNHFtGNCTpx2HplYz9jTm
	sjffcAQwitV1sT364VeyqoajiXmzZrs023D0h23aReC5gMaDDs6w5ak0G8stc6iD1D0OOg/oI6H
	Ry8qCMFwDjOUSWlN1qgVUtvm2GLvkeGukMzygMCXWHeWgjzL6jfiKVimpvpoIASz1hVHFYWvd
X-Received: by 2002:a17:902:e74c:b0:2a0:97d2:a25d with SMTP id d9443c01a7336-2a717516415mr181775605ad.15.1769047737444;
        Wed, 21 Jan 2026 18:08:57 -0800 (PST)
X-Received: by 2002:a17:902:e74c:b0:2a0:97d2:a25d with SMTP id d9443c01a7336-2a717516415mr181775235ad.15.1769047736896;
        Wed, 21 Jan 2026 18:08:56 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a780a4631csm49710305ad.18.2026.01.21.18.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 18:08:56 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 10:08:16 +0800
Subject: [PATCH v10 3/8] coresight: tmc: Introduce sysfs_read_ops to wrap
 sysfs read operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-enable-byte-cntr-for-ctcu-v10-3-22978e3c169f@oss.qualcomm.com>
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
In-Reply-To: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769047715; l=5450;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=adb+NstK0OrGdQHboby6lmZs7rWs2zBc775hVSg6Ay8=;
 b=rf8eEkX6xeEuQxudEYmOmXgRoN92u1XmNwp5u00r7XMrpm6LzyuxgLLZ8Lo+mYOuaJZKZBuJH
 /WrVbjKjsbFClTLEWHl+Ay3vgW9n4BYJjwh4rGYY6dPKEpVTDE58045
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: XsePJn9r_hbkpRfvculxHaKXzwieEpAA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAxNSBTYWx0ZWRfX1BgonR40jRWz
 IqQstOZPbYw74y0msXxNR6TlSYVuni2Q3x7snm2gOEF5roR7GaCsopBWOSdfemom48WF1Rp5J9t
 dY7w83SFvVF3HUtaPaC4+tiXHIWTfrPevN3SR6XcGSDVvkmG7gw90JowZ7SQpDqbsqCEPUlrAmy
 FA5LR4xkrUV2TXRkrpE2pF7sw5fbKpSts1XlBclvJ8uTwqsxIMOTbyeCASaept5SxeisryScGBN
 yfm1g60Z1bNAEPFk9/hlF3EHFo2Q61K5XspYDvPlysVrl4T6WUfntdFGaEjoLdUe+hR5ttAtohg
 /gc5ZTa0Dvb0LV+0/eoVf8H02VKzi/ARUw0vCcyu21f51IWtsFEiOzfMcw5R4kaWZlolKgKedO6
 PXS71NdSEE2sWfg5nla6VM6hLDFtuN8sb2btxbyMtxl8T1xteMJ1l21HGvSE/b5kDikZKrsHxc0
 JwDENwwI5zivct9OrAg==
X-Authority-Analysis: v=2.4 cv=dZGNHHXe c=1 sm=1 tr=0 ts=697186ba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=JzqEjpkVlBH90HjAhVoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XsePJn9r_hbkpRfvculxHaKXzwieEpAA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_180859_731202_C9D32742 
X-CRM114-Status: GOOD (  19.60  )
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

Introduce sysfs_read_ops as a wrapper, wrap sysfs read operations, for reading
trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 50 +++++++++++-------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 17 ++++++++
 2 files changed, 40 insertions(+), 27 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 1ea255ffa67c..8b0397a77e57 100644
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
@@ -291,13 +277,8 @@ static int tmc_open(struct inode *inode, struct file *file)
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
+	if (drvdata->sysfs_ops)
+		return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 
 	return -EINVAL;
 }
@@ -769,6 +750,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct sysfs_read_ops tmc_etb_sysfs_read_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct sysfs_read_ops tmc_etr_sysfs_read_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -828,6 +821,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = &etb_devs;
+		drvdata->sysfs_ops = &tmc_etb_sysfs_read_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -841,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
+		drvdata->sysfs_ops = &tmc_etr_sysfs_read_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
@@ -849,6 +844,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = &etf_devs;
+		drvdata->sysfs_ops = &tmc_etb_sysfs_read_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 9b3c4e6f0a5e..c9a82ff6cd00 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -221,6 +221,8 @@ struct etr_buf_node {
 	struct list_head	node;
 };
 
+struct sysfs_read_ops;
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @atclk:	optional clock for the core parts of the TMC.
@@ -258,6 +260,7 @@ struct etr_buf_node {
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
  * @reading_node: Available buffer_node for byte-cntr reading.
+ * @sysfs_ops:	Read operations for sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -290,6 +293,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
 	struct etr_buf_node     *reading_node;
+	const struct sysfs_read_ops	*sysfs_ops;
+};
+
+/**
+ * struct sysfs_read_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct sysfs_read_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1


