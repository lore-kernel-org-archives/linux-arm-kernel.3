Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A79CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 06:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCa8IXhKeKJ0v/SnPBnY5ntVOWUU4OkDq/A7IolgLnc=; b=HODloUM0MO2RSMII2iYoRGbaTZ
	EY/TF75yClxEdgydmcWCqPQyKTPzAtx6dghOPpDelLzW1lV4KtQtzp1qfkU3xHFK9nnWNFNBFpZpj
	J5u1Iwj2rPo2IlrAzxWs99Ic1n3WaAa/oMdJYlK1EEDB2HtB0Ur9sEcuyQVKlHYft9VhbAb4I98qk
	p7yfv9jHyvrMFQUfWtJf/e2AilaC5Q7lMQd6J3q8kvspN5smzbHAs98JJA1AqpQqaDkTWzgMJEwGS
	PG0bgkqfNczknKPoAIJtLKlYd4M+PFXMinw89vSoL+W24Kgbo/bPxUI+M/2YUHSHaNyHSBVZp7d6q
	x61+2i8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGAk7-0000000BFQ9-0JIm;
	Tue, 04 Nov 2025 06:42:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGAk4-0000000BFOr-1Zw5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 06:42:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A433Gwq3667739
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Nov 2025 06:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vCa8IXhKeKJ
	0v/SnPBnY5ntVOWUU4OkDq/A7IolgLnc=; b=S4+FiNRpZptuxhur9iX5G3/VkUI
	NRcJUNkUArzIgVKn41qNJlmRdE/d8In7j6B/gVhpoLFhJN8aebGvtoB2FC5rwdqu
	fSYk6dya8WUeAJqd0OS3dq1j7lKK0o8rWgkn4ZuieOvCsxawZ96nX5tsTbYGs8yr
	ZofmoiYe1Cwydm6/kKu8HoR0SlYxDcxbHXnkJCJGw1Kb7dkdZPH38+6ptb/PhD3i
	rgEkWWM9qmZwQI/JfuadEauytV5rwRO+mEVMMlF76DDTAsQ2LCz3ygtwdobgqRFJ
	ypXFdAYEw4GayPczKcnVomvRc9ttPC9zfqkygqpEbBlelzYLi9p/+eEjRFw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70ffhxnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 06:42:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33baef12edaso6350787a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 22:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762238527; x=1762843327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCa8IXhKeKJ0v/SnPBnY5ntVOWUU4OkDq/A7IolgLnc=;
        b=TWIz6nZf5CNuUPt/XAehn+zWzYONm1ByrjpCEYWBUu1lE47yTzpgEFuayUm6zHf9/U
         6SdLSHsDyutYIjOtusK3VbMQ+L8V/HMdJpF1jlfbpouxYuMXq/ALzXUftn7f4KBJTBCM
         bOufYzbicJLnxaMMNEbi4g7NFI7/cS3JHvQv7EABaJ3dJ/P7YIZx0teFLeztOr9vjPAG
         vqV7rr0c4wEr3aVpOv5RERznvnZFEQvgfFwyGm7QA+h673kuPxO6G0HXWMiXDEVAM/yY
         zCCnVtOl0aJQHU+F5/1UVSCVgIJqbXiXRoIR95QdvBa8cmLBo0HZbZnAR91vJjtnLNmp
         Y9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762238527; x=1762843327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vCa8IXhKeKJ0v/SnPBnY5ntVOWUU4OkDq/A7IolgLnc=;
        b=dWDbK5gejcjA084eR5/uusXjorimCC+2cC2lkUPRNZZib99/3bh7gVoucNbf11RgjT
         fHRBRzhughMGNFULn4NR354xYyJqwuqysV3O2rCigF8a+g/kfMi6vn8J22SUFQsbuT2t
         wLAeLmQ4CVYFk0P3lULyvqjy9//sATvOKMoZUU9KEuFbjE4PqpDTnni3Qri6ZIkXt9Mq
         bYBvfQFpxkgllMQrym4AqRSzsYTAhg9b+ISma51z56zfpgVflOOikie2gILzE9uFgToL
         T43Y+5GnMy6mUsE9nmvpYIWNLVid+bC+ALUOAuKLUZhCwemRuVshtktho0qkz5xGL1tf
         W/kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcpszx0dGnkIfulE8Ismt3YaDpueEdHU003Z2PF4Uui7838C3gJV5GugBhyHWYUKOIXLrV2g506a3u8pY+19bW@lists.infradead.org
X-Gm-Message-State: AOJu0YxpR6uzO+mTE/cKh7H+FyzowkTX/tX8P//BKuKMZ40mLWj/A9Ci
	dTbrSRN44jfld5vH3fDafSK0gQo+lIeSw7gBw+oAfVA5I9ScaMffFvHDnLOhEUEkap7QJBABg2m
	1B5rTRYbhVwMks2rjL8HSk7114mXZOXf+k5g5BvAEoIiGe/fs65FaJPkFG8zYYzczDK+IkhdwzE
	X3uA==
