Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA46ACCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 14:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbnFer6ISvtTqu+4JwESaso5mdco91wCeNffONil714=; b=qBlC3a0JmHCdUYcwGxc47eNv4F
	x89308johrghzXLJse/Yh/T1kGoQuY+L2HEslzhkFjn4c3aycO5a+7OTbSrGuEX+VEtEXKJLqRBhF
	5icGST6m2HplcaIAgzY0/6TbPjeUAiwNE3203VFNOECBG+aLIpCsu4AnWLdEHBt3FEQE6eu9nbVGB
	YWavjLRqN6eWWHsybekklOgyg0D8pYdmnqIeuk/wVvBm9o+MZo2ZvkoLhsyVgzuqZ2Y3TrjvAkXQL
	80eK3MYGarM8wxIt4xpC9QWcv2qjngn5H6TR3cb/1V7ZTVz6GCNCcDQlm5JQPidHmJjDSDGmKT5n4
	RSc3vAYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6ZV-000000045Gi-07X2;
	Sun, 09 Nov 2025 14:39:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6ZQ-000000045Dp-0Srg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 14:39:10 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9EVncC834250
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Nov 2025 14:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WbnFer6ISvtTqu+4JwESaso5mdco91wCeNffONil714=; b=BbiVJZUilltEG8Zc
	zmeH5i0vVOBoNszLCBD+ywS+JOkyzqGKzC9CKLGZcX8UtHhIIU/96uZnxyccgB50
	Qap65XzJST1hRFANY2I+lFfNSyQVBfwH8tVJktlMWdfGLFk4SLPtvuXUTkl1uwV1
	yp5z50RTpfju9/Iv4rQMXpq+DUjkvAvIndzAedaEDpsJV6qaYP2hYvJ5dDJOmJe8
	8vyz/aKX9Z381xUf+YZmwFa+Wqkwql/Wbm+m0hAM4eup0tU4Bvrgcd7ZpM1ThXNh
	LPcUZP3jhn/kpo/q2nubUjtMgYX9PFVfR9DMLcDIwVy/Fpx3swEFKiMCGCgKAVnQ
	BlxHuQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xu2t81v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 14:39:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34377900dbcso1025522a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 06:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762699146; x=1763303946; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbnFer6ISvtTqu+4JwESaso5mdco91wCeNffONil714=;
        b=g5nTypD7n0BJnuKds1gnXb/TgiHyTVgFlrEABVDGitUoJnKLc2IJLvRQxsj4v1Iqgk
         fHdnSjmQy3kmEYlQRFaLyVIENOkJUTBgIIK+fiUhFzK2mHkHbFWa983ljCK9AGjmzZDB
         BbIXlazwaC7X0k8hxf4V6S41T2jV8OqAEVqWYCHn+508kT1ETcsviGZuCPCJI1OadCZK
         bmyI9yMfC5mNpHQm91SXNW5HOH0vNZju/SeTahIbSQZqm13Aokauoe4cXViPs9e+C+ug
         upwBf4/YSBaiiWrtOkod0bWgeDk6UH2Y1ItIgDAZMqPFnYdqiagCSyvOqsSl0vdFuQSV
         6kWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762699146; x=1763303946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WbnFer6ISvtTqu+4JwESaso5mdco91wCeNffONil714=;
        b=c+kS1LdnhMFodusCncUKaraVlmj8o1cumS7BfhgDJ5U64Oe16TgBTgpRp4AryzX8+s
         rMr2GmZTlyIYtRRaUKm1hoQc25CQQllt2jb7ie8uaZw3DFFQ4aWge/5fsRGwORW/HUjg
         cc8VEfvEsP5S09H4fGExEW0Jr3rQKS5Q1U3Frajn5auZAPjy4brpj8li8Dhp0Ok6hKjA
         8lGGbgzOVkxU205bCGs41iLCODEUEseKTXT4ymV9e11EbpnOh9+QjNYRZS0Lku5WXW13
         fOBFipV6a+irRnc8hyZgEY+KBlOhqvPQop8C90tvS77EbcjK3gFPzSks3/TfuUYP9f2S
         O4Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUcg6SshqRmcU6Ygi7vByRXpfh1lkaW7NQU5+fHkcUdwwn82jNHYKKfeF/G99k52vMKOkqD8a9kjXdCLgH9YaNu@lists.infradead.org
