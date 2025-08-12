Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE484C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1OcyQpnD9L75XnG1ZEvfUt6LUJDwDhLDEI4FIuyjCj4=; b=t8KaIDrPiLNKxLBJSE3K5XJjw0
	ZS+Ke8LQddxTOUXxVV2we9iNPW7+JuEZ3xSuTiSH19bk8MK3i7U3NJHySMyFEZmkJuzlIqK0w/yIK
	SIRCkIbo40K+0u1mud1QiOIO0G+HU1srgjvOXtENyeirkUIesBq0bidND2bNH0DdKCshXCggMXnCf
	rbsgquhcGokaLXcMUEOR/+2ajjrmzUMk1/GIBMLsEfGwnwbL5DHBIgoMBKQ5O/g5Sfe7lOci9FcCH
	KdEPDDKrnhuv8zP+s40EcFB1V11J7g9vlZZX9hxuZdPjpCZXlPKly15aH1Lslf39xnByF60lVJvx0
	9DoaWGWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloHD-0000000Al3Q-11mr;
	Tue, 12 Aug 2025 12:38:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkWX-0000000AGXN-11OY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:38:26 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5XI9w021319
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1OcyQpnD9L7
	5XnG1ZEvfUt6LUJDwDhLDEI4FIuyjCj4=; b=a5pevnTZH+PdV73g24zMsrn9Dw2
	XzUZ5+8VQOvMK1susE0wRnqjdjsSXr2ft7DhljR0NbG2kRvqPF1XD2Wm4ShgTCcV
	xNgh3Ks2AZIh/LWHLjFO3eE91ADkA9i7ULeTkJDx7fv+Ar5TIoA89C1bi+mL6ryV
	31OGuP4B6/M2owYdfezoNKusCtSwYZl2mtHWKiEm3nmHO82AAbIsb+hkA8Q/Zs4n
	jiGxihtNzy1tWM7cNMYmfJuVojZI7fNE3wchvvjlenHjh/gzOTvgumKcBGfaRez9
	tEn9dIzJEpf3GtQi+RVhm5A3VfWPQ5W63mra1NYjRpOn5GIYaV4veGThb7A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vja9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:38:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b3f33295703so7859778a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987903; x=1755592703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OcyQpnD9L75XnG1ZEvfUt6LUJDwDhLDEI4FIuyjCj4=;
        b=XQ02j8MpXEyUI6lrjg8LbaEj+MPNxK4vn9r+jeW/09wbOsY5XddXnPAmr0yk3BkDhB
         5VZgb8DsuXjZ51gESx6jy39/kFweRSplLlKt7wa4TfGX/vB7a33O5uaQu8fFDNYD9jnz
         7jfxUez7yLP6iDi3I/oLVtXD3VJCFB/xN4rAdSbq4mVD56vQrzxYJFQ7iYo151YtZ/o8
         HCMBSu3TvPEPpkFoZrH8+qmFGh+bPwOTnO7E5cA0zwN9vkAm4g6rmVSN0P8s3rLSqzmr
         4Zb7zx0+vj5lb2uxCay36SE8GpUd0j9mk5SExyNW08tdmn4+zdmMrq43ffyFsXTOpbQI
         cYjg==
X-Forwarded-Encrypted: i=1; AJvYcCWLjaKYf8cxW5gxxIP33H2alv/DLWGtV0vRQSNoiSQaXoKh1qPS60JNkJoM71hlqU2XR6GPpFzNnFW04mF3WNIM@lists.infradead.org
X-Gm-Message-State: AOJu0YygOEYLk9CEAdGHMaSDYuwHfASzwDxSaeir0n5153V9/NrgQGOp
	CNhM57wmZo3wfP13HCqlmvo63Rd28bC9kEYViqhGhoOSRpTn0/KsBMResDxNLKmSPt2PDzAjmK2
	PdhhAUVhd+wNVrsejSNkiKKkPDYwNAfcMHqjuHc1ZxT/L7AL4FJrOZydfMc+79sNw4m6OdHiLkP
	7eKw==
X-Gm-Gg: ASbGncvdClYJPBfyyYH9LeJuGB1KULk9+ujnMmjiwuldCbK4cMPcEzKNTSlKpn0M87j
	1vkvQAIVq9+aAYe6AaHVttxjA3j8jZMh+epabghurWYwPR+97X6tv6VpilSBCxX6fzAX/RD1Vm/
	3/Sx8eh8XVuPMVsfBSGD60lN2LJss+Vwj4JziFe1Uh4wU8C9TJf0GqHaI6i3MhV+D/uwzyw29zt
	fDBthuDoa3E6vXwzDf5pXzcmeqfBNWp3zjocnCBdkaNQNe3jkmTQYPMQB7lwz7okODXsI64XfDN
	ZvyjhDJ5Kx0NuCx5DUiqqLyUxv6kgWmCy5NN53oWzkTylWL6qdUksOnEIcr5uyN+1TMRacOLu1h
	ATEnu00r4xIRwB0i91Hs=
