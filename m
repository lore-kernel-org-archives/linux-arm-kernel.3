Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0034DC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 12:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JDOQzmKb8Anot5vObxJJtGMCXF8mbOSzPxiRK5ROuYQ=; b=MyAWOxBoDgPuPT85vGsCUNPp/+
	cbkZ/4Wgrw4vVNgNBPDU7DjlBEGM0ssOGQCgfgXmCqV28wTL48/fPXgRpSEGVgFmRnbQ32iQ2c2ec
	OmpVruTi7bqGyid/Th+7kwKDp6N/2GqGTpJX5Ls/KoaWS5v2SmIB1Jx/ZncbdZsAdEg6F8TvYOm4U
	RYYMleYGHmTnC+g1GgOn46wxfrkfZr6j+83Z5654q++Th4X5ZYt68SFv6w4P+/2XoDiNEEr1A5In7
	pBATJWuNt8eiujpq+XlCKtTttQR6nBKB0vA3oPfTaHBc2/TJylwDceMxMIy1VP78rx5U41nc3+MN2
	B11Fl6qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUm6E-0000000Bahw-48Hx;
	Thu, 26 Jun 2025 12:53:06 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUm29-0000000Ba8C-1z0u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 12:48:55 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bSdn04XFxz27hvW;
	Thu, 26 Jun 2025 20:49:40 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 47CD21A016C;
	Thu, 26 Jun 2025 20:48:45 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 26 Jun 2025 20:48:45 +0800
Received: from huawei.com (10.90.31.46) by kwepemq200004.china.huawei.com
 (7.202.195.237) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 26 Jun
 2025 20:48:44 +0800
From: Zhou Wang <wangzhou1@hisilicon.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	"Will Deacon" <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<tangnianyao@huawei.com>, <wangwudi@hisilicon.com>, Zhou Wang
	<wangzhou1@hisilicon.com>
Subject: [PATCH] ARM64: errata: Add workaround for HIP10/HIP10C erratum 162200803
Date: Thu, 26 Jun 2025 20:41:42 +0800
Message-ID: <20250626124142.2035110-1-wangzhou1@hisilicon.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_054853_821018_E1E0067E 
X-CRM114-Status: GOOD (  17.72  )
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

For GICv4.0 of Hip10 and Hip10C, it has a SoC bug with vPE schedule:
when multiple vPEs are sending vpe schedule/deschedule commands
concurrently and repeatedly, some vPE schedule command may not be
scheduled, and it will cause the command timeout.

The hardware implementation is that there is one GIC hardware in one CPU die,
which handles all vPE schedule operations one by one in all CPUs of this die.
The bug is that if the number of queued vPE schedule operations is more
than a certain value, the last vPE schedule operation will be lost.

One possible way to solve this problem is to limit the number of vLPIs, so
the hardware could spend less time to scan virtual pending table when it
handles the vPE schedule operations, so the queued vPE schedule operations
will never be more than above certain value.

Given the number of CPUs of die, and imagine there is 100 vPE schedule
operations per second one CPU, it can be calculated that we can limit
the number of vLPI to 4096 for virtual machine to avoid the issue.

Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 12 ++++++++++++
 arch/arm64/include/asm/cputype.h            |  4 ++++
 arch/arm64/kernel/cpu_errata.c              | 15 +++++++++++++++
 arch/arm64/kvm/vgic/vgic-mmio-v3.c          |  5 +++++
 arch/arm64/tools/cpucaps                    |  1 +
 include/linux/irqchip/arm-gic-v3.h          |  1 +
 7 files changed, 40 insertions(+)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index b18ef4064bc0..e8baa04e3f8c 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -264,6 +264,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Hisilicon      | Hip09           | #162100801      | HISILICON_ERRATUM_162100801 |
 +----------------+-----------------+-----------------+-----------------------------+
+| Hisilicon      | Hip{10,10C}     | #162200803      | HISILICON_ERRATUM_162200803 |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 55fc331af337..d3df92c0fde7 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1268,6 +1268,18 @@ config HISILICON_ERRATUM_162100801
 
 	  If unsure, say Y.
 
+config HISILICON_ERRATUM_162200803
+	bool "Hip{10, 10C} 162200803 erratum support"
+	default y
+	help
+	  For GICv4.0 of Hip10 and Hip10C, it has a soc bug with vPE schedule:
+	  when multiple vPEs are sending vpe schedule/deschedule commands
+	  concurrently and repeatly, some vPE schedule command may not be
+	  scheduled, and it will cause the command timeout. To avoid the
+	  issue, limit the number of vLPI to 4096 for virtual machine.
+
+	  If unsure, say Y.
+
 config QCOM_FALKOR_ERRATUM_1003
 	bool "Falkor E1003: Incorrect translation due to ASID change"
 	default y
diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 661735616787..c40328907433 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -134,6 +134,8 @@
 
 #define HISI_CPU_PART_TSV110		0xD01
 #define HISI_CPU_PART_HIP09			0xD02
+#define HISI_CPU_PART_HIP10		0xD03
+#define HISI_CPU_PART_HIP10C		0xD45
 #define HISI_CPU_PART_HIP12		0xD06
 
 #define APPLE_CPU_PART_M1_ICESTORM	0x022
@@ -223,6 +225,8 @@
 #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
 #define MIDR_HISI_TSV110 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_TSV110)
 #define MIDR_HISI_HIP09 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP09)
+#define MIDR_HISI_HIP10 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP10)
+#define MIDR_HISI_HIP10C MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP10C)
 #define MIDR_HISI_HIP12 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP12)
 #define MIDR_APPLE_M1_ICESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM)
 #define MIDR_APPLE_M1_FIRESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_FIRESTORM)
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 59d723c9ab8f..693cf748396d 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -564,6 +564,14 @@ static const struct midr_range erratum_ac04_cpu_23_list[] = {
 };
 #endif
 
+#ifdef CONFIG_HISILICON_ERRATUM_162200803
+static const struct midr_range erratum_hisi_162200803[] = {
+	MIDR_ALL_VERSIONS(MIDR_HISI_HIP10),
+	MIDR_ALL_VERSIONS(MIDR_HISI_HIP10C),
+	{},
+};
+#endif
+
 const struct arm64_cpu_capabilities arm64_errata[] = {
 #ifdef CONFIG_ARM64_WORKAROUND_CLEAN_CACHE
 	{
@@ -905,6 +913,13 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		.matches = has_impdef_pmuv3,
 		.cpu_enable = cpu_enable_impdef_pmuv3_traps,
 	},
+#ifdef CONFIG_HISILICON_ERRATUM_162200803
+	{
+		.desc = "HiSilicon erratum 162200803",
+		.capability = ARM64_WORKAROUND_HISI_162200803,
+		ERRATA_MIDR_RANGE_LIST(erratum_hisi_162200803),
+	},
+#endif
 	{
 	}
 };
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index ae4c0593d114..495a56e9dc4b 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -81,6 +81,11 @@ static unsigned long vgic_mmio_read_v3_misc(struct kvm_vcpu *vcpu,
 		if (vgic_has_its(vcpu->kvm)) {
 			value |= (INTERRUPT_ID_BITS_ITS - 1) << 19;
 			value |= GICD_TYPER_LPIS;
+			/* Limit the number of vlpis to 4096 */
+			if (cpus_have_final_cap(ARM64_WORKAROUND_HISI_162200803) &&
+			    kvm_vgic_global_state.has_gicv4 &&
+			    !kvm_vgic_global_state.has_gicv4_1)
+				value |= 11 << GICD_TYPER_NUM_LPIS_SHIFT;
 		} else {
 			value |= (INTERRUPT_ID_BITS_SPIS - 1) << 19;
 		}
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 10effd4cff6b..fda817f830f9 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -106,6 +106,7 @@ WORKAROUND_CAVIUM_TX2_219_PRFM
 WORKAROUND_CAVIUM_TX2_219_TVM
 WORKAROUND_CLEAN_CACHE
 WORKAROUND_DEVICE_LOAD_ACQUIRE
+WORKAROUND_HISI_162200803
 WORKAROUND_NVIDIA_CARMEL_CNP
 WORKAROUND_PMUV3_IMPDEF_TRAPS
 WORKAROUND_QCOM_FALKOR_E1003
diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
index 70c0948f978e..3118728671e5 100644
--- a/include/linux/irqchip/arm-gic-v3.h
+++ b/include/linux/irqchip/arm-gic-v3.h
@@ -89,6 +89,7 @@
 #define GICD_TYPER_SPIS(typer)		((((typer) & 0x1f) + 1) * 32)
 #define GICD_TYPER_ESPIS(typer)						\
 	(((typer) & GICD_TYPER_ESPI) ? GICD_TYPER_SPIS((typer) >> 27) : 0)
+#define GICD_TYPER_NUM_LPIS_SHIFT	11
 
 #define GICD_TYPER2_nASSGIcap		(1U << 8)
 #define GICD_TYPER2_VIL			(1U << 7)
-- 
2.33.0


