Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D9FFD460A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 02:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0aVqQf87hVeQU4tjSuQKvK+8fua6EE8kvRpy2NjfYk=; b=fadthIA5ZY1iFuhuM8fE9qLMXR
	PWUWMEx9X/9rM296k7HK1ut/vOtlUhHUaS7hSQmA0thsw8mInEvZ8bOl9wnAxemubte1WuLO/X3nj
	lj4iq0o20DGCmnX6Uoq1xirKzYXXHCeDCkLS/lO0at4KczKcOeSuxDF0DkW5JQG0IEcJw37edxw4S
	coWmcr6dHYyD6Yj8LcsJszI+eHqEq7HkzCLyOCoKx0EU5/EYiwJkxKV6JbqKs8/+h3TGFFh4hW9ro
	vZV36Cy26I9eGAvAzM69x4jvh4QQV6evVkmmtZ1Ff17O/m2qXsHs1bvNcvCMdjYFeQINTF/7PCLV9
	uelNJ/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQkl-00000005DJ8-36rM;
	Thu, 26 Feb 2026 02:05:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQkh-00000005DHL-1lEo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 02:05:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PHOsC1806796
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 02:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=n0aVqQf87hV
	eQU4tjSuQKvK+8fua6EE8kvRpy2NjfYk=; b=CQ1dowIQ+rPQxHxSgiKqm3OHGU6
	XvqXiDySs0b8sWlAr7g/Cb87ZG0muWIrO+7vukwW82I7qapy2ItDMvVpyHdZiKMa
	O78TUqrSoXvvCfehYfurlmAaqJshA0ivN4fzszBP6UOI0+45oQVeCMVAnQuFtmxi
	nIb1GXkS2A/EnjOhWmrCEFDSzDw5ES5ZoTw/38UiRwJkbex7V9GgoRJ0QQ2OnZ7n
	bjGs24HVMWM4Y6HIAH1J2VEZ1UeFcyiIZBR9KvV/rz2V1IQWxVUHE/UsMyDi8KUU
	ahqwGSl0sZPFU0345qma/7kmV0iUhn3jhnlbhLXJAlntkWt1qPMoKm6N8Qw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chr5pbvhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 02:05:18 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-679c44ae7abso9188109eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 18:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772071517; x=1772676317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0aVqQf87hVeQU4tjSuQKvK+8fua6EE8kvRpy2NjfYk=;
        b=ZgrTAlF+HTyycGmqE5JEA5QgP7OPf9E3Aq4khnH00OVt5OhklT4pc5i2487hJ6rHEs
         X+N4ud0imgNHZFdSqRkxlIrkvosuRInTbfrEgFYPq29QWhM78ujfCDoyqNla5Wi7hERd
         upa54sF4TtW2uiRFaTC0DW01bOC6TL0lU7AxDNF9XomlKRdLSA6/dTwWS9ZSYMLIzAye
         aXXA07hZdxCse7UFlcp5sKAgWFCdv8i1QjchgmIpETnkeLz3YPHvo+sJPgPYccOlFhYB
         VfxLgWe4BWEvhOcxmWxa4bg6NdzKC2TfvpcazYxIte9Bv6UgzTahrUuOk8nzvJii+Qov
         Z/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772071517; x=1772676317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n0aVqQf87hVeQU4tjSuQKvK+8fua6EE8kvRpy2NjfYk=;
        b=PRUGEEL/ylv2LF2VNeFLkUmly3z7cXDpU6lMWSKVwbjXMEmdgGypl8dG2Huk3X/PPx
         UDIXuRnYzgya/iwyCi70mAcrGXmnauMO6xjZtnDB9Xc1YiWoF3p8QOudj/rHDv8akDM/
         jnI7NR83ONW+4T8j4jkwvqdzGyzcyPrXXDwtg0c6TjC8EXlv1weX0s77/c7T0kT4CBip
         7ftEouWr++BN/Lp6h6ySQoagepIORpK8oVVwwAMedMf8yVQBO68SqMNsWbkStM9giMdz
         TZuddI88D9KIF1xBdkJTB+Q3SzvhgO71rNnNh39H8Qna6ac3HIwtGUkB3mbTSEU5ie0R
         aBNg==
X-Forwarded-Encrypted: i=1; AJvYcCV+vFoMDaQJ+AGAWHWVBXfTVuAUzBYqo7WnbWpM5eIDpQxFCVxj75gpzAXTqlvm1X8b2uA/+ik5cHDKZhK1t3aE@lists.infradead.org
X-Gm-Message-State: AOJu0Yykz0FYE/j6En3h9tcDGJJxpMSuPRzY7B7+JA2T17YZxZwaFLh6
	m2r3CgwQcrUB5Ppl1/nrUWDJ6Kzx5AysjbOojtZRM5BifP8gfjKaft1F1ElNIA5wLJb7IeOrKZP
	P6Ox87TTPz318JLfxGqXCwuIDLhYFiUQtHOqlGinwAYKPDkeDKEZho8h6NPuY3kJbBK8Sw/+Yty
	vckJqBiAPRQQ==
