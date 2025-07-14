Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50F9C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 12:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQGoyw6DlZRWNBgTxgMT8IWy0xRBleNOqfXO6ykwc+Q=; b=xrIaGoiBTCQ/DUnkv8/2pCufx6
	/3+eCg4pq5Tu7cHZJ5lbSBzM2Kr3+R3rvtTRqq8b5jJkZXspn4dPweS9n0TBMk3fK45SEU4ZYJJM1
	awlZhiGtZGODBBVHrHkHZQ3Y1lFejhuGiBWQaxWTKdUI9X5O3AoAmCR6aLRQbp73Ce4R7XTPORlzc
	M87r6eMneNwil42SYKEjXKTH6bDxKk1a5hTR9QArAAjMheZndfssMXPIyxW7F54QaFCMsb25xAtl7
	L4NlhMAtQP3ipI50YgaB/7NMzqVJgUkGW4zhSIaVtmhWB0wflberVbL1teaw2lOngYZ4qgWzPTCuR
	sZS9FiGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIFC-000000029VB-2w1t;
	Mon, 14 Jul 2025 12:25:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHm8-000000024rY-0yod
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 11:55:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 939DEA57022;
	Mon, 14 Jul 2025 11:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4240FC4CEED;
	Mon, 14 Jul 2025 11:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752494115;
	bh=E+z5oColGmzAqHGbFuPOh0LuM0Ab2bg2xLXf1EpYhl8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dDI9htLtWSRicb6k9AG6NGSzRMvk5Uq9AYVRFuPUBtseJvYs4RQx8+377NnTVnoyQ
	 Z54k1pH1Vo+Msl4ZQc+c+l0+bY/T6M9p9iDULEx1QzjveG7fYgeXAkF2WDyadds7q3
	 bbSQsJPo3BbwCNmNyf+dst+MAetW/13EsvQVftmsPV/tDLMBbAeb6FQ6hc4r/IbmoG
	 Q4vjukQNSk0Wdkpsckx0faISSNXA7Z43OX2AYkE+ZD1ZphhppXOjKEqzWJem0UoL4o
	 iBHwZ6nn6XQ0nsvWNqOHvTGRzmYtyCaTebbpfWPfVUFP6oiDUhaSAZQARqe462+DXb
	 20dR6z9w4z5Aw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ubHm5-00FVUo-Fn;
	Mon, 14 Jul 2025 12:55:13 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 5/5] KVM: arm64: Tighten the definition of FEAT_PMUv3p9
Date: Mon, 14 Jul 2025 12:55:03 +0100
Message-Id: <20250714115503.3334242-6-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250714115503.3334242-1-maz@kernel.org>
References: <20250714115503.3334242-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_045516_408321_6BF7939F 
X-CRM114-Status: GOOD (  12.74  )
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

The current definition of FEAT_PMUv3p9 doesn't check for the lack
of an IMPDEF PMU, which is encoded as 0b1111, but considered unsigned.

Use the recently introduced helper to address the issue (which is
harmless, as KVM never advertises an IMPDEF PMU).

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 6ea968c1624e4..c829f9a385ccb 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -66,7 +66,6 @@ struct reg_bits_to_feat_map {
 #define FEAT_BRBE		ID_AA64DFR0_EL1, BRBE, IMP
 #define FEAT_TRC_SR		ID_AA64DFR0_EL1, TraceVer, IMP
 #define FEAT_PMUv3		ID_AA64DFR0_EL1, PMUVer, IMP
-#define FEAT_PMUv3p9		ID_AA64DFR0_EL1, PMUVer, V3P9
 #define FEAT_TRBE		ID_AA64DFR0_EL1, TraceBuffer, IMP
 #define FEAT_TRBEv1p1		ID_AA64DFR0_EL1, TraceBuffer, TRBE_V1P1
 #define FEAT_DoubleLock		ID_AA64DFR0_EL1, DoubleLock, IMP
@@ -289,6 +288,11 @@ static bool feat_pmuv3p7(struct kvm *kvm)
 	return check_pmu_revision(kvm, V3P7);
 }
 
+static bool feat_pmuv3p9(struct kvm *kvm)
+{
+	return check_pmu_revision(kvm, V3P9);
+}
+
 static bool compute_hcr_rw(struct kvm *kvm, u64 *bits)
 {
 	/* This is purely academic: AArch32 and NV are mutually exclusive */
@@ -747,7 +751,7 @@ static const struct reg_bits_to_feat_map hdfgrtr2_feat_map[] = {
 	NEEDS_FEAT(HDFGRTR2_EL2_nPMICFILTR_EL0	|
 		   HDFGRTR2_EL2_nPMICNTR_EL0,
 		   FEAT_PMUv3_ICNTR),
-	NEEDS_FEAT(HDFGRTR2_EL2_nPMUACR_EL1, FEAT_PMUv3p9),
+	NEEDS_FEAT(HDFGRTR2_EL2_nPMUACR_EL1, feat_pmuv3p9),
 	NEEDS_FEAT(HDFGRTR2_EL2_nPMSSCR_EL1	|
 		   HDFGRTR2_EL2_nPMSSDATA,
 		   FEAT_PMUv3_SS),
@@ -779,7 +783,7 @@ static const struct reg_bits_to_feat_map hdfgwtr2_feat_map[] = {
 		   FEAT_PMUv3_ICNTR),
 	NEEDS_FEAT(HDFGWTR2_EL2_nPMUACR_EL1	|
 		   HDFGWTR2_EL2_nPMZR_EL0,
-		   FEAT_PMUv3p9),
+		   feat_pmuv3p9),
 	NEEDS_FEAT(HDFGWTR2_EL2_nPMSSCR_EL1, FEAT_PMUv3_SS),
 	NEEDS_FEAT(HDFGWTR2_EL2_nPMIAR_EL1, FEAT_SEBEP),
 	NEEDS_FEAT(HDFGWTR2_EL2_nPMSDSFR_EL1, feat_spe_fds),
-- 
2.39.2


