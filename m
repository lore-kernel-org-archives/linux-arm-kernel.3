Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E79C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 11:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/szdd2sngXXXi2lW6Meob8K4cOji79iOlyDy5dvpqnc=; b=pCMbOh2xlfh01I3YATc01RQhiC
	oMpHc2O9qx1HHfq8sV7CKFgWttf++3vMXEm+Z4JpVZy4tPGp3VunEifGwGhi9iEh3Z3JPKw57F2TR
	yD9Odh303l/wUIQHES2YldVSauZu7s6Yir1CFpuUauxVGJUPocOYfWinjlkYNbJpcy9g7KWF7+ae2
	AAqghU59HT48akE0xxTl2LMMGvyUeJbg05reBsUXw1rVBHVlOrNQPRU3nkoX7rKatJYI1HC0CfsvI
	yWJRRBeYGkAyVmyxpbvGxfKpC9skNUTWpFR7uCouP/3ppJs4T9iVA4MaberBj3s5B/c3McR7CJys4
	mS2R6PwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjLy-0000000CTnw-3Nrz;
	Fri, 18 Jul 2025 11:34:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucj0k-0000000CPBl-2DFi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 11:12:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6CB79A56F43;
	Fri, 18 Jul 2025 11:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D04AC4CEEB;
	Fri, 18 Jul 2025 11:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752837137;
	bh=n/axFc2QmqJ/f05WQ9SbxLtmn/ojktUTYjQymh5s7Sw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QmUVK2AB9ZreR0lKtb17Aha4agZQaoG6oIlFpMJXD/unXo7lpODQ9GiaPlNqV9FHr
	 KoCeByobyBa5r1P/9fuZGzhPKTg6/2iwlACgZwH/hFWoiTlFH3+V5nLORInM33ouVP
	 k0An57Uj0wquilG+dUUlodx+SP8wqn76IvgF+Pp/+hD7hYbWwNSopybDbyS71baWjD
	 RvAjXm3zpsWI222HVPxsrgglURgKgYcYCO/NPuTXIqk8CAM9WeuT3AsUhcLUP23jNY
	 D0l+oSbCJUUJ3TbgYJKSISYa0PFH9HvDwA6iyEi7Kr9y6Y7fq84eWZ3bd49Ek3yeBC
	 fB42tUvtxv48g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ucj0h-00Gt2B-40;
	Fri, 18 Jul 2025 12:12:15 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 3/4] KVM: arm64: Enforce the sorting of the GICv3 system register table
Date: Fri, 18 Jul 2025 12:11:53 +0100
Message-Id: <20250718111154.104029-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250718111154.104029-1-maz@kernel.org>
References: <20250718111154.104029-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_041218_702135_E2A1B80A 
X-CRM114-Status: GOOD (  12.58  )
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

In order to avoid further embarassing bugs, enforce that the GICv3
sysreg table is actually sorted, just like all the other tables.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c        | 6 +++++-
 arch/arm64/kvm/vgic-sys-reg-v3.c | 6 ++++++
 arch/arm64/kvm/vgic/vgic.h       | 1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index f8b10966d0c3e..9d8c47e706b96 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5329,8 +5329,9 @@ int kvm_finalize_sys_regs(struct kvm_vcpu *vcpu)
 
 int __init kvm_sys_reg_table_init(void)
 {
+	const struct sys_reg_desc *gicv3_regs;
 	bool valid = true;
-	unsigned int i;
+	unsigned int i, sz;
 	int ret = 0;
 
 	/* Make sure tables are unique and in order. */
@@ -5341,6 +5342,9 @@ int __init kvm_sys_reg_table_init(void)
 	valid &= check_sysreg_table(cp15_64_regs, ARRAY_SIZE(cp15_64_regs), false);
 	valid &= check_sysreg_table(sys_insn_descs, ARRAY_SIZE(sys_insn_descs), false);
 
+	gicv3_regs = vgic_v3_get_sysreg_table(&sz);
+	valid &= check_sysreg_table(gicv3_regs, sz, false);
+
 	if (!valid)
 		return -EINVAL;
 
diff --git a/arch/arm64/kvm/vgic-sys-reg-v3.c b/arch/arm64/kvm/vgic-sys-reg-v3.c
index 1850f1727eb93..bdc2d57370b27 100644
--- a/arch/arm64/kvm/vgic-sys-reg-v3.c
+++ b/arch/arm64/kvm/vgic-sys-reg-v3.c
@@ -443,6 +443,12 @@ static const struct sys_reg_desc gic_v3_icc_reg_descs[] = {
 	EL2_REG(ICH_LR15_EL2, ich_reg),
 };
 
+const struct sys_reg_desc *vgic_v3_get_sysreg_table(unsigned int *sz)
+{
+	*sz = ARRAY_SIZE(gic_v3_icc_reg_descs);
+	return gic_v3_icc_reg_descs;
+}
+
 static u64 attr_to_id(u64 attr)
 {
 	return ARM64_SYS_REG(FIELD_GET(KVM_REG_ARM_VGIC_SYSREG_OP0_MASK, attr),
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index 5fe554d40c8ef..6ea817d8a804a 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -315,6 +315,7 @@ int vgic_v3_redist_uaccess(struct kvm_vcpu *vcpu, bool is_write,
 int vgic_v3_cpu_sysregs_uaccess(struct kvm_vcpu *vcpu,
 				struct kvm_device_attr *attr, bool is_write);
 int vgic_v3_has_cpu_sysregs_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
+const struct sys_reg_desc *vgic_v3_get_sysreg_table(unsigned int *sz);
 int vgic_v3_line_level_info_uaccess(struct kvm_vcpu *vcpu, bool is_write,
 				    u32 intid, u32 *val);
 int kvm_register_vgic_device(unsigned long type);
-- 
2.39.2


