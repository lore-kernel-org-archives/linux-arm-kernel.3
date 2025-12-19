Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EB9D7495A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 06:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gg3gwEOyjqDDo8XAcNT9mbGI0dzn97wIDkd7TasSApU=; b=yB6iMeItFGuFiHH5dGAyfEX0Cj
	Saay69yqb703lLMY0ae/MlElidFkXKvwG0mz5zdNB28utsNrJwioodTM3ldv3bWQccWvuxEUe2Buf
	4x766G8gqYfG0uIvPPyXWh9JXT0aa+KhqEUcwQdwKslGljC2EpLfeR2QQOoQFVuiJcmwRT2+yFfO7
	tCCkyPB01/9RiFhZ4yQX6CZMlYV8rjgMt9zO2W4oqZKubpBW7AmKK74DlxR64h7q89lkeg9MzZPtn
	23iHTimOgNZfGC/BE8JA8kA8scZbu/QkyEmyLJijfqFsv3SrVxcItnDYI5fabm1HJH73RhW8ZUZY7
	If/UC61w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWUSW-00000009jGs-2Xq1;
	Fri, 19 Dec 2025 06:59:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWUSS-00000009jEj-3Jh1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 06:59:26 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cUtM4000205
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gg3gwEOyjqD
	Do8XAcNT9mbGI0dzn97wIDkd7TasSApU=; b=i73Fm+4MlspXLrUZRqd2ihCFV6j
	OrRdU+eetmwJo4ZO3fHeplG9u/N9HcETn0nB++YgWTE1yw1kf+6sG3vTKB8xSeoU
	HLBGHshk0xVBV77LluHUKARPxQt0uxwFo4q1Ig7NODhdmMEfdUG30ESBcwImLjq2
	SX9ZuNIj+Dru3dvZ6UaYmwahICGRVCeFbQM3ezdElcsQusoPWqOmOcrfgAUnd4mI
	43LYdogKprndNnNPWs4KVa8KuWms4cOHQWJvgFg7voHemjpsRuvRdHrIuuxa8u5A
	SeVqCFYzK0Iy+WRpaL9IQF+U6aILNxZTEnxhUAkKUZFw0n/f4Dg23QkzEFw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r29hmdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:59:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso1544787a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 22:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766127563; x=1766732363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gg3gwEOyjqDDo8XAcNT9mbGI0dzn97wIDkd7TasSApU=;
        b=QaULa4oCtrRc4PAol1yTvTjHdyOHUxVRFsgC7Yhu/gGpoBTIYrKL/amZC2I1eo/Mxr
         3NtVsF1dBUxQJ771qjuhiK8hxIMuT6iWLiCDpctZZqwn32gCVoVC5cYECKroHLf66yhC
         K7hnwE0iMpPTKoY1XLxsnH1z22XF3L+Y7IwTUi+MEPWCbO/nMN17CS9WDip8hquQkP6+
         chza8ShE61IalhZCOEDgJ+Ke+u8cWSE6jfEqWArzneg4EMXldiiYi4Wev4YfpN07XCrn
         8u1YxDh6mam9LvPD7lJLDIEakC5eufLlj8+1EmezyKMzvEv8vdRAWcG64A2HLYuLORrI
         56kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766127563; x=1766732363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gg3gwEOyjqDDo8XAcNT9mbGI0dzn97wIDkd7TasSApU=;
        b=IkxuQr8FDbOV2Dr07GptIlNN986Mhx05cHmXmzkZcP502xL2RT0dMCuiBpDQRF7Ku3
         P7YLRT2KLcNkuEEup3I9/y2WxIXooY0RAbBr2zGqLhWy5zP1ITPJmFnNxRqoHdBb5AQa
         1/lIzY+2Mfsz5EXDmpdnNWlAjD9OwmJVGaGRWW74EvW1hW0NAgZptCVaIwIeOv0IRKOB
         OwQKJSI5D4wwafGeLzEWR6oaGGebCHV4yLeOuEf/KVJq56Lptrvzg+k6FT4eTh6QM6LW
         2Rdpkpg9NVHeq1MMCx1/1TKjZG6wmwihlwMzTDwUnroR0/RZOVf2JmWoDzg8VN6Dh5Rw
         3O4A==
X-Forwarded-Encrypted: i=1; AJvYcCXC9MhBU+xrX52i6J6mJpiTXeqT2NRVme8DmMHL5gnoMhQa+EChxJTo0/24Vo/tbId/d5fkYa/WgfF/FZ4dARbz@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsn92i0/MzL20C6xmvWTr3Q6GmhvJxZrFtVjljMkghw2b4Eph4
	2IBZ5Ob+UALxk99mGj2iBYU5HQQuSpEArsWfblY6oGqg/wcmVgpjqp/VFQFs6mX4pCjd0K7TGkr
	rJjayukNkikK3SlO4Xzc88qhhEcvCLbrJkjELMx3MzFwh0A4GPodHsGhrijwkfFqYqu1nQ+sOLA
	5/6A==
