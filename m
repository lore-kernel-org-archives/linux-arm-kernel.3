Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B9EC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 01:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wi4lXP9W3EGbwQoH1fNQoNj4KY8C57elQ6SQxXyrbGE=; b=4wlKAtNCKw3gkuR7xh+Kyuz+2+
	Dlrs/huukouRnMTOTpQyx0lQTqljF1PsrRPhAPEbQiuWCmZcMBEPNa0BCzDY6/bdIPFlH5U2rTFNS
	K+5kTPVxswSMJ/Vw75Qq+43Y9TdFFFhef3BZoSZFD0xsvAntQW4Vic8zWMEnu/+Uj1YFNgZ4mINPO
	Psd8zfs4Xu850qHhAQuV7saoreBGR0ogwH2HOOmojvMhedg4cOLDkzMXUHpuveCtLku05z42H63zR
	4UiYQ1hmIsDv/ogCo14WOnI48NQu1tyUJ12aZ1rQAxQGrbe/uTDZDYrNUKI0wUycTF6hBS3GPyDtj
	HPAcVEKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gwL-00000008xsI-2AMF;
	Thu, 10 Apr 2025 01:42:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gnu-00000008whj-1cWL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 01:34:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539H7jxe028048
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 01:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Wi4lXP9W3EG
	bwQoH1fNQoNj4KY8C57elQ6SQxXyrbGE=; b=ehx+PJASkfjQjW1jy0pGt6lr+ml
	MjAgpwND1hPznp/TsmS4pNTXt6M4tx1VNZ5bVw0TzkhPaOBYyIJn9rWU7Asry0Br
	YhFa6C1ULZNjj7ggb55L3dxkZWOr1SbkSofGL3prtxOEDovY0YZhY/inmv5xR4sY
	kaB4XJ43hsIItLMJFecsrvTdaHTinzlcTwU99F+og6b3kCvBUFVQ8mE9FTdCthEX
	qTiwB3hwIlwOI9SV82kykI2imRUHGC2ygDthDefn4EOE+4tcm/KShL6+ERb4/dzu
	WZRV+aui9uDRWByTsMgxraw5MQZk0CVweGBoOrGIdD0ngbpiY57TWi/91MQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgnamh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 01:34:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2241ae15dcbso3696455ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 18:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744248844; x=1744853644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wi4lXP9W3EGbwQoH1fNQoNj4KY8C57elQ6SQxXyrbGE=;
        b=GNfYW7t31L9Uh8plh2qLnEdB5esnqf6tpLR0U6NlAHN3CLLW94CIJ9Wxxj/Dn16ESd
         1bQYfkuaMFti1alB5i4bPbhQAS2yZLlLsPrGeV+Bpvr7G/g9k7sg5TihlXsEsLvtdxbN
         5E7wJFDbbluoaGJ+Q2iwMqTDnNhRgV42VaU16TUXx6JhR7WVwOul1WwyZUW4Dib/4DQW
         4jmkKZMdJZIy+BirhusbHEZM4LhBRM2mI0q+jJzsEmsa3tEomrZ9DEScdbSjih7+bVNp
         vVqOFAkTgNrYRWKpIXQUfr52EKm5hnAW0IPbncB+AmZZUfOlyv8PEx0E4Hw6aLrK+RPH
         f/Aw==
X-Forwarded-Encrypted: i=1; AJvYcCX2ytN/Hi03AMcfh2bRrZFHP7ZQq7O1hwsNMAvU/Lq3XAbB1sNvF4D97NgJp05lN+cCOVwjx8EkvFvVlrapoi6K@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd5YHSu2ZcAa+VP6PChd6CAnuqhouZpsWD/JYVpiZd631/9gO8
	TgiKnGofVXzbvgnEEfmHaZeE4q0D6+aNuyksUAYaXFlCprkmXXOGq6j5a/hdCy1AmPvHb+8x0OL
	hjlcwfZST3qMYzXs8EaRnpT7rkEK4omfY7G3jBinkL1FUD8H6B6L1WGieMYamK2pvMx8qbEwvTA
	==
