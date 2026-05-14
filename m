Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9ECCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+wctK5RZ9TRw0ESOwHfyBsEr+rYwllu4QgRLTyrtk0=; b=C+8Dbg5xmZ5o6fMtHxhcbsFRej
	HmZwFvvunP+LAL5PcTiCTjp7rL9dRZXw5euCK8irX7+UDn9q3PuzRiSA8FPztE4iATzRGbOgH67v4
	Sn/3hNkPeRvA2tw/wQ+kB15A5jMQxQFcckdVAP1tbhbBayG2eExUgrsMTyOBTz6urzreCAh57zaYj
	DY2Ht4B7EzFRyiuonNikLNGFUZAWC42F+ZOJXnrVo/LVEKFHFqBKLJ/5vlY5Zuv/yjTYKLeOf3/iN
	EwsQMMf3E4MxUfWEIMQtAm74aBiLMj7+IkTlXpkKjRTQSQlIB7q8N3EiS8+uKh874O7UEssCxRhGl
	gx5h1HAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX2s-00000005j8T-49ZI;
	Thu, 14 May 2026 14:28:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX2p-00000005j5W-1TIy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:28:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBecKb1718027
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e+wctK5RZ9TRw0ESOwHfyBsEr+rYwllu4QgRLTyrtk0=; b=bo6UGY3dqyOl8c3l
	8g9HWrYTAUoTWrEDIQfx0wSB2ZG+T+Svkxwi4ZpPPr/RdSN24VkVc9ZV2MYKb5lH
	lbacdMZ2SgbGim17+UK/gAVlVEH8tjjFHBNVqbq8IjGVNj914W6WwjeZOsbmDe+5
	wYVK2Ec3MwThhd7bb8lHktSfiDg4T/E2F6/G1KyvTL/mz+vEOe55YrGDSLDLZ0QJ
	d/IvHWV8kW26wGrEfvXAAm0xRT9nKLOV6Udwz4tnJ0+AMNthdmY54jHntI1KVRAE
	1AWVjQGn9bOpmuXt42jMlwu2gQOANr89N2ag38elj53trshzo84kLzyeVpAURaI3
	Z8Us/g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57y7hw78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:28:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc860066a6so42145905ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 07:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768889; x=1779373689; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+wctK5RZ9TRw0ESOwHfyBsEr+rYwllu4QgRLTyrtk0=;
        b=Jiumwh5M84lycZUJggsSO+Zr2Ptd0AhNafwFMBifQVt7/JdG0DxM2viyCEWAXniaa6
         akxH2jsRcMhnv5UXmMTdsvAgj+RZ0Eido8yNETUGOkKVV9s2z/KsDgvckg33qfUBZ2DV
         9gduWiBwlZu2l8fPLmsC5bWu3oiD8Zphaa8pUrfOLCU4zL84rlqsour9qDXIawWLUqgd
         0qqmpFh++WmTZ/zqKqT4JpPqMLgFFmBiaByZjICRdZS5fLMLONN484SGvoU+ThxgubuU
         OapyiGY3piw+Zy0P2anyl4tgF/EB+SQXjSpsOTc8Pu+LqHD8mxzcDKU5TLQ34jNUnoi7
         I+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768889; x=1779373689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e+wctK5RZ9TRw0ESOwHfyBsEr+rYwllu4QgRLTyrtk0=;
        b=n10eM3Pb3+vDbZyF7W1yNfWfHlIJWkWQQPmMmZk3Jvqj91DmZlB0HBsG7z4S9C6Th+
         ePXoq6EbuzpCmBeVaCk8x7x8+EaeM9yq5N9KoG1MGkRpDune/P3mdB4Gdh47cH9tQZVa
         0S2G/IJ1VSwoe9Ev1+LU4HZ39AYNi+dPHj9J+qGzTz6oCMWrFqefafsY4oW2cqWWgpT5
         luVeYT+i6EoqCZ17xByk2elzUeUOn7ad+A9TDyWN4zpk9xi/uRqoR2tXirLM6bpvPWsj
         OgLAMWruQ9WupDedFN5t6Sf/GIhjiQH42dCulmfbIwlJwUMSuRXxSIUDsJZ0Q5o8Tf+j
         OQzg==
X-Forwarded-Encrypted: i=1; AFNElJ98VVdCdYG/669BxX/FUlE1qL5wh8lFma4rPXHLG5RTP3stY7rFWG0cXrEa7S+upu6BucWmimuFDZh5fYo2NPjw@lists.infradead.org
X-Gm-Message-State: AOJu0Yww6wFA0+oS9Ge5yOhSjP/I5exvy2r9YKYzTS/cZvBJ1g7qstFa
	v5cOZI8Xhld65x4hcPp8Eyt7Vubct60OpXMl77jv5mTE9YVaLCh86lfd6f9qECFkM8uO7R9pFJ7
	c3IBnbtvWyVhOQDMY/Q0x2coB4UdEh7HDkCw7G60EPfNghVHD7fShNPzQW6drXE9L17AocjxOo8
	UorA==
