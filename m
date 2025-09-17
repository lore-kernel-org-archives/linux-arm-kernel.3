Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F080CCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 16:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1cwEzp++MXHheWvuUQbMtki7+6mgkNFLjSCBB8xlfLE=; b=mobS/ZMwEB3gpZYlu71X458VnK
	MZqWilmLWE31obP1QNEGDHpNYp6bXIS0h0rQv66bqp3f/quyc2Wn4GZpmcLYwPjleaJ8Y/qDq+NGF
	MukUlMLkIz/n2/IH8ww+kG+2Vb01uowYf14dhllWfmRyDs3DdnK4ODHKiMWLP9oZO3OJySbWKNcWg
	0ToW+4tJMoSKFCWRxhsLLPlhaWKeBq1izSOdLJEg7ve5L6bq48aO0bF0Og0DgQ+qFt3czNDsQjEfA
	fJB8LTcm6He1ZtgYqG2T3d2MMnqo5JehCxJEWrFbaOWTcIhj389IxNu4pPtc2T8RrLRX19KZZaZ1t
	D4JCYKpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyusj-0000000D630-2CFd;
	Wed, 17 Sep 2025 16:19:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyush-0000000D61E-1gnm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 16:19:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C8F643680;
	Wed, 17 Sep 2025 16:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF6B1C4CEE7;
	Wed, 17 Sep 2025 16:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758125982;
	bh=yrT13gddazNWzpKILY32FF9cW6yTtx5tbKiQROUpzww=;
	h=From:To:Cc:Subject:Date:From;
	b=P1OkGDGYUrawyGfQ261kRY5ps7C0+2NkR62LcT52UTLl4mAwBBENJbAyilBIt6H6F
	 2mhb3TN0HNN4j+9sWQI/klhEM01aC2grwBmohg+s1TXVtzNIMsBP4cQeoLaVk9i5m2
	 aYRnmWToTCyHuDKFwF4ifIyQuCJ7bCMn7UF5j7KNwwwnxHIYD6XQxHvkaX/w0KhOhO
	 Z1F7JRR2QOX/KgrhZP85YlBAq3ZnlxyD4mU2OeD+UqOc4lKxeWRS6xNOn561v6krJk
	 vOtEpCRcU2v8Pn5M2LYOgNt6WQSRJSgC7wyYWSqqRQnRT4gAW+/ZF7NDYKSFLjLEFi
	 EskLAL/yDbIGQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uyusd-000000079Zn-46Em;
	Wed, 17 Sep 2025 16:19:40 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH] KVM: arm64: Don't access ICC_SRE_EL2 if GICv3 doesn't support v2 compatibility
Date: Wed, 17 Sep 2025 17:19:35 +0100
Message-Id: <20250917161935.1630908-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_091943_487333_894F1CA4 
X-CRM114-Status: GOOD (  21.76  )
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

We currently access ICC_SRE_EL2 at each load/put on VHE, and on each
entry/exit on nVHE. Both are quite onerous on NV, as this register
always traps.

We do this to make sure the EL1 guest doesn't flip between v2 and v3
behind our back. But all modern implementations have dropped v2,
and this is just overhead.

At the same time, the GICv5 spec has been fixed to allow access to
ICC_SRE_EL2 in legacy mode. Use this opportunity to replace the
GICv5 checks for v2 compat checks, with an ad-hoc static key.

Co-developed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/image-vars.h  |  3 +++
 arch/arm64/kvm/hyp/vgic-v3-sr.c | 25 +++++++++----------------
 arch/arm64/kvm/vgic/vgic-v3.c   |  8 ++++++++
 include/kvm/arm_vgic.h          |  1 +
 4 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 714b0b5ec5ac4..5369763606e71 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -105,6 +105,9 @@ KVM_NVHE_ALIAS(__hyp_stub_vectors);
 KVM_NVHE_ALIAS(vgic_v2_cpuif_trap);
 KVM_NVHE_ALIAS(vgic_v3_cpuif_trap);
 
