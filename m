Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AE0CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 02:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmaKSSHZo7NJKVJZNLRyloXpRdsP8k48nmCT/BfJT9w=; b=ypf2OKAeWf20ZPvGc+Lpte4Sik
	W6TaTQKUVJyvh9vQ2IG89y77SCVGJGxhhP8yUzD0fdumvnZ6Q9P8DN9ZZlJT1Y0d+0ppDgNkzSs1d
	JI0GtY9j5BEe2MYgfpqET6UsJpMkL6i8FStNoO2yPAPnlmQ1B153IaJqTcRyZvtLai6MZ4Be4QHdp
	SivudP8tnnkhCrbLNeieUkhGsNCW3wmZb8vmxFufBmaccEBtGNlZO3CzauGVBZGZ5ujDc/8XCdPvA
	zdi10gpi09vxeOcNaVLTi+hy+rpQf6YsfH8nw6BQowftp5X1XD6jqxRKB57iFm9lWw12LUt+EWsTX
	9fVuaTnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2b8-0000000Fe5K-2ubb;
	Tue, 21 Oct 2025 02:59:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2az-0000000FdxK-2JZD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 02:59:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KL0x42026856
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 02:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kmaKSSHZo7N
	JKVJZNLRyloXpRdsP8k48nmCT/BfJT9w=; b=KC+ttvrypG7FCfoVaoE+WLX2Awg
	2Kd3jf+0U7BEk/Sij/grr7T8PzFrf/cNCPd1PFM5/1OmN5eGCGiBysILg6sksqdD
	5YajxlGstJjKvuiVH2y9O6wUhN4akVAF+OtTbWewNh2lUkgjkR1Cv4Htl09YAkAo
	S3N/uJBfusCa9IQucQCxR05pgvKaPRt+/a4PuQgHdNCHUOB9qm9sHxTEoog1cJLn
	RD1Ocalg67ceSfVGsRaMvRNcgbMM2a8h8QMhxNHMu+2JNZai2T6lIhngBKB9JPy5
	FNtC50aBwYnnjngDFLsPwb1516otRrOqwTtr4xp7+2/in8fsRPzXpdWWEyQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27hxxdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 02:59:32 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6325a95e44so4263980a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 19:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761015571; x=1761620371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmaKSSHZo7NJKVJZNLRyloXpRdsP8k48nmCT/BfJT9w=;
        b=cx5sQJJOGY2q/FeC1nl8GV4CUpQcIm/bwHyKU4seSG2iMv18xiblUWbCvhpOdn7wsw
         HVOEUFm/YYVPNbZy5vU8ZIvtDt805QK9pW6LWxnrMyjh7d6pNyFzf0eqT+3byxIAUOrq
         5wJtJVpUjmv7nEL0g0jw3AxA4JU8quuGJRbhTrgKtdq1KxYsz1nXhxblWbAqTW3do/xD
         j5LNYVzsKt+L+09fCBXml5851gEebq/hqMhBL511pYBQZ87q7xPzY3SPnz5dGTTKINCS
         aTIM9GBQrsIBvmVttfY1mEbn584P1hFiJ8CUqd+8KrtCPw6sOQQnT1rShDNCrAziB+ba
         dkkg==
X-Forwarded-Encrypted: i=1; AJvYcCWzdP76cT5c0k60KlRbWqFoGc15vEQtnFNoAf4bTrt5R71csz03H+e+Ih3jESVIWs9f8m7iXDvhDWPTL7KD8B8t@lists.infradead.org
X-Gm-Message-State: AOJu0YyhWLtXMx94wDUykHHZanU/8U6ep475/ud/5MAfKt6+dmFtlShf
	a/eTxGlNOQRX1+eWS0wKwvtNZdEcF9n37vpVlzSwII6J1i4t506GeidpU8+Lx+ofLRY3LnKxl6z
	LtMNQRjg+vPLD57kf23z0NlF/gXWUb0CAG0bBFPdU18dwYvNCj56r71lBXF2Ib87opJmIXfbbVs
	6GdA==
