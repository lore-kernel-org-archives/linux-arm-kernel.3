Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3425BEFCE33
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 18:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1QU/6KPKUgk2iLlcEujLmkn3VsstnPbt073tBLoZVE=; b=hnXKDK9rTiDbPMURSkFWJKY3La
	dK+IbKmt6FduPVykx7o3zd5LW++R+jhYt9PwvIovrsmPYL6dc3DKvBKewhlr6thchG0VcUIHDDQBj
	f83QR5fe7GTZmm5OX4NVME1JuJ0E22VGWMVuIeKfLzf4uQqjsraqFDuiYUOCDEeraEBXnVpGicR5p
	Wl1or9hZItD3ICtO7iZ2t9xIAkmrIvD5TDTlcntg9ttwHrcJTAQG0doF7l2U1OUYakNc5hhg1avce
	38RccA1vN6BJRjuqyCokcXjz4k6JA7CGTGhErtXve5JfWXPC2KHV+/569PXNUNMbP1hrRrP7y+dVa
	KRFa6wbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqa6-00000000IAh-0jfO;
	Wed, 04 Mar 2026 18:04:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqa3-00000000I8P-2C0G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 18:04:20 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CAYCA1678164
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 18:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1QU/6KPKUgk2iLlcEujLmkn3VsstnPbt073tBLoZVE=; b=pbsZk+aGi+gxjrK8
	N4J/vjUUTN0UbYZSe0fEU1RbFFflmLGkdHwSb1M7elIS6NbkactzNhBX5OAeeBME
	yC3at+uSxCUnGP7KiDs3O8JWoYOxRy4prmbJdDJ/wkzXaz3+Ubmcym0M4dqQ8o6G
	N5YDL57moKLePiG6SwkDE8ncuUIvqGWD2JjaZc67gHYAU29MOXfYhhLzIMXZL6N5
	oq8oF8qWtyt6SIkqeLm5orqzzwMncQVwErpUss0Y7fFvN+l6u89rjiFq7fRKEtlr
	mUjr6HWv4VKGeTILHnfOVTTltbGZ8h/TRkA4g/O5GSiHfR7L5Yv+T2xwiASX8ver
	1LTVrw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp73hbvq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 18:04:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358e425c261so6211563a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 10:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772647458; x=1773252258; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1QU/6KPKUgk2iLlcEujLmkn3VsstnPbt073tBLoZVE=;
        b=BXO7s3NmMfRyhz29J66y6X3mZOSg61JkhZ1iAvDfp8HRsPgA/2zsXKYPxHuna0vR4M
         5DoxiwMoTgFF8XDQiOorfJU+50IP4LuGSjqPo2FXSIrZ6GhQL5wlUNkMItDyLxAdPFXE
         QuQMb4Olc6H/DzhJkuUEZFzDeX8cw6ev9KdMza9V8bVr6CmvNMVmzD0tu0kAnd05t87Q
         VWbnOx27AfDGHXctmzkjNKvbIY61Vr52l7eWYlzZ11nNgKl+uyee0MPexjmPcS3wg00z
         DyODHmRalKopOHM7nSOwyLhL4SNwYBNrdup13jpzrt9dSgj1t+U/8C4wfmEvRB6b5wUi
         rQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647458; x=1773252258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W1QU/6KPKUgk2iLlcEujLmkn3VsstnPbt073tBLoZVE=;
        b=XnRhGukcWugVZdgakKaaOeiQwlLDNb6zFMLHyb9FlJf8oFhZGeew02jDox6Zd9c4iK
         AVT5IC3GMZto1BSU+iRU3kacO7PxZ1x6nRnjVCL5u2ljf9+fWTxlpAWsHreDsdZAQfQl
         PsS8KNzNg4NNNwPO2cCQM5a14vVqHXIcteIz74eNL2YdOYB9sFvO8d/lY8pqczsCTXhI
         dj9EMNPM9NDcMvKgVRoUUL+/oYsNj7LgHkQuvZSbR1VbXD/Lc7u4U9IhzwIRqCXimabt
         u8v4MuraZBmlkIK4GI6sBlQ/siv8/sRSauzYQXE3BiWnRldgiYxzLT+7aGYoprQ8TCnB
         gGCA==
