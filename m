Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FEFCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 20:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/VAEW+ahvwE9ZLZToUELXTUsjq66/GZVZvrczMoaQw=; b=mC1JsLBdS7ffETUmq8y8CTHoMS
	iTMeTvj0ZiYOpUZ8uwQCFYNXC/tDe7uae8c2js9K4jQ4gvBW2j7SjAc6qF/G2xryK0M3YEY2W1Lk7
	9lpQLKMxAwyhIWHngqfPv/pBpk0O6dT1gMLCS5Ou7z9qx/3ScsyF94tRkOjxr4lTrVfg1xEW3TcYN
	n+aHE2ANJ0fAKZYXyQ1u3y7QSVTY90wl+A+0O7aU3VS8+xTlklvPnMTzVb1MdeEqE5q+Hf4ihaIkp
	9PsZGgXNAFn98s9eS5h5Yf7XOjF02qPAsBUQ8N870Jgf/8A724wMJ05NXjlR+ep8WlQgrSSxG1Dak
	7klYMKMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unk8V-0000000620M-3Vdr;
	Sun, 17 Aug 2025 20:37:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unjtH-000000060QZ-1yoA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 20:22:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 29DB644F2B;
	Sun, 17 Aug 2025 20:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094A3C19421;
	Sun, 17 Aug 2025 20:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755462126;
	bh=a1ciFFHUrNYknE+TBc4JNqPphY8KkfsdZHtRRnEBglw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X6katjZc6Di9tkdax2Rt6GMVr3B0dVqmTJqZhcsxj02MGrRGOw4MfuI1K89uvKWKY
	 Ql9REr9TklwrJo6NFpbn+EvCMBqL7tnkgVrla/cHUJaNaUTZN8QKG4voHK7PI0tAj/
	 2SJQQNfCHpNILCSV25f+Gc2PpCPxY91M5yIekWRS5ndN4w9+y+O0knUWm2cc98R7Us
	 1r/DY0GYG7p1HfqO4F/nFJPxskSvya3LuHMeaJ1bkkSNjRv2Zi9OOpl1unhwmgB0gw
	 uDZUzzHfugTbMqE+VllkcwXGzgsEGrntZ4RBculR1Ak721Bqv2xV6C1W1bcyjYk9l5
	 cbEQY4l/SekCQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1unjtD-008PX0-Vc;
	Sun, 17 Aug 2025 21:22:04 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 5/6] KVM: arm64: Make ID_AA64PFR1_EL1.RAS_frac writable
Date: Sun, 17 Aug 2025 21:21:57 +0100
Message-Id: <20250817202158.395078-6-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250817202158.395078-1-maz@kernel.org>
References: <20250817202158.395078-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com, cohuck@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_132207_557602_B62262DB 
X-CRM114-Status: GOOD (  12.00  )
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

Allow userspace to write to RAS_frac, under the condition that
the host supports RASv1p1 with RAS_frac==1. Other configurations
will result in RAS_frac being exposed as 0, and therefore implicitly
not writable.

To avoid the clutter, the ID_AA64PFR1_EL1 sanitisation is moved to
its own function.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c   |  3 ++-
 arch/arm64/kvm/sys_regs.c | 41 ++++++++++++++++++++++++++-------------
 2 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 153b3e11b115d..1b0aedacc3f59 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1458,9 +1458,10 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 		break;
 
 	case SYS_ID_AA64PFR1_EL1:
-		/* Only support BTI, SSBS, CSV2_frac */
+		/* Only support BTI, SSBS, RAS_frac, CSV2_frac */
 		val &= (ID_AA64PFR1_EL1_BT	|
 			ID_AA64PFR1_EL1_SSBS	|
+			ID_AA64PFR1_EL1_RAS_frac|
 			ID_AA64PFR1_EL1_CSV2_frac);
 		break;
 
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 3306fef432cbb..e149786f8bde0 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1584,6 +1584,7 @@ static u8 pmuver_to_perfmon(u8 pmuver)
 }
 
 static u64 sanitise_id_aa64pfr0_el1(const struct kvm_vcpu *vcpu, u64 val);
+static u64 sanitise_id_aa64pfr1_el1(const struct kvm_vcpu *vcpu, u64 val);
 static u64 sanitise_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val);
 
 /* Read a sanitised cpufeature ID register by sys_reg_desc */
@@ -1606,19 +1607,7 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 		val = sanitise_id_aa64pfr0_el1(vcpu, val);
 		break;
 	case SYS_ID_AA64PFR1_EL1:
-		if (!kvm_has_mte(vcpu->kvm)) {
-			val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE);
-			val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE_frac);
-		}
-
-		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_SME);
-		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_RNDR_trap);
-		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_NMI);
-		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_GCS);
-		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_THE);
-		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTEX);
-		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_PFAR);
-		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MPAM_frac);
+		val = sanitise_id_aa64pfr1_el1(vcpu, val);
 		break;
 	case SYS_ID_AA64PFR2_EL1:
 		val &= ID_AA64PFR2_EL1_FPMR |
@@ -1836,6 +1825,31 @@ static u64 sanitise_id_aa64pfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
 	return val;
 }
 
+static u64 sanitise_id_aa64pfr1_el1(const struct kvm_vcpu *vcpu, u64 val)
+{
+	u64 pfr0 = read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
+
+	if (!kvm_has_mte(vcpu->kvm)) {
+		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE);
+		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE_frac);
+	}
+
+	if (!(cpus_have_final_cap(ARM64_HAS_RASV1P1_EXTN) &&
+	      SYS_FIELD_GET(ID_AA64PFR0_EL1, RAS, pfr0) == ID_AA64PFR0_EL1_RAS_IMP))
+		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_RAS_frac);
+
+	val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_SME);
+	val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_RNDR_trap);
+	val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_NMI);
+	val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_GCS);
+	val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_THE);
+	val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTEX);
+	val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_PFAR);
+	val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MPAM_frac);
+
+	return val;
+}
+
 static u64 sanitise_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
 {
 	val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64DFR0_EL1, DebugVer, V8P8);
@@ -2954,7 +2968,6 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 				       ID_AA64PFR1_EL1_SME |
 				       ID_AA64PFR1_EL1_RES0 |
 				       ID_AA64PFR1_EL1_MPAM_frac |
-				       ID_AA64PFR1_EL1_RAS_frac |
 				       ID_AA64PFR1_EL1_MTE)),
 	ID_WRITABLE(ID_AA64PFR2_EL1,
 		    ID_AA64PFR2_EL1_FPMR |
-- 
2.39.2


