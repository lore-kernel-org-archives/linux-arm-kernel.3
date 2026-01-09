Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292F5D232CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 02:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DjHq4ZWbcdhEjTc1QLjuBRN0uHmH39hKhk5mtr7alUE=; b=nQxM8Z3CcU88BQJotno7VBC0Ou
	0OF3c+bFlYut0Et/8U1rfJGJnT7V3mH9QG1JaTevOwVvYc4CB8i9tRfdJlvz42FKfPgcZNf+e8oTw
	IlRlTtJftDR0uj//TY4xDxuoIzuThbJaUoZHpRNkntML3oK4yTCJAD9khZ0lIs/BrgSZHTs3HinHS
	JP3VLqx2YIT0VB0foN8fUgRpQo6Rc5AHrnxPy2xYbl8Dm/03Cza8h7Gvn945eg/qcPcwEmXpLXkHm
	T5PHHvMb3pXuw3DZthvpx0O2HWhsfSZI8FSv4DKFWOV2eJAAftcjPPqJ037KLh5oNKiCXMnEGzqIq
	wQuMurtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1z2-000000016VF-3EgI;
	Fri, 09 Jan 2026 02:12:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1z0-000000016TG-0bTm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 02:12:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608IUSnt2986370
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 02:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DjHq4ZWbcdh
	EjTc1QLjuBRN0uHmH39hKhk5mtr7alUE=; b=clPwd6/jgzzD+uPfxtp4JrDVC1q
	cYFw+saXREJDGqa91ZdYEUsAMtWIs12nwmRU/W2QlcabZ2Clhu1Z8Sd2FeWjupYV
	xsBEInPeMccCbUT5zSDGNJ7kNXLf2DC+C32hNrMGlbaPHtfCWMVjnjkqxytnMRqZ
	0jTu4hcW7LgP7IbAabDYopvzvcbP1jyLczuChOrLheXMSaQzh5YVXgErMuWOCiqI
	vQPILW+GZ0IKENUjNd9WU6SgzIaNXiYa6/siKJOB+FWc3SpklpukRKeGj/dKJJJI
	LQiVjF0lowNbnJ9/KeKh/TDPgarYK74K7Pm/zqyTbt1VC5Av3Guc8bp1eRw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjhwx11sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 02:12:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b0530846d3so3158537eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 18:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767924728; x=1768529528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjHq4ZWbcdhEjTc1QLjuBRN0uHmH39hKhk5mtr7alUE=;
        b=ds1gQl8D56iY53Hoh1ZtvU9ujcnC13rVU5df9160Ff04cOmnJWTAvqur9A6lkNyHtg
         EnthV8rhbRwR5I/Xpy6KbossNgNu7AUG0K//oqj9y3VXscCXu/BOd+LHrNuBVwlafEfb
         P78MjDsdf+j7+KQUWtWtf/M6LtvcXQqmp3KdjTp2xlBlLxFwIS8U1laE1PI7GodsCGWe
         YhxXE2I0h4jLjZF9YUaKXt7tQ8zaVFuPAAVabRRmi9Ls+9cW7c34sDaniy427vKWKgtL
         OEjNnWnrgvfr0lAciqRJKC6AIoxbHG7lvs0X5kpjaMkUXkQXh93ISGoSRQ/F3wz62HhH
         j0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767924728; x=1768529528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DjHq4ZWbcdhEjTc1QLjuBRN0uHmH39hKhk5mtr7alUE=;
        b=o92htc11rOAmzpqMzUVYsHuN1ByAyQItHa/QBZvpnGqw1VLxdjHochKFx5ghVz/TOK
         hgtu5IKdTenxYaU4gSHnRSQjSisdegJoyZdssvzDH/h+/hG98eO6fKrni45AGQwmCI6w
         07szOY1N4J//7BDB8vYVqszc5UsOP6mDqenGsowxGWQDprj2bUpClSiNx8R86rYKt23S
         llFeToM1K93G3qh2mGtQm9+2ptOMnhkLiiqFtS3M4EN5UJC+Y9KvE7NhWt6YLp7WnRrK
         hCVoI+xT41gfqKMPBYk4z3vi6bNV3rVEJF/27246naGWkMTtWMr8NYMAXCzR2+uWkBiB
         S9Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUXQnf2BbNaFMhBgv+//la4RHgB8dAgidAKWW1tyN9OCTgJZBall0chvgbsAgx8ygp4otxWig6u1XPwVOz2FaI2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3E4987Qd+yjVOS0ABPb8/4V9OZxmptOWypF3BGJPxl1RNyxkz
	LplRIfmlcK7Yc/I/Nu0bscurXE3x4gL1s0lIhkB1EstRHtddC3KuLWTXL2smdOUSqod1t2GLeXd
	gJFW4k+DhA3PrvYfrWZLEeXl24wOye3j8ZDM6QyQoIQQu5bnBJ+ja+RiaR53iLr3y2vKCtGT9fd
	mjKQ==
