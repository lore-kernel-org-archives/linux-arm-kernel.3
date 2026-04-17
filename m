Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CB3F8E4B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 07:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vLxQP39Z6E5+dnmEb0/p93WVjx/SZ/+pHIEoyp/n1o=; b=UgqCIZn8mz/z6jfgOiXAeymBsC
	2ndHRgq+j2jaLljXc+Lws/0+3teaL8RhN56zlzvLX3Ijsy8GwqOTUQQD+63hZUo6W/qRmVKTfQ8M+
	HaxR6S2t3z4e0KoyUxXB9udUc/h+pS7djaCW5oZ7gp1wPOYMcn1868o14GclwFnUuSjmMr4C6Cczw
	EGGhy9aBY2hVv+aoksAQ35WfCXQPKgKb+uFXffxWXK++b/APz6oq7vq2muqReYrWJBUshBFO4Pbn3
	aKSCVeHaTUo1Pl6VC+ixj6sRQgmzfjOhpX5G0cLfnj6WhVVIrzhlRMW62Ohps49dAH734wbx1hFeG
	OBtOdmTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdiS-00000003akc-33iF;
	Fri, 17 Apr 2026 07:34:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdiP-00000003aj6-1pMg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 07:34:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H79TF63942119
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 07:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3vLxQP39Z6E
	5+dnmEb0/p93WVjx/SZ/+pHIEoyp/n1o=; b=enUUGRvk5lTStyknGr3dzoRK/nJ
	uvOCPyVJIE6a+HYeByIJYQzHTvCEa8BpGu/3P3fQ8CalbtbgLuJDlxIYgo51YydZ
	HOnz7IBk9O47noCfwUaJmOpEPRRTrBlLrELOedO4Gx4qgYmbU2ais20z4govCif4
	2hVyXLVGh+fawspnzJHGo54VEZ2MnTBc2/W+9mqAOTPGP9ckZNGEqOYkTfU8WEqG
	n9iPXYuf2eb1HcY5CvxfK+OwlgqGmiiMUFgLdhbylZpBZ8afxoHOn5exYFC/dtl1
	vS450j0PcoDywremSVADC65XzD4gN33P/E+BgLDf1U5Zh9vAnJDoA4ECDlA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg7rr49r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 07:34:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bda35eab74so474539eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 00:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776411242; x=1777016042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vLxQP39Z6E5+dnmEb0/p93WVjx/SZ/+pHIEoyp/n1o=;
        b=OyZyC9x9TdpHaVMyvglGZB6iBzUKq5K5bhwFBbhv30Vhbu8ia5KfhZJ6Cgqc5SxX94
         YZcBBlgnRR3VdqgTNdc8u4S6PILPoz5cv8LdlXf6lnM8OA+JcLd4kmJUwJcWhpUMtvNQ
         cTQJhTRGIfzu9Lv9OyS473b1j0gxGia4eBEP0M/YayY7xZP7JpmtKMmYaSNB1wMci5dD
         zO/ux/4Bir6LBuegOjrjTsGrZ9w1Q/lz/aqacBcz2Vt8tY1g8HGe75oSVFpKxPIJXSMq
         oDcExoOIHPtfSi653e1oDzyoJiULUzqlaJIJmpU2KyRp/hRuw/33rKzoiKqNrSTNDg55
         dxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776411242; x=1777016042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3vLxQP39Z6E5+dnmEb0/p93WVjx/SZ/+pHIEoyp/n1o=;
        b=Cz5VUibNFcz4jn4QA/dBOl7/6ktXu895ccKTjjQVXt4PokCcrG1fn1yfYED89XLEi+
         k8hTBfHf6xG/z1+NbuTPIfdwJcyeFjZ0FOFkdKIdjU3ZSfCKBiRNY1D7RX+Os7pPXoiC
         uo1qH3yydiTvMb5zcD8V6cQfajlif0xeiVZpxNjrh4QfEllfXZhog5dee4aAH3XpO9wN
         5ER9jWDDFceHjHZlYwle7jL7SS9uob/oO8cxFHXPdv9P5HxjKVxsTjJJ8PxmuS/nuDMY
         7VAvOdLAKVb9RIgbr7MAAjihNP/mbJvkNtr47zhLeq4Sne2HLiTqtzpG8Kny5fnrKZcE
         mKng==
X-Forwarded-Encrypted: i=1; AFNElJ+cDl28qOwxqG/AM/Ec1BOu+SNgsoL4XaZpqYHwNhhtbiIpI9lufYxEbxjpLVwkMETyfL1gOx4DPSzug/T5HPI9@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq2fnNFr+bcRfE9fxjYEQEj3bKnhBDziuydF1zYZZg1ma8C4+B
	WG1EuIKMVSRGfeJhKY9T8EvN8Se05yDP1HTU6EYFkJWlTG7WHWwywlLptUoywUC/wNjkSy2FosS
	5ZbrRGWWvq9waKQLqknSuPmy5c9FuaQq8wJXDlKCEC6A3euNlNmY7fvvA7N2xkqKdx4kc2DFHg+
	1+lQ==
