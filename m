Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF220C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 02:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ywSjhbWroFOjbAkNYkFzQ8Ns1ZlxBhkx8/nicE4bV1I=; b=u8Jt/cvWUn+JuanrRA3CALCUnf
	rua/a/7fjGdI6MT30go2ickRKMG1ZS2NspA9wqxDmuReqVOrxa10fVKqNNwjttgOCF33rMYScDPQa
	sG6aD6ZzQtB6nZYVrQrhey30f88lG3Ha5X2GmsudBtNeR6bHzeQp76kgFn4kYhQU/ONpOzN2oLzdX
	WH2A+w+tMx7bVcDQXahmU8bh2H7ydGiSNTy21zsrJCv4rv8UAD7l4WzWQtJmuq9BqMSvEwQ4VFu23
	qlThsXxhGEwqp3EYFF8QqHZ7t9C5q2EZ6VYaQ4OvwljUktVfI+ueoP7EKPHxEDYhk+Ealn378AKu7
	H9BCjqkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tilHh-0000000DKIp-2VDk;
	Fri, 14 Feb 2025 02:18:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1til1S-0000000DFKl-2tPC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 02:01:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8AAEF5C5D2C;
	Fri, 14 Feb 2025 02:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697B7C4CEE8;
	Fri, 14 Feb 2025 02:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739498501;
	bh=pIXa80sqzHzFpWf+BtFQDhwZHyO3E94JaRZryQDM4fI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i6MtElX4fLodMybOfuMqg2AlpZFWQzfsrzHEfVCFp9gAD6y9aJLigtLYg7AwNJRsE
	 Q3CbFPrQHO0X2UVtS/1L5YWuC/dkr3tm5q6gqod8zj8dfWo8wmAegh2+7G+TuRzKEx
	 7KKVECifyPq1YZBfgVjmhm4p3eX6Ds6zeHYdESEIMZqETp7BoNDd1EW5WfPfLcFeBB
	 u2uCDxejaqKo5M9rhNZvI95TEd3G0y7wBl08NRc7n5W0d2AjgIBeC9IzPzHFd5l/v6
	 EwQYrnzuAV51Z+eZbpUNwe5arnWog9NpMtq0oVBBIpjpDGA+OOkb/5kPSDVrn1vSij
	 dqlSsgjArBbTA==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 14 Feb 2025 01:57:54 +0000
Subject: [PATCH v4 11/27] KVM: arm64: Define internal features for SME
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-kvm-arm64-sme-v4-11-d64a681adcc2@kernel.org>
References: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
In-Reply-To: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
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
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=3280; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pIXa80sqzHzFpWf+BtFQDhwZHyO3E94JaRZryQDM4fI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnrqPJQPFdilei7rkQV+MBFJubRfiidnpeFvfS5+lL
 TCDF12+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ66jyQAKCRAk1otyXVSH0PVeB/
 9eM3Ub+1FRgxCLNlkjT+HrL5Nnh2dYhvBVpDCniMUhDBOplkdpcdpiYXPEbQGd+O+iQrjPeNj2+lez
 hZt2JqIP1IQu9Y43So1lybybs6Qi71jVRdj0amWpIZ3ylXBrucr8fdHkrPjqqNZE9PEWjrz4oPyqqh
 cTcBRpQ7p6GmqFl7npTSpsnZxo6jhkuwUFy6x/7VYPToenzHfqGhWZJfTvd6SpWTRLEcDPRN35MRLr
 78ZNJpDvoCmeM7s7YASmvF4MHp363uHICFrFg9rP5v4jpqh09rxut2wrBGFrOufCFterrReCGr/K0b
 x6EkFNDWd/v0MzF6lw1ApczHd8TOoS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_180142_853112_9FE72AF8 
X-CRM114-Status: GOOD (  14.08  )
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