X-Gm-Gg: AY/fxX7Y6j3/7S8eEpUDDEjkj69Q7SSpMhLxNoRrHyi5FWJqdIM9OxcFIzZrs4s+PB9
	f+Iw6XbJp1vrDNMXaXf8VxeLXEb/Lwh/q9p/de7kFC2eTTf3taiRhmjlIoGE5R2BMw81jkCngmE
	snfegLJ82KCXlHEAVFu6ehpGQEyIj1qjJDaigTT0m1i7kG+KaD3N4hLkcRgs0DDYHrF+3Cz8Jrf
	giuEyzalEj0Z2hfWETnWfGEyLhIQRh/b9HYl3pEpaaGGw4P8+rTJvIzxCaKCI4NA96JHMarSH5C
	4rQ4bnbBidEZ6nXAz2vvlHyo3D/0E2uLhZUBCeGMeY7/2tTiGGqOUMwN0y2NqEHmDLLSoiYbSOq
	4SMLtoBnCCPGA4Dc0AzfLJi5Ct2Y7DVcDv0Ub2IVGVwgcaift1QnZwgwBRlm1KaP2
X-Received: by 2002:a05:693c:4143:10b0:2a4:7cb9:b7da with SMTP id 5a478bee46e88-2b17d2aa0ffmr6543980eec.25.1767924728073;
        Thu, 08 Jan 2026 18:12:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEduvwLb5uIwn75t/emerE+73GzcjtqDlkmld1CqwFACGdsJBfZbUUotBYC5bj9Y4HLVZ00BQ==
X-Received: by 2002:a05:693c:4143:10b0:2a4:7cb9:b7da with SMTP id 5a478bee46e88-2b17d2aa0ffmr6543939eec.25.1767924727243;
        Thu, 08 Jan 2026 18:12:07 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d76aasm9459111eec.33.2026.01.08.18.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 18:12:06 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, suzuki.poulose@arm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v10 2/7] qcom-tgu: Add TGU driver
Date: Thu,  8 Jan 2026 18:11:36 -0800
Message-Id: <20260109021141.3778421-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAxMiBTYWx0ZWRfX0zbrAsM1OGI3
 y2632OY5w7P0oe09zl3euZccWUZX34xWLRCv3ewtudJPXkHEkbYhlACTGattjWNfV0+Dw+N5oK/
 xDeMHL3uciIUX4IQs/76dI+YwNW5pZIgD/fnP22txLGI5jIu8bwR5hruwP34Je7FJffRtdQcCDO
 NyEN7kDSlbsPjQOs1kLeomxgcFSTREWyusFSAsFSUx5w+Sn+XIu1GJELyt0kagiFtgud3SXbgdY
 5bw4p3kdlt0ALcANzi3Til8yMFLIC2HNBKVxoxYA8Hmm1kJqTFQlT+40UkXOHukxWxBdB9eyMRt
 Ogd1qufePRB1l2Ky92zePzexPbSdDN1NPMOH9OF5qXKcxOR1XANOOxwFKIxsv7PC0t/AFmZ5V41
 0crK77EQC8KI87xEEnxDuQzeN1JwV20GsINvuWLVQWStfjKebCn6kGmExZsY3cwCxCktTlaHCMm
 ALZd39J4v4QRHVzmXCA==
X-Proofpoint-ORIG-GUID: 9sIcJhC26pRvhCRNzXYKk-n7d3tevhDD
X-Authority-Analysis: v=2.4 cv=ENILElZC c=1 sm=1 tr=0 ts=696063f9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=h99DN6MNysFgGb7_OMAA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 9sIcJhC26pRvhCRNzXYKk-n7d3tevhDD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_181210_375520_E6A57281 
X-CRM114-Status: GOOD (  30.82  )
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
 drivers/hwtracing/qcom/tgu.c                  | 176 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  51 +++++
 7 files changed, 260 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
 create mode 100644 drivers/hwtracing/qcom/Kconfig
 create mode 100644 drivers/hwtracing/qcom/Makefile
 create mode 100644 drivers/hwtracing/qcom/tgu.c
 create mode 100644 drivers/hwtracing/qcom/tgu.h

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
new file mode 100644
index 000000000000..56ec3f5ab5d6
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -0,0 +1,9 @@
+What:		/sys/bus/amba/devices/<tgu-name>/enable_tgu
+Date:		January 2026
+KernelVersion	6.19
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
index 000000000000..c5b2b384e6ae
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -0,0 +1,176 @@
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
+	if (drvdata->enable)
+		return -EBUSY;
+
+	tgu_write_all_hw_regs(drvdata);
+	drvdata->enable = true;
+
+	return 0;
+}
+
+static void tgu_disable(struct device *dev)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+
+	guard(spinlock)(&drvdata->lock);
+	if (drvdata->enable) {
+		TGU_UNLOCK(drvdata->base);
+		writel(0, drvdata->base + TGU_CONTROL);
+		TGU_LOCK(drvdata->base);
+
+		drvdata->enable = false;
+	}
+}
+
+static ssize_t enable_tgu_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	bool enabled;
+
+	guard(spinlock)(&drvdata->lock);
+	enabled = drvdata->enable;
+
+	return sysfs_emit(buf, "%d\n", enabled ? 1 : 0);
+}
+
+/* enable_tgu_store - Configure Trace and Gating Unit (TGU) triggers. */
+static ssize_t enable_tgu_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf,
+				size_t size)
+{
+	unsigned long val;
+	int ret = 0;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
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
+	drvdata->enable = false;
+
+	pm_runtime_put(&adev->dev);
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
index 000000000000..b11cfb28261d
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
+#define TGU_CONTROL 0x0000
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
+ * @lock: Spinlock for handling concurrent access
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
+	spinlock_t lock;
+	bool enable;
+};
+
+#endif
-- 
2.34.1


