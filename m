Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD1ECE8D4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsk6+T2AtVszNYzWV/LcSl1b1bVsSSFwiuU9hcifY+Q=; b=1VqX3TAzTRaizNezNWps7UYnIy
	n6rCgIwOrG9BlzNUjARFmiEAG92+xNz5DuU/Q5wi36wLgOs1UiYJBfZg9eoKVGl8U+FCPNSzk1hcf
	0SikkWy/1WZBgiEdUyEzdizxPpgmfpWcgB8vGs3yqiLh8yz0Hu4gMrp9ISjndh3sM3Zzpc3lQLU8/
	UJ/ynPQ9M/yaWfFXFycrY1WneTJ8/fHe+HY+vDSLKNQFYIVrLylbsySkofh/6zZdZa8eOPFGZY5H2
	s1kXzYu1x7qq1/8INxeBslsED/5wLskilzfSI55ZnVbc0Xd1HDA4tnPUwRdBRP5GHnORpUaL9jfxz
	bSARd/Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLs-0000000Cfwu-33iE;
	Fri, 14 Nov 2025 16:08:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLc-0000000Cfcv-3UPy
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 16:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fsk6+T2AtVszNYzWV/LcSl1b1bVsSSFwiuU9hcifY+Q=; b=j1m/iuWESuQmR07hDvp9eOfvba
	X/QwetC+5w34K08WnLPs1ZSa/lD+7+xrnHIZRUKpYNcvM8BPx+relGD5munCjNDpVO2T6KoDzj57U
	zt5t1nOvwOJdXjm3an6UwxZ5sBoiQPx1vuarc3Bj31DbPPxCKcz175S7QO9sCc3bFdhejR2wV1QxO
	qDzG1utA6kSIIGz+JLjQbCiwD3cXsT8+Q1N0TgHFsN5H2MXIyMGQ8Y9tUPVBvAVcNY/Yipg57qltk
	eYelqDNoz+fEHwY18MR8l2BeWSyOtuhOk1phr2Rp0sLJmhQgg53Hdx+yboGxkfKfbWEUm+u1zEFD/
	TzLFdwEw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvTv-00000002vWE-0Xhd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:13:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59D9A1BB2;
	Fri, 14 Nov 2025 08:08:17 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D01663F5A1;
	Fri, 14 Nov 2025 08:08:22 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: james.clark@linaro.org,
	mark.rutland@arm.com,
	james.morse@arm.com
Subject: [RFC PATCH v6 20/35] KVM: arm64: config: Use functions from spe.c to test FEAT_SPE_{FnE,FDS}
Date: Fri, 14 Nov 2025 16:07:01 +0000
Message-ID: <20251114160717.163230-21-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_151259_550172_0803F5AD 
X-CRM114-Status: GOOD (  12.25  )
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

KVM's FGU mechanism will trap the registers introduced by FEAT_SPE_FnE and
FEAT_SPE_FDS if the feature is not present for the VM. Move the functions
that check for the presence of these features out of config.c and into
spe.c, since that's where the bulk of SPE virtualization lies.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/include/asm/kvm_spe.h | 11 +++++++++++
 arch/arm64/kvm/config.c          | 16 +++-------------
 arch/arm64/kvm/spe.c             |  4 ++--
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
index 47b94794cc5f..6bc728723897 100644
--- a/arch/arm64/include/asm/kvm_spe.h
+++ b/arch/arm64/include/asm/kvm_spe.h
@@ -41,6 +41,9 @@ int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
 
 bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val);
 u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg, u32 encoding);
+
+bool kvm_spe_has_feat_spe_fne(struct kvm *kvm);
+bool kvm_spe_has_feat_spe_fds(struct kvm *kvm);
 #else
 struct kvm_spe {
 };
@@ -82,6 +85,14 @@ static inline u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg, u32 encodi
 {
 	return 0;
 }
+static inline bool kvm_spe_has_feat_spe_fne(struct kvm *kvm)
+{
+	return false;
+}
+static inline bool kvm_spe_has_feat_spe_fds(struct kvm *kvm)
+{
+	return false;
+}
 #endif /* CONFIG_KVM_ARM_SPE */
 
 #endif /* __ARM64_KVM_SPE_H__ */
diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index ed6b167b7aa8..51ad0bf936c0 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -285,16 +285,6 @@ static bool feat_sme_smps(struct kvm *kvm)
 		(read_sysreg_s(SYS_SMIDR_EL1) & SMIDR_EL1_SMPS));
 }
 