X-Gm-Gg: AeBDies1J+rc26+q0h+IPltGDCd9F9q0/hwTNn4pM2YpMOiS5OUtCkkXFbBmMA0aOPj
	slJxzuC+8LtysgUPw7Jh7F3Objb+aHKRIkxz5WbpSbOQ/Ug4uX1orc596G3mfIryVHUftw8AXed
	ykTZdpN6qjY4TYF2mb0Wr2hwqphrvhk4mdfoiPiuYVe1H7J/XJ19yu1BlPDfy4WVwFlUjP9/ZiG
	CDCl7hhWM4gm67ihOG1urHX8kKd27yYzpX8NVB+ZhcS671IXai1KXn53KIkJPW6IjaiI065CVp/
	Pk80ZMSLd+UzTW07k3d7tP93hk5BqolqPB7TAli/Xi3ZM4olWhdqXnDxD71rCwHe+JBwv/m6i97
	CdffLg02ACNZhBDhqc+5LLjjBd+ThTE+ryICW+lk/33HSi9q6M/wZNNtmJ7Vt5x2CH50LkDJfcC
	c5a2ZEHpNfzQ8=
X-Received: by 2002:a05:7300:dc8e:b0:2d9:db50:c6ce with SMTP id 5a478bee46e88-2e42c348309mr651275eec.3.1776411242214;
        Fri, 17 Apr 2026 00:34:02 -0700 (PDT)
X-Received: by 2002:a05:7300:dc8e:b0:2d9:db50:c6ce with SMTP id 5a478bee46e88-2e42c348309mr651259eec.3.1776411241605;
        Fri, 17 Apr 2026 00:34:01 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccd2564sm1135168eec.18.2026.04.17.00.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:34:01 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v14 2/7] qcom-tgu: Add TGU driver
Date: Fri, 17 Apr 2026 00:33:31 -0700
Message-Id: <20260417073336.2712426-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aZtZ_-G2hccf6TkbRvg4Xx-VRSjDcU_a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA3NCBTYWx0ZWRfX2loKmwCXdYzL
 eOu5mbvfmlETbJ2PIEBBHUSYzL0mCG9xFwzFDSjxUp/b2XGglN4sgYgBWVXAtzt+o+2SbYJfYG1
 +2+nTPU32NQcGY+1tXtSTYAg9uA61KD9/TL0DX3nC91DuxOz4nK5v4f3/X8zxXlYBB2OOHRSj2U
 AyuwonNhLxutlHWsiQMd+/ANiBZbFf/C7X7u6DoCLX6WFbbAQL9mtje4QNZHBnrX3p2azNWjl22
 WEBZTUThohd0LDUUvdW8/++2rq10l0RwH4hhiDpztXTLnSo5L/K54arfflo2EwBzAaVjzk8DeVG
 AmQF0U5cBJDAwoK+6G9sTTWtYym4ppFxc4Rr+tWFpvEznJvjDUUL+NKAn43XJnEYZC/EO5eUk6V
 xsGu6dO5Jddd0QV+qJdpgBrA8JgOMJn7iYk4JhaznV4t2388QpFSfig4SjHIm48K3rxeAF0r/eQ
 n4rre8WptUTc93WVEYg==
