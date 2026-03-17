Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDE0FB5EA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 03:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjTMyY/nVZ5E0ydjO3Px6iHuenx+E5iNzGh3OC3CnXU=; b=BF87uOS4fSZL7OWTxJg9JC06VK
	HfxyhmZNj/Qf+Rq8mACnK54G+G0MarU10TAu840KEHx3lq6oNHHKOscVjo8KfgOg//17VvHfDaFMR
	UiHbdZ1o1XlZco6RQHKiGzXIkZX5I+4VQAO5/XNNz4c/b5pEZMY7I1WJoYW+CrdX1phAmVYittmWn
	RlM4JTwK7Yo2nInMmLjh1dq59X1kZQw/FbswZktsZI0zd0ylXP2zAq1THK507EZ3YlnPB/Pt0rpe6
	kwGiAl37Vcmkoj4Dchac6DHqZ2NtpIZka4LqEkRR+3EKhCe9uwjb+Nbp1kZNAm33PpXyMA6jBi1CT
	qz//1eSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2L58-00000005J0R-3bYD;
	Tue, 17 Mar 2026 03:26:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2L53-00000005IyU-23Kf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 03:26:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H0u64q796131
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 03:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rjTMyY/nVZ5
	E0ydjO3Px6iHuenx+E5iNzGh3OC3CnXU=; b=baDrXJIh7x2gDW1lg/mOJoYi7Gp
	MxmF4JWQSzPyHdyOZq0hKN6PMukY7SZ9WyrLe3TAul16AGmYylLAbxKdQv65Hc+j
	Rfo5h4/KmeLXUD+eYpGeckJvn41bP+4hm6aASlJGy849lFsFs86re8TXO0FGWw5y
	pUdHkh7T0eZYPaud5JmTgfZObNz9pPxyMp1p9jWSGr7PBTs2WD+JMxz5mjyBJbRt
	2b8tw04OmAZPclkQJIRy7Nok4NOl29wjsk5cpHkCSz0ODeZ9372E2xrjrpU461QY
	AMysuBv1lbM8W8tVocA4BsJTJ3EDysXaMT/KUAXfUfz473p+lDk/w6Qr5SQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm6d25jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 03:26:53 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bead0a9123so19450867eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 20:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773718012; x=1774322812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjTMyY/nVZ5E0ydjO3Px6iHuenx+E5iNzGh3OC3CnXU=;
        b=O+JYRLUlGmRAKBhofC1caCagw7vRRhomTQmSXF4+Efz6SP4KsczZMjwCS79jmzLzzj
         +HcbZ/F3bhO2sHH1UkbOzafLZ4tc8sJjooEdkcsucPPfIQBUaQ5gh/i6hW1YhpeVsMhS
         2pD9HDG0HHT5r8Lmzc+tfD4fChanE7f5uZc1+6hB40HKwTgKPlHa/mDOve9SFgwbzsXN
         WQB5iKaxXcvkZWB3G8NS5unllkKPV2nMMqez2glTqHttuA9KZ06AFlvrzT56tYnjRMyO
         6xE7QS2rAgmiCmorJv8mQsQf4PMZxPzLkercJBDDTlN8xUeE6XK7puvXAkL/4l/LovzL
         Nl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773718012; x=1774322812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rjTMyY/nVZ5E0ydjO3Px6iHuenx+E5iNzGh3OC3CnXU=;
        b=sxOw0b9af1ZI/zzdcuvhsc7cafSpeBEEj6PJ2oIIumKDVUI8TqGlRwRiL/t+2McHoK
         ydj/tZH63JLS8cOLdcl4PludUyYb1vNw0AwvICKoaI5WcDTJv1/OHZYlDJACVWv+D9Fw
         97u85Z45CVZc0I3Mf7FwQg+F6OMUce4w7nbdlYWaOPHHa99wYiOwPqisnueStX5YoD6l
         G+u7ZHZlckPMETbY+D2StRUveEaDCL/u+DaYfI3iS5lUa/DwSWXGkW25Ce3n5ScRx2mp
         gc2DpJWsW+mGCEp0kbt0CQ+Wsj3AXRYYSP3cf7g/EWzogn2tFITIjSxR2NYbmm4VMMyP
         ENHg==
