Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F34AEFCD73
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUousL1A5O+9XuGsxNbzLZLx2XOHUqV36IflzFCBpCA=; b=Ow/8hcYyMxBGbAxMPHm/1DE/IO
	ulZfBjBRV5i1fOmHlY7p3a3UZ18x/o+xxwS+c9KDA3xYpIjUbtFhyXzrt0XhbGK0N9B68qw0MKWty
	MEd5WpLERc3FnwRIzl6BuY4mJCiCO+zXAOEh/WdTBlIplq/3RtrvTVY0jRCA5x5r7e0LoZpDbqA2V
	5lQ2uOowjCt2xnZTBHvEBC87XU8hHnjlosHuc8GtdrmsnjcJIUZFd6aFW92rAHUlg62nfAs8XtSHt
	RCDovrejSXPhjzBNSCs9LHEHkGrKGaoga3xbsmKb1w7hBKoO976ohIjmR8WxzPplv8r+IlffVESDA
	wD59WWVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXED-00000007188-0tWB;
	Mon, 09 Mar 2026 09:48:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXE9-0000000715J-44qT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 09:48:43 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298WBKt3773205
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 09:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fUousL1A5O+9XuGsxNbzLZLx2XOHUqV36IflzFCBpCA=; b=GOGh24cbN/ohLmQ1
	WAdnPlf+qzWGEbUd3puiCIhBB2Ish4EezRjgZ2qQlrTSceNWnYxKk5vygwWqGbpd
	mjlHdFwU45xVVwNkFUUb4Y47tJT2vPqmR2YF1xlLrgXOrNENT+pbG+qv9n/kicw4
	LNGMfWS+QGdAgZeYXxBh+zzLIlHZ5seg+tDVHM8heYOepTsf3c96WxoVC93tyaTD
	WX+aZXmIfo9L0nrxmirtU+s6TGRkSD/4RFk7cf9ENX5LncWXMMu65jbWAmUzVjzX
	0RZf7pwdZFphL2AWAWhSgUU6vRXhgEAfNzfdJ/njZ4CU1RTB+S5ujLjgNpFhW5eb
	y+fBcQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa89gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:48:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae50463d18so75296415ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 02:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773049720; x=1773654520; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUousL1A5O+9XuGsxNbzLZLx2XOHUqV36IflzFCBpCA=;
        b=Vg649Ez18W9hCtzNNZSOScVEgUM4PXgFS9k0pt4SdNEM8G+7JdXPNijXffR6cTPc4Y
         g2UirtQw65vWcoQal67XBXIsykjZVq2pD+iXDB1/QI5LHAZdUS7sHs/hCy82LR0vYse/
         LbQUq8W10lQfLarsFFjMbJe9xZCFi9F4lnYc7EFBx0uQhWfnBserpHkov18WUZxSzsdr
         uk+PpNxHqgVKO9D6XjwdqcvWEfOd2C6UOTCzuOdNANPCEcCG24R3Louu+onhNHz7Y7Cb
         Ou0bDyEkoDCEZTXLTDAnph/jo4MPlJci1BN5BGrQSH/+l0BaKyF11PgSI9fNKw2Nt+wU
         4lPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049720; x=1773654520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fUousL1A5O+9XuGsxNbzLZLx2XOHUqV36IflzFCBpCA=;
        b=SHo/1WdfQDWFc5mNaZc/0Ep7ibivclAJfDNO0uz5cBPHNM62SPLWLrgsdacH3VSfXv
         IlB6FzC6H/mbVyxd+7cN0Ev95aGqfwsQv9fmvYfjli1QsTFNW88ej3L9w7pOVlWjMnvE
         10hFTjEKw14FMVZN2MKLsw9AyLCCHUvvcbragwNzTkvAwCf3gk/9xpgZuPHjsbG6tQQw
         CnclMHnIHqLP+A7CscJoyWmqVa0nOjoPFXs0SeULGPJD8TNU6jMgM/Uz82xf0wIdwW3B
         SNpS8ol4d6KZcu9+p5y287LiGe6WRvZx1Dgf9qP8vEEqo3o34MZ66/9ckFU/dQpAH07k
         75Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUP1nTng88tOGarzeeASADu/K+OgKKSlfD+H9u926BZw13looUun9ku5dnhFl2XQpO3Fz2DJ524uwX7iULHcMAZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwBQhXZI8jz/9y6G2CL7K/TSuGxCtZAJsKSf/W8HkwkI1Gd78W1
	yZpxagOZW0yM9w2W0fkqrJa8AmQWdXVU0ubX7gVtQIyBzwTi1uELCEYpVO1NZDXhTm2+aa3RxyZ
	5MaF88ppuaGcjEmLHf2kUmuNw07x1DNfXuxS/+dJlxUfua7XKMDqcKOAGOU9xquOkD9oTVlo8xh
	+3OA==
