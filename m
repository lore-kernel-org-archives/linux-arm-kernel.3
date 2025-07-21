Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D95C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 18:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yo29nftHFYZtObTkPZy6VDU45lEt8daBatpcCrb4rZc=; b=Rf2etHV5FtJbgl4PBBZtyXRCo3
	QD9tzzykOKHMqFH4OAj9tUSPTPC5qQXqEY64WziTGAHOnm7++FYaHvL3QJVRyKDG5jsODp3lOKgK6
	BxXUqenXGUS9xSjcRTK4ITs36qtzYmbT5P7C0qCQtQhSmrfcvj7wXRHZvOSP1gVCPE9EjrbTJ8M16
	qdAITpg5kkmcrmMxJN9Vv60uzD1UExghE4Jqe+NZjTmKMPdFoyMX0EPIcbszG2KO5TaUXsva+5d4Z
	xMP/KjgkkZvEIL3YiPbDHMQR/ffLOL/nnxXdrYScDtwyIFwIETfV9IfvKvjAg/9RTmzNTNmLzltFI
	ogbIBl2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udviB-00000000SHh-35b8;
	Mon, 21 Jul 2025 18:58:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvGe-00000000Pw4-15qu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 18:29:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LGTu7X029264
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 18:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yo29nftHFYZtObTkPZy6VDU45lEt8daBatpcCrb4rZc=; b=FKryXw8dHsDl15ze
	wx+X6SDNB8zT2RFjaAzNBF5YE4Jg/S7B8U6fGyliJ4Tpv5WbpizOn01d0fSEDCBx
	DHDTe8sSG7gmPSZZ+L3FxS0qb78t9vH5d4wpi59+Yydgiv5IY2OJJBaQ4PGS37lb
	vCwdLUEleI/ctq61GotOgBAdLwNrbvglRnz+wlXoQKb0k2xFq4iRDmSN76v15yE8
	zfOmjmD+ShX8grw6YuU2gqFRimpcVsqYisCYuaLgIeILZrK68BVt4tj1sTXDU2Rq
	WVzSiv3lgL8RMUDW/Vr+LMvuPBpz5gcjh8Pq+1yJEpFa2DF6RCCNe4S0HNuLW9X/
	ZmMbyw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048ter5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 18:29:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23824a9bc29so72434465ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 11:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753122578; x=1753727378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yo29nftHFYZtObTkPZy6VDU45lEt8daBatpcCrb4rZc=;
        b=uxWC4VVXHK2D1AxSgMDgJJgwomxE5fx8ECyzczS/0iU+C1oYwiuWHeWOz26USX6ijs
         sYjPocP7FLwAVPUNQbGyBiyQwDPbnoamiiC3G1IeD84hHVi4tOG5Sls1nZpBGutUQZqa
         W+hwtDA1Ij5Mxt7O1NxR3FnpIBB+takyaJr/KVUjixZnaQzPq7sIdSTEDptwwkioQ5GU
         PKHY9kKK4zRDJMIUGoI7Y6It1XCNGjfXMcWTFm0qDkNivvn3YxKJz03XxTJpntHR2CO0
         PemjKSMfzGbk+N4sj6LCKtp7IunNECOywwQQXCeDB1TPyrDurjZsUlAcHOr55egrZxQL
         +Kug==
X-Forwarded-Encrypted: i=1; AJvYcCVS9jywPHvgRY5JmillHOKjdx++18delDw/ERPH1YQ1jj9e3DEudGNrH2lXRWU+O2hQOIxTidXALH22Kd0MpDZH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1PxIJvPibaCglCOkmdNhx0UEFC8mC2z5rMVqbWwygxIPtgJzx
	iX5d1JDjTRtYBti2yzTN7EG7cwUMQ/Y5liFo2x4BuMKcgn33FWcJCyOGKXs47I4v+tVFt2GRc0a
	3kItifJV2SKYwWQxrbGhKRSkVtqIbOVC1TLS6pq2XgA9gQgefLzjDBHo1J5hisajPgbBdn+jRPz
	R2Pg==
