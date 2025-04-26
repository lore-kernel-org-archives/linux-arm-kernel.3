Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E4BC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 13:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/EAfIUFJ6RAXQq4tXZBRiYXG3t1yfiylnM0BPTs+jo=; b=AB3XFWKI6IH/IZVMvho7LCh5Pk
	iMTYgN3naSB79U6A/lDD+XQydlbWE9C4IPLJoMDQ3NZ42sCRf0amg5Da9jn2s6G7w1ueClDdD9s7F
	LqTscgMvCwC1wLaUpCkap0P5M2VGpSkmwKyYzUnnTvWOVlLSLOIcZDaR1RZyYOC1yKGMD7nx7M/da
	PNThobm8Ctwpw9FG/il8+ApPufFs221NbkbzXl39mQofVYxdP0TXulp08EiLF7K0IVm7KaUdVorEb
	sRS+q+X1UIKQoaG2DyPBBLI029LONmEFUlpT9iVbkX+b1LSZOqz9BFWJMTnDrOx4EJ4gxWwZIcWA8
	06p22NyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8f9f-000000022iN-2bPJ;
	Sat, 26 Apr 2025 13:01:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eeO-00000001z31-3WTy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:28:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 749BD6848F;
	Sat, 26 Apr 2025 12:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2112C4CEE2;
	Sat, 26 Apr 2025 12:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670536;
	bh=az6H4zS7ATnhB2/Y37RrSzyGkoU47BWde5sQBxqx5Wo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MlWCnSt/blK9gmqvd5kiergQjCvBmOKA+/NLVb4MKyWlCdvAIde8HA1CysjFJD3qQ
	 ljqWtlWiehQY/utnH7LnYPpHyIe4yffVHoElUhbLLZqmINmgP8Nv/QF9k9Un+SvUhl
	 J3TRoq2ZqrauACOmWT87AI0w1+ZVT57izWdCpdUyC9KyafYkCDCcQs38idWXA9vfV3
	 /5IKxjDMBg6e+762alZyN6Yn498dmNukHGxjamxjXAkSm/Smg+qh2hr+pPKSld5Q4O
	 7nw0fHtULDvECrEQ5i9oJKhia7qKHGrkKE8x60jfil/IU/q6LcxFpDCp2woHrAsFAR
	 Tu3zSpNGTnHrg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeM-0092VH-49;
	Sat, 26 Apr 2025 13:28:54 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 20/42] KVM: arm64: Plug FEAT_GCS handling
Date: Sat, 26 Apr 2025 13:28:14 +0100
Message-Id: <20250426122836.3341523-21-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250426122836.3341523-1-maz@kernel.org>
References: <20250426122836.3341523-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
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

We don't seem to be handling the GCS-specific exception class.
Handle it by delivering an UNDEF to the guest, and populate the
relevant trap bits.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/handle_exit.c | 11 +++++++++++
 arch/arm64/kvm/sys_regs.c    |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 636c14ed2bb82..eafbd2a243afd 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -298,6 +298,16 @@ static int handle_svc(struct kvm_vcpu *vcpu)
 	return 1;
 }
 
+static int kvm_handle_gcs(struct kvm_vcpu *vcpu)
+{
+	/* We don't expect GCS, so treat it with contempt */
+	if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, GCS, IMP))
+		WARN_ON_ONCE(1);
+
+	kvm_inject_undefined(vcpu);
+	return 1;
+}
+
 static int handle_other(struct kvm_vcpu *vcpu)
 {
 	bool is_l2 = vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu);
@@ -380,6 +390,7 @@ static exit_handle_fn arm_exit_handlers[] = {
 	[ESR_ELx_EC_BRK64]	= kvm_handle_guest_debug,
 	[ESR_ELx_EC_FP_ASIMD]	= kvm_handle_fpasimd,
 	[ESR_ELx_EC_PAC]	= kvm_handle_ptrauth,
+	[ESR_ELx_EC_GCS]	= kvm_handle_gcs,
 };
 
 static exit_handle_fn kvm_get_exit_handler(struct kvm_vcpu *vcpu)
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index ce347ddb6fae0..a9ecca4b2fa74 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5209,6 +5209,14 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
 						HFGITR_EL2_nBRBIALL);
 	}
 
+	if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, GCS, IMP)) {
+		kvm->arch.fgu[HFGRTR_GROUP] |= (HFGRTR_EL2_nGCS_EL0 |
+						HFGRTR_EL2_nGCS_EL1);
+		kvm->arch.fgu[HFGITR_GROUP] |= (HFGITR_EL2_nGCSPUSHM_EL1 |
+						HFGITR_EL2_nGCSSTR_EL1 |
+						HFGITR_EL2_nGCSEPP);
+	}
+
 	set_bit(KVM_ARCH_FLAG_FGU_INITIALIZED, &kvm->arch.flags);
 out:
 	mutex_unlock(&kvm->arch.config_lock);
-- 
2.39.2


