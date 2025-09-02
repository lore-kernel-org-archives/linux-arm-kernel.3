Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA6FCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 13:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2xneINNbnv88ImQ+PFAtqtpTNXumUXt4/TktLHvQ6M=; b=O9YNq75TubhluobwLM6+nNvukX
	3VvU3PV+hk2CwNt3TEav5QWP+NXKNZQGI0Gxn441RGdH/kFYiN7ceHsjB8frYiGEcabN23r5ksv+E
	4WWUua4ZyQ1AeyXroY3HPpCdz37GKfIeo0VD9+SySe4Kp0Qd6xnR8WCt62Pr3ObqyeLqJ0dcIko2X
	jM6qrBiKRXiAbkhgB6E25TcvPVB7DTCX7t3WdjbiqfHx37jVmuUh1mDjUgjaW4hZ9nWGCIn1AX28v
	jjyOlTLNjEjqSQdIBWagg1sTUwxxHONf/mkv/vQfgSNW8GuaYaPR5yZPjBTwXsjG3HQfEMgFeoMG6
	UGpiPNUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utR2v-000000002dw-2VPx;
	Tue, 02 Sep 2025 13:27:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPRO-0000000GyhJ-3ZZ4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:44:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 967B044AD5;
	Tue,  2 Sep 2025 11:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE559C4CEF5;
	Tue,  2 Sep 2025 11:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756813486;
	bh=dbI2jtQQauIA3bdjDRznGzLHLedqf9IfSzISWZL55Y8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CEPxVLc+Vl9vWaY9RmfDlC16U3O2k3JgV3xBmu/NBNY4Trq8wwbWqnP6VXWoGwnq9
	 7XbMpWTO7gerYOzQfPP3GyWMky0jjh85jCeQaQ23/L1gsOW6QxkCmpAV4v5OT393uD
	 VmCtB8O2XRyzj+iI+mstJsPXND+7mZJt0Om3pMrVDwmeuREY1faGgOgmDP6po7shNi
	 xJZgRQA4bmTP1qIUswl2tfGDsxPlISjMhfqNpjY2wssPcXTZozsZVal5scArDIczMH
	 2CVDOIby76jlUHyDMQCT3BNjnfR6z4QE34RquVZ+jJ67rMJ6Pw0EX7mZkyzRMXrvV0
	 UuYBSk9z4Rf+g==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 02 Sep 2025 12:36:09 +0100
Subject: [PATCH v8 06/29] KVM: arm64: Introduce non-UNDEF FGT control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-kvm-arm64-sme-v8-6-2cb2199c656c@kernel.org>
References: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
In-Reply-To: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=2799; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dbI2jtQQauIA3bdjDRznGzLHLedqf9IfSzISWZL55Y8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBotth+tJnXowwXsMWuGwEIdyHOnkrvT98GfQg5e
 ttpOQ1xj9mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaLbYfgAKCRAk1otyXVSH
 0AWGB/9S5rlx1MKoPilf5QfFv4ZvmsRoqSmfY10BOm1SGXi15EKmsQ9vQCv5C1FqT5aoYR5z/Nf
 BwnpHqKJFi+kBYvd3SbKuTE93ebqUXn0dwWukCotNvaslzhqgyjtyFBGA/QDMGVD2GXAyotnCqX
 0U94z1W4rg9I00hdDn51Gv4wE5j9N9uSvboX7riZiizIfZt3Dmb9XXBhDaR8gSfqT28+B/KMvRq
 YV++ye1df9d3iS6BTbwliYf0jonei8HBl/ZUgpF3a6dqozfbT9DlX0sUTTsk5MPEdIZq9kCiq4j
 gGIyqHim1hyI95bnxbDDKQvwQePEaJT0IEbHgZ+HCke02qsS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_044446_963930_CEC0F569 
X-CRM114-Status: GOOD (  16.71  )
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
index 2f2394cce24e..b501c2880ba2 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -302,6 +302,12 @@ struct kvm_arch {
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
index 84ec4e100fbb..d5620e02787f 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -283,9 +283,9 @@ static inline void __deactivate_cptr_traps(struct kvm_vcpu *vcpu)
 		id;							\
 	})
 
-#define compute_undef_clr_set(vcpu, kvm, reg, clr, set)			\
+#define compute_trap_clr_set(vcpu, kvm, trap, reg, clr, set)		\
 	do {								\
-		u64 hfg = kvm->arch.fgu[reg_to_fgt_group_id(reg)];	\
+		u64 hfg = kvm->arch.trap[reg_to_fgt_group_id(reg)];	\
 		struct fgt_masks *m = reg_to_fgt_masks(reg);		\
 		set |= hfg & m->mask;					\
 		clr |= hfg & m->nmask;					\
@@ -301,7 +301,8 @@ static inline void __deactivate_cptr_traps(struct kvm_vcpu *vcpu)
 		if (is_nested_ctxt(vcpu))				\
 			compute_clr_set(vcpu, reg, c, s);		\
 									\
-		compute_undef_clr_set(vcpu, kvm, reg, c, s);		\
+		compute_trap_clr_set(vcpu, kvm, fgu, reg, c, s);	\
+		compute_trap_clr_set(vcpu, kvm, fgt, reg, c, s);	\
 									\
 		val = m->nmask;						\
 		val |= s;						\

-- 
2.39.5


