Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608C9C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 10:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1S0YgYBWkNzPgMtsFsB7pmoBXpykrq3h9FvayJsue4=; b=zrzl8GYDSRkWcld374bJWwbDGV
	8mhfzVU5dcqG0HbA2YCji6jfb/CDRZh4ZMOO/B1f8kkJYRnNtnhnswKMgRBEG5CJt6GY0rCF2DqlW
	IBzdXEhBxC4lnMpVF9uHLp0m+Gszj3fVsbJ8WMxFE9KAFeNAoFu/zZF1jxXc07sNteUp4nMxmmUTH
	RbR+mp0u+WqtAra0H3LcKRKc3cQopgR8/nDQG7r9hoIDCP4LlcRtX6ewbA1VQ4X7PIomMVFmqPHqz
	rYbPxkfnlFCEWiA0MiSNxe8iB3F+jIZ+kRL+Z2OAAQuNQqBRMquUxNA/WzCm9oUf20zC83BA/gjg/
	ZQHrozyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoXq-0000000BUbO-1NDn;
	Thu, 10 Jul 2025 10:30:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnPD-0000000BJfr-2NOy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 09:17:29 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A8w8pf012568
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i1S0YgYBWkNzPgMtsFsB7pmoBXpykrq3h9FvayJsue4=; b=KoMnbHJwHusbb1Qt
	y2PFwsxuIQm6zGmnPcpqg+sVft6aVH0zNR7Yy9ShnB3fA+GXaB0BHbyRG7zNPdgg
	nuhvYKJK01osK5kPqkawUTY6mADECTNdPwcsys2xUYV1Wunoo7ZVGAIT5xyx8Yo0
	vNFjzoAcU0U4L8RWM//QM1jVVyl+ryExg3Rom5uSHPZ4oqiCZBPKauSZUmaejCAE
	MTVA7+SGRVuBGcU7HBnoU/fOVwaEVQQSDo7oAQL31zditLY+7kLpZF4Motuj39Tp
	U7m/fVN3hkmhaDq6gUnvwABeYLVLYOyyTXbt84iDbECpQHUQSoU3eHoSM71hWA9z
	QS3T9w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucn7vnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:17:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23638e1605dso7097705ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 02:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139045; x=1752743845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1S0YgYBWkNzPgMtsFsB7pmoBXpykrq3h9FvayJsue4=;
        b=IYL23MiksFtk/cyPA/KucsnE9f5HAgZiACH8OEXkmijXXRGozvhpr/UGbO3+l+WvsW
         KTMuichkc3JEL0EciJrVxmf9YiU18Py1Igf64VeCKIBJtl4uukXfOcUdbSooZ2FC0kLg
         1pm+49EPCpAt6NF9vaZW2CnQESgmq2ctrmqhb/a/el1uZ/HkNEvPrANg2HvZiHh6VHIJ
         /GjhskuwqJPA5JPvj9uIVX59CYuZXP6QeHdyczadxZRhhZiP2WqBMtXJSPD67IhlM/KJ
         HBLtuOBLLiI5mqRUXCtFFGD9wLGMJatsMglc+ghBbKGGLjIqcB2tamkJetJ1jRG8pM01
         sbDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn+GJaKzZxOLAqtx4lVkIrVjk1aq5i42+ZZwRcht8iA6sO2wxATw6QqXZzlf800cer9Bw4HOoTVNZwvBIa9q4F@lists.infradead.org
X-Gm-Message-State: AOJu0YymM0L81qee3G2BF6aEahidkWIAoCzoWG8+GDBSnVbdwMsaT0os
	qawmLQXVPsTISjpYIXqyPgHAUILiEYFugbvx6jVeSmmyw3aOItAZV/JVqC956+2jf7khob4gSTK
	YV9iV3UIhdpzSM0LyMrn3IkWmcNuz7x1Na7z7s3No0djPSpg3DQXjNXhnjbVD3GlV/SemsS2d0F
	d1/Q==
X-Gm-Gg: ASbGncsbewbU6DlKNZ1y3Mo1XCUUolGX5SYHcDSZhQSYxDmMjDnySt2+lR4UO6ZRxh3
	ob+WzIz9gx+691ywlAjs7DR+QE7+4EOfkQ44rkGCGfU9/8fxgESX4dwlWlCaKpKS0LjUKI4cNNN
	xFq41e09F8iuyoHy/uWk9ghaJNmuyp6th2xxOh6CSZ3SymcorVu0xgsiLuOvRip0FMW6CZfCb/V
	Hp7UTR4xtW9emNHzfDUbl7fgMjBs9uxnlUmCwnEECo4eRO1x+oY+8jF7aizoWDP4g3IkZ8lR3pW
	nYfWxtuGBlAbBSVcs54IMaUJ1+QNwt8ZG4H+9lf+mmXAzvoSVar4lSa+8yQ=
X-Received: by 2002:a17:902:ce91:b0:236:6f5f:cab4 with SMTP id d9443c01a7336-23de47cd652mr30055585ad.5.1752139044897;
        Thu, 10 Jul 2025 02:17:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg4RsjrMw/RBbJfUGCCXCUR+6pZ/OBaJOmKg8tfZNS55C/Jm0lOpHvhHWh1xVUlIOgo8dYHw==
