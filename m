Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928F0CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 16:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eryQnSzToMXu2NfIgCMW4EZtH1S08RlhZnH4d4Tc+IE=; b=G3k8RzVxjsXEkkHZFLmRJRpyAd
	afN+rbaHa7b25jzYbejPjngjxlOv1InNBfeHgRbtvrRq0Z6Ec5s4C/nxvlZFm/Q+qxgHtseY+nV+D
	v/FiUfTCyuVw0yoF69TxUSTv4ykEXdeg1Zfg8YWpemi8bEms6XE4ogPNOLX/vW2xr72HRk9nN0SdG
	OyP5/jbzYGfXSXkLui0rZkNARlYotN//s3ejQ7cNkgf5lrWs78PO1YlBW2H67VcdGQu19jlicABZ0
	REGI0AbJNwfai/c2QPcN4/D7whnXsPT0jUK0ddQCqLIzRM/8kGjCIsdfaXx8Tv38fHbzOEX+tsLt6
	uV0ubVew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxJj-00000002yUm-3aTo;
	Fri, 15 Aug 2025 16:30:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvYc-00000002jnt-30m2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 14:37:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEIj07019971
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 14:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eryQnSzToMXu2NfIgCMW4EZtH1S08RlhZnH4d4Tc+IE=; b=prI6JzXPMsCUeTaY
	Am3qa3JVxjxoIWp1Tsaum36GyqO8Dmp/fAQ2DQENE59Qgj8XHs9zGFjN6f+pkO0F
	hImIKiwsvor2Fgj3cV8Go83bVJPBNXfn6ITeIbJvQICAaQPaV98lR3lEv1qrfTfB
	iMl0JJCaTGGNkTfUMAuRbeyCRhqM1PrfgnyAoK/vHe7Rzyl6gGEKancFXprsck7G
	3CdOQD28CGAct4bqVAqCcjLeq0+1gipQecH+SQPf46xz/TTNAZDrmKHWXdwRhz2I
	fju032U2g6IltkHwhlsE0fA2dNULxGmPO0eMj5UCdWkJulqZ23ri7AH2TnkXqYWS
	aQJYXQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gk6q0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 14:37:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e2e8e74cdso1589051b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 07:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755268645; x=1755873445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eryQnSzToMXu2NfIgCMW4EZtH1S08RlhZnH4d4Tc+IE=;
        b=kPRkUnoum7Vz8sWbvcWff49DhW0X7z0eFp94N5HMGx6lGGfzmyHDOeZ0lSFCIvwJDb
         C1zEanEr15ycBIvFXG0fDpQ4wepJ0HgnI3ETktjw7B+c7FFq9ECXo4eYqJEGZyxsxwB2
         782kJjn/4a2QE8Y4AyzRrEOQdX10OjchbeWOS8goCDbJMdHWvTqKBJtXWgu04zFognzX
         BNTxPhQv8ajxRhPf88AFsHfPQpVpXjjz14l7ebRZpWy4O7x7c38mM+0oFGD02wES/9js
         Njygfig0HRH9dmRrL7QB+Bu/+vcLlWp8KsstU4+hmLFZ+0VO4Gw9aSK2VBjkUDqZ+rYJ
         v4tA==
X-Forwarded-Encrypted: i=1; AJvYcCUe9D7FIAuRe6tdqEVucgfyDc8K/toopZQ9T4/2zTwwx/O5YsFtYKKFM/LKdCAntjZ581jVpQUS3MQ5QwCPlqES@lists.infradead.org
X-Gm-Message-State: AOJu0Yznf+qdXQ5v5GO5WCv8gdxq6eTkrD5uzh/GWd/C7aTMAE4KdL3E
	iWKq9qaZwCz/tJh6n3UVICULDnmKBt0mLIvP5KUw4EX6AVceJ9yzMws8VqfILICFfqfwAPjRqv5
	5iWDAuLVX034FJ73lBs5G/vzGIDnG9zyf91ajkJyzWrAxkeBbEnmYBRW52EOP8jqP4DxpnMyJes
	urmg==
