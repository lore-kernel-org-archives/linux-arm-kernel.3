Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4858FC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 15:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3QG+zT/RwXAZL9n5OnnC2+lvWakBvdv4UY7lvQy/YA=; b=NFiQTsd/65r0b7bKJb2cZt/q77
	nadh+KZLGJs4GVQdtQLSqHNn7zTyQRtrzTR/G9KC9UPZwXs57ZmCikMKWVCfL6+yKBP0EU0Skof5A
	HR8ZSnS0mR12mAjMWB/7SZQETJvw8AtCblX+VG7Scwipzc5oV4ksou++G/q56RKfdqA2sj3IIGURz
	8LKBC+BxVCyl1sToH0kaKdbAL/hdynwsmySG0aBToIn9nyU+39PIb0zJ1t94mZRzlCjQfZcfNO/PH
	toazCFU2Xndp74lc8H9Dx6T8I30+IQVv24iZSnDkYvxJIYxyR+MfMwOwMGGg1dPXOiOj35nujVBzc
	xzOF2Jfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURoX-0000000952P-46Bm;
	Wed, 25 Jun 2025 15:13:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOFa-00000008Sjl-2HNC
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 11:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=q3QG+zT/RwXAZL9n5OnnC2+lvWakBvdv4UY7lvQy/YA=; b=hc5ZBWGBTo/n5W8fM3Wn5MjzFU
	qp/UH6ejBED8clwew8rnejQY7MzPgS2LDGORqmg0cuyQPAcELp0rLuBuUKV9YxFC4DQuLsFdmjdLf
	N5B78qJLbCFqETDrR7XZH8Ur1kH9KG1Vu+RHXYwME3gKL+cq2LKaCwPR/h8+F3oPTactuddVD8CPs
	WE7Y9cjHC4FHk8kqT2B0jj4Q4L68Y0KGbGc+jbl4pY4h7lnSNGf4AnZGy+Suzx5ZB1dbvNLryhMAu
	yqaqcnHKtQyxXBarxtEm4YmWpJLSjJXiwZKI0Dfr5jxJWb2QnX6k+f2KYCBj6M5knPH6tcyridDH0
	Bo34mJ0Q==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOFX-00000005p1N-2HxA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 11:25:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DC5E0A522FD;
	Wed, 25 Jun 2025 11:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48165C4CEF0;
	Wed, 25 Jun 2025 11:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750850705;
	bh=L05MmxQzudW02kpJunpdmEsWZHXdGfcHqQRELTGnS54=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aa7T/09ebEOzU9nCv/HjNbUgb5Ku6qeg7X0olU4eTs61l8oreD4fDwYGu1QJoMkUw
	 SoEjg7eWvBCiQsVEK8jrpHywABoD+uLQ+sbrEWFhE+EbazR4TrGXtMg3BLJy2JDkjZ
	 7dakTekhnKdogO3lZ7Hduza1q+pOmRCOINQvCRdH6ogDQJnz22INmaCo3bhP0PGiY0
	 WfYcReQCxcvz+ZRn78oSjJIJ/V+RDYLmnNiwRY9HoB9eECWwuFMWvVcvg0GEkhKL5i
	 GXSiOldZU+1FsUh88QeVNyLgquQgzR7DIlLQSS9O0KXSYebZshuO+WTr0Hp7D9apFR
	 37pzqw24m+AQw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 25 Jun 2025 11:47:56 +0100
Subject: [PATCH v6 05/28] KVM: arm64: Introduce non-UNDEF FGT control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-kvm-arm64-sme-v6-5-114cff4ffe04@kernel.org>
References: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
In-Reply-To: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
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
X-Mailer: b4 0.15-dev-08c49
X-Developer-Signature: v=1; a=openpgp-sha256; l=2816; i=broonie@kernel.org;
 h=from:subject:message-id; bh=L05MmxQzudW02kpJunpdmEsWZHXdGfcHqQRELTGnS54=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoW9xoe1NIbe+ak2Z668atq+eG2pMfxdphaUpTr
 58zo8jAz1+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaFvcaAAKCRAk1otyXVSH
 0EwQB/wP/1x/bMmpu6WKEkI765RzWyJ9jb19W/JtOeSpqkmP+siunmXeyVufWVVl+/Rx4+mHhpI
 u/oV4hkNREXH73pJWeBxDizlArUXrMNKIU7/o9rfl9kTS6llRtxr1vs0sG5f4QSkZXA2hlcZznW
 NlbOrKS9stA6SgwLq3dJ478j4yhCcDubsv978UwYa39xHH6ko0fU/6r0/TmvT1E28JweVzhhAqk
 4qKtiJz6BQTL8hNDByowdSajaj2Fc1mBZHY5dCELNZauEwxlmnuN362T+Rmyve+cyqcFSSr1YCX
 0jCFmJw/zVPh8PGCYFfIGACIMyYo+mbpo71ZafFxoU9ECsw3
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_122507_921159_E23B336B 
X-CRM114-Status: GOOD (  16.55  )
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
index d27079968341..911da41e6bc0 100644
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
index 2ad57b117385..987f5c4c5747 100644
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
 		if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu))		\
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


