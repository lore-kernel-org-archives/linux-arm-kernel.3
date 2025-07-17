Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2C6C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 14:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1G5wt+CsWrcVcnaihKm5UaXqpfLNEFUHyU0bAvOqxE=; b=vgqELNj/BpwbDagRgbI2SR9ox6
	UNIlJGowCW89uForU/G0qbkaRgDZEBreOZYLiqxDKILHFvEfctr0XkdTh2Ts8sDB9X5tyWW8Ul4Ga
	p8yySNyqLsPIXXJfi1kpu8H+K68W3pz/uWTB7wI0prtMRqg30Y3Hm23mvv8TmDia5m2Zb0T8wEGkN
	sOEX8u3BX3Rj98PEdVwv8wPP9Qr7XebuU/IXWXsTxzGRk9TDsPZGp3gdGBf24OoywVijfmsuky+lt
	zwjeeNRkb2jbpH8WqLNaORcnLACNZIW/HlgLZ5DeDCeysnbZTVAaPlzPSd7XyY26m8zG1mIUoOZ7Z
	GtzuXNuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQ2h-0000000AQsz-3fYr;
	Thu, 17 Jul 2025 14:57:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucO26-0000000A9wI-2xdu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 12:48:20 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H4tPDt007196
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R1G5wt+CsWrcVcnaihKm5UaXqpfLNEFUHyU0bAvOqxE=; b=IV7TUvDR0s+V1EGx
	kraaD4KbPyxTSj0RoNvIiReG4qMA8GXBCM3mMZrqAICtuFzpEqKHZReV/VXHxCVK
	coM+YWcLgMwOrIJ4DtXsp+2AQGb+8+mMztTpyE3ouHHNaDOa2cYDJro/uRE3R84V
	I6QkQgeNJ2CwPl9ePb12P8ugKangaZJ18HN/d7wfBg7KvED8ih5QBnrE9/YgYNEA
	a4FW+PLV0yACunjuAkahEHN+lmkmQ01V8oC+LFk2CEiwX1h1KhUdmN90dm7UZ0xb
	r45RVK6NXjMZb/N8Wcuu7bxvNZTDYPwlhUNZF9B2ura1YcJDBedTwLB8r+vb9FyQ
	PrWjkw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca8uqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:48:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31cb5c75e00so558920a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 05:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756496; x=1753361296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1G5wt+CsWrcVcnaihKm5UaXqpfLNEFUHyU0bAvOqxE=;
        b=DNFhclJTk1NwSyWx8Z1DaJTdO5tR4jr4tnTTctPWo8/3uyZVnmQPltG0AzjuWNMpJM
         +6cU4t6W5JCJOwzW5s2OzUNBqW9BjFTWtsrsn8RzwoySdhGKoX20oaz5XVI1pbblclqX
         5m3PzKDQpHRyRnCVv3MkOLAlGC/dr59svbFY29WvKYIhMMGvKFe89fQcDkE8oMN6fDwV
         +sZHXBcWXKXbtow28hKVXy9fc2K++QuztwNH5DH6vBRY3gOhZ34lUIaTBDYcE0vvAU2U
         dACCifBzJHcmnBd1nzNZ0Ner1ka1aqTqLvmU/9S4yr5kXzICPbe3LLmXCvG+n1zixUNn
         X33A==
X-Forwarded-Encrypted: i=1; AJvYcCVL57ULoEwhu4hArD8UiLFikuppeC2AHsNNveHG94Ct11+YXtFoQ+RUx5sIJ5jndTQFlQlL9uKCOESGjpeMTYzm@lists.infradead.org
X-Gm-Message-State: AOJu0YydQG2fkpdzQMilOpce1k9B6y3JT8yGoCm9NKr4N1uUECnfWH8p
	cQZPG/2D1NW2fXYZLdr+D0MmXfaJsUbXsH4MLBWkBUpVGNyHcrqni00WQLljIhmVJ6kx7Zq5C2U
	EoWkINpu2dWqxn971IZuNaweppWpgBkU9zRHjNHk3JdtWBZ4vIPGZvh/OlgG1mlvoSS9eY9bWCH
	D7Cw==