X-Gm-Message-State: AOJu0YxYtyxlqr7E1LdwEzsJo5vfLg27M4jBG0g88sDKb2IUtEn9HNv2
	ahby6so33spyRTYAazDB3Gn8VXEHjvIqi3til1G3E/bBXkKsTikfmFaWb4+F3RKuphzSOxs41NM
	XF/XqS2PHdVlDG8l/Fo8rgC++7XFsJNKOvZNo7Tnp+RVQGOt+fib7bHTyzAr1fbe5QjtpylwAbP
	SNKw==
X-Gm-Gg: ASbGncvfmubHEssnwyo5I9DQWKAaY66686KSIszd1A7ClfF52FgRK9lVuQRCMZP9vmL
	3HKxywlyM7VLL+3QUs+nect1hTzOBCdncihZymIS14uT34UHNzYHdGjYjiN1nA2ANR4b68YAWXK
	OYTxSMwZxO9faxwgMvZF8OwfDcNGwruZtNZLqiEg3XOxkG9VvhA4Vm56yU3qCZ8iX91eTDfWZTS
	0DTHYUtc+MTF5Or6IzNak8yNPjwU4ib1uINlBskiEZ9F8c9gZ4VRm2WhbOmMjiyKLxI1aIoUHUm
	5fizr824PuZ+wFyBAe67PWyDjTIAj9Ap36lZ8mkM6rEc9gflxF9bT74KvRRmc6oSN7pvclIv+UJ
	RynmBNZENM4iV6jcsRygcOWL70TBN8yncD2M=
X-Received: by 2002:a17:90b:3d90:b0:32e:9f1e:4ee4 with SMTP id 98e67ed59e1d1-3436cbf7dd3mr7770302a91.17.1762699145563;
        Sun, 09 Nov 2025 06:39:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+2hAPMgXntUQ8yQpAM9+0XRennk8O6s10oC9AfbkmsdbrsxlwJ+Ti99rsp24Oev9CA5kAPA==
X-Received: by 2002:a17:90b:3d90:b0:32e:9f1e:4ee4 with SMTP id 98e67ed59e1d1-3436cbf7dd3mr7770256a91.17.1762699144992;
        Sun, 09 Nov 2025 06:39:04 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68a68e6sm14845401a91.4.2025.11.09.06.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 06:39:04 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 20:07:20 +0530
Subject: [PATCH v17 07/12] firmware: psci: Implement vendor-specific resets
 as reboot-mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251109-arm-psci-system_reset2-vendor-reboots-v17-7-46e085bca4cc@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
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
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762699073; l=6623;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=gOqHkjWgXv2eEhKUz/L3I9ntPxQxM5L+0g6CBUJNCec=;
 b=gAySl5Mi53Gi7nfTHC/n9Cy9cFjThjpNi4Fl76P3IZkKi+5Z7ZEaKFx674fCUd4LmoI19chi8
 GMsh0cHnyyTDm+EsnJOkw8XO1J1k3Z06hT0DJbRueMK1Sw/ND3+PFyc
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=dMWrWeZb c=1 sm=1 tr=0 ts=6910a78a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1Y-8vuCXXADn_sFn8ogA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: g2szwGh5T73b6AquL5VP7CTljAGVg4iN
X-Proofpoint-ORIG-GUID: g2szwGh5T73b6AquL5VP7CTljAGVg4iN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyOSBTYWx0ZWRfXxAewu2W7rAmn
 +gjOfPtg+/4FsRRGaj5cXHkcfd1Y3H51H0EBL4WNL5mNph5pJ8X4FdfgASjzq7s5K8SG7dKOolD
 ToCqt6cqWh3rOhyqZ0MOaUqstKoxB55Y7CnJ+3BN6FX9j4FTlxbSj6uaDD+UMBfFx5CxueKn5dx
 MgDkvdX77FN+AZciYfeYptZp7cHaoQS6CnjCnubNndLAb8ijaFf9YK6BnP0ywSjK7QuXeCrNveo
 dXyyVs6XD9zfKGDBoVuY9TBx64tijDd5YSnOYw6Eu09RX1D/x03L0HqXBWnkn3i8M+yn6M5kB4p
 kxotjlWf6/tkePXvLqkN7EquUPUU37cIbrs8F6S7JI3bAmaRLRnGhs4BSUNYNJpd3fCK0vFdtrg
 KvMdajgynll52pa9fMPexeIeekB0gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_063909_445774_D84013B2 
X-CRM114-Status: GOOD (  28.19  )
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