X-Gm-Gg: ATEYQzyIrbqdf8Gaww7CVwDyOAWuQBdLBcn6IMyZ8aWLeIDGSD1yQKZXqyTnOrHG8ok
	AasoPLZD7dTWRhtvjSqqkWq5Kr5tUeSaVCQNXQG1Cc4G8/quRB1XaOPgq439tXsfGd6BPz5+Uo5
	u3mPZ6o2vkt7JtvRPuPCy6rvKHWiRSjm42jDVrHw+HtOJ5TaR4LQ95C6huQ9aV2lZXUb9Buj1Zz
	amtDNqdPz3/voM+W5Pw9sixR2bYs1WEwvJPclQPqgsvPZReO5Qw00keb6BUk26igCWk9HX/D7yU
	cIyA43Ez1soPHN9huKdUp0TxGYOXIxiZqzm1JnTynvZ8F8aifpnAD2MWrlBA+YWAUbaHuLC4Zby
	uWn67ig1XIJWr3tko7hYa1xHAke3LvCdNJJomHsDyAPOxqsGslhLnC5zxKdvDLfJQgwtzYqUd/3
	tWIud+jGjz
X-Received: by 2002:a17:903:3bd0:b0:2ae:5435:1940 with SMTP id d9443c01a7336-2ae829ec14bmr89343565ad.20.1773049719328;
        Mon, 09 Mar 2026 02:48:39 -0700 (PDT)
X-Received: by 2002:a17:903:3bd0:b0:2ae:5435:1940 with SMTP id d9443c01a7336-2ae829ec14bmr89343445ad.20.1773049718738;
        Mon, 09 Mar 2026 02:48:38 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm104948435ad.5.2026.03.09.02.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:48:38 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 17:47:45 +0800
Subject: [PATCH v14 6/7] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-enable-byte-cntr-for-ctcu-v14-6-c08823e5a8e6@oss.qualcomm.com>
References: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
In-Reply-To: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773049687; l=26004;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0T9jMctLmHsKsJot7YHh8HAddfx384FnlCOuHPfCehw=;
 b=tsG9QCRl4EFuO47U3OcDZSjkzwi6fiRrGbrHS4DW/Sf7DtQIYJWfxDPUHJPReaoCLvk7QiR8T
 eKOwdGoCMc+D4tUp9iIp7xgPzIRxeEg2B5BO3S4XcXkNJ91okU8/LJz
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: 4U2NTh7HNlAXP3R7i1e1kVU7oqQ5eegE
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69ae9778 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fFPNNibJxoUyT2dqj6IA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MCBTYWx0ZWRfX+cbp8MjdmWEY
 ls3jcQdynheVfhNVh4SddEXBN/HxKvhscMBSHQnrjGP+0uAyX+pSje2tqADkY555fz8Sa8jL5vs
 jJqHwc+UvivqpE207zuNqN92unBOoPwrHwA+Et5eWycUoX2V5JOVII7NLRFtSI4C/cvv6Pxofov
 dPK7BrG2hm98szPkw/vew8ynhWfxxvEwtu+qLexJQ5rSNMPuggkfzqCpeN3n1Q3enJTdDRV5efF
 kQKLrgOw/w/CuQv8F+81f5/F40DkDRUEa5bAb36jaZSxCUfmn5sERdhJep5MYiP/h6khj/3fq3H
 wL/Wfkdgb/shC5iVy2MrIYKgP1JlsMDY+iWdeTmPmCCKKtKNs9L3eYc50RzuTQCGmYBJm/mH6fP
 z+JhdLZS20EyGKNQd0G07by4SwjNSdp/kOrlP5YB6qcSIUbW60/xwx1CBbkWqBv1gL7Sjw6dT7W
 r7TR9yqN4OB/e+mpoPg==
