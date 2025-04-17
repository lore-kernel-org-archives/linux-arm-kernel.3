Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7D3C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 00:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfsRnzdHuWT4o5P1VKQd4plJTnGZ1eMMfE2exiZrYMc=; b=nmpIFg0mXh6WcU98Jppb2NtVjV
	tJY/I0MIz9jdoSvJrebPnf9IA1jS7+XLjP39BVnQKwvwnHh0sn99Q7fzgyT44xt5QwYANBM4LSW4u
	xKs9/Dr24josamVkGe2uS0RS0h8n7HdhFdJCDbIJOumH2/8iaeHi92jWR/zlpXKQhNnW1AFvYrvzh
	y3BRL+OAuY4thXMWGeGk1jlPN2WV5gXnS9ichbCnDJrSYZGeSOvjld6n0QLudahZSGQqaxv+/9Yp/
	XGkomy5CCE4j8kS5HlG0XQ9TrA5ZhVbHd9fIC4azjCN0y/tZHUlh1HwxzHipbG3BnNnhWKQIdLihR
	g+HVbXdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5DG3-0000000BKV0-0kRY;
	Thu, 17 Apr 2025 00:37:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5D4u-0000000BGnz-2bD4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 00:26:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A2866A4B0AA;
	Thu, 17 Apr 2025 00:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4FEC4CEE2;
	Thu, 17 Apr 2025 00:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744849563;
	bh=O7NHBm0GfdFxS8GXkNUEVs2/+kRTAbPluup4xc6JXes=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Cuc1nklMHps4oqg+RBqv/4iGdVdkA1Ywn5Cx7eSf0KFmzVPQtyLurW6K0KBmxFtjt
	 kG9UeQ4CEwEXuidA9FzfDbfKYK37zeEOkTV3vVmVSYoJOVmdV8BJ+9qerj0AWIBDUM
	 F5A06ielq4XzUGFT8esmSSkGGXi0Vz7B7AY6r15qM0UNffDqMqG1Aswse74VKiRtiM
	 zeO8pT8NEEHBCQgQWVHXU5cYzY1WKVOpeqji+dv+8iVrWv9HgSrW3jDXlHJykknv7n
	 V/qVdvJ/ureaXJTprXUe/M4N7nJiNBGlefOuwbTKmPBOHSxFY8hkRJ+ldgeZ2xza+q
	 bJ1sG0FjYqFGw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 17 Apr 2025 01:25:09 +0100
Subject: [PATCH v5 05/28] KVM: arm64: Introduce non-UNDEF FGT control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-kvm-arm64-sme-v5-5-f469a2d5f574@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2793; i=broonie@kernel.org;
 h=from:subject:message-id; bh=O7NHBm0GfdFxS8GXkNUEVs2/+kRTAbPluup4xc6JXes=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoAEpyY3NJTDN5eQWnmAxOutCt7z30HJtUVV5WkRnE
 gJdi0RmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaABKcgAKCRAk1otyXVSH0CLsCA
 CEM0LWsbNf0CgKTyKVLl/fK7EgqbfJqmuBkHMLAl4oi9iK0sJMxeq/Yhp413wfgURsNqFzSgAq/QlX
 kqyAs5yWwt5ozh32qBqE3Ujyig92x+yxRnlX5xRSaYJc6SeGA4YYsdzDe5qv74jabbqakecBRRsA1/
 Ay8AABmmmKTJQoO7YF+oDXejZsLzk30XBjkA5rTwByy4Tn+t8S9uxPQgwq8pfvy67W+X7Leth27ymT
 6bI5TZGraAyxh9wuoSOvniDyOcLsLwil91LRi8CZpmzfDKsiZnHcWAme8Yqg1aV/NmT0q0uADczFdG
 g/kRSuwyd/44yp0x6e5QA+y4QkbNWT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_172604_795935_DF57240C 
X-CRM114-Status: GOOD (  15.39  )
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

We have support for determining a set of fine grained traps to enable for
the guest which is tied to the support for injecting UNDEFs for undefined
features. This means that we can't use the mechanism for system registers
which should be present but need emulation, such as SMPRI_EL1 which should
be accessible when SME is present but if SME priority support is absent
SMPRI_EL1.Priority should be RAZ.

Add an additional set of fine grained traps fgt, mirroring the existing fgu
array. We use the same format where we always set the bit for the trap in
the array as for FGU. This makes it clear what is being explicitly managed
and keeps the code consistent.

We do not convert the handling of ARM_WORKAROUND_AMPERE_ACO3_CPU_38 to this
mechanism since this only enables a write trap and when implementing the
existing UNDEF that we would share the read and write trap enablement (this
being the overwhelmingly common case).

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h       | 6 ++++++
 arch/arm64/kvm/hyp/include/hyp/switch.h | 7 ++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index e98cfe7855a6..3fc8260d55a6 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -295,6 +295,12 @@ struct kvm_arch {
 	 */
 	u64 fgu[__NR_FGT_GROUP_IDS__];
 
+	/*
+	 * Additional FGTs to enable for the guests, eg. for emulated
+	 * registers,
+	 */
+	u64 fgt[__NR_FGT_GROUP_IDS__];
+
 	/*
 	 * Stage 2 paging state for VMs with nested S2 using a virtual
 	 * VMID.
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index b741ea6aefa5..7c9355459648 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -98,9 +98,9 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 		id;							\
 	})
 
-#define compute_undef_clr_set(vcpu, kvm, reg, clr, set)			\
+#define compute_trap_clr_set(vcpu, kvm, trap, reg, clr, set)		\
 	do {								\
-		u64 hfg = kvm->arch.fgu[reg_to_fgt_group_id(reg)];	\
+		u64 hfg = kvm->arch.trap[reg_to_fgt_group_id(reg)];	\
 		set |= hfg & __ ## reg ## _MASK;			\
 		clr |= hfg & __ ## reg ## _nMASK; 			\
 	} while(0)
@@ -113,7 +113,8 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 		if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu))		\
 			compute_clr_set(vcpu, reg, c, s);		\
 									\
-		compute_undef_clr_set(vcpu, kvm, reg, c, s);		\
+		compute_trap_clr_set(vcpu, kvm, fgu, reg, c, s);	\
+		compute_trap_clr_set(vcpu, kvm, fgt, reg, c, s);	\
 									\
 		s |= set;						\
 		c |= clr;						\

-- 
2.39.5


