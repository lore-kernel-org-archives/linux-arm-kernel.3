Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7CDE6FE24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 17:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r831Wd4WfqmDnI6RCOW6V71GyT3JAOrlUY36xWWaPTo=; b=LTZmnpAj6xzCFUhxXk7xKCBnX+
	FX1Porzxw5exCHLM2g2kYD+4XBcrp3U2/dksQ4eTw6eu/wcNi1CGouJrfiqHR+lDxYSP3iziPAYp7
	udRbX1AljYYbGZ0YtsoTfsicsbhqxxENAn2E1Qfb8KRiSx7hNtJIJY2sanLzDyHD5wgJofarMqtq3
	mDA9XuGcBdBcjm9sRc1uAiLdhYDgOiBkMmYK2p70OjPjecB4NPVE+iDVc0ySTf5y9lUGanpubZDvk
	G2X1qetccB7Xj1MXyR3H1qGKSzAozCTKZntBcKDyN5C16WZGE2UPO+zX366dO8GAx3X4IDgBwjmhK
	+cP3jHRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5sD-0000000FnWx-2x4f;
	Tue, 23 Dec 2025 17:08:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5s9-0000000FnUX-35JU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 17:08:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFMfBe2116415
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r831Wd4WfqmDnI6RCOW6V71GyT3JAOrlUY36xWWaPTo=; b=Ri3GIgfUjCRNAkLb
	dQ6q2+iSFQfLIFnWHovJK+zjDmxFULErFFy5HbLh79B9bRLWnGsZwMsnz7n6yum1
	Gddd04L0m801OelnTqSnUBuuKhq9uzNnPm1tTPIXFMsGjVyVAtEEVs1xlFMu9vWT
	y+sdrj3WCdUKx9EUXCDeNpEvxUsB2yrhk1/RHNiXu4v7e+FjnMmX/TD5SX1iWXjZ
	AYfhFlC3LvN6wyMeIFlEzqcL3Qvcill7GYR88HzbHmSFVAKvmQ+nl8kTaX5JJfO7
	wZ4LtPUTNp6o8p7a8kN3q0xe/5m+ujJjotYnquF7J8aqZJJs0j0CCoW2QXCf3l+k
	ZKjzIA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudkfav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:08:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a351686c17so1105355ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 09:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509712; x=1767114512; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r831Wd4WfqmDnI6RCOW6V71GyT3JAOrlUY36xWWaPTo=;
        b=caivFHYKeZRnoGhKnzgJMmeRPUG9VbUZmBm6XVktDvkeNNJi9mr/tEolMV8/gDsrzb
         ukZqnseL83NpmNnRMWM9JvgoRlmbauJo6whz1003GJ8znV/o+jA+xwg8pgHs+vZptk9y
         1t6fAERMGLBz40nCnj56cvd997tJ2MD0bNePdJTiKrgcWdGFr9K2aLooN+Qssq1MOzXz
         IzjfJzU1jZLZQ8yNDZ+/qJMfHhOIF6hIVdQ8RHQvrrnXgJxN0bX5T4WxOCxSeUrdWFEG
         VI2ltv32Cg7Lgu9kwKic6RKOHRHTCNXpDJcb6NFq+YMY7/986EYy43mF5o5zuKHtNhYs
         7SoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509712; x=1767114512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r831Wd4WfqmDnI6RCOW6V71GyT3JAOrlUY36xWWaPTo=;
        b=qLSjxxEqUZbs2AO2sRmzP4ax4TiKt+vTDuztI9R+auEken01wPTChs8YzYRlGu1OEo
         GwEAE9E9Ugn0OFiK9dJ38vpbGB+/3ItxH7L+0sC3X5AHSdl5bAPeNEVkdy7+LT7O2xZO
         DvzmR6C9R4K3hMZW4KM3LT+aAEWBdHxK3qBIo/wUh/2EXQVLWdaS9B6Wa7+cw2VOWGLP
         jGfafUEbtFDuRe2txCLRY/iIR+DlzcmSOB104F6DcJzf3SIOCHLSqB0KxfqwViYbx0wB
         +GmknxiJLPfiJipifr/FON5okR+id6canACbQTVXYKVpo6NjjdDkvqHVh1EGJRSfpi03
         yEXw==