+/* Static key indicating whether GICv3 has GICv2 compatibility */
+KVM_NVHE_ALIAS(vgic_v3_has_v2_compat);
+
 /* Static key which is set if CNTVOFF_EL2 is unusable */
 KVM_NVHE_ALIAS(broken_cntvoff_key);
 
diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
index d81275790e69b..acd909b7f2257 100644
--- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
+++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
@@ -295,12 +295,8 @@ void __vgic_v3_activate_traps(struct vgic_v3_cpu_if *cpu_if)
 		}
 	}
 
-	/*
-	 * GICv5 BET0 FEAT_GCIE_LEGACY doesn't include ICC_SRE_EL2. This is due
-	 * to be relaxed in a future spec release, at which point this in
-	 * condition can be dropped.
-	 */
-	if (!cpus_have_final_cap(ARM64_HAS_GICV5_CPUIF)) {
+	/* Only disable SRE if the host implements the GICv2 interface */
+	if (static_branch_unlikely(&vgic_v3_has_v2_compat)) {
 		/*
 		 * Prevent the guest from touching the ICC_SRE_EL1 system
 		 * register. Note that this may not have any effect, as
@@ -329,19 +325,16 @@ void __vgic_v3_deactivate_traps(struct vgic_v3_cpu_if *cpu_if)
 		cpu_if->vgic_vmcr = read_gicreg(ICH_VMCR_EL2);
 	}
 
-	/*
-	 * Can be dropped in the future when GICv5 spec is relaxed. See comment
-	 * above.
-	 */
-	if (!cpus_have_final_cap(ARM64_HAS_GICV5_CPUIF)) {
+	/* Only restore SRE if the host implements the GICv2 interface */
+	if (static_branch_unlikely(&vgic_v3_has_v2_compat)) {
 		val = read_gicreg(ICC_SRE_EL2);
 		write_gicreg(val | ICC_SRE_EL2_ENABLE, ICC_SRE_EL2);
-	}
 
-	if (!cpu_if->vgic_sre) {
-		/* Make sure ENABLE is set at EL2 before setting SRE at EL1 */
-		isb();
-		write_gicreg(1, ICC_SRE_EL1);
+		if (!cpu_if->vgic_sre) {
+			/* Make sure ENABLE is set at EL2 before setting SRE at EL1 */
+			isb();
+			write_gicreg(1, ICC_SRE_EL1);
+		}
 	}
 
 	/*
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index b9ad7c42c5b01..f1c153106c563 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -588,6 +588,7 @@ int vgic_v3_map_resources(struct kvm *kvm)
 }
 
 DEFINE_STATIC_KEY_FALSE(vgic_v3_cpuif_trap);
+DEFINE_STATIC_KEY_FALSE(vgic_v3_has_v2_compat);
 
 static int __init early_group0_trap_cfg(char *buf)
 {
@@ -697,6 +698,13 @@ int vgic_v3_probe(const struct gic_kvm_info *info)
 	if (kvm_vgic_global_state.vcpu_base == 0)
 		kvm_info("disabling GICv2 emulation\n");
 
+	/*
+	 * Flip the static branch if the HW supports v2, even if we're
+	 * not using it (such as in protected mode).
+	 */
+	if (has_v2)
+		static_branch_enable(&vgic_v3_has_v2_compat);
+
 	if (cpus_have_final_cap(ARM64_WORKAROUND_CAVIUM_30115)) {
 		group0_trap = true;
 		group1_trap = true;
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 404883c7af6e8..9a6340d9c91e5 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -375,6 +375,7 @@ struct vgic_cpu {
 
 extern struct static_key_false vgic_v2_cpuif_trap;
 extern struct static_key_false vgic_v3_cpuif_trap;
+extern struct static_key_false vgic_v3_has_v2_compat;
 
 int kvm_set_legacy_vgic_v2_addr(struct kvm *kvm, struct kvm_arm_device_addr *dev_addr);
 void kvm_vgic_early_init(struct kvm *kvm);
-- 
2.39.2