X-Received: by 2002:a17:902:ce91:b0:236:6f5f:cab4 with SMTP id d9443c01a7336-23de47cd652mr30054705ad.5.1752139044303;
        Thu, 10 Jul 2025 02:17:24 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm14837765ad.189.2025.07.10.02.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:17:23 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:45:47 +0530
Subject: [PATCH v10 05/10] firmware: psci: Implement vendor-specific
 reset-types as reboot-mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250710-arm-psci-system_reset2-vendor-reboots-v10-5-b2d3b882be85@oss.qualcomm.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
In-Reply-To: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Andre Draszik <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752138982; l=4973;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=uCGaHKxMyCT6Fr1GicW0dawysRNXieqTwFGMzz+YiHM=;
 b=L6QqHX1809AdVxBa+yUIqV+KzAjQCF49Na14f6bM9oifTFAaCspHqvngk9jAg+lDYE0q+ZxwI
 FcFtJ72BHDNAXJDB5RiTwPW/EJPMBTS9YMfKspKEOgWPjTlQJLQUjhd
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686f8526 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=eXBxmsxbH67dAx2arOIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: y3VmKjbcy7dt0bULaDduSKBQS7w8R7F1
X-Proofpoint-ORIG-GUID: y3VmKjbcy7dt0bULaDduSKBQS7w8R7F1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfX4vjwZoKH5tkf
 GjCL6Jfj9BrTsw2uMNnfJ4We19rToH5hZYlnGOY88dvtYfSiNCGH48gBsS7QHnCsZ9No/IicAHi
 Gt8DDNb6JQ8RP5/bpkdcjncd5+1BHbvoc6WFwRHD0od6OJUJ3mLgZSqkGvXc/VO8hQERD7iTRnx
 W94a65aiI/+hN8OSWrI6Jyy34HSccSGcx1/gEDDgW/3SuBoZjQEYRWbv+tJXhbC/b9W/ugc+PHX
 etZglm3O80SYGSXrlanwCe9/DdR09qnE/5mULqMNU7fQP99BPtwol0mPzgVaIK54U40wd90nUXS
 ceyxtPLQr0N0eT2shBQvgELQVoG/X7iejOXTCxaDjhtCSTEQF/1Jlhk4aJJ1bZsewGd5qk9Fbfn
 cnrdLizrf8ZLJfMBTjNsyfl/zdRcc9Pk63fav7QjqBWgDFGEmsX/rIRGnSOf7Ws/+Bt4pWJC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_021727_721734_B0B8D25D 
X-CRM114-Status: GOOD (  27.47  )
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
as reboot-mode arguments like reset_type and cookie. For a SoC
where, PSCI vendor-specific system_reset2 is supported, the
appropriate value gets filled to reset_type and cookie during
this reboot-mode hook registration. If the secure firmware
supports PSCI system_reset2, restart notifier will make secure
call to trigger appropriate requested reset type.

By using the above implementation, usespace will be able to issue
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
index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..87293f78ed83eb33ba67ded73728729811693ea3 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -13,10 +13,13 @@
 #include <linux/errno.h>
 #include <linux/linkage.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/printk.h>
 #include <linux/psci.h>
 #include <linux/reboot.h>
+#include <linux/reboot-mode.h>
 #include <linux/slab.h>
 #include <linux/suspend.h>
 
@@ -51,6 +54,14 @@ static int resident_cpu = -1;
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
@@ -309,7 +320,14 @@ static int get_set_conduit_method(const struct device_node *np)
 static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
 			  void *data)
 {
-	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
+	if (vendor_reset.valid && psci_system_reset2_supported) {
+		/*
+		 * if vendor_reset.valid is true call sys reset2 with
+		 * the vendor_reset(reset_type and cookie).
+		 */
+		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), vendor_reset.reset_type,
+			       vendor_reset.cookie, 0);
+	} else if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
 	    psci_system_reset2_supported) {
 		/*
 		 * reset_type[31] = 0 (architectural)
@@ -547,6 +565,39 @@ static const struct platform_suspend_ops psci_suspend_ops = {
 	.enter          = psci_system_suspend_enter,
 };
 
+static int psci_set_vendor_sys_reset2(struct reboot_mode_driver *reboot,
+				      u32 reset_type, u32 cookie)
+{
+	if (psci_system_reset2_supported) {
+		vendor_reset.reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | reset_type;
+		vendor_reset.cookie = cookie;
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
+
+	np = of_find_node_by_name(NULL, "reset-types");
+	if (!np)
+		return -ENODEV;
+
+	reboot = kzalloc(sizeof(*reboot), GFP_KERNEL);
+	if (!reboot) {
+		of_node_put(np);
+		return -ENOMEM;
+	}
+
+	reboot->write_with_cookie = psci_set_vendor_sys_reset2;
+
+	return reboot_mode_register(reboot, np);
+}
+late_initcall(psci_init_vendor_reset)
+
 static void __init psci_init_system_reset2(void)
 {
 	int ret;

-- 
2.34.1


