Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43B4C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 11:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8VTKwohKu3aYbb2IZNHFDqdfV+6CASGqsmMHwsa48k=; b=4tF15fUlyIpitehtdFdeotzkA0
	NGSoxoUOfiSo0cq8t2RGT6svPGWWKub/csSCAszJfXKgVKj3xCYsOuHDEFBJQXUDrVVnNCs+DtkPH
	FpSLORJriSSN4pGN9pM9Wzu+qaza5Yok6hQK3KrNsGYL5nFieBJn2AfI+/N+NC3Qt0fyrrXI/pFWO
	RhQdqy59F/PmkI2mKFy6D6TJpsTXX4J7GFyMSsjjs4SgUDIxLTKVFAcDqX0IA6g98S4BewtGxvyy4
	1sfV8RAPOMNv1+QhN5psZFk07QaWD7sj4mZfH2AJUPJTB1P9R0LUHMB2UpKT5oEfim+Q1X9TAa53E
	kZgXMZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udorc-0000000H7UD-3mGw;
	Mon, 21 Jul 2025 11:39:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udncu-0000000Gwl7-3ILH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 10:20:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F96D6020A;
	Mon, 21 Jul 2025 10:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C84B4C4CEF7;
	Mon, 21 Jul 2025 10:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753093207;
	bh=9bgiKIult709oiE+EtcY/T7jIr6TWwlF9z0Jm8sNTgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qHuxt4a9raxsIjMnRRxOdkiUKnyzHO2F8WoEKJEeby10ZA3bzbQG8bizpBD8QoGFo
	 GxRC8CAcUwd8nxiR/mKaRL2vjAdnq/TBYr9xhaANO7HkZaPZz1801tWhS8LLi3AWZF
	 JrtR1hDGyLeJZcFklJiQRgdvG7t+yAtfhrJYb3jd2XkGB3Htwm/w35A6jje8Bm9xDk
	 r2iWUCZhbi25ABCDUsCBXhtD3qie+5IkgEe7UzfUyaSLiTkS4pgTQYP+6ijvB4YvGb
	 JYlxyB1QjpLY6XRFw7xJ1iMvT69zFv+FPIfaPBNbc6Bqlgc8pypntecxpvZ5UtmIph
	 HBN3j0odV8gew==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1udncr-00HZDF-Qk;
	Mon, 21 Jul 2025 11:20:05 +0100
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
	stable@vger.kernel.org
Subject: [PATCH 2/7] KVM: arm64: Filter out HCR_EL2 bits when running in hypervisor context
Date: Mon, 21 Jul 2025 11:19:50 +0100
Message-Id: <20250721101955.535159-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250721101955.535159-1-maz@kernel.org>
References: <20250721101955.535159-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com, stable@vger.kernel.org
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

Most HCR_EL2 bits are not supposed to affect EL2 at all, but only
the guest. However, we gladly merge these bits with the host's
HCR_EL2 configuration, irrespective of entering L1 or L2.

This leads to some funky behaviour, such as L1 trying to inject
a virtual SError for L2, and getting a taste of its own medecine.
Not quite what the architecture anticipated.

In the end, the only bits that matter are those we have defined as
invariants, either because we've made them RESx (E2H, HCD...), or
that we actively refuse to merge because the mess with KVM's own
logic.

Use the sanitisation infrastructure to get the RES1 bits, and let
things rip in a safer way.

Fixes: 04ab519bb86df ("KVM: arm64: nv: Configure HCR_EL2 for FEAT_NV2")
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kvm/hyp/vhe/switch.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 477f1580ffeaa..e482181c66322 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -48,8 +48,7 @@ DEFINE_PER_CPU(unsigned long, kvm_hyp_vector);
 
 static u64 __compute_hcr(struct kvm_vcpu *vcpu)
 {
-	u64 guest_hcr = __vcpu_sys_reg(vcpu, HCR_EL2);
-	u64 hcr = vcpu->arch.hcr_el2;
+	u64 guest_hcr, hcr = vcpu->arch.hcr_el2;
 
 	if (!vcpu_has_nv(vcpu))
 		return hcr;
@@ -68,10 +67,21 @@ static u64 __compute_hcr(struct kvm_vcpu *vcpu)
 		if (!vcpu_el2_e2h_is_set(vcpu))
 			hcr |= HCR_NV1;
 
+		/*
+		 * Nothing in HCR_EL2 should impact running in hypervisor
+		 * context, apart from bits we have defined as RESx (E2H,
+		 * HCD and co), or that cannot be set directly (the EXCLUDE
+		 * bits). Given that we OR the guest's view with the host's,
+		 * we can use the 0 value as the starting point, and only
+		 * use the config-driven RES1 bits.
+		 */
+		guest_hcr = kvm_vcpu_apply_reg_masks(vcpu, HCR_EL2, 0);
+
 		write_sysreg_s(vcpu->arch.ctxt.vncr_array, SYS_VNCR_EL2);
 	} else {
 		host_data_clear_flag(VCPU_IN_HYP_CONTEXT);
 
+		guest_hcr = __vcpu_sys_reg(vcpu, HCR_EL2);
 		if (guest_hcr & HCR_NV) {
 			u64 va = __fix_to_virt(vncr_fixmap(smp_processor_id()));
 
-- 
2.39.2


