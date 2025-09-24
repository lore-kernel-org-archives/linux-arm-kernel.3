Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F4DCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 12:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkrKvcmnyanpNmN2TMX13kQTg2IchP43w1mYiFQjFuQ=; b=PIWmXH2EKS0O4s4tg4HuF9B72H
	6nqAxqrgt3/K7t56lrsr/IKSixyev5S6QUkLS3JDvZzy0uHBt0cl8A+dQ52z5oYsxELwOBm4MQuv/
	0xnDHJyc89JT/XK7r8JiG1i458bH3fVe9AhxONLG8fGFrpNE0rouoPLZJIVI9aBlEQM0LqNpQEo76
	A1R1wb1JHnTCj3pzdFImzkQ0jOFCiT11suP+wfe9Eagi4op5GW+rNFS9GnYr/dfukZAIs5yMtOCDT
	9KW5sr8+pWxh/oAhhsr1FvUjX50gOSZtDE3WfViPWqhv1lJCFhzud1HieQMu3zumTud/YjT4QZCrc
	5lCezWug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OgX-0000000HQLQ-2CbV;
	Wed, 24 Sep 2025 12:33:25 +0000
Received: from wxsgout03.xfusion.com ([36.139.52.80] helo=wxsgout04.xfusion.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OgT-0000000HQBf-3YAJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 12:33:24 +0000
Received: from wuxpheds03048.xfusion.com (unknown [10.32.143.30])
	by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4cWx6f24MLzB6mdQ;
	Wed, 24 Sep 2025 20:31:38 +0800 (CST)
Received: from DESKTOP-Q8I2N5U.xfusion.com (10.82.130.100) by
 wuxpheds03048.xfusion.com (10.32.143.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20;
 Wed, 24 Sep 2025 20:33:04 +0800
From: shechenglong <shechenglong@xfusion.com>
To: <catalin.marinas@arm.com>
CC: <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <stone.xulei@xfusion.com>,
	<chenjialong@xfusion.com>, <yuxiating@xfusion.com>, shechenglong
	<shechenglong@xfusion.com>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH] cpu: fix hard lockup triggered by printk calls within scheduling context
Date: Wed, 24 Sep 2025 20:32:47 +0800
Message-ID: <20250924123247.807-1-shechenglong@xfusion.com>
X-Mailer: git-send-email 2.38.0.windows.1
In-Reply-To: <20250918064907.1832-1-shechenglong@xfusion.com>
References: <20250918064907.1832-1-shechenglong@xfusion.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.82.130.100]
X-ClientProxiedBy: wuxpheds03046.xfusion.com (10.32.128.186) To
 wuxpheds03048.xfusion.com (10.32.143.30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_053322_451171_ABFCB10E 
X-CRM114-Status: GOOD (  13.37  )
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

relocate the printk() calls from spectre_v4_mitigations_off() and
spectre_v2_mitigations_off() into setup_system_capabilities() function,
preventing hard lockups that occur when printk() is invoked from scheduler context.

Link: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250918064907.1832-1-shechenglong@xfusion.com/
Suggested-by: Mark Rutland <mark.rutland@arm.com>
Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: shechenglong <shechenglong@xfusion.com>
---
 arch/arm64/include/asm/spectre.h |  3 +++
 arch/arm64/kernel/cpufeature.c   |  9 +++++++++
 arch/arm64/kernel/proton-pack.c  | 18 ++++--------------
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/spectre.h b/arch/arm64/include/asm/spectre.h
index 8fef12626090..6fe29df41788 100644
--- a/arch/arm64/include/asm/spectre.h
+++ b/arch/arm64/include/asm/spectre.h
@@ -118,5 +118,8 @@ void spectre_bhb_patch_wa3(struct alt_instr *alt,
 void spectre_bhb_patch_clearbhb(struct alt_instr *alt,
 				__le32 *origptr, __le32 *updptr, int nr_inst);
 
+bool spectre_v2_mitigations_off(void);
+bool spectre_v4_mitigations_off(void);
+
 #endif	/* __ASSEMBLY__ */
 #endif	/* __ASM_SPECTRE_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index ef269a5a37e1..7d1f541e66a0 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -94,6 +94,7 @@
 #include <asm/traps.h>
 #include <asm/vectors.h>
 #include <asm/virt.h>
+#include <asm/spectre.h>
 
 /* Kernel representation of AT_HWCAP and AT_HWCAP2 */
 static DECLARE_BITMAP(elf_hwcap, MAX_CPU_FEATURES) __read_mostly;
@@ -3942,6 +3943,14 @@ static void __init setup_system_capabilities(void)
 	 */
 	if (system_uses_ttbr0_pan())
 		pr_info("emulated: Privileged Access Never (PAN) using TTBR0_EL1 switching\n");
+
+	/*
+	 * Report Spectre mitigations status.
+	 */
+	if (spectre_v2_mitigations_off())
+		pr_info("spectre-v2 mitigation disabled by command line option\n");
+	if (spectre_v4_mitigations_off())
+		pr_info("spectre-v4 mitigation disabled by command-line option\n");
 }
 
 void __init setup_system_features(void)
diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index edf1783ffc81..0d4a8a123e07 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -89,14 +89,9 @@ static int __init parse_spectre_v2_param(char *str)
 }
 early_param("nospectre_v2", parse_spectre_v2_param);
 
-static bool spectre_v2_mitigations_off(void)
+bool spectre_v2_mitigations_off(void)
 {
-	bool ret = __nospectre_v2 || cpu_mitigations_off();
-
-	if (ret)
-		pr_info_once("spectre-v2 mitigation disabled by command line option\n");
-
-	return ret;
+	return __nospectre_v2 || cpu_mitigations_off();
 }
 
 static const char *get_bhb_affected_string(enum mitigation_state bhb_state)
@@ -419,15 +414,10 @@ early_param("ssbd", parse_spectre_v4_param);
  * with contradictory parameters. The mitigation is always either "off",
  * "dynamic" or "on".
  */
-static bool spectre_v4_mitigations_off(void)
+bool spectre_v4_mitigations_off(void)
 {
-	bool ret = cpu_mitigations_off() ||
+	return cpu_mitigations_off() ||
 		   __spectre_v4_policy == SPECTRE_V4_POLICY_MITIGATION_DISABLED;
-
-	if (ret)
-		pr_info_once("spectre-v4 mitigation disabled by command-line option\n");
-
-	return ret;
 }
 
 /* Do we need to toggle the mitigation state on entry to/exit from the kernel? */
-- 
2.33.0


