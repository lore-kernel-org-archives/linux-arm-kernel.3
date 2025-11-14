Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C842CE8D4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vP+lKe/D7Wb1stBu0sMYmLwwYUBLFjpdHRe6GepVeUw=; b=xzxkzRs6UeudolaiJFpOXFAaYM
	rU2fIbjF6F9JQVd+sstD5XoFR3Fswv3VxtFx6KAPAgewM8dqsDXEToTlolXVqf5F89jjJ2D19p+cP
	tKt2sOrh2gP9eleBT/zNblmzscg50PEROBiF+v5LxIvIy1kIt6j3AW8NZH3DfYEL9Hv8/BlMIA/ou
	PyXv3Tar7nUDYVFVlI+ReXunbO56PCzlcWHfFGAohVpigx1HYS2C8yiaSkH79IwXowMKT6rGwYKHr
	iIojQEOBuIGnkey0XTfoqBxCEdJYaBSS/lJ1oU8UkJokK9KmcZPT6EpplleNnIekwZ0LXyBl1FNji
	AjckPyjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwL9-0000000Cf9M-2PUG;
	Fri, 14 Nov 2025 16:07:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwL0-0000000Cf1J-1h5Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:07:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5514106F;
	Fri, 14 Nov 2025 08:07:41 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 332F13F5A1;
	Fri, 14 Nov 2025 08:07:47 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: james.clark@linaro.org,
	mark.rutland@arm.com,
	james.morse@arm.com
Subject: [RFC PATCH v6 06/35] KVM: arm64: Add KVM_ARM_VCPU_SPE VCPU feature
Date: Fri, 14 Nov 2025 16:06:47 +0000
Message-ID: <20251114160717.163230-7-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_080750_487194_ABBB1282 
X-CRM114-Status: GOOD (  11.08  )
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
userspace.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/include/asm/kvm_spe.h  | 4 ++++
 arch/arm64/include/uapi/asm/kvm.h | 1 +
 arch/arm64/kvm/arm.c              | 7 +++++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
index 6572384531e2..8e8a5c6f7971 100644
--- a/arch/arm64/include/asm/kvm_spe.h
+++ b/arch/arm64/include/asm/kvm_spe.h
@@ -13,8 +13,12 @@ static __always_inline bool kvm_supports_spe(void)
 {
 	return static_branch_likely(&kvm_spe_available);
 }
+
+#define vcpu_has_spe(vcpu)					\
+	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_SPE))
 #else
 #define kvm_supports_spe()	false
+#define vcpu_has_spe(vcpu)	false
 #endif /* CONFIG_KVM_ARM_SPE */
 
 #endif /* __ARM64_KVM_SPE_H__ */
diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index ed5f3892674c..5bdfe1f6d565 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -106,6 +106,7 @@ struct kvm_regs {
 #define KVM_ARM_VCPU_PTRAUTH_GENERIC	6 /* VCPU uses generic authentication */
 #define KVM_ARM_VCPU_HAS_EL2		7 /* Support nested virtualization */
 #define KVM_ARM_VCPU_HAS_EL2_E2H0	8 /* Limit NV support to E2H RES0 */
+#define KVM_ARM_VCPU_SPE		9 /* Support SPE in guest */
 
 struct kvm_vcpu_init {
 	__u32 target;
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index ee230cb34215..1e4449d96d62 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1459,6 +1459,9 @@ static unsigned long system_supported_vcpu_features(void)
 	if (!cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
 		clear_bit(KVM_ARM_VCPU_HAS_EL2, &features);
 
+	if (!kvm_supports_spe())
+		clear_bit(KVM_ARM_VCPU_SPE, &features);
+
 	return features;
 }
 
@@ -1498,6 +1501,10 @@ static int kvm_vcpu_init_check_features(struct kvm_vcpu *vcpu,
 	if (test_bit(KVM_ARM_VCPU_HAS_EL2, &features))
 		return -EINVAL;
 
+	/* SPE is incompatible with AArch32 */
+	if (test_bit(KVM_ARM_VCPU_SPE, &features))
+		return -EINVAL;
+
 	return 0;
 }
 
-- 
2.51.2


