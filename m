Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EF1E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 17:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r831Wd4WfqmDnI6RCOW6V71GyT3JAOrlUY36xWWaPTo=; b=EbnpQYMSx11TYJihQHJGFbZEcJ
	9FnxieHJnW42QS1kcskobPkorZJ0xeondU47rs1p/Y4ftmlwmVhGRfp+1uLKgBy8zgSG0nB2NmKsv
	o18RnwuIQ1rSlDizxFVuFquZwHkm2fj8qUBlZpbOTDZQ7RtZ3oFwmGR4DW6FsN3b3wsE3PxcoJJxI
	gphei/ahB7k9RB69nHU2wQQW8l3Hyv1OcGsCFfriIyjamF852yTrMJnHlY9lXRaQKtmx0JtQuuhpZ
	nXrlwzcf1bWUhaH2yzOE9RfJZk8k4oDexVP6gipvEVWkeEXoDTkxLk1smkchIGeE7cggKr/lOwGmh
	luyFCfaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuSK-00000002uU5-3GyQ;
	Sun, 28 Dec 2025 17:21:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuSI-00000002uSJ-1TIR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 17:21:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSFefqW3403671
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r831Wd4WfqmDnI6RCOW6V71GyT3JAOrlUY36xWWaPTo=; b=L96jH8/Sle24++tD
	fyembebuOrw6A4GhBp6YSQIuHXcRkDGbSf49XttFBM+noF1CJYkwHCc908lsdBHS
	GIsZ54T/SPOlOwe8kSG5i5zMOouO5lFkaCbDAGCdjcVcDXD19xts7yYZy++c6stb
	6Mnq58t1JhDxA/LNEd9OSqiGILMG+Gu+F0SORnmNo+FSYHBBZz9yoD43m7CReUfK
	XYWwYLmdpAJ7KndowWlMmYV9FbaEq3v6g470QPdVpytHbcBAcTc+zbsoUE8/+98H
	xSSAq1SKWjec++v7LwDBxgsXCIsg7fdR5FHKpc6abMem1nj+zIyKrj6AWlNMS9JH
	Oj0Pyw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba71wtg8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:21:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a07fa318fdso163586435ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 09:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942480; x=1767547280; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r831Wd4WfqmDnI6RCOW6V71GyT3JAOrlUY36xWWaPTo=;
        b=DepUkLx2vGqMJUkVPp6qWfV/6/fFjWM5iMrGvN2lQ64AXm9/ewbCGeWJLgybU4sWiR
         5ff45xNB7c/2PQYfkXyj8T+nIbqjwtuz9UIexQDZ4Tn8POT+HUyOqvQMj7M7ZKy1RhBx
         scwZtFDXuHxsr9IOv7NYU6PG0tebJfe20MrkxWr9c2OUiFJgiyykr2ATF1OamR+aTAYp
         B9SgyD+a1bDQSYqZ1VXR8P7ltP96C3PpfCL2p//uUkgB/EujwEsO9rriXXwKnyIuF1bS
         ZPACUPPqv+ufVTKxvChYCbfkx+0eVCnmWVqsXu0P8n1GC5vJpPVO9C3oVtb+KsmE746t
         lebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942480; x=1767547280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r831Wd4WfqmDnI6RCOW6V71GyT3JAOrlUY36xWWaPTo=;
        b=WRCWuWY2lsS3Nqs5SHmWQDJb9o+EUeWt6IW62psBO8J1GfNMWixJHGzOj0yD1q8vZV
         OvpTN1HYurmqZRnbnPD4otr+mpxXiq0QQRxKZYr9jEWPW62S3IQIdX90+8xiCiYc5YnC
         6Gv9wWxCZGTyBFcRIP+LTiyYYfWkKMwJfce65tMP5zUVkp6BBfvULMpgjmOY4vXXadei
         upn7IQvN6Mha34cHoS2OETlu4QyuopYE+M90sL8sJtTN1KA13Q3tEfWEzypasohcED5D
         vNhwHAkO5d80guXkX/PqmPq5I3AGPFKJUkuLp+bBtbj2aVW76wB3rUg28YbQGvfM2azD
         txaw==
X-Forwarded-Encrypted: i=1; AJvYcCWp1y6flm3MhfDXXxNuMTxgSYcwvTnPryZNK+HlQ6dQzxroLVgx7dS0u9Tha4vK1QX7Mlhjwysu25CJRiOK3BAV@lists.infradead.org
X-Gm-Message-State: AOJu0YzTik8L0AIqsOyyySy9TdrtM8JWUyww8lr8YWPsVJ4sMF2DV9Pt
	ArNqoI7Ct01nNabPB3XtyeGY17DjUtDjaG8eTH3g5g9z6QFPE9KnuCm3bjQErxkAhm2ZoJZa0Th
	FvHfUUJtYzE6OCvZdittsaV0U9/WyfgHG8lK3uiq25OtTwhKwl4MhdK+IvBmJwcUKxyLmW26rJh
	InpgISukAm5w==
