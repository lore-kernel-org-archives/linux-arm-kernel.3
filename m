Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4A5C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s9Fav1HRmS3yvV3evHAusUZt5mG0qQ4b4zm240qtQrY=; b=uEhKFC7+1GhxcJv45DYg85u57A
	o/+G2I78QdlMPVi32rNpHQV2Je4ycJgkHyZ4XxjgqI9TgTikLPfAiAGbPxCxQG5wRO1XShhiPhvie
	KpAaqAyyJd8GGZEDfJ4ElHYLmYH3flZSXWQvt8VFZ8PxAL8iSWbslDt2uF9ZMJT+0M2e5uw+sMwH3
	8vNYsztTmS2UKG+Cm/ASDeRJZUAoTpjNlyt7H0DnbhvXvpdSlrQR68oH3vBw6YV20Oxb3QsWNLyZE
	ml9lUXYV76Xxz660dNcT+a1qnrshCyv2kQLtb7UnktlnNMgOKtnID5PJDTi5h2xqGFZfq3nTxbLMm
	EnnErm2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29zH-000000007R7-34v6;
	Thu, 03 Sep 2026 16:08:27 +0000
Received: from out-113.mta1.migadu.com ([95.215.58.113] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29zD-000000007MV-0831
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:08:25 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ST1d9tXf3lfByRvx1HzA3LALhNpAbVpeUQp5sPZRsq0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788451700; v=1; x=1789056500;
 b=lDZzHjn+fKJ0tLRsM2GJ+qSvZcB8UsdsbBmPxpHGFg+3AL+vz+hUys6KPGXW+N8RvsdKlHEH
 2hr7oe5U2kGW4o1rJqiU8yUnG1cS7BQJIDNJkvC07eXqkGyEW5iqaouPIVa983fLNAwag6j1xit
 bEbVVHcGSHN9svNtiijaxzEE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9b1f55877e308f33;
	Thu, 03 Sep 2026 16:08:20 +0000
X-Mizu-Trace-ID: 9b1f55877e308f33
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Xi Ruoyao <xry111@xry111.site>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Gavin Shan <gshan@redhat.com>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: Trap guest MPAM accesses whenever MPAM is implemented
Date: Thu,  3 Sep 2026 17:08:19 +0100
Message-Id: <20260903160819.831518-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_090823_815762_889E2E65 
X-CRM114-Status: GOOD (  15.48  )
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

finalise_el2_state() clears the EL2 MPAM traps whenever the ID registers
advertise MPAM, but KVM sets them only when ARM64_MPAM is set, which
also requires MPAMEN. Without EL3 the enable is EL2's own and nothing
sets it, so the cap stays off and a guest reaches the MPAM registers
while ID_AA64PFR0_EL1.MPAM reads 0 for it.

Gate the traps on the ID registers alone. MPAMEN is not a term in any
MPAM accessor, so they take effect without it. finalise_el2_state
already wrote MPAM2_EL2 under the same condition, so MPAM3_EL3.TRAPLOWER
is clear wherever the cap is set, and arm64.nompam still clears it.

Fixes: 31ff96c38ea3 ("KVM: arm64: Fix missing traps of guest accesses to the MPAM registers")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
Found this while working on the other MPAM thread [1].

[1] https://lore.kernel.org/all/CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com/

 arch/arm64/include/asm/cpufeature.h     |  5 +++++
 arch/arm64/kernel/cpufeature.c          | 13 +++++++++++++
 arch/arm64/kvm/hyp/include/hyp/switch.h |  4 ++--
 arch/arm64/tools/cpucaps                |  1 +
 4 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 7404a6e83a930..8863ae99596bc 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -873,6 +873,11 @@ static __always_inline bool system_supports_mpam_hcr(void)
 	return alternative_has_cap_unlikely(ARM64_MPAM_HCR);
 }
 
+static __always_inline bool system_supports_mpam_sysregs(void)
+{
+	return alternative_has_cap_unlikely(ARM64_MPAM_SYSREGS);
+}
+
 static inline bool system_supports_pmuv3(void)
 {
 	return cpus_have_final_cap(ARM64_HAS_PMUV3);
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 17b83a2518a8f..36a27692e5cf7 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2501,6 +2501,13 @@ test_has_mpam(const struct arm64_cpu_capabilities *entry, int scope)
 	return (read_sysreg_s(SYS_MPAM1_EL1) & MPAM1_EL1_MPAMEN);
 }
 
+static bool
+test_has_mpam_sysregs(const struct arm64_cpu_capabilities *entry, int __unused)
+{
+	/* The registers exist whether or not firmware enabled MPAM. */
+	return detect_ftr_has_mpam();
+}
+
 static void
 cpu_enable_mpam(const struct arm64_cpu_capabilities *entry)
 {
@@ -3116,6 +3123,12 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = test_has_mpam,
 		.cpu_enable = cpu_enable_mpam,
 	},
+	{
+		.desc = "Memory Partitioning And Monitoring system registers",
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.capability = ARM64_MPAM_SYSREGS,
+		.matches = test_has_mpam_sysregs,
+	},
 	{
 		.desc = "Memory Partitioning And Monitoring Virtualisation",
 		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 1ce7130e25490..8941335724f6b 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -298,7 +298,7 @@ static inline void  __activate_traps_mpam(struct kvm_vcpu *vcpu)
 	u64 clr = MPAM2_EL2_EnMPAMSM;
 	u64 set = MPAM2_EL2_TRAPMPAM0EL1 | MPAM2_EL2_TRAPMPAM1EL1;
 
-	if (!system_supports_mpam())
+	if (!system_supports_mpam_sysregs())
 		return;
 
 	/* trap guest access to MPAMIDR_EL1 */
@@ -317,7 +317,7 @@ static inline void __deactivate_traps_mpam(void)
 	u64 clr = MPAM2_EL2_TRAPMPAM0EL1 | MPAM2_EL2_TRAPMPAM1EL1 | MPAM2_EL2_TIDR;
 	u64 set = MPAM2_EL2_EnMPAMSM;
 
-	if (!system_supports_mpam())
+	if (!system_supports_mpam_sysregs())
 		return;
 
 	sysreg_clear_set_s(SYS_MPAM2_EL2, clr, set);
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 2775ba3359cfe..aa5be51385f68 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -78,6 +78,7 @@ KVM_PROTECTED_MODE
 MISMATCHED_CACHE_TYPE
 MPAM
 MPAM_HCR
+MPAM_SYSREGS
 MTE
 MTE_ASYMM
 MTE_FAR

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.39.5


