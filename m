Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0BFCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 16:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQuOFQr5NeQsoZBsTrW20ncoGC6Khprv4OsFvN9HSwg=; b=wMC06zNwPLAwm2xCQ6vlEtP5W5
	QPxwaISG36jN5wrQIUmOexdtUNO6Em5HtBF1urf8yU7YVz3PTPTklMGbcHWwvF4r8OvIm/b5Br3PN
	nLc/LRtvVm38VD0UA3TcAC2r6zkA++9XDPmb2rn6Tn4wMjw/KRHOoEgsrzwaNABRkDgCzyjd5IOP9
	Fp8cSr6oD4z/GIVJ3GhUlPl4AJWb9Q1d/TpKZt0mDe+gPrJj0SbK4yqsI6lcHww8/h73ie/Q9imDI
	RcRWuh3xnz6DFKotLgL1RI1H3E6G7XdZmunlGofY6OwtovfCn1e2pp6HzqHHzeRosyxBJF1dqD9xo
	HTnornBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNzl-00000006z6r-3C6V;
	Fri, 08 May 2026 16:24:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNzi-00000006z4M-02aG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 16:24:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C76091E5E;
	Fri,  8 May 2026 09:23:59 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29C303F763;
	Fri,  8 May 2026 09:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778257445; bh=Taw+EgStIHXUnOnJUtTgeinZazPcPCvcQemD1Fo9qfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vGImD2asj5EL5DUbxiUjNtrjpi7P7VSINO5fFd/zEzC9W3fSOgDJRnDMSvndfu0Fn
	 r33oc8zGFNGw+Nr7RKc1yRRMY/6Q7sdQWApMs2/LOt90bHeViAO4m1tuAZVbVlENY/
	 Z5gWeHS5VTvizS1AOJihLmwARD5Hsg+SM3z1qeik=
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	zengheng4@huawei.com
Cc: wangkefeng.wang@huawei.com,
	xry111@xry111.site,
	catalin.marinas@arm.com,
	yang@os.amperecomputing.com,
	reinette.chatre@intel.com,
	will@kernel.org,
	thuth@redhat.com,
	ben.horgan@arm.com,
	mrigendra.chaubey@gmail.com,
	fenghuay@nvidia.com,
	ahmed.genidi@arm.com
Subject: [PATCH v3 3/4] arm64: cpufeature: Add support for the MPAM v0.1 architecture version
Date: Fri,  8 May 2026 17:23:40 +0100
Message-ID: <20260508162341.3762549-4-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508162341.3762549-1-james.morse@arm.com>
References: <20260508162341.3762549-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_092406_149238_5DC507D5 
X-CRM114-Status: GOOD (  15.99  )
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

From: Zeng Heng <zengheng4@huawei.com>

According to the MPAM spec [1], the supported architecture versions are
v1.0, v1.1 and v0.1. MPAM versions v0.1 and v1.1 are functionally
identical, but v0.1 additionally supports the FORCE_NS feature.

ID_AA64PR | ID_AA64PR | MPAM Extension | Notes
F0_EL1.   | F1_EL1.   | Architecture   |
MPAM      | MPAM_frac | version        |
---------------------------------------------------------------------------
0b0000    | 0b0001    | v0.1           | MPAM v0.1 is implemented.
          |           |                | MPAM v0.1 is the same as MPAM v1.1
          |           |                | with FORCE_NS which is
          |           |                | incompatible with MPAM v1.0.
---------------------------------------------------------------------------
0b0001    | 0b0000    | v1.0           | MPAM v1.0 is implemented.
---------------------------------------------------------------------------
0b0001    | 0b0001    | v1.1           | MPAM v1.1 is implemented.
          |           |                | MPAM v1.1 includes all features of
          |           |                | MPAM v1.0.
          |           |                | It must not include FORCE_NS.

FORCE_NS is a feature that operates in EL3 mode. Consequently, the current
Linux MPAM driver is also compatible with MPAM v0.1. To support v0.1, the
existing driver which only checks ID_AA64PFR0_EL1.MPAM for the major
version needs to examine ID_AA64PFR1_EL1.MPAM_frac for the minor version
as well.