X-Gm-Gg: Acq92OFnh8ROi+YFuhyN4FZjDO/UrEmR2SfaFpFAsdSQc6g1JLvYKW/TMLBAa8eW8ja
	BDn6kLoyhg1z+lIq6VEwN47hABh/s/yFM56shx3l2LjwokrO+8ANskqstHHeOPRYP2Sw9RVME3+
	5Tj0X/blQ2aU3Uoe+cV7JR1JXqNJK7dMvbIk8E3QUCj5jwPnURK4DxjNQczM0dIs4olFQcSqQQL
	A+qPmNqIw0AL/xFFxjbLlXXetTR0y7GN9Tji4DscRb++hBPw/dydmZcWUmewEZn9R+UHHdvaxEl
	riL8EBvygFBkBmoN89BfrHHunUU4OL84ZWoczaNTwgiM7H6rvmoB+oI7iKJQW4TbNFqH4NNeQHd
	EFVOWEKZczJZB7hKx5g0XXqs0sQJ68x9t7vkulbqLCFxQfSDkrsNLZBOvng==
X-Received: by 2002:a17:902:da91:b0:2b2:67ca:5fff with SMTP id d9443c01a7336-2bd275dbdbfmr86312115ad.28.1778768889324;
        Thu, 14 May 2026 07:28:09 -0700 (PDT)
X-Received: by 2002:a17:902:da91:b0:2b2:67ca:5fff with SMTP id d9443c01a7336-2bd275dbdbfmr86311445ad.28.1778768888758;
        Thu, 14 May 2026 07:28:08 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:28:08 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:48 +0530
Subject: [PATCH v22 07/13] power: reset: Add psci-reboot-mode driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-7-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=5430;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3BU+OmQY7vwCKgtP7JgVodTFXWx0p5HRBbSXZG9v7s4=;
 b=O+mpM9uK5VeT9kC1EvBdS580IgwUL/WKhmZyQHzqE6bMvpgOGlDCcxQInGtEf9FjtiyLgNt0O
 0ePmlrWLCBEDsrZLPPtYJj3kDH6ciDztOjQttWT3OwntVA9B/fPs4yD
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: R63cC0lwCj76pEKzhUMrFuOVDKUTpVgZ
X-Authority-Analysis: v=2.4 cv=UY9hjqSN c=1 sm=1 tr=0 ts=6a05dbfa cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=5CqnhzuZLWPXzHx0y-cA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: R63cC0lwCj76pEKzhUMrFuOVDKUTpVgZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfX3cJO48CZjoe7
 0Am1tKWJbkNw/J4D1L/0BGVQZkBeAEod1+JlQz6QbFp+fUuLDS5OsbkFkKef5RDVM1TNYRaoMXH
 N+jUnvtxysk4tL66rus+oji+rhtGkGiQ05Q4fUYRd+7QNDa2TlIZw2kg62RvyKtZN0vBYdDia/O
 RNxVBV3fjkKr4odWUryK8sTMUrZA890krcFwcwPxJ4EpjGpk8tubphFNl34HRP6CnwXz0ViNCE/
 +ox61kJ/TSU5XgUcqf1oRPQi25DEoId2DDu2MQlUruj+te8KoilsCzpcm82t700RuvJ1oL/isoa
 3KUOLAoPs5TrQH9XVyWyobS2VuOzJ787TwHMgVvNidJKsZCCoLpQYizyv/586uOLsJi6gs+RFiV
 +sndLAKPGVsoLDAKmxBA4FNrZjNO8BOQ+T40oHh7A/xtkf/9ms0Xp7yOEgKtlXZ+2+QgUdLfZMH
 fMkJLX9JlMWS7h6GI8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_072811_869803_65D81260 
X-CRM114-Status: GOOD (  27.40  )
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
 MAINTAINERS                            |  1 +
 drivers/power/reset/Kconfig            | 10 +++++
 drivers/power/reset/Makefile           |  1 +
 drivers/power/reset/psci-reboot-mode.c | 72 ++++++++++++++++++++++++++++++++++
 4 files changed, 84 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36ba42209c0b332813a296880cd55798a5592d2a..4b0815c31679550f5ab719de4a5852990c7cc643 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21342,6 +21342,7 @@ S:	Maintained
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
index 0000000000000000000000000000000000000000..845b2a1816ce53451dea8dfc4bffffda0d3e9293
--- /dev/null
+++ b/drivers/power/reset/psci-reboot-mode.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/psci.h>
+#include <linux/reboot-mode.h>
+#include <linux/types.h>
+
+/*
+ * Predefined modes:
+ *   reset_type = 0
+ *   cookie stored in magic[63:32]
+ */
+#define PSCI_PREDEF_MAGIC(cookie)	((cookie) * BIT_ULL(32))
+
+static const struct reboot_mode_entry psci_resets[] = {
+	{
+		.name  = "psci-system-reset",
+		.magic = PSCI_PREDEF_MAGIC(PSCI_RESET_TYPE_SYSTEM_RESET),
+	},
+	{
+		.name  = "psci-system-reset2-arch-warm-reset",
+		.magic = PSCI_PREDEF_MAGIC(PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM),
+	},
+};
+
+/*
+ * magic is a pre-encoded value:
+ *   reset_type in low 32 bits
+ *   cookie in high 32 bits
+ */
+static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
+{
+	psci_set_reset_cmd(magic);
+	return 0;
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
+	reboot_mode_driver_init(reboot, &pdev->dev, psci_reboot_mode_write);
+
+	/* Skip PSCI SYSTEM_RESET2 modes if unsupported */
+	count = psci_has_system_reset2_support() ? ARRAY_SIZE(psci_resets) : 1;
+	ret = reboot_mode_add_predefined_modes(reboot, psci_resets, count);
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
+
+module_platform_driver(psci_reboot_mode_driver);
+
+MODULE_LICENSE("GPL");

-- 
2.34.1


