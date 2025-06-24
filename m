Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E19C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 06:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDdOYdwFc4WUgEUqvI2QS/sAK9B8E5IgVNSudMM9Bh8=; b=BPcnekYX2kgFgkf3AtzicJnFlL
	apdgr5akGdPWmooxNLoBtx8UJ/vh5Stsu4WpXb3eaNSQTBElionpYty1TfLxpufrAmOAjKK/khYPK
	R0P50ZQhKHh9KuY4bpYzjOdsTYYBIbrZVMGTVXqKtKDo5Jy4zo1DHaaBaimuMnwTR1rrvgUsOu89w
	jeBLvpSGUB8jlDp1poPGAIVvFRHpFqGU8VwG0V99Njr23vODPfaLtV9ldGV62SGQ1ycIRRM0j+tfU
	WVT0BXn0PaW9r6jcJqExOvDfffLXpVVlFpRBWrTM+D+muPc5u8GFXyFsMU5zsM8oKfexHi2t+tm6z
	gY1AhgdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTx5Q-00000004lBw-0VAu;
	Tue, 24 Jun 2025 06:24:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTwmc-00000004jGI-1mcA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 06:05:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NHsMEB006669
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lDdOYdwFc4W
	UgEUqvI2QS/sAK9B8E5IgVNSudMM9Bh8=; b=i0c4z4eEl78Km1aLtMy5ImC4Sr4
	SBbO/iWZPsABX7YYWZxjQAGNjmoi5P6NSVRaIa4c+NhlLjfDkvdwnkXaN4CJ/FOd
	41dM0cDx91dOE4QG95OtiikmB+0Tzi2AF26Eu2/G8NlwGqbN4LuPzbGuC8KBO+JQ
	QlMdybB+cr/FvFhFoqRX2NDXlS2U7rtWErF1xtb0TbicLGDctlsiDcczsUplOB9X
	CfCVtZ6kURwyE/Y5wBOTyCP6xT+Rn+SAIYwn7J/cpr01bWHPqCPFP0Ru3TGVQg77
	92Me4yw+n9Wg7z9z2WnNuCZtm/PoR98v3obKCh6ezschd7jYP4whKOo3oNg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmmmhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:05:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2358de17665so42925695ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 23:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745125; x=1751349925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDdOYdwFc4WUgEUqvI2QS/sAK9B8E5IgVNSudMM9Bh8=;
        b=DgvcONSKyx2YpzsUYJkW1qVr+n1Lxa21Nmuk9Y23vtt5piPhLwB7EGT87r4XNH0jZa
         HnT/Vop/qV+qFjfmsxSHH3QUvGkKHmzR/vREoKAS4PYAAaRq0WCok8X+KAZ5uZ4Tg5bh
         E0aEbMPI6UyyF/NKkpShrGNNZOqsR8SbBPnzDrS6FfiKgivDXnqam6T7xLMcVSF4tLtp
         qWm05kV3v3WPsmHAu0R7z6+DT2BNJgmK/fJtbY51PNal5Pdtr+eOx9NgSZk41Le+MCcQ
         ezbWoMHDY2CJjIjPdO6bNiLReZ7yUJg0u8qLt3JNWmb307I1tACeOOVOjB8svPbC3AoE
         hzqw==
X-Forwarded-Encrypted: i=1; AJvYcCVQgAulLsVpwARfkoM8RouSffaREdcAb2AGG1oetYiQG/+U9AdCV1W1tNtTFn/kwHfAjVvgMQ2umB040cK+7yGJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0uibtouIF7gw/y9VESrHCrjG+7J2DhoYG2dpgstmVsda6ICOn
	smB+dSOzL5IFJVIhKK4t989GRAai6ure3zQRbdvF4CgJepEnnmynb2yltpkZq/ly7W0PNEsV8ZG
	/d10suAp8pCU98kELESRmO20QCGG7U9lpLxaN0k5EpFtPdKq/TX7VAoJGgkH5RvW2Cts1v/Xx8G
	5q5A==
X-Gm-Gg: ASbGncsmXKGwrtiKw5Igiipmso6F4KGdhyDltZtYTmVKB2WX1PttIzuXZvluCZjW9Gz
	bi6l9tqAXJMWKv4wzkaoikapBMlx9ZOdYm6146y6PrZEfg5QR1fh/BhoOOVUSgShHrFMhdXT8vR
	WloIv6ESr2q+GWDxaGEUZGtCGZ8ZaoMpeF8hfF3v+BEBVVNPQI7mNquA/a9we4zwiwHvJpTAS3v
	dJhlv2PxNwlzJQx2KoHXIgti2TxOfOkvaU4Oo12UlD80YVa1zVse8VcPP9OgeIojvm03aiXS9B4
	hvFkqvFvIGdhfZq9M6Taw1tt4my3EbKSLZ1ENp81fiTJ+hSdzA9/DCw3e5EnPz/7l7HVGkyU37u
	xCQ==
