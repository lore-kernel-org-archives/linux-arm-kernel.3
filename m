Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0C8C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KdsrwciUsa8GH7Ezvv4SZMAWq+rgyKvl6Qg890kKy8=; b=hRBsjBAEkFZA1O+nb0xrUOV1OV
	I8UrIzS9FKXkjq6rqsZTX0IOlyry3VcALxdPDLROo+9vdY3mUbL3xqSf/O1EOvVXPzKDMpaPmNXIh
	N6w9kx8aEicHh0syvAt0y4pvSCwK9uLD9JtQFGld/BtVplBFsfPH1/gaMcwsOMuYPNhyfDlOUQW2F
	JhvqGAcf1ICsEgjBXQjFrFDODh/9cZSrjNqG4gaZgLqKqO0z98BZnHoPNRnrWj/OGNyHs5Gm7vQd4
	U/uYETolsb/GE2Zi/LDw09I9gf6eW3AJ1hZ+KetlbRkDCQlc2H7mK4BaQpRAKKm2dw1KkZWdxZDII
	MRD6zN9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29xm-000000005C0-3fl7;
	Thu, 03 Sep 2026 16:06:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29xi-0000000056o-1ziv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:06:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B3861596;
	Thu,  3 Sep 2026 09:06:46 -0700 (PDT)
Received: from e140010.cambridge.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 341FD3F673;
	Thu,  3 Sep 2026 09:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788451610; bh=+xEDb1hGKeI2CDY9plNiDwqL5XW3TEtAF0AeP5IGjgE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UdnnISgS+gVauOkZZq7in3rQtpwKnNkRDWMY2ArbvpO3FnXvU7cLEvXTAGwKcVOUA
	 YsYaemPTLso2h0hcbekRDJZq8sBqcFFqP9VJ03ZTeLAxRrtB4ytziPIh5bRs+P6Ihd
	 CX67ijnv19Gh+ntu0IZzTsm42dmHVHgg6rLocsGQ=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: [RFC PATCH v7 07/28] KVM: arm64: Add KVM_ARM_VCPU_SPE VCPU feature
Date: Thu,  3 Sep 2026 17:06:02 +0100
Message-ID: <20260903160623.315525-8-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903160623.315525-1-alexandru.elisei@arm.com>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_090650_588588_D166413C 
X-CRM114-Status: GOOD (  13.74  )
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

Add a new VCPU feature that enables SPE virtualization when set by
userspace. KVM_VCPU_MAX_FEATURE will be bumped and the feature will
become selectable by userspace once SPE support in KVM is implemented.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 Documentation/virt/kvm/api.rst    | 2 ++
 arch/arm64/include/asm/kvm_spe.h  | 5 +++++
 arch/arm64/include/uapi/asm/kvm.h | 1 +
 arch/arm64/kvm/arm.c              | 7 +++++++
 4 files changed, 15 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 1ed5c389c7a4..654736fac78c 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -3591,6 +3591,8 @@ Possible features:
 	  Depends on KVM_CAP_ARM_EL2_E2H0.
 	  KVM_ARM_VCPU_HAS_EL2 must also be set.
 
+        - KVM_ARM_VCPU_SPE: Enable SPE for the CPU. Depends on KVM_CAP_ARM_SPE.
+
 4.83 KVM_ARM_PREFERRED_TARGET
 -----------------------------
 
diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
index f05e6d3f5705..e452da82666d 100644
--- a/arch/arm64/include/asm/kvm_spe.h
+++ b/arch/arm64/include/asm/kvm_spe.h
@@ -8,11 +8,16 @@
 
 #ifdef CONFIG_KVM_ARM_SPE
 bool kvm_supports_spe(void);
+
+#define vcpu_has_spe(vcpu)					\
+	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_SPE))
 #else
 static __always_inline bool kvm_supports_spe(void)
 {
 	return false;
 }
+
+#define vcpu_has_spe(vcpu)	false
 #endif /* CONFIG_KVM_ARM_SPE */
 
 #endif /* __ARM64_KVM_SPE_H__ */
diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index 019e5e3d892e..f7f751c00e6f 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -107,6 +107,7 @@ struct kvm_regs {
 #define KVM_ARM_VCPU_HAS_EL2		7 /* Support nested virtualization */
 #define KVM_ARM_VCPU_HAS_EL2_E2H0	8 /* Limit NV support to E2H RES0 */
 #define KVM_ARM_VCPU_PMU_V3_STRICT	9 /* No default PMU creation */
+#define KVM_ARM_VCPU_SPE		10 /* Support SPE in guest */
 
 struct kvm_vcpu_init {
 	__u32 target;
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index eca1184ef9dd..b9cee4cf293d 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1604,6 +1604,9 @@ static unsigned long system_supported_vcpu_features(void)
 	if (!cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
 		clear_bit(KVM_ARM_VCPU_HAS_EL2, &features);
 
+	if (!kvm_supports_spe())
+		clear_bit(KVM_ARM_VCPU_SPE, &features);
+
 	return features;
 }
 
@@ -1648,6 +1651,10 @@ static int kvm_vcpu_init_check_features(struct kvm_vcpu *vcpu,
 	if (test_bit(KVM_ARM_VCPU_HAS_EL2, &features))
 		return -EINVAL;
 
+	/* SPE is incompatible with AArch32 */
+	if (test_bit(KVM_ARM_VCPU_SPE, &features))
+		return -EINVAL;
+
 	return 0;
 }
 
-- 
2.43.0