X-Gm-Gg: ASbGncsUq1giGqHAAydkHw4W+vvHrm5KHZp3t/d7sQeJXnAT+ESSmXQL8VBHI1m72uh
	J51gsxH0dGhdtKcuqJaDLF82PwgMAY7a/Ycqbd1YCVfZbpXXNdQnfLzpc7emKJx2fMOG2+Tq9Tl
	mrJPxS27InZAEUzSBYPZpxhp1YBUQNeqI+zpLfsjk87VJawh8VWrA2o6NVgtbcijKEGDbQDA6+Z
	U1VA5p8504EpeItRqeB9FQm3S8XahUJNV+sI8/EkcIuOp+MoSUy6q9hp+fY4GKppvgAsFshSdfD
	t/fp4joX80JHp9/QO+p0MiMipEzdgqxEnm4qeTEzPHrOGX7az7j5SKwJXIOsjrZYiNnF/24JWcN
	H59oIfqgDt+NWDhpn0u6+o58BEU3IugfLFrwG/NIkp5w5gRF+t9afyw==
X-Received: by 2002:a17:902:d58d:b0:265:b60f:d18 with SMTP id d9443c01a7336-290c66d9f6amr169982255ad.1.1761015570699;
        Mon, 20 Oct 2025 19:59:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrIjeFPe3nuy5aaQMAatxgG1ZMdmYWaSnl+shINjPxLXmz5TSOZC3UIymk9xPJPqv7HvGRRg==
X-Received: by 2002:a17:902:d58d:b0:265:b60f:d18 with SMTP id d9443c01a7336-290c66d9f6amr169982025ad.1.1761015570175;
        Mon, 20 Oct 2025 19:59:30 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76673a86sm8855787a12.10.2025.10.20.19.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 19:59:29 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [RESEND RFC PATCH 2/7] qcom-tgu: Add TGU driver
Date: Mon, 20 Oct 2025 19:59:04 -0700
Message-Id: <20251021025909.3627254-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251021025909.3627254-1-songwei.chai@oss.qualcomm.com>
References: <20251021025909.3627254-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX5QNeYQyqj9Bo
 cish/e4DX7IXKr0zcKzE9kXtjmHaXF+XWez3E8HVfjbOeqHqH77vi+gqsIGuUEKIjIK8GpiQvhl
 YHCNTACRd4TBI0/uwIPzVQeNLoe5EiGcp5Mg4WamB/N62Mz93qvt3j126l5S7aC1LPvm9USLbrF
 bbPEfYlK23WAnlqEgw+YxYZ+BgHHRjTE+0iLnH1dyMYNt/9MSYNQPqK0ICqknzItEQT5vPPnRtJ
 obdaseAnhWfXfyl++P8+I+vcSqH7n2CxFAxgQhN1T1ZwUAF3eb2zkCFdiCqwm20eefPweKWe7aM
 3WXbDuXMBgnxribDPQDZVTA+STwwVwVhZxpVIt34I9RDOJXql7DNLRjpJkC9akhC9eyYHaOM12/
 FHC7x78byOi1CaCCUpPo0E3vTdsELQ==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f6f714 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=h99DN6MNysFgGb7_OMAA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: t3Srcbljs3Zm3XtOQ7MAEgPrX-I1FmDR
X-Proofpoint-ORIG-GUID: t3Srcbljs3Zm3XtOQ7MAEgPrX-I1FmDR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1011
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_195933_733875_B6D92446 
X-CRM114-Status: GOOD (  32.33  )
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

Add driver to support device TGU (Trigger Generation Unit).
TGU is a Data Engine which can be utilized to sense a plurality of
signals and create a trigger into the CTI or generate interrupts to
processors. Add probe/enable/disable functions for tgu.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../testing/sysfs-bus-coresight-devices-tgu   |   9 +
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/qcom/Kconfig                |  18 ++
 drivers/hwtracing/qcom/Makefile               |   3 +
 drivers/hwtracing/qcom/tgu.c                  | 210 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  33 +++
 7 files changed, 276 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
 create mode 100644 drivers/hwtracing/qcom/Kconfig
 create mode 100644 drivers/hwtracing/qcom/Makefile
 create mode 100644 drivers/hwtracing/qcom/tgu.c
 create mode 100644 drivers/hwtracing/qcom/tgu.h

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
new file mode 100644
index 000000000000..353961e7b61c
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -0,0 +1,9 @@
+What:		/sys/bus/coresight/devices/<tgu-name>/enable_tgu
+Date:		October 2025
+KernelVersion	6.18
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the enable/disable status of TGU
+		Accepts only one of the 2 values -  0 or 1.
+		0 : disable TGU.
+		1 : enable TGU.
diff --git a/drivers/Makefile b/drivers/Makefile
index 8e1ffa4358d5..acade03f5942 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -176,6 +176,7 @@ obj-$(CONFIG_RAS)		+= ras/
 obj-$(CONFIG_USB4)		+= thunderbolt/
 obj-$(CONFIG_CORESIGHT)		+= hwtracing/coresight/
 obj-y				+= hwtracing/intel_th/