X-Gm-Gg: ASbGnctR0cd5ycKJ7RvUtVdzsqH0zOU2+Cu7nW/lToxR33KQmEoAXcRNU8wkw1wBWtx
	Z2X2BU1QAGL1z5Isu57CKi4ZDyqkjHxYiE+IVXsLG1XNnh7thbt7xpH/G2A2fS6azmNpEkOcA+p
	bk/f7qrWaqLRoUfsR/z6naTg8u+lZV002gI2OKe8ap5xgAOlRfxfH5aIckusaijND/00NPvZ9qM
	JnJl9gCMiOQV46oaUgc/T9joRIKEUoS0FnEjKM+9nwoG0JzzGYjf67ISKRKUGpvw8zYFbvGSd6j
	bmckIyGgPwnIwSUqP5iqOVc97GBmF1ySR3fEvsZlZuO7Xu1mMoOXjGKfKHZZVYlcHXSsSpQ=
X-Received: by 2002:a17:902:f681:b0:223:6180:1bf7 with SMTP id d9443c01a7336-22b42c43a5bmr12196815ad.42.1744248844077;
        Wed, 09 Apr 2025 18:34:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM5MLSaC5h0z0Nma92y/73HYdOvdIe7fjt5Tz++qKzvrLB+EeEnAMPV6E6WyIx8TKR//F42g==
X-Received: by 2002:a17:902:f681:b0:223:6180:1bf7 with SMTP id d9443c01a7336-22b42c43a5bmr12196485ad.42.1744248843598;
        Wed, 09 Apr 2025 18:34:03 -0700 (PDT)
Received: from jiegan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb596sm18801815ad.220.2025.04.09.18.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 18:34:02 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 4/5] coresight: tmc: add functions for byte-cntr operation
Date: Thu, 10 Apr 2025 09:33:29 +0800
Message-Id: <20250410013330.3609482-5-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f7200d cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=vnqp29LrZxOKxJPgRI8A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: C_pRqp9xQ86PV0DHB0AIiW7rN2YjPqX3
X-Proofpoint-GUID: C_pRqp9xQ86PV0DHB0AIiW7rN2YjPqX3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_183406_551340_A8EB45D9 
X-CRM114-Status: GOOD (  26.56  )
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

