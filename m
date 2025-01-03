Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C0DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 18:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vtt39IAHnh2vely9CQCAe1hXLcaPXXXCtaaOnYeHNqE=; b=r2EhDHGAIXKv/EJhfwxadvDZXf
	8frI+Bc7rHO2BKgaubMPmvY31nJ2fa71c77Dy3bdznJ2DjyPJdH6FwAUiYkWDOUmDAC7wL3/MqSwZ
	0YZ+kOCSd0JdXbFojr9dcYwaYUkm561+O8oBX9VAo03RwcsnQCJ2he7wvrKYgxgweQwUo1cAY8ZVf
	lJykmDL9i4iC4zoKfQ/PvpC7pM1wsaGl/Uy6B8GmNVYciGJWfqSlGeBkMijJBn3j36RWy0PaqPZgE
	oiLRzDr7Bz6eeo6OxvpYZzRMEkCUneqmBhEoQJERcgLbOIuIsXrMnefkYLBBUQGtJSzMaPC/y42Bu
	8W2yTZfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmNS-0000000DhoJ-1vxn;
	Fri, 03 Jan 2025 18:26:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmK8-0000000DhK0-1Ucg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 18:23:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 659055C636E;
	Fri,  3 Jan 2025 18:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D417C4CECE;
	Fri,  3 Jan 2025 18:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735928583;
	bh=I9ZWxC3vJEZtvxLSkxhlX/ZZ0eS3/MtVI65vC3th+mY=;
	h=From:To:Cc:Subject:Date:From;
	b=X3lTKe6wkYgZCWoUtIrpJHwYPzmGCeoiGMmVQ5ZzKOzBRF+1CUJzIL0wq/IJVJGPA
	 zLNACuowp7YubVKq0Wir/DGDlfYVcpSbNz9OSjIuH3FOINntkwKXp4B2v59MHtISn1
	 4rHwb4OoWhW3cRuCjtiChmxN9rKyv2bV3vIcTgD2qoFTb3SJ6qD/Znu/E3xs/IdSgP
	 G/q2R1Ww8Lcg8q5bwyoYVBBHW+ufUs0ehNwcTsO5aIU6acjEE4uHOzlbJ23a4xyTLG
	 QML1fSCvpzqsoQa03fg+hiGE0aA5JHFCh1ZAv1l2DUJX2ckt5mGn08w9QP+RJwvKo0
	 s3hEksUsCGILw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tTmK5-008lqi-1F;
	Fri, 03 Jan 2025 18:23:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] arm64: Filter out SVE hwcaps when FEAT_SVE isn't implemented
Date: Fri,  3 Jan 2025 18:22:55 +0000
Message-Id: <20250103182255.1763739-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, broonie@kernel.org, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_102304_485974_CA256065 
X-CRM114-Status: GOOD (  14.58  )
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

Fixes: 06a916feca2b ("arm64: Expose SVE2 features for userspace")
Reported-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kernel/cpufeature.c | 40 +++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6ce71f444ed84..6874aca5da9df 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3022,6 +3022,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
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
@@ -3050,6 +3057,13 @@ static const struct arm64_cpu_capabilities ptr_auth_hwcap_gen_matches[] = {
 };
 #endif
 
+#ifdef CONFIG_ARM64_SVE
+static bool has_sve_feature(const struct arm64_cpu_capabilities *cap, int scope)
+{
+	return system_supports_sve() && has_user_cpuid_feature(cap, scope);
+}
+#endif
+
 static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64ISAR0_EL1, AES, PMULL, CAP_HWCAP, KERNEL_HWCAP_PMULL),
 	HWCAP_CAP(ID_AA64ISAR0_EL1, AES, AES, CAP_HWCAP, KERNEL_HWCAP_AES),
@@ -3092,19 +3106,19 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
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
+	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SVEver, SVE2p1, CAP_HWCAP, KERNEL_HWCAP_SVE2P1),
+	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SVEver, SVE2, CAP_HWCAP, KERNEL_HWCAP_SVE2),
+	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, AES, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEAES),
+	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, AES, PMULL128, CAP_HWCAP, KERNEL_HWCAP_SVEPMULL),
+	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, BitPerm, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEBITPERM),
+	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, B16B16, IMP, CAP_HWCAP, KERNEL_HWCAP_SVE_B16B16),
+	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, BF16, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEBF16),
+	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, BF16, EBF16, CAP_HWCAP, KERNEL_HWCAP_SVE_EBF16),
+	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SHA3, IMP, CAP_HWCAP, KERNEL_HWCAP_SVESHA3),
+	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SVESM4),
+	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, I8MM, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEI8MM),
+	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, F32MM, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEF32MM),
+	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, F64MM, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEF64MM),
 #endif
 #ifdef CONFIG_ARM64_GCS
 	HWCAP_CAP(ID_AA64PFR1_EL1, GCS, IMP, CAP_HWCAP, KERNEL_HWCAP_GCS),
-- 
2.39.2


