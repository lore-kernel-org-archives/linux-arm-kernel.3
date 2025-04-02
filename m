Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8BAC36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 23:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOtXHvr43L8fUw/Kk5YiMVxP+bSauiBwcbiOsJq5p8E=; b=om30Acvcd7c85+5sd6WbgAXL5s
	d0M9zxLSsO0qLNfasZP2Rcx65qII/LBcdIXelLQHg0Ca5BYiKSEN3Z3k+EX1FqKyuH6fUgmN9n/v5
	H6CUz/WMS65D3+PpfiHRpfduWOViGAz7j5YFXgKQWb4kaIrwdrA22F0LW7wlKe73j/2e/VHOfbJh+
	YsOQ3hvvM3IfvmkaFvvEvpQZMGyZzNSXdqCdQ5+izbxrEud29fYPouf7ZmjYT0YMqBz9rD93xwYbn
	reonmbL6tkJVysvvMfaHXXuVRwcH93jx23AeCs2/RjasRd/dB37M85X+yZzH+eeby5GT54buVYz+w
	9YX8E+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07Xw-00000007Pi1-0IET;
	Wed, 02 Apr 2025 23:31:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07H0-00000007NQK-0wAc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 23:13:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9DAEEA45FFA;
	Wed,  2 Apr 2025 23:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEA8C4CEEA;
	Wed,  2 Apr 2025 23:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743635609;
	bh=5LpLtUug8+WAmrpDqxb97Aqky7PzaY6BPA6LoGHVYvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e6zOCTfIbfBoxD8ROtsIVqW1T8Xa1PVRZExUIFZThYjX6M7ECcSTIq4iRJoxvnBei
	 OFPqDENL5p2/4dYdkasu7piYYqiGHoD07iJSjbpyTqqjvyZE241hOG6vOdU3lo5sYo
	 kkPbybTmCYAUpn3RU7bBtRVPP+n3eQbCALjg5geKsrMtKX9wEhBQrIe0NJ4VIxwKPT
	 6GjvvrtESwTLTFCudHkVdIKwT1Z3TKz51c52ersNQymI7D2zRnzk9cKWeh6MClQH/1
	 MF537TXQmGg4igseRw6r0D4HE4n6KAo3FcDltZCRnAtHxGE77/tFdT5VH7wjZJvp7U
	 TeEilDVVLBYHA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 02 Apr 2025 23:59:41 +0100
Subject: [PATCH 09/10] KVM: arm64: Calculate cptr_el2 traps on activating
 traps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-stable-sve-5-15-v1-9-84d0e5ff1102@kernel.org>
References: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
In-Reply-To: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
To: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Oleg Nesterov <oleg@redhat.com>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Fuad Tabba <tabba@google.com>, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3292; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dzuSkTHzORViq39mf97JEZt+XWlNRsFaxOQ4IWqXP1g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn7cR7N73oFKRhczTXNGGx/jdGtlVF0vLwVsngJpzw
 k+0qmsGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ+3EewAKCRAk1otyXVSH0BeVCA
 CDsgghGxJg+i8PrezkADB1+iPr2viowx4MCqyhXJ14mmf9A3RtlBHqAOByOUd4OFXlNCgQeBwXOHnf
 U+AQJB+0i35+Ot3cp7PesJQiYSJHQeAUBQHIuoUajI1lie8MpipKNkvPcVKOkEc949OCp8yPKe53ak
 bcYSowKiogb2BylbUSVcOkMyq7YpZnDV/5zjZylbSnhRFpHznF15RGK4dcbftzPrQJLRbzb1QIAPm8
 M86ctRfm6NCNwVcOQf609ieGo64RRVgQps2aUA58zvtLzIRzL9PeFvdmOodg6fZZYSPPp5br53jJss
 VZLCzmTBOVTdizNiKJuKskiFoJLFdd
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_161330_411217_B06AB432 
X-CRM114-Status: GOOD (  15.58  )
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

