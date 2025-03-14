Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7155FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 11:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IYRjktN0Xe+l0KkZ0Ly6k4G+9WnYnpIs+H0Ux3E9Tw=; b=UxlcQi8pNf7zpOklcUefnSY6cG
	SnAd90iN305p3IJyDESXP7p8YRvckTINUKUC92YiIZftaQGvy0gsJb4TJta5+59XpmWOawXVk/Yt1
	n39ww4JWsL0lbA2MET8CwXcu5+d2xidC5aj/oRwovQWnfOObque2RPgn52uCF7k7ENSugcnh+J/3h
	mTMMHgdMwl3lOWoh4ruNbDOGmGP/rCSGilWUu00OSYqI8HIgm7vSLTxmnGqXjooklzgrMObejjStL
	Ltglnr4+CpbGe1bKYAW8VknNPjn24fCm8yb7YQblIxPisOTQMHYYUxSU1GdYNZ58P2ajMulzJi+MP
	13B4UApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt38L-0000000DzTP-10Dj;
	Fri, 14 Mar 2025 11:23:21 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt33m-0000000Dybh-0WzW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 11:18:39 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43d08915f61so12011335e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 04:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741951116; x=1742555916; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3IYRjktN0Xe+l0KkZ0Ly6k4G+9WnYnpIs+H0Ux3E9Tw=;
        b=1imTjkqKk68PAYbuXCnaW40M4JqYvAK6n0aWJYcjR958QmimhTk436sCX7q3grLiLV
         U6JUBGC0Crn41Etr7cdc0Fqrw0wj5xkCHk8SIlYkmeYSMFA8DmF6F98jy3t87uPFLQrN
         y3UsUguEwdI/wo+XPQCmWPV4hgc3s5RS5EHdt3q6NYGtTCMmKLqtx75vBUUHEyTRkKdq
         XzgPi5hBUxE4hmiTmK6+Lh7s0ooX4MhfTCHG3xk3yBK3RP+q7hP9y4FpeCGs20tPYmeF
         d3iiFBkOjht7c1t3DQc/5ivjSc4JU6dcAOSs2qX4lo8wBEmHxcBlIsILSdZgKIEw5zrE
         aEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951116; x=1742555916;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3IYRjktN0Xe+l0KkZ0Ly6k4G+9WnYnpIs+H0Ux3E9Tw=;
        b=VP3JVtlyp26TeSvJbwPcWevXRm8t6/cD65p7u9b7LMPTJ8kjd7vC3fUtWcGjsdIBW6
         Q5IcIYzezm0OJON5zQAtSKd6sqOE3WmFydX3B523ZNxl9nGxcd3tjpJKd0waGk0qWWdh
         pJV6yLweIbAeb+zEi8W8kPktj2pHEoMvtqK5YC5j/h3zuqFqd810ObMVds5QACZ2TdVY
         1GGX5fgbAR9pVtJROrYQY7Z5aC5QaYoPRrxiVXo8pW9b5GwjPFTva2onM24/GarwbjFr
         lGNp/MvI/nWrF3Abt1sBj2riwyjlxaPeftDaSdzrQviR6cPLtDuPdNlH/V2Hl27bDOeL
         b+Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUmiSWINati1hQ4oUWGHomKuGANF7YP0YCWHsf+mEw0uNWDSQeqI3B3+GvO4pbGJNumrUaakwrGDRBUX4bKxAa9@lists.infradead.org
X-Gm-Message-State: AOJu0YwX2tnux/v55VnC7KTkRAJZLv2CvmG3qGlY4pYa3/EEhvaYsl0x
	pshYHIub7BTiNuWclVyG56OlQnMzXmorov3ZVu5BLwkzSDe7NN5fb4AIlGkjkLxTf98DNILg6g=
	=
