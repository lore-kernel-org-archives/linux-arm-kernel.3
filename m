Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E154C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 11:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhH78wvVJnetmIHm7XhAnpQBOngftYw35LXwtkDO8nI=; b=Kv7wSAzsGwbCs48S6osiJxdv0G
	5BgZvhJsC2DBSAhq7DNpeBCR70RGt2la2T7GBjbwSrR+silBEqwstYVH9KigXjPjH1a7IGmssNM+W
	M2lwVhwXEAiDiEKebLbHlTGd7Wfjwvd+zBKe7XpkK8Q2RiOuCgZGTsqFLrpSO0uUmn6jEv5oo0IMg
	kyuvXcnCBx1Tg3XgzM3v5tdJx18CdAF7fr9ivAEaeLyNQSV6kkJ3aua+SYpAqrL/CKBoqjT+pifC4
	iMG8r3Lc7Pn2JoPLUVrWjtcIA7xpxNE01QPk5GZd7vLzePbPGZKbZD9itHnE1/639xPWCEM2tDAAR
	QRXxld7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGEi-00000009fLb-0V4s;
	Fri, 25 Jul 2025 11:05:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFMH-00000009XLV-0zU2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 10:08:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P8SWlp018081
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 10:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DhH78wvVJne
	tmIHm7XhAnpQBOngftYw35LXwtkDO8nI=; b=dDGqPA264qfjWe05++5irJPMsf7
	/7H0+Xmci3J3XTMBFvqsFXljfhVWyOdvyhJ0WLZbQ0Qoq58CHXIJUu1mtlBI5TJA
	TkZIgX3fqVQencKXO9IvnkLswiwohQc8O5eEq9R6Ax8VYQdllqh4Bs+dQ0mOnijY
	My3IBJgTXwOSYDOvHwrTMU2e9Ivh3zqAVoqZ6xFAhPHQBaFH6oW2m7GTYwKiUS7G
	R+8RU7IEEhtn/ove6BE9cySDHd3Os96zPVB+NokU5+u/loxQh8Y2eo4PUzhOYYOq
	91rZEUeuDandHHsZJZZaHNzEZUAMNx4Uy7c60lIJYZ1j1hnSXOn/Qrv+C8w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2s1np2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 10:08:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b3f2e05fb78so1526904a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 03:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438135; x=1754042935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhH78wvVJnetmIHm7XhAnpQBOngftYw35LXwtkDO8nI=;
        b=SP1UzmuO4sebUFdAKPlYocNNNqpac13biXJVHqOR4c08s7JxRNmq47FWYCNPWp/TC8
         kw/U5WGgFFFaeIBGYVjA9WAYTcoYV3ycIy6ZnbQ29rIc9PNT1xi68soRu1/5uocTmHE+
         YZDIq4hnSyHHNhQGNUqMF1qQr+9jg3c9WF9cYlsUhC0p5aRl0lnXxQqrLRue4mfpOklD
         mT1Gxhv/P4vfyZpNvxXUaXtBHMU+9wwPqWAvzHXohxc6zb7+3XBYqsHE54+52IDPMPEC
         kwiKdImDhzcFJDvkhXa2kolP9KHRSCzWOzbVABMf1bArj/JmftzkLnw45prbwb97DYp6
         icRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5TfPVuK/DAWJoNQqCmD64Vv22m4o9z4i4ET9xSWkCphejkEIox+4y8zP0/GSB0VN/dz5DiC8Rbuekd8x8Wv+J@lists.infradead.org
X-Gm-Message-State: AOJu0YyCm46BXutCqkjPlEcDXrHPUMB++dHE5t6KtFZobjHEKK+Ah/Ti
	qvIwIaT8W218x0CgfEiWtp4PmVYcrPo8a6GtrN9Clh18Al6VBfo+TcBG2moVs8LZ4ojExXJLpCP
	WT5hQGErDE42cUrmGsvhIBtbiHGcxRL/ENM2b7tYb9xdrWukRDdL2fj+VP5xxLqEX9GyQP0Ly8s
	TVbA==
X-Gm-Gg: ASbGnctSzoeWSvJTpLUSmPrQSlidFVrCvoYWAFxzHrkSW4lVF4mg20lX4DP6zvhWM2m
	pVg/4aBMfhVJFKg/L2Sk21aARPeSrYa1sFd/sRuIHrEAwMIM0lshTE9v1iuSB0SY6VUq2K53Mt/
	it9raGPo+fIjnTvgodyn+mANOwpZRTLQI3Agp7BQF5tg6DFyLLZQ0olrlZPO6IEhhj9KsbPyeBt
	Tc9AHe0TlE589YRZ1vT0yaT97awjyAVFBCRwMqEGNkPmnh/AqrtlOb2eu7t3bp4nk5yARhcA6Wh
	XzGBDbuS5Z0B+qmm5e+8WVM3JrhtmSdsmoa2jlcd+aOjgmozCLL5kPb/IbcmXef1giPJqrW8tgr
	1EUMu33+xSZobxY7Pp1g=