X-Received: by 2002:a17:902:e88c:b0:242:6f41:2351 with SMTP id d9443c01a7336-242fc22867amr34513295ad.14.1754987903119;
        Tue, 12 Aug 2025 01:38:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYNZy0KkiaMxYcwqChfC+6AbngjNQCRku5c0+99ujSBUHULsyDtiHI4rPOrktUm1IOA807SQ==
X-Received: by 2002:a17:902:e88c:b0:242:6f41:2351 with SMTP id d9443c01a7336-242fc22867amr34513015ad.14.1754987902709;
        Tue, 12 Aug 2025 01:38:22 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-243086849b3sm1915345ad.175.2025.08.12.01.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:38:22 -0700 (PDT)
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
Subject: [PATCH v5 8/9] coresight: tmc: integrate byte-cntr's read_ops with sysfs file_ops
Date: Tue, 12 Aug 2025 16:37:30 +0800
Message-Id: <20250812083731.549-9-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
References: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX/bu7eFqqzZL8
 NRImLPgco0G6YAVMk0EtpM+BDmzP1pWSq+QF2v83/oBICCk2/+/njTf2IRh6qtTY0fOR9zu3G3O
 opoHzbIWSa6s3eyUoKt4V6hVqUcPVylcbvrX940IRJcjR+mzIpBXSOBOzKsdikLZ37JJmALR5Zs
 ouWaFwL7hGTI2IYwDQuaoWOuJH6T30BquKellK7SpTSeQoYWoNyvUWde4TNjWyGfqBMEXWbaMsc
 qoCnaf1DDllujGy6oLMd85ZUOgz+b3sy/1awtrm/jiTqBVzut3Wcsu0tUTXo3JBN+4I2yLmg7ua
 K6CxpaZ/XPH93aPXVrjFe90bVdawPfT1jAwLWCdUOmCN24eKaf1zNo2lYQrkmsDP2c5+DIOc82c
 /30/pkw7
X-Proofpoint-GUID: H5QOTbA2TrgvgR-Kxo7tlIBwdkl8SFE8
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689afd80 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=rDF8AtoJFDS1Q4XTlPQA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: H5QOTbA2TrgvgR-Kxo7tlIBwdkl8SFE8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_013825_402196_BE40B1C0 
X-CRM114-Status: GOOD (  18.89  )
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

Add code logic to invoke byte-cntr's sysfs_read_ops if the byte-cntr
is enabled.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  | 53 ++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 23c8e903a474..ff68b3edb7cf 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -31,6 +31,7 @@
 
 #include "coresight-priv.h"
 #include "coresight-tmc.h"
+#include "coresight-ctcu.h"
 
 DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
 DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
@@ -228,15 +229,47 @@ static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
 	return 0;
 }
 
+/* Return the byte-cntr's sysfs_read_ops if in use */
+static const struct sysfs_read_ops *tmc_qcom_byte_cntr_in_use(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct ctcu_drvdata *ctcu_drvdata;
+	struct coresight_device *helper;
+	int port;
+
+	helper = coresight_get_helper(drvdata->csdev, CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	if (!helper)
+		return NULL;
+
+	port = coresight_get_in_port_dest(drvdata->csdev, helper);
+	if (port < 0)
+		return NULL;
+
+	ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+	byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+	if (byte_cntr_data && byte_cntr_data->thresh_val)
+		return ctcu_drvdata->byte_cntr_sysfs_read_ops;
+
+	return NULL;
+}
+
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
+	const struct sysfs_read_ops *byte_cntr_sysfs_read_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_read_ops = tmc_qcom_byte_cntr_in_use(drvdata);
+	if (byte_cntr_sysfs_read_ops) {
+		ret = byte_cntr_sysfs_read_ops->read_prepare(drvdata);
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
 
@@ -245,13 +278,21 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 
 static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
+	const struct sysfs_read_ops *byte_cntr_sysfs_read_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_read_ops = tmc_qcom_byte_cntr_in_use(drvdata);
+	if (byte_cntr_sysfs_read_ops) {
+		ret = byte_cntr_sysfs_read_ops->read_unprepare(drvdata);
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
 
@@ -277,6 +318,12 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
+	const struct sysfs_read_ops *byte_cntr_sysfs_read_ops;
+
+	byte_cntr_sysfs_read_ops = tmc_qcom_byte_cntr_in_use(drvdata);
+	if (byte_cntr_sysfs_read_ops)
+		return byte_cntr_sysfs_read_ops->get_trace_data(drvdata, pos, len, bufpp);
+
 	if (drvdata->read_ops)
 		return drvdata->read_ops->get_trace_data(drvdata, pos, len, bufpp);
 
@@ -300,7 +347,11 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
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


