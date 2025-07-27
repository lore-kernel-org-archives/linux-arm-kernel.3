Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB7BC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 16:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gc7Yk0tdJEh2i043+CGDqIsAu2bVqNeh81O1rVbonp4=; b=OK612s3rCvzim/dvitNgNjIHWm
	+iu9dVEA6RerGgJge5rg3cq766/gNaL1SRoT7epJ24NfDEoWwB8A6U9k19/eZUVe/uZLO2+FlWhYz
	Yp1a1SJs8NhF9CscrC1Y1uytrLsDqEgwNwf1ylEXczwd70suqlTUDVQbQjzzB4T2aorYjdohMlBdL
	EMOcdDmn46/xwKN6ANEaAcCVsTD1b8V1mB1H//b8gxuEZ+4PTRCxDdBqP12IxEJz/WcweRtTD2dM6
	WZxBKCa1sDa2vqsifVOYNfUhhmO+g6uj/3atY2C+5TtW6O0zuy5U8CNPEHtpsr4HcM3/0ShQ2FRZI
	jOjMUU7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4VS-0000000CxEL-2IkP;
	Sun, 27 Jul 2025 16:45:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4CE-0000000CvJC-0hKD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 16:25:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56RFSCvF000481
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 16:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gc7Yk0tdJEh2i043+CGDqIsAu2bVqNeh81O1rVbonp4=; b=RpdS1mlymp2idYha
	E4d1zbOJta6tFlbE8A8sQAawxgBHCK+MwVNgjnmz8MTi3R64v3Z8Eohnd5L89uzB
	lw5oHluHZNb+MhkKzhr9rCu/qtt0hPnnwaBXL27nPN/BFSvk3TXEEV2A3+/PI/zo
	pdPgTSYhVqMCsd804qXnWEtp740OjV++9ThLfjzESs8M9DY+eyZ71TYDo7g5Y126
	46qpSum4HdetuQJzKcj1gCU40rPyqIwXqQMP3FHTa0PmcamafDdtthfXnIMxDpvp
	1e2iyHU4ql8emTyU6y0yMORGJv3WH9prDkIoCP49DBBjRTRJb1DyULRv8Leu2/9w
	miSV6w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qsk298t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 16:25:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23fe26e5a33so11481435ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 09:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753633557; x=1754238357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gc7Yk0tdJEh2i043+CGDqIsAu2bVqNeh81O1rVbonp4=;
        b=e5uqxYlV6iyf7tfQ1NJOyUl+GfCq7abfpJ4bKbT4YaG5i/A2pA+VqN+I8e/SDD5Mdw
         GIZ5QMVEW8NGccixBYCXBw/FfgfuOnJwIBIPieRJpwm8nx1l95UXX2qjBhoCo3BFSTAW
         4A6mT6+8xrNoz/QaMWbAR3XtkQfqO/At6uTtO7+tYGf9R42rTIAxzLBLxjUkmM/g/bXo
         Z4nF7CV5amusMmL9yNZW2rLQBNiq44kowCQ/QO0ZfFPtdJZin6m5QF2vFv1kf35Dfx7D
         2WBCqv9u+4M6v6Xpg51w9Lopsuhf/crxcCSZMQRK5H4R4cEdXIESJTVoULn2z6loMf6C
         ME1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWns3ao2IAtOlun+aXP2ZIFrAtsxJxdsRtGIp2vgx3AHK6kGtaSSkVenStPamSACWJV49Nrtk7QYRWdkbiI2GIQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7ra7n9D1/uIdqnbDUXsuq3hjJ5PafvpoECBdZtKabOJnQU16P
	86MUaB1VYR+9PcOIWBhVkM0hSpq6P2VFAmlt+ilTWbW/9SuDfy1NbS1pMz8Z50jnd5RG0ERzbXO
	J+sznvAnIJCmAxQ3JtkirTSQXk5FCGs777ZeBMWJsEDqmy9qJ+tM6ZVAy+6RXt0USzq1Nn9/xRB
	5YPA==
