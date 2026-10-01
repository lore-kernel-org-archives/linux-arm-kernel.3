Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04085CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 21:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHDEdIV37wywvKfWac2DLyIEKWT5G3rardRZ0F2Wu3E=; b=A129XS2uwswW8KlJM3A8PRDelI
	jzZNYcjn+y+thos88TKlx4uRrb0gRtr/ZhfyW2RryHnxalMrZdo/xAe3IadBNFJjp9QrQlxbPMOK5
	Akg8HHffXMH0FM9x/ybjLH6AfWCadLoTuBcBc9DAZLdlQCTSwW3JxRoEn4UxlxX0T4I4jzCVbYS9q
	uwguPnbSHCoVA+/Gglpb4qHPrcTZO+PKeZKzcpnOGzvLZOJ2rCH+FcpFaQBuNrE1uqG18RhkbifnW
	B+210MzTk3DxVUd9ZLVVA8VRfyrj+c1ZkHTCJXO2N+boVQnJFRLKrgF1e55vHm5u0pFB7W07I1oFZ
	DdDnrLwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO1T-0000000ADyf-39X8;
	Thu, 01 Oct 2026 21:08:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO1S-0000000ADwZ-1jvq
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 21:08:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mHDEdIV37wywvKfWac2DLyIEKWT5G3rardRZ0F2Wu3E=; b=J5ynG0x2qE9Tg11CxSFKciXhxs
	ofYnQCkTYSYLRFBz6M1dXTCyc+sV+MqDaEWVZYhlO+uU9FBNy5G0804hGUU4JPhRbcSw9Qnlhm6w5
	GIwvxNrWwjteSw0OcOh/Q0P9+iJr6n4HdIKxnI5lcxEINeMBaWpfDr6gZnq7Ww+WxmRLHnb3ygcXZ
	kyN2kPnsyd+RP4cXdH7mXvmLlQeHfmeHvLUMRSHXoKM4KHEOIKkvqaFPoio9zLY0G93xw/9pTP28M
	YIqMuDMlR+/EPXuep1p8QG6VDVm9d2hGNcsh1dCaBYTJfwD2DHt9RR9KflfaN9gSWBPemJOodR25C
	EOfRfNFg==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO1G-00000009yzk-1fjI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 21:08:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5CDB16F8;
	Thu,  1 Oct 2026 14:08:27 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D0C643F86F;
	Thu,  1 Oct 2026 14:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790888911; bh=2PXwIt14fX6jbq9VY5Nb5EXCg/nGSies41eMDwzPo5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FjT6oZniZY0Kc9sjUigR9bNtNa/gdRlA0HH37Aq9ICHOtmbA+T1gJF/u97trC9Iuz
	 BOCcvZ1yFlb428LAzRviF1Eb3WFkqYeXrp8esc+e44/cAefEtVeovbzL1o8C9al3IN
	 2zFjq4q6l2rucLoKdAPJUd8subLotGln3QyDGqWQ=
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
Subject: [PATCH v21 19/23] KVM: arm64: Prevent unsupported vcpu features for VM types
Date: Thu,  1 Oct 2026 22:06:59 +0100
Message-ID: <20261001210703.1597150-20-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001210703.1597150-1-suzuki.poulose@arm.com>
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_220848_656720_546B439C 
X-CRM114-Status: GOOD (  11.59  )
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

Prevent unsupported VCPU features for the protected VCPUs.
Realms and pVM do not support 32bit EL1 or NV yet.
pKVM doesn't rely on the host vcpu features, but still
block the vcpu init if we detect incompatible features.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/kvm/arm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 106b52e556e20..d43ae985ab1b4 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1727,11 +1727,12 @@ int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irq_level,
 	return -EINVAL;
 }
 
-static unsigned long system_supported_vcpu_features(void)
+static unsigned long system_supported_vcpu_features(struct kvm_vcpu *vcpu)
 {
 	unsigned long features = KVM_VCPU_VALID_FEATURES;
 
-	if (!cpus_have_final_cap(ARM64_HAS_32BIT_EL1))
+	if (vcpu_is_protected(vcpu) ||
+	    !cpus_have_final_cap(ARM64_HAS_32BIT_EL1))
 		clear_bit(KVM_ARM_VCPU_EL1_32BIT, &features);
 
 	if (!kvm_supports_guest_pmuv3()) {
@@ -1747,7 +1748,8 @@ static unsigned long system_supported_vcpu_features(void)
 		clear_bit(KVM_ARM_VCPU_PTRAUTH_GENERIC, &features);
 	}
 
-	if (!cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
+	if (vcpu_is_protected(vcpu) ||
+	    !cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
 		clear_bit(KVM_ARM_VCPU_HAS_EL2, &features);
 
 	return features;
@@ -1767,7 +1769,7 @@ static int kvm_vcpu_init_check_features(struct kvm_vcpu *vcpu,
 			return -ENOENT;
 	}
 
-	if (features & ~system_supported_vcpu_features())
+	if (features & ~system_supported_vcpu_features(vcpu))
 		return -EINVAL;
 
 	/*
-- 
2.43.0