X-Gm-Gg: ASbGncssrwPD5Vm04jJL+jvINUBLIb+f2eyIlmYmSrorJqTzvZx9TKhUWvJeFjf29Em
	reXu2UjV7RSTQm3eQ9Gs7CLPPwvyJS73JAgpaSJZZ55Dqw3yvRSEUQ3qHkhIglg2RxjmaVo+VuI
	9fwSP61KQ5BhVn1zEj2uIQygFnR4Dkpn67M+bBuSTnLF6L49HrxZr8LDSjnXjqZ1z+Dy4bPk1Es
	1zrjo11uSnlVh1X2o4xx0lc5kZbLWulFSICxaq2GV0OtkUfbhPwImiFlvDLH8SNjN4N+FpJm0te
	mrf0KFsbkUeXqdrmfpzC1IeTDXeQxJku92BuKCyTVFQLECEWYDueooKZOSeCng1UH64kJZmipCG
	X
X-Received: by 2002:a17:90b:1d91:b0:313:d7ec:b7b7 with SMTP id 98e67ed59e1d1-31caea21192mr4833789a91.13.1752756495932;
        Thu, 17 Jul 2025 05:48:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3rytw7zOtg7Xmx743LeMDSPzC+ugRsDIVSFqGgIoj+8yoPglIf7EpfOaxpi0dHqanWFp4pg==
X-Received: by 2002:a17:90b:1d91:b0:313:d7ec:b7b7 with SMTP id 98e67ed59e1d1-31caea21192mr4833737a91.13.1752756495409;
        Thu, 17 Jul 2025 05:48:15 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf828a0esm1505283a91.42.2025.07.17.05.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:48:15 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 18:16:50 +0530
Subject: [PATCH v11 4/8] firmware: psci: Implement vendor-specific resets
 as reboot-mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250717-arm-psci-system_reset2-vendor-reboots-v11-4-df3e2b2183c3@oss.qualcomm.com>
References: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
In-Reply-To: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752756455; l=4666;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=vRGudR+4lCF/CFjdEfDPgNRqqgAfbw6WDOCEN0Ok4b4=;
 b=OKh/pjXrYEArit7zr7m33XcTU+HzHx1vsKq5fDIex79NvYaBydSHXdfZ/6HqRxS8LAxhfcoeB
 qdpS62xMdWeDv1FlHwDj6hA1ZEKsrTAid1BW/6NnYjepSdI2QniynAr
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMiBTYWx0ZWRfXw66VB3K1aQGT
 DophRndGQPnxp+MN9E6HjXeGuOykDN+8lJTSnSr4pR8PZREV8cpP5dk0k8ayMzFC5XqLBImMZua
 OT8rZClxjGTLy21Y6SbCxdhp9E1zONeO5qCfO60tLAZ7bTOm/pY/fp2SxDLwz2VNbd4g1AX5aKo
 QZ2yio68PLsf/P56lDn4P01i7tE5PZ4Wd6GCEncJObYJnF8R28b3blGVplyF7YNn7Q+CwImYiQ0
 /s/mUTCmuAkpjZFUrfaJ0o3VK0HaQVkViye77fFF6GIXvzck3KY2sGz33XoUdgysd3eEiJwjgdt
 bXf7lRbkRHgsgVuoFCrUnL22stVAikyOAnC2MXI2rmXYaSkla3Wz6E9NdI7xWyeBHL82YvDxTdo
 LLIhhJ7zd2fp1ONq+uCEbvQmhKkbRPiMvSOn3L6BK6ax7qZamHVEj62NKK78dd7+jFc7faxR
X-Proofpoint-GUID: ggjQMYtPOgIxE5ByycWl9zjcmlcCwDYI
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=6878f111 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ppK30-iitoQuh3faNGMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ggjQMYtPOgIxE5ByycWl9zjcmlcCwDYI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_054818_864224_B157C5E7 
X-CRM114-Status: GOOD (  25.95  )
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

