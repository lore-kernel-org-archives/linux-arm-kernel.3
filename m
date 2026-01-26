Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766A9C88E6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 07:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+SnHnfj2p+IHMVC+5k2qLRm9He+t+szYkvobbU2XVA=; b=QmylXBgujgEJpZu7V7XjxQMlA+
	zwQbm9uwULnMpnfuDtXlid/ORR4xrh8xfgGp/Fh4ZrJtXFCSCV9HJixvPgebgfx3P6kii0HMMvb4P
	apw7VID69Je+x94omT2Gl4p4f0Xk8A8VbAR67v3jpN6/hX/NAWpFt6lmFsopimBpsxTnhcUQRDMkY
	mLx0ZwX76OU6ijfsUwB2eot+baTc5d0SzFPRPr9xbRN0tBCUxgKk9bk1fNHJpt1wJj3lzdXBruSLu
	LNnff0CJfNrTU32KPFrALhCJCs58P3GQTCWDTjaD7zxleUobCJHRQ2T+JFtB88ANvKU89Zzro+Ka1
	DcG/9YAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHLX-0000000C3Mn-2YSE;
	Mon, 26 Jan 2026 07:49:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHLT-0000000C3Jp-3AQN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 07:49:13 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PNPDKQ1307847
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 07:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6+SnHnfj2p+IHMVC+5k2qLRm9He+t+szYkvobbU2XVA=; b=HM1B5MUY0Q950VMK
	VIZO47ru5JVvnUXecOaghnBiDR6XdnVMitYQTWCqHWjzCFGhqQ40kUyKOUd2dnxU
	ZRPviZAd3q/gJczRAeNTypbhFEJENvC3wU4xCuBr9xz/y/45LWjn8z10A7ral6QP
	ER0+8j4NEghp6gyXr5JrG6V2gsUPAHnN0aTwj6rssNAsgsmHCFKlx4jk+rmW+LHF
	e+OCOZXWRQT+IZDLuzwzm6YV/sApO4Y1U9ek3wcnNqM88MmHRzYwVebE+EdxH/ta
	o9jZP1V5XQMx3Je76N9bEmBIjc8C12XevQfMKyy4QqPPgVRaimub4yIDdf51XifO
	n9Tkag==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3hbsvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 07:49:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8230d2a470eso1607733b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 23:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769413749; x=1770018549; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+SnHnfj2p+IHMVC+5k2qLRm9He+t+szYkvobbU2XVA=;
        b=PQEtyrg1BLb3+nTnDRKhsuff0dtlHpypzmkR1LtvnW/6LNNdOOHBKXOUG1bkGoQ9OE
         +0eBPndKAhpVgePt08/b4RrIX+jwRTGoP6cAHWhlIJAmKLKt7OIv1A5xJHrFdccmmiox
         SnHWQH4uk2o2/2ZECKirrHM0LRQdu5OLeYlvku9JbwDMRVbbZw6mz9Y6+rU7/ckEoE1j
         m0BErVJ0nlFOVMJGqwf8sb+NFfj7E4Y24ES/RmJvWdkMBIk4BE3i3XHJtjCNfMihQJld
         C1K4293ImBTGtOCO5XpRSGRBsUuhmkiN+md31tWwajMXFF+2e8MBSscei2hVCitdTAU2
         oIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769413749; x=1770018549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6+SnHnfj2p+IHMVC+5k2qLRm9He+t+szYkvobbU2XVA=;
        b=GgPBtx2d1KMpZ8SWoMuWUhP/vTOwk1Tia4Nc0wFhy50baalFux1bOfH6YYL3xmqE1W
         u342DgwNfshUdF0xofkyumj/VsjTN4sMbt/0tpQxoPBz3kS2LW0sKCvVuxxR28hNG2ba
         6iL29Hrur7Wl3mSGPnzGtP+s3eMFZ76XXm2UoNBS/KuWSa5VlTEasjBotSEn7Y7q1vT5
         FB4hHjfXyXa3nDEVvgYBbstfg8ZemMZiJ5RwLoAW5OIPoez1obsSH7SpyV30VML8YllT
         9L5j9oeE8smGG4SOYLdOkQzaeBAAnIWswa7NxbEM6hrmoLmv9yw1St2jBgYf5MrTyvVi
         JgOg==
X-Forwarded-Encrypted: i=1; AJvYcCX8aRxNrkBkAv67k0r6Mc/5oaKYfnoEt5W0u4pQtKTuuNSyWgBFnsjKo/AvQ+CRqfbv5GMk3DElTGmIIIock7Fv@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2EddLOCOWnNXK5AYo4z9X8cwDs5idxRf5rR519x6xbnhsNWrA
	xNDGhzjs9yBjA/gx56j+/jkZ4iE/VACwVDT/r4JmNIQYkCA1/jy9fp5Gkxxq4l3NgwKbko85E7h
	TS3RUHXYvpSNBZuY2jAAfE9sct5rUcoeW9zV24Q/V7PFHh54Uq68Ps6MpxwTL2QQEutGCllMZQc
	MOCw==