X-Gm-Gg: AY/fxX5lm2GieOryZJ8zvMcbCVFfYvdp8AItrVW0WjHWBxfx/ggl9G/PTGrfSwiP3AT
	mYYWtZOB+tDeFqGoQRkAkOsEQT93KWQuqU8Y3ilD4Q1ws2tcJqU4okAepElGL+BNai+2KJSc/Bf
	2H8QWeMar8WpwtU+JZvnJIOuR0sf4kCLs9uxL/9GIBKib/UcDOkLWECifIwS7zaMHCEIGZFJNiv
	UM4gm2C7IquJjxcnQnDIEWMHJDiDXA8tdSvCX71Hr29DqiBrsLuhjR9TnTtb5bzpg5OqDazgiv4
	uzaMic/n7WstMsE96F4kkjY6F1W3cnZc2VfpcWo2cNzA4+yWxbo/jVtg+9OqVdnfn1zGQAKL5Q/
	KC8dUeVsIBc1TD2bUzFBoMSt7JpR0Soi0rKx9CC6utxldgTPx2QInk5+uH2kwxNM/
X-Received: by 2002:a05:7301:fa9:b0:2ae:6024:7a49 with SMTP id 5a478bee46e88-2b05ec6b9c4mr1744285eec.30.1766127563288;
        Thu, 18 Dec 2025 22:59:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJYvLZaWSPBDBbbKCP8gOigcENQ7QN2bMNns3ZqbINApzk9Ho2Lh06XOVZ26jmC/iDkr57WQ==
X-Received: by 2002:a05:7301:fa9:b0:2ae:6024:7a49 with SMTP id 5a478bee46e88-2b05ec6b9c4mr1744273eec.30.1766127562681;
        Thu, 18 Dec 2025 22:59:22 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fcfc1b7sm3614954eec.0.2025.12.18.22.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 22:59:22 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, suzuki.poulose@arm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v9 2/7] qcom-tgu: Add TGU driver
Date: Thu, 18 Dec 2025 22:58:57 -0800
Message-Id: <20251219065902.2296896-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
References: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P6c3RyAu c=1 sm=1 tr=0 ts=6944f7cc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=h99DN6MNysFgGb7_OMAA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: fNF797IbubyxRFGH4DJbFdHa-gkzVSh9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA1NiBTYWx0ZWRfX40zio798QyHg
 aDyYCjewhq4hQnd/W8XTugJS8tcHua+CCIz0rVSwwMBgWYyI0DO0wKfL2LC5o53/D7stb6lm02o
 UkhwpKix139PE7rAQXD5KLH7QlCXFEuuwbBBSwQKeInjiIRtJx52J9ZETulIfFsewpLkTQpFRN7
 /Dy8v/fV6YdzARg+Ph6uFvMRKfTFooLhh7VdMQetr8zqRaILazIpPRhdyCcVlpSc2kzj3ClOknd
 boZaMik0w/TFrvm9Qqhab9XLUk3wlyJywTVCh6++5UEd4GW/ALrbmxnocDDQn1tJDrZlTZEZygz
 Pg3NgliNIscf8BjadxyCCavQYDdHQ+6LMfxUrD8WGf2Qalol4TJhLtW9NNCFlK28hsGL1GuvD7c
 /13pHacgaMQwwhlr1dFEjfU4bOP5PHvHyUHOiT8UzbMVcuwbGjuhxQSQ25kVoTLALzImqyDq9FS
 lTsZaGj34rrYMNXTQlA==
X-Proofpoint-GUID: fNF797IbubyxRFGH4DJbFdHa-gkzVSh9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_225924_854521_EC0EB13F 
X-CRM114-Status: GOOD (  31.54  )
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
 drivers/hwtracing/qcom/tgu.c                  | 178 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  51 +++++
 7 files changed, 262 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
 create mode 100644 drivers/hwtracing/qcom/Kconfig
 create mode 100644 drivers/hwtracing/qcom/Makefile
 create mode 100644 drivers/hwtracing/qcom/tgu.c
 create mode 100644 drivers/hwtracing/qcom/tgu.h

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
new file mode 100644
index 000000000000..24dcdf1d70cc
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -0,0 +1,9 @@
+What:		/sys/bus/amba/devices/<tgu-name>/enable_tgu
+Date:		December 2025
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
index 000000000000..dbd1acbd2fa5
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
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
+static int tgu_disable(struct device *dev)
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
+	return 0;
+}
+
+static ssize_t enable_tgu_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	bool enabled;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+
+	guard(spinlock)(&drvdata->lock);
+	enabled = drvdata->enable;
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
+		if (ret)
+			pm_runtime_put(dev);
+	} else {
+		ret = tgu_disable(dev);
+		pm_runtime_put(dev);
+	}
+
+	if (ret)
+		return ret;
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
+	dev_set_drvdata(dev, NULL);
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
index 000000000000..abc732f91dfc
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -0,0 +1,51 @@
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