X-Proofpoint-ORIG-GUID: 4U2NTh7HNlAXP3R7i1e1kVU7oqQ5eegE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_024842_151090_9D09770A 
X-CRM114-Status: GOOD (  31.61  )
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

The byte-cntr function provided by the CTCU device is used to transfer data
from the ETR buffer to the userspace. An interrupt is triggered if the data
size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions and the read function
will read the data from the synced ETR buffer.

Switching the sysfs_buf when current buffer is full or the timeout is
triggered and resets rrp and rwp registers after switched the buffer.
The synced buffer will become available for reading after the switch.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   8 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 351 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 103 +++++-
 drivers/hwtracing/coresight/coresight-ctcu.h       |  76 ++++-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |   8 +-
 drivers/hwtracing/coresight/coresight-tmc-etr.c    |  18 ++
 drivers/hwtracing/coresight/coresight-tmc.h        |   4 +
 8 files changed, 555 insertions(+), 15 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
new file mode 100644
index 000000000000..6ff1708fb944
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
@@ -0,0 +1,8 @@
+What:           /sys/bus/coresight/devices/<ctcu-name>/irq_threshold[0:1]
+Date:           March 2026
+KernelVersion:  7.1
+Contact:        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>; Jinlong Mao <jinlong.mao@oss.qualcomm.com>; Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Configure the byte-cntr IRQ register for the specified ETR device
+		based on its port number. An interrupt is generated when the data size
+		exceeds the value set in the IRQ register.
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index ab16d06783a5..821a1b06b20c 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -55,5 +55,5 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
 obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
-coresight-ctcu-y := coresight-ctcu-core.o
+coresight-ctcu-y := coresight-ctcu-core.o coresight-ctcu-byte-cntr.o
 obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
