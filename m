Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D7CD1266D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 09:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YcpW6FT5Ml5cqNh4K+ZAcJVN/SL/nqamGuWANGIsHQ8=; b=BuRQK0w7AxiKAyEVsaOSWJnheE
	S/q5hKWBY1qmUSNYI1Ep7qPAix4HuVpEBjiqfg3xb5k2/ZuvbsL+6+mXn2kh7lL5/l62IU7NLmv+a
	/W4FmsbBOyhq8Uj+cM1LlZUSXwA0AzDzhNUd01qjxG58DXRfaJHtFSjzy5Gg3xYWrMjc0OMnPeKTf
	QAjcXtIJiVlfNDWMAqEbmnTAfJvPk/OA7ZblhIFt97aAbZPSb/HRyXXhsEW8vI40icftJVU0kKcQ7
	SnB1CVdNfKwm28xbYjxXYjnR6cNcF+534UeHKFZ5c3GVR5ZUQhsS78+UYINrzXl36ZDs0x7MB29Yu
	00aVUXcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQik4-00000006M7z-2gbe;
	Wed, 03 Dec 2025 09:01:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQik2-00000006M5m-1ao1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 09:01:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B31WYtG807318
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Dec 2025 09:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YcpW6FT5Ml5
	cqNh4K+ZAcJVN/SL/nqamGuWANGIsHQ8=; b=IDkTHQ4EeCZUvX3Q/Dn1kCvB9yP
	GXOAXbZ4oG2DSNSasGeydwHopMVeGaMI7c4b7Sj+qDUCoQEGGGMe88ZsV+biXo1w
	dv3CTMOP5qersqGJY00iKodSAn/EeTOGLFNMEd1nZlIxH6IOVUjBsiMoAudfNhXh
	NJzOS8pTsWou7HbTGXoCYCWCdcIJSB3aP+sniU0ijGsmteLM3VYL46OXLvTw//x9
	1m5MiOIfMJFgantvj2EAcTvvJkdG0MXkQMYw5OedxW8RwBTqavzoHsqWqfhv/+06
	Wem12B6tYI//9T7ibC2p9hc3VFNwYx1eoESNbHS4Eh5GMRn2UM+CVsNZIHw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atbmmh8fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 09:01:41 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-11bd7a827fdso905259c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 01:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764752501; x=1765357301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcpW6FT5Ml5cqNh4K+ZAcJVN/SL/nqamGuWANGIsHQ8=;
        b=KU1Ak7X5OUQBS8/9NzK7YZGbzNLbloZVA2h5Ux0yYn779FBSYeFck7Pw4Sahys8r74
         KtJk2hEg1t4rWaDCl3b61XfdbxUCMMbijLIPGqZ7Tvh2iOoNjUevVar2L8pmBaQKOStt
         S80NKw46eyvdrl9AR3M9XWy8OZYTQWJTN8pd+A69bYM9qq6/KgiDhS8eDnm9QUuc1q9t
         ybtdF6+W/nsfCeVVW0TIhtEGA+hle0ll8VToWC8h6+nTeC5uId+CGmfSEIeZXXUk44Oc
         /McYNfgsjTeZUYsB2VKmLv6qfevaQfGAzb/HaT/W0TnCnez6TN9yXGmMUaE1dK3Apt46
         E0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764752501; x=1765357301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YcpW6FT5Ml5cqNh4K+ZAcJVN/SL/nqamGuWANGIsHQ8=;
        b=X/7PsDqPuAAWRPID9ARnIZmHXutLKPShzuOYUM/dDq5/IWFrXMfgUCpuxV3RJbRsIH
         gOJ7ZZrcn3N+AAv43qUY+zUM0kbP57GMafD6qIsNxXS4PunWsLhMoNKZBKera8fFldX8
         mRF2p4ffvprmcY3IhTy5Xp9KrSTkTSx4nqlb2l2CaaQmmAuXbxqKMOrReHN+INtdjcxR
         nzXS8IV+yPxiTROXDdULSmU5LlNHFfgLa5H9jmAuOT/igafk7EzMWFqXyBPGdJPz7pXu
         WFPiOFdM+3gY0m0RG/C/nLUf6+mOaUVXdkr/STUZfUQ0ki9EuKT1p2lEJAy+2MfTg5c5
         7+HA==
