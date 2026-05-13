Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FF1CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJBhihzwrfxY/wZqac9ayV3JTqIqda6bLhU7PGwvbRw=; b=0uHxbAcLnGuYA3aXNoXsLbZncr
	Ym3/fWa7OiLXQ51DtPyyyg++skgRysHifaOJKL7NMRvrLf/EsP2KwmZvBABpx+DFApO9opZF2ykHR
	p/3oOrEBbE5p6CzhiXw1Np7pX7Ff11heOmqbTjtT8a7cjJaYnDm+erubHt8gWxoYv+PDXiFwb09j5
	z5SE/ZVNGgLOQ5D/fpn1Cbl3GgPtW9MMcuX33z+BAhbLzc82G5ACZF9/aXHAR4bBBg4oiLLJkR+AW
	XJEUB93sqlmX7NxLqD0vFDmkG4PJSwo6sb7cogd2I747Ib+296oU/+mUD978el5KIC3bqzera94sx
	oxu2lBzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Uf-00000002exa-1ujd;
	Wed, 13 May 2026 13:19:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9UC-00000002eM1-0Dfb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:19:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A6AB237B;
	Wed, 13 May 2026 06:18:46 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.68.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5671C3F836;
	Wed, 13 May 2026 06:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778678331; bh=jLQ4y6Fs7cghe1no72DYDaK6wwzE2W/EDRGN3XEo8/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ma+6UibOwlp7Ggzq9tqM83+0UamZmigpbOs3vlMG0GTg9U63KYgbps4mLrPP7Hc9W
	 jYomBrP59YaUmA4EydjEo8MxNxJTYV01mvcBT/mDL1bon+GBgaY1FTVSlLQcUKtKHO
	 gPnxq9EftFQLfdFUMYFM8FWxIFT2A5c41C3S4ltU=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo.Pieralisi2@arm.com
Subject: [PATCH v14 06/44] arm64: RMI: Check for RMI support at init
Date: Wed, 13 May 2026 14:17:14 +0100
Message-ID: <20260513131757.116630-7-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513131757.116630-1-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_061852_179665_89537AF5 
X-CRM114-Status: GOOD (  18.61  )
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

Query the RMI version number and check if it is a compatible version.
The first two feature registers are read and exposed for future code to
use.

Signed-off-by: Steven Price <steven.price@arm.com>
---
v14:
 * This moves the basic RMI setup into the 'kernel' directory. This is
   because RMI will be used for some features outside of KVM so should
   be available even if KVM isn't compiled in.
---
 arch/arm64/include/asm/rmi_cmds.h |  3 ++
 arch/arm64/kernel/Makefile        |  2 +-
 arch/arm64/kernel/cpufeature.c    |  1 +
 arch/arm64/kernel/rmi.c           | 65 +++++++++++++++++++++++++++++++
 4 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/kernel/rmi.c

diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/asm/rmi_cmds.h
index 04f7066894e9..9179934925c5 100644
--- a/arch/arm64/include/asm/rmi_cmds.h
+++ b/arch/arm64/include/asm/rmi_cmds.h
@@ -10,6 +10,9 @@
 
 #include <asm/rmi_smc.h>
 
+extern unsigned long rmm_feat_reg0;
+extern unsigned long rmm_feat_reg1;
+
 struct rtt_entry {
 	unsigned long walk_level;
 	unsigned long desc;
diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index 74b76bb70452..d68f351aae75 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -34,7 +34,7 @@ obj-y			:= debug-monitors.o entry.o irq.o fpsimd.o		\
 			   cpufeature.o alternative.o cacheinfo.o		\
 			   smp.o smp_spin_table.o topology.o smccc-call.o	\
 			   syscall.o proton-pack.o idle.o patching.o pi/	\
-			   rsi.o jump_label.o
+			   rsi.o jump_label.o rmi.o
 
 obj-$(CONFIG_COMPAT)			+= sys32.o signal32.o			\
 					   sys_compat.o
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6d53bb15cf7b..8bdd95a8c2de 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -292,6 +292,7 @@ static const struct arm64_ftr_bits ftr_id_aa64isar3[] = {
 static const struct arm64_ftr_bits ftr_id_aa64pfr0[] = {
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_CSV3_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_CSV2_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_RME_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_DIT_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_AMU_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_MPAM_SHIFT, 4, 0),
diff --git a/arch/arm64/kernel/rmi.c b/arch/arm64/kernel/rmi.c
new file mode 100644
index 000000000000..99c1ccc35c11
--- /dev/null
+++ b/arch/arm64/kernel/rmi.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023-2025 ARM Ltd.
+ */
+
+#include <linux/memblock.h>
+
+#include <asm/rmi_cmds.h>
+
+unsigned long rmm_feat_reg0;
+unsigned long rmm_feat_reg1;
+
+static int rmi_check_version(void)
+{
+	struct arm_smccc_res res;
+	unsigned short version_major, version_minor;
+	unsigned long host_version = RMI_ABI_VERSION(RMI_ABI_MAJOR_VERSION,
+						     RMI_ABI_MINOR_VERSION);
+	unsigned long aa64pfr0 = read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
+
+	/* If RME isn't supported, then RMI can't be */
+	if (cpuid_feature_extract_unsigned_field(aa64pfr0, ID_AA64PFR0_EL1_RME_SHIFT) == 0)
+		return -ENXIO;
+
+	arm_smccc_1_1_invoke(SMC_RMI_VERSION, host_version, &res);
+
+	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
+		return -ENXIO;
+
+	version_major = RMI_ABI_VERSION_GET_MAJOR(res.a1);
+	version_minor = RMI_ABI_VERSION_GET_MINOR(res.a1);
+
+	if (res.a0 != RMI_SUCCESS) {
+		unsigned short high_version_major, high_version_minor;
+
+		high_version_major = RMI_ABI_VERSION_GET_MAJOR(res.a2);
+		high_version_minor = RMI_ABI_VERSION_GET_MINOR(res.a2);
+
+		pr_err("Unsupported RMI ABI (v%d.%d - v%d.%d) we want v%d.%d\n",
+		       version_major, version_minor,
+		       high_version_major, high_version_minor,
+		       RMI_ABI_MAJOR_VERSION,
+		       RMI_ABI_MINOR_VERSION);
+		return -ENXIO;
+	}
+
+	pr_info("RMI ABI version %d.%d\n", version_major, version_minor);
+
+	return 0;
+}
+
+static int __init arm64_init_rmi(void)
+{
+	/* Continue without realm support if we can't agree on a version */
+	if (rmi_check_version())
+		return 0;
+
+	if (WARN_ON(rmi_features(0, &rmm_feat_reg0)))
+		return 0;
+	if (WARN_ON(rmi_features(1, &rmm_feat_reg1)))
+		return 0;
+
+	return 0;
+}
+subsys_initcall(arm64_init_rmi);
-- 
2.43.0