X-Gm-Gg: ASbGncsZrAnv2+ZKRANXxV/mT/YB2rAFEEFG6IsdX2AbFhbIB34ThSC8C/zFCuQxZeB
	+CjaUQcWYNFf7iZUKo4yGN7msBQF/gfgrlofLVHMhbEgFO2q4h+cxwFAS+D++B3NPrasGi8GUbf
	UpAMQ19X61Jf91+HhH0Il21tVQ12e0fm0kuiuhx7WKRZn2z1MnSkI85QBfEoEbPI5EHqpDzb3hu
	631LAHNZIXuVnM+biLkRZQksLtqsGauF9pGwN8/i7zzhCCbszEZsAW4jXjkxE4OuhKw8kDK5zc1
	x2QWwjZmGR6UsHAb97+qXpmjki6IsFT978GAWbJntGfxJnjAcT3kiSdvwyVaW6+44H386DcwNSC
	0
X-Received: by 2002:a17:902:db10:b0:235:c781:c305 with SMTP id d9443c01a7336-23e25736446mr391994685ad.24.1753122578026;
        Mon, 21 Jul 2025 11:29:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVFiP0ZX25Wepgp00xsVzQMu1ttAcrm238d8ApOC/0i6QmxfogZvMit+aR3PD49+4LfMgmeg==
X-Received: by 2002:a17:902:db10:b0:235:c781:c305 with SMTP id d9443c01a7336-23e25736446mr391994015ad.24.1753122577582;
        Mon, 21 Jul 2025 11:29:37 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6ef4b8sm61414545ad.194.2025.07.21.11.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:29:37 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 23:58:51 +0530
Subject: [PATCH v12 4/8] firmware: psci: Implement vendor-specific resets
 as reboot-mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250721-arm-psci-system_reset2-vendor-reboots-v12-4-87bac3ec422e@oss.qualcomm.com>
References: <20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com>
In-Reply-To: <20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753122539; l=4746;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Y0M2kz4HUE94r4RXMotv0mkp+GddzwJz75VbdAmmA+I=;
 b=1zZTSkjZE49wnh2ayD0kNDf089z+CGlweQ3Ax9ee6BChYKeop9Wpk7WDnIs1YYeHNn4XHGcIz
 SabAsKzD/FQC0owBzriskkYT144jfdAlHzU7O87sNm14fMkH6dnqI6/
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE2NCBTYWx0ZWRfXz2AUOGqtSAs3
 BwHzIhYeTQOngKt/fLWveg4aQSHy0ZxV7XSGNhqxvho4rPc8UgY6fVZMfs0k++2EA9m0m8AaPdy
 ajlWx8N3SIriWc2Rz3t9UnXytK6vOIJi+5j0D30dyXmzGajcqlnoPLcR7/5E0irLfQSGoZJIwZE
 /cRibvBm/crrjHHrRlgWAGAlExwJHr6cR19+ImIQWsbDKvF1QzwqVoU8EGa78OpUcZk2iukdzLa
 Yvovh1DFB4ShoemMfGrw9iF8aNrj3karmiJaJHPtRwWKBsea4EXbe/pjI47Zn/NwKcufPYE5rSk
 SjJNzkdGwNTeadV03tB6WCwiTlYrD8TLxfv24ePcXjSA3eQ3OdS1ROvmRC+XyjWsTeQuL1gykeS
 69LGVLZenRvJZOMi5E6V/W22+vM3i5Ymx3/VzVFYebXaynUNOlVMk8Odr+/MCbWJC+fl2tOM
X-Authority-Analysis: v=2.4 cv=Jb68rVKV c=1 sm=1 tr=0 ts=687e8713 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=EdS2NIbk_1D2FrBATFAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: YnKv5IDg3x9nar74QryftkFd-WJ0vpGt
X-Proofpoint-ORIG-GUID: YnKv5IDg3x9nar74QryftkFd-WJ0vpGt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_112940_425859_FEC8BF23 
X-CRM114-Status: GOOD (  27.23  )
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
 drivers/firmware/psci/psci.c  | 57 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 1 deletion(-)

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
index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..8ce23fb931c71357899a942796d85ab8e37c2f62 100644
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
@@ -547,6 +559,49 @@ static const struct platform_suspend_ops psci_suspend_ops = {
 	.enter          = psci_system_suspend_enter,
 };
 
+static int psci_set_vendor_sys_reset2(struct reboot_mode_driver *reboot, u64 magic)
+{
+	u32 magic_32;
+
+	if (psci_system_reset2_supported) {
+		magic_32 = magic & 0xFFFFFFFF;
+		vendor_reset.reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | magic_32;
+		vendor_reset.cookie = (magic >> 32) & 0xFFFFFFFF;
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
+		kfree(reboot);
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


