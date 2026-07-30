Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B417BC54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 08:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7mwDzt4pyicsJbF/PR33YEwBkAHXFs91MmvUgurCW4=; b=AThXFwbUcf1UgFX4emsfQ4Or2h
	ubJSr74Of2Z1V1o/mIuuTEQmp1bXCMLmdtiy5Om2FiqijxS3cct2fNIz7EsZiL5fltxGmD4KqJYYy
	bPLG8CM2m+VcRusWBiIGLFnAmOIkKNS0Co90JRqJTiQeMr+9gElphwg+lZJZ98/btSfI9z31jSxR6
	cXJuDID/P625gNvCAnaB1pfEK6YKI4hGrtP8dgKSTZgpsdZS6xN4zUPqDmA15+LvaK8q5a/TtwE9S
	by1GJMiccExp9ISydtDvxf3DASoffr0ihnBpsf3iFvwmrujl6AJdKjsHrYmefq4zy7hciJBa/s3r5
	dwy7fxSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLny-00000009nuF-1zoX;
	Thu, 30 Jul 2026 08:07:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLns-00000009nrl-09hn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 08:07:46 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U6aeIX4139762
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 08:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=z7mwDzt4pyi
	csJbF/PR33YEwBkAHXFs91MmvUgurCW4=; b=OtQ7ECk/SETUBacw0cGjUCSYA97
	Kx40hAmwPyjXXUIxTEaU53QsKLUC3HzDGKAeefqWvLBhv5mLkS3GgE9nYELwOUSV
	CgzsDAN4qx/AhTgCo6vV5+j+5BMiDOhPIFpFJs+SXopQ5lEyr/2pyMJiEat2ZbYD
	lLSR1pilstZu6ZNWCWFTCmJ83J7fZOwiquagG2aNc2U+pij4Bg6729y1ch9lUs38
	xTjir5P9X840EEDkQEwn2jaDIh++xJvkWVaWHHtNzKzI9ZcIkY/nwP65/JyEKSOr
	yFuQxBMaUJmIFDYV+Q19+0hZ3GdEFy6Vbg7g6fUpdtpdd8Sf1ltsvAxsugA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr19grf2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 08:07:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811279d51aso3319830a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 01:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785398863; x=1786003663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7mwDzt4pyicsJbF/PR33YEwBkAHXFs91MmvUgurCW4=;
        b=BrEjK4gUv3Y453PfLAsAhfCe2n3mjrQ5EdcNDumxW7if+6F0YQgyD4QL2YQYIXerBu
         DN5iQMMp5ApHwGQvFORDy/3O5W26bSVm68uMThUxHiqfpFlkCfw8Xiwmlizqs2ccvpu6
         vAxwxVLHvSOW1gxsJCx++WSmRS0XSP17jppMl6NfmT5+m0L951M3aI9hnO/bnx7pgxFG
         cEwgvAaXeEKaYv3/MMFZttn6BUUZ2l0uTboS1Rwyk4mqEGEheOZns0f7C80MYUTvqiES
         1iCG8g/y+Fj6m7NIh4dGUesEQTDCjQneXufQYBB9SJvclP0OqFu7XZFvRfgn3qa8kgQY
         EVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785398863; x=1786003663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z7mwDzt4pyicsJbF/PR33YEwBkAHXFs91MmvUgurCW4=;
        b=WKOEcUqrED7d0orBFBYlP8F2TgsQmhK8oeG8E92Cxh5q8qW0O7rPI4O1/n8B/31who
         07zk4yf+6xHS4TcqznIxi8Xv6DtyIhmDhPKp4agMUazvu/DihjMs5pD4ekbGoXqKuFFV
         kppPomy9abiazKtEmF15Gjnl98h76R/S0WFOxjlEgxbM/KI/PD/1Xt8WAUyCaiede+Nt
         8gGZOEnNKAOwe9auv6QGZ+nZVBG3jHx1Rtposc/J9AJBV1ifaftu9ZOk2G/+C4Jo7QdP
         YlZHu88x9/0SU2JmnzFxoEkAIZM5JNMR1zvaGmCzuQANJ3v6HLCBtHbpJbg+tAQx8OLD
         iMIg==
X-Forwarded-Encrypted: i=1; AHgh+Ro5VMTr/H+zqEZEhn0VBuHMgt3d6JZhvgWdsN73ccUibZKy7fx5N1jcPVJj6eRUwwU3g53Qgzot41opFAyH6KPE@lists.infradead.org
X-Gm-Message-State: AOJu0YzkFOWn1rcjXnHPqnqE9ufNeSC4PN3Pa25izCVN5UyV1gdanuCT
	FF3DJ+fl5XgFE7ACTbbygnrjvI6CBXyEsSpW5r5icB+U8XDHNJiP5ExEOjM+b1WxnE/wvnYSJBA
	7eHHrQE7MDVc0+DTXg8GkP/ngo6LhRdSW/xiKsOBvt56c9R3rp7DFp79pwfFcFRcUrkfUQh8FOp
	9DDQ==
