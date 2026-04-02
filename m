Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA21CD39403
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 09:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZaEG6ZKcedfi4AQS4ZSrWco9P0mCBULI4k4ihcHhYs=; b=DnYHUQBEq5SFbRQg7EeHpE8f0R
	z+6RmNbriQXQ6ri7CPItgCoCImdXwIt6mm7C3WNPeTR/i0IN/B98/sawT3mJ45VM3Ir6UiHy3UyhI
	PAOqEHJQ1GBUNai14G5ueJw0Zm3KsWEjqVmoBCie1bsYwQLOejfAC7ICZxlDHJ8kN5wE1oXiEg3CA
	pBIk9blkOVY+Axcu/tbBTPFpVJoh8JL5rwufhRGvNNA0O1CLg8vMe9PU5BCsA8nNKE+CMrpmjN+Gk
	9ZP2iI0RAjwEUXjQCnlMvP0WcN2SHu+mrCwKBdYR+a1crwRlrawXc93FMuryFPFd9AaEWnGpxrYOO
	OQHdIPVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EMG-0000000HGmI-2ttQ;
	Thu, 02 Apr 2026 09:29:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EMB-0000000HGkB-0to4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 09:28:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6328dATl1249508
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 09:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OZaEG6ZKced
	fi4AQS4ZSrWco9P0mCBULI4k4ihcHhYs=; b=WmRY2AcErmE9lGxSgVZgxPXQZRi
	O8S6vy0Nd/na0yQLxkFlcQTkgkIYQFCEHlEZon7Ndo4uIVVtMN/jMmOEEMIbdK8U
	T5fdpOcAz84e53/XVP5L2FDzwSyFQcmxhAHgr6ldK/nsDricmGK2MCapF4SRww1u
	sDlzUWv4jc+93OCVBojc+EqgaY0aHuD4NRdrabAiz3glMAjOt6coNXSC3WdXSpyc
	tzV/svKMG3lsN3RaEFvaG2Vm/ocdG3BMay1lwqTxV+AlRM/oQTVw9YzLOyELGyFy
	MQCqJqfYE+yue8/7yE9UDXIH7xi7Tl5hGP/RWcTDb1fVmcdyvKBgfezEw3Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9n4t06ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 09:28:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so995986eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775122134; x=1775726934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZaEG6ZKcedfi4AQS4ZSrWco9P0mCBULI4k4ihcHhYs=;
        b=f1UPPdJq7TlccxZKjpbrj8lqZTT/xkS44P++6rL+s1sc8yjtVd/ERjG1roRz/EZa6R
         /8shwygRxBIEm8P7CcDOco2sqWDnsKJPSgZv8e3AtcbmTeqcWVHbcEBavR5ZNWxtHj3u
         pqMN1wpTDgXL4xr5VvFDyQ+xljXofjaYV7Pfdxtmmer5JT7VTgjbYy+eqm/498azNVVZ
         B48GSGAA8BsX4plMJqQ4kWmlX13IHJXmDKxu3gMTD2kzsSa2LXJipzvWOElD+sTS700i
         3qVt67nHY8ztTO9+Gi2W/lROvNj+GgessSI2WZKACuKI17nFTb7MRqztDOExM0TM4laq
         50QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775122134; x=1775726934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OZaEG6ZKcedfi4AQS4ZSrWco9P0mCBULI4k4ihcHhYs=;
        b=VM9VFwovR+edSM+nrH0J0QoHWlDAfrMLCJP51uiyui+/sAZ4UrlyiEsjZJ8htYdFHo
         LT7mpb+cAq8A7LhXhQo8WjycmUPmBC/GxPgLe5eF7tE3Wm5ir92wP+lcrSDpSG9o45w/
         Z/vMlOD4SO5E9QbNKh2wOmjdFUsJt/VC1VvTPHlg59JC7ZnUre/uo31o7lhN0Vv3SFFM
         eY0MVhuc6HYaDGPG7VGcqHfd6qWIpR/6hBRJOWrQSiFzHEAbZXvD30a7WTRbOiiZLTsp
         VZ7VY2Ap0nlM7xJybMvuDHORyD5xPNZivByUhW4a70ZKaQR4J8Fp1KqwqEi1h/2YDVVY
         kDJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWse6UBLFMMNSxOL0cpKmyoFQazm2IPH4xY7bBKDzxSsO1H3CF5r4PXf7PEU3uqpFDtYYTN9qbwUh0rQhZ7s6Cl@lists.infradead.org