X-Gm-Gg: ASbGncs3vAVvXInPWrNDRN2nwFtZ6BJu5BmeUG0GqCyl1MZmHThR0231SvvzHYlLyPb
	kAHROjXZ+4F9PI/sdgRsWI/oPyqBhurhbfLn4j1vZk2zBc01xLZXQajnc7R08IF8zzrd9P1n3Ad
	BY4PZG2Lv75S1jR1PlVWhxyRSmBX5AkP2SA5p4mbTxWmuGkdIfsk74vSlBYiSoUO8ddhlSba2Ot
	PGNbjyyYQpZlTsJa7WBrAs7St+w9kyH86Xy3Y2MWkWKzx9A5OeIcbpsXPGcbcbahigeBq3V7qF7
	KT3cZp1uiAwlk6ztzVFArh6+yhkUXRlil3vLB8Ga+z8lZL0x81vVIjo8n/0hkGxqfoBgpoCRkcL
	vmo67hMspxfN4+VbUMRCzCV07mkXLVgBpriFQpdoDVqxQfbAebT1AlA==
X-Received: by 2002:a17:90b:35d2:b0:340:ad5e:c9 with SMTP id 98e67ed59e1d1-340ad5e0260mr17124924a91.16.1762238526892;
        Mon, 03 Nov 2025 22:42:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRln/rdS9DbesaBJxZYysVMohCnniDIWiz4GR3mFRqdR3XiQrFBGwvPeL7OtsIqP4UkwMmAg==
X-Received: by 2002:a17:90b:35d2:b0:340:ad5e:c9 with SMTP id 98e67ed59e1d1-340ad5e0260mr17124872a91.16.1762238525758;
        Mon, 03 Nov 2025 22:42:05 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34159a0780dsm3294791a91.16.2025.11.03.22.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 22:42:05 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v7 2/7] qcom-tgu: Add TGU driver
Date: Mon,  3 Nov 2025 22:40:38 -0800
Message-Id: <20251104064043.88972-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
References: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=esbSD4pX c=1 sm=1 tr=0 ts=6909a03f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=h99DN6MNysFgGb7_OMAA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: HoM5mtR-a4wkDlIpy5tlFyV06kurWxz9
X-Proofpoint-ORIG-GUID: HoM5mtR-a4wkDlIpy5tlFyV06kurWxz9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA1MyBTYWx0ZWRfXwbzq6Wz4O4bB
 biY+w4yF3Gg8clZHfDc7l3NgYR/TsftpGQlI+uSnHgI0FFTrTFqwhJiFeuolDnxUPjm2lPmKeEl
 KvFh5f+y70b80M8Bv2VgiOxYO8aNhUXlZ5uUJKXqiN6SGsh8U5Rv5CC1/tUrpT6dmee2TGDZa9j
 SVMAWpMSPBrHjCfAarevncPib1HRS4n2xsslsCUy3scGwpUe9OKtBsGi2WpxHW6/QSXmPwMtLAT
 5yomvNohhRgCkJeUC22eDo10YUWHn/EFskB7UiKXnrIGXKjRPCi7YhbJwcNntwMZNq6jc45VSIA
 M9EGLrhmETc5slIffNZApaCIh1kIetx9nygpF/66P0ad34jKWK9KPr/nndEXKZDcpggBlCZP+Z0
 mmuJVIZ4/7mhLhgcOAISdTLQ+ghcoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_224208_421078_8110393D 
X-CRM114-Status: GOOD (  29.82  )
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
index 000000000000..17d8449599a1
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -0,0 +1,9 @@
+What:		/sys/bus/coresight/devices/<tgu-name>/enable_tgu
+Date:		November 2025
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
index 000000000000..368bb196b984
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
+static int tgu_disable(struct coresight_device *csdev, void *data)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	spin_lock(&drvdata->lock);
+	if (drvdata->enable) {
+		CS_UNLOCK(drvdata->base);
+		writel(0, drvdata->base + TGU_CONTROL);
+		CS_LOCK(drvdata->base);
+
+		drvdata->enable = false;
+	}
+	spin_unlock(&drvdata->lock);
+	return 0;
+}
+
+static ssize_t enable_tgu_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	bool enabled;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	spin_lock(&drvdata->lock);
+	enabled = drvdata->enable;
+	spin_unlock(&drvdata->lock);
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
+	spin_lock_init(&drvdata->lock);
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
index 000000000000..1a55da90f521
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
+	struct coresight_device *csdev;
+	spinlock_t lock;
+	bool enable;
+};
+
+#endif
-- 
2.34.1