new file mode 100644
index 000000000000..0bf738d6c283
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
@@ -0,0 +1,351 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/coresight.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
+#include <linux/of_irq.h>
+#include <linux/uaccess.h>
+
+#include "coresight-ctcu.h"
+#include "coresight-priv.h"
+#include "coresight-tmc.h"
+
+static irqreturn_t byte_cntr_handler(int irq, void *data)
+{
+	struct ctcu_byte_cntr *byte_cntr_data = (struct ctcu_byte_cntr *)data;
+
+	atomic_inc(&byte_cntr_data->irq_cnt);
+	wake_up(&byte_cntr_data->wq);
+
+	return IRQ_HANDLED;
+}
+
+static void ctcu_reset_sysfs_buf(struct tmc_drvdata *drvdata)
+{
+	u32 sts;
+
+	CS_UNLOCK(drvdata->base);
+	tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
+	tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
+	sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
+	writel_relaxed(sts, drvdata->base + TMC_STS);
+	CS_LOCK(drvdata->base);
+}
+
+static void ctcu_cfg_byte_cntr_reg(struct tmc_drvdata *drvdata, u32 val, u32 offset)
+{
+	struct ctcu_drvdata *ctcu_drvdata;
+	struct coresight_device *helper;
+
+	helper = tmc_etr_get_ctcu_device(drvdata);
+	if (!helper)
+		return;
+
+	ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+	/* A one value for IRQCTRL register represents 8 bytes */
+	ctcu_program_register(ctcu_drvdata, val / 8, offset);
+}
+
+static struct ctcu_byte_cntr *ctcu_get_byte_cntr_data(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct ctcu_drvdata *ctcu_drvdata;
+	struct coresight_device *helper;
+	int port;
+
+	helper = tmc_etr_get_ctcu_device(drvdata);
+	if (!helper)
+		return NULL;
+
+	port = coresight_get_in_port(drvdata->csdev, helper);
+	if (port < 0)
+		return NULL;
+
+	ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+	byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+	return byte_cntr_data;
+}
+
+static bool ctcu_byte_cntr_switch_buffer(struct tmc_drvdata *drvdata,
+					 struct ctcu_byte_cntr *byte_cntr_data)
+{
+	struct etr_buf_node *nd, *next, *curr_node, *picked_node;
+	struct etr_buf *curr_buf = drvdata->sysfs_buf;
+	bool found_free_buf = false;
+
+	if (WARN_ON(!drvdata || !byte_cntr_data))
+		return found_free_buf;
+
+	/* Stop the ETR before initiating the switch */
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)
+		tmc_etr_enable_disable_hw(drvdata, false);
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
+		/* curr_buf is free for next round */
+		if (nd->sysfs_buf == curr_buf) {
+			nd->is_free = true;
+			curr_node = nd;
+		}
+
+		if (!found_free_buf && nd->is_free && nd->sysfs_buf != curr_buf) {
+			picked_node = nd;
+			found_free_buf = true;
+		}
+	}
+
+	if (found_free_buf) {
+		curr_node->pos = 0;
+		drvdata->buf_node = curr_node;
+		drvdata->sysfs_buf = picked_node->sysfs_buf;
+		drvdata->etr_buf = picked_node->sysfs_buf;
+		picked_node->is_free = false;
+		/* Reset irq_cnt for next etr_buf */
+		atomic_set(&byte_cntr_data->irq_cnt, 0);
+		/* Reset rrp and rwp when the system has switched the buffer*/
+		ctcu_reset_sysfs_buf(drvdata);
+		/* Restart the ETR once a free buffer is available */
+		if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)
+			tmc_etr_enable_disable_hw(drvdata, true);
+	}
+
+	return found_free_buf;
+}
+
+/*
+ * ctcu_byte_cntr_get_data() - reads data from the deactivated and filled buffer.
+ * The byte-cntr reading work reads data from the deactivated and filled buffer.
+ * The read operation waits for a buffer to become available, either filled or
+ * upon timeout, and then reads trace data from the synced buffer.
+ */
+static ssize_t ctcu_byte_cntr_get_data(struct tmc_drvdata *drvdata, loff_t pos,
+				       size_t len, char **bufpp)
+{
+	struct etr_buf *sysfs_buf = drvdata->sysfs_buf;
+	struct device *dev = &drvdata->csdev->dev;
+	ssize_t actual, size = sysfs_buf->size;
+	struct ctcu_byte_cntr *byte_cntr_data;
+	size_t thresh_val;
+	atomic_t *irq_cnt;
+	int ret;
+
+	byte_cntr_data = ctcu_get_byte_cntr_data(drvdata);
+	if (!byte_cntr_data)
+		return -EINVAL;
+
+	thresh_val = byte_cntr_data->thresh_val;
+	irq_cnt = &byte_cntr_data->irq_cnt;
+
+wait_buffer:
+	if (!byte_cntr_data->reading_data) {
+		ret = wait_event_interruptible_timeout(byte_cntr_data->wq,
+				((atomic_read(irq_cnt) + 1) * thresh_val >= size) ||
+				!byte_cntr_data->enable,
+				BYTE_CNTR_TIMEOUT);
+		if (ret < 0)
+			return ret;
+		/*
+		 * The current etr_buf is almost full or timeout is triggered,
+		 * so switch the buffer and mark the switched buffer as reading.
+		 */
+		if (byte_cntr_data->enable) {
+			if (!ctcu_byte_cntr_switch_buffer(drvdata, byte_cntr_data)) {
+				dev_err(dev, "Switch buffer failed for the byte-cntr\n");
+				return -EINVAL;
+			}
+
+			byte_cntr_data->reading_data = true;
+		} else {
+			/*
+			 * TMC-ETR has been disabled, so directly reads data from
+			 * the drvdata->sysfs_buf.
+			 */
+			actual = etr_sysfs_ops.get_trace_data(drvdata, pos, len, bufpp);
+			if (actual > 0) {
+				byte_cntr_data->total_size += actual;
+				return actual;
+			}
+
+			/* Exit byte-cntr reading */
+			return 0;
+		}
+	}
+
+	/* Check the status of current etr_buf*/
+	if (atomic_read(irq_cnt) * thresh_val >= size)
+		dev_warn(dev, "Data overwrite happened\n");
+
+	pos = drvdata->buf_node->pos;
+	actual = etr_sysfs_ops.get_trace_data(drvdata, pos, len, bufpp);
+	if (actual <= 0) {
+		/* Reset flags upon reading is finished or failed */
+		byte_cntr_data->reading_data = false;
+		drvdata->buf_node = NULL;
+
+		/*
+		 * Nothing in the buffer, waiting for the next buffer
+		 * to be filled.
+		 */
+		if (actual == 0)
+			goto wait_buffer;
+	} else
+		byte_cntr_data->total_size += actual;
+
+	return actual;
+}
+
+static int ctcu_read_prepare_byte_cntr(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	unsigned long flags;
+	int ret = 0;
+
+	byte_cntr_data = ctcu_get_byte_cntr_data(drvdata);
+	if (!byte_cntr_data)
+		return -EINVAL;
+
+	/*
+	 * The threshold value must not exceed the buffer size.
+	 * A margin should be maintained between the two values to account
+	 * for the time gap between the interrupt and buffer switching.
+	 */
+	if (byte_cntr_data->thresh_val + SZ_16K >= drvdata->size) {
+		dev_err(&drvdata->csdev->dev, "The threshold value is too large\n");
+		return -EINVAL;
+	}
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (byte_cntr_data->reading) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	byte_cntr_data->reading = true;
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	/* Setup an available etr_buf_list for byte-cntr */
+	ret = tmc_create_etr_buf_list(drvdata, 2);
+	if (ret)
+		goto out;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	atomic_set(&byte_cntr_data->irq_cnt, 0);
+	/* Configure the byte-cntr register to enable IRQ */
+	ctcu_cfg_byte_cntr_reg(drvdata, byte_cntr_data->thresh_val,
+			       byte_cntr_data->irq_ctrl_offset);
+	enable_irq_wake(byte_cntr_data->irq);
+	byte_cntr_data->total_size = 0;
+
+out_unlock:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+out:
+	return ret;
+}
+
+static int ctcu_read_unprepare_byte_cntr(struct tmc_drvdata *drvdata)
+{
+	struct device *dev = &drvdata->csdev->dev;
+	struct ctcu_byte_cntr *byte_cntr_data;
+	unsigned long flags;
+
+	byte_cntr_data = ctcu_get_byte_cntr_data(drvdata);
+	if (!byte_cntr_data)
+		return -EINVAL;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	/* Configure the byte-cntr register to disable IRQ */
+	ctcu_cfg_byte_cntr_reg(drvdata, 0, byte_cntr_data->irq_ctrl_offset);
+	disable_irq_wake(byte_cntr_data->irq);
+	byte_cntr_data->reading = false;
+	byte_cntr_data->reading_data = false;
+	drvdata->buf_node = NULL;
+	/* Restore the original sysfs_ops */
+	drvdata->sysfs_ops = &etr_sysfs_ops;
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	dev_dbg(dev, "send data total size:%llu bytes\n", byte_cntr_data->total_size);
+	tmc_clean_etr_buf_list(drvdata);
+
+	return 0;
+}
+
+const struct tmc_sysfs_ops byte_cntr_sysfs_ops = {
+	.read_prepare	= ctcu_read_prepare_byte_cntr,
+	.read_unprepare	= ctcu_read_unprepare_byte_cntr,
+	.get_trace_data	= ctcu_byte_cntr_get_data,
+};
+
+/* Start the byte-cntr function when the path is enabled. */
+void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path)
+{
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	struct coresight_device *sink = coresight_get_sink(path);
+	struct tmc_drvdata *tmc_drvdata = dev_get_drvdata(sink->dev.parent);
+	struct ctcu_byte_cntr *byte_cntr_data;
+	int port_num;
+
+	port_num = coresight_get_in_port(sink, csdev);
+	if (port_num < 0)
+		return;
+
+	byte_cntr_data = &drvdata->byte_cntr_data[port_num];
+	/* Don't start byte-cntr function when threshold is not set. */
+	if (!byte_cntr_data->thresh_val || byte_cntr_data->enable)
+		return;
+
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	byte_cntr_data->enable = true;
+	byte_cntr_data->reading_data = false;
+	/* Replace with byte-cntr's sysfs_ops */
+	tmc_drvdata->sysfs_ops = &byte_cntr_sysfs_ops;
+}
+
+/* Stop the byte-cntr function when the path is disabled. */
+void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path)
+{
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	struct coresight_device *sink = coresight_get_sink(path);
+	struct ctcu_byte_cntr *byte_cntr_data;
+	int port_num;
+
+	if (coresight_get_mode(sink) == CS_MODE_SYSFS)
+		return;
+
+	port_num = coresight_get_in_port(sink, csdev);
+	if (port_num < 0)
+		return;
+
+	byte_cntr_data = &drvdata->byte_cntr_data[port_num];
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	byte_cntr_data->enable = false;
+}
+
+void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int etr_num)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct device_node *nd = dev->of_node;
+	int irq_num, ret, i;
+
+	for (i = 0; i < etr_num; i++) {
+		byte_cntr_data = &drvdata->byte_cntr_data[i];
+		irq_num = of_irq_get(nd, i);
+		if (irq_num < 0) {
+			dev_err(dev, "Failed to get IRQ from DT for port%d\n", i);
+			continue;
+		}
+
+		ret = devm_request_irq(dev, irq_num, byte_cntr_handler,
+				       IRQF_TRIGGER_RISING | IRQF_SHARED,
+				       dev_name(dev), byte_cntr_data);
+		if (ret) {
+			dev_err(dev, "Failed to register IRQ for port%d\n", i);
+			continue;
+		}
+
+		byte_cntr_data->irq = irq_num;
+		init_waitqueue_head(&byte_cntr_data->wq);
+		raw_spin_lock_init(&byte_cntr_data->spin_lock);
+	}
+}
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index e8720026c9e3..60f1db3ab70d 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
+#include <linux/sizes.h>
 
 #include "coresight-ctcu.h"
 #include "coresight-priv.h"
