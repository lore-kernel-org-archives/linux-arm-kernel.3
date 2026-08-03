Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A774C55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7gMpX23LaFBur5pPQaddvCHQnd9R+tRGpPVMI8EOpA=; b=Ds2YKDMhh5Q1KKZs3xWMbsACi8
	+qopiILX67dmOxVyYla6A9yzW2P3pE5kN2trnbgyzRyaF9W6dorWqAEksfKkezbo9pXGFzr3Wujlk
	OgR+pEoSiHxOzzT8V56AzUdZbPaa5b9cSxJfvsL/74rDc+s/zaoE1QtdsvmxLOCaCVAiFhFd5w1pR
	EC/E2fyR3TRWrViXfFvPgBk4wbhOwEoMyjn13pmi4wqvm0omoH3zDDZycqFCPFuctxx3zpNRgLEho
	OpOromRTPeKbIN+aAnn2Lm0CCzAy0ymOaJifNOURRj9EICFhSXFoQNKanZ4s2qXta8/8zDA8ikMPm
	2cMzgqAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpEz-0000000GjgF-3g78;
	Mon, 03 Aug 2026 09:45:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpEw-0000000GjeG-3byv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:45:48 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6738F2XJ4178981
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Aug 2026 09:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P7gMpX23LaFBur5pPQaddvCHQnd9R+tRGpPVMI8EOpA=; b=U2+j8YifrLrGpHLf
	DagnOKH5YQVkmVgEsYiYdrTjJ44r+L1oIRaC9h0ICZlvQSQuX8tblcc2WzG9VizG
	JiHWhc2kLcnsJJiy6+MJsZCOkLWm3VHNBXZcj77hlZsncMPAZSEmuj6G5nrUJ7ng
	8HgjolqMvaZEnXkE2kDllhCaJxKL780lKiWoM3YEC8HcCPQ2XOZT+aBsMIowwbv2
	GggyiZo288eBc8OaIuTyk7ffxS5wNk4KrK7JciNCl4F354usc61ksDbWt8F41NRQ
	GFDSilfhagTNLJEshhgsFEqiOl9kzsNwZafxenYf4llM+u2be5ynk1c0hVqV4jub
	o87HfA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhkgwfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:45:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so5122869a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 02:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750345; x=1786355145; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7gMpX23LaFBur5pPQaddvCHQnd9R+tRGpPVMI8EOpA=;
        b=Ry9Syk23VOmL4eBxtaY8mLUUVSnLQ6GJ0Axhvg9v4EV3IBtGmsNyRnDersmEYjtrvW
         9jiUKuazNurxed6LFnIlZk9LrlXVdNb8JRowrvRGgZxw87ilEWoqlmkYylVSPN/T+2wb
         D3wAg6/hwMF+bFx6GdfKm82bfM1d9QUwMIaFLiupdjhI+bhYI+9NadfzStheNL0iLkHt
         S1CQM9E5X5qq7oaiYP0ZHwPthTxjKmFuTQR5yXLTkXoMOP2vUDNd/GTHBdSQCFGD9nou
         +JixRDp2tFAk7mGvHbEOXDXZlmp7HswDBJxACcKfOrWrfQNF0yuVUW5513D9pr23uiwB
         SIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750345; x=1786355145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P7gMpX23LaFBur5pPQaddvCHQnd9R+tRGpPVMI8EOpA=;
        b=AKzf+smi6nrHC16K53gGOgl3+Ye3pZzRbuw71rvmJi/X2EJm8HxGBbjGpFxu10gNFl
         MJLld71i3pZ4XxJDnMjvisJkfuvGfEssGJegRBonCnYabGqz3ilXafaBrEeYZZunC341
         aW8clBhoABKGdMAoNwQoU1yHSt3TdI/CbnaXGb09NjPO9NP0Bihou2J3Qo1d25OZ+tHU
         4kDharrEU+1CWBHdD5+rjaBWm03MQHcEZ0AGcfEUDl94FPrSqTF1iQgu5CDKmq2qlYUf
         GA/YAA+QB7KR/F7J9bRoZPVRRUuHX6hS0L1AUm/5E1C19VButJh2DUTfUpGdTkOV/SHY
         hhNQ==