X-Gm-Gg: AZuq6aIz9G5qa6J5xNWOPaiUbPJvR3SY0G118psOKcTg3VcSWB23bnJ1Yf8vlenMKwJ
	inE8wd5MqWrMjEijDsvktXwaAg9C9McwhEOWoPH8XT3tFJrv3ihVEuj0tRTh8ayifrq4pjOonzJ
	F82Rg3CmQxOQ4hsWpIwO2P+NzBUqY22Mf9h8hQPZ8/CTl3qiZxUGrdUGTWx9DCIKiVLH6zwUQQU
	KdIFjmlNHH3gBHBGi4gC0ACi60m0JQH3qN00rBcAOGI90LrfkobXd1PJEInyDZxKdgGWE0RcGdl
	xBifcaOXvW57maWRWLpGWL6qPbBmOqmzgLR22+6Ny6bLuV7v17tZr/sQ//sIYXUB0p6yxg2VX9v
	lrCq/edvlWkNUYd3QTv3yr2rrgeScA+5IBm5EZmB0zUSZZEt7tqCUs6THcu1mAnTGyXYaslGVkN
	1S
X-Received: by 2002:a05:6a00:140d:b0:7e8:4587:e8ca with SMTP id d2e1a72fcca58-823412d8c6bmr3477810b3a.61.1769413749254;
        Sun, 25 Jan 2026 23:49:09 -0800 (PST)
X-Received: by 2002:a05:6a00:140d:b0:7e8:4587:e8ca with SMTP id d2e1a72fcca58-823412d8c6bmr3477792b3a.61.1769413748784;
        Sun, 25 Jan 2026 23:49:08 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8234fd9a5a7sm1223418b3a.63.2026.01.25.23.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 23:49:08 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 15:47:59 +0800
Subject: [PATCH v11 7/8] coresight: tmc: integrate byte-cntr's sysfs_ops
 with tmc sysfs file_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-enable-byte-cntr-for-ctcu-v11-7-c0af66ba15cf@oss.qualcomm.com>
References: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
In-Reply-To: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769413706; l=3512;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Zq2mruMCQX8VD0/KR6WxLvO+aI5t0vieYiFx2QbIddc=;
 b=hBgYC9yibRbm3RvEmsxoddJOyjOdnOOeiOlaGWemCh4SAiGZ7YN1/RnoRQ627k51zzyRArlxy
 xpymxY6V/8lCsLL8zWgBSfDqjMbqHE912Z9W6U5eiRBxx1vlbMvqxTl
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA2NiBTYWx0ZWRfXx3aWXxjQYgl8
 ZLGsnduft4c64kQkxfSdq7XWLRhK81Wg3Cm51oupRmeXthyW7TyRZrYvpSR9Jz1eyYICmF3SMwc
 y1izz7dLVgNcBEkWS1/devLAaRe4lLac/WePxLeCjPfS4YAu07lPEE7ULsG41E+W4/2DgqAtDT6
 N9Fz0BXu7egCCNzorDCGW9TQbpXCVh91C8L3t7TFeITJk6qMCHk4L65y7g5ITd5TcxLldPgfDdX
 IYlfnJwEOEVCyRNn3/+QxoIaeSxVqsgYq/ca9XAo7w2jI5xKnnfsbJeB/rhdsuFEJtk2TWEdvqo
 /IOWcA4hh4qHV+Ag0KlRLXjepIi/a/YScTUhSh3wHjn3+EXM1p29cWFVaIsxUPSKNCcbJb59ARU
 82BPkWbr0xjVVWOMJ+o9S74+Fr697G0jY5gxOTbTHHUYFYzfZZF/PlIURkiC3SdZ15ic9xxKjRT
 lyL9ttYu+HDtQoNiHrw==
X-Proofpoint-ORIG-GUID: UlisBFq0ClOUtGq0YIG7qthAg01KG-Y5
X-Proofpoint-GUID: UlisBFq0ClOUtGq0YIG7qthAg01KG-Y5
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=69771c76 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i2GxayCjj04of9N-vEoA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_234911_946308_801E3850 
X-CRM114-Status: GOOD (  18.00  )
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

Add code logic to invoke byte-cntr's tmc_sysfs_ops if the byte-cntr
is enabled.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 53 +++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 32ca2ec994de..95c74405ce05 100644
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
 
+/* Return the byte-cntr's tmc_sysfs_ops if in using */
+static const struct tmc_sysfs_ops *tmc_get_byte_cntr_sysfs_ops(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct ctcu_drvdata *ctcu_drvdata;
+	struct coresight_device *helper;
+	int port;
+
+	helper = tmc_etr_get_helper_device(drvdata, CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	if (!helper)
+		return NULL;
+
+	port = coresight_get_in_port(drvdata->csdev, helper);
+	if (port < 0)
+		return NULL;
+
+	ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+	byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+	if (byte_cntr_data && byte_cntr_data->thresh_val)
+		return ctcu_drvdata->byte_cntr_sysfs_ops;
+
+	return NULL;
+}
+
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
+	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_ops) {
+		ret = byte_cntr_sysfs_ops->read_prepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_prepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
 
@@ -245,13 +278,21 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 
 static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
+	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_ops) {
+		ret = byte_cntr_sysfs_ops->read_unprepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
 
@@ -277,6 +318,12 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
+	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
+
+	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_ops)
+		return byte_cntr_sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
+
 	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
@@ -297,7 +344,11 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
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


