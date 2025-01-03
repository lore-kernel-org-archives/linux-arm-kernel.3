Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F397FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 14:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FW1o6DeB/Gni6nPen2ZGnKRS1nqUawozKOT6ffo3+5Y=; b=AGE/npxcmaCUV/F9AozDPzDPmC
	69agW+oXZ7kjC0kI6EgAZYE0xsbJ4kp7BNvruT8038d4PR326ujTZNrKojYkDfRTZ95mKevIjjj4K
	hI3GJnHYuT77oobNY6FwJod32RUj+DJwg1NWo7tfy++u7LRweIHC5vB+CiSfMy9CiyuFLMyLKgIY8
	mtKDFb+n9c47JJ/knu4l0OkY0PExYrH29Mn58DH1bWZv0QEpQ8vE8wXXnD9MHLra89VxGXZyE/9D5
	54MXnr3NgoC6snMi+ODDFccbMn0iKCeSCrGHQy2N0mrpsCLCPitfzBMJTm2YeDnL/e0cJ5bHTkKtW
	MYSA3/tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTig9-0000000D7AW-1TCT;
	Fri, 03 Jan 2025 14:29:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTidU-0000000D6iL-0kVV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 14:26:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DC5715C63FF;
	Fri,  3 Jan 2025 14:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19FDC4CECE;
	Fri,  3 Jan 2025 14:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735914406;
	bh=3SSf2lU8RqANspOD06SsPV0f6XpSiVxM2RGnP/oeW5c=;
	h=From:To:Cc:Subject:Date:From;
	b=Pm+pXBh7ynVMSryhfDQ9BjxlyGbnc1XzzJK0pJ4QWpDKoNpnwizA9fF5lcluf6uMF
	 oYwThz75X3LKmfBTpiGakn0Tpl+ZEwGwM6eqZ/SKEyE0IZCZ+LnXOFTP3AlPm7cRZM
	 lfso1udoxaW0YlU41wLbCb2U5AfRP8TmPuo6yLBbkWqpOvemxhoN1dM+CALZsk/17O
	 5JniedJB+ylrCJVjlsoIv6ohMBe2z3NlhAE7Mynjpvg6AK4e/AjI6ZBWcXJe0+b+Tz
	 S/xdaDlBUSUhzA60/n6RzdZ8Bsr1lznkG2GznU7XAdk+KCFmoEO0FdLfUoOwjh0Z9i
	 AlJ/Fa/ffok2w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tTidQ-008iZ8-KQ;
	Fri, 03 Jan 2025 14:26:44 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] arm64: Filter out SVE hwcaps when FEAT_SVE isn't implemented
Date: Fri,  3 Jan 2025 14:26:35 +0000
Message-Id: <20250103142635.1759674-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, broonie@kernel.org, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_062648_304744_AC852FC6 
X-CRM114-Status: GOOD (  15.57  )
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

The hwcaps code that exposes SVE features to userspace only
considers ID_AA64ZFR0_EL1, while this is only valid when
ID_AA64PFR0_EL1.SVE advertises that SVE is actually supported.

The expectations are that when ID_AA64PFR0_EL1.SVE is 0, the
ID_AA64ZFR0_EL1 register is also 0. So far, so good.

Things become a bit more interesting if the HW implements SME.
In this case, a few ID_AA64ZFR0_EL1 fields indicate *SME*
features. And these fields overlap with their SVE interpretations.
But the architecture says that the SME and SVE feature sets must
match, so we're still hunky-dory.

This goes wrong if the HW implements SME, but not SVE. In this
case, we end-up advertising some SVE features to userspace, even
if the HW has none. That's because we never consider whether SVE
is actually implemented. Oh well.

Fix it by restricting all SVE capabilities to ID_AA64PFR0_EL1.SVE
being non-zero.

Reported-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kernel/cpufeature.c | 58 ++++++++++++++++++++++++----------
 1 file changed, 41 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6ce71f444ed84..d793ca08549cd 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1593,14 +1593,19 @@ feature_matches(u64 reg, const struct arm64_cpu_capabilities *entry)
 	return val >= min && val <= max;
 }
 
-static u64
-read_scoped_sysreg(const struct arm64_cpu_capabilities *entry, int scope)
+static u64 __read_scoped_sysreg(u64 reg, int scope)
 {
 	WARN_ON(scope == SCOPE_LOCAL_CPU && preemptible());
 	if (scope == SCOPE_SYSTEM)
-		return read_sanitised_ftr_reg(entry->sys_reg);
+		return read_sanitised_ftr_reg(reg);
 	else
-		return __read_sysreg_by_encoding(entry->sys_reg);
+		return __read_sysreg_by_encoding(reg);
+}
+
+static u64
+read_scoped_sysreg(const struct arm64_cpu_capabilities *entry, int scope)
+{
+	return __read_scoped_sysreg(entry->sys_reg, scope);
 }
 
 static bool
@@ -3022,6 +3027,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = match,						\
 	}
 
