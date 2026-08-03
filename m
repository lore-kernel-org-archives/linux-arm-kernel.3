Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906FAC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RUDSO9sj6nkMPFklK22QwcCsujEEmCs59CBnMLJfHI=; b=aBEJN5HqwLMrM5rDs8doxLfMka
	1r4LHq6LDEq0XkgFerAYmeUjvWm82hrlfmpIJ8dJHLHeascQBnSdIC3XtcAdbWdUdSMRJowVvyTML
	y/nFPZOg/QpAGdbvYnum7Xt5sXWiZxlxihNZafwTmIxsZYfL9jGQYZTRgZthr4yuKRphkn3DGOdMb
	mNPVMkWfyM5w19rxnIC63q6WEHRo4TeZxT0vBA5T2CRbbhJVECpeIAgR4WIMGlh3gztD3kjxpGD7x
	3baGRxwqn0UrdHpyEw40k+NYyrzsM/vmx+1V58KfBvFeMYdJoTll3GKeSf0R6GJdIHeCd0lDig4j3
	CTXjylqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt0r-0000000HEew-2WV3;
	Mon, 03 Aug 2026 13:47:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt0o-0000000HEcE-4896
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:47:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 645A21476;
	Mon,  3 Aug 2026 06:47:22 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 745213F66F;
	Mon,  3 Aug 2026 06:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785764846; bh=oMhQ9nECs1uP7/C+1tKXuLBGIgQ34GA4GrC0OcJHPVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oyMYroVeMruikwg0kZoF6oTwb/YKSr6sFLfbsK4gOsXkaB+iPQuE3k9RVzreIJl1P
	 ouj1EMXYE95vwWwh0GHVTT0/Rnr4c+Wp07GS98bYtCM72A229gmqxmGCxsSERjTTSE
	 Z8WngXCy/R9vN180IGM7XNsRwmF0D4UQ6Uy8oCLE=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: [PATCH v16 40/45] KVM: arm64: CCA: Propagate max SVE vector length from the RMM
Date: Mon,  3 Aug 2026 14:43:56 +0100
Message-ID: <20260803134403.80630-41-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803134403.80630-1-steven.price@arm.com>
References: <20260803134403.80630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_064727_117282_2704EA0A 
X-CRM114-Status: GOOD (  13.76  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

RMM provides the maximum vector length it supports for a guest in its
feature register. Make it visible to the rest of KVM and to userspace
via KVM_REG_ARM64_SVE_VLS.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Steven Price <steven.price@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/include/asm/kvm_host.h |  2 +-
 arch/arm64/include/asm/kvm_rmi.h  |  1 +
 arch/arm64/kvm/guest.c            |  2 +-
 arch/arm64/kvm/reset.c            | 12 ++++++++++--
 arch/arm64/kvm/rmi.c              |  6 ++++++
 5 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 146c52f867c0..ee565b8e55a0 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -79,9 +79,9 @@ enum kvm_mode kvm_get_mode(void);
 static inline enum kvm_mode kvm_get_mode(void) { return KVM_MODE_NONE; };
 #endif
 
-extern unsigned int __ro_after_init kvm_sve_max_vl;
 extern unsigned int __ro_after_init kvm_host_sve_max_vl;
 int __init kvm_arm_init_sve(void);
+unsigned int kvm_sve_get_max_vl(struct kvm *kvm);
 
 u32 __attribute_const__ kvm_target_cpu(void);
 void kvm_reset_vcpu(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
index 7d27c17276bf..2789879b6701 100644
--- a/arch/arm64/include/asm/kvm_rmi.h
+++ b/arch/arm64/include/asm/kvm_rmi.h
@@ -97,6 +97,7 @@ struct realm_rec {
 
 void kvm_init_rmi(void);
 u32 kvm_rmm_ipa_limit(void);
+unsigned int kvm_realm_sve_max_vl(void);
 
 u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val);
 
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 3ed563e85572..f48fc0d5a249 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -375,7 +375,7 @@ static int set_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 		if (vq_present(vqs, vq))
 			max_vq = vq;
 
-	if (max_vq > sve_vq_from_vl(kvm_sve_max_vl))
+	if (max_vq > sve_vq_from_vl(kvm_sve_get_max_vl(vcpu->kvm)))
 		return -EINVAL;
 
 	/*
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index c18cdca7d125..7b8681a602d4 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -46,7 +46,7 @@ unsigned int __ro_after_init kvm_host_sve_max_vl;
 #define VCPU_RESET_PSTATE_SVC	(PSR_AA32_MODE_SVC | PSR_AA32_A_BIT | \
 				 PSR_AA32_I_BIT | PSR_AA32_F_BIT)
 
-unsigned int __ro_after_init kvm_sve_max_vl;
+static unsigned int __ro_after_init kvm_sve_max_vl;
 
 int __init kvm_arm_init_sve(void)
 {
@@ -76,9 +76,17 @@ int __init kvm_arm_init_sve(void)
 	return 0;
 }
 
+unsigned int kvm_sve_get_max_vl(struct kvm *kvm)
+{
+	if (kvm_is_realm(kvm))
+		return kvm_realm_sve_max_vl();
+	else
+		return kvm_sve_max_vl;
+}
+
 static void kvm_vcpu_enable_sve(struct kvm_vcpu *vcpu)
 {
-	vcpu->arch.sve_max_vl = kvm_sve_max_vl;
+	vcpu->arch.sve_max_vl = kvm_sve_get_max_vl(vcpu->kvm);
 
 	/*
 	 * Userspace can still customize the vector lengths by writing
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 44ddee730863..cf043db05720 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -36,6 +36,12 @@ u32 kvm_rmm_ipa_limit(void)
 	return u64_get_bits(rmi_feat_reg(0), RMI_FEATURE_REGISTER_0_S2SZ);
 }
 
+unsigned int kvm_realm_sve_max_vl(void)
+{
+	return sve_vl_from_vq(u64_get_bits(rmi_feat_reg(0),
+					   RMI_FEATURE_REGISTER_0_SVE_VL) + 1);
+}
+
 u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
 {
 	u32 bps = u64_get_bits(rmi_feat_reg(0), RMI_FEATURE_REGISTER_0_NUM_BPS);
-- 
2.43.0


