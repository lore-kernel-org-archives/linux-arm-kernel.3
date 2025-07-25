Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55E3C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 10:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jk8rhw+3ezlHXU/LdBbPr3lAiametlPEc9i/J7FBJU8=; b=BScfKM6/bOe4evuOTm9/8PEGbH
	iRglZtp7DVm4Bodql5njRHYOqOOcBy8TrRfQZdQulQWtDvmMt21v9acgbEl5CQkWOv3jLb4KZjV0h
	7ZufpocgXDf9MIlXOt8I8KWMhVZeGyT/vMBMmRX+RldOoBAoFXOU8ClD7h8Y76512PkaxssXhlqWl
	EACQXJPek5BSf6fKke749xGTC1+cQwwod/acBo3zUijGZ2f+8UNjMpVfvIrNMlAL0WE/XHHS6bx/2
	+pMVAc1nHGkGtJ4d9fb3PAZJaMqen/8/khfqA72bdv0q8BpILfY6HHdYcI/W564of686lrzR91Zfd
	ouZLVtRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufG7O-00000009eGe-2DSO;
	Fri, 25 Jul 2025 10:57:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFM7-00000009XHh-3BJg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 10:08:48 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P8imt7015446
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 10:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Jk8rhw+3ezl
	HXU/LdBbPr3lAiametlPEc9i/J7FBJU8=; b=bBzw9wCZ5NqJoAECm4nP3vriVoh
	FhHVfkiVdp59Bve/WNVOQmffD86zONT7Ce7u2k+aiBhxYjRYwnT3pgTpPIGzEYRN
	t9GJ0TcOxyp7T1VXHpOKrRZLJ0IoFBAcCy4tQLIfqgBt5wTR+lWH1mhmDGO11vaz
	2i7f4kbeccqykw7XWA+903UQ6eWyYmHwVWWlMWgE9PjMNwUryCJvpX6lVTIhMfuJ
	BvX4F3Y7G7hYWPO+Qd3+zF/xjOzROcilHxK1xtAw4qrkQ/EySJVCVXcJ3yUaApZl
	YzEFAkJFLsTPVX+IJ21wkOmVA6DYCaYG5Kd1uLSs686CYJrOskd29TVnwIg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2qhpk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 10:08:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235c897d378so21887505ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 03:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438116; x=1754042916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jk8rhw+3ezlHXU/LdBbPr3lAiametlPEc9i/J7FBJU8=;
        b=LmmM28IKjgreJAcVstEN3BxOUN6pw+EFfAadyl1J6VW75HSCOmSwM7RQA+gM12XhAM
         If5NuXUbM9bwG/omBwbl65nV3//x+Kr7dy41I7qvIQIHP/Nz8jmBRxRPayD8bsLCZU+3
         KOYDNaclK7I8RxCfQSyiBHY64yRz723+c20aL5zznjEPfsJE3qW8g1dT/kRpyYnkGzgM
         OC2qWSCfzpy4239RVCiKdX2SPyag9DpHxmNGh0NxBB3tbyOvxPP+3FjQBjVL1O02Zu1A
         JC/lfsks6IWFfFL6eKukFwtnP4JEMHxvse0pbGeJuym5cVIvad6rpScNnTCnMTg4iIGR
         dpCg==
X-Forwarded-Encrypted: i=1; AJvYcCUuTumbxnumOqYtdRBO7YWIuRvRj/Ckteb2+slqqKj6xMWYb+fXXyALswo36G6p1HhcTEHfniGGd9BXbOU2IZd4@lists.infradead.org
X-Gm-Message-State: AOJu0YzS4uVevRLuysqvfhAkTPnujuWIi61h4eTND/W3K61mxw4gD2Yu
	dEYmUlqkVW33FMz52pdWmEJMUHrNgL3lizWCyDK2ldarTkbkrdskzGJPBwgYfJKqP1K2GcTKHii
	UW2VJ9DFaaPfuIsxMjm+O6xk8gs30+yqicUZzcoQUcMRmh+f5Th5tr4DlX33VtwXVgtGXzM1hpJ
	Wx3w==
X-Gm-Gg: ASbGnctyqc4DWeIbsyEPFhBXQ66TdONOmmdPs3hwi/XLIivkI6bRiHeky0HHWBIvhlS
	bnhqjKKP6VvzghowF9RPQAYnXmMAwswyKSWQrcQWrp10/oE3PEuJw/TBDF5ibIYJIMcB4+nnTyj
	HlYWwelm5QnQvNqwokNFCQ7NbUfc/HFWf6dVxL2T9OloLGSDvz3bijvkoYscztqWJVvKXsCjnts
	X1YPPwlSm4EgfMrRQUmcaCM05Dtydw+nT06WDJdNLjh3Sz57ViYiOPOE7L+xmJzXwNlcmDKelem
	MR/a6XhJRMOmafURfumlumMFwgNNZlrBR5YJuVseGk4G6ByExBkDa7CRjWpPTbqLkk2DT4EZ+Fo
	kGJE3BEPZM0fd+uo75iM=
