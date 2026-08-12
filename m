Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D77C5DF64
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 19:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xrro5Riy4X3i4jiHQrka706bGBWW4kkidtMzTaWIrHI=; b=mzVZtPtTo+qlftWK3PUcCLTzKh
	2DXSSkZAlvRYF3e5Bw3f3004a4Yjtq4AM9QOH4bNt2sV2eyxz63kN99BVKyvJlLc9ZyI2G4+UhPLk
	3Jqc4D6cwdK5zLHPVoAozsaKlq1qc7VwfAG/g9A35Nv3CAVGgSREpJ+/3V+CI+bzNTLbUNf+/gAFs
	6GNtXa2R7ExTOv87MtvPHJ74l5bKKVpq4+8KSCHiPyoYIFKIcHEUoe+BqhqReq57hochGCHPswOek
	7LU5/PE1hMaCq5CA/ItYs5dVmCS7ODTcGGn0RNupMGHtnG1EDXiftd1aCf1Ene13nW6KBKATIW3W2
	Pxi7hWIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEOe-0000000Grsb-1uG4;
	Wed, 12 Aug 2026 19:13:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEOU-0000000Grlt-0rm5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 19:13:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A68B360A9E;
	Wed, 12 Aug 2026 19:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5C31F00A3D;
	Wed, 12 Aug 2026 19:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786562021;
	bh=Xrro5Riy4X3i4jiHQrka706bGBWW4kkidtMzTaWIrHI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lT0z/62gLv7bsHCpxLcAAzhzgXjwGOVCQ/vA4PBaVjNIpWS+RrFxsfUMw8tmcX3ez
	 Kea2AHO7hXF1BRiYgjXo9y4TFiAYAjbhAN13rsn9N58kZ0jJ9maBIxkaZF4IoIzWbZ
	 JlLxGA1gaN9xX+eZAq1o17hH1s33+roBU4a5/78MzHsqfsf8nTksqbjjbSDjBnTlqx
	 9YYMqUegtoONwqDyohBtfBDjtxMW5pPFoDgpGCg5Ba3ViVV84isLp+RS1T64KJHYAN
	 loUx3HSrO1oqZlTKj9xyn9fHhS9DCASf6ZJ/trx0RYZMrtGcNRnEuxzVXIHXQ3AbNQ
	 ogdz0yff+xYfg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Aug 2026 20:12:07 +0100
Subject: [PATCH v19 08/14] KVM: arm64: Enforce EXLOCK for SPSR and ELR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-arm64-gcs-v19-8-9105afd828ac@kernel.org>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
In-Reply-To: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3010; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LgwwfLot59z6LxND49YWDAU1QqTEQ64y1Jg8Fmz6GeU=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhqyaowcCG1+r16krhC1r5zP4vmHPY7ONRTNkjebtbGJ6Y
 Mjl3CLUyWjMwsDIxSArpsiy9lnGqvRwia3zH81/BTOIlQlkCgMXpwBMpNOe/X/x5CtpdYEm7C2v
 BEzjLhbWH/iSbn5qdZ/QoRT5H/9umNxoXnL3fsHxQwlTo0Q2ydcXzL39x/yLTZGw56satttPN6z
 kecmmy6WWn+iyQm3O/Pwihpi3MUFFKoJbQk0VCj28vF5onj1SdFF22i/dM3v7dOb/LKmVLr0/J3
 IPU2pyYblCtMbqNVJrWtTrU9if1ddE6RqsEHU+1Hsyf4OP9AfTPY9WK6SfWH3m1nzxW+Z6D2e7d
 22olj8uynPEdbu13MWks5dk/lrIxL4I69tquPMVu2dfpim3cUtOgse0P74s81d+cpplL2L53a5o
 yuOePN/3C9M6Ih9JdliKPC06vktebuNEbkbtv9lMDWrvAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

As per I_CFFNS and the pseudocode for the SPSR_ELx and ELR_ELx registers
a GCS exception with ExType 1 is generated for attempts to write to
those registers when both GCSCR_ELx.EXLOCKEN and PSTATE.EXLOCK are set.
Ensure that this is enforced for guests if access to these registers
from the guest is handled by the hypervisor.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_emulate.h |  8 +++++++
 arch/arm64/kvm/sys_regs.c            | 42 ++++++++++++++++++++++++++++++++----
 2 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index ee774c3b8dcd..bc012c86fcd6 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -81,6 +81,14 @@ int kvm_inject_nested_irq(struct kvm_vcpu *vcpu);
 int kvm_inject_nested_sea(struct kvm_vcpu *vcpu, bool iabt, u64 addr);
 int kvm_inject_nested_serror(struct kvm_vcpu *vcpu, u64 esr);
 
+static inline void kvm_inject_exlock(struct kvm_vcpu *vcpu)
+{
+	u64 esr = FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_GCS) | ESR_ELx_IL |
+		  FIELD_PREP(ESR_ELx_ExType_MASK, ESR_ELx_ExType_EXLOCK);
+
+	kvm_inject_sync(vcpu, esr);
+}
+
 static inline void kvm_inject_nested_sve_trap(struct kvm_vcpu *vcpu)
 {
 	u64 esr = FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SVE) |
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 6aa4463c3d3a..bd1d5b778b9c 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2782,14 +2782,42 @@ static bool access_sp_el1(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static inline bool sysregs_exlocked(struct kvm_vcpu *vcpu)
+{
+	u64 gcscr;
+
+	if (!kvm_has_gcs(vcpu->kvm))
+		return false;
+
+	if (!(vcpu->arch.ctxt.regs.pstate & PSR_EXLOCK_BIT))
+		return false;
+
+	/*
+	 * Note that the EXLOCKEN for the running EL is checked
+	 * regardless of the register written to.
+	 */
+	if (is_hyp_ctxt(vcpu))
+		gcscr = vcpu_read_sys_reg(vcpu, GCSCR_EL2);
+	else
+		gcscr = vcpu_read_sys_reg(vcpu, GCSCR_EL1);
+
+	return gcscr & GCSCR_ELx_EXLOCKEN;
+}
+
 static bool access_elr(struct kvm_vcpu *vcpu,
 		       struct sys_reg_params *p,
 		       const struct sys_reg_desc *r)
 {
-	if (p->is_write)
+	if (p->is_write) {
+		if (sysregs_exlocked(vcpu)) {
+			kvm_inject_exlock(vcpu);
+			return false;
+		}
+
 		vcpu_write_sys_reg(vcpu, p->regval, ELR_EL1);
-	else
+	} else {
 		p->regval = vcpu_read_sys_reg(vcpu, ELR_EL1);
+	}
 
 	return true;
 }
@@ -2798,10 +2826,16 @@ static bool access_spsr(struct kvm_vcpu *vcpu,
 			struct sys_reg_params *p,
 			const struct sys_reg_desc *r)
 {
-	if (p->is_write)
+	if (p->is_write) {
+		if (sysregs_exlocked(vcpu)) {
+			kvm_inject_exlock(vcpu);
+			return false;
+		}
+
 		__vcpu_assign_sys_reg(vcpu, SPSR_EL1, p->regval);
-	else
+	} else {
 		p->regval = __vcpu_sys_reg(vcpu, SPSR_EL1);
+	}
 
 	return true;
 }

-- 
2.47.3