The byte-cntr function only copy trace data from etr_buf based on the
IRQ count number. The system will call byte-cntr realted functions when
the BYTECNTRVAL register has configured.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  |  29 ++++-
 .../hwtracing/coresight/coresight-tmc-etr.c   | 113 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |   8 +-
 3 files changed, 146 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index a7814e8e657b..42707b5b6349 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -229,6 +229,7 @@ static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
 
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
+	struct ctcu_byte_cntr *byte_cntr_data = drvdata->byte_cntr_data;
 	int ret = 0;
 
 	switch (drvdata->config_type) {
@@ -237,7 +238,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 		ret = tmc_read_prepare_etb(drvdata);
 		break;
 	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
+		if (byte_cntr_data && byte_cntr_data->thresh_val)
+			ret = tmc_read_byte_cntr_prepare(drvdata);
+		else
+			ret = tmc_read_prepare_etr(drvdata);
 		break;
 	default:
 		ret = -EINVAL;
@@ -251,6 +255,7 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 
 static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
+	struct ctcu_byte_cntr *byte_cntr_data = drvdata->byte_cntr_data;
 	int ret = 0;
 
 	switch (drvdata->config_type) {
@@ -259,7 +264,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 		ret = tmc_read_unprepare_etb(drvdata);
 		break;
 	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
+		if (byte_cntr_data && byte_cntr_data->thresh_val)
+			ret = tmc_read_byte_cntr_unprepare(drvdata);
+		else
+			ret = tmc_read_unprepare_etr(drvdata);
 		break;
 	default:
 		ret = -EINVAL;
@@ -290,11 +298,16 @@ static int tmc_open(struct inode *inode, struct file *file)
 static inline ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata,
 					  loff_t pos, size_t len, char **bufpp)
 {
+	struct ctcu_byte_cntr *byte_cntr_data = drvdata->byte_cntr_data;
+
 	switch (drvdata->config_type) {
 	case TMC_CONFIG_TYPE_ETB:
 	case TMC_CONFIG_TYPE_ETF:
 		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
 	case TMC_CONFIG_TYPE_ETR:
+		if (byte_cntr_data && byte_cntr_data->thresh_val)
+			return tmc_byte_cntr_get_data(drvdata, &len, bufpp);
+
 		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
 	}
 
@@ -308,6 +321,8 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 	ssize_t actual;
 	struct tmc_drvdata *drvdata = container_of(file->private_data,
 						   struct tmc_drvdata, miscdev);
+	struct ctcu_byte_cntr *byte_cntr_data = drvdata->byte_cntr_data;
+
 	actual = tmc_get_sysfs_trace(drvdata, *ppos, len, &bufp);
 	if (actual <= 0)
 		return 0;
@@ -318,7 +333,15 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 		return -EFAULT;
 	}
 
-	*ppos += actual;
+	if (byte_cntr_data && byte_cntr_data->thresh_val) {
+		byte_cntr_data->total_size += actual;
+		if (byte_cntr_data->r_offset + actual >= drvdata->size)
+			byte_cntr_data->r_offset = 0;
+		else
+			byte_cntr_data->r_offset += actual;
+	} else
+		*ppos += actual;
+
 	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
 
 	return actual;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index ed8a89fcd3fc..dd9c6b541b60 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -18,6 +18,7 @@
 #include "coresight-etm-perf.h"
 #include "coresight-priv.h"
 #include "coresight-tmc.h"
+#include "coresight-ctcu.h"
 
 struct etr_flat_buf {
 	struct device	*dev;
@@ -1148,6 +1149,77 @@ static int tmc_etr_enable_hw(struct tmc_drvdata *drvdata,
 	return rc;
 }
 
+/* Read the data from ETR's DDR buffer. */
+static ssize_t __tmc_byte_cntr_get_data(struct tmc_drvdata *drvdata, size_t *len,
+					char **bufpp)
+{
+	struct ctcu_byte_cntr *byte_cntr_data = drvdata->byte_cntr_data;
+	size_t actual, bytes = byte_cntr_data->thresh_val;
+	struct etr_buf *etr_buf = drvdata->sysfs_buf;
+	long r_offset = byte_cntr_data->r_offset;
+
+	if (*len >= bytes)
+		*len = bytes;
+	else if ((r_offset % bytes) + *len > bytes)
+		*len = bytes - (r_offset % bytes);
+
+	actual = tmc_etr_buf_get_data(etr_buf, r_offset, *len, bufpp);
+	if (actual == bytes || (actual + r_offset) % bytes == 0)
+		atomic_dec(&byte_cntr_data->irq_cnt);
+
+	return actual;
+}
+
+/* Flush the remaining data in the ETR buffer after the byte-cntr has stopped. */
+static ssize_t tmc_byte_cntr_flush_buffer(struct tmc_drvdata *drvdata, size_t len,
+					  char **bufpp)
+{
+	struct ctcu_byte_cntr *byte_cntr_data = drvdata->byte_cntr_data;
+	struct etr_buf *etr_buf = drvdata->sysfs_buf;
+	long r_offset = byte_cntr_data->r_offset;
+	long w_offset = byte_cntr_data->w_offset;
+	ssize_t read_len = 0, remaining_len;
+
+	if (w_offset < r_offset)
+		remaining_len = drvdata->size + w_offset - r_offset;
+	else
+		remaining_len = w_offset - r_offset;
+
+	if (remaining_len > len)
+		remaining_len = len;
+
+	if (remaining_len > 0)
+		read_len = tmc_etr_buf_get_data(etr_buf, r_offset, remaining_len, bufpp);
+
+	return read_len;
+}
+
+ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *drvdata, size_t *len, char **bufpp)
+{
+	struct ctcu_byte_cntr *byte_cntr_data = drvdata->byte_cntr_data;
+	ssize_t read_len;
+
+	/*
+	 * Flush the remaining data in the ETR buffer based on the write
+	 * offset of the ETR buffer when the byte cntr function has stopped.
+	 */
+	if (!byte_cntr_data->read_active || !byte_cntr_data->enable) {
+		read_len = tmc_byte_cntr_flush_buffer(drvdata, *len, bufpp);
+		if (read_len > 0)
+			return read_len;
+
+		return -EINVAL;
+	}
+
+	if (!atomic_read(&byte_cntr_data->irq_cnt))
+		if (wait_event_interruptible(byte_cntr_data->wq,
+					     atomic_read(&byte_cntr_data->irq_cnt) > 0 ||
+					     !byte_cntr_data->enable))
+			return -ERESTARTSYS;
+
+	return __tmc_byte_cntr_get_data(drvdata, len, bufpp);
+}
+
 /*
  * Return the available trace data in the buffer (starts at etr_buf->offset,
  * limited by etr_buf->len) from @pos, with a maximum limit of @len,
@@ -1963,6 +2035,32 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+int tmc_read_byte_cntr_prepare(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data = drvdata->byte_cntr_data;
+	long r_offset;
+
+	if (byte_cntr_data->read_active)
+		return -EBUSY;
+
+	/*
+	 * The original r_offset is the w_offset of the ETR buffer at the
+	 * start of the byte-cntr.
+	 */
+	r_offset = tmc_etr_get_rwp_offset(drvdata);
+	if (r_offset < 0) {
+		dev_err(&drvdata->csdev->dev, "failed to get r_offset\n");
+		return r_offset;
+	}
+
+	enable_irq_wake(byte_cntr_data->byte_cntr_irq);
+	byte_cntr_data->r_offset = r_offset;
+	byte_cntr_data->total_size = 0;
+	byte_cntr_data->read_active = true;
+
+	return 0;
+}
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
@@ -1999,6 +2097,21 @@ int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 	return ret;
 }
 
