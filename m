Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E30FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 17:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRd/LNkrvRz1DsBjodx4Y6wMCeOUpdwMyOE0mSsx0jA=; b=erts9GY3GqUtglfeojda3bJ3Fi
	ExBRH6Nn7fxZAERgL2eimE7mkWzQFXocW1t3aOizhYqXGDiWprklVwigQ1ZQyOdM0okGWlEwGugsh
	Eu5qeR1QfPanw6irYrwx3lZiBM4VFazupXmH+TeF0FZ1io3uQcbrWLonqJPpEHfgdDILsiazdQO7e
	pnJswsfdKWnPQFIhfQW6VlOINj/dEz2LZt5mmTVy4OboowL34md3CNe/8eDmWK8bvVgYFcE4cJRRD
	Nde42pVFcU9pnFV82TEV/yWgNxrjIF9uDsFhCCmV9Q/Zo/ciOUMWCEU1G0r5WoHffics142MG4dbl
	0nulR/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPsh-0000000HU3d-3Znr;
	Mon, 27 Apr 2026 17:36:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPsf-0000000HU1l-3coz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 17:36:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RCp9IW2382839
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 17:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wRd/LNkrvRz1DsBjodx4Y6wMCeOUpdwMyOE0mSsx0jA=; b=nLfgE/n3NLAQO07H
	0zosDqQfqEQjScnNt3HdiF+haVytSMbYo4fPnVXcRyUW1JhILaI+0VmSR7TD+aUt
	+wd2Vmy2IVb2duRtoifqu2NTR7IK64zPljOp6OcUSXzXRs2hYvYTSuT7VTT3tIQC
	jL9Dkw3XxIMSItcQqxc3iUFy+1SHqS/4JoJjFGEkw8GPQPkVMmAREyXzWIh59r3D
	0n0epqwsHtnTiv5etpMsum036WWDncxBbmer2B+j4riNIKiaPr514/QcXAi7xnRl
	8yCrbuvjl0LJpiBhf1bzPfscJiEGk6H0aW35roRjHNKgxZcXJDWQXwpbd/nPHLte
	EXj/FA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt85xs4c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 17:36:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24611696eso71692215ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311384; x=1777916184; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRd/LNkrvRz1DsBjodx4Y6wMCeOUpdwMyOE0mSsx0jA=;
        b=DVyydnN9C1jBCn7Uk0H9c9M5kAzyQdjHNLzNqIRMNuFJOMmWvnbcgxRIMhOvok5qWJ
         U7odrE8A5S2hQoHMzMzkSj+/2ZkbeloTI2Sqm1xmbQX04E5QTCTRIDwJvyvFTqfpc0Bz
         EapK7swJjCYb8IvpNeWK+gXUjmTH9/fFvMXYu3KQQnHV1rDmfTn7M4y10LC+Ex1xS4wi
         kl9qECOzLAVTYWVj3lAaiuLEmCvTHARcyUcWzNErdy5qPVfce/2FWywFH8ttz+lhvx7G
         ZQLn72NGTz532H0BgofRTAWbSQA9qgzB76JQ7eDHz2Gafk3mY9Cqkz1V8b3IBRgugfmT
         /TRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311384; x=1777916184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wRd/LNkrvRz1DsBjodx4Y6wMCeOUpdwMyOE0mSsx0jA=;
        b=cVueYfvTWzId1lQm8MsOYQn+yDDLQrzbcrNb3nRUWIbS8489dnfAtUtcopfTrwqxyw
         hQ9IeK1D7zky+mxjNyIdWy9IEWxQ4gTpOHbKVBucl/ffaFoqbd0oEQr5tUBDWpJZSlEu
         KvCrb6DO45I0A4mTYYaRVSPG4ixFqFVr1qln4KC6XXI1iTKVPGgm3yF51q/lb24x07vR
         sP+7vP4P2sPeGdQJXdmeUdT/4tFGYN7URqjtColHnFFkHshPhyYxJB1FzcXTA8cXQsq8
         fc8nb/XY8fS6a91NRo5oaPtJuC0mQHJjjv9ZplVHS8VgGzoaZs67o4slff86LQNY8UIl
         0aBA==
