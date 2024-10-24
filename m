Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D18CCDDE69
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 09:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=In6DanEuIEW3Jj7lZXuhgOozrasX4WvOcfEag/TkPKQ=; b=ftbsQu76lu3H9+MS7SZz+6XQ2Y
	mJ3L2qt/h6PmhupEPhQLqvhGvtAl+G6ZQnN5C7FsPEfHKEibw6tPoqxgvfyHpBXc83QSMYBFPMbxF
	XzT786quwHOwZzmm0mPbPzcaXCNSOIQDVaRozcXS99ME/6Nh6KPC1bsLmEDZ56FRja2Ni6HrmMY4p
	HaIVmrV7tX0j5UCYEaosYw11VZmmFegeGKJfB/1OqHe3YnkRmYSmAJUCr38PEDy1WrgoaPswAZ/uz
	iBcXdOeHffxGNb75UEDEJIt42WQiUbbyEZyZlvXxDY12hhpngkleE3R3uuSZ1F+hjs3VSEyfJIx0+
	KBe/mkuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uSx-0000000HY1F-167p;
	Thu, 24 Oct 2024 09:49:15 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uKz-0000000HVzB-11Ps
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 09:41:04 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XZ19C1RJFz6K5rC;
	Thu, 24 Oct 2024 17:39:59 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id A97C9140158;
	Thu, 24 Oct 2024 17:40:59 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 11:40:52 +0200
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <kvmarm@lists.linux.dev>, <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<cohuck@redhat.com>, <eric.auger@redhat.com>, <yuzenghui@huawei.com>,
	<wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
	<jonathan.cameron@huawei.com>, <anthony.jebson@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>
Subject: [RFC PATCH v2 3/3] KVM: arm64: Enable errata based on migration target CPUs
Date: Thu, 24 Oct 2024 10:40:12 +0100
Message-ID: <20241024094012.29452-4-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20241024094012.29452-1-shameerali.kolothum.thodi@huawei.com>
References: <20241024094012.29452-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_024101_666305_6D892502 
X-CRM114-Status: GOOD (  15.29  )
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

If the Guest has migration target CPUs set, enable all errata
that are based on target MIDR/REVIDR.

Also make sure we call the paravirt helper to retrieve migration
targets if any.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 arch/arm64/kernel/cpu_errata.c | 46 ++++++++++++++++++++++++++--------
 arch/arm64/kernel/cpufeature.c |  3 +++
 2 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index feaaf2b11f46..df6d32dfd5c0 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -18,17 +18,14 @@ u32 __ro_after_init errata_migrn_target_num;
 struct migrn_target __ro_after_init errata_migrn_target_cpus[MAX_MIGRN_TARGET_CPUS];
 
 static bool __maybe_unused
-is_affected_midr_range(const struct arm64_cpu_capabilities *entry, int scope)
+__is_affected_midr_range(const struct arm64_cpu_capabilities *entry, u32 midr, u32 revidr)
 {
 	const struct arm64_midr_revidr *fix;
-	u32 midr = read_cpuid_id(), revidr;
 
-	WARN_ON(scope != SCOPE_LOCAL_CPU || preemptible());
 	if (!is_midr_in_range(midr, &entry->midr_range))
 		return false;
 
 	midr &= MIDR_REVISION_MASK | MIDR_VARIANT_MASK;
-	revidr = read_cpuid(REVIDR_EL1);
 	for (fix = entry->fixed_revs; fix && fix->revidr_mask; fix++)
 		if (midr == fix->midr_rv && (revidr & fix->revidr_mask))
 			return false;
@@ -37,27 +34,56 @@ is_affected_midr_range(const struct arm64_cpu_capabilities *entry, int scope)
 }
 
 static bool __maybe_unused
-is_affected_midr_range_list(const struct arm64_cpu_capabilities *entry,
-			    int scope)
+is_affected_midr_range(const struct arm64_cpu_capabilities *entry, int scope)
 {
+	int i;
+
+	for (i = 0; i < errata_migrn_target_num; i++) {
+		if (__is_affected_midr_range(entry, errata_migrn_target_cpus[i].midr,
+					     errata_migrn_target_cpus[i].revidr))
+			return true;
+	}
 	WARN_ON(scope != SCOPE_LOCAL_CPU || preemptible());
-	return is_midr_in_range_list(read_cpuid_id(), entry->midr_range_list);
+	return __is_affected_midr_range(entry, read_cpuid_id(), read_cpuid(REVIDR_EL1));
 }
 
 static bool __maybe_unused
-is_kryo_midr(const struct arm64_cpu_capabilities *entry, int scope)
+is_affected_midr_range_list(const struct arm64_cpu_capabilities *entry,
+			    int scope)
 {
-	u32 model;
+	int i;
 
+	for (i = 0; i < errata_migrn_target_num; i++) {
+		if (is_midr_in_range_list(errata_migrn_target_cpus[i].midr,
+					  entry->midr_range_list))
+			return true;
+	}
 	WARN_ON(scope != SCOPE_LOCAL_CPU || preemptible());
+	return is_midr_in_range_list(read_cpuid_id(), entry->midr_range_list);
+}
 
-	model = read_cpuid_id();
+static bool __maybe_unused
+__is_kryo_midr(const struct arm64_cpu_capabilities *entry, u32 model)
+{
 	model &= MIDR_IMPLEMENTOR_MASK | (0xf00 << MIDR_PARTNUM_SHIFT) |
 		 MIDR_ARCHITECTURE_MASK;
 
 	return model == entry->midr_range.model;
 }
 
+static bool __maybe_unused
+is_kryo_midr(const struct arm64_cpu_capabilities *entry, int scope)
+{
+	int i;
+
+	for (i = 0; i < errata_migrn_target_num; i++) {
+		if (__is_kryo_midr(entry, errata_migrn_target_cpus[i].midr))
+			return true;
+	}
+	WARN_ON(scope != SCOPE_LOCAL_CPU || preemptible());
+	return __is_kryo_midr(entry, read_cpuid_id());
+}
+
 static bool
 has_mismatched_cache_type(const struct arm64_cpu_capabilities *entry,
 			  int scope)
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index f7fd7e3259e4..390f4ffa773c 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -86,6 +86,7 @@
 #include <asm/mmu_context.h>
 #include <asm/mpam.h>
 #include <asm/mte.h>
+#include <asm/paravirt.h>
 #include <asm/processor.h>
 #include <asm/smp.h>
 #include <asm/sysreg.h>
@@ -3597,6 +3598,8 @@ unsigned long cpu_get_elf_hwcap2(void)
 
 static void __init setup_boot_cpu_capabilities(void)
 {
+	pv_errata_migrn_target_init();
+
 	/*
 	 * The boot CPU's feature register values have been recorded. Detect
 	 * boot cpucaps and local cpucaps for the boot CPU, then enable and
-- 
2.45.2