X-Gm-Gg: AR+sD11tZhk3azomMViLN12mOCfteFRnzzFgbTg/V8wRA5aLjLeC8bSGqVM6GV7aLpW
	huYhtNGb818doi0+QnyDZ8YINKO0jgZZTojqxzig3IR8+cMeYohZ1uy3Sp34k1RQ82+MkH/7InB
	RVMHWPzsLuDa3f1RDBiX8WkBMDPgpxZlUqEQSgRaEe8GyxmFFscQ8m37kssDcNSLKaAQPA3hxiD
	AJGRdjA9wTj9GOYRJFade1wHZ0nSJOWm3PgNPuXZrkSbAkJ+AuqM1YIhV5zNbd6Sn9wHVU6vl/R
	1k2ZcIBsCF2APoylXS6to+5YfZvO7riJtgPXVGvqva7fhk7uXjk7ifxPkNmb/RxnVk/rsFPLcV7
	xG1yjIo4Zu32Gpym4HF4IBz13dpUXco9G2LN5h++4+zlegYiwxQl4ZWo=
X-Received: by 2002:a17:90b:3c11:b0:38e:488f:7068 with SMTP id 98e67ed59e1d1-38f9bd74415mr1582722a91.2.1785398862839;
        Thu, 30 Jul 2026 01:07:42 -0700 (PDT)
X-Received: by 2002:a17:90b:3c11:b0:38e:488f:7068 with SMTP id 98e67ed59e1d1-38f9bd74415mr1582687a91.2.1785398862390;
        Thu, 30 Jul 2026 01:07:42 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9bab61desm619516a91.13.2026.07.30.01.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:07:41 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v16 2/7] qcom-tgu: Add TGU driver
Date: Thu, 30 Jul 2026 01:06:59 -0700
Message-Id: <20260730080704.2903540-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1NyBTYWx0ZWRfX11p/IExLskgj
 O99DaEjfuls6m1h8khUxZOXsQwYlWwa013rQkuzPY2s3OTZXGa62mNzz9izZDqOSlLzbD7iQVHW
 nfBljzAdc2MRQ+XF38Wi8rL+IlELo1PUjWAaJQMzOQbCIlAbLDBozomGbldHA6LXuU2IPrnjBWz
 qW/isumek+C/axEfe1ieWOUyBJ5ex7Qvp/NJ5kh+7s9N2dUJYrY0BLsGuTiN40fmTX3PQiv8ZF3
 3+0gtTZ9sRqGmFFoIzWHteuC/AtzybVsZr49VQPw2jQhjd6AC+x7QdP8JRHXtglD9N8yy+HQSxq
 7MkRuO6ponsDsEpYsmTkthW3njuNxEsWYtSY8xnkqsFVRmFS6LXPSqkz+icRApQy4NWJphn1isw
 frousyHfSz4L0INd/kGjfLqrkMnedODYPRrAxdV9KeUzE1Mq3MbA32FpKxR+hMQ9Y0foNk0+Sk4
 K1CnkO9bzjIWClymSWQ==
X-Proofpoint-ORIG-GUID: tguPbPd7CCeN1NyFfltfLCR1KQ_kht1k
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1NyBTYWx0ZWRfX6JcyC3qMju++
 isqWzeu1qzD7EtufzUc/D06a0V/DJjFL/JlY8kp3kX6Nje1jIx35otZwlsAPpROWkUMPKw3hfRJ
 FYEsOyLI/SWjrAKj+H83xxW920uG7B4=
X-Proofpoint-GUID: tguPbPd7CCeN1NyFfltfLCR1KQ_kht1k
X-Authority-Analysis: v=2.4 cv=d7bFDxjE c=1 sm=1 tr=0 ts=6a6b064f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=ihhBPCL7kiVGXwQKODUA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_010744_108782_4E7020CD 
X-CRM114-Status: GOOD (  30.38  )
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
Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
 MAINTAINERS                                   |  11 +
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/qcom/Kconfig                |  20 ++
 drivers/hwtracing/qcom/Makefile               |   3 +
 drivers/hwtracing/qcom/tgu.c                  | 192 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  51 +++++
 8 files changed, 289 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
 create mode 100644 drivers/hwtracing/qcom/Kconfig
 create mode 100644 drivers/hwtracing/qcom/Makefile
 create mode 100644 drivers/hwtracing/qcom/tgu.c
 create mode 100644 drivers/hwtracing/qcom/tgu.h

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
new file mode 100644
index 000000000000..36ab64f1e301
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -0,0 +1,9 @@
+What:		/sys/bus/amba/devices/<tgu-name>/enable_tgu
+Date:		August 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the enable/disable status of TGU
+		Accepts only one of the 2 values -  0 or 1.
+		0 : disable TGU.
+		1 : enable TGU.
diff --git a/MAINTAINERS b/MAINTAINERS
index ce5c5185c773..4789321cca6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22360,6 +22360,17 @@ S:	Maintained
 F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
