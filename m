Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE8FC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 18:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=peufBsqUzeME7VeF21NLhtNCPRlY3WOFf7LudAWksYI=; b=ZqzOAsI3k2PWbQkt8gN4t5MJ0i
	TxHa6UZDIloumiNIoo7xyfB2gaQxbB6ImEXJkglQy39zgyXIlt23OpsMIhNsxA6gGm2y7jCUwqJa4
	N2qe1j7F0BHEm0yGcrSREuUPJMfIH3HLSccguR/TyVeOXIs7PJJR5WD8KTxXtovT59BF8e21d+spA
	yBtzGFKCo7rqrMDyPe0nO9wOLKkBqHGSCa5vr1dRAtFPurt6qtoEw/qXbAAzSiooW+3p5kv5rg1pF
	8Ccdi/Fzmpl1PYW/0/UHpwdwi/XuzFO6estOnyOobyiPLMWwxa3tGNsZebdMSOdcvLPG2ZMQfDhGb
	2o6WxXwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzg3-00000000vwl-40fq;
	Tue, 25 Feb 2025 18:29:07 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyke-00000000eBY-43eT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:29:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7944D612DB;
	Tue, 25 Feb 2025 17:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3238FC4CEE8;
	Tue, 25 Feb 2025 17:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740504588;
	bh=ScLfH9JCdakxFSIYbsxrMFuSUWUanHf/RQHVMVBJ67Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L9/vMZGVMRvIX5vSwF20iBu3E/4YII6Nlt3AevDzdXbQTZ3E2qT31LPhj78ipCK8q
	 J0WKT5E9KxAiz4bFiA9Md5cHS6zXep6hRNTCE+DUlmQE56Eo6cZkryBcZz8kjquQZq
	 OIwvecw8yXDh1mDEi0EUJw2lcka9VC5lcip6NFDQOQrb25xQksO+zbbpbnEVtoNQhM
	 u9aMf/EGk2JEAeR/guAwA+lIMWGLpaYV1ijBH2VGaGjPSlfXOq61wLL0CTUfJ3Fw76
	 3bjI2US53Tzv8FBlH655gW1K15rb3rmiCkoef9kJQpcpPX69PiG0VoiAC8ZonNz9Mf
	 +pOucL4l+3MdQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tmykc-007rKs-Fj;
	Tue, 25 Feb 2025 17:29:46 +0000
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
Subject: [PATCH v4 14/16] KVM: arm64: nv: Fold GICv3 host trapping requirements into guest setup
Date: Tue, 25 Feb 2025 17:29:28 +0000
Message-Id: <20250225172930.1850838-15-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250225172930.1850838-1-maz@kernel.org>
References: <20250225172930.1850838-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Popular HW that is able to use NV also has a broken vgic implementation
that requires trapping.

On such HW, propagate the host trap bits into the guest's shadow
ICH_HCR_EL2 register, making sure we don't allow an L2 guest to bring
the system down.

This involves a bit of tweaking so that the emulation code correctly
poicks up the shadow state as needed, and to only partially sync
ICH_HCR_EL2 back with the guest state to capture EOIcount.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v3-nested.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
index 643bd8a8e0669..5350a4650b7a5 100644
--- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
+++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
@@ -296,9 +296,19 @@ static void vgic_v3_create_shadow_state(struct kvm_vcpu *vcpu,
 					struct vgic_v3_cpu_if *s_cpu_if)
 {
 	struct vgic_v3_cpu_if *host_if = &vcpu->arch.vgic_cpu.vgic_v3;
+	u64 val = 0;
 	int i;
 
-	s_cpu_if->vgic_hcr = __vcpu_sys_reg(vcpu, ICH_HCR_EL2);
+	/*
+	 * If we're on a system with a broken vgic that requires
+	 * trapping, propagate the trapping requirements.
+	 *
+	 * Ah, the smell of rotten fruits...
+	 */
+	if (static_branch_unlikely(&vgic_v3_cpuif_trap))
+		val = host_if->vgic_hcr & (ICH_HCR_EL2_TALL0 | ICH_HCR_EL2_TALL1 |
+					   ICH_HCR_EL2_TC | ICH_HCR_EL2_TDIR);
+	s_cpu_if->vgic_hcr = __vcpu_sys_reg(vcpu, ICH_HCR_EL2) | val;
 	s_cpu_if->vgic_vmcr = __vcpu_sys_reg(vcpu, ICH_VMCR_EL2);
 	s_cpu_if->vgic_sre = host_if->vgic_sre;
 
@@ -335,6 +345,7 @@ void vgic_v3_put_nested(struct kvm_vcpu *vcpu)
 {
 	struct shadow_if *shadow_if = get_shadow_if();
 	struct vgic_v3_cpu_if *s_cpu_if = &shadow_if->cpuif;
+	u64 val;
 	int i;
 
 	__vgic_v3_save_vmcr_aprs(s_cpu_if);
@@ -345,7 +356,10 @@ void vgic_v3_put_nested(struct kvm_vcpu *vcpu)
 	 * Translate the shadow state HW fields back to the virtual ones
 	 * before copying the shadow struct back to the nested one.
 	 */
-	__vcpu_sys_reg(vcpu, ICH_HCR_EL2) = s_cpu_if->vgic_hcr;
+	val = __vcpu_sys_reg(vcpu, ICH_HCR_EL2);
+	val &= ~ICH_HCR_EL2_EOIcount_MASK;
+	val |= (s_cpu_if->vgic_hcr & ICH_HCR_EL2_EOIcount_MASK);
+	__vcpu_sys_reg(vcpu, ICH_HCR_EL2) = val;
 	__vcpu_sys_reg(vcpu, ICH_VMCR_EL2) = s_cpu_if->vgic_vmcr;
 
 	for (i = 0; i < 4; i++) {
@@ -354,7 +368,7 @@ void vgic_v3_put_nested(struct kvm_vcpu *vcpu)
 	}
 
 	for_each_set_bit(i, &shadow_if->lr_map, kvm_vgic_global_state.nr_lr) {
-		u64 val = __vcpu_sys_reg(vcpu, ICH_LRN(i));
+		val = __vcpu_sys_reg(vcpu, ICH_LRN(i));
 
 		val &= ~ICH_LR_STATE;
 		val |= s_cpu_if->vgic_lr[i] & ICH_LR_STATE;
-- 
2.39.2


