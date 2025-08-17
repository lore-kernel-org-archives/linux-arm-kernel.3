Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37069CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 20:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAsJhH33w5/L93Us/U4jg7Q2AiWkSzRZyfc2+2xQdwM=; b=Cz1TI+jYK2diX/JwLNuVpl01qF
	IeI6u8fhYXYW6gE7nSafk1rWJtLDjnID87XqFdw7TWDYtwSwu6uom2QKVarIVC98qOme5KSoSSahH
	YgbJxCgRKxgTgWcmvFG0vYhXjex/r96wTRVRbtJZ6h2qF2g0iG02Bu18eaZlgREDOhXF7Y9bCEmcq
	70gAv5mjoVbWfrdzI9Q5d+fruf3FYK2BSVilsUhKbLa6jJ9C7U2wa5jkWytGVvqgo3CzTaXbBDiWx
	tkzJabEODlQXGhGCPsbGgbFFOX7oO660uPG6npH6e/sFIMuf0xcMbEmfwSXKfYeLCAhlYryrA2GRI
	jsLBeEKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unkB3-000000062Bp-2gQy;
	Sun, 17 Aug 2025 20:40:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unjtH-000000060QW-1yYx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 20:22:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EA42745C36;
	Sun, 17 Aug 2025 20:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3329C4CEED;
	Sun, 17 Aug 2025 20:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755462125;
	bh=3vd1wrwANdEhEBYmVfIfvZ49NXbAKqOZUOEAet9mLhk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XJVu3iKPwIxUD+xgbvhcd7woxuQqc+pJbIZyZls8I/XbejiYnBW8dkzn04ehj1bFp
	 8hbz0muCmCYgXynb/Ma0Yp40WWD8PFgebMC7dIOLpCw9JhtSfgxPr+Rf0hgEBe5ucv
	 zumc7gGmp+f9XX+XKSBAdw0RBsZ+1XXGyw1I8SRy0rQxurqoByJqYRwOV1yRgaix2l
	 P20WvILNeCrSwMncgWdKr4gvKLPKqu2C+Iwsp1/N3z5goG5Q1cZ8eKnLT4Y5ZNFaeI
	 /61d8WwM/dibNOt1I41sKJDfJ/KmHBD/lMyWMFnI+4DdcnuxS3ONqJizKRXPZxO7wg
	 9HRTyegaOJBfA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1unjtD-008PX0-9H;
	Sun, 17 Aug 2025 21:22:03 +0100
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
Subject: [PATCH v3 2/6] KVM: arm64: Handle RASv1p1 registers
Date: Sun, 17 Aug 2025 21:21:54 +0100
Message-Id: <20250817202158.395078-3-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250817_132207_552139_D374A55D 
X-CRM114-Status: GOOD (  11.24  )
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

FEAT_RASv1p1 system registeres are not handled at all so far.
KVM will give an embarassed warning on the console and inject
an UNDEF, despite RASv1p1 being exposed to the guest on suitable HW.

Handle these registers similarly to FEAT_RAS, with the added fun
that there are *two* way to indicate the presence of FEAT_RASv1p1.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 82ffb3b3b3cf7..feb1a7a708e25 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2697,6 +2697,18 @@ static bool access_ras(struct kvm_vcpu *vcpu,
 	struct kvm *kvm = vcpu->kvm;
 
 	switch(reg_to_encoding(r)) {
+	case SYS_ERXPFGCDN_EL1:
+	case SYS_ERXPFGCTL_EL1:
+	case SYS_ERXPFGF_EL1:
+	case SYS_ERXMISC2_EL1:
+	case SYS_ERXMISC3_EL1:
+		if (!(kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, V1P1) ||
+		      (kvm_has_feat_enum(kvm, ID_AA64PFR0_EL1, RAS, IMP) &&
+		       kvm_has_feat(kvm, ID_AA64PFR1_EL1, RAS_frac, RASv1p1)))) {
+			kvm_inject_undefined(vcpu);
+			return false;
+		}
+		break;
 	default:
 		if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, IMP)) {
 			kvm_inject_undefined(vcpu);
@@ -3063,8 +3075,13 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_ERXCTLR_EL1), access_ras },
 	{ SYS_DESC(SYS_ERXSTATUS_EL1), access_ras },
 	{ SYS_DESC(SYS_ERXADDR_EL1), access_ras },
+	{ SYS_DESC(SYS_ERXPFGF_EL1), access_ras },
+	{ SYS_DESC(SYS_ERXPFGCTL_EL1), access_ras },
+	{ SYS_DESC(SYS_ERXPFGCDN_EL1), access_ras },
 	{ SYS_DESC(SYS_ERXMISC0_EL1), access_ras },
 	{ SYS_DESC(SYS_ERXMISC1_EL1), access_ras },
+	{ SYS_DESC(SYS_ERXMISC2_EL1), access_ras },
+	{ SYS_DESC(SYS_ERXMISC3_EL1), access_ras },
 
 	MTE_REG(TFSR_EL1),
 	MTE_REG(TFSRE0_EL1),
-- 
2.39.2


