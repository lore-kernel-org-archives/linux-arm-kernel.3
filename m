Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF36C369A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 20:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOtXHvr43L8fUw/Kk5YiMVxP+bSauiBwcbiOsJq5p8E=; b=PNAbZknHLnnTCIuKtMBoGAq5qy
	bTSZMCA93TU9WcxXHb7iEpNiOUvJ6oAiq692hNTxVUd4f61wA8ckP3Y2hGZyuEKYmKdMtoAVyjIAT
	tQHh68gaXxz3d9mX9qNdJkz74k4F+Pt/Ms4Bm3Q3qSe2iY5Ewv3DvX9oVfoRpx3S9OqWxs8F3V7Pi
	i0vksmX+hmK6NaBmT07ZExXqPH9d2L27wgjKL7/j0olZvxJZaL0VPjI5sRvS6mFQYnsXa4hrF7Bn8
	dvBni8EWCDrRz1lmvWFqP2v7L1oxx9GB/tir5El+EZmUNtFYBeix4XXHEz+lMV9FOqtgX7tSI28Ej
	YLBWeLaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2G10-00000005O9W-2i5T;
	Tue, 08 Apr 2025 20:57:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Db0-000000055xo-1x8s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 18:22:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F3946A49003;
	Tue,  8 Apr 2025 18:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84094C4CEE5;
	Tue,  8 Apr 2025 18:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744136569;
	bh=5LpLtUug8+WAmrpDqxb97Aqky7PzaY6BPA6LoGHVYvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K6w53RL/njlqY0wn/F5lqIGLhGFCBLu13G38E/bwQu+W2R7K7YYSpxZfF8ZieMfdb
	 PqL/XdU5IBL0yTtCKXUoQciGkVW4JaVBhGzgLqzTblC21T1/yGI6M67GpvUXDfa/ZE
	 LffQgRKQu1ZJAVWbM2zW90miAXXSrJDSkT+d29qtusrhnceuJBcxORCR8GxZawyOb1
	 Idx6WVErfpIS4fC6NMwnS/QtUZM/EHhrKLVckQbPnENfgULSFPF6OPjtKhIS8z+xDQ
	 N3VntJo66pco1NfIDjw3X5O9UabQcpopNLNYLEUE5jtvJhb+7Pkxh25gDbIDwr1HW5
	 GPy1r5YtLUGig==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 08 Apr 2025 19:10:05 +0100
Subject: [PATCH 5.15 v3 10/11] KVM: arm64: Calculate cptr_el2 traps on
 activating traps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-stable-sve-5-15-v3-10-ca9a6b850f55@kernel.org>
References: <20250408-stable-sve-5-15-v3-0-ca9a6b850f55@kernel.org>
In-Reply-To: <20250408-stable-sve-5-15-v3-0-ca9a6b850f55@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Oleg Nesterov <oleg@redhat.com>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Fuad Tabba <tabba@google.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3292; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dzuSkTHzORViq39mf97JEZt+XWlNRsFaxOQ4IWqXP1g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn9WlT6cQHEa2BVDcqOeuHIhwSftALpooykroaE+iL
 3g7I1rGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ/VpUwAKCRAk1otyXVSH0GOpB/
 4i21OpuHSiUOWXc7d6C0MTkEAWUC4+yh60s2WyUhntsumPjgap/cghV7sbRHlsJhzExNgOHavbtFI7
 arjJjClACQlEUkiV9Q5lr1XsVycETnRLrqpg7af2NM8cYUT+G7P/2tQjLbDiwhgp8HL6sneawkzYXY
 Xg8wM7kE+Jmh2UsGOsWFwatuKXZKHbhYKMizMLh3bM1oKCQwCh+ShvL3aVl+pxJ3XMoQE5zdZ0O8Is
 PA140HkoYIDhe3huIdjXtxDNKA3VVo+eTiAsFLOmcZCgPk8MPOOg3u5qCKP2gSPz452LZKMqUVNIdR
 TqED8/Pw1ydAF07vUx2sHNHSqfnKPC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_112250_636506_3E77D299 
X-CRM114-Status: GOOD (  15.86  )
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