X-Forwarded-Encrypted: i=1; AFNElJ+tJB87KuJUc9xC2DvO1hXmsLgS4xUExUuDRV8fk/RXXJ0DJ4UO0v8VNNktoS7oVZBB1C1U4JeZH6azTWBdzUN1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7VqoWXdEBe+IL4X14EQjFuV0KMIjSTQXpVLDureBdqLdI3J30
	E8vbWZJH/hXZSbri+HNdIRrSu/6u68odymUQBBuTQwM3P8PLHOAZsP55/TKjAhQ8cqCgEfIuTG/
	H+F9lRm9i+x5OM4i2wQ+luxKMCXylky+DsaA1IXwLApx79ILwagS2INx0d4nL3jEgo7FcAw3Gph
	qMLIMLnZKi9Q==
X-Gm-Gg: AeBDieuwlC03n1tWoxa+N0botfQE2gt7djKKerSq0zfMWYag/kXgrReR39wAGX3GCHY
	5W8vfLo+4AtWrBmbBeTX6z1cMr85eOhq4xWwZiBeWqBErtKRhsXHzLglDolxIjpMJhjjgtEREsE
	5PoHyufbpWo+xmqhreowI4gcoMRX+RGtZpW+QDjdyyANn2tHmITv7stghSPdzaD5bWdv4ZqtxkZ
	b3Ja0C6f03h2s4XkMmTCQXkhuYaLkUf7wKsR1kB7Uxpf2xIskTnxzBLXzc+asOiCkF+KfUl5BGC
	2JLgk8arn17sNyyqWoMxgo7xF2xwiqnn58H+lVaeYGAFQbTTJJOu0F3qf6pf78EdkT53MLAA0NA
	azg6UkYhDdAp7RxYHgrCtQbsrOaSRpJp+9P4Yc/A9Y2Nfcd1au5WSiSc5USpboHN5K1QJ
X-Received: by 2002:a17:902:ce11:b0:2b0:afbe:4e14 with SMTP id d9443c01a7336-2b97a960cd2mr1555525ad.40.1777311384254;
        Mon, 27 Apr 2026 10:36:24 -0700 (PDT)
X-Received: by 2002:a17:902:ce11:b0:2b0:afbe:4e14 with SMTP id d9443c01a7336-2b97a960cd2mr1555295ad.40.1777311383693;
        Mon, 27 Apr 2026 10:36:23 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:36:23 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:47 +0530
Subject: [PATCH v21 07/13] power: reset: Add psci-reboot-mode driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-7-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=6423;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=P5d6Br3dWmkgJQvTmqm2xZfcEwgYOHL0jl0KY/yqwaY=;
 b=+SQenioOGcW7SFDLo6mJbiDF2OjPf6L5ZwJ8rzJ2IHrPTqZFE9/b7EOq4UW8Y0mSKF95PGCxY
 F6xXYyiRGuFD8AOML3Jm+c2FQF43heEHHn353zsVf967jshES3lBeqB
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=Zs3d7d7G c=1 sm=1 tr=0 ts=69ef9e99 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ywhReTWICjBcZAfHApEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: nuMrKvwoMN13OOFmosmTTfaIzFF4bAoe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfX79Sqnejlsprg
 IylKL7ryDLB7+HwjGZ8wN/Z0gCK8xvD1xOiPAj6aaUj0aNYsEgoFU9V0E8HkiLaO91sAiyyL95/
 7+pTWJLeNR//cUazi8r4xGMYZFnhcWzMWbb2Yu1jcLCn6UvH2Mveeg5POWGSkPTVcRAfdISF0t7
 LQRwAQJKse06AYvkuGgDrJ8izTWK1rsiM6QEtTx3dv0JmyAXU8RFDS1jfybcY1RIFWHVdxLc5bN
 jDkLF7pDS1L+IcU5mgjvNy1JR29uicWLaDqAebX+OiaL5pkwwotfN27aIGuK71RStMJjnwTaxgU
 s4exQ4DVCmWo7iozZnXQ7rULdIj4K1wFKTrTZFLCX6UbZEGzj8zxpbkbrgsgJWy/mmIUEa+HtIH
 ESDl3zHyi3vmzcsFO0Si6+T6sNkPw0BvzmczaRh95WkFpK0vRi5AJSMI3iAIJysM9VP/6UBQ4rM
 iB9i+dYOp4vjxW7UcWA==