@@ -43,17 +44,21 @@
 
 #define CTCU_ATID_REG_BIT(traceid)	(traceid % 32)
 #define CTCU_ATID_REG_SIZE		0x10
+#define CTCU_ETR0_IRQCTRL               0x6c
+#define CTCU_ETR1_IRQCTRL               0x70
 #define CTCU_ETR0_ATID0			0xf8
 #define CTCU_ETR1_ATID0			0x108
 
 static const struct ctcu_etr_config sa8775p_etr_cfgs[] = {
 	{
-		.atid_offset	= CTCU_ETR0_ATID0,
-		.port_num	= 0,
+		.atid_offset		= CTCU_ETR0_ATID0,
+		.irq_ctrl_offset	= CTCU_ETR0_IRQCTRL,
+		.port_num		= 0,
 	},
 	{
-		.atid_offset	= CTCU_ETR1_ATID0,
-		.port_num	= 1,
+		.atid_offset		= CTCU_ETR1_ATID0,
+		.irq_ctrl_offset	= CTCU_ETR1_IRQCTRL,
+		.port_num		= 1,
 	},
 };
 
@@ -62,6 +67,88 @@ static const struct ctcu_config sa8775p_cfgs = {
 	.num_etr_config	= ARRAY_SIZE(sa8775p_etr_cfgs),
 };
 