X-Forwarded-Encrypted: i=1; AJvYcCUUmY2H4RslEs7TeIj32xIYx1OuDoZbEayReL0MGllGdWaasXjR50iiJabKRhCJcpvoEw2zCSNo1xWNLaWNr2uw@lists.infradead.org
X-Gm-Message-State: AOJu0YwG3IdIraW2D0AXNJDNyj9WmchwupIbROxbSkG1xby7eSg/wbtG
	q9boUsEUFWWAzWjbhKxgK1UeJio1yf9y34l0MNXt/kSVQbMDThe2zJJ9sIPdtwC/EQs6bITwG0E
	ujapTt5g9ck5H/9F2fruEohIwf2inKzYiOTf8k1bswa/f0VKZWqjeyXly8cMLx6F4bPESUzYIBp
	6iEQ==
X-Gm-Gg: ATEYQzy2AQcelmd2NkjDFQoXW1eZ5YeitGMXEOvCEWqWYDdRE0tssVF7KuexTxelSkx
	MvmDfAUKW44hjoWSmqyFVfaI1ZwO1n2j0jImGLDmKjZRXoYToH6k0gZMKRq8mzbvafSZTD19mGb
	J2neI88k0sXBid8TmN/EFR1C4TenCvZ362kvmwoLmmwN2XT31/G0R4Po2URt1q8iPiZttSplVKq
	SGwK7OIQeOBJno5POLGgaPaXlclqGYUvcw8DAb/SxlXHjCl7FYpRDb/KyW4OWtpkiOAuInQLFJ7
	lhnnELQoYisgYUmlQWDn1QWlVfo/kAbdjS+lVrrjUXfoV4DwqyZiZX4u4RtObVo7HogY5Z2FL6E
	P9RjyIwltA3ypN+c2H7AAiNQZY3AJ46YAmOt3Nb6LYTdGx/mIDm5I4iuNY0jj7jLBqLNmR/P3RW
	87
X-Received: by 2002:a05:7301:1f17:b0:2c0:c63d:e02e with SMTP id 5a478bee46e88-2c0c63de76amr2980173eec.3.1773718012307;
        Mon, 16 Mar 2026 20:26:52 -0700 (PDT)
X-Received: by 2002:a05:7301:1f17:b0:2c0:c63d:e02e with SMTP id 5a478bee46e88-2c0c63de76amr2980160eec.3.1773718011716;
        Mon, 16 Mar 2026 20:26:51 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3ef844sm17445895eec.15.2026.03.16.20.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 20:26:50 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v12 2/7] qcom-tgu: Add TGU driver
Date: Mon, 16 Mar 2026 20:26:34 -0700
Message-Id: <20260317032639.2393221-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
References: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c7+mgB9l c=1 sm=1 tr=0 ts=69b8c9fd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=h99DN6MNysFgGb7_OMAA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: YO65PTKfc4H0AJHYD7dLH23gjYJQ9Vq6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDAyNyBTYWx0ZWRfX2ZT/pNPNybLm
 SjGJWpmC9pKSg+/IaK9Xvolzgg3hNooWQAf+VG6WOY9T5qh9Xs+WMggWCOn9+Rgobay/tdrFo9E
 rAFbyJdJIHMOnsGtsntseLsZy5qzMzbRbEd+xPos55gBmFFwe72qsST4j0nsnXmbjTbILfidfkP
 96p40r9U0AlGo830LKQ97KPh6uBJIELmH6VXfEq97sK5GbcKc6s1dY9zSssnRCDhtjAErevQiYY
 aix1Z3zLgomhLTzQnqaAnnzPSbmC5jzMTkEPIdCitTL18ipwT6ph5WDxkDKX+t0QU/jVYdpTzHI
 C3yP6o9TJnF2/Y6Sua3GHIsRK7mFD3TbCBdz9WqNFReCf7MJjx9CJ3q1Xg/+GzNvc0KBgnMSWXc
 hdSHVYYrbhOqFT/YRI8EPblTJkYMvsdHIKwKULZH7M2uXT2uHFHs4pTSrDHS5EIzqO6ficR8S/g
 TC2qEWeZaI34y8U/mOw==
X-Proofpoint-GUID: YO65PTKfc4H0AJHYD7dLH23gjYJQ9Vq6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_202653_536739_6DD9B451 
X-CRM114-Status: GOOD (  30.59  )
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
index 000000000000..ead237bb7d89
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -0,0 +1,9 @@
+What:		/sys/bus/amba/devices/<tgu-name>/enable_tgu
+Date:		March 2026
+KernelVersion	7.1
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