X-Gm-Gg: ASbGncsrcx9CrqMGucIIfP5UeelwSH73SSDBtGAeb1jNDtjlZq6+jzP9g6o1vgYat5g
	MLjbFsZcjNus7iuTjvVU905SAr2FIhw06Se1KbHMBdJ7qQUPUTZHlf3LX1wFxszDkHWnE6kqbkp
	diItFtvCVSfXjBOxyGv2zN3S+iM9SxX7D5ggfePYeWI/twUVZy17xmArK4+Wy3oxEcX93Wr6Kme
	G3nopoX6/fIfPsJk5n1uVAy6yGtiznupoV13oAXQLfY/CRwvjgC1QHGsyn0ZlG5IpdYTE36yJbQ
	I587GOePaLYZz3L+8SJyvJH300foLvrSD8f8DP93TsZWiv59LG6saT2KZJrL+RBBh/veudcbwK8
	y
X-Received: by 2002:a17:902:db12:b0:240:1441:1263 with SMTP id d9443c01a7336-240144115f8mr27743775ad.50.1753633556669;
        Sun, 27 Jul 2025 09:25:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn1iTzmUSFNFbd3ipwa4rZSJcimOt/VUock6+Z1tVlZwgy+X3u+ZNaz/MM8wr2kq1viBngjg==
X-Received: by 2002:a17:902:db12:b0:240:1441:1263 with SMTP id d9443c01a7336-240144115f8mr27743135ad.50.1753633556115;
        Sun, 27 Jul 2025 09:25:56 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fd9397ebbsm29110325ad.210.2025.07.27.09.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:25:55 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 27 Jul 2025 21:54:50 +0530
Subject: [PATCH v13 07/10] firmware: psci: Implement vendor-specific resets
 as reboot-mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250727-arm-psci-system_reset2-vendor-reboots-v13-7-6b8d23315898@oss.qualcomm.com>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
In-Reply-To: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753633495; l=4777;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=+KHfR7YYD+HrcoWjVGljO4mWJmBVgezl4q//08Hz/cA=;
 b=dlmeEc85Tf8+gvzUvKK1aMpV+xuClWa/Th4ihsRT8Ezne4CvP1qA7JZdX5O1gHgnHKHU7hkOo
 zgSfl1Qjv44C6njn1gnhNTZqnu2HRx/cdPpRXp3S6baG3nW52Dqo4nU
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=KdDSsRYD c=1 sm=1 tr=0 ts=68865315 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=EdS2NIbk_1D2FrBATFAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: AtRRC0DDWZbNxjFNSN9UU54srgNxKef_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0NCBTYWx0ZWRfXzPNcDDczhFeh
 7tigz5sTMqqCbYKgd4iisSQxoHxl4mLhB4Ars9wPoQ1Er6bhOP0CxZzfpxOzVNLhBoIgkV1/cCR
 c3yq/L++Q89Zd/pdGHcde6cCt/fbH7nqSs21iUO2WLn0uhRiKlZBPY7DI6tgr212Khu3sVAgoSk
 W5XwxdEw/L4w7VXeR/zyXGe/znanA1Rxj1Wg5+VAQb1Kl5bEwM7B6DChleekDduT0VgLGF36clS
 pCcOi4TUXLUTTKZeME12CYQTODmjzOxfa9gxJqh1UG53TpCyfYD0rDW5SbZ1FwrbOdBKMgazvoo
 D+C/Um7w1482t5OTgry/QMyz36V44e6pqlJkIWkyMGlDqLtrAFLmxtzur9pym3wsFQZU8Mb9+Rl
 lS03NNFsnPaBTKKjwddoryswDDbD0VrftLOSRiltyZnRPcoMNQoG3uskwp2rkHzsq5k7BQ1G
X-Proofpoint-ORIG-GUID: AtRRC0DDWZbNxjFNSN9UU54srgNxKef_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_092558_213734_B3A3EA9A 
X-CRM114-Status: GOOD (  26.40  )
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
 drivers/firmware/psci/Kconfig |  2 ++
 drivers/firmware/psci/psci.c  | 57 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 58 insertions(+), 1 deletion(-)

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
index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..e14bcdbec1750db8aa9297c8bcdb242f58cc420e 100644
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
+	ret = reboot_mode_register(reboot, np, "psci");
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