X-Gm-Gg: ATEYQzyuyrb90grj5cXa9BJTLOtpFiH6ycWXqzlIAU/GtNPmm9MHL/wlCSOPECiHfyn
	FijNf79S5pVZcJv7doP83qZXquRcOWd0tMpOlwbxWiK60tbJ4mE4bgt5V4ep92zuXqJvswT53vI
	67Wa2+uX9KzW306JycWmrm2DLM2VYlWbVdx9rrFpE9x6I2touIHF80jIeCSbe+4h5VhFtVNCq8O
	A4YWepQkCcOhrlkJo8/8V/fmWqUlQz1Tl+yBW8oO+t/rdTJ0VUt867gPsoydQ8vNpyHyiMyxFMh
	ows4bZELHGR8nS7Jh6U9rWzGKkTHi9LbdyI9Sjki5X4FY3Ci8oNxvVO3IEOzfu5t/ppZ0/czYDW
	8VUsnf4UsIfIwrdCak4sSXnHqobcJjuKxkaXhmhOQBijAiglnuzZLDBs0bWQlYJWF0KlDEOGt3V
	V7
X-Received: by 2002:a05:6820:2226:b0:676:66f5:100d with SMTP id 006d021491bc7-679f2304817mr595704eaf.33.1772071517513;
        Wed, 25 Feb 2026 18:05:17 -0800 (PST)
X-Received: by 2002:a05:6820:2226:b0:676:66f5:100d with SMTP id 006d021491bc7-679f2304817mr595696eaf.33.1772071517112;
        Wed, 25 Feb 2026 18:05:17 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2d9e8d6sm549939eaf.13.2026.02.25.18.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 18:05:16 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v11 2/7] qcom-tgu: Add TGU driver
Date: Wed, 25 Feb 2026 18:04:49 -0800
Message-Id: <20260226020454.3210149-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
References: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAxNiBTYWx0ZWRfXxbWS3a4AFyGs
 c6SiQ4PaKlOO/PuZs8aP3e7yTFpdYzy3LxRGKbXsuwQegF5Kqd1Ba8NlHpQTGgdVRhayC1uOu72
 cHKth5fVCjJHnZz5g/2BDCvlj289vmGUn1k85gCv48WFdi338dn/DnP5gzijYN5uFbmtBKscVoe
 QtdH0RZ7rZV4hI9mvT4JL0BCP06aryx603XuWATSPLITEYszQbpNaFElT3MLPnY8tGr6+MiR98c
 ++giax6+1xPuFfhrhV5PNQ9uwLkduwflBmasHyJqHH25ucxnovYOAX6S49N7+7xHF7Gq4L8SNI+
 yx/BryEmkS6WGu+eCQvNPdmfe4PrT3hTzv9BNQlRu5ePjkBsO+NXATOuSHGcOPf9ABhYfzVrQBe
 GmMbCyO1mxR+xBYMVp9pyOeYSExZGLTcErUD/ugPubjqji7d92iRjZodAaXTA9TupkzePrS/rz1
 0NLQ52dAK1l7Xv5LKmw==
X-Authority-Analysis: v=2.4 cv=GstPO01C c=1 sm=1 tr=0 ts=699faa5e cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=h99DN6MNysFgGb7_OMAA:9 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: jDBmVfmtD6ILNrB3LzvpgFk29qUofiy-
X-Proofpoint-ORIG-GUID: jDBmVfmtD6ILNrB3LzvpgFk29qUofiy-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_180519_578714_5CFF7C73 
X-CRM114-Status: GOOD (  30.81  )
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
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/qcom/Kconfig                |  18 ++
 drivers/hwtracing/qcom/Makefile               |   3 +
 drivers/hwtracing/qcom/tgu.c                  | 183 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  51 +++++
 7 files changed, 267 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
 create mode 100644 drivers/hwtracing/qcom/Kconfig
 create mode 100644 drivers/hwtracing/qcom/Makefile
 create mode 100644 drivers/hwtracing/qcom/tgu.c
 create mode 100644 drivers/hwtracing/qcom/tgu.h

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
new file mode 100644
index 000000000000..184430d88f1c
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -0,0 +1,9 @@
+What:		/sys/bus/amba/devices/<tgu-name>/enable_tgu
+Date:		February 2026
+KernelVersion	6.20
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the enable/disable status of TGU
+		Accepts only one of the 2 values -  0 or 1.
+		0 : disable TGU.
+		1 : enable TGU.
diff --git a/drivers/Makefile b/drivers/Makefile
index ccc05f1eae3e..9608a3debb1f 100644
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
index 000000000000..58c19f12f3d7
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -0,0 +1,183 @@
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
+	if (drvdata->enabled)
+		return -EBUSY;
+
+	tgu_write_all_hw_regs(drvdata);
+	drvdata->enabled = true;
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
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret || val > 1)
+		return -EINVAL;
+
+	if (val) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			return ret;
+		ret = tgu_enable(dev);
+		if (ret) {
+			pm_runtime_put(dev);
+			return ret;
+		}
+	} else {
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


