Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF8CCCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 08:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OP74VOsKc+8hzMG1MZSYcpPSIotjoWYop6zv3WkaDfg=; b=jIl7gNYI8JYN/TbhG+3FBWbNUk
	6gBFg0Ub/c8NuC2IO0daZGOooGwfOvNFUgvNWCbQX1p7cgNysGmtXZVq3/tiDqQIZsRVJtKodM8af
	dR3dpS1xsz3ropnGU24kB7BQflqzA7o+9CYVHU3flRp60vLmyyrCw7hW+Zyanl021M9AnquUVYXzL
	dpLzlAuSgVgFIhpf3GTdiploPTCUJTBCbJ78roimIRjfXk16KEYVw60oy1tUrypuZ11gPWTFBnPrb
	wJP4u64RSxA3KFmTyY/bnfM7StBhL9U88EMA0TuCYB990QVJi9EHkq4hYwkiM0T1ICdTeHhPWeESa
	BvrxEFZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xILxR-00000005gyj-3rhk;
	Sun, 18 Oct 2026 08:09:29 +0000
Received: from out-237.mta0.migadu.com ([2001:41d0:1004:224b::ed] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xILxO-00000005gyH-15lx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 08:09:28 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=qNYqHsAHI3D2aPJmGx4BXdS7p6PSMN3a0jhnzLNwxsI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792310961; v=1; x=1792915761;
 b=Wz7v8pKpEBk8280l784bBkmCcmwNp0OS1yhecXnhfm6LfojnpQux+qxHezKBt0P2uLG+QCJ9
 XdfVPc327mUhnajsz+VOcWHHFolAQPVMkTSQa2s/bGNGdXYI2QH5R83iB3fBvMKyLXPIn3qB+qg
 xaUJO7cUskQFjk9gfTjFgfR4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 82dde8ee2cd03a9b;
	Sun, 18 Oct 2026 08:09:21 +0000
X-Mizu-Trace-ID: 82dde8ee2cd03a9b
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] KVM: arm64: Only enable S1PIE and S1POE with the features they imply
Date: Sun, 18 Oct 2026 09:09:20 +0100
Message-Id: <20261018080921.3942517-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_010926_444666_96CA29D6 
X-CRM114-Status: GOOD (  12.07  )
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

The world switch skips PIR_EL1, PIRE0_EL1 and POR_EL1 for a guest
without TCR2, but KVM doesn't trap them for a guest with S1PIE or
S1POE. Userspace can hide TCR2 while leaving either visible, and such a
guest then accesses registers that are neither trapped nor switched.

Under VHE, that leaks values between guests. POR_EL1, which the host
kernel doesn't use, leaks between guests in every mode. On nVHE and
hVHE, pKVM included, the host's own EL1 registers are saved and restored
according to the running guest's features, so the host kernel resumes
with its stage-1 permissions taken from the guest's PIR_EL1 and
PIRE0_EL1.

As per the architecture, S1PIE and S1POE imply TCR2 and ATS1A, and
S1POE also implies HPDS. Only enable each for a guest that has the
features it implies. A guest that has S1PIE or S1POE without them still
sees the feature in its ID registers, but its accesses to that
feature's registers UNDEF.

Fixes: 70ed7238297fb ("KVM: arm64: Sanitise ID_AA64MMFR3_EL1")
Fixes: d4a89e5aee23e ("KVM: arm64: Expose S1PIE to guests")
Reported-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20260930-arm64-gcs-v21-2-3556644cd927@kernel.org
Suggested-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/86fqyn2che.wl-maz@kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
Changes in v2:
- Also require FEAT_HPDS for S1POE (Marc)
- Link to v1: https://lore.kernel.org/r/20261015153041.3770032-1-fuad.tabba@linux.dev

Based on Linux 7.3-rc3 (fd73f4a665989).

 arch/arm64/kvm/config.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 1053676551aff..6d2650427c5fc 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -205,6 +205,7 @@ struct reg_feat_map_desc {
 #define FEAT_MEC		ID_AA64MMFR3_EL1, MEC, IMP
 #define FEAT_HAFT		ID_AA64MMFR1_EL1, HAFDBS, HAFT
 #define FEAT_HDBSS		ID_AA64MMFR1_EL1, HAFDBS, HDBSS
+#define FEAT_HPDS		ID_AA64MMFR1_EL1, HPDS, IMP
 #define FEAT_HPDS2		ID_AA64MMFR1_EL1, HPDS, HPDS2
 #define FEAT_BTI		ID_AA64PFR1_EL1, BT, IMP
 #define FEAT_ExS		ID_AA64MMFR0_EL1, EXS, IMP
@@ -280,6 +281,25 @@ static bool feat_anerr(struct kvm *kvm)
 		kvm_has_feat(kvm, ID_AA64MMFR3_EL1, SNERR, FEAT_ANERR));
 }
 
+/*
+ * S1PIE and S1POE imply TCR2 and ATS1A, and S1POE also implies HPDS, but
+ * userspace can set them independently.
+ */
+static bool feat_s1pie(struct kvm *kvm)
+{
+	return (kvm_has_feat(kvm, FEAT_S1PIE) &&
+		kvm_has_feat(kvm, FEAT_TCR2) &&
+		kvm_has_feat(kvm, FEAT_ATS1A));
+}
+
+static bool feat_s1poe(struct kvm *kvm)
+{
+	return (kvm_has_feat(kvm, FEAT_S1POE) &&
+		kvm_has_feat(kvm, FEAT_TCR2) &&
+		kvm_has_feat(kvm, FEAT_ATS1A) &&
+		kvm_has_feat(kvm, FEAT_HPDS));
+}
+
 static bool feat_sme_smps(struct kvm *kvm)
 {
 	/*
@@ -393,10 +413,10 @@ static const struct reg_bits_to_feat_map hfgrtr_feat_map[] = {
 	NEEDS_FEAT(HFGRTR_EL2_nS2POR_EL1, FEAT_S2POE),
 	NEEDS_FEAT(HFGRTR_EL2_nPOR_EL1		|
 		   HFGRTR_EL2_nPOR_EL0,
-		   FEAT_S1POE),
+		   feat_s1poe),
 	NEEDS_FEAT(HFGRTR_EL2_nPIR_EL1		|
 		   HFGRTR_EL2_nPIRE0_EL1,
-		   FEAT_S1PIE),
+		   feat_s1pie),
 	NEEDS_FEAT(HFGRTR_EL2_nRCWMASK_EL1, FEAT_THE),
 	NEEDS_FEAT(HFGRTR_EL2_nTPIDR2_EL0	|
 		   HFGRTR_EL2_nSMPRI_EL1,
@@ -474,10 +494,10 @@ static const struct reg_bits_to_feat_map hfgwtr_feat_map[] = {
 	NEEDS_FEAT(HFGWTR_EL2_nS2POR_EL1, FEAT_S2POE),
 	NEEDS_FEAT(HFGWTR_EL2_nPOR_EL1		|
 		   HFGWTR_EL2_nPOR_EL0,
-		   FEAT_S1POE),
+		   feat_s1poe),
 	NEEDS_FEAT(HFGWTR_EL2_nPIR_EL1		|
 		   HFGWTR_EL2_nPIRE0_EL1,
-		   FEAT_S1PIE),
+		   feat_s1pie),
 	NEEDS_FEAT(HFGWTR_EL2_nRCWMASK_EL1, FEAT_THE),
 	NEEDS_FEAT(HFGWTR_EL2_nTPIDR2_EL0	|
 		   HFGWTR_EL2_nSMPRI_EL1,
-- 
2.39.5


