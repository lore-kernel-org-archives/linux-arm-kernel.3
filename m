Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F27ACCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 09:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjsGQkL1fCVuPbrUwdCYMGuXDsf6O/fFJ8i+e6I2Lhs=; b=ybVH4vEbuajpf1Meh2XQv3ssRD
	A8zudh8vY3WQ9jRaHEe1cFGH183ZbrgG3wa/S9Je0Uqs3gVVnjvQbIwuJYb3br4EU0BWfRcb+19a/
	+mFBCjV/3IVwBWg8K71NRsIvRjEMoYXrPzJ8P8nQzp1YqcENfZ3PZ5j0yBSfYHykiAFbeEEB37r4s
	j/zHi0r0WKN+veVNJKQQBIpJl/+OkiTcynI86QPbNxkrLm5IirTJhJw9yGLv8WFsW6d6NNhwuTLMt
	3DqzlWeLfAor1FZrLznfJTwuQp8jsOfyJU7tW752BOB8LJ+FArRs5nMpJYqUDTQpQjx4yNZxdNAZ/
	bqwzwDxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElF7-00000005nG5-0k42;
	Fri, 31 Oct 2025 09:16:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElF5-00000005nF1-2P6P
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 31 Oct 2025 09:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xjsGQkL1fCVuPbrUwdCYMGuXDsf6O/fFJ8i+e6I2Lhs=; b=HvTSifcUfSHO46YNx8opOE0H6m
	IUZP4mwR6Lkk0taQrqnVb9QEj6UhLDERHDmkc6V5YlBVjbOzbJlm6WuNHZmvfjIBQE3oH4RfHxERR
	Au0+FEQipqqdcOHOE0WmHWtx23fuCTUqAZqs9McNJzudGgFZDdURnUKx0kK2eBuSRmb4q+vXTc/98
	yG5ga9iTF+Vd0EUa/pUrscZVGhqzmEjzRXkqqQhOdKXBHAON5fxFLUNmn40LHnVJPXBKDWv0R2lvu
	ejKOlA91zqeiFN/r3TxlzbRfjkQ5K/QmtQYDCe1vLycjACVhz2Fl0cTXWC7mHcepxIyIdBzrmytij
	y8wPNVRg==;
