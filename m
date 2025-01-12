Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E5EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 17:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAKdT9Uz/TeJEigo6rE8LKisdTGwxr5ij6OPJRFo2e8=; b=L4MvEG1A6X8v1kS3wbM2GGr3cm
	1TpxkALGzqyMvo5ysDEIunjVlfO2b3XyRcoil6zErJnJzpfxgpjVKb9h6jfW0MbOC0t2bCP07wyW2
	2aSLgqfXlDtbQwA0aQqCOWoM7jv7jZHDHWbaRp2YiltRao8nILmibQTQbP94oRbxUZwPg5ty6JPz5
	/TTKg0mE++LfpSFzKgab0L0E30XEvA33leVUw+9vvBbIrE6Eh7yxPjBV0e1gxb+Qb9WSbczHXVkTv
	+OQzFZup8Z51lb++/GMOTX7cuGcUaXcIsBh9d/YTAtu2eh3AGf+4tTPZPARy4BhuPXk5+0mejU0C7
	V7rDURpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1oK-00000003Bgz-3DT1;
	Sun, 12 Jan 2025 17:31:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1SJ-000000037iD-3wly
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 17:08:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4D64FA40A94;
	Sun, 12 Jan 2025 17:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E518C4CEE7;
	Sun, 12 Jan 2025 17:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736701733;
	bh=F1t9F1EyfT3+kVUo54s3ABaZEho31ZRJoD7SNJfBbXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xkb0GD/uKSR+Z/LhQNoO4si8eBIfoKsjf7TCCsQqVK0dv1H1mNbK15yz7CkCp043B
	 n26jYLFZh9d0dYtj0XS9005EgOjpohNppYMpLFX3NFbvIDIqgRTsUVn14edurZb0hi
	 QzDWk86hyE3m5Zl9+yDiTL2X3uHEOU4f99uYIx1HKKdXEi7+8PH6ExfZukw+d7tsv8
	 ljQIEfycxzsImzWvc75pMpY7uVlhwXbJ6AFZfOLyMekeTntis3ph199Kbcrv79gzRL
	 bYV8b6hEydSIoUvDcnQku7BYBJsS0czpRIjkNMTdXSYRhM9NFet6LVEvzf5xedFyPh
	 vb1/P+f2TSKyg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tX1SF-00BNxR-Mp;
	Sun, 12 Jan 2025 17:08:51 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 13/17] KVM: arm64: nv: Request vPE doorbell upon nested ERET to L2
Date: Sun, 12 Jan 2025 17:08:41 +0000
Message-Id: <20250112170845.1181891-14-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250112170845.1181891-1-maz@kernel.org>
References: <20250112170845.1181891-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_090856_167097_C80484A9 
X-CRM114-Status: GOOD (  16.72  )
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

From: Oliver Upton <oliver.upton@linux.dev>

Running an L2 guest with GICv4 enabled goes absolutely nowhere, and gets
into a vicious cycle of nested ERET followed by nested exception entry
into the L1.

When KVM does a put on a runnable vCPU, it marks the vPE as nonresident
but does not request a doorbell IRQ. Behind the scenes in the ITS
driver's view of the vCPU, its_vpe::pending_last gets set to true to
indicate that context is still runnable.

This comes to a head when doing the nested ERET into L2. The vPE doesn't
get scheduled on the redistributor as it is exclusively part of the L1's
VGIC context. kvm_vgic_vcpu_pending_irq() returns true because the vPE
appears runnable, and KVM does a nested exception entry into the L1
before L2 ever gets off the ground.

This issue can be papered over by requesting a doorbell IRQ when
descheduling a vPE as part of a nested ERET. KVM needs this anyway to
kick the vCPU out of the L2 when an IRQ becomes pending for the L1.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
Link: https://lore.kernel.org/r/20240823212703.3576061-4-oliver.upton@linux.dev
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  2 ++
 arch/arm64/kvm/emulate-nested.c   |  2 ++
 arch/arm64/kvm/vgic/vgic-v4.c     | 18 +++++++++++++++++-
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index cb969c096d7bd..18d9166761972 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -958,6 +958,8 @@ struct kvm_vcpu_arch {
 #define PMUSERENR_ON_CPU	__vcpu_single_flag(sflags, BIT(4))
 /* WFI instruction trapped */
 #define IN_WFI			__vcpu_single_flag(sflags, BIT(5))
+/* KVM is currently emulating a nested ERET */
+#define IN_NESTED_ERET		__vcpu_single_flag(sflags, BIT(6))
 
 
 /* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index c460b8403aec5..69233dcc81a46 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2434,6 +2434,7 @@ void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
 	}
 
 	preempt_disable();
+	vcpu_set_flag(vcpu, IN_NESTED_ERET);
 	kvm_arch_vcpu_put(vcpu);
 
 	if (!esr_iss_is_eretax(esr))
@@ -2445,6 +2446,7 @@ void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
 	*vcpu_cpsr(vcpu) = spsr;
 
 	kvm_arch_vcpu_load(vcpu, smp_processor_id());
+	vcpu_clear_flag(vcpu, IN_NESTED_ERET);
 	preempt_enable();
 
 	kvm_pmu_nested_transition(vcpu);
diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index eedecbbbcf31b..0d9fb235c0180 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -336,6 +336,22 @@ void vgic_v4_teardown(struct kvm *kvm)
 	its_vm->vpes = NULL;
 }
 
+static inline bool vgic_v4_want_doorbell(struct kvm_vcpu *vcpu)
+{
+	if (vcpu_get_flag(vcpu, IN_WFI))
+		return true;
+
+	if (likely(!vcpu_has_nv(vcpu)))
+		return false;
+
+	/*
+	 * GICv4 hardware is only ever used for the L1. Mark the vPE (i.e. the
+	 * L1 context) nonresident and request a doorbell to kick us out of the
+	 * L2 when an IRQ becomes pending.
+	 */
+	return vcpu_get_flag(vcpu, IN_NESTED_ERET);
+}
+
 int vgic_v4_put(struct kvm_vcpu *vcpu)
 {
 	struct its_vpe *vpe = &vcpu->arch.vgic_cpu.vgic_v3.its_vpe;
@@ -343,7 +359,7 @@ int vgic_v4_put(struct kvm_vcpu *vcpu)
 	if (!vgic_supports_direct_msis(vcpu->kvm) || !vpe->resident)
 		return 0;
 
-	return its_make_vpe_non_resident(vpe, !!vcpu_get_flag(vcpu, IN_WFI));
+	return its_make_vpe_non_resident(vpe, vgic_v4_want_doorbell(vcpu));
 }
 
 int vgic_v4_load(struct kvm_vcpu *vcpu)
-- 
2.39.2