[1] https://developer.arm.com/documentation/ddi0598/db/?lang=en

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: James Morse <james.morse@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 arch/arm64/include/asm/cpufeature.h |  7 +++++++
 arch/arm64/include/asm/el2_setup.h  |  4 +++-
 arch/arm64/kernel/cpufeature.c      | 15 +++++++++++----
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 4de51f8d92cb..a57870fa96db 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -620,6 +620,13 @@ static inline bool id_aa64pfr0_mpam(u64 pfr0)
 	return val > 0;
 }
 
+static inline bool id_aa64pfr1_mpamfrac(u64 pfr1)
+{
+	u32 val = cpuid_feature_extract_unsigned_field(pfr1, ID_AA64PFR1_EL1_MPAM_frac_SHIFT);
+
+	return val > 0;
+}
+
 static inline bool id_aa64pfr1_mte(u64 pfr1)
 {
 	u32 val = cpuid_feature_extract_unsigned_field(pfr1, ID_AA64PFR1_EL1_MTE_SHIFT);
diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 587507a9980e..aa8ec9df8024 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -510,7 +510,9 @@
 #endif
 
 .macro finalise_el2_state
-	check_override id_aa64pfr0, ID_AA64PFR0_EL1_MPAM_SHIFT, .Linit_mpam_\@, .Lskip_mpam_\@, x1, x2
+	check_override id_aa64pfr0, ID_AA64PFR0_EL1_MPAM_SHIFT, .Linit_mpam_\@, .Lmpam_minor_\@, x1, x2
+.Lmpam_minor_\@:
+	check_override id_aa64pfr1, ID_AA64PFR1_EL1_MPAM_frac_SHIFT, .Linit_mpam_\@, .Lskip_mpam_\@, x1, x2
 
 .Linit_mpam_\@:
 	mov	x0, #MPAM2_EL2_EnMPAMSM_MASK
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6d53bb15cf7b..0a1d198b3995 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1164,6 +1164,14 @@ static __init void detect_system_supports_pseudo_nmi(void)
 static inline void detect_system_supports_pseudo_nmi(void) { }
 #endif
 
+static bool detect_ftr_has_mpam(void)
+{
+	u64 pfr0 = read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
+	u64 pfr1 = read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1);
+
+	return id_aa64pfr0_mpam(pfr0) || id_aa64pfr1_mpamfrac(pfr1);
+}
+
 void __init init_cpu_features(struct cpuinfo_arm64 *info)
 {
 	/* Before we start using the tables, make sure it is sorted */
@@ -1211,7 +1219,7 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info)
 		cpacr_restore(cpacr);
 	}
 
-	if (id_aa64pfr0_mpam(read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1))) {
+	if (detect_ftr_has_mpam()) {
 		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
 		init_cpu_ftr_reg(SYS_MPAMIDR_EL1, info->reg_mpamidr);
 	}
@@ -1467,7 +1475,7 @@ void update_cpu_features(int cpu,
 		cpacr_restore(cpacr);
 	}
 
-	if (id_aa64pfr0_mpam(read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1))) {
+	if (detect_ftr_has_mpam()) {
 		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
 		taint |= check_update_ftr_reg(SYS_MPAMIDR_EL1, cpu,
 					info->reg_mpamidr, boot->reg_mpamidr);
@@ -2486,7 +2494,7 @@ cpucap_panic_on_conflict(const struct arm64_cpu_capabilities *cap)
 static bool
 test_has_mpam(const struct arm64_cpu_capabilities *entry, int scope)
 {
-	if (!has_cpuid_feature(entry, scope))
+	if (!detect_ftr_has_mpam())
 		return false;
 
 	/* Check firmware actually enabled MPAM on this cpu. */
@@ -3093,7 +3101,6 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.capability = ARM64_MPAM,
 		.matches = test_has_mpam,
 		.cpu_enable = cpu_enable_mpam,
-		ARM64_CPUID_FIELDS(ID_AA64PFR0_EL1, MPAM, 1)
 	},
 	{
 		.desc = "Memory Partitioning And Monitoring Virtualisation",
-- 
2.53.0