Received: from wxsgout03.xfusion.com ([36.139.52.80] helo=wxsgout04.xfusion.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkN8-0000000AseW-36Xi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 08:20:38 +0000
Received: from wuxpheds03048.xfusion.com (unknown [10.32.143.30])
	by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4cyb0y0CTszB9Xpw;
	Fri, 31 Oct 2025 17:15:14 +0800 (CST)
Received: from DESKTOP-Q8I2N5U.xfusion.com (10.82.130.100) by
 wuxpheds03048.xfusion.com (10.32.143.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20;
 Fri, 31 Oct 2025 17:15:50 +0800
From: shechenglong <shechenglong@xfusion.com>
To: <mark.rutland@arm.com>, <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stone.xulei@xfusion.com>, <chenjialong@xfusion.com>,
	<yuxiating@xfusion.com>, shechenglong <shechenglong@xfusion.com>
Subject: [PATCH v3 2/2] cpu: fix hard lockup triggered by printk calls within scheduling context
Date: Fri, 31 Oct 2025 17:15:06 +0800
Message-ID: <20251031091507.1896-3-shechenglong@xfusion.com>
X-Mailer: git-send-email 2.37.1.windows.1
In-Reply-To: <20251031091507.1896-1-shechenglong@xfusion.com>
References: <20250918064907.1832-1-shechenglong@xfusion.com>
 <20251031091507.1896-1-shechenglong@xfusion.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.82.130.100]
X-ClientProxiedBy: wuxpheds03047.xfusion.com (10.32.141.63) To
 wuxpheds03048.xfusion.com (10.32.143.30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_082035_583890_E887FB1F 
X-CRM114-Status: GOOD (  13.05  )
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
preventing hard lockups caused by printk calls in scheduler context.

Link: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250918064907.1832-1-shechenglong@xfusion.com/
Suggested-by: Mark Rutland <mark.rutland@arm.com>
Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: shechenglong <shechenglong@xfusion.com>
---
 arch/arm64/include/asm/spectre.h |  1 +
 arch/arm64/kernel/cpufeature.c   |  6 ++++++
 arch/arm64/kernel/proton-pack.c  | 33 +++++++++++++++++---------------
 3 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/include/asm/spectre.h b/arch/arm64/include/asm/spectre.h
index 8fef12626090..900454aaa292 100644
--- a/arch/arm64/include/asm/spectre.h
+++ b/arch/arm64/include/asm/spectre.h
@@ -117,6 +117,7 @@ void spectre_bhb_patch_wa3(struct alt_instr *alt,
 			   __le32 *origptr, __le32 *updptr, int nr_inst);
 void spectre_bhb_patch_clearbhb(struct alt_instr *alt,
 				__le32 *origptr, __le32 *updptr, int nr_inst);
+void spectre_print_disabled_mitigations(void);
 
 #endif	/* __ASSEMBLY__ */
 #endif	/* __ASM_SPECTRE_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 5ed401ff79e3..e25b0f84a22d 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -95,6 +95,7 @@
 #include <asm/vectors.h>
 #include <asm/virt.h>
 
+#include <asm/spectre.h>
 /* Kernel representation of AT_HWCAP and AT_HWCAP2 */
 static DECLARE_BITMAP(elf_hwcap, MAX_CPU_FEATURES) __read_mostly;
 
@@ -3875,6 +3876,11 @@ static void __init setup_system_capabilities(void)
 	 */
 	if (system_uses_ttbr0_pan())
 		pr_info("emulated: Privileged Access Never (PAN) using TTBR0_EL1 switching\n");
+
+	/*
+	 * Report Spectre mitigations status.
+	 */
+	spectre_print_disabled_mitigations();
 }
 
 void __init setup_system_features(void)
diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index d833b7c1bba8..c7d70d04c164 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -91,12 +91,7 @@ early_param("nospectre_v2", parse_spectre_v2_param);
 
 static bool spectre_v2_mitigations_off(void)
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
@@ -421,13 +416,8 @@ early_param("ssbd", parse_spectre_v4_param);
  */
 static bool spectre_v4_mitigations_off(void)
 {
-	bool ret = cpu_mitigations_off() ||
-		   __spectre_v4_policy == SPECTRE_V4_POLICY_MITIGATION_DISABLED;
-
-	if (ret)
-		pr_info_once("spectre-v4 mitigation disabled by command-line option\n");
-
-	return ret;
+	return cpu_mitigations_off() ||
+	       __spectre_v4_policy == SPECTRE_V4_POLICY_MITIGATION_DISABLED;
 }
 
 /* Do we need to toggle the mitigation state on entry to/exit from the kernel? */
@@ -1042,8 +1032,6 @@ void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
 
 	if (arm64_get_spectre_v2_state() == SPECTRE_VULNERABLE) {
 		/* No point mitigating Spectre-BHB alone. */
-	} else if (cpu_mitigations_off() || __nospectre_bhb) {
-		pr_info_once("spectre-bhb mitigation disabled by command line option\n");
 	} else if (supports_ecbhb(SCOPE_LOCAL_CPU)) {
 		state = SPECTRE_MITIGATED;
 		set_bit(BHB_HW, &system_bhb_mitigations);
@@ -1197,3 +1185,18 @@ void unpriv_ebpf_notify(int new_state)
 		pr_err("WARNING: %s", EBPF_WARN);
 }
 #endif
+
+void spectre_print_disabled_mitigations(void)
+{
+	/* Keep a single copy of the common message suffix to avoid duplication. */
+	const char *spectre_disabled_suffix = "mitigation disabled by command-line option\n";
+
+	if (spectre_v2_mitigations_off())
+		pr_info("spectre-v2 %s", spectre_disabled_suffix);
+
+	if (spectre_v4_mitigations_off())
+		pr_info("spectre-v4 %s", spectre_disabled_suffix);
+
+	if (__nospectre_bhb || cpu_mitigations_off())
+		pr_info("spectre-bhb %s", spectre_disabled_suffix);
+}
-- 
2.33.0