X-Gm-Gg: ASbGnctoCZy0VjSO503tVDVxPYVfz27ol1K0VmRJbX5exBY7ZU+sMvT5qqcwilqpXXN
	zXP8I5SONEDDhzFgKO47VRbYw6GKkFpLxOqaZfbKJPxk3BGNam7YRIWAC+UrUb1EdrboJ9eFrvK
	LnzVn65b4MCCYbk+Ugzt1rDQIOjtRNQhJLoQWNT+bNcfY7dPT/POhPyCJE1QLOwINpbkDRYsPQa
	KTo/LEUbq5S0M8BZhqLVvLL914WMwNKR/b+IyXk19ukN3CY2NoTzHUuYKC29Gaio6++FznnLMGY
	INRRp99McR/XP8iuUVLeGScVfp3fthXRFEQ9skf60qtmIHlbyd3sYy1V+B53jbNn+HbhpLVi+jn
	I
X-Received: by 2002:aa7:8881:0:b0:76b:ed13:40c4 with SMTP id d2e1a72fcca58-76e447b9b8bmr3092661b3a.13.1755268645314;
        Fri, 15 Aug 2025 07:37:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjwXYQ6zanSH7puhitmJD8oHNe5fi85xTYBsR8TwQxzGrZOZWUsgrQ8UEiFxyMbRHqeD2fJA==
X-Received: by 2002:aa7:8881:0:b0:76b:ed13:40c4 with SMTP id d2e1a72fcca58-76e447b9b8bmr3092594b3a.13.1755268644768;
        Fri, 15 Aug 2025 07:37:24 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d73619fsm1437576a12.39.2025.08.15.07.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 07:37:24 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 20:05:12 +0530
Subject: [PATCH v14 07/10] firmware: psci: Implement vendor-specific resets
 as reboot-mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250815-arm-psci-system_reset2-vendor-reboots-v14-7-37d29f59ac9a@oss.qualcomm.com>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
In-Reply-To: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755268580; l=6176;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=og8XnRqKfVb51an5IrfBWkxse/KEsB2Ct6wg9UArW14=;
 b=4WNyXqesgIx7FKl6l+NReXTBEJXlBlrW/RTfkV6O6RK2/9teXBUqOPbrPjX+x98uakLoBhySi
 NwpNFUPgl2WBZdfE2T4tTXdOXj8gER+5RztwJZzPJjfIVSkGXDt2drO
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689f4626 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=TMn5MJ8t-PDmeowdJScA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX19r9UFlSfL/p
 hUuc47NhgS9qcwlXLfvOEKQYe3RQ41mmer8BglI5Oh1TvFkH/AeLUS1H5TOnmiHV7w/d1G9Eq0v
 lezLpnAxtpMfAS7b+rm7NABk718mgq8VMaLE4CT7VuUn+Yzbqg0/j8W60UJ/HSbyFUiNzQX9J3g
 n3pRewD4dw2g9NEXU8gri6HggrwA/JkGNmD2plS1ENjgfCZ+kN0/liYWk8vvi9QK9ZGTwBVZPGh
 k4K+zgu5FtQ7lZVdM++Lj/2V/4u9ndeiEXT0UDHfg0ojqlOk8xaNoNNDXlvLIGL0qPwpTiFlVOh
 UprR+mN138Sx485wpdGpxGFYhS+7KFdp7J26MM960sExuakSrsP7Lg4dGOlx7AKAoSMeM0Aggv/
 ZkLUoT9P
X-Proofpoint-GUID: tFs6_LsBfR5GQd04tkT7HYKuEVsSuy-J
X-Proofpoint-ORIG-GUID: tFs6_LsBfR5GQd04tkT7HYKuEVsSuy-J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_073726_761859_CE9CE11B 
X-CRM114-Status: GOOD (  28.11  )
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

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/psci/Kconfig |  2 +
 drivers/firmware/psci/psci.c  | 88 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 89 insertions(+), 1 deletion(-)

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
index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..58fa5fae40f6643e46a1efa5f3b2f5d1d101a1b9 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -13,10 +13,12 @@
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
 
@@ -51,6 +53,24 @@ static int resident_cpu = -1;
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
@@ -309,7 +329,10 @@ static int get_set_conduit_method(const struct device_node *np)
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
@@ -547,6 +570,69 @@ static const struct platform_suspend_ops psci_suspend_ops = {
 	.enter          = psci_system_suspend_enter,
 };
 
+static int psci_set_vendor_sys_reset2(struct reboot_mode_driver *reboot, u64 magic)
+{
+	u32 magic_32;
+
+	if (psci_system_reset2_supported) {
+		magic_32 = magic & 0xffffffff;
+		vendor_reset.reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | magic_32;
+		vendor_reset.cookie = (magic >> 32) & 0xffffffff;
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
+
+	ret = reboot_mode_register(reboot, np, "psci");
+	if (ret)
+		goto err_register;
+
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