+QUALCOMM HARDWARETRACING DRIVER
+M:	Songwei Chai <songwei.chai@oss.qualcomm.com>
+M:	Jie Gan <jie.gan@oss.qualcomm.com>
+M:	Suzuki K Poulose <suzuki.poulose@arm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git
+F:	Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+F:	Documentation/devicetree/bindings/arm/qcom,tgu.yaml
+F:	drivers/hwtracing/qcom/
+
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
diff --git a/drivers/Makefile b/drivers/Makefile
index 0841ea851847..6a2cbe5b340f 100644
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
index 000000000000..9c7dd4a09f02
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -0,0 +1,192 @@
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
+#include <linux/mutex.h>
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
+static void tgu_enable(struct tgu_drvdata *drvdata)
+{
+	tgu_write_all_hw_regs(drvdata);
+	drvdata->enabled = true;
+}
+
+static void tgu_disable(struct tgu_drvdata *drvdata)
+{
+	TGU_UNLOCK(drvdata->base);
+	writel(0, drvdata->base + TGU_CONTROL);
+	TGU_LOCK(drvdata->base);
+
+	drvdata->enabled = false;
+}
+
+static ssize_t enable_tgu_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	bool enabled;
+
+	scoped_guard(mutex, &drvdata->lock)
+		enabled = drvdata->enabled;
+
+	return sysfs_emit(buf, "%d\n", enabled);
+}
+
+/* enable_tgu_store - Enable or disable the Trigger Generation Unit (TGU). */
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
+	/*
+	 * Hold the mutex across the whole check-and-act sequence: the check of
+	 * drvdata->enabled, the PM runtime reference counting and the state
+	 * update must be atomic, otherwise concurrent writers could each
+	 * imbalance the PM runtime usage counter.
+	 */
+	guard(mutex)(&drvdata->lock);
+
+	if (val) {
+		if (drvdata->enabled)
+			return -EBUSY;
+
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			return ret;
+
+		tgu_enable(drvdata);
+	} else {
+		if (!drvdata->enabled)
+			return -EINVAL;
+
+		tgu_disable(drvdata);
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
+	ret = devm_mutex_init(dev, &drvdata->lock);
+	if (ret)
+		return ret;
+
+	drvdata->enabled = false;
+
+	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
+	if (ret) {
+		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
+		return ret;
+	}
+
+	pm_runtime_put(&adev->dev);
+
+	return 0;
+}
+
+static void tgu_remove(struct amba_device *adev)
+{
+	struct device *dev = &adev->dev;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+
+	sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
+
+	/*
+	 * If the device is still enabled through sysfs, disable the hardware
+	 * and drop the PM runtime reference taken in enable_tgu_store() so the
+	 * usage counter stays balanced. Use the synchronous put: the driver core
+	 * disables runtime PM right after ->remove() returns, and the barrier in
+	 * pm_runtime_disable() would cancel a still-queued async idle/suspend,
+	 * leaving the runtime-PM state inconsistent.
+	 */
+	scoped_guard(mutex, &drvdata->lock) {
+		if (drvdata->enabled) {
+			tgu_disable(drvdata);
+			pm_runtime_put_sync(dev);
+		}
+	}
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
index 000000000000..ebba49402a20
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
+ * struct tgu_drvdata - Data structure for a TGU (Trigger Generation Unit)
+ * @base: Memory-mapped base address of the TGU device
+ * @dev: Pointer to the associated device structure
+ * @lock: Mutex serialising enable/disable and the associated PM runtime
+ *        reference counting against concurrent sysfs access
+ * @enabled: Flag indicating whether the TGU device is enabled
+ *
+ * This structure defines the data associated with a TGU device,
+ * including its base address, device pointer, the lock serialising
+ * enable/disable, and the enable status.
+ */
+struct tgu_drvdata {
+	void __iomem *base;
+	struct device *dev;
+	struct mutex lock;
+	bool enabled;
+};
+
+#endif
-- 
2.34.1


