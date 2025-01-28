Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCD9C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 16:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVJlcce+giFFgC0K0td7aAOyoO86mzET0bZP9rSFcjg=; b=s9ZWM5Sq70hE/ntMY3OqDnJcZ3
	1KfHqmQi97u+znX3jtEJz07+aDBfx+Jfo7pGRmGVSHh4Ea+x71gI+ERgIP2Et5BNCVJpSKpEn/PC5
	JJ205Wu1u+wXXklURcnLXa8o550WYTIYWtUxgbipQTVNY1th0Hag0DoeII9uaC4nBNJEDvPzHMydC
	PJPrpGUpxdRtgwVkZLx89cTZ+7FgGstrfCzUtTx/Bs2FDz0MQN65MPXPkURfsxLf/9l8TSdi/jEcV
	N2onbtHKXlO2hp4loCLTU7WhoEGAT6pHqTZreW1hrNbrIBgOIqJWcCxzC3fRUClUIxhTrlzJ9hDuD
	pf40Ba+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoM0-00000005J6W-0CeM;
	Tue, 28 Jan 2025 16:22:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnwJ-00000005E7T-29vc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:55:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E2EC497;
	Tue, 28 Jan 2025 07:56:13 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 30EA63F694;
	Tue, 28 Jan 2025 07:55:45 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	mark.rutland@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	will@kernel.org,
	yuzenghui@huawei.com
Subject: [PATCH 1/4] arm64: cpufeature: rename unmap_kernel_at_el0() -> needs_kpti()
Date: Tue, 28 Jan 2025 15:54:25 +0000
Message-Id: <20250128155428.210645-2-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250128155428.210645-1-mark.rutland@arm.com>
References: <20250128155428.210645-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_075547_607300_7D65BEC3 
X-CRM114-Status: GOOD (  12.90  )
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

Most arm64_cpu_capabilities::matches callbacks are named to indicate
that they test a boolean condition, e.g. runs_at_el2() or
has_nested_virt_support(). This isn't clear for unmap_kernel_at_el0(),
which can be read as an action rather than a boolean condition, and it's
not immediately clear that this is related to KPTI.

Rename unmap_kernel_at_el0() to needs_kpti() to make this clearer.

There should be no functional change as a result of this patch.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6ce71f444ed84..8fdcff3722696 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1758,8 +1758,7 @@ has_useable_cnp(const struct arm64_cpu_capabilities *entry, int scope)
 static bool __meltdown_safe = true;
 static int __kpti_forced; /* 0: not forced, >0: forced on, <0: forced off */
 
-static bool unmap_kernel_at_el0(const struct arm64_cpu_capabilities *entry,
-				int scope)
+static bool needs_kpti(const struct arm64_cpu_capabilities *entry, int scope)
 {
 	/* List of CPUs that are not vulnerable and don't need KPTI */
 	static const struct midr_range kpti_safe_list[] = {
@@ -2545,11 +2544,10 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.capability = ARM64_UNMAP_KERNEL_AT_EL0,
 		.type = ARM64_CPUCAP_BOOT_RESTRICTED_CPU_LOCAL_FEATURE,
 		.cpu_enable = cpu_enable_kpti,
-		.matches = unmap_kernel_at_el0,
+		.matches = needs_kpti,
 		/*
-		 * The ID feature fields below are used to indicate that
-		 * the CPU doesn't need KPTI. See unmap_kernel_at_el0 for
-		 * more details.
+		 * The ID feature fields below are used to indicate that the
+		 * CPU doesn't need KPTI. See needs_kpti for more details.
 		 */
 		ARM64_CPUID_FIELDS(ID_AA64PFR0_EL1, CSV3, IMP)
 	},
-- 
2.30.2