+void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset)
+{
+	CS_UNLOCK(drvdata->base);
+	ctcu_writel(drvdata, val, offset);
+	CS_LOCK(drvdata->base);
+}
+
+static ssize_t irq_threshold_show(struct device *dev,
+				  struct device_attribute *attr,
+				  char *buf)
+{
+	struct ctcu_byte_cntr_irq_attribute *irq_attr =
+		container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u8 port = irq_attr->port;
+
+	if (!drvdata->byte_cntr_data[port].irq_ctrl_offset)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%u\n",
+			(unsigned int)drvdata->byte_cntr_data[port].thresh_val);
+}
+
+static ssize_t irq_threshold_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf,
+				   size_t size)
+{
+	struct ctcu_byte_cntr_irq_attribute *irq_attr =
+		container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u8 port = irq_attr->port;
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	/* Threshold 0 disables the interruption. */
+	guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
+	/* A small threshold will result in a large number of interruptions */
+	if (val && val < SZ_4K)
+		return -EINVAL;
+
+	if (drvdata->byte_cntr_data[port].irq_ctrl_offset)
+		drvdata->byte_cntr_data[port].thresh_val = val;
+
+	return size;
+}
+
+static umode_t irq_threshold_is_visible(struct kobject *kobj,
+					struct attribute *attr, int n)
+{
+	struct device_attribute *dev_attr =
+		container_of(attr, struct device_attribute, attr);
+	struct ctcu_byte_cntr_irq_attribute *irq_attr =
+		container_of(dev_attr, struct ctcu_byte_cntr_irq_attribute, attr);
+	struct device *dev = kobj_to_dev(kobj);
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u8 port = irq_attr->port;
+
+	if (drvdata && drvdata->byte_cntr_data[port].irq_ctrl_offset)
+		return attr->mode;
+
+	return 0;
+}
+
+static struct attribute *ctcu_attrs[] = {
+	ctcu_byte_cntr_irq_rw(0),
+	ctcu_byte_cntr_irq_rw(1),
+	NULL,
+};
+
+static struct attribute_group ctcu_attr_grp = {
+	.attrs = ctcu_attrs,
+	.is_visible = irq_threshold_is_visible,
+};
+
+static const struct attribute_group *ctcu_attr_grps[] = {
+	&ctcu_attr_grp,
+	NULL,
+};
+
 static void ctcu_program_atid_register(struct ctcu_drvdata *drvdata, u32 reg_offset,
 				       u8 bit, bool enable)
 {
@@ -140,11 +227,15 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
 		       struct coresight_path *path)
 {
+	ctcu_byte_cntr_start(csdev, path);
+
 	return ctcu_set_etr_traceid(csdev, path, true);
 }
 
 static int ctcu_disable(struct coresight_device *csdev, struct coresight_path *path)
 {
+	ctcu_byte_cntr_stop(csdev, path);
+
 	return ctcu_set_etr_traceid(csdev, path, false);
 }
 