From: Fuad Tabba <tabba@google.com>

[ Upstream commit 2fd5b4b0e7b440602455b79977bfa64dea101e6c ]

Similar to VHE, calculate the value of cptr_el2 from scratch on
activate traps. This removes the need to store cptr_el2 in every
vcpu structure. Moreover, some traps, such as whether the guest
owns the fp registers, need to be set on every vcpu run.

Reported-by: James Clark <james.clark@linaro.org>
Fixes: 5294afdbf45a ("KVM: arm64: Exclude FP ownership from kvm_vcpu_arch")
Signed-off-by: Fuad Tabba <tabba@google.com>
Link: https://lore.kernel.org/r/20241216105057.579031-13-tabba@google.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  1 -
 arch/arm64/kvm/arm.c              |  1 -
 arch/arm64/kvm/hyp/nvhe/switch.c  | 35 ++++++++++++++++++++++++++---------
 3 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3d4e2396a2d7..2e0952134e2e 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -301,7 +301,6 @@ struct kvm_vcpu_arch {
 	/* Values of trap registers for the guest. */
 	u64 hcr_el2;
 	u64 mdcr_el2;
-	u64 cptr_el2;
 
 	/* Values of trap registers for the host before guest entry. */
 	u64 mdcr_el2_host;
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 9ded5443de48..5ca8782edb96 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1138,7 +1138,6 @@ static int kvm_arch_vcpu_ioctl_vcpu_init(struct kvm_vcpu *vcpu,
 	}
 
 	vcpu_reset_hcr(vcpu);
-	vcpu->arch.cptr_el2 = CPTR_EL2_DEFAULT;
 
 	/*
 	 * Handle the "start in power-off" case.
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 4db5409f40c4..c0885197f2a5 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -34,21 +34,38 @@ DEFINE_PER_CPU(struct kvm_host_data, kvm_host_data);
 DEFINE_PER_CPU(struct kvm_cpu_context, kvm_hyp_ctxt);
 DEFINE_PER_CPU(unsigned long, kvm_hyp_vector);
 
-static void __activate_traps(struct kvm_vcpu *vcpu)
+static bool guest_owns_fp_regs(struct kvm_vcpu *vcpu)
 {
-	u64 val;
+	return vcpu->arch.flags & KVM_ARM64_FP_ENABLED;
+}
 
-	___activate_traps(vcpu);
-	__activate_traps_common(vcpu);
+static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
+{
+	u64 val = CPTR_EL2_TAM;	/* Same bit irrespective of E2H */
 
-	val = vcpu->arch.cptr_el2;
-	val |= CPTR_EL2_TTA | CPTR_EL2_TAM;
-	if (!update_fp_enabled(vcpu)) {
-		val |= CPTR_EL2_TFP | CPTR_EL2_TZ;
-		__activate_traps_fpsimd32(vcpu);
+	/* !hVHE case upstream */
+	if (1) {
+		val |= CPTR_EL2_TTA | CPTR_NVHE_EL2_RES1;
+
+		if (!vcpu_has_sve(vcpu) || !guest_owns_fp_regs(vcpu))
+			val |= CPTR_EL2_TZ;
+
+		if (!guest_owns_fp_regs(vcpu))
+			val |= CPTR_EL2_TFP;
 	}
 
+	if (!guest_owns_fp_regs(vcpu))
+		__activate_traps_fpsimd32(vcpu);
+
 	write_sysreg(val, cptr_el2);
+}
+
+static void __activate_traps(struct kvm_vcpu *vcpu)
+{
+	___activate_traps(vcpu);
+	__activate_traps_common(vcpu);
+	__activate_cptr_traps(vcpu);
+
 	write_sysreg(__this_cpu_read(kvm_hyp_vector), vbar_el2);
 
 	if (cpus_have_final_cap(ARM64_WORKAROUND_SPECULATIVE_AT)) {

-- 
2.39.5


