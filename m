Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55700C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 00:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCoMPlRfFBmeA/v9ZVG+noQNoh4ydolQTyogWdJAVqc=; b=ySldwRomzSi+SPIaWdLTVwgGIL
	iPhPUqyEPLouaQDfrTniID0R6+aqI5Ja/xSMJZolv3OXO3PJV6OWHz3d4ZHf3U7GWzZkR0XCHnDXg
	3NubeNkUv7oowChqIiTVcoKNr5h6YTQsucTEA/GCUfMgjeYXRimyldtipKLBazwEMjSqiyWBQBV6A
	riHvIVn6z3yek1yRlhEg7Q7Pxorctms/vRlS6SXGCh+uQg/vxXhiQC0rgzbltSZp8MWrVoPcedMn4
	S+rVRKd2CdiM7RGzPVFCNfNrHQjLPFBStP30z6FZ0dWdiVSAlUURX4R65wANOeehHeX5mSVL2mffv
	Qj/vw01w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5DJm-0000000BL8K-2k75;
	Thu, 17 Apr 2025 00:41:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5D51-0000000BGqR-1TlH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 00:26:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F176E49D6A;
	Thu, 17 Apr 2025 00:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37FDC4CEE2;
	Thu, 17 Apr 2025 00:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744849571;
	bh=eOsj1jCWW4NCg9AO5C3sxJOfLmPv36kBK4yZbeTlaYE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LglD13EBHLAad4Oq2DoFxnIP2NGieGPSOWLYXBsfZWgGorZcIWoKSZzGBBfvPZhP1
	 3PwImREMwQdqN1Fn/Sw43O6+74JOBxoCejEqznLg0aR8weuZ+8kPewHuPNWiOq1pRg
	 qh3itCIJep/Cb8UcOQ9Y67Vvirod+bV4kkv+hghTRHv2PrvpfJcoBcmAEeas9D+kJp
	 y+AEbSpBb0pjKwFKv7jhmjIoT5i/bkQN6ktgIXQW9HVujxPyl9lNHcTK/5UsiZ7xq2
	 Edxxhfk0zD3YxIPRznckFWlPSC0FdJ0yPczRJRagHpj/0LgbQTEC5VwVGKj9RaSUZL
	 G/aOQS7YUJrNg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 17 Apr 2025 01:25:11 +0100
Subject: [PATCH v5 07/28] KVM: arm64: Pull ctxt_has_ helpers to start of
 sysreg-sr.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-kvm-arm64-sme-v5-7-f469a2d5f574@kernel.org>
References: <20250417-kvm-arm64-sme-v5-0-f469a2d5f574@kernel.org>
In-Reply-To: <20250417-kvm-arm64-sme-v5-0-f469a2d5f574@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3287; i=broonie@kernel.org;
 h=from:subject:message-id; bh=eOsj1jCWW4NCg9AO5C3sxJOfLmPv36kBK4yZbeTlaYE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoAEp0zUroL/kjbbNM9CiQy/D5jh5Xnvdv0HBSqz+p
 /pPd1wyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaABKdAAKCRAk1otyXVSH0BF9B/
 kBa4+iFGPD4jkJSIMF80lCYQHuVs59Gf7q8xDIp4KekNG8hy1pHNg8rOoPegq+8C5kCY9+zOoIdbRn
 CtT8iEfUf6NVDzeoOhUNKD3yhdCXUVFhWcGUZZSFnZUPtgGvx/OmjQt0NBjzCmNFBkl+ETUSgEHjiS
 O2kedJUqt/iFuTNfU/vLUMem4bdB995Hq5vqmfa0/BFiC2jDKDsr5wP07UVOhNIuSyr2E+snhpdTcV
 PsDvXqK5pf9FtIEEBUm1a+82zeuG79tttK05cjvZ5qDL+dHDlNLXdWOAsEAc9vgnIcabunWzmhSVb0
 OT9cBJbUT9kSLm4OcRYkkUshWPxcSg
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_172611_437143_5EDAE8BA 
X-CRM114-Status: GOOD (  10.71  )
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