X-Forwarded-Encrypted: i=1; AJvYcCVvYhSvJTiO///UGqV1CIPQbuepTntADL0iXNJIbkmsX2Ll+5lFseMrGjfIKLkA7yJRnLY4OabfowzrCNf3dWjv@lists.infradead.org
X-Gm-Message-State: AOJu0YzxUYsRqDUNMRJn+XY7+Cf5LPsbVII5VE60OZD8dCSXAgx8m4jl
	nbK+Hz+WZHi3kkIr3I5TV/5JZXbB2V55FD2Sk6Pq4jR7YA5AZZul1XCTvID3GfHujK8x7Ypym/i
	icglR2nBsOlcH+PcxKIPKpnjYhfwYnHQ9D9KZt+eFOE5mH/SO2o7O8ybPzwZu0xB3Mp8/RJVPl7
	hYQg==
X-Gm-Gg: ATEYQzxvVavnagn0jhBzmfEvUUSH004wWPzWPrb1I9o97o9MDRRuPDbW/1JLtcpwpDH
	paShFQIqi9PLsQSuzJMhH5lIwyLlrwBc2olZOBSsifm+sPD01sHtuLH5jgfdp3+pE39CZlH27gF
	iJlJo2WtiWsMxf5dgRNn6N8qchLzcFBCSIqkZUFN+tq5ySlyBfeLjEmTVf3Z+Fh+RN/dAhVFtN8
	nU/qtcS3kUjwKc4OHexeGpH6yTGnfVeTZ6jSmVVfRYGLazn7wJMpphcgO1qYj6aFQpnXW4QHt/4
	uPMbdB4J9IFTI5YYO/4NUStpQ2FxWc1jhJ7Q+r6Z8PB3VRCqyP+zyyCM1XGiIaljc0ZdDft7rv+
	vysnyi4sl/LowT0H7iqDEKyhrkfrU9S6oIMz7Dv+UIi23SZyCvvQxSRqcyw==
X-Received: by 2002:a17:90b:1344:b0:359:8e59:16e6 with SMTP id 98e67ed59e1d1-359a6a9f792mr2009630a91.32.1772647457867;
        Wed, 04 Mar 2026 10:04:17 -0800 (PST)
X-Received: by 2002:a17:90b:1344:b0:359:8e59:16e6 with SMTP id 98e67ed59e1d1-359a6a9f792mr2009614a91.32.1772647457338;
        Wed, 04 Mar 2026 10:04:17 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359a8f22062sm1080606a91.1.2026.03.04.10.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:04:17 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 23:33:06 +0530
Subject: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772647398; l=6255;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=NM7cOAWz/hLiiDI5r8UMeAd4BHN3hlmXiVPhRwzC72M=;
 b=oD6nxBX3PrcdFEYrXB/z/9OA6OCArQKPjMUTNPBsYMzHjGuI+CLe3jdhs2EGceNA0PTw/Idg5
 kR63U0YmZh+BKfLFEJY5xadmMaMt1JIpKkR+gmqSqWPlNhp3uylysAu
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: _IVjMSAKAVbeI6shh4Gq5xf1jIrAr7KM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NyBTYWx0ZWRfX+LMLIKHwl2ik
 j0mT88rOO7pHsl47E2x1bZbgwP1sahxqPdZS8zvW0cRcUBtAwFUPyTWASjsJm79R7Edi9HW32k2
 7ZkJDWbcJRwPv6S2fo6d+M2YKUZT3Yox0e6mHgNCp+4BdXjVsWs6UW4dQ1RibOh4s0Md00zPDeT
 D0tEM0NKvUfUeBM7ytewPLR3xsSBWrRuDWN3VfEdNB3CmngOmzjWAcXsTv1WjbCHcZMMCFN2oqX
 RkP482JcbSGTZ9Uadh7B3DwOxdnIsSlrzcbu74+7UOZJVAfKL3PE2KTI8qn2kfA0Ca7tONtz9DD
 O+e6jKrMwXX100pRPIzXD1S9/37rk84Tg2S7U7g2zE3AX2fieopz7M/nCYeodiZ48+M+/Is/NYD
 12i9F7mGV0eGcLLHuOHlzFKUR7APffQ/QQsOS8l4lC6iEeAsUSDoVx6XRsiJw//haLiD4kOvV7f
 zT/0Ea+WP0l+lRdp9QQ==
