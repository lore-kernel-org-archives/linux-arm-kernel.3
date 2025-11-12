Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE29CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O3gdRv+IEcoOG6OhlbkbXTJD962qpB5cm5YVoerenkI=; b=2eM4FbE9W9kaNK0boXrjG6UC/P
	GAInxkAgAlb75rObiLJZ3zxICp0J0SzMlGT2+k4ov87nY98X3zyuVTJcmDyDcTIJMhpb1yzzwoK3J
	4RWKKMjBCQ4ugBqyjcV3IlkC7OMtMf/wjegkKwghdImIHimgotFuQ9PevRM+rJ5wWfvmMDsB6RfGi
	CbGfws+Q/Xm8n53Qs8ztuRXaAqD0dU8StoTdtwR1ewwKO9qoH8LyN7tqkGIOlCTk55xAqyzuWpLzU
	sTGomX+kjCt7JNwyrDbnpwmSXJTw9FCIG1krldBslBRvQb4Pj+A7HmDabZmpm0FQ55AdICsMexjfb
	oMollC0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86j-00000008ZfT-1qiS;
	Wed, 12 Nov 2025 10:29:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86Y-00000008ZO7-2eOe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:29:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF93C1515;
	Wed, 12 Nov 2025 02:29:23 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A1DD3F5A1;
	Wed, 12 Nov 2025 02:29:30 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH] KVM: arm64: VHE: Compute fgt traps before activating them
Date: Wed, 12 Nov 2025 10:28:53 +0000
Message-ID: <20251112102853.47759-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_022934_806889_5F6FA31A 
X-CRM114-Status: GOOD (  14.75  )
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

On VHE, the Fine Grain Traps registers are written to hardware in
kvm_arch_vcpu_load()->..->__activate_traps_hfgxtr(), but the fgt array is
computed later, in kvm_vcpu_load_fgt(). This can lead to zero being written
to the FGT registers the first time a VCPU is loaded. Also, any changes to
the fgt array will be visible only after the VCPU is scheduled out, and
then back in, which is not the intended behaviour.

Fix it by computing the fgt array just before the fgt traps are written
to hardware.

Fixes: fb10ddf35c1c ("KVM: arm64: Compute per-vCPU FGTs at vcpu_load()")
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---

Stumbled upon this when running a Linux guest on FVP with FEAT_S1PIE
enabled.  Linux touches PIRE0_EL1 very early during boot, in __cpu_setup().
HFGWTR_EL2 was 0 the first time the VCPU was run, KVM would then trap
the access to PIR0_EL1 (PIRE0_EL1 is an inverted trap) and trigger the
BUG_ON(!r->access) from perform_access().

I hacked __activate_traps_hfgxtr() to print the register value for
HFGWTR_EL2. Before this patch, during the first vcpu_load(),
HFGWTR_EL2 is 0, then it has the correct value. After this patch, it
always has the correct value.

If I were to venture a shot in the dark, it might be that the name is a bit
misleading - it's kvm_vpcu_load_fgt(), but it doesn't load anything onto
hardware, it just computes values. Might be worth renaming to avoid
similar ordering issues in the future.

 arch/arm64/kvm/arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 870953b4a8a7..052bf0d4d0b0 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -624,6 +624,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	kvm_timer_vcpu_load(vcpu);
 	kvm_vgic_load(vcpu);
 	kvm_vcpu_load_debug(vcpu);
+	kvm_vcpu_load_fgt(vcpu);
 	if (has_vhe())
 		kvm_vcpu_load_vhe(vcpu);
 	kvm_arch_vcpu_load_fp(vcpu);
@@ -642,7 +643,6 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		vcpu->arch.hcr_el2 |= HCR_TWI;
 
 	vcpu_set_pauth_traps(vcpu);
-	kvm_vcpu_load_fgt(vcpu);
 
 	if (is_protected_kvm_enabled()) {
 		kvm_call_hyp_nvhe(__pkvm_vcpu_load,

base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
-- 
2.51.2