X-Authority-Analysis: v=2.4 cv=b4mCJNGx c=1 sm=1 tr=0 ts=69e1e26d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=h99DN6MNysFgGb7_OMAA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: aZtZ_-G2hccf6TkbRvg4Xx-VRSjDcU_a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_003413_480831_BBF2AFA3 
X-CRM114-Status: GOOD (  29.33  )
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
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/qcom/Kconfig                |  20 ++
 drivers/hwtracing/qcom/Makefile               |   3 +
 drivers/hwtracing/qcom/tgu.c                  | 193 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  51 +++++
 7 files changed, 279 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
 create mode 100644 drivers/hwtracing/qcom/Kconfig
 create mode 100644 drivers/hwtracing/qcom/Makefile
 create mode 100644 drivers/hwtracing/qcom/tgu.c
 create mode 100644 drivers/hwtracing/qcom/tgu.h

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
new file mode 100644
index 000000000000..f877a00fcaa5
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -0,0 +1,9 @@
+What:		/sys/bus/amba/devices/<tgu-name>/enable_tgu
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the enable/disable status of TGU
+		Accepts only one of the 2 values -  0 or 1.
+		0 : disable TGU.
+		1 : enable TGU.
diff --git a/drivers/Makefile b/drivers/Makefile
index 53fbd2e0acdd..82b712a12a26 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -177,6 +177,7 @@ obj-$(CONFIG_RAS)		+= ras/
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
index 000000000000..5c94c75ffa39
--- /dev/null
+++ b/drivers/hwtracing/qcom/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# QCOM specific hwtracing drivers
+#
+menu "Qualcomm specific hwtracing drivers"
+
+config QCOM_TGU
+	tristate "QCOM Trigger Generation Unit driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on ARM_AMBA
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
index 000000000000..49c8f710b931
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/amba/bus.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
+
+#include "tgu.h"
+
+static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
+{
+	TGU_UNLOCK(drvdata->base);
+	/* Enable TGU to program the triggers */
+	writel(1, drvdata->base + TGU_CONTROL);
+	TGU_LOCK(drvdata->base);
+}
+
+static int tgu_enable(struct device *dev)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+
+	guard(spinlock)(&drvdata->lock);
+	drvdata->enabled = true;
+
+	tgu_write_all_hw_regs(drvdata);
+
+	return 0;
+}
+
+static void tgu_do_disable(struct tgu_drvdata *drvdata)
+{
+	TGU_UNLOCK(drvdata->base);
+	writel(0, drvdata->base + TGU_CONTROL);
+	TGU_LOCK(drvdata->base);
+
+	drvdata->enabled = false;
+}
+
+static void tgu_disable(struct device *dev)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+
+	guard(spinlock)(&drvdata->lock);
+	if (!drvdata->enabled)
+		return;
+
+	tgu_do_disable(drvdata);
+}
+
+static ssize_t enable_tgu_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	bool enabled;
+
+	guard(spinlock)(&drvdata->lock);
+	enabled = drvdata->enabled;
+
+	return sysfs_emit(buf, "%d\n", !!enabled);
+}
+
+/* enable_tgu_store - Configure Trace and Gating Unit (TGU) triggers. */
+static ssize_t enable_tgu_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf,
+				size_t size)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret || val > 1)
+		return -EINVAL;
+
+	if (val) {
+		scoped_guard(spinlock, &drvdata->lock) {
+			if (drvdata->enabled)
+				return -EBUSY;
+		}
+
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			return ret;
+
+		ret = tgu_enable(dev);
+		if (ret) {
+			pm_runtime_put(dev);
+			return ret;
+		}
+	} else {
+		scoped_guard(spinlock, &drvdata->lock) {
+			if (!drvdata->enabled)
+				return -EINVAL;
+		}
+
+		tgu_disable(dev);
+		pm_runtime_put(dev);
+	}
+
+	return size;
+}
+static DEVICE_ATTR_RW(enable_tgu);
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
+	struct device *dev = &adev->dev;
+	struct tgu_drvdata *drvdata;
+	int ret;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	drvdata->dev = &adev->dev;
+	dev_set_drvdata(dev, drvdata);
+
+	drvdata->base = devm_ioremap_resource(dev, &adev->res);
+	if (IS_ERR(drvdata->base))
+		return PTR_ERR(drvdata->base);
+
+	spin_lock_init(&drvdata->lock);
+
+	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
+	if (ret) {
+		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
+		return ret;
+	}
+
+	drvdata->enabled = false;
+
+	pm_runtime_put(&adev->dev);
+
+	return 0;
+}
+
+static void tgu_remove(struct amba_device *adev)
+{
+	struct device *dev = &adev->dev;
+
+	sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
+
+	tgu_disable(dev);
+}
+
+static const struct amba_id tgu_ids[] = {
+	{
+		.id = 0x000f0e00,
+		.mask = 0x000fffff,
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
+MODULE_AUTHOR("Songwei Chai <songwei.chai@oss.qualcomm.com>");
+MODULE_AUTHOR("Jinlong Mao <jinlong.mao@oss.qualcomm.com>");
+MODULE_DESCRIPTION("Qualcomm Trigger Generation Unit driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
new file mode 100644
index 000000000000..dd7533b9d735
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _QCOM_TGU_H
+#define _QCOM_TGU_H
+
+/* Register addresses */
+#define TGU_CONTROL		0x0000
+#define TGU_LAR		0xfb0
+#define TGU_UNLOCK_OFFSET	0xc5acce55
+
+static inline void TGU_LOCK(void __iomem *addr)
+{
+	do {
+		/* Wait for things to settle */
+		mb();
+		writel_relaxed(0x0, addr + TGU_LAR);
+	} while (0);
+}
+
+static inline void TGU_UNLOCK(void __iomem *addr)
+{
+	do {
+		writel_relaxed(TGU_UNLOCK_OFFSET, addr + TGU_LAR);
+		/* Make sure everyone has seen this */
+		mb();
+	} while (0);
+}
+
+/**
+ * struct tgu_drvdata - Data structure for a TGU (Trigger Generator Unit)
+ * @base: Memory-mapped base address of the TGU device
+ * @dev: Pointer to the associated device structure
+ * @lock: Spinlock for handling concurrent access to private data
+ * @enabled: Flag indicating whether the TGU device is enabled
+ *
+ * This structure defines the data associated with a TGU device,
+ * including its base address, device pointers, clock, spinlock for
+ * synchronization, trigger data pointers, maximum limits for various
+ * trigger-related parameters, and enable status.
+ */
+struct tgu_drvdata {
+	void __iomem *base;
+	struct device *dev;
+	spinlock_t lock;
+	bool enabled;
+};
+
+#endif
-- 
2.34.1