X-Gm-Gg: AY/fxX7P42cUinh+O+IRUgcPaAOS5jJ8D+L3KAHtRRxg5VyrkAOYbwgehwDupR07yR7
	ztV/ul6YrJTprssLGaeh9qlBed5FLKdO0W8PLKjG7/YisJhKeTfIaoT7vUT5MKzP2UheyG+vRCt
	HfF9cXQfd0A+04aDRvMXVUazSbfGPHI5EadFKXemoCneme1SvnYQnK/rhXTWKz6m8o/MzIX7T0l
	Mq22HqWrge7Gu1hWub1Ak/U3eE1c+ArKTzEwpiSwxhcHHs/1dp7YkwlX2z9VLYAH5MqsgRjl/WS
	38Al7HWsL5UHhb747vD7HuADsDUwPrUrzY5LFMUnGShP66Xr/MGU97cgZE4qoDcyHgXEuXTrxOi
	CGWFwSZhXSs1PEmke5HNjsf748s+1IBFHVZyUWLnkzy//zw==
X-Received: by 2002:a17:903:40cb:b0:29d:6b8e:d565 with SMTP id d9443c01a7336-2a2f283116emr270372695ad.38.1766942479699;
        Sun, 28 Dec 2025 09:21:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNm8WGC06B1FKTNVYdyJiBEjBvRjJVuKyQlWvsvW6gJg2hb0zwXirKd2N8S1aHugfgFW/jkg==
X-Received: by 2002:a17:903:40cb:b0:29d:6b8e:d565 with SMTP id d9443c01a7336-2a2f283116emr270372515ad.38.1766942479191;
        Sun, 28 Dec 2025 09:21:19 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776ebsm255743965ad.99.2025.12.28.09.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:18 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 22:50:24 +0530
Subject: [PATCH v19 06/10] power: reset: Add psci-reboot-mode driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-arm-psci-system_reset2-vendor-reboots-v19-6-ebb956053098@oss.qualcomm.com>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
In-Reply-To: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766942426; l=6151;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=r+dClbF+NRAB6/JduYUiH5LaoOpV4jm0Feyp3PXQ6Ss=;
 b=SAQAVmKond6JYVMJWPVVSbiXzghlRYtVI0aO9I3/UVBMMxZKlh9A9EHYM/50aWS7uYcgPtCYO
 FndiecgWngfADMhwW5sLopxoK4h6PDsfALXlCK56xyN1P1vxebbnwI8
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfXxArJZwNmimmm
 LYj+Sy21ZyAkiMqOWpsXdHtuUJMuhTPCFVgNs5JEQ/jE2FeJNd/yjOFk2UXuJrP74kVDj5YmvJR
 xHh9DIxeuntt01VXF9+GZw4JaWADzu+TOAn/KeOPrOccfNuDiQbZZE8xGrNdA1uptE3Pb/oje0c
 k9rLDH/tzNaBbjYHMdBFgRicniwrmizHZVdo8Nvd9Zzd1/wh2Qpb+TC1wWWjrsqSymXeUvITOYK
 yaT8XACEhSfMJfqO6feCU7hNmrdyBbwjsn+ANc9+eyw1YRpWlu3IIOetq04/vtOk0ROBMtBaHM8
 lDD7OjXrccdynscYqvCmLdWHlJN4qU0UTXUGYEK7S5WHSzlesP2CUy5n9w86kivONtB+G60yos2
 9HX6d+Ttt0WVRBhz3rH3C3Ot9rPuqD7SBokEh6BLFirYUly3eazZQzEswgBWdgK2bm98Gn3wh+4
 eUeCLimFqiA5eEH9s5A==
X-Proofpoint-ORIG-GUID: J7YNKRNCbFLf8_V6LK057DhfGgn-oAZo
X-Proofpoint-GUID: J7YNKRNCbFLf8_V6LK057DhfGgn-oAZo
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=69516711 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=y0Vp-ry0QnGiofiFOe0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_092122_503857_2B8BD422 
X-CRM114-Status: GOOD (  27.94  )
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

PSCI supports different types of resets like COLD reset, ARCH WARM
reset, vendor-specific resets. Currently there is no common driver that
handles all supported psci resets at one place. Additionally, there is
no common mechanism to issue the supported psci resets from userspace.

Add a PSCI reboot mode driver and define two types of PSCI resets in the
driver as reboot-modes: predefined resets controlled by Linux
reboot_mode and customizable resets defined by SoC vendors in their
device tree under the psci:reboot-mode node.

Register the driver with the reboot-mode framework to interface these
resets to userspace. When userspace initiates a supported command, pass
the reset arguments to the PSCI driver to enable command-based reset.