X-Forwarded-Encrypted: i=1; AHgh+RoV2dahlo1WtLI30fZmMaG8X7wcJJCt8C2ma6npeeR3m7II6BTWRpvkDe/cACDLqtYNn1Usk655QnhQqdUJUcbA@lists.infradead.org
X-Gm-Message-State: AOJu0YxeIH+tLK0Y5V3P1SU3HB5ShHcD+K+fVmVelV/vwD8IyEsw7C8N
	1AjfbBDdH5De9PO3Aj+lvkr9PCC/kegubQyvts+lspUsoA2TfLOu1T5CFvTneeEfHMtwjp5cVSM
	+uBw5jjLixkHAWEdoeD/lU8APKzuuoaHvN3YSlvrk1G6yPYiH2AHLS7+0XEQpcwSAqszkexgBmt
	/0lA==
X-Gm-Gg: AR+sD11yvEMVF/ZTNFTNgMzTdtV24rN0du880a4XTAeEo2yam8yHnZPWBHjB8LuOq8/
	Sb3VvzsnKKa9nncHKuCywFAze2WXFAl7jTQ6Y5LfsIJgpzeTeCH32BX4YH9DJnxoOZSw/0vAzPC
	yp9vRltmf/iZ9fYyPgBOJguxBQ11c7O1Ubnsrb/mc6FY3WuSF6mulyYXegHKOOXx+egYqvQ+U3j
	2GnOSSroECzR3ussQlm7UnlSTEPPRyJg6GnxLBo7AFSOxVsAhfuCamjAiPWyf4Fm4EmRWxMxHkH
	9fwWvZYhw7QfM+fcTmS/Ff8Kb7GW6ZUN2Ljw+9Xd8VhTm9b6p9mpSKRB+0nYOlV9q3YZVhVo9tF
	Q0rom3uyyasIUA7F0fylQg2IAgZ/zD++ryJEp
X-Received: by 2002:a17:90b:2d4c:b0:387:df8f:1401 with SMTP id 98e67ed59e1d1-38fbc598becmr9021685a91.34.1785750344771;
        Mon, 03 Aug 2026 02:45:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2d4c:b0:387:df8f:1401 with SMTP id 98e67ed59e1d1-38fbc598becmr9021646a91.34.1785750344278;
        Mon, 03 Aug 2026 02:45:44 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:45:43 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:37 +0530
Subject: [PATCH v24 06/12] power: reset: Add psci-reboot-mode driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-6-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750274; l=5554;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=IqjZzKl7BNCcMxSaF/5GXH4dOI6iylxX8niIaIkSeSQ=;
 b=VvuvdMCCFfCnpfXMiifmJIg8ToW9mGWhz/YcyhcWBwYZyQ++L8G27zDMPlOvzPWKAgRM6T2dZ
 hAxw26BregDDZ4ndgGJJEgdlZIWzxDPFme60Q11ADtcSKqSRYEiKRjY
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: CprKtMDrzarp75rbDfYOa9qLUQxXHAdo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX7kENuqOyb0jv
 tcbCnGFeI09Z1tfqY30MUIbK+pJEkxM02JJHsyNdGgSfAp1OJdUuZwGzr9J5K1Y8UnE5dU0rAFc
 3YtyzIRINdykN1ezC9PgVucpoSwCEcr5HS95xEu4eqkhOrGm7nWJBUjzYiT4S+M1Lq5bf/aIlvY
 Ul5wX6a+y9rWdBmgYuqIFdQbVpIXh4WNMd24Fg6nkNz5Z0w3PjDC3VtcONQYUxHTlQ9JF1uIbv/
 dMbv265LCLIQ+LwEQJ2B/67g1oLsAdPCpLQJEaF7tquVjxeGLyByEQRw3r4I7tRUXbN7AVzr4yr
 beNtj5qRFYFsQAgyBmTytfoPBnIbPMd13XPRkDMbTrrOQy4o8s7eRYXfYkxB90gdpToyZaY888m
 t4K8V19Em0rUUAvAZQPVpji48pq9U8vqVKaD7Qya0luqVeppt7Dre8LvXGl3l9QFXz34aLciX9e
 tapzwQItivhs/iiFPsQ==
X-Proofpoint-ORIG-GUID: CprKtMDrzarp75rbDfYOa9qLUQxXHAdo
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX9mI32Yz/69SD
 4Y1vvVl+huewsX92M5yeDdWUoxAc9BA/QD4/0hC55TN0yKZiwvZTMjscxM+qHbzWgIDK4kFiMJh
 cL6dnPXaLrTZa5XGLpXRcgEJ1MKa3UI=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a706349 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5CqnhzuZLWPXzHx0y-cA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_024547_022193_000B4A2F 
X-CRM114-Status: GOOD (  28.71  )
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

PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
there is no common driver that handles all supported psci resets at one
place. Additionally, there is no common mechanism to issue the supported
psci resets from userspace.

Add a psci-reboot-mode driver, and define two types of PSCI resets,
predefined-resets and vendor-specific resets. Predefined-resets are
defined by psci driver and vendor-specific resets are defined by SoC
vendors, under the psci:reboot-mode node of SoC device tree.

Register the driver with the reboot-mode framework to interface these
resets to userspace. When userspace initiates a supported command, pass
the reset arguments to the PSCI driver to enable command-based reset.

This change allows userspace to issue supported PSCI reset commands
using the standard reboot system calls while enabling SoC vendors to
define their specific resets for PSCI.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 MAINTAINERS                            |  1 +
 drivers/power/reset/Kconfig            | 10 +++++
 drivers/power/reset/Makefile           |  1 +
 drivers/power/reset/psci-reboot-mode.c | 82 ++++++++++++++++++++++++++++++++++
 4 files changed, 94 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0b6e4f89f319..a3339b98ba86 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21672,6 +21672,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/psci/
 F:	drivers/mfd/psci-mfd.c
+F:	drivers/power/reset/psci-reboot-mode.c
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
 
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index bce996bbef28..143f3260f04a 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -360,6 +360,16 @@ config NVMEM_REBOOT_MODE
 	  then the bootloader can read it and take different
 	  action according to the mode.
 
+config PSCI_REBOOT_MODE
+	bool "PSCI reboot mode driver"
+	depends on ARM_PSCI_FW || COMPILE_TEST
+	select REBOOT_MODE
+	help
+	  Say y here will enable PSCI reboot mode driver. This gets
+	  the PSCI reboot mode arguments and passes them to psci
+	  driver. psci driver uses these arguments for issuing
+	  device reset into different boot states.
+
 config POWER_MLXBF
 	tristate "Mellanox BlueField power handling driver"
 	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index e31cab4ba78e..45d8aaaffaa1 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -41,5 +41,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
 obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
 obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
 obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
+obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
 obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
 obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
new file mode 100644
index 000000000000..2f960fda8229
--- /dev/null
+++ b/drivers/power/reset/psci-reboot-mode.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/array_size.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/psci.h>
+#include <linux/reboot-mode.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+static const struct reboot_mode_entry psci_resets[] = {
+	{
+		.name  = "psci-system-reset",
+		.magic = { 0, PSCI_SYSTEM_RESET_COLD_RESET },
+		.count = 2,
+	},
+	{
+		.name  = "psci-system-reset2-arch-warm-reset",
+		.magic = { 0, PSCI_SYSTEM_RESET2_ARCH_WARM_RESET },
+		.count = 2,
+	},
+};
+
+static u64 psci_reboot_mode_get_cookie(const u32 *magic, int count)
+{
+	u64 cookie = 0;
+	int i;
+
+	/* Build cookie from arg2/arg3 cells in order: cookie_hi then cookie_lo. */
+	for (i = 1; i < count; i++)
+		cookie = (cookie << 32) | magic[i];
+
+	return cookie;
+}
+
+static int psci_reboot_mode_write(struct reboot_mode_driver *reboot,
+				  const u32 *magic, u32 count)
+{
+	(void)reboot;
+
+	if (count < 1 || count > 3)
+		return -EINVAL;
+
+	return psci_set_reset_cmd(magic[0], psci_reboot_mode_get_cookie(magic, count));
+}
+
+static int psci_reboot_mode_probe(struct platform_device *pdev)
+{
+	struct reboot_mode_driver *reboot;
+	size_t count;
+	int ret;
+
+	reboot = devm_kzalloc(&pdev->dev, sizeof(*reboot), GFP_KERNEL);
+	if (!reboot)
+		return -ENOMEM;
+
+	/* Skip PSCI SYSTEM_RESET2 modes if unsupported */
+	count = psci_has_system_reset2_support() ? ARRAY_SIZE(psci_resets) : 1;
+
+	ret = reboot_mode_driver_init(reboot, &pdev->dev, NULL,
+				      psci_reboot_mode_write, psci_resets, count);
+	if (ret)
+		return ret;
+
+	return devm_reboot_mode_register(&pdev->dev, reboot);
+}
+
+static struct platform_driver psci_reboot_mode_driver = {
+	.probe  = psci_reboot_mode_probe,
+	.driver = {
+		.name	= "psci-reboot-mode",
+	},
+};
+module_platform_driver(psci_reboot_mode_driver);
+
+MODULE_DESCRIPTION("PSCI reboot mode driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