SoC vendors have different types of resets which are controlled
through various hardware registers. For instance, Qualcomm SoC
may have a requirement that reboot with “bootloader” command
should reboot the device to bootloader flashing mode and reboot
with “edl” should reboot the device into Emergency flashing mode.
Setting up such reboots on Qualcomm devices can be inconsistent
across SoC platforms and may require setting different HW
registers, where some of these registers may not be accessible to
HLOS. These knobs evolve over product generations and require
more drivers. PSCI spec defines, SYSTEM_RESET2, vendor-specific
reset which can help align this requirement. Add support for PSCI
SYSTEM_RESET2, vendor-specific resets and align the implementation
to allow user-space initiated reboots to trigger these resets.

Introduce a late_initcall to register PSCI vendor-specific resets
as reboot modes. Implement a reboot-mode write function that sets
reset_type and cookie values during the reboot notifier callback.
Introduce a firmware-based call for SYSTEM_RESET2 vendor-specific
reset in the psci_sys_reset path, using reset_type and cookie if
supported by secure firmware.

By using the above implementation, userspace will be able to issue
such resets using the reboot() system call with the "*arg"
parameter as a string based command. The commands can be defined
in PSCI device tree node as “reset-types” and are based on the
reboot-mode based commands.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/psci/Kconfig |  1 +
 drivers/firmware/psci/psci.c  | 53 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kconfig
index 97944168b5e66aea1e38a7eb2d4ced8348fce64b..9d65fe7b06a6429de8a26d06f9384e5c93f36e5f 100644
--- a/drivers/firmware/psci/Kconfig
+++ b/drivers/firmware/psci/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config ARM_PSCI_FW
 	bool
+	select REBOOT_MODE
 
 config ARM_PSCI_CHECKER
 	bool "ARM PSCI checker"
diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..28018c283eb627bcb4ce6223c56899a43ed56399 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -17,6 +17,7 @@
 #include <linux/printk.h>
 #include <linux/psci.h>
 #include <linux/reboot.h>
+#include <linux/reboot-mode.h>
 #include <linux/slab.h>
 #include <linux/suspend.h>
 
@@ -51,6 +52,14 @@ static int resident_cpu = -1;
 struct psci_operations psci_ops;
 static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
 
+struct psci_vendor_sysreset2 {
+	u32 reset_type;
+	u32 cookie;
+	bool valid;
+};
+
+static struct psci_vendor_sysreset2 vendor_reset;
+
 bool psci_tos_resident_on(int cpu)
 {
 	return cpu == resident_cpu;
@@ -309,7 +318,10 @@ static int get_set_conduit_method(const struct device_node *np)
 static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
 			  void *data)
 {
-	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
+	if (vendor_reset.valid && psci_system_reset2_supported) {
+		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), vendor_reset.reset_type,
+			       vendor_reset.cookie, 0);
+	} else if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
 	    psci_system_reset2_supported) {
 		/*
 		 * reset_type[31] = 0 (architectural)
@@ -547,6 +559,45 @@ static const struct platform_suspend_ops psci_suspend_ops = {
 	.enter          = psci_system_suspend_enter,
 };
 
+static int psci_set_vendor_sys_reset2(struct reboot_mode_driver *reboot, u64 magic)
+{
+	if (psci_system_reset2_supported) {
+		vendor_reset.reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | (u32)magic;
+		vendor_reset.cookie = (u32)(magic >> 32);
+		vendor_reset.valid = true;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static int __init psci_init_vendor_reset(void)
+{
+	struct reboot_mode_driver *reboot;
+	struct device_node *np;
+	int ret;
+
+	np = of_find_node_by_path("/psci/reboot-mode");
+	if (!np)
+		return -ENODEV;
+
+	reboot = kzalloc(sizeof(*reboot), GFP_KERNEL);
+	if (!reboot) {
+		of_node_put(np);
+		return -ENOMEM;
+	}
+
+	reboot->write = psci_set_vendor_sys_reset2;
+
+	ret = reboot_mode_register(reboot, np);
+	if (ret) {
+		of_node_put(np);
+		return ret;
+	}
+
+	return 0;
+}
+late_initcall(psci_init_vendor_reset)
+
 static void __init psci_init_system_reset2(void)
 {
 	int ret;

-- 
2.34.1


