Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A94C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+kbPNJox0X/P2MDcyMgA7wG5rNBDdNCA12l0p06a8w=; b=DnQEdjaeTgKS3qt/kGcOCZH9tQ
	o/jNnwCK1qRny9lp5MndqqLYOlNU2i76h160P8TFGGWvrzqwy8NyH3dHVq6Ia3r/aBPKdtnFwiytq
	A4n/s32ZCNLwZnjvcwdt/3+8V8tBQyLOT5NVyGtVz2vaSrJbRijmTvAixZvVzUEeIKOSdlATB5VJY
	EPUVRJMr02JSyCL1EFvYtRh/l6fZQZsSECCefHrsutiuQEokT5TDzyb8HJJSFPgPNG4379yGTGuH4
	FQCfxQOOR6qGTc1+LAYgDpucdyxvMQ+C3AL79LhdwRph0Q79QeJKrL3N920SuDLEqgLOMGI4N+NZZ
	S06eDkeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Jsd-0000000CZtS-0ZqP;
	Thu, 17 Sep 2026 21:42:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Jsa-0000000CZrE-0s3X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 21:42:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 077951596;
	Thu, 17 Sep 2026 14:42:47 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6697A3F7B4;
	Thu, 17 Sep 2026 14:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789681370; bh=+w+K3RyabmLpuqtKSmYuMaQ4+sQQEcnPLOH8AtHmFDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AilCQqIGPWmkwXPA3QPx47V8r7tEAHPf6dVVvrVNYkx0D8kz9embwVVG34yron5qN
	 i2I1lbxJKB8XfOwNPUVVHJHRuisSAzYgvRiSxjzcSJWimFU4NnzWyT/k12IH/WPYIF
	 we4ZZ5Fy8DTuYiwQKCeKalfh4INCHl64X5r41rAM=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	James Clark <james.clark@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Thomas Huth <thuth@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v2 3/4] KVM: arm64: Reset TCR_EL2 according to guest's E2H mode
Date: Thu, 17 Sep 2026 22:42:13 +0100
Message-ID: <20260917214215.74135-4-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917214215.74135-1-weilin.chang@arm.com>
References: <20260917214215.74135-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_144252_297140_145BFB33 
X-CRM114-Status: GOOD (  12.55  )
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

From: Marc Zyngier <maz@kernel.org>

Previously vCPU TCR_EL2's reset value didn't consider TCR_EL2's
different formats based on the value of HCR_EL2.E2H. It always resets to
the E2H == 0 version.

This didn't cause any problem because the bits set in the E2H == 0
version (TCR_EL2_RES1) all reset to UNKNOWN for E2H == 1 per the
architecture.

Still, it's better to fix it. Choose the correct reset value by checking
KVM_ARM_VCPU_HAS_EL2_E2H0.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/sys_regs.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 44aae52c473d..62c059747fbb 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3275,6 +3275,14 @@ static u64 reset_mdcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
 	return vcpu->kvm->arch.nr_pmu_counters;
 }
 
+static u64 reset_tcr_el2(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
+{
+	__vcpu_assign_sys_reg(vcpu, r->reg,
+			      vcpu_has_feature(vcpu, KVM_ARM_VCPU_HAS_EL2_E2H0) ?
+			      TCR_EL2_RES1 : VHE_TCR_EL2_RES1);
+	return __vcpu_sys_reg(vcpu, r->reg);
+}
+
 /*
  * Architected system registers.
  * Important: Must be sorted ascending by Op0, Op1, CRn, CRm, Op2
@@ -3853,7 +3861,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 
 	EL2_REG(TTBR0_EL2, access_rw, reset_val, 0),
 	EL2_REG(TTBR1_EL2, access_rw, reset_val, 0),
-	EL2_REG(TCR_EL2, access_rw, reset_val, TCR_EL2_RES1),
+	EL2_REG(TCR_EL2, access_rw, reset_tcr_el2, 0),
 	EL2_REG_FILTERED(TCR2_EL2, access_rw, reset_val, TCR2_EL2_RES1,
 			 tcr2_el2_visibility),
 	EL2_REG_VNCR(VTTBR_EL2, reset_val, 0),
-- 
2.43.0