X-Forwarded-Encrypted: i=1; AJvYcCVfKQmcWgnCEi92XxS35LZi2JnMr6fE+bZ+Ul/L9tBg/RSnnPznQwoFvvk6H0dzBPVuMYNomuhpiBU6Z6KVjvHO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8HwGLEi2yabdVdJZhgHIY3FUizz6N67tc8ZwYZ9BAHqbQLMgY
	iE2bEis0PQZvj0bowRHRg8VAyGrKNGuAeyonsheSxthS8lGPY2ELtnSbXTaFYYTAeSGBLeGqk1w
	GpqajS1sofTWLVj5mx0GcTFE2rAIz+GRvNrmaOT6aaUuQKPB+87NA03c2Nun7vfp8SlH2JSc74U
	BsuA==
X-Gm-Gg: AY/fxX7CXd0vuj+H6IXvQ8N9lbs5XMd6VOW+P4kyWgdTdexJJ7gyguJB99Ld6K1fu4i
	OnoM47B0+bfFgSASmqPL8V5LlWo1d7Z/tlHRjRw5LhxAI22DKLcnaXYvwwaylRv976Gu41bOygQ
	n6F6gxBgAiPI8KBRK/pOPrYjqVh8IDv75MbqSYpLiNwLh8rUM1WO1/2LHZl4iW5aYwhy6IWUgaG
	qQCvgK54/t4sN3iAB8ZCjYN0JdeMXW8QYyu32qyEznIgyyx9X489rJkzfiEsTmz2DdPqLZoucX5
	7n0Taw7MQaB2V4M5ARqFhThKbASSXnR5MixyJgD5ON4zMLGz4h/y3Q877gzpIL5AvaRuD4P/b1Y
	5hVgpFNEvKyYmaLbIuJsv9KjqfRdZ4frsF5sEIXuluqFbqQ==
X-Received: by 2002:a17:903:2b04:b0:2a0:d46d:f990 with SMTP id d9443c01a7336-2a2f2736e52mr159188965ad.31.1766509712343;
        Tue, 23 Dec 2025 09:08:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrQog1VHIkGG+EnkxQZPPrzkqb+aSWUlvAc+fbV4yVB71uMgrSalEFFWa7D8otCTGnxzqucA==
X-Received: by 2002:a17:903:2b04:b0:2a0:d46d:f990 with SMTP id d9443c01a7336-2a2f2736e52mr159188575ad.31.1766509711815;
        Tue, 23 Dec 2025 09:08:31 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d863sm130019325ad.80.2025.12.23.09.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:08:31 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 22:37:37 +0530
Subject: [PATCH v18 06/10] power: reset: Add psci-reboot-mode driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-arm-psci-system_reset2-vendor-reboots-v18-6-32fa9e76efc3@oss.qualcomm.com>
References: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
In-Reply-To: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766509672; l=6151;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=r+dClbF+NRAB6/JduYUiH5LaoOpV4jm0Feyp3PXQ6Ss=;
 b=ywL7AR34h/F5vPYXYHRoR5r4E5A0R6/OCTRjTLWkgDzQjyLz3DmASCMeZ0R0ceNKdHAEiZa3X
 gr8qdWhZzEiA0EkTSVa1wnnqVsmMrF1/yOOYTuodbz6IP0gziePP3MP
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694acc91 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=y0Vp-ry0QnGiofiFOe0A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: aYr04OIfO8lypQhtEYJ38CH6HtcV6vxv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MiBTYWx0ZWRfXzXpdvK+M92Bg
 hEtP6+59E3BIiNAJb+zfzMswrtzBtDLh4P3yK3vLEQutUdFbTrkvSMnoF5fGqhjwCGvmPUaT7FD
 J5GAzbV53r+TVlsMjgxWXvh8S5f1rBEIo30BAzwFfZQt3yR32QkfTRrzdgnQ0jpD+tzRYJ4hAGb
 3Qbvzaepnunsu3T+v37eUp+jaNPQt4ffxAoh0ZI42G9AfYcDPc7kmQMY7OmFvNC8KmuwfBisPvM
 YRxrlKxOV3HbEDbG/1v7soXohOTnKyWqFKH1AqQPQL2yAZ3WvetqoKISKO8F0STURTs3lEOCOET
 ptl7MLoRlopnTqKI0uXhRm/sFnzMW5sTcOcoddqeuQPWUsRNuB/VmicNMyKr8Bi0gWkmp+vwM6C
 W/MybJ82SmE743xn9Ts/RVpIad6BxU2r+xey9hbgZ53L1BFMHYMZG04snINviCtgDtfEDcR0NLt
 2A20PtIGLT/jlXTZEUA==
X-Proofpoint-ORIG-GUID: aYr04OIfO8lypQhtEYJ38CH6HtcV6vxv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_090833_815032_1D6FE970 
X-CRM114-Status: GOOD (  28.59  )
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


