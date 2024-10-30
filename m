Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E634D6B6A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 16:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZVbbAlKBsIYQQeM04WqQYdC88tNt0ICgVGR4rHtoPE=; b=Xu9jdPSPZnBtX9NXUau7nPd7iU
	YTkqiC44pGhq/8h57fDOYACm94eTV4HzZgZnQVKwlA61uGmohssg02/3QGWgiFgyQxmw3tI3h4Uhf
	Zf2phsofAs8ooVqUXrebpCX9b7dnWFFjvaGQuRJhRCVmc5HYonooa4c7SUsEVP1JOu1KPAryzrfGV
	jMoVmLy/dEcQ4XbPkGqw4jbX6WywaqkS5M/NpncySoWbEyYXDNL8ZkcBCBYQArUSfTYPT6Kp/ANGa
	pSQEjNefGeUH8WwlWdZfsOqsbZzzIUj0j/bhdyOSWCEQDGc/Jph23fCVlBKW1Yi+QwqjJvqKXNWSe
	j2yrFCmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BEH-000000011GN-10CT;
	Wed, 30 Oct 2024 16:07:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BAX-0000000104q-0Sv6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 16:03:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF54C113E;
	Wed, 30 Oct 2024 09:04:06 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD3E73F528;
	Wed, 30 Oct 2024 09:03:34 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: anshuman.khandual@arm.com,
	gshan@redhat.com,
	james.morse@arm.com,
	joey.gouly@arm.com,
	shameerali.kolothum.thodi@huawei.com,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jing Zhang <jingzhangos@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v6 5/7] KVM: arm64: Add a macro for creating filtered sys_reg_descs entries
Date: Wed, 30 Oct 2024 16:03:15 +0000
Message-Id: <20241030160317.2528209-6-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030160317.2528209-1-joey.gouly@arm.com>
References: <20241030160317.2528209-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_090337_268142_102B6C90 
X-CRM114-Status: GOOD (  15.78  )
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

From: James Morse <james.morse@arm.com>

The sys_reg_descs array holds function pointers and reset value for
managing the user-space and guest view of system registers. These
are mostly created by a set of macro's as only some combinations
of behaviour are needed.

If a register needs special treatment, its sys_reg_descs entry is
open-coded. This is true of some id registers where the value provided
by user-space is validated by some helpers.

Before adding another one of these, add a helper that covers the
existing special cases. 'ID_FILTERED' expects helpers to set the
user-space value, and retrieve the modified reset value.

Like ID_WRITABLE() this uses id_visibility(), which should have no functional
change for the registers converted to use ID_FILTERED().

read_sanitised_id_aa64dfr0_el1() and read_sanitised_id_aa64pfr0_el1() have been
refactored to be called kvm_read_sanitised_id_reg(), to try be consistent with
ID_WRITABLE().

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 arch/arm64/kvm/sys_regs.c | 66 ++++++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 66d6af1dbadc..86ce783a54a6 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1509,6 +1509,9 @@ static u8 pmuver_to_perfmon(u8 pmuver)
 	}
 }
 
+static u64 sanitise_id_aa64pfr0_el1(const struct kvm_vcpu *vcpu, u64 val);
+static u64 sanitise_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val);
+
 /* Read a sanitised cpufeature ID register by sys_reg_desc */
 static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 				       const struct sys_reg_desc *r)
@@ -1522,6 +1525,12 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 	val = read_sanitised_ftr_reg(id);
 
 	switch (id) {
+	case SYS_ID_AA64DFR0_EL1:
+		val = sanitise_id_aa64dfr0_el1(vcpu, val);
+		break;
+	case SYS_ID_AA64PFR0_EL1:
+		val = sanitise_id_aa64pfr0_el1(vcpu, val);
+		break;
 	case SYS_ID_AA64PFR1_EL1:
 		if (!kvm_has_mte(vcpu->kvm))
 			val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE);
@@ -1692,11 +1701,8 @@ static unsigned int fp8_visibility(const struct kvm_vcpu *vcpu,
 	return REG_HIDDEN;
 }
 
-static u64 read_sanitised_id_aa64pfr0_el1(struct kvm_vcpu *vcpu,
-					  const struct sys_reg_desc *rd)
+static u64 sanitise_id_aa64pfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
 {
-	u64 val = read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
-
 	if (!vcpu_has_sve(vcpu))
 		val &= ~ID_AA64PFR0_EL1_SVE_MASK;
 
@@ -1737,11 +1743,8 @@ static u64 read_sanitised_id_aa64pfr0_el1(struct kvm_vcpu *vcpu,
 	(val);								       \
 })
 