X-Received: by 2002:a17:902:da48:b0:237:ec18:ead7 with SMTP id d9443c01a7336-23fb31252c5mr25667025ad.24.1753438134640;
        Fri, 25 Jul 2025 03:08:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFemnJCAQcuNiBKQLUNas6+SmLXLoOyi8PGRh2U3ofwYuo4JSUJBC494RK9BYtmkiq21Zv5ig==
X-Received: by 2002:a17:902:da48:b0:237:ec18:ead7 with SMTP id d9443c01a7336-23fb31252c5mr25666385ad.24.1753438134050;
        Fri, 25 Jul 2025 03:08:54 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48fd29dsm33641435ad.176.2025.07.25.03.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:08:53 -0700 (PDT)
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
Subject: [PATCH v4 09/10] coresight: tmc: integrate byte-cntr's read_ops with sysfs file_ops
Date: Fri, 25 Jul 2025 18:08:05 +0800
Message-Id: <20250725100806.1157-10-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5TWyHmZJ9TCFBsVE97qbyPC5eOFNEGPt
X-Authority-Analysis: v=2.4 cv=IZyHWXqa c=1 sm=1 tr=0 ts=688357b8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Zpm-vmsZ5HaS-asNi4kA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 5TWyHmZJ9TCFBsVE97qbyPC5eOFNEGPt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4NSBTYWx0ZWRfX10KRAqj3v+kY
 aWHqgOvAPOunPgKKyapA23rWI2bsE/FzJAcWNQC3EmXNFGD+i82l7TaMJ9gcMJGlwANNI8IANfJ
 4d1jXlczslp652dC89tSE3NeU5lRu8RtsyM/km3e+2WeZW+QpmF7SmNqzhhO5rKk9fjhHSN0UYD
 FjWT8OTG6rDiCMX5FC2AizXdN4UtDmWDZDdEyVfBOILJNci4BakBnPhsr7L6U8keGOd6sNHWF4y
 GLRsOCSQ8vJNKcAmPKTGbBL34cnwj++X+6na6wsMpxme7B3osJEahdbE5k+llXbNWRUcOIX3598
 QNg5nKpENqs61oP1PRwMK/HoUuMweSCJ2kaSIR/+4T9xLnPQfHuRZzvJiBoAO/uMtLddG+ci0Zq
 Yn9E5pEAW/YVvz8q12DJWj/RYMcUFNM3p8++1MFTkXVML8WBWGPk6RkrdA44N4+nF/JYLDtV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_030857_404793_35854FFD 
X-CRM114-Status: GOOD (  17.36  )
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

Add code logic to invoke byte-cntr's read_ops if the byte-cntr
is enabled.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  | 48 ++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index f668047c5df4..671ae4542f6a 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -228,15 +228,41 @@ static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
 	return 0;
 }
 
+static const struct tmc_read_ops *tmc_qcom_byte_cntr_in_use(struct tmc_drvdata *drvdata,
+							    bool *in_use)
+{
+	struct tmc_read_ops *byte_cntr_read_ops;
+	struct coresight_device *helper;
+
+	helper = coresight_get_helper(drvdata->csdev, CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	if (helper)
+		*in_use = helper_ops(helper)->qcom_byte_cntr_in_use(drvdata->csdev,
+								    (void **)&byte_cntr_read_ops);
+
+	if (*in_use)
+		return byte_cntr_read_ops;
+
+	return NULL;
+}
+
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
+	const struct tmc_read_ops *byte_cntr_read_ops;
+	bool in_use = false;
 	int ret = 0;
 
+	byte_cntr_read_ops = tmc_qcom_byte_cntr_in_use(drvdata, &in_use);
+	if (in_use) {
+		ret = byte_cntr_read_ops->read_prepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->read_ops)
 		ret = drvdata->read_ops->read_prepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
 
@@ -245,13 +271,22 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 
 static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
+	const struct tmc_read_ops *byte_cntr_read_ops;
+	bool in_use = false;
 	int ret = 0;
 
+	byte_cntr_read_ops = tmc_qcom_byte_cntr_in_use(drvdata, &in_use);
+	if (in_use) {
+		ret = byte_cntr_read_ops->read_unprepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->read_ops)
 		ret = drvdata->read_ops->read_unprepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
 
@@ -277,6 +312,13 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
+	const struct tmc_read_ops *byte_cntr_read_ops;
+	bool in_use = false;
+
+	byte_cntr_read_ops = tmc_qcom_byte_cntr_in_use(drvdata, &in_use);
+	if (in_use)
+		return byte_cntr_read_ops->get_trace_data(drvdata, pos, len, bufpp);
+
 	if (drvdata->read_ops)
 		return drvdata->read_ops->get_trace_data(drvdata, pos, len, bufpp);
 
@@ -300,7 +342,11 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 		return -EFAULT;
 	}
 
-	*ppos += actual;
+	if (drvdata->reading_node)
+		drvdata->reading_node->pos += actual;
+	else
+		*ppos += actual;
+
 	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
 
 	return actual;
-- 
2.34.1