Rather than add earlier prototypes of specific ctxt_has_ helpers let's just
pull all their definitions to the top of sysreg-sr.h so they're all
available to all the individual save/restore functions.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 82 +++++++++++++++---------------
 1 file changed, 40 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index b9cff893bbe0..b795a7a87a93 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -16,8 +16,6 @@
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
 
-static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt);
-
 static inline struct kvm_vcpu *ctxt_to_vcpu(struct kvm_cpu_context *ctxt)
 {
 	struct kvm_vcpu *vcpu = ctxt->__hyp_running_vcpu;
@@ -28,6 +26,46 @@ static inline struct kvm_vcpu *ctxt_to_vcpu(struct kvm_cpu_context *ctxt)
 	return vcpu;
 }
 
+static inline bool ctxt_has_mte(struct kvm_cpu_context *ctxt)
+{
+	struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
+
+	return kvm_has_mte(kern_hyp_va(vcpu->kvm));
+}
+
+static inline bool ctxt_has_s1pie(struct kvm_cpu_context *ctxt)
+{
+	struct kvm_vcpu *vcpu;
+
+	if (!cpus_have_final_cap(ARM64_HAS_S1PIE))
+		return false;
+
+	vcpu = ctxt_to_vcpu(ctxt);
+	return kvm_has_s1pie(kern_hyp_va(vcpu->kvm));
+}
+
+static inline bool ctxt_has_tcrx(struct kvm_cpu_context *ctxt)
+{
+	struct kvm_vcpu *vcpu;
+
+	if (!cpus_have_final_cap(ARM64_HAS_TCR2))
+		return false;
+
+	vcpu = ctxt_to_vcpu(ctxt);
+	return kvm_has_tcr2(kern_hyp_va(vcpu->kvm));
+}
+
+static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt)
+{
+	struct kvm_vcpu *vcpu;
+
+	if (!system_supports_poe())
+		return false;
+
+	vcpu = ctxt_to_vcpu(ctxt);
+	return kvm_has_s1poe(kern_hyp_va(vcpu->kvm));
+}
+
 static inline bool ctxt_is_guest(struct kvm_cpu_context *ctxt)
 {
 	return host_data_ptr(host_ctxt) != ctxt;
@@ -69,46 +107,6 @@ static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
 	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
 }
 
-static inline bool ctxt_has_mte(struct kvm_cpu_context *ctxt)
-{
-	struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
-
-	return kvm_has_mte(kern_hyp_va(vcpu->kvm));
-}
-
-static inline bool ctxt_has_s1pie(struct kvm_cpu_context *ctxt)
-{
-	struct kvm_vcpu *vcpu;
-
-	if (!cpus_have_final_cap(ARM64_HAS_S1PIE))
-		return false;
-
-	vcpu = ctxt_to_vcpu(ctxt);
-	return kvm_has_s1pie(kern_hyp_va(vcpu->kvm));
-}
-
-static inline bool ctxt_has_tcrx(struct kvm_cpu_context *ctxt)
-{
-	struct kvm_vcpu *vcpu;
-
-	if (!cpus_have_final_cap(ARM64_HAS_TCR2))
-		return false;
-
-	vcpu = ctxt_to_vcpu(ctxt);
-	return kvm_has_tcr2(kern_hyp_va(vcpu->kvm));
-}
-
-static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt)
-{
-	struct kvm_vcpu *vcpu;
-
-	if (!system_supports_poe())
-		return false;
-
-	vcpu = ctxt_to_vcpu(ctxt);
-	return kvm_has_s1poe(kern_hyp_va(vcpu->kvm));
-}
-
 static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
 {
 	ctxt_sys_reg(ctxt, SCTLR_EL1)	= read_sysreg_el1(SYS_SCTLR);

-- 
2.39.5