X-Forwarded-Encrypted: i=1; AJvYcCXsQhFEcYFbJp+WhLgw65VKOhr9mUiwrqtODG4hoSVDTEryuygakg7WFHFbDb8ir1OhK4IFZAvsAcnM1ZTrbkj/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8GLXL89ZRdNtSkSXhKJiZ7t+xADh3wPcO/pcq9HSLk/Q2VHrm
	MxFVBfcrJFjYZcR4mOkkljhG1CtwXtsGycCKZ/RArLC/2HHZ+pb8UpUF2uc8e5oLcxC5DnQjEVS
	GGlOZOp4+32bfG9jtW+Is4mBcdNYuvqVd7PQT8eWD5tB0pgfv2eycEJN8WbQQBfR45dVtTlzYas
	Qz5w==
X-Gm-Gg: ASbGnctZfD+dKE/LrJ+EMbG05lyc5HDZwgQ8FAaYdj7XwP/bhpKcazOE/OJ+g49yIvs
	/LHgLUDVK0xWqDhFrfzME36zNhMCaP5QV7cOZpAJfe/aRcaVLfue+uXjW4M6MhEV2+5KtUiEFUS
	dVdCLklxyXyhW5um13aO5dj1aPNgSNd85JH8R5ck7lpVb+VPZqAAK/vwJnpKfaCfuo9pDDMyUke
	ryVqRA2GslpAAPdbTA4TkNL6XrFB7L/ECiE2nvFtm4hAeeKnvnkDSo0FWWjeuh/ymbgE8kvFa5p
	0hMgYhUZUNc2AGs0M4rLXw2M3Jmr70YVvtylZQISs0IEKf7iLQ1vXetUC7wIPQmLQwRv3HNtqVN
	V9apgBD28KPij+W98O2jFj/XUIxdVSENJyXPfmTvmuegH8DhUeR8k0+syCBPRhcyP
X-Received: by 2002:a05:7022:3844:b0:119:e569:f875 with SMTP id a92af1059eb24-11df0c51742mr1342260c88.18.1764752500958;
        Wed, 03 Dec 2025 01:01:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGczBS18cVnxW4Bd6f5klSTSp0HnIu7NJ00x9oYdzJHtAvarBMpszrTSCdZO4jtjV255/JWBQ==
X-Received: by 2002:a05:7022:3844:b0:119:e569:f875 with SMTP id a92af1059eb24-11df0c51742mr1342242c88.18.1764752500343;
        Wed, 03 Dec 2025 01:01:40 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb057cb0sm100001866c88.9.2025.12.03.01.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 01:01:39 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v8 2/7] qcom-tgu: Add TGU driver
Date: Wed,  3 Dec 2025 01:00:50 -0800
Message-Id: <20251203090055.2432719-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251203090055.2432719-1-songwei.chai@oss.qualcomm.com>
References: <20251203090055.2432719-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UXFqTnTvI1G5jV4XEwSz8A45ZyitfcX7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA3MCBTYWx0ZWRfX3pxJNZOv0S89
 kbSnQ6sBAX+xMLMuvmOIHJbsUAVPfcxfY8WV2nYAsl9tySy/S0ZJYp/0P1qGmXNRP9fuNrIn9PX
 3ur+qzDHn26pnxI7r5lSxx+vBgu/cDlTWSGiFKGmqpRWESAg4x7bUsXPlH+Okkl6I8mtv1ZJYZx
 i7xbcBmuSpnkf4AncqXQNQ+NxZB7UfAm/qO83PO3Z8Z8/NS29k5brYdUGhxeIf1Wbs8djUaZbTM
 oP+im3kVox1hbLn9SFu6aT7Sr5h0vX8jbbi3Bq7qIBgLDPY4Riv9QjiodzAdz66IpwnnZBahYpD
 BpqjgcylBifQAhz6q1BRbEdrGLszcTNb4tw2MFDvtRM1uw1jCVf0Nz8soUztd2+i2DUFvduA6Dm
 MNIKVpRcqXDeA7GIChgwbnlEDm/aLw==
X-Proofpoint-ORIG-GUID: UXFqTnTvI1G5jV4XEwSz8A45ZyitfcX7
X-Authority-Analysis: v=2.4 cv=ApjjHe9P c=1 sm=1 tr=0 ts=692ffc75 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=h99DN6MNysFgGb7_OMAA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_010142_473052_A308D2D0 
X-CRM114-Status: GOOD (  29.21  )
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
index 000000000000..ccc2bc92edcd
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -0,0 +1,9 @@
+What:		/sys/bus/coresight/devices/<tgu-name>/enable_tgu
+Date:		December 2025
+KernelVersion	6.18
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the enable/disable status of TGU
+		Accepts only one of the 2 values -  0 or 1.
+		0 : disable TGU.
+		1 : enable TGU.
diff --git a/drivers/Makefile b/drivers/Makefile
index 20eb17596b89..46cd62aabfe8 100644
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