+obj-y				+= hwtracing/qcom/
 obj-$(CONFIG_STM)		+= hwtracing/stm/
 obj-$(CONFIG_HISI_PTT)		+= hwtracing/ptt/
 obj-y				+= android/
diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
index 911ee977103c..8a640218eed8 100644
--- a/drivers/hwtracing/Kconfig
+++ b/drivers/hwtracing/Kconfig
@@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
 
 source "drivers/hwtracing/ptt/Kconfig"
 
+source "drivers/hwtracing/qcom/Kconfig"
+
 endmenu
diff --git a/drivers/hwtracing/qcom/Kconfig b/drivers/hwtracing/qcom/Kconfig
new file mode 100644
index 000000000000..d6f6d4b0f28e
--- /dev/null
+++ b/drivers/hwtracing/qcom/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# QCOM specific hwtracing drivers
+#
+menu "Qualcomm specific hwtracing drivers"
+
+config QCOM_TGU
+	tristate "QCOM Trigger Generation Unit driver"
+	help
+	  This driver provides support for Trigger Generation Unit that is
+	  used to detect patterns or sequences on a given set of signals.
+	  TGU is used to monitor a particular bus within a given region to
+	  detect illegal transaction sequences or slave responses. It is also
+	  used to monitor a data stream to detect protocol violations and to
+	  provide a trigger point for centering data around a specific event
+	  within the trace data buffer.
+
+endmenu
diff --git a/drivers/hwtracing/qcom/Makefile b/drivers/hwtracing/qcom/Makefile
new file mode 100644
index 000000000000..5a0a868c1ea0
--- /dev/null
+++ b/drivers/hwtracing/qcom/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_QCOM_TGU) += tgu.o
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
new file mode 100644
index 000000000000..0d3c62f2d5e6
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/amba/bus.h>
+#include <linux/coresight.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+#include "../coresight/coresight-priv.h"
+#include "tgu.h"
+
+DEFINE_CORESIGHT_DEVLIST(tgu_devs, "tgu");
+
+static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
+{
+	CS_UNLOCK(drvdata->base);
+	/* Enable TGU to program the triggers */
+	writel(1, drvdata->base + TGU_CONTROL);
+	CS_LOCK(drvdata->base);
+}
+
+static int tgu_enable(struct coresight_device *csdev, enum cs_mode mode,
+		      void *data)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	guard(spinlock)(&drvdata->spinlock);
+	if (drvdata->enable)
+		return -EBUSY;
+
+	tgu_write_all_hw_regs(drvdata);
+	drvdata->enable = true;
+
+	return 0;
+}
+
+static int tgu_disable(struct coresight_device *csdev, void *data)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	spin_lock(&drvdata->spinlock);
+	if (drvdata->enable) {
+		CS_UNLOCK(drvdata->base);
+		writel(0, drvdata->base + TGU_CONTROL);
+		CS_LOCK(drvdata->base);
+
+		drvdata->enable = false;
+	}
+	spin_unlock(&drvdata->spinlock);
+	return 0;
+}
+
+static ssize_t enable_tgu_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	bool enabled;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	spin_lock(&drvdata->spinlock);
+	enabled = drvdata->enable;
+	spin_unlock(&drvdata->spinlock);
+
+	return sysfs_emit(buf, "%d\n", enabled);
+}
+
+/* enable_tgu_store - Configure Trace and Gating Unit (TGU) triggers. */
+static ssize_t enable_tgu_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf,
+				size_t size)
+{
+	int ret = 0;
+	unsigned long val;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val) {
+		ret = pm_runtime_resume_and_get(dev->parent);
+		if (ret)
+			return ret;
+		ret = tgu_enable(drvdata->csdev, CS_MODE_SYSFS, NULL);
+		if (ret)
+			pm_runtime_put(dev->parent);
+	} else {
+		ret = tgu_disable(drvdata->csdev, NULL);
+		pm_runtime_put(dev->parent);
+	}
+
+	if (ret)
+		return ret;
+	return size;
+}
+static DEVICE_ATTR_RW(enable_tgu);
+
+static const struct coresight_ops_helper tgu_helper_ops = {
+	.enable = tgu_enable,
+	.disable = tgu_disable,
+};
+
+static const struct coresight_ops tgu_ops = {
+	.helper_ops = &tgu_helper_ops,
+};
+
+static struct attribute *tgu_common_attrs[] = {
+	&dev_attr_enable_tgu.attr,
+	NULL,
+};
+
+static const struct attribute_group tgu_common_grp = {
+	.attrs = tgu_common_attrs,
+	NULL,
+};
+
+static const struct attribute_group *tgu_attr_groups[] = {
+	&tgu_common_grp,
+	NULL,
+};
+
+static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	int ret = 0;
+	struct device *dev = &adev->dev;
+	struct coresight_desc desc = { 0 };
+	struct coresight_platform_data *pdata;
+	struct tgu_drvdata *drvdata;
+
+	desc.name = coresight_alloc_device_name(&tgu_devs, dev);
+	if (!desc.name)
+		return -ENOMEM;
+
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+
+	adev->dev.platform_data = pdata;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	drvdata->dev = &adev->dev;
+	dev_set_drvdata(dev, drvdata);
+
+	drvdata->base = devm_ioremap_resource(dev, &adev->res);
+	if (!drvdata->base)
+		return -ENOMEM;
+
+	spin_lock_init(&drvdata->spinlock);
+
+	drvdata->enable = false;
+	desc.type = CORESIGHT_DEV_TYPE_HELPER;
+	desc.pdata = adev->dev.platform_data;
+	desc.dev = &adev->dev;
+	desc.ops = &tgu_ops;
+	desc.groups = tgu_attr_groups;
+
+	drvdata->csdev = coresight_register(&desc);
+	if (IS_ERR(drvdata->csdev)) {
+		ret = PTR_ERR(drvdata->csdev);
+		goto err;
+	}
+
+	pm_runtime_put(&adev->dev);
+	return 0;
+err:
+	pm_runtime_put(&adev->dev);
+	return ret;
+}
+
+static void tgu_remove(struct amba_device *adev)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(&adev->dev);
+
+	coresight_unregister(drvdata->csdev);
+}
+
+static const struct amba_id tgu_ids[] = {
+	{
+		.id = 0x000f0e00,
+		.mask = 0x000fffff,
+		.data = "TGU",
+	},
+	{ 0, 0, NULL },
+};
+
+MODULE_DEVICE_TABLE(amba, tgu_ids);
+
+static struct amba_driver tgu_driver = {
+	.drv = {
+		.name = "qcom-tgu",
+		.suppress_bind_attrs = true,
+	},
+	.probe = tgu_probe,
+	.remove = tgu_remove,
+	.id_table = tgu_ids,
+};
+
+module_amba_driver(tgu_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm TGU driver");
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
new file mode 100644
index 000000000000..b60ac0f3bda1
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _QCOM_TGU_H
+#define _QCOM_TGU_H
+
+/* Register addresses */
+#define TGU_CONTROL 0x0000
+
+/**
+ * struct tgu_drvdata - Data structure for a TGU (Trigger Generator Unit)
+ * @base: Memory-mapped base address of the TGU device
+ * @dev: Pointer to the associated device structure
+ * @csdev: Pointer to the associated coresight device
+ * @spinlock: Spinlock for handling concurrent access
+ * @enable: Flag indicating whether the TGU device is enabled
+ *
+ * This structure defines the data associated with a TGU device,
+ * including its base address, device pointers, clock, spinlock for
+ * synchronization, trigger data pointers, maximum limits for various
+ * trigger-related parameters, and enable status.
+ */
+struct tgu_drvdata {
+	void __iomem *base;
+	struct device *dev;
+	struct coresight_device *csdev;
+	spinlock_t spinlock;
+	bool enable;
+};
+
+#endif