X-Gm-Message-State: AOJu0YzSqtQPjYyWP1YSXRUEJIokTuFH4WbGrpaQ9aJdKpvAbi7Q8rtm
	FN6amaEeAGG6kDshg/na5Mlb+M0jPe37uM5uC8s8s2Xh1ujn/EoIvbkdt/CuZKBqndoaYm22CuN
	oq9j7RgtbNK1jmxY0KRYupq5LWmL73bab3OFY02Z0/3WSX821cBTp4GedbyO9tehYFq8dcMNz6n
	wpeQ==
X-Gm-Gg: ATEYQzylRYSUglHQ1T+uhJKiAKrLR2umhrtADYZLB4Tuc9WBfVUxbYygdvaM6Wkl2xZ
	OfDyaZw8qduqlnKtgGzLC8jGehAkBSvN6Xh3S1UWrTvnBE7cnGJ/n7zecFcJDvF8PHl2ZcdCbM+
	C04kFmAyvGY8LaL+NrFWIYkbdJcacIRH2OAB+G9ZBF8q+5aKhQa2cwvKMhiw0goyRnKjpN0UqMz
	aE7cWLjC+ajUY5w6jEX0J/uVzrYBXSOV49TeEHV5Mh20afyW109AZTgMaITcuhvFBClE4WGXwWV
	09nn3kW8ndWSwptPD3sE54bHy3DibCkdttflPK5yeALxUbPKVngdhwRkEYeeNJXr53S0z7W9Mcq
	neJOMdzWMi70Yuoq+rzhvcIUEILiv2s6E416VdQBxb25ApEQBY2mf6vCBTssyQttykcNGwzyTfw
	tU
X-Received: by 2002:a05:7300:aa8c:b0:2c7:31b2:44ad with SMTP id 5a478bee46e88-2c9331af315mr3531648eec.31.1775122134048;
        Thu, 02 Apr 2026 02:28:54 -0700 (PDT)
X-Received: by 2002:a05:7300:aa8c:b0:2c7:31b2:44ad with SMTP id 5a478bee46e88-2c9331af315mr3531634eec.31.1775122133456;
        Thu, 02 Apr 2026 02:28:53 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cafd073194sm951094eec.28.2026.04.02.02.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 02:28:52 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v13 2/7] qcom-tgu: Add TGU driver
Date: Thu,  2 Apr 2026 02:28:33 -0700
Message-Id: <20260402092838.341295-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -RPgOhN03hZ14imQapGPx0qs2B1jCALD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NCBTYWx0ZWRfXwsS5ass04okK
 X8MAf58i3++BUlrcqTh1AVaBNiicXCjRYY2lNps2PwhTXZcqtG3jaHsOlFfJYMljj5ZtfgNFZGS
 gnmmqM8keCRU/LcWMCPloEKRTBauj+8cquSZYablvMRq/w8XzyW3hijjR6qCceLjPQhRD9jVjQb
 0w+LhNkBL6++61nJeoZN1P2OPTPffUEey8YzA2+rIyYQF5+ampJw35dzoB6+8O5A9BNQmf6n23l
 kwvDBWFppWDrTNq4o4YWHzoZBV/7RmigAFB7MEeu4z45LW+mmgZBBSfmHpTdGGmLhsX2vE/5M7/
 D76hO2jQnLydl0I77+WsO8U3AC8+HkUPhyLlAZ9PysEF3cQpUucK1LiUq+yeoeLRRvpmvX+MxqH
 zvXwHs4gCv5HQOlYLA2Y2Vk+s142LwNEnuZNALjE3pVQp9BPn95yutCo+HDu8Lc06itiarpTmTV
 XkFfEprzEDVxAD+8ujQ==
X-Proofpoint-GUID: -RPgOhN03hZ14imQapGPx0qs2B1jCALD
X-Authority-Analysis: v=2.4 cv=Ap/jHe9P c=1 sm=1 tr=0 ts=69ce36d6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=h99DN6MNysFgGb7_OMAA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_022855_259178_5632C1BC 
X-CRM114-Status: GOOD (  30.96  )
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
 drivers/hwtracing/qcom/tgu.c                  | 193 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  51 +++++
 7 files changed, 277 insertions(+)
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