X-Proofpoint-ORIG-GUID: _IVjMSAKAVbeI6shh4Gq5xf1jIrAr7KM
X-Authority-Analysis: v=2.4 cv=BpWQAIX5 c=1 sm=1 tr=0 ts=69a87422 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wQXJ-QnpPWzAIZmQQd0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_100419_617763_88295F81 
X-CRM114-Status: GOOD (  30.99  )
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
 drivers/power/reset/psci-reboot-mode.c | 119 +++++++++++++++++++++++++++++++++
 3 files changed, 130 insertions(+)

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
index 0000000000000000000000000000000000000000..86bef195228b0924704c2936b99f6801c14ff1b1
--- /dev/null
+++ b/drivers/power/reset/psci-reboot-mode.c
@@ -0,0 +1,119 @@
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
+ * Predefined reboot-modes are defined as per the values
+ * of enum reboot_mode defined in the kernel: reboot.c.
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
+		/* Prepare the magic with arg1 as 0 and arg2 as per pre-defined mode */
+		psci_resets[i].magic = REBOOT_MODE_MAGIC(0, psci_resets[i].magic);
+		INIT_LIST_HEAD(&psci_resets[i].list);
+		list_add_tail(&psci_resets[i].list, &reboot->predefined_modes);
+	}
+}
+
+/*
+ * arg1 is reset_type(Low 32 bit of magic).
+ * arg2 is cookie(High 32 bit of magic).
+ * If reset_type is 0, cookie will be used to decide the reset command.
+ */
+static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
+{
+	u32 reset_type = REBOOT_MODE_ARG1(magic);
+	u32 cookie = REBOOT_MODE_ARG2(magic);
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
+static int psci_reboot_mode_register_device(struct faux_device *fdev)
+{
+	struct reboot_mode_driver *reboot;
+	int ret;
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
+		dev_err_probe(&fdev->dev, ret, "devm_reboot_mode_register failed %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int __init psci_reboot_mode_init(void)
+{
+	struct device_node *psci_np;
+	struct faux_device *fdev;
+	struct device_node *np;
+	int ret;
+
+	psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
+	if (!psci_np)
+		return -ENODEV;
+	/*
+	 * Look for reboot-mode in the psci node. Even if the reboot-mode
+	 * node is not defined in psci, continue to register with the
+	 * reboot-mode driver and let the dev.ofnode be set as NULL.
+	 */
+	np = of_find_node_by_name(psci_np, "reboot-mode");
+
+	fdev = faux_device_create("psci-reboot-mode", NULL, NULL);
+	if (!fdev) {
+		ret = -ENODEV;
+		goto error;
+	}
+
+	device_set_node(&fdev->dev, of_fwnode_handle(np));
+	ret = psci_reboot_mode_register_device(fdev);
+	if (ret)
+		goto error;
+
+	return 0;
+
+error:
+	of_node_put(np);
+	if (fdev) {
+		device_set_node(&fdev->dev, NULL);
+		faux_device_destroy(fdev);
+	}
+
+	return ret;
+}
+device_initcall(psci_reboot_mode_init);

-- 
2.34.1