-static bool feat_spe_fds(struct kvm *kvm)
-{
-	/*
-	 * Revists this if KVM ever supports SPE -- this really should
-	 * look at the guest's view of PMSIDR_EL1.
-	 */
-	return (kvm_has_feat(kvm, FEAT_SPEv1p4) &&
-		(read_sysreg_s(SYS_PMSIDR_EL1) & PMSIDR_EL1_FDS));
-}
-
 static bool feat_trbe_mpam(struct kvm *kvm)
 {
 	/*
@@ -548,7 +538,7 @@ static const struct reg_bits_to_feat_map hdfgrtr_feat_map[] = {
 		   HDFGRTR_EL2_PMBPTR_EL1	|
 		   HDFGRTR_EL2_PMBLIMITR_EL1,
 		   FEAT_SPE),
-	NEEDS_FEAT(HDFGRTR_EL2_nPMSNEVFR_EL1, FEAT_SPE_FnE),
+	NEEDS_FEAT(HDFGRTR_EL2_nPMSNEVFR_EL1, kvm_spe_has_feat_spe_fne),
 	NEEDS_FEAT(HDFGRTR_EL2_nBRBDATA		|
 		   HDFGRTR_EL2_nBRBCTL		|
 		   HDFGRTR_EL2_nBRBIDR,
@@ -852,7 +842,7 @@ static const struct reg_bits_to_feat_map hdfgrtr2_feat_map[] = {
 		   HDFGRTR2_EL2_nPMSSDATA,
 		   FEAT_PMUv3_SS),
 	NEEDS_FEAT(HDFGRTR2_EL2_nPMIAR_EL1, FEAT_SEBEP),
-	NEEDS_FEAT(HDFGRTR2_EL2_nPMSDSFR_EL1, feat_spe_fds),
+	NEEDS_FEAT(HDFGRTR2_EL2_nPMSDSFR_EL1, kvm_spe_has_feat_spe_fds),
 	NEEDS_FEAT(HDFGRTR2_EL2_nPMBMAR_EL1, FEAT_SPE_nVM),
 	NEEDS_FEAT(HDFGRTR2_EL2_nSPMACCESSR_EL1	|
 		   HDFGRTR2_EL2_nSPMCNTEN	|
@@ -885,7 +875,7 @@ static const struct reg_bits_to_feat_map hdfgwtr2_feat_map[] = {
 		   feat_pmuv3p9),
 	NEEDS_FEAT(HDFGWTR2_EL2_nPMSSCR_EL1, FEAT_PMUv3_SS),
 	NEEDS_FEAT(HDFGWTR2_EL2_nPMIAR_EL1, FEAT_SEBEP),
-	NEEDS_FEAT(HDFGWTR2_EL2_nPMSDSFR_EL1, feat_spe_fds),
+	NEEDS_FEAT(HDFGWTR2_EL2_nPMSDSFR_EL1, kvm_spe_has_feat_spe_fds),
 	NEEDS_FEAT(HDFGWTR2_EL2_nPMBMAR_EL1, FEAT_SPE_nVM),
 	NEEDS_FEAT(HDFGWTR2_EL2_nSPMACCESSR_EL1	|
 		   HDFGWTR2_EL2_nSPMCNTEN	|
diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
index 92eb46276c71..fa24e47a1e73 100644
--- a/arch/arm64/kvm/spe.c
+++ b/arch/arm64/kvm/spe.c
@@ -92,7 +92,7 @@ bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val)
 	return true;
 }
 
-static bool kvm_spe_has_feat_spe_fds(struct kvm *kvm)
+bool kvm_spe_has_feat_spe_fds(struct kvm *kvm)
 {
 	struct arm_spe_pmu *spe_pmu = kvm->arch.kvm_spe.arm_spu;
 
@@ -100,7 +100,7 @@ static bool kvm_spe_has_feat_spe_fds(struct kvm *kvm)
 	       FIELD_GET(PMSIDR_EL1_FDS, spe_pmu->pmsidr_el1);
 }
 
-static bool kvm_spe_has_feat_spe_fne(struct kvm *kvm)
+bool kvm_spe_has_feat_spe_fne(struct kvm *kvm)
 {
 	struct arm_spe_pmu *spe_pmu = kvm->arch.kvm_spe.arm_spu;
 
-- 
2.51.2