+#define HWCAP_CAP_MATCH_ID(match, reg, field, min_value, cap_type, cap)		\
+	{									\
+		__HWCAP_CAP(#cap, cap_type, cap)				\
+		HWCAP_CPUID_MATCH(reg, field, min_value) 			\
+		.matches = match,						\
+	}
+
 #ifdef CONFIG_ARM64_PTR_AUTH
 static const struct arm64_cpu_capabilities ptr_auth_hwcap_addr_matches[] = {
 	{
@@ -3050,6 +3062,18 @@ static const struct arm64_cpu_capabilities ptr_auth_hwcap_gen_matches[] = {
 };
 #endif
 
+#ifdef CONFIG_ARM64_SVE
+static bool has_sve(const struct arm64_cpu_capabilities *cap, int scope)
+{
+	u64 aa64pfr0 = __read_scoped_sysreg(SYS_ID_AA64PFR0_EL1, scope);
+
+	if (FIELD_GET(ID_AA64PFR0_EL1_SVE, aa64pfr0) < ID_AA64PFR0_EL1_SVE_IMP)
+		return false;
+
+	return has_user_cpuid_feature(cap, scope);
+}
+#endif
+
 static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64ISAR0_EL1, AES, PMULL, CAP_HWCAP, KERNEL_HWCAP_PMULL),
 	HWCAP_CAP(ID_AA64ISAR0_EL1, AES, AES, CAP_HWCAP, KERNEL_HWCAP_AES),
@@ -3092,19 +3116,19 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64MMFR2_EL1, AT, IMP, CAP_HWCAP, KERNEL_HWCAP_USCAT),
 #ifdef CONFIG_ARM64_SVE
 	HWCAP_CAP(ID_AA64PFR0_EL1, SVE, IMP, CAP_HWCAP, KERNEL_HWCAP_SVE),
-	HWCAP_CAP(ID_AA64ZFR0_EL1, SVEver, SVE2p1, CAP_HWCAP, KERNEL_HWCAP_SVE2P1),
-	HWCAP_CAP(ID_AA64ZFR0_EL1, SVEver, SVE2, CAP_HWCAP, KERNEL_HWCAP_SVE2),
-	HWCAP_CAP(ID_AA64ZFR0_EL1, AES, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEAES),
-	HWCAP_CAP(ID_AA64ZFR0_EL1, AES, PMULL128, CAP_HWCAP, KERNEL_HWCAP_SVEPMULL),
-	HWCAP_CAP(ID_AA64ZFR0_EL1, BitPerm, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEBITPERM),
-	HWCAP_CAP(ID_AA64ZFR0_EL1, B16B16, IMP, CAP_HWCAP, KERNEL_HWCAP_SVE_B16B16),
-	HWCAP_CAP(ID_AA64ZFR0_EL1, BF16, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEBF16),
-	HWCAP_CAP(ID_AA64ZFR0_EL1, BF16, EBF16, CAP_HWCAP, KERNEL_HWCAP_SVE_EBF16),
-	HWCAP_CAP(ID_AA64ZFR0_EL1, SHA3, IMP, CAP_HWCAP, KERNEL_HWCAP_SVESHA3),
-	HWCAP_CAP(ID_AA64ZFR0_EL1, SM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SVESM4),
-	HWCAP_CAP(ID_AA64ZFR0_EL1, I8MM, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEI8MM),
-	HWCAP_CAP(ID_AA64ZFR0_EL1, F32MM, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEF32MM),
-	HWCAP_CAP(ID_AA64ZFR0_EL1, F64MM, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEF64MM),
+	HWCAP_CAP_MATCH_ID(has_sve, ID_AA64ZFR0_EL1, SVEver, SVE2p1, CAP_HWCAP, KERNEL_HWCAP_SVE2P1),
+	HWCAP_CAP_MATCH_ID(has_sve, ID_AA64ZFR0_EL1, SVEver, SVE2, CAP_HWCAP, KERNEL_HWCAP_SVE2),
+	HWCAP_CAP_MATCH_ID(has_sve, ID_AA64ZFR0_EL1, AES, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEAES),
+	HWCAP_CAP_MATCH_ID(has_sve, ID_AA64ZFR0_EL1, AES, PMULL128, CAP_HWCAP, KERNEL_HWCAP_SVEPMULL),
+	HWCAP_CAP_MATCH_ID(has_sve, ID_AA64ZFR0_EL1, BitPerm, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEBITPERM),
+	HWCAP_CAP_MATCH_ID(has_sve, ID_AA64ZFR0_EL1, B16B16, IMP, CAP_HWCAP, KERNEL_HWCAP_SVE_B16B16),
+	HWCAP_CAP_MATCH_ID(has_sve, ID_AA64ZFR0_EL1, BF16, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEBF16),
+	HWCAP_CAP_MATCH_ID(has_sve, ID_AA64ZFR0_EL1, BF16, EBF16, CAP_HWCAP, KERNEL_HWCAP_SVE_EBF16),
+	HWCAP_CAP_MATCH_ID(has_sve, ID_AA64ZFR0_EL1, SHA3, IMP, CAP_HWCAP, KERNEL_HWCAP_SVESHA3),
+	HWCAP_CAP_MATCH_ID(has_sve, ID_AA64ZFR0_EL1, SM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SVESM4),
+	HWCAP_CAP_MATCH_ID(has_sve, ID_AA64ZFR0_EL1, I8MM, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEI8MM),
+	HWCAP_CAP_MATCH_ID(has_sve, ID_AA64ZFR0_EL1, F32MM, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEF32MM),
+	HWCAP_CAP_MATCH_ID(has_sve, ID_AA64ZFR0_EL1, F64MM, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEF64MM),
 #endif
 #ifdef CONFIG_ARM64_GCS
 	HWCAP_CAP(ID_AA64PFR1_EL1, GCS, IMP, CAP_HWCAP, KERNEL_HWCAP_GCS),
-- 
2.39.2