X-Received: by 2002:a17:903:181:b0:234:d679:72e3 with SMTP id d9443c01a7336-23fb3100766mr20201445ad.42.1753438116151;
        Fri, 25 Jul 2025 03:08:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGs0H0KGXgka7RDhfyUl5zCfbbvzjg0Kqg2pI0R60Jp3ieS0GcT2u8RGVpplg5Z8ydKHN+mw==
X-Received: by 2002:a17:903:181:b0:234:d679:72e3 with SMTP id d9443c01a7336-23fb3100766mr20200975ad.42.1753438115670;
        Fri, 25 Jul 2025 03:08:35 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48fd29dsm33641435ad.176.2025.07.25.03.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:08:35 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>
Subject: [PATCH v4 05/10] coresight: tmc: Introduce tmc_read_ops to wrap read operations
Date: Fri, 25 Jul 2025 18:08:01 +0800
Message-Id: <20250725100806.1157-6-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RbqQC0tv c=1 sm=1 tr=0 ts=688357af cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=1hiE41pZ4Zj50arX-_gA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4NiBTYWx0ZWRfX/Rtvt0c5WT7F
 KiXF14RKl5T6k2TfMEVhGRPrujfq7LYGhOZsCjk05WYhhGwNyLHg0n5qbiaal31eTEmFpV0/fjt
 w6DXWvct+voy2pbxD0cfHka8BwUSnvO9GjNgduc5N6hPyxEFuPY9+TEskDUpFxBj7prV8LRgjga
 /AFv8Gi01owZGZCOnoSZG3RHjLegDpONhUY9b980gTGLj/FrhZvAHifn2G5AI6bXoUK05fH0T6e
 jdrN9sxBFQPHKQBgnZl/PzkTC8eJe1CizYxKKgm7bkY5FDfyPdnYNGkz3eL1IHgzdemyH8KyaDm
 Zo4cqrENBC89AvrL0225sr1Y1N2L5ki70LVcmUhaZ9/vjm2U0pCDyS0UOAEE7n/yH09C0SSmTdw
 lx+IfzaRwiJPSS1sEe3KSnxDy3DcnL8rWNIgHre3C2uMyarwpDCMk1hp+FXwsb1FfiHRgErK
X-Proofpoint-GUID: Ffi2-L4NcxlHSh52xTfGm9ETomwk7A3Y
X-Proofpoint-ORIG-GUID: Ffi2-L4NcxlHSh52xTfGm9ETomwk7A3Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_030847_816074_AE7B1CBA 
X-CRM114-Status: GOOD (  18.38  )
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

Introduce tmc_read_ops as a wrapper, wrap read operations, for reading
trace data from the TMC buffer.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  | 50 +++++++++----------
 drivers/hwtracing/coresight/coresight-tmc.h   | 17 +++++++
 2 files changed, 40 insertions(+), 27 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 4d249af93097..f668047c5df4 100644
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
+	if (drvdata->read_ops)
+		ret = drvdata->read_ops->read_prepare(drvdata);
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
+	if (drvdata->read_ops)
+		ret = drvdata->read_ops->read_unprepare(drvdata);
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
+	if (drvdata->read_ops)
+		return drvdata->read_ops->get_trace_data(drvdata, pos, len, bufpp);
 
 	return -EINVAL;
 }
@@ -769,6 +750,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct tmc_read_ops tmc_etb_read_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct tmc_read_ops tmc_etr_read_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -818,6 +811,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = &etb_devs;
+		drvdata->read_ops = &tmc_etb_read_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -831,6 +825,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
+		drvdata->read_ops = &tmc_etr_read_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
@@ -839,6 +834,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = &etf_devs;
+		drvdata->read_ops = &tmc_etb_read_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 3cb8ba9f88f5..2ad8e288c94b 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -223,6 +223,8 @@ struct etr_buf_node {
 	struct list_head	node;
 };
 
+struct tmc_read_ops;
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @pclk:	APB clock if present, otherwise NULL
@@ -259,6 +261,7 @@ struct etr_buf_node {
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
  * @reading_node: Available buffer for byte-cntr reading.
+ * @tmc_read_ops: Read operations for TMC device.
  */
 struct tmc_drvdata {
 	struct clk		*pclk;
@@ -290,6 +293,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
 	struct etr_buf_node     *reading_node;
+	const struct tmc_read_ops	*read_ops;
+};
+
+/**
+ * struct tmc_read_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct tmc_read_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {
-- 
2.34.1