X-Google-Smtp-Source: AGHT+IE6bHiPzyDuSNjh1OdQCzS5lebQOdEcH1nt2Xe9SkNJCG2uKeQglvcRSThYGjxDUfSnU0jOLPC3Hg==
X-Received: from wmbbi13.prod.google.com ([2002:a05:600c:3d8d:b0:43c:ec4d:6037])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f56:b0:43c:fd72:f028
 with SMTP id 5b1f17b1804b1-43d1ecd2ddamr26160465e9.29.1741951116586; Fri, 14
 Mar 2025 04:18:36 -0700 (PDT)
Date: Fri, 14 Mar 2025 11:18:29 +0000
In-Reply-To: <20250314111832.4137161-1-tabba@google.com>
Mime-Version: 1.0
References: <20250314111832.4137161-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250314111832.4137161-2-tabba@google.com>
Subject: [PATCH v3 1/4] KVM: arm64: Factor out setting HCRX_EL2 traps into
 separate function
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, mark.rutland@arm.com, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_041838_167383_F149C1CB 
X-CRM114-Status: GOOD (  14.04  )
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

Factor out the code for setting a vcpu's HCRX_EL2 traps in to a
separate inline function. This allows us to share the logic with
pKVM when setting the traps in protected mode.

No functional change intended.

Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_emulate.h | 24 ++++++++++++++++++++++++
 arch/arm64/kvm/sys_regs.c            | 20 +-------------------
 2 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 78ec1ef2cfe8..31c8497372d0 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -649,4 +649,28 @@ static inline bool guest_hyp_sve_traps_enabled(const struct kvm_vcpu *vcpu)
 {
 	return __guest_hyp_cptr_xen_trap_enabled(vcpu, ZEN);
 }
+
+static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
+{
+	struct kvm *kvm = vcpu->kvm;
+
+	if (cpus_have_final_cap(ARM64_HAS_HCX)) {
+		/*
+		 * In general, all HCRX_EL2 bits are gated by a feature.
+		 * The only reason we can set SMPME without checking any
+		 * feature is that its effects are not directly observable
+		 * from the guest.
+		 */
+		vcpu->arch.hcrx_el2 = HCRX_EL2_SMPME;
+
+		if (kvm_has_feat(kvm, ID_AA64ISAR2_EL1, MOPS, IMP))
+			vcpu->arch.hcrx_el2 |= (HCRX_EL2_MSCEn | HCRX_EL2_MCE2);
+
+		if (kvm_has_tcr2(kvm))
+			vcpu->arch.hcrx_el2 |= HCRX_EL2_TCR2En;
+
+		if (kvm_has_fpmr(kvm))
+			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnFPM;
+	}
+}
 #endif /* __ARM64_KVM_EMULATE_H__ */
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 82430c1e1dd0..16ce5f584e7c 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4971,25 +4971,7 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
 	mutex_lock(&kvm->arch.config_lock);
 	vcpu_set_hcr(vcpu);
 	vcpu_set_ich_hcr(vcpu);
-
-	if (cpus_have_final_cap(ARM64_HAS_HCX)) {
-		/*
-		 * In general, all HCRX_EL2 bits are gated by a feature.
-		 * The only reason we can set SMPME without checking any
-		 * feature is that its effects are not directly observable
-		 * from the guest.
-		 */
-		vcpu->arch.hcrx_el2 = HCRX_EL2_SMPME;
-
-		if (kvm_has_feat(kvm, ID_AA64ISAR2_EL1, MOPS, IMP))
-			vcpu->arch.hcrx_el2 |= (HCRX_EL2_MSCEn | HCRX_EL2_MCE2);
-
-		if (kvm_has_tcr2(kvm))
-			vcpu->arch.hcrx_el2 |= HCRX_EL2_TCR2En;
-
-		if (kvm_has_fpmr(kvm))
-			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnFPM;
-	}
+	vcpu_set_hcrx(vcpu);
 
 	if (test_bit(KVM_ARCH_FLAG_FGU_INITIALIZED, &kvm->arch.flags))
 		goto out;
-- 
2.49.0.rc1.451.g8f38331e32-goog


