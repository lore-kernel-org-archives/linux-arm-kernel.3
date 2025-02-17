Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7897C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 11:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bG5p2pMwHsY3bRuQ4UASbPlGJNVPCVCWWGf7nV9sj6A=; b=z1Q5sHfUltoB6CIjgdORnAgwju
	7Jmp/VlZLTXlBzE1plmfSYIM67au9NVJiyJQT4MGVrZe+O25WzNcmUaK0kAo8llF2sJpaonGSuqbe
	GRkox1/H2vvSJAelYQ+JO1FBPm0R0bCu6KxM1OKsTnmDGnwr6ih1fle+xujUi7+JeaAfR6iq51DgZ
	p4B4KUHMX271Pkw553Wht5bZg1AiUWxUwHuTD3MslriszpV0Xj4BT+VboYh4S4TiVJ/Uru6N8Q4VG
	4tokkrDp/HijC2lr5Z/m/IjDJ4wxmT8OD4kMJPcvtK7hUJNmoshtjg3y+2xI7rcsYrKFekqC7CtEY
	IfY23bAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzIu-00000004Ixa-1I7m;
	Mon, 17 Feb 2025 11:28:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzEZ-00000004INu-3Po2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 11:24:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EAF055C49B6;
	Mon, 17 Feb 2025 11:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C3DC4AF09;
	Mon, 17 Feb 2025 11:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739791459;
	bh=dYz+hTJxMRqs58+wHRFEMd3G0Mri3nv5zfDY/9xb8X0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GqQHP/CSer1zhF69pvmREx/y72TUZZFJ8cdBebmkEpqYCebvcVuiPcC/CudaH9T6i
	 B2hkkOe96Hzt21HsN8NPIylVz40fqwFDyJcpoqXeAEE2k92qkzVlL53T64DxcLFUkr
	 iYkdGVuuBgd6wJgZLUvY5Bfj5CFyVpp6aj1b/GRaF3rS3DIesYoCDGRTqSGmblzceD
	 tPeS5JWFLq1bgmRbDurWiJJ1BL1d3FHeugOuC4US2LwWI4+yqBRZdflF5epSMISNKj
	 nD1BPlznFwdADf4ybPxEk5iLiWD9UEwv+thXziRtCEUuj8cK1ikYFSiK8mb4JJQcBh
	 jAXaQX98VCwlg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tjzEX-0052DP-06;
	Mon, 17 Feb 2025 11:24:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 1/2] KVM: arm64: Fix MDCR_EL2.HPMN reset value
Date: Mon, 17 Feb 2025 11:24:11 +0000
Message-Id: <20250217112412.3963324-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250217112412.3963324-1-maz@kernel.org>
References: <20250217112412.3963324-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_032419_937050_B48DC2C2 
X-CRM114-Status: GOOD (  14.29  )
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

The MDCR_EL2 documentation indicates that the HPMN field has
the following behaviour:

"On a Warm reset, this field resets to the expression NUM_PMU_COUNTERS."

However, it appears we reset it to zero, which is not very useful.

Add a reset helper for MDCR_EL2, and handle the case where userspace
changes the target PMU, which may force us to change HPMN again.

Reported-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/pmu-emul.c | 13 +++++++++++++
 arch/arm64/kvm/sys_regs.c |  7 ++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 6c5950b9ceac8..5a71c3744c4d7 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -1007,6 +1007,19 @@ static void kvm_arm_set_pmu(struct kvm *kvm, struct arm_pmu *arm_pmu)
 
 	kvm->arch.arm_pmu = arm_pmu;
 	kvm->arch.pmcr_n = kvm_arm_pmu_get_max_counters(kvm);
+
+	/* Reset MDCR_EL2.HPMN behind the vcpus' back... */
+	if (test_bit(KVM_ARM_VCPU_HAS_EL2, kvm->arch.vcpu_features)) {
+		struct kvm_vcpu *vcpu;
+		unsigned long i;
+
+		kvm_for_each_vcpu(i, vcpu, kvm) {
+			u64 val = __vcpu_sys_reg(vcpu, MDCR_EL2);
+			val &= ~MDCR_EL2_HPMN;
+			val |= FIELD_PREP(MDCR_EL2_HPMN, kvm->arch.pmcr_n);
+			__vcpu_sys_reg(vcpu, MDCR_EL2) = val;
+		}
+	}
 }
 
 /**
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 82430c1e1dd02..380f22f19cb42 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2493,6 +2493,11 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static u64 reset_mdcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
+{
+	__vcpu_sys_reg(vcpu, r->reg) = vcpu->kvm->arch.pmcr_n;
+	return vcpu->kvm->arch.pmcr_n;
+}
 
 /*
  * Architected system registers.
@@ -3034,7 +3039,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	EL2_REG(SCTLR_EL2, access_rw, reset_val, SCTLR_EL2_RES1),
 	EL2_REG(ACTLR_EL2, access_rw, reset_val, 0),
 	EL2_REG_VNCR(HCR_EL2, reset_hcr, 0),
-	EL2_REG(MDCR_EL2, access_mdcr, reset_val, 0),
+	EL2_REG(MDCR_EL2, access_mdcr, reset_mdcr, 0),
 	EL2_REG(CPTR_EL2, access_rw, reset_val, CPTR_NVHE_EL2_RES1),
 	EL2_REG_VNCR(HSTR_EL2, reset_val, 0),
 	EL2_REG_VNCR(HFGRTR_EL2, reset_val, 0),
-- 
2.39.2


