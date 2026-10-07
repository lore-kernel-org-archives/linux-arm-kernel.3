Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6525CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 07:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=viLyZ1kU71+3omb3+5WdAMyuyBNKIRNqolt0/PNWWKw=; b=FG2SIvndfs9G86DJdEkqytLTHK
	KUa8iB49J710nYsLMMyWYEdDLBYVXV1OfpYUl1Wiazi/zu7S9o1j5HSFaf339HXwBz3jyWWEpz1cQ
	2tdPPtxkKjjod4a69Z6eJMsu5u/zoVWA9Q7dB6efKW8N2Lr7ZANpla3AxLsCd6DC/tO9OC2HY3Vqy
	3qEIKFL6iPzAzUhF/AwzhVdL29wPnVGckbty4Cy8CAJ5agCXaCa8D/hOjUvwo8qcfoSUB3V9ccP0x
	AGtapHiOCEsYx7dlTsU2ksNecYTDLT3w0mNiUPn39Fp4hVgK9X13w8LUGhucuteGwaNrk73gh5TbF
	RqT596LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMCl-00000001raE-0TZT;
	Wed, 07 Oct 2026 07:36:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMCi-00000001rWW-2rQ1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 07:36:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C11E41BA8;
	Wed,  7 Oct 2026 00:36:40 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9543D3F763;
	Wed,  7 Oct 2026 00:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791358604; bh=vccP3PxOpy/dguFeUeUDJUfsgRBp6pEFcWHYQiK1mIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LZBjYezZYR8DyL4iFNk4gX7d2HGciOOlrKZcWy9iZ764NePYh45UeC6WeyTtPvLFJ
	 eQvQApGn0ot+3Tjf0Hrsjdt2WJH7bdRpV8sphq1jioet1xZ+RYpEblgEpVI4XMexVw
	 Q7iemDdyU0a7cfYvQBYDarW/7pha3xHX0r7s74Zs=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v23 14/14] KVM: arm64: Prevent unsupported vcpu features for VM types
Date: Wed,  7 Oct 2026 08:35:37 +0100
Message-ID: <20261007073537.2454351-15-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007073537.2454351-1-suzuki.poulose@arm.com>
References: <20261007073537.2454351-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_003644_835779_E1AA752A 
X-CRM114-Status: GOOD (  12.38  )
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

Prevent unsupported VCPU features for the protected VCPUs. Realms and pVMs
not support 32bit EL1 or NV yet. pKVM doesn't rely on the host vcpu
features for protected VMs and hand picks features while hyp_vcpu is
initialised. Block the features early in the vcpu init if we detect
incompatible features.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v22:
 - Start off with the base features supported per VM type
---
 arch/arm64/include/asm/kvm_host.h |  7 +++++++
 arch/arm64/kvm/arm.c              | 11 ++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 4d0e6bd2009ac..97089c81d6428 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -42,6 +42,13 @@
 #define KVM_VCPU_MAX_FEATURES 10
 #define KVM_VCPU_VALID_FEATURES	(BIT(KVM_VCPU_MAX_FEATURES) - 1)
 
+/* As dictated by kvm_pkvm_ext_allowed() */
+#define KVM_PROTECTED_VCPU_VALID_FEATURES		\
+	(BIT(KVM_ARM_VCPU_POWER_OFF)		|	\
+	 BIT(KVM_ARM_VCPU_PSCI_0_2)		|	\
+	 BIT(KVM_ARM_VCPU_PTRAUTH_ADDRESS)	|	\
+	 BIT(KVM_ARM_VCPU_PTRAUTH_GENERIC))
+
 #define KVM_REQ_SLEEP \
 	KVM_ARCH_REQ_FLAGS(0, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_IRQ_PENDING		KVM_ARCH_REQ(1)
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index f31d31fa27ad9..a53f2b2799cf8 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1668,9 +1668,14 @@ int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irq_level,
 	return -EINVAL;
 }
 
-static unsigned long system_supported_vcpu_features(void)
+static unsigned long system_supported_vcpu_features(struct kvm_vcpu *vcpu)
 {
-	unsigned long features = KVM_VCPU_VALID_FEATURES;
+	unsigned long features;
+
+	if (vcpu->kvm->arch.vm_flavor == VM_PROTECTED_PKVM)
+		features = KVM_PROTECTED_VCPU_VALID_FEATURES;
+	else
+		features = KVM_VCPU_VALID_FEATURES;
 
 	if (!cpus_have_final_cap(ARM64_HAS_32BIT_EL1))
 		clear_bit(KVM_ARM_VCPU_EL1_32BIT, &features);
@@ -1708,7 +1713,7 @@ static int kvm_vcpu_init_check_features(struct kvm_vcpu *vcpu,
 			return -ENOENT;
 	}
 
-	if (features & ~system_supported_vcpu_features())
+	if (features & ~system_supported_vcpu_features(vcpu))
 		return -EINVAL;
 
 	/*
-- 
2.43.0