+int tmc_read_byte_cntr_unprepare(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data = drvdata->byte_cntr_data;
+	struct device *dev = &drvdata->csdev->dev;
+
+	disable_irq_wake(byte_cntr_data->byte_cntr_irq);
+	atomic_set(&byte_cntr_data->irq_cnt, 0);
+	byte_cntr_data->read_active = false;
+	dev_dbg(dev, "send data total size: %llu bytes, r_offset: %ld w_offset: %ld\n",
+		byte_cntr_data->total_size, byte_cntr_data->r_offset,
+		byte_cntr_data->w_offset);
+
+	return 0;
+}
+
 int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata)
 {
 	unsigned long flags;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 015592863352..1b838e4fc9e8 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -14,6 +14,8 @@
 #include <linux/refcount.h>
 #include <linux/crc32.h>
 
+#include "coresight-ctcu.h"
+
 #define TMC_RSZ			0x004
 #define TMC_STS			0x00c
 #define TMC_RRD			0x010
@@ -334,11 +336,15 @@ ssize_t tmc_etb_get_sysfs_trace(struct tmc_drvdata *drvdata,
 /* ETR functions */
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata);
 int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata);
+int tmc_read_prepare_etr(struct tmc_drvdata *drvdata);
+int tmc_read_byte_cntr_prepare(struct tmc_drvdata *drvdata);
+int tmc_read_byte_cntr_unprepare(struct tmc_drvdata *drvdata);
 void tmc_etr_disable_hw(struct tmc_drvdata *drvdata);
 extern const struct coresight_ops tmc_etr_cs_ops;
 ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
 				loff_t pos, size_t len, char **bufpp);
-
+ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *drvdata, size_t *len,
+			       char **bufpp);
 
 #define TMC_REG_PAIR(name, lo_off, hi_off)				\
 static inline u64							\
-- 
2.34.1