@@ -195,7 +286,10 @@ static int ctcu_probe(struct platform_device *pdev)
 			for (i = 0; i < cfgs->num_etr_config; i++) {
 				etr_cfg = &cfgs->etr_cfgs[i];
 				drvdata->atid_offset[i] = etr_cfg->atid_offset;
+				drvdata->byte_cntr_data[i].irq_ctrl_offset =
+					etr_cfg->irq_ctrl_offset;
 			}
+			ctcu_byte_cntr_init(dev, drvdata, cfgs->num_etr_config);
 		}
 	}
 
@@ -209,6 +303,7 @@ static int ctcu_probe(struct platform_device *pdev)
 	desc.dev = dev;
 	desc.ops = &ctcu_ops;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
+	desc.groups = ctcu_attr_grps;
 	raw_spin_lock_init(&drvdata->spin_lock);
 
 	drvdata->csdev = coresight_register(&desc);
diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/hwtracing/coresight/coresight-ctcu.h
index e9594c38dd91..c52cf6a33d2e 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu.h
+++ b/drivers/hwtracing/coresight/coresight-ctcu.h
@@ -5,19 +5,26 @@
 
 #ifndef _CORESIGHT_CTCU_H
 #define _CORESIGHT_CTCU_H
+
+#include <linux/time.h>
 #include "coresight-trace-id.h"
 
 /* Maximum number of supported ETR devices for a single CTCU. */
 #define ETR_MAX_NUM	2
 
+#define BYTE_CNTR_TIMEOUT	(3 * HZ)
+
 /**
  * struct ctcu_etr_config
  * @atid_offset:	offset to the ATID0 Register.
- * @port_num:		in-port number of CTCU device that connected to ETR.
+ * @port_num:		in-port number of the CTCU device that connected to ETR.
+ * @irq_ctrl_offset:    offset to the BYTECNTRVAL register.
+ * @irq_name:           IRQ name in dt node.
  */
 struct ctcu_etr_config {
 	const u32 atid_offset;
 	const u32 port_num;
+	const u32 irq_ctrl_offset;
 };
 
 struct ctcu_config {
@@ -25,15 +32,68 @@ struct ctcu_config {
 	int num_etr_config;
 };
 
-struct ctcu_drvdata {
-	void __iomem		*base;
-	struct clk		*apb_clk;
-	struct device		*dev;
-	struct coresight_device	*csdev;
+/**
+ * struct ctcu_byte_cntr
+ * @enable:		indicates that byte_cntr function is enabled or not.
+ * @reading:		indicates that byte-cntr reading is started.
+ * @reading_data:	indicates that byte-cntr is reading data from the buffer.
+ * @thresh_val:		threshold to trigger a interruption.
+ * @total_size:		total size of the transferred data.
+ * @irq:		allocated number of the IRQ.
+ * @irq_cnt:		IRQ count number for triggered interruptions.
+ * @wq:			waitqueue for reading data from ETR buffer.
+ * @spin_lock:		spinlock of byte_cntr_data.
+ * @irq_ctrl_offset:	offset to the BYTECNTVAL Register.
+ */
+struct ctcu_byte_cntr {
+	bool			enable;
+	bool                    reading;
+	bool			reading_data;
+	u32			thresh_val;
+	u64			total_size;
+	int			irq;
+	atomic_t		irq_cnt;
+	wait_queue_head_t	wq;
 	raw_spinlock_t		spin_lock;
-	u32			atid_offset[ETR_MAX_NUM];
+	u32			irq_ctrl_offset;
+};
+
+struct ctcu_drvdata {
+	void __iomem			*base;
+	struct clk			*apb_clk;
+	struct device			*dev;
+	struct coresight_device		*csdev;
+	struct ctcu_byte_cntr		byte_cntr_data[ETR_MAX_NUM];
+	raw_spinlock_t			spin_lock;
+	u32				atid_offset[ETR_MAX_NUM];
 	/* refcnt for each traceid of each sink */
-	u8			traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
+	u8				traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
 };
 
+/**
+ * struct ctcu_irq_thresh_attribute
+ * @attr:	The device attribute.
+ * @idx:	port number.
+ */
+struct ctcu_byte_cntr_irq_attribute {
+	struct device_attribute	attr;
+	u8			port;
+};
+
+#define ctcu_byte_cntr_irq_rw(port)					\
+	(&((struct ctcu_byte_cntr_irq_attribute[]) {			\
+	   {								\
+		__ATTR(irq_threshold##port, 0644, irq_threshold_show,	\
+		irq_threshold_store),					\
+		port,							\
+	   }								\
+	})[0].attr.attr)
+
+void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset);
+
+/* Byte-cntr functions */
+void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path);
+void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path);
+void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int port_num);
+
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 110eedde077f..948ea864f2a1 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -293,7 +293,10 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 		return -EFAULT;
 	}
 