In order to simplify interdependencies in the rest of the series define
the feature detection for SME and it's subfeatures.  Due to the need for
vector length configuration we define a flag for SME like for SVE.  We
also have two subfeatures which add architectural state, FA64 and SME2,
which are configured via the normal ID register scheme.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 31 +++++++++++++++++++++++++++++--
 arch/arm64/kvm/sys_regs.c         |  2 +-
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index f12b13c3886a2b90d0f1e95f9d59f374d3c87398..55ada264b7383925269674a47446b8f659a7e4e6 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -39,7 +39,7 @@
 
 #define KVM_MAX_VCPUS VGIC_V3_MAX_CPUS
 
-#define KVM_VCPU_MAX_FEATURES 7
+#define KVM_VCPU_MAX_FEATURES 9
 #define KVM_VCPU_VALID_FEATURES	(BIT(KVM_VCPU_MAX_FEATURES) - 1)
 
 #define KVM_REQ_SLEEP \
@@ -340,6 +340,8 @@ struct kvm_arch {
 #define KVM_ARCH_FLAG_FGU_INITIALIZED			8
 	/* SVE exposed to guest */
 #define KVM_ARCH_FLAG_GUEST_HAS_SVE			9
+	/* SME exposed to guest */
+#define KVM_ARCH_FLAG_GUEST_HAS_SME			10
 	unsigned long flags;
 
 	/* VM-wide vCPU feature set */
@@ -941,7 +943,16 @@ struct kvm_vcpu_arch {
 #define vcpu_has_sve(vcpu)	kvm_has_sve((vcpu)->kvm)
 #endif
 
-#define vcpu_has_vec(vcpu) vcpu_has_sve(vcpu)
+#define kvm_has_sme(kvm)	(system_supports_sme() &&		\
+				 test_bit(KVM_ARCH_FLAG_GUEST_HAS_SME, &(kvm)->arch.flags))
+
+#ifdef __KVM_NVHE_HYPERVISOR__
+#define vcpu_has_sme(vcpu)	kvm_has_sme(kern_hyp_va((vcpu)->kvm))
+#else
+#define vcpu_has_sme(vcpu)	kvm_has_sme((vcpu)->kvm)
+#endif
+
+#define vcpu_has_vec(vcpu) (vcpu_has_sve(vcpu) || vcpu_has_sme(vcpu))
 
 #ifdef CONFIG_ARM64_PTR_AUTH
 #define vcpu_has_ptrauth(vcpu)						\
@@ -1551,4 +1562,20 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 #define kvm_has_s1poe(k)				\
 	(kvm_has_feat((k), ID_AA64MMFR3_EL1, S1POE, IMP))
 
+#define kvm_has_fa64(k)					\
+	(system_supports_fa64() &&			\
+	 kvm_has_feat((k), ID_AA64SMFR0_EL1, FA64, IMP))
+
+#define kvm_has_sme2(k)					\
+	(system_supports_sme2() &&			\
+	 kvm_has_feat((k), ID_AA64PFR1_EL1, SME, SME2))
+
+#ifdef __KVM_NVHE_HYPERVISOR__
+#define vcpu_has_sme2(vcpu)	kvm_has_sme2(kern_hyp_va((vcpu)->kvm))
+#define vcpu_has_fa64(vcpu)	kvm_has_fa64(kern_hyp_va((vcpu)->kvm))
+#else
+#define vcpu_has_sme2(vcpu)	kvm_has_sme2((vcpu)->kvm)
+#define vcpu_has_fa64(vcpu)	kvm_has_fa64((vcpu)->kvm)
+#endif
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 82430c1e1dd02b1ac24fd2ddcd05a91272997fdb..49b7844af8a19467e7842347c4b05ceb44c4caaf 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1748,7 +1748,7 @@ static unsigned int sve_visibility(const struct kvm_vcpu *vcpu,
 static unsigned int sme_visibility(const struct kvm_vcpu *vcpu,
 				   const struct sys_reg_desc *rd)
 {
-	if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, SME, IMP))
+	if (vcpu_has_sme(vcpu))
 		return 0;
 
 	return REG_HIDDEN;

-- 
2.39.5