X-Proofpoint-GUID: nuMrKvwoMN13OOFmosmTTfaIzFF4bAoe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_103625_926197_575CD187 
X-CRM114-Status: GOOD (  28.49  )
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

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 MAINTAINERS                            |   1 +
 drivers/power/reset/Kconfig            |  10 +++
 drivers/power/reset/Makefile           |   1 +
 drivers/power/reset/psci-reboot-mode.c | 109 +++++++++++++++++++++++++++++++++
 4 files changed, 121 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 333b01fa00b8fbd15e6f31a6b9af47600411624e..8cebc2c7e161c8a226802a4102756b4ed6034395 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21240,6 +21240,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/psci/
 F:	drivers/mfd/psci-mfd.c
+F:	drivers/power/reset/psci-reboot-mode.c
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
 
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 124afb99febe92450b6ae322aeed3b63fa2070df..d9d1f768b8691abc3b32f2675519f2ddbaf19b84 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
 	  then the bootloader can read it and take different
 	  action according to the mode.
 
+config PSCI_REBOOT_MODE
+	bool "PSCI reboot mode driver"
+	depends on OF && ARM_PSCI_FW
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
index d7ae97241a838fe1b536b2f911868e7590d12e3b..02948622fe3d00e165f941108ab92ecb66b0f0e8 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -40,5 +40,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
 obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
 obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
 obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
+obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
 obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
 obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
new file mode 100644
index 0000000000000000000000000000000000000000..29f53d2f50da8e34e714adef9507d340bc4130e2
--- /dev/null
+++ b/drivers/power/reset/psci-reboot-mode.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/psci.h>
+#include <linux/reboot.h>
+#include <linux/reboot-mode.h>
+#include <linux/types.h>
+
+/* Predefined modes use reset_type = 0 and cookie in magic[63:32]. */
+#define PSCI_PREDEF_MAGIC(cookie)	((cookie) * BIT_ULL(32))
+
+struct psci_predefined_reset {
+	const char *mode;
+	u64 magic;
+};
+
+static const struct psci_predefined_reset psci_resets[] = {
+	{
+		.mode = "psci-system-reset",
+		.magic = PSCI_PREDEF_MAGIC(PSCI_RESET_TYPE_SYSTEM_RESET),
+	},
+	{
+		.mode = "psci-system-reset2-arch-warm-reset",
+		.magic = PSCI_PREDEF_MAGIC(PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM),
+	},
+};
+
+static int psci_reboot_mode_add_predefined_mode(struct device *dev,
+						struct reboot_mode_driver *reboot,
+						const struct psci_predefined_reset *predef)
+{
+	struct mode_info *info;
+
+	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&info->list);
+	info->mode = predef->mode;
+	info->magic = predef->magic;
+	list_add_tail(&info->list, &reboot->predefined_modes);
+
+	return 0;
+}
+
+static int psci_reboot_mode_set_predefined_modes(struct device *dev,
+						 struct reboot_mode_driver *reboot)
+{
+	int ret;
+
+	INIT_LIST_HEAD(&reboot->predefined_modes);
+
+	/* Always register psci-system-reset. */
+	ret = psci_reboot_mode_add_predefined_mode(dev, reboot, &psci_resets[0]);
+	if (ret)
+		return ret;
+
+	/* Register arch warm reset only if SYSTEM_RESET2 is supported. */
+	if (!psci_has_system_reset2_support())
+		return 0;
+
+	return psci_reboot_mode_add_predefined_mode(dev, reboot, &psci_resets[1]);
+}
+
+/*
+ * Pass the encoded magic to psci_set_reset_cmd.
+ * magic is encoded as reset_type (low 32 bits) and cookie (high 32 bits).
+ */
+static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
+{
+	psci_set_reset_cmd(magic);
+	return 0;
+}
+
+static int psci_reboot_mode_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct reboot_mode_driver *reboot;
+	int ret;
+
+	reboot = devm_kzalloc(dev, sizeof(*reboot), GFP_KERNEL);
+	if (!reboot)
+		return -ENOMEM;
+
+	ret = psci_reboot_mode_set_predefined_modes(dev, reboot);
+	if (ret)
+		return ret;
+
+	reboot->write = psci_reboot_mode_write;
+	reboot->dev = dev;
+
+	return devm_reboot_mode_register(dev, reboot);
+}
+
+static struct platform_driver psci_reboot_mode_driver = {
+	.probe  = psci_reboot_mode_probe,
+	.driver = {
+		.name	= "psci-reboot-mode",
+	},
+};
+
+module_platform_driver(psci_reboot_mode_driver);
+
+MODULE_LICENSE("GPL");

-- 
2.34.1