-	*ppos += actual;
+	if (drvdata->buf_node)
+		drvdata->buf_node->pos += actual;
+	else
+		*ppos += actual;
 	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
 
 	return actual;
@@ -748,11 +751,12 @@ static const struct tmc_sysfs_ops etb_sysfs_ops = {
 	.get_trace_data	= tmc_etb_get_sysfs_trace,
 };
 
-static const struct tmc_sysfs_ops etr_sysfs_ops = {
+const struct tmc_sysfs_ops etr_sysfs_ops = {
 	.read_prepare	= tmc_read_prepare_etr,
 	.read_unprepare	= tmc_read_unprepare_etr,
 	.get_trace_data	= tmc_etr_get_sysfs_trace,
 };
+EXPORT_SYMBOL_GPL(etr_sysfs_ops);
 
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index f4223215ef8d..8896fb7a9ed3 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1185,6 +1185,10 @@ ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
 	ssize_t actual = len;
 	struct etr_buf *etr_buf = drvdata->sysfs_buf;
 
+	/* Reading the buffer from the buf_node if it exists*/
+	if (drvdata->buf_node)
+		etr_buf = drvdata->buf_node->sysfs_buf;
+
 	if (pos + actual > etr_buf->len)
 		actual = etr_buf->len - pos;
 	if (actual <= 0)
@@ -1248,6 +1252,20 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 
 }
 
+/**
+ * tmc_etr_enable_disable_hw - enable/disable the ETR hw.
+ * @drvdata:	drvdata of the TMC device.
+ * @enable:	indicates enable/disable.
+ */
+void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool enable)
+{
+	if (enable)
+		__tmc_etr_enable_hw(drvdata);
+	else
+		__tmc_etr_disable_hw(drvdata);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_enable_disable_hw);
+
 void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 {
 	__tmc_etr_disable_hw(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index aaa443abe8e9..183c649b982c 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -260,6 +260,7 @@ struct etr_buf_node {
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
  * @sysfs_ops:	Read operations for the sysfs mode.
+ * @buf_node:	Available buffer_node for byte-cntr reading.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -292,6 +293,7 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
 	const struct tmc_sysfs_ops	*sysfs_ops;
+	struct etr_buf_node	*buf_node;
 };
 
 /**
@@ -371,6 +373,7 @@ void tmc_etr_disable_hw(struct tmc_drvdata *drvdata);
 extern const struct coresight_ops tmc_etr_cs_ops;
 ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
 				loff_t pos, size_t len, char **bufpp);
+extern const struct tmc_sysfs_ops etr_sysfs_ops;
 
 
 #define TMC_REG_PAIR(name, lo_off, hi_off)				\
@@ -480,5 +483,6 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 extern const struct attribute_group coresight_etr_group;
 void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
 int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
+void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool enable);
 
 #endif

-- 
2.34.1