Implement the PSCI vendor-specific resets by registering to the
reboot-mode framework. As psci init is done at early kernel init,
reboot-mode registration cannot be done at the time of psci init.
This is because reboot-mode creates a “reboot-mode” class for
exposing sysfs, which can fail at early kernel init. To overcome
this, introduce a late_initcall to register PSCI vendor-specific
resets as reboot modes. Implement a reboot-mode write function
that sets reset_type and cookie values during the reboot notifier
callback.  Introduce a firmware-based call for SYSTEM_RESET2
vendor-specific reset in the psci_sys_reset path, using
reset_type and cookie if supported by secure firmware. Register a
panic notifier and clear vendor_reset valid status during panic.
This is needed for any kernel panic that occurs post
reboot_notifiers.

By using the above implementation, userspace will be able to issue
such resets using the reboot() system call with the "*arg"
parameter as a string based command. The commands can be defined
in PSCI device tree node under “reboot-mode” and are based on the
reboot-mode based commands.

Reviewed-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
Reviewed-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Reviewed-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/psci/Kconfig |  2 +
 drivers/firmware/psci/psci.c  | 92 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kconfig
index 97944168b5e66aea1e38a7eb2d4ced8348fce64b..93ff7b071a0c364a376699733e6bc5654d56a17f 100644
--- a/drivers/firmware/psci/Kconfig
+++ b/drivers/firmware/psci/Kconfig
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config ARM_PSCI_FW
 	bool
+	select POWER_RESET
+	select REBOOT_MODE
 
 config ARM_PSCI_CHECKER
 	bool "ARM PSCI checker"
diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..ff82e7f4c27d1609a75cedc3a9790affaf839801 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -8,15 +8,18 @@
 
 #include <linux/acpi.h>
 #include <linux/arm-smccc.h>
+#include <linux/bitops.h>
 #include <linux/cpuidle.h>
 #include <linux/debugfs.h>
 #include <linux/errno.h>
 #include <linux/linkage.h>
 #include <linux/of.h>
+#include <linux/panic_notifier.h>
 #include <linux/pm.h>
 #include <linux/printk.h>
 #include <linux/psci.h>
 #include <linux/reboot.h>
+#include <linux/reboot-mode.h>
 #include <linux/slab.h>
 #include <linux/suspend.h>
 
@@ -51,6 +54,24 @@ static int resident_cpu = -1;
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
+static int psci_panic_event(struct notifier_block *nb, unsigned long v, void *p)
+{
+	vendor_reset.valid = false;
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block psci_panic_block = {
+	.notifier_call = psci_panic_event
+};
+
 bool psci_tos_resident_on(int cpu)
 {
 	return cpu == resident_cpu;
@@ -309,7 +330,10 @@ static int get_set_conduit_method(const struct device_node *np)
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
@@ -547,6 +571,72 @@ static const struct platform_suspend_ops psci_suspend_ops = {
 	.enter          = psci_system_suspend_enter,
 };
 
+static int psci_set_vendor_sys_reset2(struct reboot_mode_driver *reboot, u64 magic)
+{
+	u32 magic_32;
+
+	if (psci_system_reset2_supported) {
+		magic_32 = magic & GENMASK(31, 0);
+		vendor_reset.reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | magic_32;
+		vendor_reset.cookie = (magic >> 32) & GENMASK(31, 0);
+		vendor_reset.valid = true;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static int __init psci_init_vendor_reset(void)
+{
+	struct reboot_mode_driver *reboot;
+	struct device_node *psci_np;
+	struct device_node *np;
+	int ret;
+
+	if (!psci_system_reset2_supported)
+		return -EINVAL;
+
+	psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
+	if (!psci_np)
+		return -ENODEV;
+
+	np = of_find_node_by_name(psci_np, "reboot-mode");
+	if (!np) {
+		of_node_put(psci_np);
+		return -ENODEV;
+	}
+
+	ret = atomic_notifier_chain_register(&panic_notifier_list, &psci_panic_block);
+	if (ret)
+		goto err_notifier;
+
+	reboot = kzalloc(sizeof(*reboot), GFP_KERNEL);
+	if (!reboot) {
+		ret = -ENOMEM;
+		goto err_kzalloc;
+	}
+
+	reboot->write = psci_set_vendor_sys_reset2;
+	reboot->driver_name = "psci";
+
+	ret = reboot_mode_register(reboot, of_fwnode_handle(np));
+	if (ret)
+		goto err_register;
+
+	of_node_put(psci_np);
+	of_node_put(np);
+	return 0;
+
+err_register:
+	kfree(reboot);
+err_kzalloc:
+	atomic_notifier_chain_unregister(&panic_notifier_list, &psci_panic_block);
+err_notifier:
+	of_node_put(psci_np);
+	of_node_put(np);
+	return ret;
+}
+late_initcall(psci_init_vendor_reset)
+
 static void __init psci_init_system_reset2(void)
 {
 	int ret;

-- 
2.34.1