X-Received: by 2002:a17:903:4b07:b0:234:8eeb:d834 with SMTP id d9443c01a7336-237d97fbc8fmr248546235ad.16.1750745125080;
        Mon, 23 Jun 2025 23:05:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJSsLPuqK7+6S2VP4lZAltQqpakLws2gPXkMkL3c6Beh8EhGPZyr249GoBMsvm7A/2zAVDFQ==
X-Received: by 2002:a17:903:4b07:b0:234:8eeb:d834 with SMTP id d9443c01a7336-237d97fbc8fmr248545765ad.16.1750745124642;
        Mon, 23 Jun 2025 23:05:24 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:05:23 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v3 09/10] coresight: tmc: add read function for byte-cntr
Date: Tue, 24 Jun 2025 14:04:37 +0800
Message-Id: <20250624060438.7469-10-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -BBPWRKr2gmQBPHK3Web_skxOGpMGxGG
X-Proofpoint-ORIG-GUID: -BBPWRKr2gmQBPHK3Web_skxOGpMGxGG
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685a4026 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=56IJ4eEW6NAC_NOVRZQA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MSBTYWx0ZWRfX6J7CkSi7xUHI
 Bul+qlG9c6NLY5QEvkptP/j0SdGqR/30+Z9RhWD0xracW93V4UV9Nh29kMWXp3NAFpt4iNoVJis
 AMF74pDv29zdgpxmnAlEVw1kmUw0xyYvA/j0a9XRlTWsiTKVRMEWHEEOpQk/DQzV/TORm36Bzz0
 y7tTYGXpHAH6KI/G9SWXIQkzxqVZ5jl80YM7JtHE/f57J3h/BR8/UPv//ij9g246GtiifIXA+Jn
 04For6iFBEiF+c2TdpR1X1q612V+Y5c59SPVzUXConO/Pt48/88TQpfChKFgA1XAF+9BiIuC/sJ
 ZFCxpeyfZUD6YCFqEcTD0o4CbBixhzG83kZ0PijpNfcSKckb6/VzXs2WmaEnEuTomZhqAHqGRWH
 O0f0A1SIeAmSjdmTUqioowDK0WDmNaOaMCM3V8kUSLe2vNZq4mRNksJTKFwXKQgL5AoXqEOk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_230526_470700_2052EEC0 
X-CRM114-Status: GOOD (  27.37  )
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

The byte-cntr read function always reads trace data from the deactivated
and filled buffer which is already synced. The read function will fail
when the ETR cannot find a available buffer to receive trace data.