-static u64 read_sanitised_id_aa64dfr0_el1(struct kvm_vcpu *vcpu,
-					  const struct sys_reg_desc *rd)
+static u64 sanitise_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
 {
-	u64 val = read_sanitised_ftr_reg(SYS_ID_AA64DFR0_EL1);
-
 	val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64DFR0_EL1, DebugVer, V8P8);
 
 	/*
@@ -1834,6 +1837,12 @@ static int set_id_dfr0_el1(struct kvm_vcpu *vcpu,
 	return set_id_reg(vcpu, rd, val);
 }
 
+static int set_id_aa64pfr0_el1(struct kvm_vcpu *vcpu,
+			       const struct sys_reg_desc *rd, u64 val)
+{
+	return set_id_reg(vcpu, rd, val);
+}
+
 /*
  * cpufeature ID register user accessors
  *
@@ -2150,6 +2159,15 @@ static bool bad_redir_trap(struct kvm_vcpu *vcpu,
 	.val = mask,				\
 }
 
+/* sys_reg_desc initialiser for cpufeature ID registers that need filtering */
+#define ID_FILTERED(sysreg, name, mask) {	\
+	ID_DESC(sysreg),				\
+	.set_user = set_##name,				\
+	.visibility = id_visibility,			\
+	.reset = kvm_read_sanitised_id_reg,		\
+	.val = (mask),					\
+}
+
 /*
  * sys_reg_desc initialiser for architecturally unallocated cpufeature ID
  * register with encoding Op0=3, Op1=0, CRn=0, CRm=crm, Op2=op2
@@ -2374,17 +2392,13 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 
 	/* AArch64 ID registers */
 	/* CRm=4 */
-	{ SYS_DESC(SYS_ID_AA64PFR0_EL1),
-	  .access = access_id_reg,
-	  .get_user = get_id_reg,
-	  .set_user = set_id_reg,
-	  .reset = read_sanitised_id_aa64pfr0_el1,
-	  .val = ~(ID_AA64PFR0_EL1_AMU |
-		   ID_AA64PFR0_EL1_MPAM |
-		   ID_AA64PFR0_EL1_SVE |
-		   ID_AA64PFR0_EL1_RAS |
-		   ID_AA64PFR0_EL1_AdvSIMD |
-		   ID_AA64PFR0_EL1_FP), },
+	ID_FILTERED(ID_AA64PFR0_EL1, id_aa64pfr0_el1,
+		    ~(ID_AA64PFR0_EL1_AMU |
+		      ID_AA64PFR0_EL1_MPAM |
+		      ID_AA64PFR0_EL1_SVE |
+		      ID_AA64PFR0_EL1_RAS |
+		      ID_AA64PFR0_EL1_AdvSIMD |
+		      ID_AA64PFR0_EL1_FP)),
 	ID_WRITABLE(ID_AA64PFR1_EL1, ~(ID_AA64PFR1_EL1_PFAR |
 				       ID_AA64PFR1_EL1_DF2 |
 				       ID_AA64PFR1_EL1_MTEX |
@@ -2406,11 +2420,6 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	ID_WRITABLE(ID_AA64FPFR0_EL1, ~ID_AA64FPFR0_EL1_RES0),
 
 	/* CRm=5 */
-	{ SYS_DESC(SYS_ID_AA64DFR0_EL1),
-	  .access = access_id_reg,
-	  .get_user = get_id_reg,
-	  .set_user = set_id_aa64dfr0_el1,
-	  .reset = read_sanitised_id_aa64dfr0_el1,
 	/*
 	 * Prior to FEAT_Debugv8.9, the architecture defines context-aware
 	 * breakpoints (CTX_CMPs) as the highest numbered breakpoints (BRPs).
@@ -2423,10 +2432,11 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	 * See DDI0487K.a, section D2.8.3 Breakpoint types and linking
 	 * of breakpoints for more details.
 	 */
-	  .val = ID_AA64DFR0_EL1_DoubleLock_MASK |
-		 ID_AA64DFR0_EL1_WRPs_MASK |
-		 ID_AA64DFR0_EL1_PMUVer_MASK |
-		 ID_AA64DFR0_EL1_DebugVer_MASK, },
+	ID_FILTERED(ID_AA64DFR0_EL1, id_aa64dfr0_el1,
+		    ID_AA64DFR0_EL1_DoubleLock_MASK |
+		    ID_AA64DFR0_EL1_WRPs_MASK |
+		    ID_AA64DFR0_EL1_PMUVer_MASK |
+		    ID_AA64DFR0_EL1_DebugVer_MASK),
 	ID_SANITISED(ID_AA64DFR1_EL1),
 	ID_UNALLOCATED(5,2),
 	ID_UNALLOCATED(5,3),
-- 
2.25.1