This change allows userspace to issue supported PSCI reset commands
using the standard reboot system calls while enabling SoC vendors to
define their specific resets for PSCI.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/Kconfig            |  10 +++
 drivers/power/reset/Makefile           |   1 +
 drivers/power/reset/psci-reboot-mode.c | 111 +++++++++++++++++++++++++++++++++
 3 files changed, 122 insertions(+)

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index f6c1bcbb57deff3568d6b1b326454add3b3bbf06..529d6c7d3555601f7b7e6199acd29838030fcef2 100644
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
+          the PSCI reboot mode arguments and passes them to psci
+	  driver. psci driver uses these arguments for issuing
+	  device reset into different boot states.
+
 config POWER_MLXBF
 	tristate "Mellanox BlueField power handling driver"
 	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index 0e4ae6f6b5c55729cf60846d47e6fe0fec24f3cc..49774b42cdf61fd57a5b70f286c65c9d66bbc0cb 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -40,4 +40,5 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
 obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
 obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
 obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
+obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
 obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
new file mode 100644
index 0000000000000000000000000000000000000000..499cf504071e88022fa5b5b32e26b7a674da8691
--- /dev/null
+++ b/drivers/power/reset/psci-reboot-mode.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/device/faux.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/psci.h>
+#include <linux/reboot.h>
+#include <linux/reboot-mode.h>
+#include <linux/types.h>
+
+/*
+ * Predefined reboot-modes:
+ * reset_type(arg1) is zero; cookie(arg2) is stored in magic.
+ * psci_reboot_mode_set_predefined_modes to move values to higher 32 bit of magic.
+ */
+static struct mode_info psci_resets[] = {
+	{ .mode = "warm", .magic = REBOOT_WARM},
+	{ .mode = "soft", .magic = REBOOT_SOFT},
+	{ .mode = "cold", .magic = REBOOT_COLD},
+};
+
+static void psci_reboot_mode_set_predefined_modes(struct reboot_mode_driver *reboot)
+{
+	INIT_LIST_HEAD(&reboot->predefined_modes);
+	for (u32 i = 0; i < ARRAY_SIZE(psci_resets); i++) {
+		/* Move values to higher 32 bit of magic */
+		psci_resets[i].magic = FIELD_PREP(GENMASK_ULL(63, 32), psci_resets[i].magic);
+		INIT_LIST_HEAD(&psci_resets[i].list);
+		list_add_tail(&psci_resets[i].list, &reboot->predefined_modes);
+	}
+}
+
+/*
+ * magic is 64 bit.
+ * arg1 - reset_type(Low 32 bit of magic).
+ * arg2 - cookie(High 32 bit of magic).
+ * arg2(cookie) decides the mode, If arg1(reset_type) is 0;
+ */
+static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
+{
+	u32 reset_type = FIELD_GET(GENMASK_ULL(31, 0), magic);
+	u32 cookie = FIELD_GET(GENMASK_ULL(63, 32), magic);
+
+	if (reset_type == 0) {
+		if (cookie == REBOOT_WARM || cookie == REBOOT_SOFT)
+			psci_set_reset_cmd(true, 0, 0);
+		else
+			psci_set_reset_cmd(false, 0, 0);
+	} else {
+		psci_set_reset_cmd(true, reset_type, cookie);
+	}
+
+	return NOTIFY_DONE;
+}
+
+static int psci_reboot_mode_probe(struct faux_device *fdev)
+{
+	struct reboot_mode_driver *reboot;
+	struct device_node *psci_np;
+	struct device_node *np;
+	int ret;
+
+	psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
+	if (!psci_np)
+		return -ENODEV;
+
+	/*
+	 * Find the psci:reboot-mode node.
+	 * If NULL, continue to register predefined modes.
+	 * np refcount to be handled by dev;
+	 * psci_np refcount is decremented by of_find_node_by_name;
+	 */
+	np = of_find_node_by_name(psci_np, "reboot-mode");
+	fdev->dev.of_node = np;
+
+	reboot = devm_kzalloc(&fdev->dev, sizeof(*reboot), GFP_KERNEL);
+	if (!reboot)
+		return -ENOMEM;
+
+	psci_reboot_mode_set_predefined_modes(reboot);
+	reboot->write = psci_reboot_mode_write;
+	reboot->dev = &fdev->dev;
+
+	ret = devm_reboot_mode_register(&fdev->dev, reboot);
+	if (ret) {
+		dev_err(&fdev->dev, "devm_reboot_mode_register failed %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static struct faux_device_ops psci_reboot_mode_ops = {
+	.probe = psci_reboot_mode_probe,
+};
+
+static int __init psci_reboot_mode_init(void)
+{
+	struct faux_device *fdev;
+
+	fdev = faux_device_create("psci-reboot-mode", NULL, &psci_reboot_mode_ops);
+	if (!fdev)
+		return -ENODEV;
+
+	return 0;
+}
+device_initcall(psci_reboot_mode_init);

-- 
2.34.1