The read function terminates when the path is disabled or interrupted by a
signal.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  | 31 ++++++-
 .../hwtracing/coresight/coresight-tmc-etr.c   | 90 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  4 +-
 3 files changed, 120 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 40605310240d..7b09cf060666 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -317,14 +317,18 @@ static int tmc_open(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
-				   char **bufpp)
+static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata,
+				   struct ctcu_byte_cntr *byte_cntr_data,
+				   loff_t pos, size_t len, char **bufpp)
 {
 	switch (drvdata->config_type) {
 	case TMC_CONFIG_TYPE_ETB:
 	case TMC_CONFIG_TYPE_ETF:
 		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
 	case TMC_CONFIG_TYPE_ETR:
+		if (byte_cntr_data && byte_cntr_data->thresh_val)
+			return tmc_byte_cntr_get_data(drvdata, byte_cntr_data, len, bufpp);
+
 		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
 	}
 
@@ -338,7 +342,21 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 	ssize_t actual;
 	struct tmc_drvdata *drvdata = container_of(file->private_data,
 						   struct tmc_drvdata, miscdev);
-	actual = tmc_get_sysfs_trace(drvdata, *ppos, len, &bufp);
+	struct coresight_device *helper = coresight_get_helper(drvdata->csdev,
+						CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	struct ctcu_byte_cntr *byte_cntr_data = NULL;
+	struct ctcu_drvdata *ctcu_drvdata = NULL;
+	int port;
+
+	if (helper) {
+		port = coresight_get_port_helper(drvdata->csdev, helper);
+		if (port >= 0) {
+			ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+			byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+		}
+	}
+
+	actual = tmc_get_sysfs_trace(drvdata, byte_cntr_data, *ppos, len, &bufp);
 	if (actual <= 0)
 		return 0;
 
@@ -348,7 +366,12 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 		return -EFAULT;
 	}
 
-	*ppos += actual;
+	if (byte_cntr_data && byte_cntr_data->thresh_val) {
+		byte_cntr_data->total_size += actual;
+		drvdata->reading_node->pos += actual;
+	} else
+		*ppos += actual;
+
 	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
 
 	return actual;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 3e3e1b5e78ca..8f53ecb12ad3 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1163,6 +1163,10 @@ ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
 	ssize_t actual = len;
 	struct etr_buf *etr_buf = drvdata->sysfs_buf;
 
+	/* Reading the buf defind in buf_node if it exists*/
+	if (drvdata->reading_node)
+		etr_buf = drvdata->reading_node->sysfs_buf;
+
 	if (pos + actual > etr_buf->len)
 		actual = etr_buf->len - pos;
 	if (actual <= 0)
@@ -1339,6 +1343,92 @@ static bool tmc_byte_cntr_switch_buffer(struct tmc_drvdata *drvdata,
 	return found_free_buf;
 }
 
+/*
+ * tmc_byte_cntr_get_data() - reads data from the deactived and filled buffer.
+ * The byte-cntr reading work reads data from the deactived and filled buffer.
+ * The read operation waits for a buffer to become available, either filled or
+ * upon timeout, and then reads trace data from the synced buffer.
+ */
+ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *drvdata,
+			       struct ctcu_byte_cntr *byte_cntr_data,
+			       size_t len, char **bufpp)
+{
+	size_t thresh_val = byte_cntr_data->thresh_val;
+	atomic_t *irq_cnt = &byte_cntr_data->irq_cnt;
+	struct etr_buf *sysfs_buf = drvdata->sysfs_buf;
+	struct device *dev = &drvdata->csdev->dev;
+	struct etr_buf_node *nd, *next;
+	ssize_t size = sysfs_buf->size;
+	ssize_t actual;
+	loff_t pos;
+	int ret;
+
+wait_buffer:
+	if (!byte_cntr_data->reading_buf) {
+		ret = wait_event_interruptible_timeout(byte_cntr_data->wq,
+				((atomic_read(irq_cnt) + 1) * thresh_val >= size) ||
+				!byte_cntr_data->enable,
+				BYTE_CNTR_TIMEOUT);
+		if (ret < 0)
+			return ret;
+		/*
+		 * The current etr_buf is almost full or timeout is triggered,
+		 * so switch the buffer and mark the switched buffer as reading.
+		 */
+		if (byte_cntr_data->enable) {
+			if (!tmc_byte_cntr_switch_buffer(drvdata, byte_cntr_data)) {
+				dev_err(dev, "Switch buffer failed for byte-cntr\n");
+				return -EINVAL;
+			}
+
+			byte_cntr_data->reading_buf = true;
+		} else {
+			if (!drvdata->reading_node) {
+				list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
+					if (nd->sysfs_buf == sysfs_buf) {
+						nd->pos = 0;
+						drvdata->reading_node = nd;
+						break;
+					}
+				}
+			}
+
+			pos = drvdata->reading_node->pos;
+			actual = tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
+			if (actual > 0)
+				return actual;
+
+			drvdata->reading_node = NULL;
+
+			/* Exit byte-cntr reading */
+			return -EINVAL;
+		}
+	}
+
+	/* Check the status of current etr_buf*/
+	if ((atomic_read(irq_cnt) + 1) * thresh_val >= size)
+		/*
+		 * Unlikely to find a free buffer to switch, so just disable
+		 * the ETR for a while.
+		 */
+		if (!tmc_byte_cntr_switch_buffer(drvdata, byte_cntr_data))
+			dev_info(dev, "No available buffer to store data, disable ETR\n");
+
+	pos = drvdata->reading_node->pos;
+	actual = tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
+	if (actual == 0) {
+		/* Reading work for marked buffer has finished, reset flags */
+		drvdata->reading_node->reading = false;
+		byte_cntr_data->reading_buf = false;
+		drvdata->reading_node = NULL;
+
+		/* Nothing in the buffer, wait for next buffer to be filled */
+		goto wait_buffer;
+	}
+
+	return actual;
+}
+
 static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 {
 	int ret = 0;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index f95df0a34ad6..4136ec5ecaf7 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -364,7 +364,9 @@ int tmc_read_prepare_byte_cntr(struct tmc_drvdata *drvdata,
 			       struct ctcu_byte_cntr *byte_cntr_data);
 int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *drvdata,
 				 struct ctcu_byte_cntr *byte_cntr_data);
-
+ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *drvdata,
+			       struct ctcu_byte_cntr *byte_cntr_data,
+			       size_t len, char **bufpp);
 
 #define TMC_REG_PAIR(name, lo_off, hi_off)				\
 static inline u64							\
-- 
2.34.1


